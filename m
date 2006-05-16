Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FfyoB-0004OF-8Q
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 08:37:57 -0400
Date: Tue, 16 May 2006 14:37:50 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>, dwmw2@infradead.org
Message-ID: <20060516123750.GS6931@stusta.de>
References: <20060515005637.00b54560.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060515005637.00b54560.akpm@osdl.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [-mm patch] make drivers/mtd/nand/cs553x_nand.c:cs553x_init() static
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

This patch makes the needlessly global cs553x_init() static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.17-rc4-mm1-full/drivers/mtd/nand/cs553x_nand.c.old	2006-05-16 13:02:13.000000000 +0200
+++ linux-2.6.17-rc4-mm1-full/drivers/mtd/nand/cs553x_nand.c	2006-05-16 13:02:24.000000000 +0200
@@ -267,7 +267,7 @@
 	return err;
 }
 
-int __init cs553x_init(void)
+static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
