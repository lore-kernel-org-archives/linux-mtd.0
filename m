Received: from msr80.hinet.net ([168.95.4.180] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YVEQ-0001TE-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 17:52:10 +0000
Received: from ms11.hinet.net (61-228-122-141.HINET-IP.hinet.net [61.228.122.141])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id CAA12631
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 02:23:01 +0800 (CST)
Message-ID: <3E245586.4010602@ms11.hinet.net>
Date: Wed, 15 Jan 2003 02:23:02 +0800
From: Steve Tsai <startec@ms11.hinet.net>
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Display Unchecked space...
References: <IGEFJKJNHJDCBKALBJLLEEFDFJAA.joakim.tjernlund@lumentis.se>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLEEFDFJAA.joakim.tjernlund@lumentis.se>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Joakim Tjernlund wrote:

nodelist.c is 1.67 and I did not use cfi_cmdset0001.c. I use NAND type 
flash.

Steve Tsai

>>Hi Steve 
>>
>>I got the same yesterday. I am using the preempt patch and the cfi_cmdset0001.c
>>driver. I guessing it's a locking problem, but now I not that sure anymore, I
>>don't think uClinux can do preempt? What's your CVS version of jffs2/write.c
>>    
>>
>
>I meant jffs2/nodelist.c, not jffs2/write.c.
> 
>  
>
>>and cfi_cmdset0001.c(if you use that driver)?
>>
>>Can you repeat it?
>>
>> Jocke 
>>    
>>
>>>Hi,
>>>
>>>I download the latest cvs code and build it in uClinux. After running
>>>two days, I got "kernel BUG at gc.c:136! Checked all inodes but still
>>>0x6a0 bytes of unchecked space?" and it will continue display the
>>>message and halt the system. I set CONFIG_JFFS2_FS_DEBUG=1, but I did
>>>not get any useful messages. Does anyone can tell me why the kernel BUG
>>>will display? Could I solve the system halt, even "unchecked space"
>>>occurs? Thanks.
>>>
>>>Steve Tsai
>>>
>>>
>>>______________________________________________________
>>>Linux MTD discussion mailing list
>>>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
>>>      
>>>
>>______________________________________________________
>>Linux MTD discussion mailing list
>>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>    
>>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
