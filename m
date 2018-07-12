Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdZMu-0007lk-Dg
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 11:02:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/5] ubifs: Set default assert action to read-only
Date: Thu, 12 Jul 2018 13:02:00 +0200
Message-Id: <20180712110200.13054-6-richard@nod.at>
In-Reply-To: <20180712110200.13054-1-richard@nod.at>
References: <20180712110200.13054-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Traditionally UBIFS just reported a failed assertion and moved on. The
drawback is that users will notice UBIFS bugs when it is too late, most
of the time when it is no longer about to mount. This makes bug hunting
problematic since valuable information from failing asserts is long gone
when UBIFS is dead. The other extreme, panic'ing on a failing assert is
also not worthwhile, we want users and developers give a chance to
collect as much debugging information as possible if UBIFS hits an
assert. Therefore go for the third option, switch to read-only mode when
an assert fails. That way UBIFS will not write possible bad data to the
MTD and gives users the chance to collect debugging information.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 524122da7868..4b9890e54a78 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2027,6 +2027,7 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 		INIT_LIST_HEAD(&c->orph_list);
 		INIT_LIST_HEAD(&c->orph_new);
 		c->no_chk_data_crc = 1;
+		c->assert_action = ASSACT_RO;
 
 		c->highest_inum = UBIFS_FIRST_INO;
 		c->lhead_lnum = c->ltail_lnum = UBIFS_LOG_LNUM;
-- 
2.18.0
