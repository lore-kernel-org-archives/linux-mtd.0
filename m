Date: Sat, 21 Jul 2018 19:48:29 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu
 <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans
 Rullgard <mans@mansr.com>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 19/35] mtd: rawnand: sh_flctl: move all NAND chip
 related setup in one function
Message-ID: <20180721194829.44e9b29f@bbrezillon>
In-Reply-To: <20180720151527.16038-20-miquel.raynal@bootlin.com>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-20-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 Jul 2018 17:15:11 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> @@ -1007,6 +1007,16 @@ static int flctl_chip_init_tail(struct mtd_info *mtd)
>  	struct sh_flctl *flctl = mtd_to_flctl(mtd);
>  	struct nand_chip *chip = &flctl->chip;
>  
> +	if (chip->options & NAND_BUSWIDTH_16) {
> +		/*
> +		 * NAND_BUSWIDTH_16 may have been set by nand_scan_ident().
> +		 * Add the SEL_16BIT flag in pdata->flcmncr_val and re-assign
> +		 * flctl->flcmncr_base to pdata->flcmncr_val.
> +		 */
> +		flctl->pdata->flcmncr_val |= SEL_16BIT;
> +		flctl->flcmncr_base = flctl->pdata->flcmncr_val;

pdata->flcmncr_val is not used after this point. I think you can just do

		flctl->flcmncr_base |= SEL_16BIT;

and get rid of the ftcl->pdata field you add in this patch.

> +	}
> +
