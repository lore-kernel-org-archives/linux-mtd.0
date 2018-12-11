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
 <79a797c2-f37f-7f7c-e907-2d3c2283ec2d@amlogic.com>
 <20181210155057.38788656@xps13>
 <d60bac6f-732d-0ddc-2644-17f650dfa885@amlogic.com>
 <20181211093933.2fab8cc3@bbrezillon>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <6abef955-5ce0-6213-b616-67a306d1fb31@amlogic.com>
Date: Tue, 11 Dec 2018 17:39:51 +0800
MIME-Version: 1.0
In-Reply-To: <20181211093933.2fab8cc3@bbrezillon>
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

Hi Boris,

On 2018/12/11 16:39, Boris Brezillon wrote:
> On Tue, 11 Dec 2018 09:56:25 +0800
> Liang Yang <liang.yang@amlogic.com> wrote:
> 
>> Hi Miquel,
>>
>> On 2018/12/10 22:50, Miquel Raynal wrote:
>>> Hi Liang,
>>>
>>> Liang Yang <liang.yang@amlogic.com> wrote on Mon, 10 Dec 2018 20:12:39
>>> +0800:
>>>    
>>>> On 2018/12/10 19:38, Boris Brezillon wrote:
>>>>> On Mon, 10 Dec 2018 19:23:46 +0800
>>>>> Liang Yang <liang.yang@amlogic.com> wrote:
>>>>>       
>>>>>>>> +			mtd->ecc_stats.failed++;
>>>>>>>> +			continue;
>>>>>>>> +		}
>>>>>>>> +		mtd->ecc_stats.corrected += ECC_ERR_CNT(*info);
>>>>>>>> +		bitflips = max_t(u32, bitflips, ECC_ERR_CNT(*info));
>>>>>>>> +	}
>>>>>>>
>>>>>>> Are you sure you handle correctly empty pages with bf?
>>>>>>>      >> if scramble is enable, i would say yes here.
>>>>>> when scramble is disabled, i am considering how to use the helper
>>>>>> nand_check_erased_ecc_chunk, but it seems that i can't get the ecc
>>>>>> bytes which is caculated by ecc engine.by the way, nfc dma doesn't send
>>>>>> out the ecc parity bytes.
>>>>>
>>>>> Even if the ECC engine is disabled?
>>>>>       
>>>> No.
>>>> When ECC engine is disabled, it can read the ecc parity bytes ; but there is another problem that i need to consider how code struct looks better when reading error with ecc opened and then try to raw read.
>>>> Is there a good idea?
>>>
>>> When reading with ECC enabled, in case of uncorrectable error you
>>> must re-read without ECC, then check if the page is empty or not with
>>> the core helpers (nand_check_erased_*()).
>>>
>>> Is this what you meant?
>>>    
>> yes. when uncorrectable ECC error, i need firstly read out the ECC bytes
>> without ECC engine and then use the helper nand_check_erased_ecc_chunk
>> to check if blank page.
>> Of course, the precondition is without scrambler, or the bland page can
>> be detected by meson NFC.
> 
> Yep, raw accessors should disable both the scrambler and the ECC
> engine (see what's done in sunxi_nand.c).
> 

i see sunxi_nfc_hw_ecc_read_chunk and it will re-read the data for 
bitflips with scrambler off when ECC failed.
also we can do the same implementation and it seems to be the only answer.

> .
> 
