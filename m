Received: from [203.194.144.59] (helo=ns3.dns-hk.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rZpY-00035q-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 09:05:05 +0100
Message-ID: <001d01c25eea$0a65b0f0$b200a8c0@paulhome>
Reply-To: <paul@maypaul.com>
From: <paul@maypaul.com>
To: <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <005601c25ec7$0b5f8f30$9000010a@paulwong> <200209180805.33027.tglx@linutronix.de>
Subject: Re: jffs2 filesystem
Date: Wed, 18 Sep 2002 16:04:30 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
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

----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Paul Wong" <paul.wong@digitalview.com>; <linux-mtd@lists.infradead.org>
Sent: Wednesday, September 18, 2002 2:05 PM
Subject: Re: jffs2 filesystem


> On Wednesday 18 September 2002 05:53, Paul Wong wrote:
> > Hi! all,
> >     I have a problem about the jffs2 file system. Pls. refer below
message.
> > If the i/o error occur in eraseall process, is the jffs2 fs corrupted if
i
> > copy the jffs2 image to /dev/mtd1 ? Does the "dd" or "cp" take care the
i/o
> > error? thanks.
> > bash-2.04# eraseall /dev/mtd1
> > Erasing 16 Kibyte @ f0000 --  9 % compnand_erase: attempt to erase a bad
> > block a
> > t page 0x00003d20
> > Erasing 16 Kibyte @ 1a4000 -- 16 % complete.
> > eraseall: /dev/mtd1: MTD Erase failure: Input/output error
> > Erased 10240 Kibyte @ 0 -- 100% complete.
> I assume, you are using NAND flash. Your chip has a factory marked bad
block. \
yes, I use the samsung 16MB NAND flash.


>
> > bash-2.04# dd if=jffs2.img of=/dev/mtd1 bs=1k
> > dd: writing `/dev/mtd1': Bad address
> > 3607+1 records in
> > 3607+0 records out
> > bash-2.04#
> dd / cp don't know about bad blocks. But the NAND-driver refuses to write
to
> this block.
> Solutions:
> 1. Mount your device after erasall with
> mount -t jffs2 /dev/mtd1 /mnt/bla
should "mount -t jffs2 /dev/mtdblock1 /mnt/bla" ?

> and copy your data to the filesystem.
>
> 2. Use a bootloader utility, which skips the bad block.
any bootloader utility recommend? is LILO or GRUB?

>
> 3. Write a small utility, which can handle bad blocks
is the utility compile with the nand driver?


thanks Thomas.

Paul

>
> --
> Thomas
> ____________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
