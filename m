Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rXz2-0002wI-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 07:06:44 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H2M004EYEACR3@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 18 Sep 2002 08:06:13 +0200 (MEST)
Date: Wed, 18 Sep 2002 08:05:32 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: jffs2 filesystem
In-reply-to: <005601c25ec7$0b5f8f30$9000010a@paulwong>
To: Paul Wong <paul.wong@digitalview.com>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200209180805.33027.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=big5
Content-transfer-encoding: 7BIT
References: <005601c25ec7$0b5f8f30$9000010a@paulwong>
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

On Wednesday 18 September 2002 05:53, Paul Wong wrote:
> Hi! all,
>     I have a problem about the jffs2 file system. Pls. refer below message.
> If the i/o error occur in eraseall process, is the jffs2 fs corrupted if i
> copy the jffs2 image to /dev/mtd1 ? Does the "dd" or "cp" take care the i/o
> error? thanks.
> bash-2.04# eraseall /dev/mtd1
> Erasing 16 Kibyte @ f0000 --  9 % compnand_erase: attempt to erase a bad
> block a
> t page 0x00003d20
> Erasing 16 Kibyte @ 1a4000 -- 16 % complete.
> eraseall: /dev/mtd1: MTD Erase failure: Input/output error
> Erased 10240 Kibyte @ 0 -- 100% complete.
I assume, you are using NAND flash. Your chip has a factory marked bad block. 

> bash-2.04# dd if=jffs2.img of=/dev/mtd1 bs=1k
> dd: writing `/dev/mtd1': Bad address
> 3607+1 records in
> 3607+0 records out
> bash-2.04#
dd / cp don't know about bad blocks. But the NAND-driver refuses to write to 
this block. 
Solutions: 
1. Mount your device after erasall with 
mount -t jffs2 /dev/mtd1 /mnt/bla
and copy your data to the filesystem. 

2. Use a bootloader utility, which skips the bad block.

3. Write a small utility, which can handle bad blocks

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
