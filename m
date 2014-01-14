Received: from mail-ob0-f172.google.com ([209.85.214.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2ug8-0006oN-4D
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 03:28:36 +0000
Received: by mail-ob0-f172.google.com with SMTP id gq1so8649086obb.17
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 19:28:10 -0800 (PST)
Date: Mon, 13 Jan 2014 19:27:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 0/6] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
Message-ID: <20140114032759.GA8919@ld-irv-0074>
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388803698-26252-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 balbi@ti.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

First of all, thanks a lot for the extra efforts to make your commits
easier to digest. I do have a few comments, now that I can understand
the pieces a little better.

On Sat, Jan 04, 2014 at 08:18:12AM +0530, Pekon Gupta wrote:
> This patch-series fixes following issues in omap_elm_correct_data():
> (1) Dependency on a specific reserved byte-position in OOB area
>     to differentiates between erased-pages v/s programmed-pages.
>     Problem: reserved byte-position cannot be accomodated in all ecc-schemes
>     Problem: reserved byte-position can itself be subjected upto 8 bit-flips
>              causing the 0xff to become 0x00, causing page to be
>              mis-recognized as erased-page.
> 
> (2) Bit-flips in erased-pages are detected by comparing each byte of Data & OOB
>     with 0xff in check_erased_page().
>     Problem: This is causes performance penalty when erased-pages are checked.

Is this performance penalty significant, though? Shouldn't we be
checking for an erased page only on uncorrectable errors? And aren't
those uncorrectable occasions rare? I ask because it seems like you're
trading some precision for performance, but I think the case you're
optimizing is an uncommon path anyway. But perhaps I'm wrong.

I'll comment with some specifics on the patch itslef.

> (3) Current code is not scalable for future ECC schemes due to presence of 
>     tweaks for BCH4_ECC and BCH8_ECC at multiple places.
> 
> (4) Currently, bit-flips are evaluated and fixed even when ELM reports them as
>     un-correctable bit-flips, this should not happen as 'number-of-error' field
>     in ELM_LOCATION_STATUS becomes invalid when un-correctable flag is set.
> 
> (5) Driver should return with error-code = '-EBADMSG' when
>      uncorrectable bit-flip is detected
>      bit-flip outside valid Data and OOB region is detected

Your other points look good.

Thanks,
Brian
