Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AB6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzqPSwdQ0ss1jEjEykZ+K2pl52dGkuWwv00XvV82sKY=; b=zmwzXeLetskR+j
	ZZwxPYP2Y9Rk6sYvU5AiBft9+oShDR8S1DDYAqqFGlM7hjyfvRzFZPCuKI7zGYAFhFVtg0qm4q9eK
	cVqfYDS3fY/Mg8fAtgzcO2NmgjOdWDUhkmMKACyV4AJJe1FyM8rVuKynfxQw29R9C1CcM8gT0QCCa
	EWwq15c8xI08k9/+/UYcdfwnqR6VMe2/G284ZdXmaod71ZpmhdKmpyCnfPp7fSxlFQfTofp5K3MAe
	iT1cBBAaD9Ll56ej4k7P9elOh/ZecH7WqONEJHz5ysYUyak2BNpeD8UYDgVnCZpCJpcVYx0AC5JIY
	3/VF0ZyR8Dui8hgaI25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofFGX-004FCC-JF; Mon, 03 Oct 2022 06:49:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofFGU-004FB8-Lw
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 06:49:24 +0000
Received: by mail-pf1-x42c.google.com with SMTP id a26so411737pfg.7
        for <linux-mtd@lists.infradead.org>; Sun, 02 Oct 2022 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QmPwX5UgdP5fCWkANUhx7wKn/hRvAX4PX1aFPkfzjMU=;
        b=b7FOpv6D+WcDmfqTF9hHdPljD9aTbyGhnxW7ZgNhBFzMcMEpNoXlAQPkPAul0zjd5B
         7W8nPHer3hB1sDs81oYxrbc6ecqRyqI0s5gl0vPpq69utvw6Phb1KyioIwHnGcFLHZ0p
         R+dfRG8MHsZIbBl1P/hWfVZKbgRzWx4RGBJlpZ2aeGc7ay3A1NCiH4m9s7bd8wCNWFYX
         zheQCg+PvYHNJRUpFNvURs5q9zFRRIIn3O19r3CI3NcJOaRAC3kLrVU+xwzstjcdwqpq
         j8ajhT5wBnDkUnLAiSc2LZuQLqXtOgOevym/Arc8LNsDfAbN6lZ11uZbVPg2ck56FBXp
         MXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QmPwX5UgdP5fCWkANUhx7wKn/hRvAX4PX1aFPkfzjMU=;
        b=LTsgpuEyxk+75iT6UNX4gesvdFMf3pbFlGfpI8TrJ6O5NpduV3Qm89Dsu5s6qkYxRG
         0T1VrNggrr29fcA4SqYxFjcDn3FV+q8P3DKhOQ88Q7dC7XNjbathQUhdcyXHXwJ+fVBh
         2L0ono7WJJ8dqPyuKbGX/9ZvK1nhLgutAomXfMN/ExRBUDEl3osoLaqr/EDmsoh997QI
         wIZ8sumAPzKYt7LUa5N4P5xwYK+YtG7uQsuOKJeAK6HUyFFUXUfjUbxhkHmyBl7eVDkg
         DyrLBDfnvg/fwq8gLxHsppyDUl2l0iBBlmsAwpcZO3YEcCyFDleaYUA5AxV/YE7k1SjS
         MUxw==
X-Gm-Message-State: ACrzQf2ngctDfFeD2jXk7R/ZypVIpss1V0OnV8H6Bv5pSkJZ1Qu81qSX
	AXmtojb8/MgjGF6qM9ucPp4=
X-Google-Smtp-Source: AMsMyM4XQ+Fs6ktg4ZZExz+BfSb98dWtRSHFcAWdVDXQnxV1lwdKb+e0Xzo8VXstWPFXww5u/ovwHQ==
X-Received: by 2002:a05:6a00:1a44:b0:52a:ecd5:bbef with SMTP id h4-20020a056a001a4400b0052aecd5bbefmr20815881pfv.28.1664779760953;
        Sun, 02 Oct 2022 23:49:20 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id z10-20020a170902ccca00b00174be817124sm6346732ple.221.2022.10.02.23.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 23:49:20 -0700 (PDT)
Message-ID: <c681d290-170d-8ded-8c34-b98466633f78@gmail.com>
Date: Mon, 3 Oct 2022 15:49:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <20220912051317.2369-1-Takahiro.Kuwano@infineon.com>
 <4576414b-af90-1ec3-ab38-9d59c915ec1a@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <4576414b-af90-1ec3-ab38-9d59c915ec1a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_234922_766621_744D79A1 
X-CRM114-Status: GOOD (  19.59  )
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

On 10/3/2022 3:07 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Takahiro,
> 
> On 9/12/22 08:13, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Array index for SCCR 22th DOWRD should be 21.
>>
>> Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> v2: Add Fixes tag.
>>
>>  drivers/mtd/spi-nor/sfdp.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 2257f1b4c2e2..681e5e78724c 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -1222,7 +1222,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>>
>>         le32_to_cpu_array(dwords, sccr_header->length);
>>
>> -       if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
>> +       if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
> 
> Would such a change work?
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index bbf80d2990ab..e83d9bd89066 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -19,7 +19,7 @@
>   * JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs.
>   * They are indexed from 1 but C arrays are indexed from 0.
>   */
> -#define BFPT_DWORD(i)          ((i) - 1)
> +#define SFDP_DWORD(i)          ((i) - 1)
> 
> 
> and use:
> +       if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[SFDP_DWORD(22)]))
> 
> and dwords may be renamed to sccrm, from "Status, Control and Configuration Register Map",
> so:
> +       if (FIELD_GET(SCCRM_DWORD22_OCTAL_DTR_EN_VOLATILE, sccrm[SFDP_DWORD(22)]))
> 
> But you'll have to check that all the tables from the latest jesd216 (e version I guess)
> use the same kind of indexing. Let me know if you'd like to pursue my suggestion instead.
> 
Yes, this should work and I like to follow your suggestion.
I will check the JESD216 (revision F is the latest).

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
