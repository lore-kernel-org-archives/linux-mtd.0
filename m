Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0I41-0004Pm-Eo
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 15:55:31 +0000
Date: Thu, 13 Nov 2008 00:55:34 +0900 (JST)
Message-Id: <20081113.005534.56563769.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Nov 2008 23:57:33 +0900 (JST), Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> The mtd partition parser returns an allocated pointer array of
> mtd_partition.  The caller must free it.  The array is used only for
> add_mtd_partitions(), so free it just after the call.
> 
> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> ---
>  drivers/mtd/maps/physmap.c |   17 ++++++++---------
>  1 files changed, 8 insertions(+), 9 deletions(-)

And many other callers of parse_mtd_partitions() also do not free the
returned memory.  With a quick look, 21 of 36 have same defect.

drivers/mtd/devices/m25p80.c
drivers/mtd/devices/mtd_dataflash.c
drivers/mtd/maps/bfin-async-flash.c
drivers/mtd/maps/edb7312.c
drivers/mtd/maps/impa7.c
drivers/mtd/maps/intel_vr_nor.c
drivers/mtd/maps/solutionengine.c
drivers/mtd/nand/atmel_nand.c
drivers/mtd/nand/cafe_nand.c
drivers/mtd/nand/cmx270_nand.c
drivers/mtd/nand/cs553x_nand.c
drivers/mtd/nand/edb7312.c
drivers/mtd/nand/fsl_elbc_nand.c
drivers/mtd/nand/fsl_upm.c
drivers/mtd/nand/mxc_nand.c
drivers/mtd/nand/orion_nand.c
drivers/mtd/nand/ppchameleonevb.c
drivers/mtd/nand/sharpsl.c
drivers/mtd/nand/tmio_nand.c
drivers/mtd/nand/ts7250.c
drivers/mtd/onenand/generic.c

Volunteers? ;)

---
Atsushi Nemoto
