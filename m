Date: Tue, 15 Mar 2016 08:35:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Gstir <david@sigma-star.at>, Dave Chinner <david@fromorbit.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Alexander Kaplan <alex@nextthing.co>
Subject: Re: Page migration issue with UBIFS
Message-ID: <20160315153515.GA28522@infradead.org>
References: <56E8192B.5030008@nod.at>
 <20160315151727.GA16462@node.shutemov.name> <56E8297E.80708@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56E8297E.80708@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 15, 2016 at 04:25:50PM +0100, Richard Weinberger wrote:
> Thanks for your quick response!
> 
> I also don't think that the root cause is CMA or migration but it seems
> to be the messenger.
> 
> Can you confirm that UBIFS's assumptions are valid?
> I'm trying to rule out possible issues and hunt down the root cause...

FYI, XFS would blow up unless either ->write_begin or ->page_mkwrite
were called before dirtying a page.  We do an assert that the page has
buffers as the first thing in writepage, and those are the only
two places that should create buffers.

So either no one is using CMA with XFS, or there is another weird
interaction involved.
