Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19OkLZ-00071h-WD
	for <linux-mtd@lists.infradead.org>; Sat, 07 Jun 2003 21:31:30 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Kevin Liao" <kevinliao@iei.com.tw>
Date: Sun, 8 Jun 2003 08:34:16 +1200
References: <3EDB2F4E.6050502@intracom.gr>
	<20030605210731.4E663157C7@desire.actrix.co.nz>
	<015b01c32c11$a5c2a950$511711ac@kevinliao>
In-Reply-To: <015b01c32c11$a5c2a950$511711ac@kevinliao>
MIME-Version: 1.0
Message-Id: <20030607203201.B098940BD@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND write verify failed problem -->cramfs
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 06 June 2003 21:54, you wrote:
> Sorry I am new to this list and I have two questions as below:
>
> 1. To loop mount a CRAMFS (root file system) image on one JFFS2 partition,
> we should mount that partition first, shouldn't we? But how can we mount
> that JFFS2 partition without mounting the root file system?

Doing this with a root file system makes it a bit more challenging... I don't 
know if that can be done.
>
> 2. Currently I use NAND flash with ramdisk image on /dev/mtdblock1 as the
> root file system. Usually I write the ramdisk image using the command
> "nandwrite /dev/mtdblock1 ramdisk.gz". So far everything works fine. But I
> am wondering whether the kernel can still load the ramdisk image if there
> are some bad blocks on /dev/mtdblock1?

You could perhaps use a cut-down version of YAFFS (like is used in the YAFFS 
bootloader) to store a CRAMFS image. This is relatively simple and quite a 
few people do this for booting.

Do you have enough RAM to load the image into RAM at boot? That would make it 
even easier.

-- CHarles

>
> Thanks a lot for the help.
>
> Regards,
> Kevin
>
> ----- Original Message -----
> From: "Charles Manning" <manningc2@actrix.gen.nz>
> To: "Pantelis Antoniou" <panto@intracom.gr>; <tglx@linutronix.de>
> Cc: <linux-mtd@lists.infradead.org>
> Sent: Friday, June 06, 2003 5:10 AM
> Subject: Re: NAND write verify failed problem -->cramfs
>
> > BTW, is there something anologous to CRAMFS for NAND flash?
> > I have a need for a compressed read-only filesystem on NAND
> > but CRAMFS has no concept of bad blocks.
>
> You could use loop mounting. ie. store the CRAMFS  image using a normal
> NAND file system (YAFFS or JFFS2) and loop mount it with cramfs.
>
> -- CHarles
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
