Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19hspg-0002fA-Si
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2003 16:25:40 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HIU009HQG5VS9@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 30 Jul 2003 17:25:07 +0200 (MEST)
Date: Wed, 30 Jul 2003 18:21:39 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3F27DAA6.4050806@elsoft.ch>
To: "David =?iso-8859-1?q?M=FCller?= (ELSOFT AG)" <d.mueller@elsoft.ch>,
 linux-mtd@lists.infradead.org
Message-id: <200307301821.39997.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <3F27DAA6.4050806@elsoft.ch>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Subject: Re: Problem mounting JFFS2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 July 2003 16:48, David M=FCller (ELSOFT AG) wrote:
> Hello
>
> I'm trying to get a JFFS2 filesystem on a 64MB NAND flash device working
> on an ARM based system (running Linux-2.4.21 and the latest MTD CVS code).
>
> I prepare the JFFS2 image on my host system like this
>
> temp> mkfs.jffs2 --version
> mkfs.jffs2: revision 1.38
>
> temp> mkfs.jffs2 -d targetfs -o targetfs.img -e 16 -l -q -v -n
>
>
> and burn it into the NAND device on the target. If i later try to mount
> it under Linux with "mount -t jffs2 /dev/mtdblock/1 /mnt", i get the
> following output:

How do you burn it into the NAND device ? Are you updating the OOB area ?
read http://linux-mtd.infradead.org/tech/nand.html
use nandwrite from the util directory, if you can do it from a running syst=
em

> jffs2: Erase block size too small (16KiB). Using virtual blocks size
> (32KiB) instead

That's due to memory consumption. If we have 16KiB eraseblock size we need =
too=20
much memory to keep track of all eraseblocks. So we use virtual 32KiB block=
s=20
instead.

> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00000000
> OOB at 00000000 was 33 f3 c0 ff f0 ff ff ff ff ff ff ff ff ff ff ff
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 000080
> OOB at 00008000 was 03 f0 00 ff f0 ff ff ff ff ff ff ff ff ff ff ff
> [deleted rest of cleanmarker check]

See above

=2D-=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
