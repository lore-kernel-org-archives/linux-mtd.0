Received: from www.optixsoft.de ([213.187.73.226])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Nrng-0003Ro-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 09:44:37 +0000
Date: Mon, 16 Dec 2002 11:14:41 +0100 (MET)
From: Tobias Otto-Adamczak <toa@indakom.de>
To: <linux-mtd@lists.infradead.org>
cc: Alex Pavloff <apavloff@eason.com>
Subject: Re: writing new BBRAM driver
In-Reply-To: <D3AF5F134D627243993F2F2FC32EE4D229C4A7@mailman.eason.com>
Message-ID: <Pine.LNX.4.31.0212161057400.28011-100000@www.optixsoft.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Alex Pavloff, 2002-12-13, 15:45h:

> Hi there folks.  I've written the struct mtd_info functions for a 128KB
> BBRAM driver for my companies new board.  It's horribly simple, as most of
> it is actually done by a gate array on the board, so from kernel land its
> just poking ioports.  Easy stuff.
>
> Anyway, at this point, I've got that written, but I'm a little hazy as to
> what I do next.  Insmod the driver, and then....?

[I am no expert, but anyway ...]

I think you need at least the mtdcore and mtdblock/mtdblock_ro modules,
too (if you want to have a FS in the BBRAM). When you did the insmod,
have a look at /proc/mtd. If your driver registered okay with the mtd
subsystem, it should appear there. Lets say you find it there as mtd0,
you should then be able to access it as a block device under
/dev/mtdblock0. Then you can do everything with it what you would do
with an unformatted hard disk partition (format it, mount it, use it)

> How do I get a drive to mount?

a) Format you block device or copy a pre-formatted image to the BBRAM.
The latter you can do with a simple
	cat <my_preformatted_image >/dev/mtd0
assuming that your BBRAM is registered as mtd0 partition (check with
"cat /proc/mtd") and you have loaded the mtdchar module.

then do a normal mount, e.g.
	mount -o sync -t minix /dev/mtdblock0 /mnt/bbram

> Also, what FS should I use for this BBRAM?

That depends on your hardware and your applications needs. You may want
to try minix. How much (KB) is your BBRAM, anyway ? Maybe you need no FS
at all ?

Ciao
Tobias
