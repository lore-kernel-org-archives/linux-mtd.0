Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ffy0o-0002gY-1M
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 07:46:55 -0400
Date: Tue, 16 May 2006 13:46:44 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>, dwmw2@infradead.org
Message-ID: <20060516114644.GN6931@stusta.de>
References: <20060515005637.00b54560.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060515005637.00b54560.akpm@osdl.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [-mm patch] drivers/mtd/devices/docprobe.c: correct #if's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 15, 2006 at 12:56:37AM -0700, Andrew Morton wrote:
>...
> Changes since 2.6.17-rc3-mm1:
>...
>  git-mtd.patch
>...
>  git trees
>...

If we correct the names of the config options, the code might actually 
work as intended...
 
Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

 drivers/mtd/devices/docprobe.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-2.6.17-rc4-mm1-full/drivers/mtd/devices/docprobe.c.old	2006-05-16 12:58:49.000000000 +0200
+++ linux-2.6.17-rc4-mm1-full/drivers/mtd/devices/docprobe.c	2006-05-16 12:59:08.000000000 +0200
@@ -231,21 +231,21 @@
 
 static int docfound;
 
-#ifdef CONFIG_DOC2000
+#ifdef CONFIG_MTD_DOC2000
 extern void DoC2k_init(struct mtd_info *);
 #define doc2k_initfunc (&DoC2k_init)
 #else 
 #define doc2k_initfunc NULL
 #endif
 
-#ifdef CONFIG_DOC2001
+#ifdef CONFIG_MTD_DOC2001
 extern void DoCMil_init(struct mtd_info *);
 #define docmil_initfunc (&DoCMil_init)
 #else 
 #define docmil_initfunc NULL
 #endif
 
-#ifdef CONFIG_DOC2001PLUS
+#ifdef CONFIG_MTD_DOC2001PLUS
 extern void DoCMilPlus_init(struct mtd_info *);
 #define docmplus_initfunc (&DoCMilPlus_init)
 #else 
