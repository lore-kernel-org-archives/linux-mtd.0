Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0Dxo-0004ua-V5
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 20:41:22 +0000
Subject: Re: [PULL v2] mtd: nand: Fixes for 4.9-rc3
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
References: <20161028102649.7b90e308@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f88ccae7-58f2-d86d-200a-0cf8cf642cc7@denx.de>
Date: Fri, 28 Oct 2016 22:25:34 +0200
MIME-Version: 1.0
In-Reply-To: <20161028102649.7b90e308@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/28/2016 10:26 AM, Boris Brezillon wrote:
> Hi Brian,

Hi,

> Here is the PR I was mentioning yesterday.
> As usual, let me know if you find something weird in this PR, and I'll
> fix it.
> 
> Thanks,
> 
> Boris
> 
> The following changes since commit 07d9a380680d1c0eb51ef87ff2eab5c994949e69:
> 
>   Linux 4.9-rc2 (2016-10-23 17:10:14 -0700)
> 
> are available in the git repository at:
> 
>   git@github.com:linux-nand/linux.git tags/nand/fixes-for-4.9-rc3
> 
> for you to fetch changes up to 8ff0513bdcdd71e84aa561cce216675d43fb41b8:
> 
>   mtd: mtk: avoid warning in mtk_ecc_encode (2016-10-28 10:21:23 +0200)
> 
> ----------------------------------------------------------------
> Three simple fixes:
> 
> - the first one is fixing a non-critical bug in the gpmi driver
> - the second one is fixing a bug in the 'automatic NAND timings
>   selection' feature introduced in 4.9-rc1
> - the last one is fixing a false positive uninitialized-var warning
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       mtd: mtk: avoid warning in mtk_ecc_encode
> 
> Boris Brezillon (1):
>       mtd: nand: Fix data interface configuration logic
> 
> Fabio Estevam (1):
>       mtd: nand: gpmi: disable the clocks on errors
> 
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c |  6 ++++--
>  drivers/mtd/nand/mtk_ecc.c            | 19 +++++++++----------
>  drivers/mtd/nand/nand_base.c          | 60 ++++++++++++++++++++++++++++++++++++++++++------------------
>  include/linux/mtd/nand.h              |  2 +-
>  4 files changed, 56 insertions(+), 31 deletions(-)
> 

I saw all those patches, so:

Acked-by: Marek Vasut <marex@denx.de>

-- 
Best regards,
Marek Vasut
