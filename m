Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew8SP-0004VL-0M
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 15:36:53 +0000
Received: by mail-pg0-x244.google.com with SMTP id x2so1504114pgo.9
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2018 08:36:36 -0700 (PDT)
From: Arushi Singhal <arushisinghal19971997@gmail.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arushi Singhal <arushisinghal19971997@gmail.com>
Subject: [PATCH 3/3] mtd: Remove print after allocation failure
Date: Wed, 14 Mar 2018 21:05:18 +0530
Message-Id: <1521041718-32492-3-git-send-email-arushisinghal19971997@gmail.com>
In-Reply-To: <1521041718-32492-1-git-send-email-arushisinghal19971997@gmail.com>
References: <1521041718-32492-1-git-send-email-arushisinghal19971997@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The prints after [k|v][m|z|c]alloc() functions are not needed, because
in case of failure, allocator will print their internal error prints
anyway.

Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
---
 drivers/mtd/inftlmount.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 8d6bb189..6b94646 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -562,12 +562,8 @@ int INFTL_mount(struct INFTLrecord *s)
 
 	/* Temporary buffer to store ANAC numbers. */
 	ANACtable = kcalloc(s->nb_blocks, sizeof(u8), GFP_KERNEL);
-	if (!ANACtable) {
-		printk(KERN_WARNING "INFTL: allocation of ANACtable "
-				"failed (%zd bytes)\n",
-				s->nb_blocks * sizeof(u8));
+	if (!ANACtable)
 		return -ENOMEM;
-	}
 
 	/*
 	 * First pass is to explore each physical unit, and construct the
-- 
2.7.4
