Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDeoL-0002M8-8I
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
Subject: Remove page migration fallback (was: UBIFS and page migration)
Date: Thu, 16 Jun 2016 23:26:12 +0200
Message-Id: <1466112375-1717-1-git-send-email-richard@nod.at>
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

In order to address this issue implement a convenient ->migratepage()
function for UBIFS and disable the automatic assignment of
fallback_migrate_page(). Filesystems maintains should decide themselves
whether they have to implement ->migratepage() or can use the generic function.

Another interesting topic is testing ->migratepage(). So far the only reliable
test to trigger the UBIFS issue we have is real hardware and CMA.
I was able to trigger it a few times in KVM using the migrate_pages() system call.
But not reliable at all.

Thanks,
//richard

[PATCH 1/3] mm: Don't blindly assign fallback_migrate_page()
[PATCH 2/3] mm: Export migrate_page_move_mapping and
[PATCH 3/3] UBIFS: Implement ->migratepage()
