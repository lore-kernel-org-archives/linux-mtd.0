Received: from n21b.bullet.mail.sp1.yahoo.com ([69.147.65.253])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHjSt-0002so-RL
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 17:32:44 +0000
Date: Wed, 23 Jan 2008 09:28:13 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Adding a function pointer to mtd_info struct
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <63159.87126.qm@web43145.mail.sp1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to add some new features in my kernel to cfi_cmd_0001.c for a test chip.
 I added a new field to the mtd_info struct in mtd.h and inserted the function
pointer into the mtd->overwrite field I added in cfi_cmd_0001.c, but when I try to
use mtd->overwrite in mtdblock.c the pointer is set to NULL.  

In the mtd_info struct in include/mtd/mtd.h I addded:
	int (*overwrite) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
const u_char *buf);

In cfi_cmd_0001.c I added:
	mtd->overwrite = cfi_intelext_overwrite_buffers;

What file or field do I need to modify to make new function accessible from
mtdblock.c?

Justin Treon



      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ 
