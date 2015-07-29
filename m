Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKJhs-0001zs-S8
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 05:15:09 +0000
Message-ID: <55B86142.9090806@codeaurora.org>
Date: Wed, 29 Jul 2015 10:44:42 +0530
From: Archit Taneja <architt@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: dehrenberg@google.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, agross@codeaurora.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v2 2/5] mtd: nand: Qualcomm NAND controller driver
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-3-git-send-email-architt@codeaurora.org>
 <55B2DDA3.40306@codeaurora.org> <55B7063F.9090102@codeaurora.org>
 <55B830FE.2020601@codeaurora.org>
In-Reply-To: <55B830FE.2020601@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/29/2015 07:18 AM, Stephen Boyd wrote:
> On 07/27/2015 09:34 PM, Archit Taneja wrote:
>> Hi,
>>
>> On 07/25/2015 06:21 AM, Stephen Boyd wrote:
>>> On 07/21/2015 03:34 AM, Archit Taneja wrote:
>>>
>>>> +              int size)
>>>> +{Looks like a
>>>> +    struct desc_info *desc;
>>>> +    struct dma_async_tx_descriptor *dma_desc;
>>>> +    struct scatterlist *sgl;
>>>> +    int r;
>>>> +
>>>> +    desc = kzalloc(sizeof(*desc), GFP_KERNEL);
>>>> +    if (!desc)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    list_add_tail(&desc->list, &this->list);
>>>> +
>>>> +    sgl = &desc->sgl;
>>>> +
>>>> +    sg_init_one(sgl, vaddr, size);
>>>> +
>>>> +    desc->dir = DMA_MEM_TO_DEV;
>>>> +
>>>> +    r = dma_map_sg(this->dev, sgl, 1, desc->dir);
>>>> +    if (r == 0)
>>>> +        goto err;
>>>
>>> Should we return an error in this case? Looks like return 0.
>>
>> dma_map_sg returns the number of sg entries successfully mapped. In
>> this case, it should be 1.
>
> Right, but this function returns 0 (success?) if we failed to map anything.

Yes. The return value is number of entries successfully mapped. 
dma_map_sg is a macro that is replaced by dma_map_sg_attrs. Its comment
says:

"dma_maps_sg_attrs returns 0 on error and > 0 on success. It should 
never return a value < 0."

>
>>
>>>
>>>> +
>>>> +    this->slave_conf.device_fc = 0;
>>>> +    this->slave_conf.dst_addr = this->res->start + reg_off;
>>>> +    this->slave_conf.dst_maxburst = 16;
>>>
>>> Is there any reason why slave_conf can't be on the stack? Otherwise it's
>>> odd that it's overwritten a few times before we submit the descriptors,
>>> so it must be copied by the dmaengine provider, but that isn't clear at
>>> all from the code. If it isn't copied, perhaps it should be part of the
>>> desc_info structure. If it is copied I wonder why it isn't const in the
>>> function signature.
>>
>> The dmaengine drivers either memcpy slave_config in their
>> device_config() dmaengine op, or populate their local members reading
>> params in the passed slave_config.
>>
>> I'll move slave_conf to stack. As you said, the config argument
>> in dmaengine_slave_config should ideally use const.
>
> Cool, someone should send a patch.
>
>>
>>>
>>>> +
>>>> +    r = dmaengine_slave_config(this->chan, &this->slave_conf);
>>>> +    if (r) {
>>>> +        dev_err(this->dev, "failed to configure dma channel\n");
>>>> +        goto err;
>>>> +    }
>>>> +
>>>> +    dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1,
>>>> desc->dir, 0);
>>>> +    if (!dma_desc) {
>>>> +        dev_err(this->dev, "failed to prepare data write desc\n");
>>>> +        r = PTR_ERR(dma_desc);
>>>> +        goto err;
>>>> +    }
>>>> +
>>>> +    desc->dma_desc = dma_desc;
>>>> +
>>>> +    return 0;
>>>> +err:
>>>> +    kfree(desc);
>>>> +
>>>> +    return r;
>>>> +}
>>>> +
>>>> +/*
>>>> + * helper to prepare dma descriptors to configure registers needed
>>>> for reading a
>>>> + * codeword/step in a page
>>>> + */
>>>> +static void config_cw_read(struct qcom_nandc_data *this)
>>>> +{
>>>> +    struct nandc_regs *regs = this->regs;
>>>> +
>>>> +    write_reg_dma(this, NAND_FLASH_CMD, &regs->cmd, 3, true);
>>>
>>> Maybe it would be better to have a case statement inside
>>> {write,read}_reg_dma() that looked at the second argument and matched it
>>> up with an offset in regs. Then this could be
>>>
>>>      write_reg_dma(this, NAND_FLASH_CMD, 3, true);
>>
>> That's a good idea. However, we have at least one programming seqeunce
>> (in nandc_param) where we need to write two different values to the
>> same register. In such a case, we need two different locations to
>> store the two values.
>>
>> I can split up the programming sequence into two parts such that we
>> won't write to the same register twice. But doing this for the sake of
>> reducing an argument to write_reg_dma seems a bit unnecessary.
>>
>
> Or you could have two #defines that indicate the different usage? Like
> NAND_CMD_FOO and NAND_CMD_BAR that both map to the same register but
> uses different locations as storage.

Yeah, that seems like a good option. I'll try this out.

>
>>>
>>> Are we guaranteed that this is called within the same context as where
>>> the buffer is passed to this function? Otherwise this stack check isn't
>>> going to work because object_is_on_stack() will silently fail.
>>
>> These are funcs are finally tied to mtd ops. I think in normal operation
>> it'll be the same context. I'll still cross check. The aim of the check
>> is to prevent a memcpy of the buffer to/from the layer above. A false
>> negative will result in a slower read/write operation.
>
> Right. It would be nice if the mtd layer was DMA aware and could
> indicate to drivers that DMA on the buffer is allowable or not. Trying
> to figure it out if the buffer is in lowmem after the buffer is mapped
> is error prone, which is why not a lot of usage of object_is_on_stack()
> exists. Honestly I'm confused, I thought the DMA APIs would "do the
> right thing" when highmem was passed into the mapping APIs, but maybe
> I'm wrong. I'll have to look.

It looks like NAND_USE_BOUNCE_BUFFER does just that. If we set this
flag, the nand_base layer provides a DMA-able buffer even if the
filesystem didn't.

No one was using this flag when I last checked. A new driver
brcmnand now uses it. I'll give this a try.

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
