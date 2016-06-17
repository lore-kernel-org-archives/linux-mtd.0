Received: from mail-wm0-f66.google.com ([74.125.82.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDzzu-0008Cl-4k
 for linux-mtd@lists.infradead.org; Fri, 17 Jun 2016 20:04:10 +0000
Received: by mail-wm0-f66.google.com with SMTP id m124so371124wme.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jun 2016 13:03:49 -0700 (PDT)
Date: Fri, 17 Jun 2016 22:03:46 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 hannes@cmpxchg.org, mgorman@techsingularity.net,
 n-horiguchi@ah.jp.nec.com, kirill.shutemov@linux.intel.com,
 hughd@google.com, vbabka@suse.cz, adrian.hunter@intel.com,
 dedekind1@gmail.com, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at,
 david@fromorbit.com, alex@nextthing.co, sasha.levin@oracle.com,
 iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com
Subject: Re: [PATCH 1/3] mm: Don't blindly assign fallback_migrate_page()
Message-ID: <20160617200345.GA4071@dhcp22.suse.cz>
References: <1466112375-1717-1-git-send-email-richard@nod.at>
 <1466112375-1717-2-git-send-email-richard@nod.at>
 <20160616161121.35ee5183b9ef9f7b7dcbc815@linux-foundation.org>
 <5763A9B2.8060303@nod.at> <20160617162803.GK21670@dhcp22.suse.cz>
 <57642B91.4020206@nod.at> <20160617182751.GB692@dhcp22.suse.cz>
 <5764513E.2070102@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5764513E.2070102@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri 17-06-16 21:36:30, Richard Weinberger wrote:
> 
> 
> Am 17.06.2016 um 20:27 schrieb Michal Hocko:
> > On Fri 17-06-16 18:55:45, Richard Weinberger wrote:
> >> Am 17.06.2016 um 18:28 schrieb Michal Hocko:
> >>> But doesn't this disable the page migration and so potentially reduce
> >>> the compaction success rate for the large pile of filesystems? Without
> >>> any hint about that?
> >>
> >> The WARN_ON_ONCE() is the hint. ;)
> > 
> > Right. My reply turned a different way than I meant... I meant to say
> > that there might be different regressions caused by this change without much
> > hint that a particular warning would be the smoking gun... 
> > 
> 
> Okay, what about something like that?
> That way everything works as before and we don't have regressions
> but FS maintainers will notice the WARN_ON_ONCE() and hopefully review
> whether generic_migrate_page() is really suitable.
> If so, they can set their a_ops->migratepage to generic_migrate_page().

Yes this sounds better to me. I would just be more verbose about which
a_ops is missing the migratepage callback. The WARN_ON_ONCE will not
tell us which fs is the culprit. I am not even sure the calltrace is
really helpful and maybe printk_once would be more appropriate.

	printk_once(KERN_INFO "%ps is missing migratepage callback. Please report to the respective filesystem maintainers.\n",
			mapping->a_ops);

Or print once per a_ops would be even better but that sounds like an
over engineering...
 
> @@ -771,8 +773,15 @@ static int move_to_new_page(struct page *newpage, struct page *page,
>                  * is the most common path for page migration.
>                  */
>                 rc = mapping->a_ops->migratepage(mapping, newpage, page, mode);
> -       else
> -               rc = fallback_migrate_page(mapping, newpage, page, mode);
> +       else {
> +               /*
> +                * Dear filesystem maintainer, please verify whether
> +                * generic_migrate_page() is suitable for your
> +                * filesystem, especially wrt. page flag handling.
> +                */
> +               WARN_ON_ONCE(1);
> +               rc = generic_migrate_page(mapping, newpage, page, mode);
> +       }
> 
>         /*
>          * When successful, old pagecache page->mapping must be cleared before
> 
> Thanks,
> //richard

-- 
Michal Hocko
SUSE Labs
