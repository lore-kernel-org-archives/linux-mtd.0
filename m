Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ago6c-0004zd-3D
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2016 06:41:56 +0000
Subject: Re: [PATCH v8] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
To: Jagan Teki <jteki@openedev.com>, <robh+dt@kernel.org>,
 <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <zajec5@gmail.com>, <boris.brezillon@free-electrons.com>,
 <ezequiel@vanguardiasur.com.ar>, <juhosg@openwrt.org>,
 <shijie.huang@intel.com>, <mika.westerberg@linux.intel.com>,
 <furquan@google.com>, <han.xu@freescale.com>,
 <fabio.estevam@freescale.com>, <manabian@gmail.com>
References: <1457682114-1667-1-git-send-email-xuejiancheng@huawei.com>
 <56E27C29.2040904@openedev.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yanhaifeng@hisilicon.com>,
 <yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
 <raojun@hisilicon.com>, <ml.yang@hisilicon.com>,
 <gaofei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
 <xuejiancheng@hisilicon.com>, Binquan Peng <pengbinquan@huawei.com>
From: Jiancheng Xue <xuejiancheng@huawei.com>
Message-ID: <56EBA238.9050902@huawei.com>
Date: Fri, 18 Mar 2016 14:37:44 +0800
MIME-Version: 1.0
In-Reply-To: <56E27C29.2040904@openedev.com>
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

Hi Jagan,
	Thank you for comments. I'll modify in next version.

Regards,
Jiancheng

On 2016/3/11 16:04, Jagan Teki wrote:
> 
> 
> On Friday 11 March 2016 01:11 PM, Jiancheng Xue wrote:
>> Add hisilicon spi-nor flash controller driver
>>
>> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
[...]
>> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
>> +            size_t len, size_t *retlen, const u_char *write_buf)
>> +{
>> +    struct hifmc_priv *priv = nor->priv;
>> +    struct hifmc_host *host = priv->host;
>> +    const unsigned char *ptr = write_buf;
>> +    size_t num;
>> +
>> +    while (len > 0) {
>> +        if (to & HIFMC_DMA_MASK)
>> +            num = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
>> +                >= len    ? len
>> +                : (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));
>> +        else
>> +            num = (len >= HIFMC_DMA_MAX_LEN)
>> +                ? HIFMC_DMA_MAX_LEN : len;
> 
> Since num is the actual length bytes to read Better to rename num to actual_len for proper meaning here.
> 
>> +        memcpy(host->buffer, ptr, num);
>> +        hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, num,
>> +                FMC_OP_WRITE);
>> +        to += num;
>> +        ptr += num;
>> +        len -= num;
>> +    }
>> +    *retlen += (size_t)(ptr - write_buf);
> 
> Please avoid this type casting and do *retlen += num inside while.
> 
> -- 
> Jagan
> 
> .
> 
