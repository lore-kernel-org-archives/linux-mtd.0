Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194xrf-0003c9-Hs
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 07:54:51 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDB003SDN6P6C@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 14 Apr 2003 08:54:26 +0200 (MEST)
Date: Mon, 14 Apr 2003 09:54:27 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <000501c30244$91a09dc0$525deecb@noshel>
To: "Edward Lee (???)" <noshel@idis.co.kr>, Earl Manning
	<EManning@PRISMIQ.com>
Message-id: <200304140954.27049.tglx@linutronix.de>
MIME-version: 1.0
References: <002901c3021b$546a6fe0$525deecb@noshel>
 <20030413210133.64cc28b9.EManning@PRISMIQ.com>
 <000501c30244$91a09dc0$525deecb@noshel>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: A question on ECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 14 April 2003 07:13, Edward Lee (???) wrote:
> Hi Earl, thanks for the help.
> 
> I didn't use nandwrite, I wrote on the chip using plain stuff like 'cp' or
> 'tar', etc. (having a file system on my device, I couldn't find a reason
> to write files using other programs)
nandwrite is just used to copy a filesystem image to a unformatted chip.
If you have mounted the fs already, then nandwrite would be the wrong tool.

These messages have a different reason. I assume that you followed the advice 
on yaffs list and you have enabled YAFFS_USE_NANDECC and disabled 
YAFFS_USE_OLD_MTD.

Then I can only guess, that you did not select a ecc mode in your board driver 
code. 

<SNIP>
	/* 20 us command delay time */
	this->chip_delay = 20;		
	this->eccmode = NAND_ECC_SOFT;
<SNIP>

NAND_ECC_SOFT is the right choice, if you don't have a hardware ecc generator.
If you have one, you must supply the neccecary functions to use it.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
