Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXZ9a-0007JI-Hx
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 22:08:24 +0000
From: Richard Weinberger <richard@nod.at>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: zhangjun <openzhangj@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com, hch@lst.de,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] ubifs: fix page_count in ->ubifs_migrate_page()
Date: Thu, 13 Dec 2018 23:08:08 +0100
Message-ID: <1683588.PnVoaTFAp1@blindfold>
In-Reply-To: <20181213220000.7b56wysed67y5iv6@kshutemo-mobl1>
References: <1544728817-2870-1-git-send-email-openzhangj@gmail.com>
 <8239265.3QN2sXB6kY@blindfold>
 <20181213220000.7b56wysed67y5iv6@kshutemo-mobl1>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 13. Dezember 2018, 23:00:00 CET schrieb Kirill A. Shutemov:
> > Let's wait a few days to give Kirill a chance to review, then I'll apply the patch.
> 
> I don't remmeber much context now...
> 
> Could you remind me why ubifs doesn't take additional pin when sets
> PG_private?

Because it does not use set_page_private(), it just sets the flag for
internal accounting purposes.

>From UBIFS docs:
 * UBIFS uses 2 page flags: @PG_private and @PG_checked. @PG_private is set if
 * the page is dirty and is used for optimization purposes - dirty pages are
 * not budgeted so the flag shows that 'ubifs_write_end()' should not release
 * the budget for this page. The @PG_checked flag is set if full budgeting is
 * required for the page e.g., when it corresponds to a file hole or it is
 * beyond the file size. The budgeting is done in 'ubifs_write_begin()', because
 * it is OK to fail in this function, and the budget is released in
 * 'ubifs_write_end()'. So the @PG_private and @PG_checked flags carry
 * information about how the page was budgeted, to make it possible to release
 * the budget properly.

> Migration is not the only place where the additional pin is implied.
> See all users of page_has_private() helper. Notably reclaim path.

Hmmm, I need to dig into that.
I this is a problem then f2fs suffers from it too.
At least from what I can tell from reading f2fs_migrate_page().

Thanks,
//richard
