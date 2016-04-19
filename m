Date: Tue, 19 Apr 2016 22:24:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160419222446.052cfa63@bbrezillon>
In-Reply-To: <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

On Mon, 11 Apr 2016 12:56:12 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:


> +static int mtk_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +				int page)
> +{
> +	u8 *buf = chip->buffers->databuf;

You're touching ->databuf here, and the core uses this buffer for its
internal cache. If want to use this buffer you have to invalidate the
cache by setting chip->pagebuf to -1 first.

> +	struct mtd_ecc_stats stats;
> +	int ret;
> +
> +	stats = mtd->ecc_stats;
> +
> +	memset(buf, 0xff, mtd->writesize);
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +
> +	ret = mtk_nfc_read_page_hwecc(mtd, chip, buf, 1, page);
> +
> +	/* mark as invalid data 0x00 if UECC happens */
> +	if ((mtd->ecc_stats.failed - stats.failed) > 0)
> +		memset(chip->oob_poi, 0, mtd->oobsize);
> +
> +	if (ret < mtd->bitflip_threshold)
> +		mtd->ecc_stats.corrected = stats.corrected;
> +
> +	return ret;
> +}


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
