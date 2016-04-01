Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alw5a-0003ds-P8
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 10:14:03 +0000
Subject: Re: UBIFS and page migration (take 2)
To: Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org
References: <1459461513-31765-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 dedekind1@gmail.com, alex@nextthing.co, akpm@linux-foundation.org,
 sasha.levin@oracle.com, iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 kirill.shutemov@linux.intel.com, hch@infradead.org, hughd@google.com,
 mgorman@techsingularity.net
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <56FE49CD.1000302@suse.cz>
Date: Fri, 1 Apr 2016 12:13:33 +0200
MIME-Version: 1.0
In-Reply-To: <1459461513-31765-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/31/2016 11:58 PM, Richard Weinberger wrote:
> During page migrations UBIFS gets confused. We triggered this by using CMA
> on two different targets.
> It turned out that fallback_migrate_page() is not suitable for UBIFS as it
> does not copy the PagePrivate flag.
> UBIFS is using this flag among with PageChecked to account free space.
> One possible solution is implementing a ->migratepage() function in UBIFS
> which does more or less the same as fallback_migrate_page() but also
> copies PagePrivate. I'm not at all sure whether this is they way to go.
> IMHO either page migration should not happen if ->migratepage() is not implement
> or fallback_migrate_page() has to work for all filesystems.

Yes, we could document more thoroughly the expectations of 
fallback_migrate_page() and audit the existing users, but still relying on every 
new address_space_operations instance to verify them isn't without risk. And I 
doubt there can be a default fallback that's guaranteed safe for all filesystems.

> Comments? Flames? :-)
>
> Thanks,
> //richard
>
> [PATCH 1/2] mm: Export migrate_page_move_mapping and
> [PATCH 2/2] UBIFS: Implement ->migratepage()
>
