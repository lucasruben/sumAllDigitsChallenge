using System;
using System.Collections.Generic;

class mainFunction
{
    static int mainValue = Int32.Parse("BMC_TEST_INPUT_MAGIC");
    
    public static Stack<int> numbersIn(int value)
    {
        if (value == 0) return new Stack<int>();
    
        var numbers = numbersIn(value / 10);
    
        numbers.Push(value % 10);
    
        return numbers;
    }
    
    public static int auxSum(int N)
    {
        int result = 0;
        
        int[] arrayN = numbersIn(N).ToArray();
        
        for(int i = 0; i<arrayN.Length;i++)
        {
            result+=arrayN[i];
            }
            
        return result;
    }
    
    public static int sumAllDigits(int N)
    {
        int sum = 0;
        if(N==1)
        {
            sum=1;
        }
        else if(N>1)
        {        
            for(int i = 1; i <= N; i++)
            {        
                if(i.ToString().Length > 1)
                {
                    sum+=auxSum(i);
                }
                else
                {
                    sum+=i;
                }       
            }
        }
        else 
        {
            Console.WriteLine("N should be greater than 1.");
            }      
        
        Console.WriteLine(sum);
        return sum;
    }  
    
    static void Main (string[] args)
    {
       //Console.WriteLine(sumAllDigits(mainValue));
       sumAllDigits(mainValue);
    }
}  
