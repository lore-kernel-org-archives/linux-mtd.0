Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abW3j-0000lW-LU
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 16:25:05 +0000
Received: by mail-ig0-x22e.google.com with SMTP id y8so23265622igp.0
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2016 08:24:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
Date: Thu, 3 Mar 2016 17:24:41 +0100
Message-ID: <CAKv+Gu_8Fggh+hnVnj6pM6PbOysWFTNt=ot6nudLur9nzs2FVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix memremap on ARM
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26 February 2016 at 18:34, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> This is something I ran into while working on support for the UEFI
> memory attributes and ESRT tables. In both cases, these tables are
> passed to the kernel in memory which is guaranteed to be below 4 GB,
> but may be outside of the kernel direct mapping. (UEFI typically
> attempts to allocate from the top down, which means such tables are
> highly likely to be in highmem for any system with more than 760 MB
> of system RAM)
>
> The recently introduced memremap() is a very useful abstraction for
> accessing such tables, because it is generic, and already attempts to
> do the right thing with respect to regions that may already have been
> mapped directly. However, it falls back to ioremap_cache() for mapping
> high memory, which is not allowed on ARM for system RAM, and also results
> in the region to be mapped with different attributes depending on whether
> it is covered by lowmem or not.
>
> So instead, create an arch specific hook 'arch_memremap_wb(), and
> implement it for ARM using the same memory attributes used for the
> linear mapping. Note that memremap will only call this hook for regions
> that are not already mapped permanently.
>
> Since this change results in memremap() to use attributes different from
> the ones used by ioremap_cache(), revert the change to pxa2xx-flash that
> moved it to memremap.
>
> Changes since v1/rfc:
> - new patch #1 that reverts the ioremap_cache->memremap conversion for the
>   pxa2xx-flash driver
> - added Dan's ack to patch #2
>

If there are no remaining objections, may I suggest that Dan takes
patch #1 and #2, and that I put the third patch into Russell's patch
system? The only strict ordering requirement is that #1 is merged
before #2 and #3 both hit mainline, and that is solved by taking #1
and #2 in order.

Thanks,
Ard.
