Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD7DC25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HW5ncfyOy26BdieVhkkrt+d2noV0IHepxzZ7pEkcThc=; b=wTIYucxjuhq2XK
	sWmGPCwaBzHImT/59EHfrVMIi6kd05LYWte9L7/HML54g3w79SFibP64EZ1BHniguDcJbiXJ2N37S
	Px8iQR0ULgMnZS7k9JUdVhbiP8o/GhEWzsG3Vl1nD4DCOYp4nBgkOZ6ndQCvXnMIf3W+EyR6/aGBh
	bFCXGOOesXPMFzIOBvLB/sUeKiJAiAo1T+O2UtKoTnpW89oj0slJuCi1ZCbWw92JNASv0W+RTG/oz
	8GsC/fS3sx9s+vjTYBXae/24vTUpJ4vNn9TOJCkFriBGR5+kOgucZ4/125M/dQWJqFTc+CdK3r+U8
	0wP4yikX84dKKYUoy0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFE5e-0000000A4c3-15m9;
	Thu, 06 Jun 2024 14:27:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFE5b-0000000A4bZ-09WG
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 14:27:40 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57a677d3d79so4078436a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717684057; x=1718288857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hLEV7cEhYqs364TwznzdmQhJORPUoZ782mB7mIsyO8=;
        b=TkQ3r5KgpNvdWz6nN2oc0NZ1AEoSFtc5BB6EtgjSrJRiIU2seT2REF30bhiP57NBfz
         Na/CEpylOqhMp3db6oTyUmzC1GF3hB6g805KtB7UXgvJK3yEBI30QqxJUCXdzqwg/mM0
         XW/d9clsy0CQTk6eSKvEwfm9p0cyppsjsgFFAspLnuGTehAygK6WSKZs17YFUA9Xx2EU
         S9i3uLS92MOesu+W60xosC63/Jm0lZ4LOVn3tbIDh52oa0h0O/HfXwebJC7N3eHetuO9
         lbkJEk9uBLogZgmvr7nnlpbPBWVuvZgBsKroW0AM8c5EISyzZuzvSyAb8/PZ/5vMCbRw
         i9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717684057; x=1718288857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hLEV7cEhYqs364TwznzdmQhJORPUoZ782mB7mIsyO8=;
        b=DvfQpownApYE8NT/KuvDTpeTjGgh6gHZMxnF15rlM3RsTWPQTJTsuKWjbvDP7HSkyD
         lwpWMsUn7VbKmP0pkoCCY43tqRLhrpi5fMa8R8d8kPgHx7OxAfzEWkHS5olscxbSvc2m
         5krakFWSgIvK9WPP6WogXPVPAXOxz4Gsxa0H0cSz+Wx0nRYLctxnTkB66kb2ir2Z2wqY
         XNq3rIQToz2xtn/bSEgYcvulVoVvVgfd+pmuG59tvUYQtYZx16HblyzSI6WmylplJtqJ
         20ciVnU/4/57WtiFNv4aCyH+W5YCJTgiimArKZ07478mYVXhj+mW5zzixvTb0LZEBqDk
         KbJQ==
X-Gm-Message-State: AOJu0YymRfRxUmX0nXVJV3qN6o3bmRarSGrHMh3X/uGQ2QJetaA/u0WE
	0SGyxNHkBYxETUWYTRMCvpfVEoUJkKKU6J1b8CMMXy94rWCjzsRZ2u0ZBF9QzLo=
X-Google-Smtp-Source: AGHT+IHsP59EudlMYpMNXIptWO+FeQmE0ifFlSNcVw/Ot9lSWaCM41xaUl8Qj6EICFDnAC/IPJ3ITg==
X-Received: by 2002:a17:906:5ac8:b0:a68:88a3:3645 with SMTP id a640c23a62f3a-a6c7650ae43mr235613366b.27.1717684056579;
        Thu, 06 Jun 2024 07:27:36 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e1c1sm102862566b.168.2024.06.06.07.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 07:27:35 -0700 (PDT)
Message-ID: <9e304860-b4e9-4193-9bb3-ebcc3611032f@linaro.org>
Date: Thu, 6 Jun 2024 15:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: macronix: workaround for device id re-use
To: Michael Walle <mwalle@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
References: <20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com>
 <D1Q7BU6PJ356.1CTXPUZE8U6XX@kernel.org>
 <8513a828-6669-4bf3-91d3-799771866f32@linaro.org>
 <D1SZA4ZDM06P.CJC0EQ9ULA04@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D1SZA4ZDM06P.CJC0EQ9ULA04@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_072739_140818_66C18A28 
X-CRM114-Status: GOOD (  28.05  )
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



On 6/6/24 14:45, Michael Walle wrote:
>>>> + */
>>>> +static int
>>>> +mx25l3205d_late_init(struct spi_nor *nor)
>>>> +{
>>>> +	struct spi_nor_flash_parameter *params = nor->params;
>>>> +
>>>> +	/*                          DREAD  2READ  QREAD  4READ
>>>> +	 *                          1-1-2  1-2-2  1-1-4  1-4-4
>>>> +	 * Before SFDP parse          1      0      1      0
>>>> +	 * 3206e after SFDP parse     1      0      0      0
>>>> +	 * 3233f after SFDP parse     1      1      1      1
>>>> +	 * 3205d after this func      0      1      0      0
>>>> +	 */
>>>> +	if ((params->hwcaps.mask & SNOR_HWCAPS_READ_1_1_4) &&
>>>> +	    !(params->hwcaps.mask & SNOR_HWCAPS_READ_1_4_4)) {
>>>> +		/* Should be MX25L3205D */
>>>> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_2;
>>>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>>>> +					  0, 0, 0, 0);
>>>> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_4;
>>>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
>>>> +					  0, 0, 0, 0);
>>>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
>>>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
>>>> +					  0, 4, SPINOR_OP_READ_1_2_2,
>>>> +					  SNOR_PROTO_1_2_2);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct spi_nor_fixups mx25l3205d_fixups = {
>>>> +	.late_init = mx25l3205d_late_init,
>>>> +};
>>>> +
>>>>  static int
>>>>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>>>>  			    const struct sfdp_parameter_header *bfpt_header,
>>>> @@ -61,7 +118,8 @@ static const struct flash_info macronix_nor_parts[] = {
>>>>  		.id = SNOR_ID(0xc2, 0x20, 0x16),
>>>>  		.name = "mx25l3205d",
>>>>  		.size = SZ_4M,
>>>> -		.no_sfdp_flags = SECT_4K,
>>>> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>>>> +		.fixups = &mx25l3205d_fixups
>>>>  	}, {
>>>>  		.id = SNOR_ID(0xc2, 0x20, 0x17),
>>>>  		.name = "mx25l6405d",
>>>>
>>
>> If all support 1-1-2, (seems MX25L3205D doesn't), then we may have a
>> change to don't update the core.
>>
>> Frankly I don't care too much about what happens in the manufacturer
>> drivers, but I do care about the core and to not extend it with . This
>> patch is not too heavy to be unmaintainable and shows clear where the
>> problem is, we can keep this as well.
> 
> It's a horrible hack. For example I'm working on a patch to clean up
> the spi_nor_set_read_settings() handling. So just throwing any code
> into vendor drivers doesn't make it any better in terms of
> maintainability. I'd need to touch all the code anyway. In fact it
> makes it even worse, because it looks like the manufacturer drivers
> are just a dumping ground for bad things. Thus, I'd really have it
> handled in a correct way inside the core.
> 
> Also, this is not device specific. Let there be two different
> flashes with the same ID, but one support SFDP and one doesn't.
> Right now, you have to have any of the magic flags (dual, quad,
> etc) set to trigger an SFDP parsing. If the flash without SFDP
> doesn't support any of these, like in this case, we are screwed.
> Hence we might need such a flag also for other flashes.

maybe. How many such flashes have you seen in the last 3 years?
> 
>> Other option that I'd like you to consider is whether we just remove
>> support for MX25L3205D, thus the entry altogether, and instead rely on
>> SFDP to set everything.
> 
> Well, this will break boards with this flash :) And we don't know if
> there are any.

The flash (MX25L3205D) was already deprecated in two iterations by the
manufacturer. First migration being done in 2011 [1]. Having to maintain
all flavors is a pain, thus let's remove support for the old flash. If
anyone complains we can bring it back to life, but let's not complicate
our existence yet.

[1]
https://www.mxic.com.tw/Lists/ApplicationNote/Attachments/1858/AN058-Migrating%20from%20MX25L3205D%20to%20MX25L3206E-1.2.pdf

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
