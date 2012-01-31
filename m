Received: from oproxy5.bluehost.com ([2605:dc00:100:2::a5]
 helo=oproxy5-pub.bluehost.com)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rs3Aq-00048t-EU
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 02:10:22 +0000
Message-ID: <4F275B20.6010105@xenotime.net>
Date: Mon, 30 Jan 2012 19:08:16 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH -next] mtd: fix nand/docg4.c printk format warnings
References: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
In-Reply-To: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warnings for resource_size_t:

drivers/mtd/nand/docg4.c:1277:4: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
drivers/mtd/nand/docg4.c:1277:4: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	David Woodhouse <dwmw2@infradead.org>
Cc:	linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/docg4.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20120130.orig/drivers/mtd/nand/docg4.c
+++ linux-next-20120130/drivers/mtd/nand/docg4.c
@@ -1273,8 +1273,9 @@ static int __init probe_docg4(struct pla
 	virtadr = ioremap(r->start, resource_size(r));
 	if (!virtadr) {
 		dev_err(dev, "Diskonchip ioremap failed: "
-			"0x%x bytes at 0x%x\n",
-			resource_size(r), r->start);
+			"0x%llx bytes at 0x%llx\n",
+			(unsigned long long)resource_size(r),
+			(unsigned long long)r->start);
 		return -EIO;
 	}
 
