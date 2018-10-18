Date: Thu, 18 Oct 2018 22:34:26 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: <linux-mtd@lists.infradead.org>, Liang Yang <liang.yang@amlogic.com>,
 Yixun Lan <yixun.lan@amlogic.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet
 <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione
 <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
 <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin
 <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20181018223426.5bfa23a1@bbrezillon>
In-Reply-To: <1539839345-14021-3-git-send-email-jianxin.pan@amlogic.com>
References: <1539839345-14021-1-git-send-email-jianxin.pan@amlogic.com>
 <1539839345-14021-3-git-send-email-jianxin.pan@amlogic.com>
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

On Thu, 18 Oct 2018 13:09:05 +0800
Jianxin Pan <jianxin.pan@amlogic.com> wrote:

> +static int meson_nand_bch_mode(struct nand_chip *nand)
> +{
> +	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
> +	struct meson_nand_ecc meson_ecc[] = {
> +		MESON_ECC_DATA(NFC_ECC_BCH8_1K, 8),
> +		MESON_ECC_DATA(NFC_ECC_BCH24_1K, 24),
> +		MESON_ECC_DATA(NFC_ECC_BCH30_1K, 30),
> +		MESON_ECC_DATA(NFC_ECC_BCH40_1K, 40),
> +		MESON_ECC_DATA(NFC_ECC_BCH50_1K, 50),
> +		MESON_ECC_DATA(NFC_ECC_BCH60_1K, 60),
> +	};
> +	int i, ret = 0;
> +
> +	if (nand->ecc.strength > 60 || nand->ecc.strength < 8)
> +		return -EINVAL;
> +
> +	for (i = 0; i < sizeof(meson_ecc); i++) {
> +		if (meson_ecc[i].strength == nand->ecc.strength) {
> +			meson_chip->bch_mode = meson_ecc[i].bch;
> +			break;

			return 0;

> +		}
> +	}
> +
> +	return ret;

	return -EINVAL;

> +}
