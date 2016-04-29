Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avxzj-0006xC-Jz
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 02:17:30 +0000
Subject: Re: [PATCH v10] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
To: Brian Norris <computersforpeace@gmail.com>
References: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
 <20160427153850.GE25981@localhost>
CC: <dwmw2@infradead.org>, <boris.brezillon@free-electrons.com>,
 <jteki@openedev.com>, <ezequiel@vanguardiasur.com.ar>,
 <juhosg@openwrt.org>, <furquan@google.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yanhaifeng@hisilicon.com>,
 <yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
 <raojun@hisilicon.com>, <ml.yang@hisilicon.com>,
 <gaofei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
 <hermit.wangheming@hisilicon.com>, <jiangheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Message-ID: <5722C340.2010602@hisilicon.com>
Date: Fri, 29 Apr 2016 10:13:20 +0800
MIME-Version: 1.0
In-Reply-To: <20160427153850.GE25981@localhost>
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

Hi Brian,

On 2016/4/27 23:38, Brian Norris wrote:
> Hi Jiancheng,
> 
> Cyrille hit on one of my concerns; if posible we'd like not to have you
> sniffing the opcodes in read_reg()/write_reg(). But let's keep the
> discussion on that thread.
> 
OK. I'll look into this issue seriously and reply on that thread later.

> Two other comments below.
> 
> On Tue, Apr 19, 2016 at 03:27:19PM +0800, Jiancheng Xue wrote:
>> From: Jiancheng Xue <xuejiancheng@huawei.com>
>>
>> Add hisilicon spi-nor flash controller driver
>>
>> Signed-off-by: Binquan Peng <pengbinquan@hisilicon.com>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
[...]
>> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
>> new file mode 100644
>> index 0000000..942dafd
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
>> @@ -0,0 +1,539 @@
> 
> [...]
> 
>> +static void hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
>> +		dma_addr_t dma_buf, size_t len, u8 op_type)
>> +{
>> +	struct hifmc_priv *priv = nor->priv;
>> +	struct hifmc_host *host = priv->host;
>> +	u8 if_type = 0, dummy = 0;
>> +	u8 w_cmd = 0, r_cmd = 0;
>> +	u32 reg;
>> +
>> +	writel(start_off, host->regbase + FMC_ADDRL);
>> +
>> +	if (op_type == FMC_OP_READ) {
>> +		if_type = get_if_type(nor->flash_read);
>> +		dummy = nor->read_dummy >> 3;
>> +		r_cmd = nor->read_opcode;
>> +	} else {
>> +		w_cmd = nor->program_opcode;
>> +	}
>> +
>> +	reg = OP_CFG_FM_CS(priv->chipselect)
>> +		| OP_CFG_MEM_IF_TYPE(if_type)
>> +		| OP_CFG_ADDR_NUM(nor->addr_width)
>> +		| OP_CFG_DUMMY_NUM(dummy);
>> +	writel(reg, host->regbase + FMC_OP_CFG);
>> +
>> +	reg = FMC_DMA_LEN_SET(len);
>> +	writel(reg, host->regbase + FMC_DMA_LEN);
>> +	writel(dma_buf, host->regbase + FMC_DMA_SADDR_D0);
>> +
>> +	reg = OP_CTRL_RD_OPCODE(r_cmd)
>> +		| OP_CTRL_WR_OPCODE(w_cmd)
>> +		| OP_CTRL_RW_OP(op_type)
>> +		| OP_CTRL_DMA_OP_READY;
>> +	writel(0xff, host->regbase + FMC_INT_CLR);
>> +	writel(reg, host->regbase + FMC_OP_DMA);
>> +	wait_op_finish(host);
> 
> Do you want to return the status here, so we can handle errors?
> 

OK. I'll fix it in v11.

>> +}
>> +
>> +static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
>> +		size_t *retlen, u_char *read_buf)
>> +{
>> +	struct hifmc_priv *priv = nor->priv;
>> +	struct hifmc_host *host = priv->host;
>> +	int offset;
>> +
>> +	/* read all bytes in only one read */
>> +	if (len <= HIFMC_DMA_MAX_LEN) {
>> +		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
>> +				len, FMC_OP_READ);
>> +		memcpy(read_buf, host->buffer, len);
> 
> Why do you have a special case for "all in one read"? This is just a
> basic loop...
> 
See below.
>> +	} else {
>> +		/* read HIFMC_DMA_MAX_LEN bytes at a time */
>> +		for (offset = 0; offset < len; offset += HIFMC_DMA_MAX_LEN) {
>> +			hisi_spi_nor_dma_transfer(nor, from + offset,
>> +				host->dma_buffer,
>> +				HIFMC_DMA_MAX_LEN, FMC_OP_READ);
>> +			memcpy(read_buf + offset,
>> +				host->buffer, HIFMC_DMA_MAX_LEN);
>> +		}
>> +		/* read remaining bytes */
>> +		offset -= HIFMC_DMA_MAX_LEN;
>> +		hisi_spi_nor_dma_transfer(nor, from + offset, host->dma_buffer,
>> +				len - offset, FMC_OP_READ);
>> +		memcpy(read_buf + offset, host->buffer, len - offset);
>> +	}
> 
> I think the entire if/else can be rewritten as:
> 
> 	for (offset = 0; offset < len; offset += HIFMC_DMA_MAX_LEN) {
> 		size_t trans = min(HIFMC_DMA_MAX_LEN, len - offset);
> 
> 		hisi_spi_nor_dma_transfer(nor, from + offset, host->dma_buffer,
> 					  trans, FMC_OP_READ);
> 		memcpy(read_buf + offset, host->buffer, trans);
> 	}
> 
I had referred to the implementation of spi_nor_write. But now it seems much
simpler and clearer above. I'll apply this code in v11. Thank you very much.

>> +	*retlen = len;
>> +
>> +	return 0;
>> +}
>> +
>> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
>> +			size_t len, size_t *retlen, const u_char *write_buf)
>> +{
>> +	struct hifmc_priv *priv = nor->priv;
>> +	struct hifmc_host *host = priv->host;
>> +
>> +	/* len is smaller than HIFMC_DMA_MAX_LEN*/
> 
> Where do you get that assumption? This function must handle whatever
> 'len' is passed to it, and that may be large. (I suspect your error is
> inspired by the fact that mtd-utils *usually* does smaller write
> transfers.)
> 
In spi_nor_write, nor->write is called with the len not bigger than nor->page_size.
I wrongly thought nor->page_size was always smaller than HIFMC_DMA_MAX_LEN.
I'll rewrite this function referring to _read function. Thank you!

Regards,
Jiancheng
