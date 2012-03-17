Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8yBg-00033G-LC
 for linux-mtd@lists.infradead.org; Sat, 17 Mar 2012 18:17:09 +0000
Received: by wibhj13 with SMTP id hj13so1688216wib.0
 for <linux-mtd@lists.infradead.org>; Sat, 17 Mar 2012 11:17:05 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: sm_ftl: fix typo in major number.
Date: Sat, 17 Mar 2012 20:16:53 +0200
Message-Id: <1332008213-3940-1-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <20120317175827.GB12111@agk-dp.fab.redhat.com>
References: <20120317175827.GB12111@agk-dp.fab.redhat.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, John Mesmon <jmesmon@gmail.com>,
 Alasdair G Kergon <agk@redhat.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

major == 0 allocates dynamic major, not major == -1

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/sm_ftl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 072ed59..9e2dfd5 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1256,7 +1256,7 @@ static void sm_remove_dev(struct mtd_blktrans_dev *dev)
 
 static struct mtd_blktrans_ops sm_ftl_ops = {
 	.name		= "smblk",
-	.major		= -1,
+	.major		= 0,
 	.part_bits	= SM_FTL_PARTN_BITS,
 	.blksize	= SM_SECTOR_SIZE,
 	.getgeo		= sm_getgeo,
-- 
1.7.9.1
