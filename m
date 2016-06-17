Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDx46-00023z-2n
 for linux-mtd@lists.infradead.org; Fri, 17 Jun 2016 16:56:19 +0000
Subject: Re: [PATCH 1/3] mm: Don't blindly assign fallback_migrate_page()
To: Michal Hocko <mhocko@kernel.org>
References: <1466112375-1717-1-git-send-email-richard@nod.at>
 <1466112375-1717-2-git-send-email-richard@nod.at>
 <20160616161121.35ee5183b9ef9f7b7dcbc815@linux-foundation.org>
 <5763A9B2.8060303@nod.at> <20160617162803.GK21670@dhcp22.suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 hannes@cmpxchg.org, mgorman@techsingularity.net, n-horiguchi@ah.jp.nec.com,
 kirill.shutemov@linux.intel.com, hughd@google.com, vbabka@suse.cz,
 adrian.hunter@intel.com, dedekind1@gmail.com, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 alex@nextthing.co, sasha.levin@oracle.com, iamjoonsoo.kim@lge.com,
 rvaswani@codeaurora.org, tony.luck@intel.com, shailendra.capricorn@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <57642B91.4020206@nod.at>
Date: Fri, 17 Jun 2016 18:55:45 +0200
MIME-Version: 1.0
In-Reply-To: <20160617162803.GK21670@dhcp22.suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.06.2016 um 18:28 schrieb Michal Hocko:
> But doesn't this disable the page migration and so potentially reduce
> the compaction success rate for the large pile of filesystems? Without
> any hint about that?

The WARN_ON_ONCE() is the hint. ;)
But I can understand your point we'd have to communicate that change better.

> $ git grep "\.migratepage[[:space:]]*=" -- fs | wc -l
> 16
> out of
> $ git grep "struct address_space_operations[[:space:]]*[a-zA-Z0-9_]*[[:space:]]*=" -- fs | wc -l
> 87
> 
> That just seems to be too conservative for something that even not might
> be a problem, especially when considering the fallback migration code is
> there for many years with only UBIFS seeing a problem.

UBIFS is also there for many years.
It just shows that the issue is hard to hit but at least for UBIFS it is real.

> Wouldn't it be safer to contact FS developers who might have have
> similar issue and work with them to use a proper migration code?

That was the goal of this patch. Forcing the filesystem developers
to look as the WARN_ON_ONCE() triggered.

I fear just sending a mail to linux-fsdevel@vger is not enough.

Thanks,
//richard
