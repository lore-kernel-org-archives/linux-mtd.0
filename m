Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196DuY-0001VM-Hn
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 19:15:02 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDI000182OETR@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 17 Apr 2003 20:14:39 +0200 (MEST)
Date: Thu, 17 Apr 2003 21:14:31 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <001201c30505$c4b83dd0$6c00a8c0@home>
To: Paul <paul@maypaul.com>, linux-mtd@lists.infradead.org
Message-id: <200304172114.31896.tglx@linutronix.de>
MIME-version: 1.0
References: <001201c30505$c4b83dd0$6c00a8c0@home>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Subject: Re: Restore the bad block flag in OOB of  NAND flash
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 April 2003 19:21, Paul wrote:
>  Dear All,
>
>     How can I restore the 0xFF in the OOB[5]?   i understood the oob[5] is
>  the bad block indicator. The YAFFS set accidentally the byte to 0x00 . I
>  want to use JFFS2 but the eraseall command said they are invalid block. I
> am
>  sure that the block is health . So, I want to force set the oob[5] to
> oxFF, pls. how can i do? Thank you.

There is no "legal" way to do so. The only way is to erase it. The sanity 
check is in erase function drivers/mtd/nand/nand.c. 

But think about, if it's worth do so for 16KiB flash memory :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
