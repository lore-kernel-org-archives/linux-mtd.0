Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afrQh-00030a-K1
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2016 16:02:44 +0000
Subject: Re: Page migration issue with UBIFS
To: Christoph Hellwig <hch@infradead.org>
References: <56E8192B.5030008@nod.at>
 <20160315151727.GA16462@node.shutemov.name> <56E82B18.9040807@nod.at>
 <20160315153744.GB28522@infradead.org>
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
From: Richard Weinberger <richard@nod.at>
Message-ID: <56E8320B.8040807@nod.at>
Date: Tue, 15 Mar 2016 17:02:19 +0100
MIME-Version: 1.0
In-Reply-To: <20160315153744.GB28522@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Christoph,

Am 15.03.2016 um 16:37 schrieb Christoph Hellwig:
> On Tue, Mar 15, 2016 at 04:32:40PM +0100, Richard Weinberger wrote:
>>> Or if ->page_mkwrite() was called, why the page is not dirty?
>>
>> BTW: UBIFS does not implement ->migratepage(), could this be a problem?
> 
> This might be the reason.  I can't reall make sense of
> buffer_migrate_page, but it seems to migrate buffer_head state to
> the new page.

Oh, yes. This makes a lot of sense.

> I'd love to know why CMA even tries to migrate pages that don't have a
> ->migratepage method, this seems incredibly dangerous to me.

CMA folks, can you please clarify? :-)

UBIFS cannot use buffer_migrate_page() as this function assumes a
buffer head and UBIFS works on top of an MTD.
This is most likely why ->migratepage() was never implemented in UBIFS.

Also the documentation is not clear, reads more like an not required optimization:
  migrate_page:  This is used to compact the physical memory usage.
        If the VM wants to relocate a page (maybe off a memory card
        that is signalling imminent failure) it will pass a new page
        and an old page to this function.  migrate_page should
        transfer any private data across and update any references
        that it has to the page.

...assuming s/migrate_page/migratepage.

Thanks,
//richard
