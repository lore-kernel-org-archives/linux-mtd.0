Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sjjW-0001Xa-S0
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 14:56:10 +0100
Message-ID: <024b01c36e35$62241600$a970a8c0@topo>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
References: <023501c36e31$81a4a610$a970a8c0@topo>
	<a05200f17bb750899ef6e@[130.161.115.44]>
Date: Fri, 29 Aug 2003 15:56:45 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: latest MTD snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> At 15:28 +0200 29-08-2003, Luca Contini wrote:
> >Hi,
> >I've downloaded the latest snapshot from the CVS:
> >mtd-snapshot-20030828.tar.bz2
> >Since I need only the mtdblock device working I've just copied the
snapshot
> >/drivers/mtd content to my /linux/drivers/mtd directory, and the
blktrans.h
> >to /include/linux/mtd/.
> >When I try to compile (using arm-linux-gcc) mtdblock.c I get this
warning:
> >"mtdblock.c:251: warning: implicit declaration of function `unlikely'"
> >and when I try to insert the mtdblock.o module I get:
> >
> >[arm@Botolo2 mtd]$insmod mtdblock.o
> >mtdblock.o: unresolved symbol unlikely
> >mtdblock.o: unresolved symbol register_mtd_blktrans
> >mtdblock.o: unresolved symbol add_mtd_blktrans_dev
> >mtdblock.o: unresolved symbol deregister_mtd_blktrans
> >mtdblock.o: unresolved symbol del_mtd_blktrans_dev
> >[arm@Botolo2 mtd]$
> >
> >What Am I missing?
>
> 1) Which kernel version ?

2.4.18-rmk6-swl6

> 2) Which compiler version (arm-linux-gcc -v) ?

2.95.2

> 3) Any particular reason why you don't use the patchin.sh script ? I
> know, you 'only' need mtdblock, but partial installs tend to create
> no end of trouble.

I just thought it was easiest to do it manually just for mtdblock device.
I've copied the snapshot to ../linux/drivers/mtd/util/snapshot and tried the
patchin.sh:
[root@Lab patches]# patchin.sh
Directory  does not exist or is not a kernel source directory

this is the result

May be the location I copied the snapshot to is wrong.

Regards

>
> HTH,
>
> JDB.
> -- 
> LART. 250 MIPS under one Watt. Free hardware design files.
> http://www.lart.tudelft.nl/
>
>
