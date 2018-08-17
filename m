Date: Fri, 17 Aug 2018 10:46:57 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: <linux-mtd@lists.infradead.org>, Rob Herring <robh@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Liang
 Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFC PATCH v2 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20180817104657.7a1da2c4@bbrezillon>
In-Reply-To: <20180719094612.5833-3-yixun.lan@amlogic.com>
References: <20180719094612.5833-1-yixun.lan@amlogic.com>
 <20180719094612.5833-3-yixun.lan@amlogic.com>
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

Hi Yixun,

I know I said I would finish reviewing the driver, but I didn't have
time to do it, so feel free to send a new version addressing the
comments I already made.

On Thu, 19 Jul 2018 17:46:12 +0800
Yixun Lan <yixun.lan@amlogic.com> wrote:


> +static void meson_nfc_select_chip(struct mtd_info *mtd, int chip)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
> +	struct meson_nfc *nfc = nand_get_controller_data(nand);
> +
> +	if (chip < 0 || chip > MAX_CE_NUM)

			^ chip > meson_chip->nsels)

> +		return;
> +
> +	nfc->param.chip_select = meson_chip->sels[chip] ? NAND_CE1 : NAND_CE0;
> +	nfc->param.rb_select = nfc->param.chip_select;
> +}
> +

Regards,

Boris
