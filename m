Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sjbZ-0001Si-RQ
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 14:47:58 +0100
Mime-Version: 1.0
Message-Id: <a05200f17bb750899ef6e@[130.161.115.44]>
In-Reply-To: <023501c36e31$81a4a610$a970a8c0@topo>
References: <023501c36e31$81a4a610$a970a8c0@topo>
Date: Fri, 29 Aug 2003 15:47:01 +0200
To: "Luca Contini" <luca.contini@mediaenabling.com>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
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

At 15:28 +0200 29-08-2003, Luca Contini wrote:
>Hi,
>I've downloaded the latest snapshot from the CVS:
>mtd-snapshot-20030828.tar.bz2
>Since I need only the mtdblock device working I've just copied the snapshot
>/drivers/mtd content to my /linux/drivers/mtd directory, and the blktrans.h
>to /include/linux/mtd/.
>When I try to compile (using arm-linux-gcc) mtdblock.c I get this warning:
>"mtdblock.c:251: warning: implicit declaration of function `unlikely'"
>and when I try to insert the mtdblock.o module I get:
>
>[arm@Botolo2 mtd]$insmod mtdblock.o
>mtdblock.o: unresolved symbol unlikely
>mtdblock.o: unresolved symbol register_mtd_blktrans
>mtdblock.o: unresolved symbol add_mtd_blktrans_dev
>mtdblock.o: unresolved symbol deregister_mtd_blktrans
>mtdblock.o: unresolved symbol del_mtd_blktrans_dev
>[arm@Botolo2 mtd]$
>
>What Am I missing?

1) Which kernel version ?
2) Which compiler version (arm-linux-gcc -v) ?
3) Any particular reason why you don't use the patchin.sh script ? I 
know, you 'only' need mtdblock, but partial installs tend to create 
no end of trouble.

HTH,

JDB.
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
