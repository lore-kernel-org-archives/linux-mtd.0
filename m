Received: from [210.17.210.210] (helo=mail.avantwave.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CNT34-00035g-0x
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 05:27:55 -0400
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id i9T9OM4r032618
	for <linux-mtd@lists.infradead.org>; Fri, 29 Oct 2004 17:24:23 +0800
Message-ID: <41820F20.5060900@avantwave.com>
Date: Fri, 29 Oct 2004 17:36:32 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1CFEB358338412458B21FAA0D78FE86D4F0C69@rennsmail02.eu.thmulti.com>
	<4181B55A.7020909@avantwave.com>
In-Reply-To: <4181B55A.7020909@avantwave.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: USB-flash driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fillod Stephane wrote:

>
>>>   My situation is , to make my ARM-based board to be a USB mass 
>>> storage disk from outside view. I am using Motorola M9328MXL 
>>> development board with USB client.
>>>   
>>
>>
>> So your board is going to be an USB peripheral, right?
>>
>>  
>>
>>>   My question is how can i utilize mtd api to make the driver? Or 
>>> anyone done that before? Or anyone can give me some advises?
>>>   
>>
>>
>> Have a look at the fine Linux-USB Gadget project 
>> http://www.linux-usb.org/gadget
>> Your board should use the "File-backed Storage" driver, with the 
>> actual file
>> (mtdblock or mtdchar?) being accessed through the VFS.
>>
>> Once you find out the details, some feedback on the list will be much
>> appreciated, especially from the next person asking this soon-to-be a 
>> FAQ :-)
>>
>>
>> Best Regards,
>>
>>  
>>
Dear Fillod

   Actually, i do have a USB ram disk driver from the BSP of motorola, i 
also located the read write code to the driver, but it is RAM ,not flash.
     I have a guess and please fix me.
   Can I use the functions in <include/linux/mtd/CFI.h > to 
read/write/erase my chip (AM29PLD127 AMD CFI flash) DIRECTLY?

   I think this can speed up my process if i need to rewrite the gadget 
driver on M9328 chip

   Thanks for helping
best regard
Mike,Lee
