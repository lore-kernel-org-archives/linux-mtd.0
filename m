Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196Gp0-0002ff-CN
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 22:21:30 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDI00A6JBB6SR@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 17 Apr 2003 23:21:07 +0200 (MEST)
Date: Fri, 18 Apr 2003 00:20:58 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030417204847.5409515144@desire.actrix.co.nz>
To: manningc2@actrix.gen.nz, Paul <paul@maypaul.com>,
 linux-mtd@lists.infradead.org, yaffs list <yaffs@toby-churchill.org>
Message-id: <200304180020.58774.tglx@linutronix.de>
MIME-version: 1.0
References: <001201c30505$c4b83dd0$6c00a8c0@home>
 <20030417204847.5409515144@desire.actrix.co.nz>
Content-type: text/plain; charset=iso-8859-1
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

On Thursday 17 April 2003 22:49, Charles Manning wrote:
>
> One way to achieve what you want is to hack mkyaffs. mkyaffs erases the
> blocks in the partition, but first checks for bad block markers. If you
> comment out the check then it will erase the block regardless. This will
> set all the bits in the block to 1 (including the bad block marker).

Only if you hack drivers/mtd/nand/nand.c too, as there is a senity check, 
which refuses to erase bad blocks :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
