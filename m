Date: Mon, 21 Mar 2016 08:28:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <20160321152845.GA17864@infradead.org>
References: <56E8192B.5030008@nod.at>
 <20160315151727.GA16462@node.shutemov.name>
 <56E82B18.9040807@nod.at> <20160315153744.GB28522@infradead.org>
 <56E8985A.1020509@nod.at>
 <20160316142156.GA23595@node.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160316142156.GA23595@node.shutemov.name>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 16, 2016 at 05:21:56PM +0300, Kirill A. Shutemov wrote:
> > FYI, with a dummy ->migratepage() which returns only -EINVAL UBIFS does no
> > longer explode upon page migration.
> > Tomorrow I'll do more tests to make sure.
> 
> Could you check if something like this would fix the issue.
> Completely untested.

We really need to make the default safe for file systems that don't
have a migratepage method.
