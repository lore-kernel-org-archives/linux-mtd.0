Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adDxY-0001h6-BG
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 09:29:46 +0000
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
To: Brian Norris <computersforpeace@gmail.com>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
 <20160307225229.GC55664@google.com>
CC: <robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
 <dwmw2@infradead.org>, <zajec5@gmail.com>,
 <boris.brezillon@free-electrons.com>, <jteki@openedev.com>,
 <ezequiel@vanguardiasur.com.ar>, <juhosg@openwrt.org>,
 <shijie.huang@intel.com>, <mika.westerberg@linux.intel.com>,
 <furquan@google.com>, <han.xu@freescale.com>,
 <fabio.estevam@freescale.com>, <manabian@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yanhaifeng@hisilicon.com>,
 <yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
 <raojun@hisilicon.com>, <ml.yang@hisilicon.com>,
 <gaofei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
 <xuejiancheng@hisilicon.com>, Binquan Peng <pengbinquan@huawei.com>
From: Jiancheng Xue <xuejiancheng@huawei.com>
Message-ID: <56DE9A79.30704@huawei.com>
Date: Tue, 8 Mar 2016 17:25:13 +0800
MIME-Version: 1.0
In-Reply-To: <20160307225229.GC55664@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian，
   Thank you very much for your comments.

On 2016/3/8 6:52, Brian Norris wrote:
[...]
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>> new file mode 100644
>> index 0000000..7407147
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> 
> This is not a SPI controller (or is it? it looks like a SPI NOR
> controller that doesn't do generic SPI), so it shouldn't go in the spi/
> directory.
> 
OK. I'll move this file into Documentation/devicetree/bindings/mtd.

>> @@ -0,0 +1,25 @@
>> +HiSilicon SPI-NOR Flash Controller
>> +
>> +Required properties:
>> +- compatible : Should be "hisilicon,hisi-sfc" and one of the following strings:
>> +		"hisilicon,hi3519-sfc"
>> +- address-cells : number of cells required to define a chip select
>> +        address on the SPI bus. Should be set to 1. See spi-bus.txt.
> 
> This is not exactly a typical SPI bus, though I suppose some of that
> documentation could apply...
> 

OK. I'll modify the description.

[...]
>> +static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
>> +		int len)
>> +{
>> +	struct hifmc_priv *priv = nor->priv;
>> +	struct hifmc_host *host = priv->host;
>> +	int ret;
>> +
>> +	ret = hisi_spi_nor_send_cmd(nor, opcode, len);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memcpy(buf, host->iobase, len);
> 
> sparse doesn't like any of these memcpy()'s, since that's __iomem. Are
> you sure you want a regular memcpy here, and elsewhere?
> 
It's not a must to use memcpy though host->iobase represents a segment of inner memory
which stores data from flash device byte by byte.  I will give up using memcpy here and
hisi_spi_nor_write_reg() in next version. Thank you!

>> +
>> +	return 0;
>> +}
>> +
[...]
>> +static void hisi_spi_nor_dma_transfer(struct spi_nor *nor, u32 start_off,
>> +		u32 dma_buf, u32 len, u8 op_type)
> 
> Does this controller support 64-bit addresses? What if you see LPAE, or
> an ARM64 CPU? It'd be nice if you don't truncate potentially 64-bit
> dma_buf down to u32.
> 
> Brian
> 
No, this controller just supports 32-bit addresses. So I think I have to truncate 64-bit dma_buf. :(

Thank you very much!

Regards,
Jiancheng
