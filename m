Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajacR-0002GH-Lu
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 22:54:17 +0000
Subject: Re: [PATCH] UBIFS: Implement ->migratepage()
To: Vlastimil Babka <vbabka@suse.cz>, linux-mtd@lists.infradead.org
References: <56E9C658.1020903@nod.at>
 <1458168919-11597-1-git-send-email-richard@nod.at> <56EA7F95.4090703@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 dedekind1@gmail.com, alex@nextthing.co, akpm@linux-foundation.org,
 sasha.levin@oracle.com, iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Hugh Dickins <hughd@google.com>, Mel Gorman <mgorman@techsingularity.net>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56F5C17A.2080707@nod.at>
Date: Fri, 25 Mar 2016 23:53:46 +0100
MIME-Version: 1.0
In-Reply-To: <56EA7F95.4090703@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.03.2016 um 10:57 schrieb Vlastimil Babka:
> +CC Hugh, Mel
> 
> On 03/16/2016 11:55 PM, Richard Weinberger wrote:
>> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>>
>> When using CMA during page migrations UBIFS might get confused
> 
> It shouldn't be CMA specific, the same code runs from compaction, autonuma balancing...
> 
>> and the following assert triggers:
>> UBIFS assert failed in ubifs_set_page_dirty at 1451 (pid 436)
>>
>> UBIFS is using PagePrivate() which can have different meanings across
>> filesystems. Therefore the generic page migration code cannot handle this
>> case correctly.
>> We have to implement our own migration function which basically does a
>> plain copy but also duplicates the page private flag.
> 
> Lack of PagePrivate() migration is surely a bug, but at a glance of how UBIFS uses the flag, it's more about accounting, it shouldn't prevent a page from being marked PageDirty()?
> I suspect your initial bug (which is IIUC the fact that there's a dirty pte, but PageDirty(page) is false) comes from the generic fallback_migrate_page() which does:
> 
>         if (PageDirty(page)) {
>                 /* Only writeback pages in full synchronous migration */
>                 if (mode != MIGRATE_SYNC)
>                         return -EBUSY;
>                 return writeout(mapping, page);
>         }
> 
> And writeout() seems to Clear PageDirty() through clear_page_dirty_for_io() but I'm not so sure about the pte (or pte's in all rmaps). But this comment in the latter function:
> 
>                  * Yes, Virginia, this is indeed insane.
> 
> scared me enough to not investigate further. Hopefully the people I CC'd understand more about page migration than me. I'm just an user :)
> 
> In any case, this patch would solve both lack of PageDirty() transfer, and avoid the path leading from fallback_migrate_page() to writeout(). But I'm not confident enough here to
> ack it.

Hugh? Mel? Anyone? :-)

It is still not clear to me whether this needs fixing in MM or UBIFS.

Thanks,
//richard
