Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUjs8-0003aQ-3k
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 05:50:42 -0500
Message-ID: <419C7E72.8040005@sysgo.de>
Date: Thu, 18 Nov 2004 11:50:26 +0100
From: Alexander Hoffmann <ahoffmann@sysgo.de>
MIME-Version: 1.0
To: Erwin Authried <eauth@softsys.co.at>
References: <418F5E68.3010200@sysgo.de>	
	<20041108120624.GE13105@home.fluff.org>
	<418F6CA7.6000808@sysgo.de>	 <1099943453.10812.16.camel@tubarao>
	<4194D39A.9000700@sysgo.de>	
	<1100274921.3549.13.camel@justakiss> <4194E233.70902@sysgo.de>
	<1100277677.3549.22.camel@justakiss>
In-Reply-To: <1100277677.3549.22.camel@justakiss>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, tharbaugh@lnxi.com
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>Am Fre, den 12.11.2004 schrieb Alexander Hoffmann um 17:17:
>  
>
>>Erwin Authried wrote:
>>
>>    
>>
>>>Am Fre, den 12.11.2004 schrieb Alexander Hoffmann um 16:15:
>>> 
>>>
>>>      
>>>
>>>>Hi Thayne,
>>>>
>>>>sorry for the delayed response.
>>>>
>>>>Thayne Harbaugh wrote:
>>>>
>>>>   
>>>>
>>>>        
>>>>
>>>>>On Mon, 2004-11-08 at 13:55 +0100, Alexander Hoffmann wrote:
>>>>>
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>>>Ben Dooks wrote:
>>>>>>
>>>>>>  
>>>>>>
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>>>On Mon, Nov 08, 2004 at 12:54:16PM +0100, Alexander Hoffmann wrote:
>>>>>>>    
>>>>>>>
>>>>>>>         
>>>>>>>
>>>>>>>              
>>>>>>>
>>>>>>>>Hi everyone,
>>>>>>>>
>>>>>>>>can anybody please explain me the exact difference between 
>>>>>>>>MTD_UADDR_DONT_CARE and MTD_UADDR_UNNECESSARY .
>>>>>>>>Because if I use MTD_UADDR_UNNECESSARY an not existing field in the 
>>>>>>>>unlock_addrs array is beeing referenced
>>>>>>>>(/drivers/mtd/chips/jedec_probe.c, function cfi_jedec_setup, line 1740):
>>>>>>>>
>>>>>>>>/* Mask out address bits which are smaller than the device type */
>>>>>>>>mask = ~(p_cfi->device_type-1);
>>>>>>>>p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & mask;
>>>>>>>>p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & mask;
>>>>>>>>      
>>>>>>>>
>>>>>>>>           
>>>>>>>>
>>>>>>>>                
>>>>>>>>
>>>>>>>hmm, thought this masking had been eliminated in later copies of
>>>>>>>the mtd code?
>>>>>>>    
>>>>>>>
>>>>>>>         
>>>>>>>
>>>>>>>              
>>>>>>>
>>>>>Yes, the masking has been eliminated, but someone left the comment in
>>>>>(doh!).
>>>>>
>>>>>
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>>>Ok, you are right. But this doesn't change the fact that
>>>>>>
>>>>>>unlock_addrs[uaddr].addr1
>>>>>>
>>>>>>refers to an nonexisting field in the unlock_addrs array.
>>>>>>  
>>>>>>
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>I don't see how the code you that you described is being reached.  It
>>>>>looks like the start of jedec_probe_chip() checks for UNNECESSARY and
>>>>>returns 0 (although I would expect 1) and so cfi_jedec_setup() should
>>>>>never be called with UNNECESSARY (even for subsequent chips).
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>I am working with the cdb89712 development board from cirrus. This board 
>>>>has an "Intel 28F320B3B" chip
>>>>(device_id  =  0x8897). Apparently, jedec_probe() finds 
>>>>MTD_UADDR_0x0555_0x02AA.
>>>>for this chip, while the jedec_table[] specifies it as 
>>>>MTD_UADDR_UNNECESSARY.
>>>>Since the probed unlock type is overidden by the static one, the code 
>>>>_does_ reach
>>>>jedec_setup().
>>>>
>>>>What I haven't really understood is this: if the code refuses chips of  
>>>>type UNNECESSARY
>>>>(the return code 0 from jedec_probe() is an error), then why are so many 
>>>>chips declared
>>>>as UNECESSARY in jedec_table[]?
>>>>   
>>>>
>>>>        
>>>>
>>>MTD_UADDR_UNNECESSARY is used to specify that the chip does not need any
>>>unlock sequence at all. The "return 0" statement near the  top of
>>>jedec_probe_chip is executed if all possible unlock sequences have been
>>>tried without finding a match in jedec table, thus it indicates an
>>>error. It's correct that your chip finds a match with
>>>MTD_UADDR_0x0555_0x02aa, because that's the first try and the chip
>>>doesn't care at all about the unlock sequence. 
>>> 
>>>
>>>      
>>>
>>Does this mean, that the "return 0" statement at the beginning of 
>>jedec_probe_chip() is only reached
>>when my chip isn't lsited in jedec_table[] ?
>>If it is listed , there will always be a match and therefore the 
>>functions cfi_jedec_setup() and finfo_uaddr()
>>will be called !?
>>
>>Alex.
>>
>>    
>>
>
>Yes, I think it should work that way. For flash with Intel cmdset,
>MTD_UADDR_UNNECESSARY is always used, because they do not use unlocking
>at all. In contrast, all AMD cmdset flashchips use unlocking.
>
>Regards,
>Erwin
>
Then I guess that there is really the bug I described in my first mail.
I would recommend a check for MTD_UADDR_UNNECESSARY in the 
cfi_jedec_setup(), before
the unlock_addrs[] array is  referenced:

if ( uaddr != MTD_UADDR_UNNECESSARY ) {
                p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & mask;
                p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & mask;
}
return 1;




Furthermore I dont understand the following code in the finfo_uaddr() 
function:

if (uaddr != MTD_UADDR_NOT_SUPPORTED ) {
                /* ASSERT("The unlock addresses for non-8-bit mode
                   are bollocks. We don't really need an array."); */
                uaddr = finfo->uaddr[0];
        }


In my opinion this can't work, because there are a lot of  entries in 
the jedec_table[] where uaddr[0]
is not defined ?

Best regards,
Alex.
