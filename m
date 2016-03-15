Date: Tue, 15 Mar 2016 08:37:44 -0700
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
Message-ID: <20160315153744.GB28522@infradead.org>
References: <56E8192B.5030008@nod.at>
 <20160315151727.GA16462@node.shutemov.name>
 <56E82B18.9040807@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56E82B18.9040807@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 15, 2016 at 04:32:40PM +0100, Richard Weinberger wrote:
> > Or if ->page_mkwrite() was called, why the page is not dirty?
> 
> BTW: UBIFS does not implement ->migratepage(), could this be a problem?

This might be the reason.  I can't reall make sense of
buffer_migrate_page, but it seems to migrate buffer_head state to
the new page.

I'd love to know why CMA even tries to migrate pages that don't have a
->migratepage method, this seems incredibly dangerous to me.
