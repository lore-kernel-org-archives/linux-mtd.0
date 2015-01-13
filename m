Date: Mon, 12 Jan 2015 20:02:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v6 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Message-ID: <20150113040254.GK9759@ld-irv-0074>
References: <1421047734-30818-1-git-send-email-wangzhou1@hisilicon.com>
 <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com>
Cc: devicetree@vger.kernel.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com,
 linux-mtd@lists.infradead.org, haojian.zhuang@gmail.com, caizhiyong@huawei.com,
 yubingxu@hisilicon.com, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One more thing:

On Mon, Jan 12, 2015 at 03:28:53PM +0800, Zhou Wang wrote:
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
> new file mode 100644
> index 0000000..2000f21
> --- /dev/null
> +++ b/drivers/mtd/nand/hisi504_nand.c
...
> +static int hisi_nand_read_page_hwecc(struct mtd_info *mtd,
> +	struct nand_chip *chip, uint8_t *buf, int oob_required, int page)
> +{
> +	struct hinfc_host *host = chip->priv;
> +	int max_bitflips = 0, stat = 0, stat_max, status_ecc;

    drivers/mtd/nand/hisi504_nand.c:547:34: warning: ‘stat_max’ may be used uninitialized in this function [-Wmaybe-uninitialized]
      int max_bitflips = 0, stat = 0, stat_max, status_ecc;
                                      ^

> +	int stat_1, stat_2;
> +
> +	chip->read_buf(mtd, buf, mtd->writesize);
> +	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +
> +	/* errors which can not be corrected by ECC */
> +	if (host->irq_status & HINFC504_INTS_UE) {
> +		mtd->ecc_stats.failed++;
> +	} else if (host->irq_status & HINFC504_INTS_CE) {
> +		/* TODO: need add other ECC modes! */

You may want a 'default' case that sets stat_max to zero, then.

> +		switch (chip->ecc.strength) {
> +		case 1:
> +			stat = hweight8(hinfc_read(host, HINFC504_ECC_STATUS)>>
> +						HINFC504_ECC_1_BIT_SHIFT);
> +			stat_max = 1;
> +			break;
> +		case 16:
> +			status_ecc = hinfc_read(host, HINFC504_ECC_STATUS) >>
> +					HINFC504_ECC_16_BIT_SHIFT & 0x0fff;
> +			stat_2 = status_ecc & 0x3f;
> +			stat_1 = status_ecc >> 6 & 0x3f;
> +			stat = stat_1 + stat_2;
> +			stat_max = max_t(int, stat_1, stat_2);
> +		}
> +		mtd->ecc_stats.corrected += stat;
> +		max_bitflips = max_t(int, max_bitflips, stat_max);
> +	}
> +	host->irq_status = 0;
> +
> +	return max_bitflips;
> +}

Brian
