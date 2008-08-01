Received: from smtp4.pp.htv.fi ([213.243.153.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KP3AH-0003lO-H4
	for linux-mtd@lists.infradead.org; Fri, 01 Aug 2008 22:32:02 +0000
Date: Sat, 2 Aug 2008 01:30:56 +0300
From: Adrian Bunk <bunk@kernel.org>
To: nAl Viro <viro@zeniv.linux.org.uk>, dwmw2@infradead.org
Subject: mtdsuper.c BLOCK=n compile error
Message-ID: <20080801223056.GK19682@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit d5686b444ff3f72808d2b3fbd58672a86cdf38e7
(switch mtd and dm-table to lookup_bdev()) causes
the following compile error with CONFIG_BLOCK=n:

<--  snip  -->

...
  CC      drivers/mtd/mtdsuper.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c: In function `get_sb_mtd':
/home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:184: error: implicit declaration of function 'lookup_bdev'
/home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:184: warning: assignment makes pointer from integer without a cast
/home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:197: error: implicit declaration of function 'bdput'
make[3]: *** [drivers/mtd/mtdsuper.o] Error 1

<--  snip  -->

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
