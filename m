Received: from ipmail03.adl2.internode.on.net ([150.101.137.141])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXZva-0006jm-G4
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 22:58:00 +0000
Date: Fri, 14 Dec 2018 09:57:36 +1100
From: Dave Chinner <david@fromorbit.com>
To: Richard Weinberger <richard@nod.at>
Cc: zhangjun <openzhangj@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kirill.shutemov@linux.intel.com, hch@lst.de, linux-fsdevel@vger.kernel.org
Subject: Re: ubifs: fix page_count in ->ubifs_migrate_page()
Message-ID: <20181213225736.GF29416@dastard>
References: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
 <5829763.q4qAXljTxb@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5829763.q4qAXljTxb@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 13, 2018 at 03:23:37PM +0100, Richard Weinberger wrote:
> Hello zhangjun,
> 
> thanks a lot for bringing this up!
> 
> Am Mittwoch, 12. Dezember 2018, 15:13:57 CET schrieb zhangjun:
> > Because the PagePrivate() in UBIFS is different meanings,
> > alloc_cma() will fail when one dirty page cache located in
> > the type of MIGRATE_CMA
> > 
> > If not adjust the 'extra_count' for dirty page,
> > ubifs_migrate_page() -> migrate_page_move_mapping() will
> > always return -EAGAIN for:
> > 	expected_count += page_has_private(page)
> > This causes the migration to fail until the page cache is cleaned
> > 
> > In general, PagePrivate() indicates that buff_head is already bound
> > to this page, and at the same time page_count() will also increase.


That's an invalid assumption.

We should not be trying to infer what PagePrivate() means in code
that has no business using looking at it i.e. page->private is private
information for the owner of the page, and it's life cycle and
intent are unknown to anyone other than the page owner.

e.g. on XFS, a page cache page's page->private /might/ contain a
struct iomap_page, or it might be NULL. Assigning a struct
iomap_page to the page does not change the reference count on the
page.  IOWs, the page needs to be handled exactly the same
way by external code regardless of whether there is somethign
attached to page->private or not.

Hence it looks to me like the migration code is making invalid
assumptions about PagePrivate inferring reference counts and so the
migration code needs to be fixed. Requiring filesystems to work
around invalid assumptions in the migration code is a sure recipe
for problems with random filesystems using page->private for their
own internal purposes....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
