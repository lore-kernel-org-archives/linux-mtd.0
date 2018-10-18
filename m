Date: Thu, 18 Oct 2018 22:50:09 +0200
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
Message-ID: <20181018225009.59d94aee@bbrezillon>
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

> +static int meson_nfc_buffer_init(struct mtd_info *mtd)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct meson_nfc *nfc = nand_get_controller_data(nand);
> +	static int max_page_bytes, max_info_bytes;
> +	int page_bytes, info_bytes;
> +	int nsectors;
> +
> +	nsectors = mtd->writesize / nand->ecc.size;
> +	page_bytes =  mtd->writesize + mtd->oobsize;
> +	info_bytes = nsectors * PER_INFO_BYTE;
> +
> +	if (nfc->data_buf && nfc->info_buf) {
> +		if (max_page_bytes < page_bytes)
> +			meson_nfc_free_buffer(nfc);
> +		else
> +			return 0;
> +	}
> +
> +	max_page_bytes = max_t(int, max_page_bytes, page_bytes);
> +	max_info_bytes = max_t(int, max_info_bytes, info_bytes);
> +
> +	nfc->data_buf = kmalloc(max_page_bytes, GFP_KERNEL);

Is there a good reason for not using chip->data_buf and allocating a
new buffer here?

> +	if (!nfc->data_buf)
> +		return -ENOMEM;
> +
> +	nfc->info_buf = kmalloc(max_info_bytes, GFP_KERNEL);
> +	if (!nfc->info_buf) {
> +		kfree(nfc->data_buf);
> +		return -ENOMEM;
> +	}

I'd recommend moving this info_buf in the priv chip struct, otherwise
you'll have to protect nfc->info_buf with a lock to prevent an already
register chip from using this pointer while you're reallocating the
buffer. Also, I think you have a memleak here.

> +
> +	return 0;
> +}
