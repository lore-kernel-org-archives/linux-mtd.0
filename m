Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0Uab-0004YH-Fy
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
 mgorman@techsingularity.net, vbabka@suse.cz
Subject: UBIFS and page migration (take 3)
Date: Wed, 11 May 2016 15:53:41 +0200
Message-Id: <1462974823-3168-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During page migrations UBIFS gets confused. We triggered this by using CMA
on two different targets.
It turned out that fallback_migrate_page() is not suitable for UBIFS as it
does not copy the PagePrivate flag. Non-trivial block based filesystems
do not notice since they can use buffer_migrate_page().
UBIFS is using this flag among with PageChecked to account free space.
One possible solution is implementing a ->migratepage() function in UBIFS
which does more or less the same as fallback_migrate_page() but also
copies PagePrivate. I'm not at all sure whether this is the way to go.
IMHO either page migration should not happen if ->migratepage() is not implement
or fallback_migrate_page() has to work for all filesystems.

Comments? Flames? :-)

Thanks,
//richard

[PATCH 1/2] mm: Export migrate_page_move_mapping and
[PATCH 2/2] UBIFS: Implement ->migratepage()
