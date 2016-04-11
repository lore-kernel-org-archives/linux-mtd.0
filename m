Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apQhk-0007Tm-SR
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 01:31:55 +0000
Subject: Re: [RESEND PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
To: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>
References: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
 <56F73BC9.5000300@gmail.com> <56F8F630.5050008@huawei.com>
 <20160404064418.GC13995@localhost> <5705C17F.9030904@huawei.com>
 <5705C5E2.6070206@denx.de> <57076B26.7030700@huawei.com>
 <5707821F.4020300@denx.de>
CC: <linux-mtd@lists.infradead.org>, <robh+dt@kernel.org>,
 <dwmw2@infradead.org>, <boris.brezillon@free-electrons.com>,
 <juhosg@openwrt.org>, <furquan@google.com>, <suwenping@hisilicon.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <yanhaifeng@hisilicon.com>, <raojun@hisilicon.com>,
 <xuejiancheng@hisilicon.com>, <ml.yang@hisilicon.com>,
 <gaofei@hisilicon.com>, <yanghongwei@hisilicon.com>,
 <zhangzhenxing@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@huawei.com>
Message-ID: <570AFDAF.9050607@huawei.com>
Date: Mon, 11 Apr 2016 09:28:15 +0800
MIME-Version: 1.0
In-Reply-To: <5707821F.4020300@denx.de>
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

Hi,

On 2016/4/8 18:04, Marek Vasut wrote:
> On 04/08/2016 10:26 AM, Jiancheng Xue wrote:
>> Hi,
>>
>> On 2016/4/7 10:28, Marek Vasut wrote:
>>> On 04/07/2016 04:10 AM, Jiancheng Xue wrote:
>>>> Hi Brian,
>>>>    Thank you very much for your comments. I'll fix these issues in next version.
>>>> In addition, for easy understanding I'd like to rewrite hisi_spi_nor_write and
>>>> hisi_spi_nor_read. Your comments on these modifications will be highly appreciated.
>>>
>>> Would you please stop top-posting ? It rubs some people the wrong way.
>>>
>> I feel very sorry about that. I have read the etiquette and won't make the same mistake again.
>>
>>>> static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
>>>> 		size_t *retlen, u_char *read_buf)
>>>> {
>>>> 	struct hifmc_priv *priv = nor->priv;
>>>> 	struct hifmc_host *host = priv->host;
>>>> 	int i;
>>>>
>>>> 	/* read all bytes in only one time */
>>>> 	if (len <= HIFMC_DMA_MAX_LEN) {
>>>> 		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
>>>> 				len, FMC_OP_READ);
>>>> 		memcpy(read_buf, host->buffer, len);
>>>
>>> Is all the ad-hoc memcpying necessary? I think you can use
>>> dma_map_single() and co to obtain DMAble memory for your
>>> controller's use and then you can probably get rid of most
>>> of this stuff.
>>>
>> Considering read_buf >= high_mem case, I think it is also complicated to use dma_map_*
>> and the DMA buffer allocated by the driver is still needed. But I am not sure about
>> this. Please let me know if I am wrong. Thank you!
> 
> Does your controller/DMA have a limitation where it's buffers must be in
> the bottom 4GiB range ? The DMA framework should be able to take care of
> such platform limitations.
> 
When read_buf is allocated by vmalloc, the underlying physical memory may be not contiguous.
In this case, dma_map_single can't be used directly. I think inner DMA buffer and memcpy are still
needed. Am I right?

Regards,
Jiancheng.
