Received: from n9.bullet.re3.yahoo.com ([68.142.237.94])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J7MOP-000622-C5
	for linux-mtd@lists.infradead.org; Wed, 26 Dec 2007 02:53:20 +0000
Date: Tue, 25 Dec 2007 18:41:08 -0800 (PST)
From: DT <ceqcharz@yahoo.com>
Subject: How to make MTD partition writable at runtime?
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <289335.52399.qm@web45106.mail.sp1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am using u-boot/mtdparts to setup some partitions on
a NOR flash.
mtd0: 00080000 00020000 "uboot"
mtd1: 00180000 00020000 "kernel"
mtd2: 01e00000 00020000 "root"

In my mtdparts I specified the first 2 partitions as
read only.
mtdparts=phys_mapped_flash:512k(uboot)ro,1536k(kernel)ro,-(root)

We have run into a case where we need to write to mtd1
after Linux is already running and changing the boot
loader command line is not an option.
Is there a good way to do this?

Thanks in advance,
DT




      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
