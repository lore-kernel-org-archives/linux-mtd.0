Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afrC0-000877-B5
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2016 15:47:33 +0000
Received: by mail-wm0-x231.google.com with SMTP id l68so32753926wml.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2016 08:47:11 -0700 (PDT)
Date: Tue, 15 Mar 2016 18:47:08 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Richard Weinberger <richard@nod.at>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
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
Message-ID: <20160315154708.GC16462@node.shutemov.name>
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
> Kirill,
> 
> Am 15.03.2016 um 16:17 schrieb Kirill A. Shutemov:
> > On Tue, Mar 15, 2016 at 03:16:11PM +0100, Richard Weinberger wrote:
> >> Hi!
> >>
> >> We're facing this issue from 2014 on UBIFS:
> >> http://www.spinics.net/lists/linux-fsdevel/msg79941.html
> >>
> >> So sum up:
> >> UBIFS does not allow pages directly marked as dirty. It want's everyone to do it via UBIFS's
> >> ->wirte_end() and ->page_mkwirte() functions.
> >> This assumption *seems* to be violated by CMA which migrates pages.
> > 
> > I don't thing the CMA/migration is the root cause.
> > 
> > How did we end up with writable and dirty pte, but not having
> > ->page_mkwrite() called for the page?
> > 
> > Or if ->page_mkwrite() was called, why the page is not dirty?
> 
> Thanks for your quick response!
> 
> I also don't think that the root cause is CMA or migration but it seems
> to be the messenger.
> 
> Can you confirm that UBIFS's assumptions are valid?
> I'm trying to rule out possible issues and hunt down the root cause...

The assumption looks reasonable for me, but I am not confident enough to
"confirm" it.

-- 
 Kirill A. Shutemov
