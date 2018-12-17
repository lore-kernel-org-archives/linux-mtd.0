Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYtlv-0004Tb-7E
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 14:21:31 +0000
Date: Mon, 17 Dec 2018 15:21:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: Write pageprog related opcodes to
 WCMD_SET
Message-ID: <20181217152105.2577c262@xps13>
In-Reply-To: <20181216083417.19100-1-boris.brezillon@bootlin.com>
References: <20181216083417.19100-1-boris.brezillon@bootlin.com>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Sun, 16 Dec 2018
09:34:17 +0100:

> The opcodes used by the controller when doing batched page prog should
> be written in NFC_REG_WCMD_SET not FC_REG_RCMD_SET. Luckily, the
> default NFC_REG_WCMD_SET value matches the one we set in the driver
> which explains why we didn't notice the problem.
>=20
> Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted oper=
ations")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index a5c83cbe4897..e828ee50a201 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1393,7 +1393,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct n=
and_chip *chip,
>  	sunxi_nfc_randomizer_enable(mtd);
> =20
>  	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
> -	       nfc->regs + NFC_REG_RCMD_SET);
> +	       nfc->regs + NFC_REG_WCMD_SET);
> =20
>  	dma_async_issue_pending(nfc->dmac);
> =20

Applied to nand/next.


Thanks,
Miqu=C3=A8l
