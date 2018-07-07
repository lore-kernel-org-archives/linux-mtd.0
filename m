Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbpS9-0003XC-Ey
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 15:48:55 +0000
Date: Sat, 7 Jul 2018 17:48:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: robert.jarzmik@free.fr, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mtd: rawnand: marvell: add suspend and resume hooks
Message-ID: <20180707174839.3cd1e191@xps13>
In-Reply-To: <20180707064631.799-1-daniel@zonque.org>
References: <20180707064631.799-1-daniel@zonque.org>
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

Hi Daniel,

Daniel Mack <daniel@zonque.org> wrote on Sat,  7 Jul 2018 08:46:29
+0200:

> This patch restores the suspend and resume hooks that the old driver used
> to have. Apart from stopping and starting the clocks, the resume callback
> also nullifies the selected_chip pointer, so the next command that is iss=
ued
> will re-select the chip and thereby restore the timing registers.
>=20
> Without this patch, a PXA3xx based system would cough up an error similar=
 to
> the one below after resume.
>=20
> [   44.660162] marvell-nfc 43100000.nand-controller: Timeout waiting for =
 RB signal
> [   44.671492] ubi0 error: ubi_io_write: error -110 while writing 2048 by=
tes to PEB 102:38912, written 0 bytes
> [   44.682887] CPU: 0 PID: 1417 Comm: remote-control Not tainted 4.18.0-r=
c2+ #344
> [   44.691197] Hardware name: Marvell PXA3xx (Device Tree Support)
> [   44.697111] Backtrace:
> [   44.699593] [<c0106458>] (dump_backtrace) from [<c0106718>] (show_stac=
k+0x18/0x1c)
> [   44.708931]  r7:00000800 r6:00009800 r5:00000066 r4:c6139000
> [   44.715833] [<c0106700>] (show_stack) from [<c0678a60>] (dump_stack+0x=
20/0x28)
> [   44.724206] [<c0678a40>] (dump_stack) from [<c0456cbc>] (ubi_io_write+=
0x3d4/0x630)
> [   44.732925] [<c04568e8>] (ubi_io_write) from [<c0454428>] (ubi_eba_wri=
te_leb+0x690/0x6fc)
> ...
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller dri=
ver")
> Cc: stable@vger.kernel.org
> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 49 +++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c
> index 00d9f29bbdb6..4644f6e3b930 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2825,6 +2825,54 @@ static int marvell_nfc_remove(struct platform_devi=
ce *pdev)
>  	return 0;
>  }
> =20
> +static int __maybe_unused marvell_nfc_suspend(struct device *dev)
> +{
> +	struct marvell_nfc *nfc =3D dev_get_drvdata(dev);
> +	struct marvell_nand_chip *chip;
> +
> +	list_for_each_entry(chip, &nfc->chips, node)
> +		marvell_nfc_wait_ndrun(&chip->chip);
> +
> +	clk_disable_unprepare(nfc->reg_clk);
> +	clk_disable_unprepare(nfc->core_clk);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused marvell_nfc_resume(struct device *dev)
> +{
> +	struct marvell_nfc *nfc =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(nfc->core_clk);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!IS_ERR(nfc->reg_clk)) {
> +		ret =3D clk_prepare_enable(nfc->reg_clk);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Reset nfc->selected_chip so the next command will cause the timing
> +	 * registers to be restored in marvell_nfc_select_chip().
> +	 */
> +	nfc->selected_chip =3D NULL;
> +
> +	/* Reset registers that have lots its contents */

s/lots its contents/lost their content/

> +	writel_relaxed(NDCR_ALL_INT | NDCR_ND_ARB_EN | NDCR_SPARE_EN |
> +		       NDCR_RD_ID_CNT(NFCV1_READID_LEN), nfc->regs + NDCR);
> +	writel_relaxed(0xFFFFFFFF, nfc->regs + NDSR);
> +	writel_relaxed(0, nfc->regs + NDECCCTRL);

This is an exact copy of a few lines from marvell_nfc_init().
What about creating an helper called
marvell_nfc_init_core_registers(nfc) that would be called twice?

Thanks,
Miqu=C3=A8l
