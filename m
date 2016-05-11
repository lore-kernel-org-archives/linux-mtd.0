Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0Uab-0004Yo-Fz
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 13:54:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-fsdevel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 dedekind1@gmail.com, alex@nextthing.co, akpm@linux-foundation.org,
 sasha.levin@oracle.com, iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 kirill.shutemov@linux.intel.com, hch@infradead.org, hughd@google.com,
 mgorman@techsingularity.net, vbabka@suse.cz,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/2] mm: Export migrate_page_move_mapping and migrate_page_copy
Date: Wed, 11 May 2016 15:53:42 +0200
Message-Id: <1462974823-3168-2-git-send-email-richard@nod.at>
In-Reply-To: <1462974823-3168-1-git-send-email-richard@nod.at>
References: <1462974823-3168-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Export these symbols such that UBIFS can implement
->migratepage.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 mm/migrate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index f9dfb18..bdf3410 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -431,6 +431,7 @@ int migrate_page_move_mapping(struct address_space *mapping,
 
 	return MIGRATEPAGE_SUCCESS;
 }
+EXPORT_SYMBOL(migrate_page_move_mapping);
 
 /*
  * The expected number of remaining references is the same as that
@@ -586,6 +587,7 @@ void migrate_page_copy(struct page *newpage, struct page *page)
 
 	mem_cgroup_migrate(page, newpage);
 }
+EXPORT_SYMBOL(migrate_page_copy);
 
 /************************************************************
  *                    Migration functions
-- 
2.7.3
