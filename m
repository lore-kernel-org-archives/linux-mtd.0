Received: from baikonur.stro.at ([213.239.196.228])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bo1mh-0004Wf-Bp
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2004 11:16:34 -0400
Date: Fri, 23 Jul 2004 17:16:24 +0200
From: maximilian attems <janitor@sternwelten.at>
To: linux-mtd@lists.infradead.org
Message-ID: <20040723151624.GM1795@stro.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: maximilian attems <max@stro.at>
Cc: dwmw2@redhat.com, linux-kernel@vger.kernel.org
Subject: [patch-kj] remove old ifdefs drivers/mtd/mtdcore.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



 remove unused #include <linux/version.h>
 Patches to remove old ifdefs 2.2 compatibility is already merged.

applies cleanly to 2.6.8-rc2

From: Domen Puncer <domen@coderock.org>
Signed-off-by: Maximilian Attems <janitor@sternwelten.at>



---

 linux-2.6.7-bk20-max/drivers/mtd/mtdcore.c |   36 -----------------------------
 1 files changed, 1 insertion(+), 35 deletions(-)

diff -puN drivers/mtd/mtdcore.c~remove-old-ifdefs-mtdcore drivers/mtd/mtdcore.c
--- linux-2.6.7-bk20/drivers/mtd/mtdcore.c~remove-old-ifdefs-mtdcore	2004-07-11 14:42:37.000000000 +0200
+++ linux-2.6.7-bk20-max/drivers/mtd/mtdcore.c	2004-07-11 14:42:37.000000000 +0200
@@ -6,7 +6,6 @@
  *
  */
 
-#include <linux/version.h>
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
