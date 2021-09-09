Return-Path: <SRS0=lC14=N7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C796BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 21:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9EF6103E
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 21:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D9EF6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUa+ZSHTfGBN1UywMBSf6YR6RDjIiWetoTF1vDig+3Y=; b=PqYGm+fnY0Wp1WUMwlZO+L2Ttb
	DZfwaIUXRThAT6nAZ29O02A1LPdsGbxu1whkWEpIldHA7mBqEU263cBNiaPoi3g9rppKo3h81xrpf
	tRh/ZmD2w4nKenwyeVrxmQaOKXLsOkkSpDB0cBIumTtFtomPzC+wwYn/2YP7SpLYhLo+gDVpDuDOc
	/3b12M58EEzGxXLtOfMceix4fwiu04zqlqpH4EdmCqNeD8MQzKXxkdx5TL/vhtpNlPkJTYEI3wZLf
	7+ZtKBgc6rGzf76P7GbwIJ1K92TrzFlks1FmCMS/yDfvOGFQgWRrecchS08GRmhTQUstdvcHVbWjn
	dLAI3eZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mORn8-00AxbE-0z; Thu, 09 Sep 2021 21:41:06 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mORmt-00AxYm-OP; Thu, 09 Sep 2021 21:40:53 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8665E22236;
 Thu,  9 Sep 2021 23:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1631223647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4EVcKCMd+LWev/Z/ZQzpR85qUjXLRFSW9+FgD3MfAI=;
 b=d2nNaqzYHcU/e/Z8ypYUQnZrASDeohg7Se5WiIM40DlWreah5x9vpqPpC0Kldm1JzeHVkl
 NaMtjUXaUv2VX/EYivm0fcdjMe/qf5p5IF9Vcf7yZ/t6BuU+i4Hf6IUINekEdy6r3jbnkC
 7r1yRBSHCZkxBopn6Ix4hTw2Zq9cODQ=
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 23:40:44 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() hook
In-Reply-To: <20210816185446.topxrgwmvpt6n4ct@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-9-tudor.ambarus@microchip.com>
 <20210816185446.topxrgwmvpt6n4ct@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1176aa457faf4ef5b60558a70c9b70b5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_144052_164653_AEE5CB39 
X-CRM114-Status: GOOD (  29.74  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-08-16 20:54, schrieb Pratyush Yadav:
> Hi Tudor,
> 
>> Subject: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() 
>> hook
>                                                               ^^^^^^^^
> You ate the 'l' ;-)
> 
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> The goal is to get rid of the spaghetti way of initializing the flash
>> parameters and settings. late_init() hook will be used to tweak 
>> various
>> parameters that are not defined by the SFDP standard. Can be used by
>> non SFDP compliant flashes in order to tweak flash parameters that
>> are not/shouldn't be handled by the flash_info flags. Will replace the
>> default_init() hook.
>> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 15 +++++++++++----
>>  drivers/mtd/spi-nor/core.h |  8 ++++++++
>>  2 files changed, 19 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index d30c8f350dc1..15ccc9994215 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2667,11 +2667,18 @@ static void spi_nor_post_sfdp_fixups(struct 
>> spi_nor *nor)
>>   * spi_nor_late_init_params() - Late initialization of default flash 
>> parameters.
>>   * @nor:	pointer to a 'struct spi_nor'
>>   *
>> - * Used to set default flash parameters and settings when the 
>> ->default_init()
>> - * hook or the SFDP parser let voids.
>> + * Used to tweak various flash parameters that are not defined by the 
>> SFDP
>> + * standard. Can be used by non SFDP compliant flashes in order to 
>> tweek flash
>> + * parameters that are not handled by the flash_info flags.
> 
> What about flashes that do have the SFDP table, but not all of them? 
> For
> example, the Micron MT35XU512ABA flash currently uses the post_sfdp()
> hook to populate 8D-8D-8D fast read settings, command extension type,
> etc. These are supposed to be obtained from the xSPI Profile 1.0 table
> (like we do for Spansion/Cypress S28HS512T). But the flash does not
> populate this table. Should these go into the late_init() hook or the
> post_sfdp() hook?
> 
> FWIW, I think it should go into late_init(). post_sfdp() should only be
> used for correcting info obtained from the SFDP table. For populating
> the info not present in SFDP at all, late_init() should be used.
> 
> Thoughts?

Is there any difference between these? According to the description
in spi_nor_init_params() your case should go into post_sfdp(). Mh
or maybe not. It says "incomplete tables", one could interpret it
either way. We should clarify which fixup goes where, esp. this case
here where there should be a table describing it, but there isn't.

-michael

>>   */
>>  static void spi_nor_late_init_params(struct spi_nor *nor)
>>  {
>> +	if (nor->manufacturer && nor->manufacturer->late_init)
>> +		nor->manufacturer->late_init(nor);
>> +
>> +	if (nor->info->late_init)
>> +		nor->info->late_init(nor);
> 
> Manufacturer late_init goes before flash late_init. Makes sense.
> 
>> +
>>  	/*
>>  	 * NOR protection support. When locking_ops are not provided, we 
>> pick
>>  	 * the default ones.
>> @@ -2713,8 +2720,8 @@ static void spi_nor_late_init_params(struct 
>> spi_nor *nor)
>>   *    wrong).
>>   *		spi_nor_post_sfdp_fixups()
>>   *
>> - * 5/ Late default flash parameters initialization, used when the
>> - * ->default_init() hook or the SFDP parser do not set specific 
>> params.
>> + * 5/ Late flash parameters initialization, used to initialize flash
>> + * parameters that are not declared in the JESD216 SFDP standard.
>>   *		spi_nor_late_init_params()
>>   */
>>  static int spi_nor_init_params(struct spi_nor *nor)
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index e9896cd60695..13d5c5edfd27 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -391,6 +391,11 @@ struct flash_info {
>> 
>>  	/* Part specific fixup hooks. */
>>  	const struct spi_nor_fixups *fixups;
>> +	/*
>> +	 * Init flash parameters that are not declared in the JESD216 SFDP
>> +	 * standard.
>> +	 */
>> +	void (* const late_init)(struct spi_nor *nor);
>>  };
>> 
>>  /* Used when the "_ext_id" is two bytes at most */
>> @@ -457,12 +462,15 @@ struct flash_info {
>>   * @parts: array of parts supported by this manufacturer
>>   * @nparts: number of entries in the parts array
>>   * @fixups: hooks called at various points in time during 
>> spi_nor_scan()
>> + * @late_init: used to init flash parameters that are not declared in 
>> the
>> + *             JESD216 SFDP standard.
>>   */
>>  struct spi_nor_manufacturer {
>>  	const char *name;
>>  	const struct flash_info *parts;
>>  	unsigned int nparts;
>>  	const struct spi_nor_fixups *fixups;
>> +	void (* const late_init)(struct spi_nor *nor);
> 
> The patch looks good to me other than the comments above.
> 
>>  };
>> 
>>  /**
>> --
>> 2.25.1
>> 

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
