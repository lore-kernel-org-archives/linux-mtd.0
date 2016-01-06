Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGwxt-0001gh-NR
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 22:54:02 +0000
Received: by mail-pa0-x233.google.com with SMTP id do7so4577217pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 14:53:39 -0800 (PST)
Date: Wed, 6 Jan 2016 14:53:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?iso-8859-1?B?U/hyZW5zZW4s?= Stefan <Stefan.Sorensen@spectralink.com>,
 Heiko Schocher <hs@denx.de>, Frans Klaver <fransklaver@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-4.5 v2] mtd: nand: assign reasonable default name for
 NAND drivers
Message-ID: <20160106225336.GK109450@google.com>
References: <1452019185-134498-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452019185-134498-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 05, 2016 at 10:39:45AM -0800, Brian Norris wrote:
> Commits such as commit 853f1c58c4b2 ("mtd: nand: omap2: show parent
> device structure in sysfs") attempt to rely on the core MTD code to set
> the MTD name based on the parent device. However, nand_base tries to set
> a different default name according to the flash name (e.g., extracted
> from the ONFI parameter page), which means NAND drivers will never make
> use of the MTD defaults. This is not the intention of commit
> 853f1c58c4b2.
> 
> This results in problems when trying to use the cmdline partition
> parser, since the MTD name is different than expected. Let's fix this by
> providing a default NAND name, where possible.
> 
> Note that this is not really a great default name in the long run, since
> this means that if there are multiple MTDs attached to the same
> controller device, they will have the same name. But that is an existing
> issue and requires future work on a better controller vs. flash chip
> abstraction to fix properly.
> 
> Fixes: 853f1c58c4b2 ("mtd: nand: omap2: show parent device structure in sysfs")
> Reported-by: Heiko Schocher <hs@denx.de>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Tested-by: Heiko Schocher <hs@denx.de>
> Cc: Heiko Schocher <hs@denx.de>
> Cc: Frans Klaver <fransklaver@gmail.com>
> Cc: <stable@vger.kernel.org>
> ---
> v2:
>  * target 4.5, as 4.4 is getting late
>  * add -stable tags
>  * move assignment directly into nand_scan_ident() (nand_set_defaults() has a
>    slightly different purpose and gets reused, so it's not as good of a
>    candidate)

Applied to l2-mtd.git, for 4.5 (+ stable)
