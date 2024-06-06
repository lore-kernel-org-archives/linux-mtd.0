Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22631C27C55
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO3gZj65wwOU72xnnxw9blJA6OgOIt8H1BD4KLZoxQo=; b=G/n1kJ61NlUCxb
	fyd5dfIKsH+EheomjT1/zliflY0ehrm0EQ2oEoqrRFOEpPCQALL2pf27sYcA7RGnKIus6U3EdGGhM
	LhI1imzKwPhuUr+ToRjtPhJaJ5CL2SYpfoJcFPlTZDiddoEWkMUz4xy5TekKDhL0wMDIw8p86+2fI
	E9ST/f+RiZREtZPgQfLZhKhESW4ic+FUAjZdRwTVfUIgS9Ht0CPQs2WKzxPH6/6Rpbix6aKEvOijQ
	wB+Ryb60RvATecV6vEopGeWsCd/7anvtUFzdG42s/+PVkbki5SGmFrHSUXnzIg719MAA1DDPIJXhg
	ZfjF8q9flO+PnUWEMzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDBg-00000009t3D-31PL;
	Thu, 06 Jun 2024 13:29:52 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDBd-00000009t25-0eFa
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 13:29:50 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2eabd22d404so10587221fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717680587; x=1718285387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Xez4WR8DSU7fKFNpGE2JQFyauplFotDS49TAIDs+7Q=;
        b=REeiBCRGjcJhErZ9hJ431k1Fq19UBlENceKn8s8jNwfb+8GffBPghS8i472FkiRV3Q
         z/U4qdP5lSy6wPwP2A4nNggiUJ1ef5BPAHLOO8/CUuFAMaCvi6QYBIJRXOA0tBLAZyiP
         DJ/LfLVv+tPunA+mC+oHbvPVAsna/hCPsgJp4I5BZTixpZzSCp8GlwAhSZBJHNJTW3Oy
         Hfjo08jZbkpu5DHsCzC+ARmeoxAfOKfULY68WuGQh7iHQQwOy52KTUp2r0GO2m7HsBcF
         iZq9A2leVjkmLVKtq+jmKx6uFpOc/fA/xoUAPBbrGP8TtjJuUSSlGqUh3h1TwRwZ+YNQ
         rU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680587; x=1718285387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Xez4WR8DSU7fKFNpGE2JQFyauplFotDS49TAIDs+7Q=;
        b=cL1MP6sTQsxHyYshPuZNFYqFuhesW6h5cO3H7/EqgLW4ZmFg5WgZ8WD3xg1ae4ND86
         09k6sy/llllbFEnLZM6/kd2Y8QdQ4NwBFUjAUwJkUqxt8k8jmW49WhWbA/HvPqVrHaGS
         qA7YxXovQuUgOT3b+/NMrQrFOdMxd+QEI+oJQ37kfKjViPGcaXiXBSLqCCp9U8sVOE+6
         2isFMwIMTYttpQrTYLjxTkbZbe+ZdgPmrc+7OMLsAaI2DvcQ7ycqHWXU3lRvsrTc8FWr
         +hkizrgbO7w6AGNyGgr1HDxVuRmvyWYPlHXFSU5Z4PhPnNtYApB+/23GiLvhtXnm0dZ8
         u2kQ==
X-Gm-Message-State: AOJu0YxCmpIm5LHDf6VdjCLWII18TG2lwTcsqE0TS7/ovLiU0vbogOZX
	sYSbLyiDpmXmdO6dR8aOzpwEc+UkDT67BjhJFA1qWpX70kNRZ4xJODAbXkB/rMdagStGiyiHj/S
	v
X-Google-Smtp-Source: AGHT+IH779I+q/2lL0Z3owDZLr52mPo7b8egVqaVc+zBUGqtFPugx5nSBFwHLKZflsecvuFvG9bqgw==
X-Received: by 2002:a2e:7d0f:0:b0:2e1:cb22:a4d with SMTP id 38308e7fff4ca-2eac7a4c6bemr34468601fa.36.1717680586617;
        Thu, 06 Jun 2024 06:29:46 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae0e9f2asm1085624a12.36.2024.06.06.06.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 06:29:46 -0700 (PDT)
Message-ID: <8513a828-6669-4bf3-91d3-799771866f32@linaro.org>
Date: Thu, 6 Jun 2024 14:29:44 +0100
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D1Q7BU6PJ356.1CTXPUZE8U6XX@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_062949_247947_5F31601B 
X-CRM114-Status: GOOD (  41.11  )
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



On 6/3/24 08:25, Michael Walle wrote:
> Hi,
> 
> On Fri May 24, 2024 at 12:48 PM CEST, Esben Haabendal wrote:
>> Macronix engineers apparantly do not understand the purpose of having
>> an ID actually identify the chip and its capabilities. Sigh.
>>
>> The original Macronix SPI NOR flash that identifies itself as 0xC22016
>> with RDID was MX25L3205D. This chip does not support SFDP, but does
>> support the 2READ command (1-2-2).

and it lacks support for 1-1-2?
>>
>> When Macronix announced EoL for MX25L3205D, the recommended
>> replacement part was MX25L3206E, which conveniently also identifies
>> itself as 0xC22016. It does not support 2READ, but supports DREAD
>> (1-1-2) instead, and supports SFDP for discovering this.
>>
>> When Macronix announced EoL for MX25L3206E, the recommended
>> replacement part was MX25L3233F, which also identifies itself as
>> 0xC22016. It supports DREAD, 2READ, and the quad modes QREAD (1-1-4)
>> and 4READ (1-4-4). This also support SFDP.
> 
> Thanks for collecting all this info!
> 
>> So far, all of these chips have been handled the same way by the Linux
>> driver. The SFDP information have not been read, and no dual and quad
>> read modes have been enabled.
>>
>> The trouble begins when we want to enable the faster read modes. The
>> RDID command only return the same 3 bytes for all 3 chips, so that
>> doesn't really help.
>>
>> But we can take advantage of the fact that only the old MX25L3205D
>> chip does not support SFDP, so by triggering the old initialization
>> mechanism where we try to read and parse SFDP, but has a fall-back
>> configuration in place, we can configure all 3 chips to their optimal
>> configurations.
> 
> You are (mis)using the quad info bits to trigger an sfdp read,

right, not ideal.

> correct? In that case, I'd rather see a new flag in .no_sfdp_flags
> to explicitly trigger the SFDP read. Then your new flash would only

I hate to update the core for vendor's madness.

> need this flag and doesn't require the shenanigans with the fixup,
> right?
> 
>> With this, MX25L3205D will get the faster 2READ command enabled,
>> speading up reads. This should be safe.
>>
>> MX25L3206E will get the faster DREAD command enabled. This should also
>> be safe.
>>
>> MX25L3233F will get all of DREAD, 2READ, QREAD and 4READ enabled. In
>> order for this to actually work, the WP#/SIO2 and HOLD#/SIO3 pins must
>> be correctly wired to the SPI controller.
> 
don't add superfluous info. we already know how quad works.

> That should already be taken care of with the spi-{tx,rx}-bus-width.
> 
> -michael
> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>> I only have access to boards with MX25L3233F flashes, so haven't been
>> able to test the backwards compatibility. If anybody has boards with
>> MX25L3205D and/or MX25L3206E, please help test this patch. Keep an eye
>> for read performance regression.
>>
>> It is worth nothing that both MX25L3205D and MX25L3206E are
>> end-of-life, and is unavailable from Macronix, so any new boards
>> featuring a Macronix flash with this ID will likely be using
>> MX25L3233F.
>> ---
>>  drivers/mtd/spi-nor/macronix.c | 60 +++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index ea6be95e75a5..c1e64ee3baa3 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -8,6 +8,63 @@
>>  
>>  #include "core.h"
>>  
>> +/*
>> + * There is a whole sequence of chips from Macronix that uses the same device
>> + * id. These are recommended as EoL replacement parts by Macronix, although they
>> + * are only partly software compatible.
>> + *
>> + * Recommended replacement for MX25L3205D was MX25L3206E.
>> + * Recommended replacement for MX25L3206E was MX25L3233F.
>> + *
>> + * MX25L3205D does not support RDSFDP. The other two does.
>> + *
>> + * MX25L3205D supports 1-2-2 (2READ) command.
>> + * MX25L3206E supports 1-1-2 (DREAD) command.
>> + * MX25L3233F supports 1-1-2 (DREAD), 1-2-2 (2READ), 1-1-4 (QREAD), and 1-4-4
>> + * (4READ) commands.
>> + *
>> + * In order to trigger reading optional SFDP configuration, the
>> + * SPI_NOR_DUAL_READ|SPI_NOR_QUAD_READ flags are set, seemingly enabling 1-1-2
>> + * and 1-1-4 for MX25L3205D. The other chips supporting RDSFDP will have the
>> + * correct read commands configured based on SFDP information.
>> + *
>> + * As none of the other will enable 1-1-4 and NOT 1-4-4, so we identify
>> + * MX25L3205D when we see that.

I find this description more clear than the commit message. I've written
some questions for the commit message, then I removed them once I read
this description.

>> + */
>> +static int
>> +mx25l3205d_late_init(struct spi_nor *nor)
>> +{
>> +	struct spi_nor_flash_parameter *params = nor->params;
>> +
>> +	/*                          DREAD  2READ  QREAD  4READ
>> +	 *                          1-1-2  1-2-2  1-1-4  1-4-4
>> +	 * Before SFDP parse          1      0      1      0
>> +	 * 3206e after SFDP parse     1      0      0      0
>> +	 * 3233f after SFDP parse     1      1      1      1
>> +	 * 3205d after this func      0      1      0      0
>> +	 */
>> +	if ((params->hwcaps.mask & SNOR_HWCAPS_READ_1_1_4) &&
>> +	    !(params->hwcaps.mask & SNOR_HWCAPS_READ_1_4_4)) {
>> +		/* Should be MX25L3205D */
>> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_2;
>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>> +					  0, 0, 0, 0);
>> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_4;
>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
>> +					  0, 0, 0, 0);
>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
>> +					  0, 4, SPINOR_OP_READ_1_2_2,
>> +					  SNOR_PROTO_1_2_2);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct spi_nor_fixups mx25l3205d_fixups = {
>> +	.late_init = mx25l3205d_late_init,
>> +};
>> +
>>  static int
>>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>>  			    const struct sfdp_parameter_header *bfpt_header,
>> @@ -61,7 +118,8 @@ static const struct flash_info macronix_nor_parts[] = {
>>  		.id = SNOR_ID(0xc2, 0x20, 0x16),
>>  		.name = "mx25l3205d",
>>  		.size = SZ_4M,
>> -		.no_sfdp_flags = SECT_4K,
>> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>> +		.fixups = &mx25l3205d_fixups
>>  	}, {
>>  		.id = SNOR_ID(0xc2, 0x20, 0x17),
>>  		.name = "mx25l6405d",
>>

If all support 1-1-2, (seems MX25L3205D doesn't), then we may have a
change to don't update the core.

Frankly I don't care too much about what happens in the manufacturer
drivers, but I do care about the core and to not extend it with . This
patch is not too heavy to be unmaintainable and shows clear where the
problem is, we can keep this as well.

Other option that I'd like you to consider is whether we just remove
support for MX25L3205D, thus the entry altogether, and instead rely on
SFDP to set everything.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
