Received: from pd903ca3c.dip.t-dialin.net ([217.3.202.60] helo=lappi)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JZl1-0004xE-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2001 13:03:21 +0100
Received: from cemil by lappi with local (Exim 3.22 #1 (Debian))
	id 15JZGX-00005r-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2001 13:31:49 +0200
Date: Mon, 9 Jul 2001 13:31:47 +0200
To: linux-mtd@lists.infradead.org
Subject: Again Problems with MTD and DoC 2000
Message-ID: <20010709133147.B340@cemil.debian-linux.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
From: Cemil Degirmenci <cemil@cemil.debian-linux.de>
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

Hello,
i have again some problems with DiskOnChip.

root@manuel:~ > lsmod
Module                  Size  Used by
docprobe                1600   0 
mtdchar                 4752   0 
nftl                   18944   0  (unused)
doc2000                11200   0 
docecc                  3616   0  [doc2000]
mtdcore                 2192   2  [mtdchar nftl doc2000]
root@manuel:~ > 

root@manuel:~ > cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00800000 00002000 "DiskOnChip 2000"
root@manuel:~ > 

root@manuel:/home/cemil/mtd-20000704/util > ./nftl_format /dev/mtd0
[ this takes about 5 minutes with 99%(!) CPU-Load ... ]
MEMWRITEOOB at 4200: (null)
MEMWRITEOOB at 6200: (null)
MEMWRITEOOB at 8200: (null)
MEMWRITEOOB at a200: (null)
MEMWRITEOOB at c200: (null)
MEMWRITEOOB at e200: (null)
MEMWRITEOOB at 10200: (null)
MEMWRITEOOB at 12200: (null)
MEMWRITEOOB at 14200: (null)
MEMWRITEOOB at 16200: (null)
MEMWRITEOOB at 18200: (null)
...
...

root@manuel:~ > mount /dev/mtd0 /doc/
mount: /dev/mtd0  ist kein blockorientiertes Gerät. (means: "is not 
a valid block device)
root@manuel:~ > 

a "cat /dev/mtd0" also needs a lot of time and CPU-Load but give no 
result.

The MTD is the MTD-Driver from Kernel 2.4.6-ac1

Where is the fault? Is it my fault?

mfg,

Cemil
