Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 191Nok-0005LG-KU
	for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2003 10:49:02 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HCT003MKCKW2R@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 04 Apr 2003 11:48:33 +0200 (MEST)
Date: Fri, 04 Apr 2003 12:48:57 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030404062136.7806.qmail@vip.sina.com>
To: jimzeus@vip.sina.com, linux-mtd@lists.infradead.org
Message-id: <200304041248.57751.tglx@linutronix.de>
MIME-version: 1.0
References: <20030404062136.7806.qmail@vip.sina.com>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Subject: Re: [SPAM] FAT on NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 04 April 2003 08:21, jimzeus@vip.sina.com wrote:
> What I am doing now is to build a filesystem which can be
> recognized on _raw_ NAND flash. So, I think FAT will be the only
> choice(though I know it's very unstable). And I have following question
> now:
For what ? Why don't you use JFFS2 or YAFFS, which handle NAND out of the box 
?

> 1.How unstable would it be? Does it support:
>      a.journaling (crash/power-off safe ,I mean)
>      b.bad block management
>      c.wear levelling
>      d.error correction
>      e.something else I dont know to make the FS reliable
JFFS2 and YAFFS have all this, read the source and build a new one, if you 
have enough time.

> 2.I have checked the NAND flash docoment (especially
> the "Filesystems supporting NAND"chapter) and I found out that
> it seems no way to build a FAT on a bare NAND flash but only on
> the SmartMediaCards, am I right? Or the SM card and the bare NAND
> are just the same thing when a FAT on it.
SMCard and bare NAND is just the same, only packaging is different

> 3.Maybe I misunderstood,but David Woodhouse had told me that I should apply
> layers like FAT->NFTL->NAND if I wanna build a FAT on a NAND flash.But I
> learned that the NFTL only support Doc from the NAND flash document, isnt
> it? And what should I do to support the
> FAT ?
Hack NTFL :)

> 4.Everybody tells me that the Fat on a NAND is not reliable,but I
> think USB mass storage are based on NAND and got a FAT (or some
> filesystem which windows can recognize) on it, so ,how comes it
> happen?
Yes, this is Smart-Media-FAT, which is not exactly the same as DOS-FAT. 
SmartMedia-FAT is used on SmartMedia cards for MP3-Players, Digicams ... 
There exist various adapters (USB, serial, LPT) to access it via a PC. 
SmartMedia-FAT is designed for NAND-FLASH and handles bad block management 
and error correction. 
If you want compability to this, you have to write a fs-driver, which is 
compatible to the SMART-Media-FAT definition, which is available from Toshiba 
under a non disclosure aggreement. 


-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
