Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDeoL-0002MC-7Y
 for linux-mtd@lists.infradead.org; Thu, 16 Jun 2016 21:26:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 hannes@cmpxchg.org, mgorman@techsingularity.net, n-horiguchi@ah.jp.nec.com,
 mhocko@suse.com, kirill.shutemov@linux.intel.com, hughd@google.com,
 vbabka@suse.cz, akpm@linux-foundation.org, adrian.hunter@intel.com,
 dedekind1@gmail.com, richard@nod.at, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 alex@nextthing.co, sasha.levin@oracle.com, iamjoonsoo.kim@lge.com,
 rvaswani@codeaurora.org, tony.luck@intel.com,
 shailendra.capricorn@gmail.com
Subject: [PATCH 2/3] mm: Export migrate_page_move_mapping and migrate_page_copy
Date: Thu, 16 Jun 2016 23:26:14 +0200
Message-Id: <1466112375-1717-3-git-send-email-richard@nod.at>
In-Reply-To: <1466112375-1717-1-git-send-email-richard@nod.at>
References: <1466112375-1717-1-git-send-email-richard@nod.at>
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
Acked-by: Christoph Hellwig <hch@lst.de>
---
 mm/migrate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index 5129143..0fcdd86 100644
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
