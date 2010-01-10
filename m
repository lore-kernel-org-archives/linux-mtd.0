Received: from smtp.mujha-vel.cz ([81.30.225.246])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NTtft-00057J-4N
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 09:01:33 +0000
From: Jiri Slaby <jslaby@suse.cz>
To: dwmw2@infradead.org
Subject: [PATCH 1/1] MTD: chips/cfi, remove unneeded NULL checks
Date: Sun, 10 Jan 2010 10:01:19 +0100
Message-Id: <1263114079-8347-1-git-send-email-jslaby@suse.cz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	jirislaby@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In cfi_intelext_setup and cfi_amdstd_setup, mtd is never NULL.
Remove unnecessary checks.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    6 ++----
 drivers/mtd/chips/cfi_cmdset_0002.c |    6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 5fbf29e..9253043 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -615,10 +615,8 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	return mtd;
 
  setup_err:
-	if(mtd) {
-		kfree(mtd->eraseregions);
-		kfree(mtd);
-	}
+	kfree(mtd->eraseregions);
+	kfree(mtd);
 	kfree(cfi->cmdset_priv);
 	return NULL;
 }
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index f3600e8..1ebdcdd 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -494,10 +494,8 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	return mtd;
 
  setup_err:
-	if(mtd) {
-		kfree(mtd->eraseregions);
-		kfree(mtd);
-	}
+	kfree(mtd->eraseregions);
+	kfree(mtd);
 	kfree(cfi->cmdset_priv);
 	kfree(cfi->cfiq);
 	return NULL;
-- 
1.6.5.7
