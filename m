Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bo1iM-0004N6-3O
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2004 11:12:02 -0400
Received: from baikonur.stro.at ([213.239.196.228])
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bo1iB-00086e-Gc
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2004 16:11:52 +0100
Date: Fri, 23 Jul 2004 17:11:16 +0200
From: maximilian attems <janitor@sternwelten.at>
To: linux-mtd@lists.infradead.org
Message-ID: <20040723151116.GH14000@stro.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: maximilian attems <max@stro.at>
Cc: linux-kernel@vger.kernel.org, wmw2@redhat.com
Subject: [patch-kj] remove old ifdefs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



 Patches to remove some old ifdefs.
 remove most of the #include <linux/version.h>
 kill compat cruft like #define ahd_pci_set_dma_mask pci_set_dma_mask

applies cleanly to 2.6.8-rc2

From: Domen Puncer <domen@coderock.org>
Signed-off-by: Maximilian Attems <janitor@sternwelten.at>



---

 linux-2.6.7-bk20-max/include/linux/mtd/cfi.h |    2 --
 1 files changed, 2 deletions(-)

diff -puN include/linux/mtd/cfi.h~remove-old-ifdefs-mtd-cfi include/linux/mtd/cfi.h
--- linux-2.6.7-bk20/include/linux/mtd/cfi.h~remove-old-ifdefs-mtd-cfi	2004-07-11 14:42:34.000000000 +0200
+++ linux-2.6.7-bk20-max/include/linux/mtd/cfi.h	2004-07-11 14:42:34.000000000 +0200
@@ -458,14 +458,12 @@ static inline __u8 cfi_read_query(struct
 
 static inline void cfi_udelay(int us)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
 	unsigned long t = us * HZ / 1000000;
 	if (t) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(t);
 		return;
 	}
-#endif
 	udelay(us);
 	cond_resched();
 }
