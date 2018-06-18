Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUvdl-0002t3-C1
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 15:00:27 +0000
Date: Mon, 18 Jun 2018 17:00:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Arnout Vandecapelle <arnout@mind.be>,
 Dries Staelens <dries.staelens@barco.com>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 07/13] mtd: rawnand: gpmi: set aggregate ready/busy
 signalling
Message-ID: <20180618170008.791d1b1b@xps13>
In-Reply-To: <20180426154134.8270-8-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
 <20180426154134.8270-8-sam.lefebvre@essensium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Han,

Could we have your input on this patch, please?

On Thu, 26 Apr 2018 17:41:28 +0200, Sam Lefebvre
<sam.lefebvre@essensium.com> wrote:

> The GPMI block by default decouples the ready/busy signal (which is
> shared between all chip-selects) to separate internal signals per
> chip-select. However, since the gpmi-nand driver uses DMA0 for all
> chip-selects, DMA transfers will not be able to see the ready/busy
> status for any chip-select other than 0.
>=20
> Currently, this happens to work because nand_command() ends with an
> explicit nand_wait_ready() and the driver only sets up a single command
> in a DMA chain. nand_wait_ready() polls for the chip-select specific
> ready/busy status bit. Future patches, however, will set up a DMA chain
> with several commands, so these will have to wait correctly in the DMA
> chain itself.
>=20
> To fix this, set the GANGED_RDYBUSY bit in the control1 register. This
> ties all internal ready/busy signals together, so DMA0 will also see
> the ready/busy status of chip selects 1-2-3. It's a bit silly that this
> isn't implied in hardware by the DECOUPLE_CS bit.
>=20
> Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Han Xu <han.xu@nxp.com>
> ---
> Tested on an i.MX6Q with two identical chips on CS0 and CS1.
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 3 +++
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand=
/raw/gpmi-nand/gpmi-lib.c
> index 83697b8df871..1858afdb400d 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> @@ -193,6 +193,9 @@ int gpmi_init(struct gpmi_nand_data *this)
>  	 */
>  	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
> =20
> +	/* Aggregate ready busy signalling. */
> +	writel(BM_GPMI_CTRL1_GANGED_RDYBUSY, r->gpmi_regs + HW_GPMI_CTRL1_SET);
> +
>  	gpmi_disable_clk(this);
>  	return 0;
>  err_out:
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-regs.h
> index d92bf32221ca..e341802c90ac 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
> @@ -120,6 +120,7 @@
>  #define BV_GPMI_CTRL1_WRN_DLY_SEL_7_TO_12NS		0x2
>  #define BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY		0x3
> =20
> +#define BM_GPMI_CTRL1_GANGED_RDYBUSY		(1 << 19)
>  #define BM_GPMI_CTRL1_BCH_MODE				(1 << 18)
> =20
>  #define BP_GPMI_CTRL1_DLL_ENABLE			17

Thanks,
Miqu=C3=A8l
