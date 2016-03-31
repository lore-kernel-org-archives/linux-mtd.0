Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alX1z-0003eI-1U
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2016 07:28:41 +0000
Subject: Re: [RESEND PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
To: <robh+dt@kernel.org>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <jteki@openedev.com>,
 <ezequiel@vanguardiasur.com.ar>, <juhosg@openwrt.org>,
 <furquan@google.com>, <marek.vasut@gmail.com>
References: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yanhaifeng@hisilicon.com>,
 <yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
 <raojun@hisilicon.com>, <ml.yang@hisilicon.com>,
 <gaofei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
 <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@huawei.com>
Message-ID: <56FCD0BD.4010505@huawei.com>
Date: Thu, 31 Mar 2016 15:24:45 +0800
MIME-Version: 1.0
In-Reply-To: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
    I'll highly appreciated any of your comments.

On 2016/3/26 16:11, Jiancheng Xue wrote:
> Add hisilicon spi-nor flash controller driver
> 
[...]
> +static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
> +		size_t *retlen, u_char *read_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	unsigned char *ptr = read_buf;
> +	size_t actual_len;
> +
> +	*retlen = 0;
> +	while (len > 0) {
> +		actual_len = (len >= HIFMC_DMA_MAX_LEN)
> +			? HIFMC_DMA_MAX_LEN : len;
> +		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
> +				actual_len, FMC_OP_READ);
> +		memcpy(ptr, host->buffer, actual_len);
> +		ptr += actual_len;
> +		from += actual_len;
> +		len -= actual_len;
> +		*retlen += actual_len;
> +	}
> +
> +	return 0;
> +}
For easy understanding, the read function will be changed like below:

static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
		size_t *retlen, u_char *read_buf)
{
	struct hifmc_priv *priv = nor->priv;
	struct hifmc_host *host = priv->host;
	int i;

	/* read all bytes in only one time */
	if (len <= HIFMC_DMA_MAX_LEN) {
		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
				len, FMC_OP_READ);
		memcpy(read_buf, host->buffer, len);
	} else {
		/* read HIFMC_DMA_MAX_LEN bytes at a time */
		for (i = 0; i < len; i += HIFMC_DMA_MAX_LEN) {
			hisi_spi_nor_dma_transfer(nor, from + i, host->dma_buffer,
				HIFMC_DMA_MAX_LEN, FMC_OP_READ);
			memcpy(read_buf + i, host->buffer, HIFMC_DMA_MAX_LEN);
		}
		/* read remaining bytes */
		i -= HIFMC_DMA_MAX_LEN;
		hisi_spi_nor_dma_transfer(nor, from + i, host->dma_buffer,
				len - i, FMC_OP_READ);
		memcpy(read_buf + i, host->buffer, len - i);
	}
	*retlen = len;

	return 0;
}

> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> +			size_t len, size_t *retlen, const u_char *write_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	const unsigned char *ptr = write_buf;
> +	size_t actual_len;
> +
> +	*retlen = 0;
> +	while (len > 0) {
> +		if (to & HIFMC_DMA_MASK)
> +			actual_len = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
> +				>= len	? len
> +				: (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));
> +		else
> +			actual_len = (len >= HIFMC_DMA_MAX_LEN)
> +				? HIFMC_DMA_MAX_LEN : len;
> +		memcpy(host->buffer, ptr, actual_len);
> +		hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, actual_len,
> +				FMC_OP_WRITE);
> +		to += actual_len;
> +		ptr += actual_len;
> +		len -= actual_len;
> +		*retlen += actual_len;
> +	}
> +}
> +
Because "len" passed from spi_nor_write is smaller than nor->page_size, and nor->page_size
is smaller than the length of host->dma_buffer. We can transfer "len" bytes data by
hisi_spi_nor_dma_transfer at one time. hisi_spi_nor_write can be simplified like below:

static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
			size_t len, size_t *retlen, const u_char *write_buf)
{
	struct hifmc_priv *priv = nor->priv;
	struct hifmc_host *host = priv->host;

	/* len is smaller than dma buffer length*/
	memcpy(host->buffer, write_buf, len);
	hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, len,
					FMC_OP_WRITE);

	*retlen = len;
}

Regards,
Jiancheng
