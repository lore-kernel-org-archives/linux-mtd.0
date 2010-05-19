Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OEk1t-0004E7-M9
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 14:13:50 +0000
Received: by wwb24 with SMTP id 24so915544wwb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 May 2010 07:13:48 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 19 May 2010 07:13:46 -0700
Message-ID: <AANLkTikZvz3qFYQuh4BKf0LuN2F6gtWuEbQgisl0fZ1F@mail.gmail.com>
Subject: Running jffs2 filesystem on mtd nand flash driver
From: Raghu MSRPSR <raghu.msrpsr@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Could some one /review post a exact sequence of steps to get jffs2 up
and running on a NAND MTD driver for kernel 2.6.27+

1. load nand (mtd) driver
 2. flash_eraseall -q /dev/mtdx
  3. mount -t jffs2 /dev/mtdblockx /flash

is this correct sequence?

Any info shared is appreciated.

Thanks,
Raghu
