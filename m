Received: from kasumi.idis.co.kr ([203.238.93.2] ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194zVK-0003yS-Vf
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 09:39:55 +0100
Message-ID: <3E9AF275.4000905@idis.co.kr>
Date: Tue, 15 Apr 2003 02:40:05 +0900
From: "Edward J. Lee" <noshel@idis.co.kr>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <002901c3021b$546a6fe0$525deecb@noshel>
	<20030413210133.64cc28b9.EManning@PRISMIQ.com>
	<000501c30244$91a09dc0$525deecb@noshel>
	<200304140954.27049.tglx@linutronix.de>
In-Reply-To: <200304140954.27049.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: A question on ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Monday 14 April 2003 07:13, Edward Lee (???) wrote:
>  
>
>>Hi Earl, thanks for the help.
>>
>>I didn't use nandwrite, I wrote on the chip using plain stuff like 'cp' or
>>'tar', etc. (having a file system on my device, I couldn't find a reason
>>to write files using other programs)
>>    
>>
>nandwrite is just used to copy a filesystem image to a unformatted chip.
>If you have mounted the fs already, then nandwrite would be the wrong tool.
>
>These messages have a different reason. I assume that you followed the advice 
>on yaffs list and you have enabled YAFFS_USE_NANDECC and disabled 
>YAFFS_USE_OLD_MTD.
>
>Then I can only guess, that you did not select a ecc mode in your board driver 
>code. 
>
><SNIP>
>	/* 20 us command delay time */
>	this->chip_delay = 20;		
>	this->eccmode = NAND_ECC_SOFT;
><SNIP>
>
>NAND_ECC_SOFT is the right choice, if you don't have a hardware ecc generator.
>If you have one, you must supply the neccecary functions to use it.
>
>  
>
this->eccmode is indeed set to NAND_ECC_SOFT.
I guess my case is kind of 'extra-tricky'. I just found out another 
weird thing,
that the warning messages complaining '...without ECC...' do NOT appear when
I'm 'writing' on the chip. Strange, eh. :'(
