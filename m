Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv4fz-00011U-LS
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 14:08:54 +0000
Received: by wicmx19 with SMTP id mx19so156383182wic.0
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 07:08:29 -0700 (PDT)
Message-ID: <555C9499.10606@vanguardiasur.com.ar>
Date: Wed, 20 May 2015 11:05:13 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v5 05/12] mtd: pxa3xx_nand: rework flash detection and
 timing setup
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
 <1431356341-31640-6-git-send-email-antoine.tenart@free-electrons.com>
 <5557BE85.4050208@vanguardiasur.com.ar> <20150520140348.GL22054@kwain>
In-Reply-To: <20150520140348.GL22054@kwain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/20/2015 11:03 AM, Antoine Tenart wrote:
> Ezequiel,
> 
> On Sat, May 16, 2015 at 07:02:45PM -0300, Ezequiel Garcia wrote:
>> On 05/11/2015 11:58 AM, Antoine Tenart wrote:
> 
>>> -
>>>  	ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
>>>  	ndcr |= (host->col_addr_cycles == 2) ? NDCR_RA_START : 0;
>>> -	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK : 0;
>>> -	ndcr |= (f->page_size == 2048) ? NDCR_PAGE_SZ : 0;
>>> -	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
>>> -	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
>>> +	ndcr |= (chip->page_shift == 6) ? NDCR_PG_PER_BLK : 0;
>>> +	ndcr |= (mtd->writesize == 2048) ? NDCR_PAGE_SZ : 0;
>>
>> By the time you call this, there's no detected flash, so there's
>> no geometry information such as mtd->writesize, chip->page_shift, etc.
> 
> I'll move this to pxa3xx_nand_init_timings().
> 

Well, please don't call it init_timings() if you are doing more than
timings setup.

>>> @@ -1577,64 +1558,20 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>>>  		return ret;
>>>  	}
>>>  
>>> -	chip->cmdfunc(mtd, NAND_CMD_READID, 0, 0);
>>> -	id = *((uint16_t *)(info->data_buff));
>>> -	if (id != 0)
>>> -		dev_info(&info->pdev->dev, "Detect a flash id %x\n", id);
>>> -	else {
>>> -		dev_warn(&info->pdev->dev,
>>> -			 "Read out ID 0, potential timing set wrong!!\n");
>>> -
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	num = ARRAY_SIZE(builtin_flash_types) + pdata->num_flash - 1;
>>> -	for (i = 0; i < num; i++) {
>>> -		if (i < pdata->num_flash)
>>> -			f = pdata->flash + i;
>>> -		else
>>> -			f = &builtin_flash_types[i - pdata->num_flash + 1];
>>> -
>>> -		/* find the chip in default list */
>>> -		if (f->chip_id == id)
>>> -			break;
>>> -	}
>>> -
>>> -	if (i >= (ARRAY_SIZE(builtin_flash_types) + pdata->num_flash - 1)) {
>>> -		dev_err(&info->pdev->dev, "ERROR!! flash not defined!!!\n");
>>> -
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	ret = pxa3xx_nand_config_flash(info, f);
>>
>> This second call to pxa3xx_nand_config_flash was in charge of re-configuring
>> the device after proper identification.
>>
>> I'd say a proper approach is to configure default parameters,
>> call nand_scan_ident, and finally re-configure using the detected values.
> 
> That's what is done already, default parameters are setup in
> pxa3xx_nand_sensing(), using onfi_async_timing_mode_to_sdr_timings(0).
> Then once the device is recognized, the proper timings are used by
> calling pxa3xx_nand_init_timings().
> 
> Did I miss something here?
> 

I'm not talking about the timings but about ndcr configuration. You can
only do that once the device is detected, not before.

The timing stuff look OK.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
