Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXDwQ-0002VM-7j
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 19:43:30 +0000
Received: by padhy1 with SMTP id hy1so21148950pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 12:43:08 -0700 (PDT)
Date: Wed, 2 Sep 2015 12:43:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 0/2] mtd: nand: properly handle bitflips in erased pages
Message-ID: <20150902194305.GS81844@google.com>
References: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Some high level comments. We've discussed some of this before on IRC,
but I guess having a few more bits here could help.

On Mon, Aug 24, 2015 at 11:47:20AM +0200, Boris Brezillon wrote:
> Hello,
> 
> This patch series aims at providing a common logic to check for bitflips
> in erased pages.
> 
> Currently each driver is implementing its own logic to check for bitflips
> in erased pages. Not only this create code duplication, but most of these
> implementations are incorrect.
> Here are a few aspects that are often left aside in those implementations:
> 1/ they do not check OOB bytes when checking for the ff pattern, which
>    means they can consider a page as empty while the MTD user actually
>    wanted to write almost ff with a few bits to zero
> 2/ they check for the ff pattern on the whole page, while ECC actually
>    works on smaller chunks (usually 512 or 1024 bytes chunks)
> 3/ they use random bitflip thresholds to decide whether a page/chunk is
>    erased or not. IMO this threshold should be set to ECC strength (or
>    at least something correlated to this parameter)

Agreed.

> The approach taken in this series is to provide two helper functions to
> check for bitflips in erased pages. Each driver that needs to check for
> such cases can then call the nand_check_erased_ecc_chunk() function, and
> rely on the common logic to decide whether a page is erased or not.
> 
> While Brian suggested a few times to make this detection automatic for
> all drivers that set a specific flag (NAND_CHECK_ERASED_BITFLIPS?), here
> is a few reasons I think this is not such a good idea:
> 1/ some (a lot of) drivers do not properly implement the raw access
>    functions, and since we need to check for raw data and OOB bytes this
>    makes the automatic detection unusable for most drivers unless they
>    decide to correctly implement those methods (which would be a good
>    thing BTW).

Given your last parenthetical statement (which I agree with), I'm not
sure this is a very strong point. IMO it's only valid for hardware which
*cannot* support raw modes. For all other cases, it's reasonable to
assume that developers can implement a conforming driver in order to
pick up these reliability features.

> 2/ as a I said earlier, this check should be made at the ECC chunk level
>    and not at the page level. This spots two problems: some (a lot of)
>    drivers do not properly specify the ecc layout information, and even
>    if the ecc layout is correctly defined, there is no way to attach ECC
>    bytes to a specific ECC chunk.

I think this point is pretty valid, and it's one of the main
deficiencies in an automatic approach that ignores the ECC layout.

> 3/ the last aspect is the perf penalty incured by this test. Automatically
>    doing that at the NAND core level implies reading the whole page again
>    in raw mode, while with the helper function approach, drivers supporting
>    access at the ECC chunk level can read only the faulty chunk in raw
>    mode.

The real important point here is (IMO) that the driver may have
knowledge of the uncorrected data + OOB even in the !oob_required case,
so *no* re-reading is required. It's a little harder to get that
guarantee when you move a little higher up the abstraction layer.

> Regarding the bitflips threshold at which an erased pages is considered as
> faulty, I have assigned it to ECC strength. As mentioned by Andrea, using
> ECC strength might cause some trouble, because if you already have some
> bitflips in an erased page, programming it might generate even more of
> them.
> In the other hand, shouldn't that be checked after (or before) programming
> a page. I mean, UBI is already capable of detecting pages which are over
> the configured bitflips_threshold and move data around when it detects
> such pages.
> If we check data after writing a page we wouldn't have to bother about
> setting a weaker value for the "bitflips in erased page" case.
> Another thing in favor of the ECC strength value for this "bitflips in
> erased page" threshold value: if the ECC engine is generating 0xff ECC
> bytes when the page is empty, then it will be able to fix ECC strength
> bitflips without complaining, so why should we use different value when
> we detect bitflips using the pattern match approach?

I like this argument about comparing with an ECC algorithm that corrects
bitflips in 0xff pages.

Regardless, in case this does become an issue, might this threshold be
worth stashing in struct nand_chip? Then the driver API can omit the
threshold parameter, and we have a chance to override it in a central
place (or, maybe in special-case drivers) rather than at each call site
for nand_check_erased_ecc_chunk().

Brian
