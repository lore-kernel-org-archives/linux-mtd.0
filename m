Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYib5-0004an-IC
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 20:30:36 +0000
Received: by mail-ob0-f175.google.com with SMTP id wm4so987737obc.34
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 13:30:14 -0700 (PDT)
Date: Tue, 22 Oct 2013 13:30:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v10 00/10] mtd:nand:omap2: clean-up of supported ECC
 schemes
Message-ID: <20131022203009.GM23337@ld-irv-0074.broadcom.com>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382172254-12448-1-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, ijc+devicetree@hellion.org.uk, tony@atomide.com,
 jp.francois@cynove.com, dedekind1@gmail.com, avinashphilipk@gmail.com,
 balbi@ti.com, robherring2@gmail.com, bcousson@baylibre.com,
 swarren@wwwdotorg.org, olof@lixom.net, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 19, 2013 at 02:14:04PM +0530, Pekon Gupta wrote:
> 
> *changes v9 -> v10*
> [PATCH 1/10], [PATCH 2/10]
>   swapped [PATCH v9 1/9] and [PATCH v9 2/9] so that DT parsing updates
>   (with backward compatibility) happen before the deprecation of DT values.
>   This way DTB does not break functionally between the patches.
> [PATCH 3/10] <no update>
> [PATCH 4/10] 
>   dropped [PATCH v9 4/9] introducing NAND_BUSWIDTH_AUTO, instead
>   using DT 'nand-bus-width' for device bus-width

As mentioned in reply to the patch, I don't think this patch belongs in
this series now, and it is still not adequate (the original code there
is wrong in some ways, but your changes are not clearly better).

> [PATCH 5/10] <no update>
> [PATCH 6/10] <no update>
> [PATCH 7/10] 
>   separated out drivers/mtd/nand/Kconfig updates into separate [PATCH v10 10/10]
>   cleanup: s/info->nand\./nand_chip->
> [PATCH 8/10] <no update>
> [PATCH 9/10] cleanup: s/out_release_mem_region/return_error
> [PATCH 10/10] <new> spawned from [PATCH v9 8/9] for Kconfig updates

Otherwise, the series looks good.

Thanks,
Brian
