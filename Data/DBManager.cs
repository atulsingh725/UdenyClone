using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Data
{
    public class DBManager
    {
        private SqlConnection sqlConnection=new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStr"].ConnectionString );
        /// <summary>
        /// Perform All Crud Operation return DataTable
        /// </summary>
        /// <param name="spName">Used for Stored Procedure Name</param> 
        /// <param name="sqlParameters">Used for Stored Procedure Parameters</param>
        /// <returns>DataTable</returns>
        public DataTable ExeCRUD(string spName, SqlParameter[] sqlParameters)
        {
            try { 
            SqlCommand sqlCommand= new SqlCommand(spName,sqlConnection);
            sqlCommand.CommandType= CommandType.StoredProcedure;
            sqlCommand.Parameters.AddRange(sqlParameters);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable= new DataTable();
            sqlDataAdapter.Fill(dataTable);
            return dataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// Set Data and return DataSet
        /// </summary>
        /// <param name="spName">Used for Stored Procedure Name</param>
        /// <param name="sqlParameters">Used for Stored Procedure Parameters</param>
        /// <returns>DataSet</returns>
        public DataSet ExeDataSet(string spName, SqlParameter[] sqlParameters)
        {
            try
            {
                SqlCommand sqlCommand = new SqlCommand(spName, sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddRange(sqlParameters);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);
                return dataSet;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
