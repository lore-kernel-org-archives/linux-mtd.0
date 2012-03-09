Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137])
 by casper.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5wYV-0007wo-Fg
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:56:13 +0000
Message-ID: <4F59D390.3090108@st.com>
Date: Fri, 9 Mar 2012 15:25:28 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Vipin KUMAR <vipin.kumar@st.com>
Subject: Re: [PATCH 18/18] fsmc/nand: Add DMA support
References: <cover.1331119143.git.vipin.kumar@st.com>
 <b35532ebcf4ae0c89dd4c8e9834829104b5cdb37.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <b35532ebcf4ae0c89dd4c8e9834829104b5cdb37.1331119143.git.vipin.kumar@st.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vinod Koul <vinod.koul@intel.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sending the patch to Vinod and Dan as suggested by linus
Regards
Vipin

On 3/7/2012 5:01 PM, Vipin KUMAR wrote:
> The fsmc_nand driver uses cpu to read/write onto the device. This is inefficient
> because of two reasons
> - the cpu gets locked on AHB bus while reading from NAND
> - the cpu is unnecessarily used when dma can do the job
>
> This patch adds the support for accessing the device through DMA
>
> Signed-off-by: Vipin Kumar<vipin.kumar@st.com>
> Reviewed-by: Viresh Kumar<viresh.kumar@st.com>
> ---
>   drivers/mtd/nand/fsmc_nand.c |  173 ++++++++++++++++++++++++++++++++++++++++-
>   include/linux/mtd/fsmc.h     |    4 +
>   2 files changed, 172 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> index 3828279..5cc79bc 100644
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -17,6 +17,10 @@
>    */
>
>   #include<linux/clk.h>
> +#include<linux/completion.h>
> +#include<linux/dmaengine.h>
> +#include<linux/dma-direction.h>
> +#include<linux/dma-mapping.h>
>   #include<linux/err.h>
>   #include<linux/init.h>
>   #include<linux/module.h>
> @@ -452,6 +456,11 @@ static struct mtd_partition partition_info_2048KB_blk[] = {
>    * @bank:		Bank number for probed device.
>    * @clk:		Clock structure for FSMC.
>    *
> + * @read_dma_chan:	DMA channel for read access
> + * @write_dma_chan:	DMA channel for write access to NAND
> + * @dma_access_complete: Completion structure
> + *
> + * @data_pa:		NAND Physical port for Data.
>    * @data_va:		NAND port for Data.
>    * @cmd_va:		NAND port for Command.
>    * @addr_va:		NAND port for Address.
> @@ -465,10 +474,17 @@ struct fsmc_nand_data {
>   	struct fsmc_eccplace	*ecc_place;
>   	unsigned int		bank;
>   	struct device		*dev;
> +	enum access_mode	mode;
>   	struct clk		*clk;
>
> +	/* DMA related objects */
> +	struct dma_chan		*read_dma_chan;
> +	struct dma_chan		*write_dma_chan;
> +	struct completion	dma_access_complete;
> +
>   	struct fsmc_nand_timings *dev_timings;
>
> +	dma_addr_t		data_pa;
>   	void __iomem		*data_va;
>   	void __iomem		*cmd_va;
>   	void __iomem		*addr_va;
> @@ -691,6 +707,82 @@ static int count_written_bits(uint8_t *buff, int size, int max_bits)
>   	return written_bits;
>   }
>
> +static void dma_complete(void *param)
> +{
> +	struct fsmc_nand_data *host = param;
> +
> +	complete(&host->dma_access_complete);
> +}
> +
> +static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
> +		enum dma_data_direction direction)
> +{
> +	struct dma_chan *chan;
> +	struct dma_device *dma_dev;
> +	struct dma_async_tx_descriptor *tx;
> +	dma_addr_t dma_dst, dma_src, dma_addr;
> +	dma_cookie_t cookie;
> +	unsigned long flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
> +	int ret;
> +
> +	if (direction == DMA_TO_DEVICE)
> +		chan = host->write_dma_chan;
> +	else if (direction == DMA_FROM_DEVICE)
> +		chan = host->read_dma_chan;
> +	else
> +		return -EINVAL;
> +
> +	dma_dev = chan->device;
> +	dma_addr = dma_map_single(dma_dev->dev, buffer, len, direction);
> +
> +	if (direction == DMA_TO_DEVICE) {
> +		dma_src = dma_addr;
> +		dma_dst = host->data_pa;
> +		flags |= DMA_COMPL_SRC_UNMAP_SINGLE | DMA_COMPL_SKIP_DEST_UNMAP;
> +	} else {
> +		dma_src = host->data_pa;
> +		dma_dst = dma_addr;
> +		flags |= DMA_COMPL_DEST_UNMAP_SINGLE | DMA_COMPL_SKIP_SRC_UNMAP;
> +	}
> +
> +	tx = dma_dev->device_prep_dma_memcpy(chan, dma_dst, dma_src,
> +			len, flags);
> +
> +	if (!tx) {
> +		dev_err(host->dev, "device_prep_dma_memcpy error\n");
> +		dma_unmap_single(dma_dev->dev, dma_addr, len, direction);
> +		return -EIO;
> +	}
> +
> +	tx->callback = dma_complete;
> +	tx->callback_param = host;
> +	cookie = tx->tx_submit(tx);
> +
> +	ret = dma_submit_error(cookie);
> +	if (ret) {
> +		dev_err(host->dev, "dma_submit_error %d\n", cookie);
> +		return ret;
> +	}
> +
> +	dma_async_issue_pending(chan);
> +
> +	ret =
> +	wait_for_completion_interruptible_timeout(&host->dma_access_complete,
> +				msecs_to_jiffies(3000));
> +	if (ret<= 0) {
> +		chan->device->device_control(chan, DMA_TERMINATE_ALL, 0);
> +		dev_err(host->dev, "wait_for_completion_timeout\n");
> +		return ret ? ret : -ETIMEDOUT;
> +	}
> +
> +	preempt_disable();
> +	__this_cpu_add(chan->local->bytes_transferred, len);
> +	__this_cpu_inc(chan->local->memcpy_count);
> +	preempt_enable();
> +
> +	return 0;
> +}
> +
>   /*
>    * fsmc_write_buf - write buffer to chip
>    * @mtd:	MTD device structure
> @@ -738,6 +830,35 @@ static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>   }
>
>   /*
> + * fsmc_read_buf_dma - read chip data into buffer
> + * @mtd:	MTD device structure
> + * @buf:	buffer to store date
> + * @len:	number of bytes to read
> + */
> +static void fsmc_read_buf_dma(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	struct fsmc_nand_data *host;
> +
> +	host = container_of(mtd, struct fsmc_nand_data, mtd);
> +	dma_xfer(host, buf, len, DMA_FROM_DEVICE);
> +}
> +
> +/*
> + * fsmc_write_buf_dma - write buffer to chip
> + * @mtd:	MTD device structure
> + * @buf:	data buffer
> + * @len:	number of bytes to write
> + */
> +static void fsmc_write_buf_dma(struct mtd_info *mtd, const uint8_t *buf,
> +		int len)
> +{
> +	struct fsmc_nand_data *host;
> +
> +	host = container_of(mtd, struct fsmc_nand_data, mtd);
> +	dma_xfer(host, (void *)buf, len, DMA_TO_DEVICE);
> +}
> +
> +/*
>    * fsmc_read_page_hwecc
>    * @mtd:	mtd info structure
>    * @chip:	nand chip info structure
> @@ -899,6 +1020,12 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
>   	return i;
>   }
>
> +static bool filter(struct dma_chan *chan, void *slave)
> +{
> +	chan->private = slave;
> +	return true;
> +}
> +
>   /*
>    * fsmc_nand_probe - Probe function
>    * @pdev:       platform device structure
> @@ -912,6 +1039,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>   	struct fsmc_regs *regs;
>   	struct resource *res;
>   	struct mtd_partition *parts;
> +	dma_cap_mask_t mask;
>   	int nr_parts;
>   	int ret = 0;
>   	u32 pid;
> @@ -939,6 +1067,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>   		return -ENOENT;
>   	}
>
> +	host->data_pa = (dma_addr_t)res->start;
>   	host->data_va = devm_ioremap(&pdev->dev, res->start,
>   			resource_size(res));
>   	if (!host->data_va) {
> @@ -1015,6 +1144,11 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>   	host->select_chip = pdata->select_bank;
>   	host->dev =&pdev->dev;
>   	host->dev_timings = pdata->nand_timings;
> +	host->mode = pdata->mode;
> +
> +	if (host->mode == USE_DMA_ACCESS)
> +		init_completion(&host->dma_access_complete);
> +
>   	regs = host->regs_va;
>
>   	/* Link all private pointers */
> @@ -1039,13 +1173,31 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>   	if (pdata->width == FSMC_NAND_BW16)
>   		nand->options |= NAND_BUSWIDTH_16;
>
> -	/*
> -	 * use customized (word by word) version of read_buf, write_buf if
> -	 * access_with_dev_width is reset supported
> -	 */
> -	if (pdata->mode == USE_WORD_ACCESS) {
> +	switch (host->mode) {
> +	case USE_DMA_ACCESS:
> +		dma_cap_zero(mask);
> +		dma_cap_set(DMA_MEMCPY, mask);
> +		host->read_dma_chan = dma_request_channel(mask, filter,
> +				pdata->read_dma_priv);
> +		if (!host->read_dma_chan) {
> +			dev_err(&pdev->dev, "Unable to get read dma channel\n");
> +			goto err_req_read_chnl;
> +		}
> +		host->write_dma_chan = dma_request_channel(mask, filter,
> +				pdata->write_dma_priv);
> +		if (!host->write_dma_chan) {
> +			dev_err(&pdev->dev, "Unable to get write dma channel\n");
> +			goto err_req_write_chnl;
> +		}
> +		nand->read_buf = fsmc_read_buf_dma;
> +		nand->write_buf = fsmc_write_buf_dma;
> +		break;
> +
> +	default:
> +	case USE_WORD_ACCESS:
>   		nand->read_buf = fsmc_read_buf;
>   		nand->write_buf = fsmc_write_buf;
> +		break;
>   	}
>
>   	fsmc_nand_setup(regs, host->bank, nand->options&  NAND_BUSWIDTH_16,
> @@ -1177,6 +1329,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>
>   err_probe:
>   err_scan_ident:
> +	if (host->mode == USE_DMA_ACCESS)
> +		dma_release_channel(host->write_dma_chan);
> +err_req_write_chnl:
> +	if (host->mode == USE_DMA_ACCESS)
> +		dma_release_channel(host->read_dma_chan);
> +err_req_read_chnl:
>   	clk_disable(host->clk);
>   err_clk_enable:
>   	clk_put(host->clk);
> @@ -1194,6 +1352,11 @@ static int fsmc_nand_remove(struct platform_device *pdev)
>
>   	if (host) {
>   		nand_release(&host->mtd);
> +
> +		if (host->mode == USE_DMA_ACCESS) {
> +			dma_release_channel(host->write_dma_chan);
> +			dma_release_channel(host->read_dma_chan);
> +		}
>   		clk_disable(host->clk);
>   		clk_put(host->clk);
>   	}
> diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
> index 1edd2b3..18f9127 100644
> --- a/include/linux/mtd/fsmc.h
> +++ b/include/linux/mtd/fsmc.h
> @@ -172,6 +172,10 @@ struct fsmc_nand_platform_data {
>   	enum access_mode	mode;
>
>   	void			(*select_bank)(uint32_t bank, uint32_t busw);
> +
> +	/* priv structures for dma accesses */
> +	void			*read_dma_priv;
> +	void			*write_dma_priv;
>   };
>
>   extern int __init fsmc_nor_init(struct platform_device *pdev,
