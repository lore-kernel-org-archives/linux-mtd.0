Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhDig-00042i-Cw
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 19:49:51 -0400
Date: Fri, 27 Apr 2007 01:47:56 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC: 2.6 patch] drivers/mtd/maps/nettel.c: possible cleanups
Message-ID: <20070426234756.GM3468@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch contains the following possible cleanups:
- make 2 needlessly global functions static
- #if 0 the unused nettel_eraseconfig()

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

This patch has been sent on:
- 27 Mar 2007

 drivers/mtd/maps/nettel.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- linux-2.6.21-rc4-mm1/drivers/mtd/maps/nettel.c.old	2007-03-26 16:04:25.000000000 +0200
+++ linux-2.6.21-rc4-mm1/drivers/mtd/maps/nettel.c	2007-03-26 16:09:39.000000000 +0200
@@ -158,6 +158,8 @@
 	nettel_reboot_notifier, NULL, 0
 };
 
+#if 0
+
 /*
  *	Erase the configuration file system.
  *	Used to support the software reset button.
@@ -208,18 +210,22 @@
 	return(0);
 }
 
+#endif  /*  0  */
+
 #else
 
+#if 0
 int nettel_eraseconfig(void)
 {
 	return(0);
 }
+#endif  /*  0  */
 
 #endif
 
 /****************************************************************************/
 
-int __init nettel_init(void)
+static int __init nettel_init(void)
 {
 	volatile unsigned long *amdpar;
 	unsigned long amdaddr, maxsize;
@@ -477,7 +483,7 @@
 
 /****************************************************************************/
 
-void __exit nettel_cleanup(void)
+static void __exit nettel_cleanup(void)
 {
 #ifdef CONFIG_MTD_CFI_INTELEXT
 	unregister_reboot_notifier(&nettel_notifier_block);
