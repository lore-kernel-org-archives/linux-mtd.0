Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adUym-00034i-L0
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 03:40:10 +0000
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
 <20160307225229.GC55664@google.com> <56DE9A79.30704@huawei.com>
 <20160308104628.6224bde2@bbrezillon>
CC: Brian Norris <computersforpeace@gmail.com>, <robh+dt@kernel.org>,
 <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
 <dwmw2@infradead.org>, <zajec5@gmail.com>, <jteki@openedev.com>,
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
Message-ID: <56DF9A1D.8090100@huawei.com>
Date: Wed, 9 Mar 2016 11:35:57 +0800
MIME-Version: 1.0
In-Reply-To: <20160308104628.6224bde2@bbrezillon>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 2016/3/8 17:46, Boris Brezillon wrote:
>> [...]
>>>> +static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
>>>> +		int len)
>>>> +{
>>>> +	struct hifmc_priv *priv = nor->priv;
>>>> +	struct hifmc_host *host = priv->host;
>>>> +	int ret;
>>>> +
>>>> +	ret = hisi_spi_nor_send_cmd(nor, opcode, len);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	memcpy(buf, host->iobase, len);
>>>
>>> sparse doesn't like any of these memcpy()'s, since that's __iomem. Are
>>> you sure you want a regular memcpy here, and elsewhere?
>>>
>> It's not a must to use memcpy though host->iobase represents a segment of inner memory
>> which stores data from flash device byte by byte.  I will give up using memcpy here and
>> hisi_spi_nor_write_reg() in next version. Thank you!
> 
> Or you can use memcpy_fromio(), which should give you better perfs than
> using readX() accessors in a loop.
> 

Thank you very much for your suggestion. I'll look into sparse and this function.

Regards,
Jiancheng
