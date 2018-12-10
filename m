Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic NAND
 flash controller
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, <linux-mtd@lists.infradead.org>, Yixun Lan
 <yixun.lan@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin
 Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu
 <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
 <20181207102456.1dc67e07@xps13>
 <823825a3-86fb-9a20-ae29-85cc52d44093@amlogic.com>
 <20181210123809.5ade45c4@bbrezillon>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <79a797c2-f37f-7f7c-e907-2d3c2283ec2d@amlogic.com>
Date: Mon, 10 Dec 2018 20:12:39 +0800
MIME-Version: 1.0
In-Reply-To: <20181210123809.5ade45c4@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2018/12/10 19:38, Boris Brezillon wrote:
> On Mon, 10 Dec 2018 19:23:46 +0800
> Liang Yang <liang.yang@amlogic.com> wrote:
> 
>>>> +			mtd->ecc_stats.failed++;
>>>> +			continue;
>>>> +		}
>>>> +		mtd->ecc_stats.corrected += ECC_ERR_CNT(*info);
>>>> +		bitflips = max_t(u32, bitflips, ECC_ERR_CNT(*info));
>>>> +	}
>>>
>>> Are you sure you handle correctly empty pages with bf?
>>>    
>> if scramble is enable, i would say yes here.
>> when scramble is disabled, i am considering how to use the helper
>> nand_check_erased_ecc_chunk, but it seems that i can't get the ecc
>> bytes which is caculated by ecc engine.by the way, nfc dma doesn't send
>> out the ecc parity bytes.
> 
> Even if the ECC engine is disabled?
> 
No.
When ECC engine is disabled, it can read the ecc parity bytes ; but 
there is another problem that i need to consider how code struct looks 
better when reading error with ecc opened and then try to raw read.
Is there a good idea?

>> so i would suggest using scramble.
>>
> 
> No, please don't force people to use the scrambler.
> 
>>>> +
>>>> +const void *
>>>> +meson_nand_op_get_dma_safe_output_buf(const struct nand_op_instr *instr)
>>>> +{
>>>> +	if (WARN_ON(instr->type != NAND_OP_DATA_OUT_INSTR))
>>>> +		return NULL;
>>>> +
>>>> +	if (virt_addr_valid(instr->ctx.data.buf.out) &&
>>>> +	    !object_is_on_stack(instr->ctx.data.buf.out))
>>>
>>> Can you please create helpers for that? I guess it will help removing
>>> these checks once the core will have a DMA-safe approach.
>>>    
>> I will use below definition:
>> #define BUFFER_IS_DMA_SAFE(x)	\
>> 	(virt_addr_valid((x)) && (!object_is_on_stack((x))))
>>
>> Is it ok?
> 
> Please define a function, not a macro.
> ok
> .
> 
