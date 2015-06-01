Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzYyD-0007I1-JR
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 23:18:14 +0000
Received: by pdbqa5 with SMTP id qa5so118553033pdb.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2015 16:17:51 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] mtd: fixup corner case error handling in
 mtd_device_parse_register()
Date: Mon,  1 Jun 2015 16:17:19 -0700
Message-Id: <1433200640-17858-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
References: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit 3efe41be224c ("mtd: implement common reboot notifier
boilerplate"), we might try to register a reboot notifier for an MTD
that failed to register. Let's avoid this by making the error path
clearer.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8bbbb751bf45..03eec42dc715 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -579,9 +579,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		else
 			ret = nr_parts;
 	}
+	/* Didn't come up with either parsed OR fallback partitions */
+	if (ret < 0) {
+		pr_info("mtd: failed to find partitions\n");
+		goto out;
+	}
 
-	if (ret >= 0)
-		ret = mtd_add_device_partitions(mtd, real_parts, ret);
+	ret = mtd_add_device_partitions(mtd, real_parts, ret);
+	if (ret)
+		goto out;
 
 	/*
 	 * FIXME: some drivers unfortunately call this function more than once.
@@ -596,6 +602,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
+out:
 	kfree(real_parts);
 	return ret;
 }
-- 
1.9.1
