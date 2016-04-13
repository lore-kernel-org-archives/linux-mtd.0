Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqH5l-0001cw-Gj
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 09:28:17 +0000
Subject: Re: [RESEND PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
 <56F73BC9.5000300@gmail.com> <56F8F630.5050008@huawei.com>
 <20160404064418.GC13995@localhost> <5705C17F.9030904@huawei.com>
 <5705C5E2.6070206@denx.de> <57076B26.7030700@huawei.com>
 <5707821F.4020300@denx.de> <570AFDAF.9050607@huawei.com>
 <570BF933.2000607@denx.de> <570CC098.9070606@huawei.com>
 <20160412114433.069b388e@bbrezillon>
CC: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <robh+dt@kernel.org>,
 <dwmw2@infradead.org>, <juhosg@openwrt.org>, <furquan@google.com>,
 <suwenping@hisilicon.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <yanhaifeng@hisilicon.com>,
 <raojun@hisilicon.com>, <xuejiancheng@hisilicon.com>,
 <ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
 <yanghongwei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
 <jalen.hsu@hisilicon.com>, "Russell King -
 ARM Linux" <linux@arm.linux.org.uk>
From: Jiancheng Xue <xuejiancheng@huawei.com>
Message-ID: <570E1057.3090604@huawei.com>
Date: Wed, 13 Apr 2016 17:24:39 +0800
MIME-Version: 1.0
In-Reply-To: <20160412114433.069b388e@bbrezillon>
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

Hi Boris,

On 2016/4/12 17:44, Boris Brezillon wrote:
> +Russell
> 
> Hi Jiancheng,
> 
> On Tue, 12 Apr 2016 17:32:08 +0800
> Jiancheng Xue <xuejiancheng@huawei.com> wrote:
> 
>> Hi Marek,
>>
>> On 2016/4/12 3:21, Marek Vasut wrote:
>>> On 04/11/2016 03:28 AM, Jiancheng Xue wrote:
>>>> Hi,
>>>>
>>>> On 2016/4/8 18:04, Marek Vasut wrote:
>>>>> On 04/08/2016 10:26 AM, Jiancheng Xue wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 2016/4/7 10:28, Marek Vasut wrote:
>>>>>>> On 04/07/2016 04:10 AM, Jiancheng Xue wrote:
>>>>>>>> Hi Brian,
>>>>>>>>    Thank you very much for your comments. I'll fix these issues in next version.
>>>>>>>> In addition, for easy understanding I'd like to rewrite hisi_spi_nor_write and
>>>>>>>> hisi_spi_nor_read. Your comments on these modifications will be highly appreciated.
>>>>>>>
>>>>>>> Would you please stop top-posting ? It rubs some people the wrong way.
>>>>>>>
>>>>>> I feel very sorry about that. I have read the etiquette and won't make the same mistake again.
>>>>>>
>>>>>>>> static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
>>>>>>>> 		size_t *retlen, u_char *read_buf)
>>>>>>>> {
>>>>>>>> 	struct hifmc_priv *priv = nor->priv;
>>>>>>>> 	struct hifmc_host *host = priv->host;
>>>>>>>> 	int i;
>>>>>>>>
>>>>>>>> 	/* read all bytes in only one time */
>>>>>>>> 	if (len <= HIFMC_DMA_MAX_LEN) {
>>>>>>>> 		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
>>>>>>>> 				len, FMC_OP_READ);
>>>>>>>> 		memcpy(read_buf, host->buffer, len);
>>>>>>>
>>>>>>> Is all the ad-hoc memcpying necessary? I think you can use
>>>>>>> dma_map_single() and co to obtain DMAble memory for your
>>>>>>> controller's use and then you can probably get rid of most
>>>>>>> of this stuff.
>>>>>>>
>>>>>> Considering read_buf >= high_mem case, I think it is also complicated to use dma_map_*
>>>>>> and the DMA buffer allocated by the driver is still needed. But I am not sure about
>>>>>> this. Please let me know if I am wrong. Thank you!
>>>>>
>>>>> Does your controller/DMA have a limitation where it's buffers must be in
>>>>> the bottom 4GiB range ? The DMA framework should be able to take care of
>>>>> such platform limitations.
>>>>>
>>>> When read_buf is allocated by vmalloc, the underlying physical memory may be not contiguous.
>>>> In this case, dma_map_single can't be used directly. I think inner DMA buffer and memcpy are still
>>>> needed. Am I right?
>>>
>>> Take a look at drivers/spi/spi-mxs.c , look for "vmalloc" , does that
>>> solution help you in any way ?
>>>
>> No. I think this solution just processes the buffer within only one page.
>> I had referred to drivers/mtd/onenand/samsung.c and other files.
>> The corresponding code segment is as follows:
>> static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
>>                 unsigned char *buffer, int offset, size_t count)
>> {
>> 	void *buf = (void *) buffer;
>>         dma_addr_t dma_src, dma_dst;
>> 	...
>> 	/* Handle vmalloc address */
>>         if (buf >= high_memory) {
>>                 struct page *page;
>>
>>                 if (((size_t) buf & PAGE_MASK) !=
>>                     ((size_t) (buf + count - 1) & PAGE_MASK))
>>                         goto normal;
>>                 page = vmalloc_to_page(buf);
>>                 if (!page)
>>                         goto normal;
>>
>>                 ...
>>         } else {
>> 		...
>> 	}
>>
>> normal:
>>         ...
>>         memcpy(buffer, p, count);
>>
>> 	return 0;
>> }
>> I think memcpy in "normal" clause can't be removed. So I'd like to keep my original
>> implementation if it is also OK. What's your opinion?
> 
> You might want to have a look at this series [1], and particularly at
> Russell's answers regarding DMA operations on non-lowmem memory.
> 
Thank you very much for your supplied reference. Besides safety reasons described by Russell,
the dmaengine embeded in this controller doesn't support scatter-list type buffer directly.
So for this controller, I think now it's better to obtain buffer through dma_alloc_coherent
for dma operation, and then copy data to buffers supplied by mtd user. May I keep using this
implementation now?

Regards,
Jiancheng
