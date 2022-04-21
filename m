Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616BDC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GxNjZZv00v6UB228vAthwHxJ1VlE566w3oFcnSIvis=; b=rLEb+BZGzaJb+f
	yq5QTg3PY27LXCMTyaljfsA3KiVHxKVp1u3XnfRUSvWgc3CaU4NHAUaHLImEo5T9VUO3GeZSU1+E2
	LT2PGY1fOtXe6CbSX8NXDzodrKtLxHIxFgYp01whewOqL9aosCo3HqpNv3w4jO14aa/UcEclBZg+b
	6KzQjvBNhTuM79jjxMdpJI1icn9KEr2zjF7jnuJWr7o1bF5Kf0PxnxTWP069gn0mTPzx6JS7dhKNC
	ID5h8eNiDz3DPK5kNVSr3PAhhFadsBTG4IDVnykLi4+8eJFmj940jPStx5lr0BvqhoblCtt+0p3uD
	uB3fOYSKrNdT7hEjWBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhURH-00D6LH-1q; Thu, 21 Apr 2022 10:53:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhURD-00D6Jv-C1
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:53:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id h12so813356plf.12
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mHEUo6GQVIb2odIfFk0jvWk+ukUts3X8qsF9msYmGgM=;
 b=MyLtvi0z7Siyeq2ogTGMMcrA3iUZ9dixuBS7c2GPoF1oGj3M0A8oTLzePZ9dssjddG
 TbG/Jdwko1SLWOmi26vdoxPWAmyVzZHUCYYPVVeFaf011WrHEPb5GBWgjdg7TbS+A/h1
 WaKkrPT8yiLgj14mfsZJ/c343MBY4HkVJUYF0uTUgSdMY6uoHwDvPgTXJv6nXVQ2N9nk
 Rlc22iCUJSply5icoVMf9Fk5uQBYNqi9CUnUvpalkgHuPWW/8y5Up4GgnfIQs5OsxYEH
 9HwiiyEyyRA47m1s/BYSLbWdNB40ppJBASeyavQ5CAHLPzfmibF/h42UVD1vPtUE69zW
 fgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mHEUo6GQVIb2odIfFk0jvWk+ukUts3X8qsF9msYmGgM=;
 b=fCjNuGdxt1gz+GgLNjskQ1Pk9NkA2FVDs9iPCTAuPBDvZJ/sCtqF4Vm6aL2JVFXBLZ
 dRD6ayOZGSALAg9727E0W4dYVXxGeOmkmAhZX+UokA+RBDF3hg0sHcNxQf0bgjDXcObN
 W4nYth7I+5Kmu56UsW3j5FfNUsvgBw6V6D9xe6xbiLiYVn6QSc1Cf2rvCsTUZHD+Y/2S
 UeMZ9wk3lqdQPdVqR1gb9i/QKvd5N6JvJ2ojTAHm1Z9kQPl5AgG+xX8sJSLX6zohJ8+b
 j5pVUELnawNxRnZaKfBoA0oNHVP4Y9B7KaSjaxJ9Dkz56NNm9VNXgP9zYq93xeRbMaMJ
 ol7Q==
X-Gm-Message-State: AOAM532SvqeXOvtt/du5EPgymJJ5T/PVz/DZlqHOXIg3bHEwumkYQLz2
 xA7EjCS7Vt+0AzDEpY4ZFitkLwlKp/M=
X-Google-Smtp-Source: ABdhPJwgNPtN6rNqMwHZjcnAU5wpYTg+EkE9vn3fK+U3yjWjqf+NaSqLXZWStLhudPYzWFVUlr7Hpw==
X-Received: by 2002:a17:903:22c4:b0:158:9224:1a8a with SMTP id
 y4-20020a17090322c400b0015892241a8amr2862528plg.41.1650538404466; 
 Thu, 21 Apr 2022 03:53:24 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 v126-20020a622f84000000b004fa666a1327sm22795399pfv.102.2022.04.21.03.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 03:53:24 -0700 (PDT)
Message-ID: <e4668aba-7159-8481-6634-5e7606246c96@gmail.com>
Date: Thu, 21 Apr 2022 19:53:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 4/4] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <5ecc521018a8fe89c5554c7d69a0a9a36eb16737.1650532121.git.Takahiro.Kuwano@infineon.com>
 <a039deda-89f6-288e-071e-f557aaa0bd1a@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <a039deda-89f6-288e-071e-f557aaa0bd1a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_035327_476425_6E7AB69F 
X-CRM114-Status: GOOD (  18.58  )
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

On 4/21/2022 7:45 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>
>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>> uniform sector sizes are supported. This is due to missing or incorrect
>> entries in SMPT. Fixup for other sector sizes configurations will be
>> followed up as needed.
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Changes in v13:
>>   - Remove part specific set_4byte_addr_mode()
>>   - Revert SNOR_F_4B_OPCODES
>>   - Add post_sfdp to fix 3 byte erase opcode in 4BAIT
>>
>> Changes in v12:
>>   - Cleanup fixups based on other patches in this series
>>   - Add part specific set_4byte_addr_mode()
>>   - Unset SNOR_F_4B_OPCODES flag to let core to call set_4byte_addr_mode
>>
>> Changes in v11:
>>   - Cleanup fixups based on other patches in this series
>>
>> Changes in v10:
>>   - Cleanup fixups and ID table based on other patches in this series
>>
>> Changes in v9:
>>   - Use late_init() hook to fix mode clocks and writesize
>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>   - Use MFR_FLAGS for USE_CLSR
>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>
>> Changes in v8:
>>   - Call write_disable in error case only
>>   - Use spi_nor_read_reg() helper
>>   - Use nor->bouncebuf instead of variable on stack
>>   - Update ID table to use FLAGS macro
>>
>> Changes in v7:
>>   - Add missing device info table in v6
>>
>> Changes in v6:
>>   - Remove 2Gb multi die pacakge support
>>
>> Changes in v5:
>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>
>> Changes in v4:
>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>
>> Changes in v3:
>>   - Remove S25HL256T and S25HS256T
>>   - Add S25HL02GT and S25HS02GT
>>   - Add support for multi-die package parts support
>>   - Remove erase_map fix for top/split sector layout
>>   - Set ECC data unit size (16B) to writesize
>>
>>  drivers/mtd/spi-nor/spansion.c | 66 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 952d4383f9da..e56c48c3280b 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -203,6 +203,56 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
>>         return 0;
>>  }
>>
>> +static int
>> +s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
>> +                       const struct sfdp_parameter_header *bfpt_header,
>> +                       const struct sfdp_bfpt *bfpt)
>> +{
>> +       /* Replace Quad Enable with volatile version */
>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>> +
>> +       return cypress_nor_set_page_size(nor);
>> +}
>> +
>> +static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>> +{
>> +       struct spi_nor_erase_type *erase_type =
>> +                                       nor->params->erase_map.erase_type;
>> +       int i;
>> +
>> +       /*
>> +        * In some parts, 3byte erase opcodes are advertised by 4BAIT.
>> +        * Convert them to 4byte erase opcodes.
> 
> this is a fix, those opcodes don't work with 4 byte addresses, right?
Right. If we want to use 3byte opcodes with 4byte address, need to call
set_4byte_addr_mode().

> Looks good!
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
Thank you!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
