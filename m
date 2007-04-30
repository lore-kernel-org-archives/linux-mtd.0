Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiQRB-0000aQ-VD
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 03:36:50 -0400
Message-ID: <46359C8A.4040306@ru.mvista.com>
Date: Mon, 30 Apr 2007 11:36:42 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
References: <463332F9.9040105@ru.mvista.com>	
	<1177763736.7646.149.camel@localhost.localdomain>	
	<46334F28.70506@ru.mvista.com>
	<1177794151.7646.312.camel@localhost.localdomain>
In-Reply-To: <1177794151.7646.312.camel@localhost.localdomain>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

I have tried to fit driver's functionality into common platform 
structures. Unfortunately the device hasn't NAND controller and some 
signals (ALE/CLE(pins on data bus) and CS(gpio)) are driven in custom 
way. Current platform structures have not enough fields to carry 
platform dependent data for this driver without hack (I guess use fields 
not used in driver but designed for other things is not good idea). 
Additionally due to device haven't NAND controller future version of 
board may change the way which is used to drive CS signal, So I move 
this functionality completely to hardware dependent part of driver (sent 
to LAKML)

Thank you,
Ruslan


Thomas Gleixner wrote:
> Ruslan,
>
> On Sat, 2007-04-28 at 17:42 +0400, Ruslan V. Sushko wrote:
>   
>>> How excatly is this functionally different from the generic write_buf
>>> function in nand_base.c ?
>>>
>>>       
>> This function should be removed. It was different for originally. ALE 
>> and CLE signal assertion was herre, but I decide this functionality is 
>> not necessary for data writing, so I've remove that, but forget to check 
>> remainder with generic code.
>>     
>
> I did a review and pointed this out. No need for lengthy explanaitions.
> Just remove it.
>
>   
>>> Aside of that I agree with Lennert, that we really need to get around
>>> and make this real platform code.
>>>   
>>>       
>> Sorry don't understand
>> Do you propose to move all these (especially hw_ctrl function) 
>> functionality to platform/arch code?
>>     
>
> That's what Lennert said. And I agree. Many of the drivers just differ
> in the hardware control function and the pyhsical address where the
> device is located.
>
> We have already platform support for NAND:
>
> See include/linux/mtd/nand.h:
>
> struct platform_nand_chip / struct platform_nand_ctrl
>
> As far as I can tell, there is everything covered what you need for a
> generic platform driver.
>
> Again. Lennert is right and another post of your driver does not change
> anything unless you listen to his and my advise.
>
> 	tglx
>
>
>   
