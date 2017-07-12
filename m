Received: from mail-pg0-x231.google.com ([2607:f8b0:400e:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dV629-0007ZV-0N
 for linux-mtd@lists.infradead.org; Wed, 12 Jul 2017 01:01:43 +0000
Received: by mail-pg0-x231.google.com with SMTP id t186so4314407pgb.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Jul 2017 18:01:19 -0700 (PDT)
Date: Tue, 11 Jul 2017 18:01:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PULL v2] mtd: nand: Changes for 4.13
Message-ID: <20170712010115.GI55942@google.com>
References: <20170703134609.0ea9cd63@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170703134609.0ea9cd63@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Thomas, as I don't really want to dig up the original patch to review
right now

On Mon, Jul 03, 2017 at 01:46:09PM +0200, Boris Brezillon wrote:
> Hi,
> 
> Here's my PR for 4.13. This v2 includes Dan's fix ("mtd: nand: mtk:
> release lock on error path").
> 
> As usual, let me know if you see any problem.
> 
> Thanks,
> 
> Boris
> 
> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> 
>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> 
> are available in the git repository at:
> 
>   ssh://git.infradead.org/srv/git/l2-mtd.git tags/nand/for-4.13

I happen to have SSH access to that repository :) but a
publicly-readable link is usually a better idea, in the highly unlikely
case that someone else wants to review your pull request.

> for you to fetch changes up to 81667e9c8ad827365f2d1e8b924caf062a19c593:
> 
>   mtd: nand: mtk: release lock on error path (2017-07-03 13:39:09 +0200)
> 
> ----------------------------------------------------------------
> This pull request contains the following core changes:
> 
> * addition of on-ecc support to Micron driver

This still works by overriding chip->ecc.{read,write}_page{,_raw}()
callbacks... I never liked that, and there have been multiple
submissions that tried this already, IIRC. It's for sure not going to
work with at least one in-tree driver (brcmnand); I suspect others
(qcom_nand? mtk_nand?). Can this be improved to either bail out when
this clobbers a controller's existing callback, or even better, to
utilize a controller's existing _raw() implementation, instead of
assuming it can use the nand_base defaults?

The latter seems difficult to do in time for this merge, but maybe the
former can be done within the release?

I'm still tempted to pull this, since at least it does require somebody
to opt in via the device tree binding. So they should probably make sure
it works with their driver before using it.

> * addition of helpers to help drivers choose most appropriate ECC
>   settings
> * deletion of dead-code (cached programming and ->errstat() hook)
> * make sure drivers that do not support the SET/GET FEATURES command
>   return ENOTSUPP use a dummy ->set/get_features implementation
>   returning -ENOTSUPP (required for Micron on-die ECC)
> * change the semantic of ecc->write_page() for drivers setting the
>   NAND_ECC_CUSTOM_PAGE_ACCESS flag
> * support exiting 'GET STATUS' command in default ->cmdfunc()
>   implementations
> * change the prototype of ->setup_data_interface()
> 
> A bunch of driver related changes:
> 
> * various cleanup, fixes and improvements of the MTK driver
> * OMAP DT bindings fixes
> * support for ->setup_data_interface() in the fsmc driver
> * support for imx7 in the gpmi driver
> * finalization of the denali driver rework (thanks to Masahiro for the
>   work he's done on this driver)
> * fix "bitflips in erased pages" handling in the ifc driver
> * addition of PM ops and dynamic timing configuration to the atmel
>   driver
> 
> And as usual we also have a few minor cleanup/fixes/improvements
> patches across the subsystem.
> 

Brian
