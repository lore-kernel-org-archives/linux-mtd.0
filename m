Received: from regular1.263xmail.com ([211.150.99.131])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkRJe-00076G-1z
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 08:47:40 +0000
Subject: Re: [PATCH v4] mtd: spi-nor: add support for GD25Q256
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org
References: <1500977574-15915-1-git-send-email-andy.yan@rock-chips.com>
 <fea093e4-9e62-8a36-3801-4cb81520f295@wedev4u.fr>
 <fb0f8c6b-279d-3b43-82e1-f97c948b81b6@rock-chips.com>
 <d7621510-ff4a-fbf9-daf6-ec6e7aa48664@wedev4u.fr>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <d52f4b7c-5170-20e2-d176-fccb746845d7@rock-chips.com>
Date: Wed, 23 Aug 2017 16:46:42 +0800
MIME-Version: 1.0
In-Reply-To: <d7621510-ff4a-fbf9-daf6-ec6e7aa48664@wedev4u.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille:


On 2017年08月23日 15:46, Cyrille Pitchen wrote:
> Hi Andy,
>
> Le 16/08/2017 à 05:40, Andy Yan a écrit :
>> Hi Cyrille:
>>
>>
>> On 2017年08月16日 00:04, Cyrille Pitchen wrote:
>>> Hi Andy,
>>>
>>> Le 25/07/2017 à 12:12, Andy Yan a écrit :
>>>> Add support for GD25Q256, a 32MiB SPI Nor
>>>> flash from Gigadevice.
>>>>
>>>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - add SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB
>>> Between v3 and v4, I see that you've also changed the procedure to the
>>> the Quad Enable bit on all Gigadevice memories with QSPI capabilities.
>>> This is not a detail and should have been reported here.
>>   Sorry, I will keep this in mind.
>>>> Changes in v3:
>>>> - rebase on top of spi-nor tree
>>>> - add SPI_NOR_4B_OPCODES flag
>>>>
>>>> Changes in v2:
>>>> - drop one line unnecessary modification
>>>>
>>>>    drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>>> b/drivers/mtd/spi-nor/spi-nor.c
>>>> index 196b52f..e4145cd 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -986,6 +986,11 @@ static const struct flash_info spi_nor_ids[] = {
>>>>                SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>>>                SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>>>        },
>>>> +    {
>>>> +        "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
>>>> +            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>>> +            SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>>> +    },
>>>>          /* Intel/Numonyx -- xxxs33b */
>>>>        { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
>>>> @@ -2365,6 +2370,7 @@ static int spi_nor_init_params(struct spi_nor
>>>> *nor,
>>>>                       SNOR_HWCAPS_PP_QUAD)) {
>>>>            switch (JEDEC_MFR(info)) {
>>>>            case SNOR_MFR_MACRONIX:
>>>> +        case SNOR_MFR_GIGADEVICE:
>>>>                params->quad_enable = macronix_quad_enable;
>>> Here, you've have changed the Quad Enable requirement for *all*
>>> Gigadevice memories with Quad SPI capabilities.
>>>
>>> However, I'm reading the GD25Q128 datasheet and it claims that the QE
>>> bit is BIT(1) of the Status Register 2. Hence some
>>> spansion*_quad_enable() should be used, as before your patch.
>>>
>>> Then, still according to the datasheet, the GD25Q128 memory is compliant
>>> with the JESD216 specification (minor 0) but neither with rev A (minor
>>> 5) nor rev B (minor 6).
>>> So its Basic Flash Parameter Table is limited to 9 DWORDs instead of 16
>>> DWORDs, hence doesn't provide the Quad Enable requirements. It means
>>> that the SFDP tables would not help to select the right _quad_enable()
>>> function by overriding the choice made by the switch() statement above.
>>>
>>> tl;dr
>>> This chunk would introduce a regression with some already supported
>>> Gigadevice memories. So I reject this patch, sorry.
>>      After check some other Gigadevice memories, I found it's true as you
>> mentioned.
>> Some memories use S9 as the QE bit, but some use S6.
>>      Do you have some ideas for this case? Add a check for the full
>> jedec_id or encode
>> the QE bit in the flash_info?
>>      I am a new bee in the flash failed, very appreciate for your advice.
> Historically spi-nor.c assumed that the procedure to set the QE bit
> could be chosen based on the manufacturer ID only, hence without needing
> to check the whole JEDEC ID. Obviouly this is no longer true for
> Gigadevice SPI NOR memories...
>
> So you need a solution which is backward compatible with the existing
> code so you patch would not introduce any regression for other SPI NOR
> memories.
>
> Then, I suggest you add a .quad_enable member in 'struct flash_info'.
>
>   #define USE_CLSR		BIT(14)	/* use CLSR command */
> +
> +	int		(*quad_enable)(struct spi_nor *nor);
>   };
>
>   #define JEDEC_MFR(info)	((info)->id[0]
>
>
>
> Also in spi_nor_init_params():
>
>   	/* Select the procedure to set the Quad Enable bit. */
>   	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
>   				   SNOR_HWCAPS_PP_QUAD)) {
>   		switch (JEDEC_MFR(info)) {
>   		case SNOR_MFR_MACRONIX:
>   			params->quad_enable = macronix_quad_enable;
>   			break;
>
>   		case SNOR_MFR_MICRON:
>   			break;
>
>   		default:
>   			/* Kept only for backward compatibility purpose. */
>   			params->quad_enable = spansion_quad_enable;
>   			break;
>   		}
>   	}
> +
> +	if (info->quad_enable)
> +		params->quad_enable = info->quad_enable;
>
>   	/* Override the parameters with data read from SFDP tables. */
>   	nor->addr_width = 0;
>   	nor->mtd.erasesize = 0;
>   	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
>   	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
>   		struct spi_nor_flash_parameter sfdp_params;
>
>   		memcpy(&sfdp_params, params, sizeof(sfdp_params));
>   		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
>   			nor->addr_width = 0;
>   			nor->mtd.erasesize = 0;
>   		} else {
>   			memcpy(params, &sfdp_params, sizeof(*params));
>   		}
>   	}
>
>
>
> And finally when adding the gigadevice entries in the spi_nor_ids[]
> array, don't forget to initialize the new member:
>
> +	{
> +		"gd25q256", .quad_enable = macronix_quad_enable, 	+		INFO([...])
> +	},

     Thanks very much for your guidance. I will try a new patch very soon.
>>> Best regards,
>>>
>>> Cyrille
>>>
>>>>                break;
>>>>   
>>>
>>>
>>
>>
>
>
>
