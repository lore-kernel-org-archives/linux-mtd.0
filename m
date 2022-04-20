Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCFFC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQcQn4XBZxx+8v5UGfomW26uQF855APyiTZW4yYzBGo=; b=4zFg1nnvjINX5Y
	jsXgMpR78gsgB0beTVTy95OiByZbbPyvRPWuBXL9WGMwLEco6pIjA6BnV8Zk9F03AeVmyGfSNI8s3
	uYZHWhmryZ/CFa2ShJtwq/4oquLEZnJ+tIKBqoCJooSufueqgkX77uiCnSYY8qR2NzpfXzTOy6rmG
	4IuCZFGoieLI0JR7CuCvItj9yxQTLxLWG0LUFOL26zX1d/cUm0TMzSCefrcRnHQwJp0PV6L3RMIQw
	1emRh8FOeHOMpsnAqGYj8oVZTNbj7jmsMtfgUT16fBdSBipr80vRqMjIfhUE3nLCP3MD9YTb68mVe
	qxyGwAooEHRCWXkvM/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh5lE-0086v2-CR; Wed, 20 Apr 2022 08:32:28 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh5lB-0086tB-8w
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 08:32:27 +0000
Received: by mail-pg1-x52c.google.com with SMTP id s137so990698pgs.5
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5Ow6Dn6jmde97vGVXLGdFCx+ZXV80MKZJEcWH4x3inc=;
 b=qGElhNjcEewEJkeRY9qZ+ksmwc1V250PYdr7RKUYIELuJ8oXAxxW77GTJmBph6uhM2
 jbG43yy9Zg2dWRBkxb4DR2cshlvF8nC4igFTZZiYDbDeoKVa9PFVhDYT0fiHLsZ7b9rF
 GW5507t5ZcPmT1UYT0d7uPP+1zPnq3AsaHPWCFd9KQpin9vcEj+zNBJUaKaRxOJyP3dG
 hoO571C2KTWT24ZmPi2ppYu/tgACxRQF+JML7kHE1drURoPnHln/PZiPz3v34nx0mrb1
 /sqGhzWkXMUstXGzQGWy7Of0s9Fia6+6+Q1SL9V5wd+XQDCV/6BqM1a4K3RCBXAwmhmQ
 Kc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Ow6Dn6jmde97vGVXLGdFCx+ZXV80MKZJEcWH4x3inc=;
 b=YeoXNW93Lkefoffe4cothWoBPUmHlbzAaCjNCCYaz/IdRAjzVcSZUOUCFBIhgU4xs+
 SrsY+C6sQ9OQt6XzLOrWEPkgVvu+EBv4CKllc0noHO+/uCaeOQRxBzIgmRdZpVVaGo0x
 bGP+dK2Q5eQNoaK87d99Gay8E636Z3/vMb7zCl7mV3Cg1NpSlzbh/ba1lladV7X0zTZe
 fRcxUUKzb+1WxIj/EoWFZ0zxsqDkRV8HxQuFyCZX7ZEoEtVr2Iq8+PKrvr+IugJHNEID
 svUYXVA2ekgwUrk9Hdx7Uf3smkvBr9SMW81oZkJ5GvkY6YetVt/hvwRtLfk5lH50Y10t
 TTBg==
X-Gm-Message-State: AOAM530F59iJKvyDSmqiyJxe136TlWrt02nuDG+IYv2j8d361vwM0sGR
 blNkBJaqmReMn817/+9Oivo=
X-Google-Smtp-Source: ABdhPJz119hY4v0UpkSz1iix8K/MpHtKxhJ5dDw3McnGWSex7pzK0aT7sEtByOIuzDNMAUV/DDbs8g==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr8209708pfk.47.1650443543712; 
 Wed, 20 Apr 2022 01:32:23 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 t194-20020a635fcb000000b003aa52094720sm2566584pgb.67.2022.04.20.01.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 01:32:23 -0700 (PDT)
Message-ID: <872a40c8-7f84-9b9f-7f18-d566278393f5@gmail.com>
Date: Wed, 20 Apr 2022 17:32:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
 <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
 <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
 <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_013225_355584_E75E2344 
X-CRM114-Status: GOOD (  30.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 4/20/2022 4:35 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/20/22 09:58, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 4/20/2022 3:11 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 4/20/22 08:34, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Hi Tudor,
>>>>
>>>> Thank you for your feedback.
>>>>
>>>> On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>
>>>>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>>>>
>>>>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>>>>> uniform sector sizes are supported. This is due to missing or incorrect
>>>>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>>>>> followed up as needed.
>>>>>>
>>>>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>>>>
>>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>> ---
>>>>>> Changes in v11:
>>>>>>   - Cleanup fixups based on other patches in this series
>>>>>>
>>>>>> Changes in v10:
>>>>>>   - Cleanup fixups and ID table based on other patches in this series
>>>>>>
>>>>>> Changes in v9:
>>>>>>   - Use late_init() hook to fix mode clocks and writesize
>>>>>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>>>>>   - Use MFR_FLAGS for USE_CLSR
>>>>>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>>>>>
>>>>>> Changes in v8:
>>>>>>   - Call write_disable in error case only
>>>>>>   - Use spi_nor_read_reg() helper
>>>>>>   - Use nor->bouncebuf instead of variable on stack
>>>>>>   - Update ID table to use FLAGS macro
>>>>>>
>>>>>> Changes in v7:
>>>>>>   - Add missing device info table in v6
>>>>>>
>>>>>> Changes in v6:
>>>>>>   - Remove 2Gb multi die pacakge support
>>>>>>
>>>>>> Changes in v5:
>>>>>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>>>>>
>>>>>> Changes in v4:
>>>>>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>>>>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>>>>>
>>>>>> Changes in v3:
>>>>>>   - Remove S25HL256T and S25HS256T
>>>>>>   - Add S25HL02GT and S25HS02GT
>>>>>>   - Add support for multi-die package parts support
>>>>>>   - Remove erase_map fix for top/split sector layout
>>>>>>   - Set ECC data unit size (16B) to writesize
>>>>>>
>>>>>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 54 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>> index 493240ebfd70..dd37b829efbc 100644
>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>>>>>         return 0;
>>>>>>  }
>>>>>>
>>>>>> +static int
>>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>>> +                        const struct sfdp_bfpt *bfpt)
>>>>>> +{
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       /*
>>>>>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>>>>>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>>>>>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
>>>>>
>>>>> Hi, Takahiro,
>>>>>
>>>>> I would like some details, please.
>>>>> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
>>>>> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
>>>>>
>>>> If we are sure that the Flash is in 3-byte address mode, we can use the value 3
>>>> for reading CFR3V. However, the Flash's address mode may be changed prior to
>>>> Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
>>>> address mode. We need to set the Flash's address mode in known state and update
>>>
>>> addr_width is set via CFR2Volatile, can we reset the flash at probe instead? Then
>>> you'll be sure that the flash is in its default state.
>>>
>> Resetting the Flash to revert back to default state should work for this. However,
> 
> good, let's do this.
> 
I will do this in u-boot side, like Pratyush did for resetting 8D-8D-8D mode.
https://patchwork.ozlabs.org/project/uboot/patch/20210625191729.31798-23-p.yadav@ti.com/

For Linux MTD, let's assume the address mode is 3-byte (default).

>> we still have SMPT issue below.
>>
>>>> nor->addr_width accordingly. Due to SMPT issue below, value of 4 would be better
>>>> choice.
>>>>
>>>>> 2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
>>>>> Reg op used. Why do you need an addr_width of value 4 in SMPT parse?
>>>>>
>>>> In the spi_nor_get_map_in_use(), the nor->read_opcode is set to 0x65 (=Read Any Reg).
>>>> The spi_nor_smpt_addr_width() returns the value of the nor->addr_width due to
>>>
>>> ok
>>>
>>>> SMPT_CMD_ADDRESS_LEN_USE_CURRENT. The nor->addr_width is set to 4 in the
>>>> spi_nor_parse_4bait() before SMPT parse. Therefore, the host issues Read Any Reg
>>>
>>> if 4bait is parsed before SMPT and nor->addr_width is already set to 4 in parse_4bait,
>>> then you don't have to do anything for SMPT, right?
>>>
>> Currently 4bait is parsed before SMPT. So, if we are sure the Flash is in 4-byte address
>> mode (by u-boot, for example), we don't have to do anything. If the Flash is in 3-byte
>> address mode (default), SMPT parse does not work correctly.
>>
>> Please see this about 4BAIT and SMPT issue.
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/
>>
>> I introduced another workaround for SMPT issue in my previous series.
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/9a2d323b2c18485d13f271e3bb213b96fea0e7e1.1649641729.git.Takahiro.Kuwano@infineon.com/
>> I withdrew this because this does not work if Flash address mode is not default state.
>> But if we can reset the Flash at probe, this should work.
> 
> Hmm. How about issuing spi_nor_set_4byte_addr_mode after parsing 4bait table,
> to solve this dependency?
> 
>>
>>
>>>> with 4-byte address. We need to set the Flash into 4-byte address mode in advance.
>>>>
>>>>>
>>>>>> +        * Flash's addr mode and nor->addr_width here.
>>>>>> +        */
>>>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>>>> +       if (ret)
>>>>>> +               return ret;
>>>>>> +       nor->addr_width = 4;
>>>>>> +
>>>>>> +       /* Replace Quad Enable with volatile version */
>>>>>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>>>>>> +
>>>>>> +       return cypress_nor_set_page_size(nor, nor->addr_width);
>>>>>> +}
>>>>>> +
>>>>>> +void s25hx_t_late_init(struct spi_nor *nor)
>>>>>> +{
>>>>>> +       /* Fast Read 4B requires mode cycles */
>>>>>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>>>>
>>>>> Isn't this info already handled in BFPT? What value of num_mode_clocks
>>>>> do you obtain from BFPT for the non-4B opcode?
>>>>>
>>>> There is no parameter in BFPT that describes about Fast Read 1-1-1 op
>>>> (as we can see 'struct sfdp_bfpt_read' in sfdp.c).
>>>> The value of num_mode_clocks for Fast Read 1-1-1 is set to 0 in
>>>> spi_nor_init_default_params().
>>>>
>>>
>>> I see, thanks!
>>
>> Thanks,
>> Takahiro
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
