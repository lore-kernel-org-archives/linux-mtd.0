Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwvEv-0004tb-Pn
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 15:56:18 +0000
Received: by mail-la0-f42.google.com with SMTP id gd6so905826lab.1
 for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2014 07:55:55 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 5 Dec 2014 13:55:55 -0200
Message-ID: <CAOMZO5DQb+xThzQDMh4qqYy=mNCoUG5zWr-iOrtgzbFQdR_VsQ@mail.gmail.com>
Subject: mtd: unable to unregister device
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Frank Li <Frank.Li@freescale.com>, Huang Shijie <shijie8@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Running top of head linus tree or linux-next I observe the following issue:

fsl-quadspi is autloaded as a kernel module:

[    9.670508] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
[    9.763432] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
[    9.847063] fsl-quadspi 21e4000.qspi: QuadSPI SPI NOR flash driver

root@freescale /$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00010000 "21e4000.qspi"
mtd1: 01000000 00010000 "21e4000.qspi"

root@freescale /$ rmmod  fsl-quadspi
root@freescale /$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: a22296c6c756e28 00000000 "(null)"
mtd0: a22296c6c756e28 3064746d "(null)"

Because of this failed unregistration, If I continue with the
load/unload sequence, then kernel will crash.

I don't think this issue is related to
drivers/mtd/spi-nor/fsl-quadspi.c itself, as the same driver can
load/unload correctly on a FSL 3.10 kernel.

Any ideas? Thanks
