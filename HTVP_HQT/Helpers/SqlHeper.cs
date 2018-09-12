using System.Data;
using System.Data.SqlClient;

namespace HTVP_HQT.Helpers
{
    public static class SqlHeper
    {
        private static string connectionString = SettingHelper.Get<string>("connectSql");
        public static DataTable ExecuteCommand(string commandName, CommandType cmdType, SqlParameter[] parameters)
        {
            if (parameters == null)
            {
                return ExecuteSelectCommand(commandName, cmdType);
            }
            DataTable table = null;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 3000;
                    cmd.CommandText = commandName;
                    cmd.CommandType = cmdType;
                    cmd.Parameters.AddRange(parameters);
                    try
                    {
                        if (conn.State == System.Data.ConnectionState.Closed)
                            conn.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            table = new DataTable();
                            adapter.Fill(table);
                        }
                        if (conn.State == System.Data.ConnectionState.Open)
                            conn.Close();
                    }
                    catch
                    {
                        throw;
                    }
                }
            }
            return table;
        }
        private static DataTable ExecuteSelectCommand(string CommandName, CommandType cmdType)
        {
            DataTable table = null;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = CommandName;
                    cmd.CommandType = cmdType;
                    try
                    {
                        if (conn.State == System.Data.ConnectionState.Closed)
                            conn.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            table = new DataTable();
                            adapter.Fill(table);
                        }
                        if (conn.State == System.Data.ConnectionState.Open)
                            conn.Close();
                        return table;
                    }
                    catch
                    {
                        throw;
                    }
                }
            }
        }

    }
}