Received: from ms-smtp-02.texas.rr.com ([24.93.36.230])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1954hm-0005Rk-QQ
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 15:13:07 +0100
Date: Mon, 14 Apr 2003 09:06:08 -0500
From: Earl Manning <emanning@austin.rr.com>
Message-Id: <20030414090608.470dca32.emanning@austin.rr.com>
In-Reply-To: <3E9AF275.4000905@idis.co.kr>
References: <002901c3021b$546a6fe0$525deecb@noshel>
	<20030413210133.64cc28b9.EManning@PRISMIQ.com>
	<000501c30244$91a09dc0$525deecb@noshel>
	<200304140954.27049.tglx@linutronix.de>
	<3E9AF275.4000905@idis.co.kr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
cc: tglx@linutronix.de
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

Hi Tom and Edward,

I guess I misunderstood the question.  I didn't realize that the image was already up and running.  On my board I got that message because I had laid down the original image on the NAND flash without putting ECC into the OOB.

Althought, it does sound like new writes do use the SOFT ECC flag and that is why there are no complaints.  How did you get the ECC stuff into the OOB to start with?

Earl


On Tue, 15 Apr 2003 02:40:05 +0900
"Edward J. Lee" <noshel@idis.co.kr> wrote:

> Thomas Gleixner wrote:
> 
> >On Monday 14 April 2003 07:13, Edward Lee (???) wrote:
> >  
> >
> >>Hi Earl, thanks for the help.
> >>
> >>I didn't use nandwrite, I wrote on the chip using plain stuff like 'cp' or
> >>'tar', etc. (having a file system on my device, I couldn't find a reason
> >>to write files using other programs)
> >>    
> >>
> >nandwrite is just used to copy a filesystem image to a unformatted chip.
> >If you have mounted the fs already, then nandwrite would be the wrong tool.
> >
> >These messages have a different reason. I assume that you followed the advice 
> >on yaffs list and you have enabled YAFFS_USE_NANDECC and disabled 
> >YAFFS_USE_OLD_MTD.
> >
> >Then I can only guess, that you did not select a ecc mode in your board driver 
> >code. 
> >
> ><SNIP>
> >	/* 20 us command delay time */
> >	this->chip_delay = 20;		
> >	this->eccmode = NAND_ECC_SOFT;
> ><SNIP>
> >
> >NAND_ECC_SOFT is the right choice, if you don't have a hardware ecc generator.
> >If you have one, you must supply the neccecary functions to use it.
> >
> >  
> >
> this->eccmode is indeed set to NAND_ECC_SOFT.
> I guess my case is kind of 'extra-tricky'. I just found out another 
> weird thing,
> that the warning messages complaining '...without ECC...' do NOT appear when
> I'm 'writing' on the chip. Strange, eh. :'(
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
