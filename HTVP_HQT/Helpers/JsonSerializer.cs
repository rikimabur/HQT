using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace HTVP_HQT.Helpers
{
    public static class JsonSerializer
    {
        private static byte[] lBracketBytes = Encoding.UTF8.GetBytes(new char[] { '[' });
        private static byte[] rBracketBytes = Encoding.UTF8.GetBytes(new char[] { ']' });
        private static byte[] commaBytes = Encoding.UTF8.GetBytes(new char[] { ',' });
        private static byte[] rparenBytes = Encoding.UTF8.GetBytes(new char[] { ')' });

        //public static void Serialize<T>(T obj, Stream stream, string jsonpCallback = null)
        //{
        //    if (jsonpCallback == null)
        //        WriteObject(obj, stream);
        //    else
        //    {
        //        WriteJsonPCallbackStart(stream, jsonpCallback);
        //        WriteObject(obj, stream);
        //        WriteJsonPCallbackEnd(stream);
        //    }
        //}

        //public static void Serialize<T>(IEnumerable<T> sequence, Stream stream, string jsonpCallback = null)
        //{
        //    if (jsonpCallback == null)
        //        WriteSequence(sequence, stream);
        //    else
        //    {
        //        WriteJsonPCallbackStart(stream, jsonpCallback);
        //        WriteSequence(sequence, stream);
        //        WriteJsonPCallbackEnd(stream);
        //    }
        //}

        private static void WriteJsonPCallbackStart(Stream stream, string jsonpCallback)
        {
            byte[] callbackStartBytes = UTF8Encoding.UTF8.GetBytes(jsonpCallback + "(");
            stream.Write(callbackStartBytes, 0, callbackStartBytes.Length);
        }

        private static void WriteJsonPCallbackEnd(Stream stream)
        {
            stream.Write(rparenBytes, 0, rparenBytes.Length);
        }

        //private static void WriteObject<T>(T obj, Stream stream)
        //{
        //    var serializer = new DataContractJsonSerializer(typeof(T));
        //    serializer.WriteObject(stream, obj);
        //}

        //private static void WriteSequence<T>(IEnumerable<T> sequence, Stream stream)
        //{
        //    var serializer = new DataContractJsonSerializer(typeof(T));
        //    stream.Write(lBracketBytes, 0, lBracketBytes.Length);
        //    int i = 0;
        //    foreach (var item in sequence)
        //    {
        //        if (i != 0)
        //            stream.Write(commaBytes, 0, commaBytes.Length);
        //        serializer.WriteObject(stream, item);
        //        i++;
        //    }
        //    stream.Write(rBracketBytes, 0, rBracketBytes.Length);
        //}
    }
}