Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C73ECAAD8
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Sep 2022 07:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIQwu3H2q77bAhzvKUnaHjmjvsxxREJQXU9YkNyyp6M=; b=o4dYxmjMTPMWghbnhIYhQF202+
	MTTYvr2dA0j88NbS9ha3VlqjNIe7AjSyzjWaiMrZq2woKdjLRKjammjd8UE1NNBiWFpfCaJ5Iu2yq
	3LqCfwcskBuBzV93SM6QA3SpA7sDXyOG2McA7of0EOV6e4BNoni1zhPB9Qu9v5uU6ovXrrCLRGF6d
	1z7lawUVLR6Gnlf5DXJZg4elwv478mawASr/EdUKSI4y9/H+buIeGiFvItzi4dgc1ii3vnEr85LrW
	U+AOwniDQ81V9mAuQiN+PyZvU7C5XA+yRHMkixaB2VAkQleIras8XFz8z4OoALkRDq+P7jzF70JLC
	vYET3FaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMnv-009dZP-6Q; Wed, 14 Sep 2022 07:27:27 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMns-009dPd-Da
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2022 07:27:26 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0B3B516AE;
	Wed, 14 Sep 2022 09:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663140440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLwD8obQ6Qt890iBeArYKjMU9g5TO/AqEdCfATpDT6U=;
	b=Ad/dKRr2NUbPX1thLzfT8L6p6n6se2nT6bH9HclcRw3hlWtyEQoHLcRT76mGCGHfbnI/C4
	nkG3mplSPe12ExgM7fUebzXlQQJNZqGTfqOuLuTZebwUzpxn+4N9DmgVU8LtAzHVLdilZi
	5baAtkEqOZf+yhmFYHCRF3jwHJ9TQi3mbP6ZDcNP6l5Qknw3s6EAcVL0gWVnBvxXaBJSOh
	YZa9spwwiZEiSSsusDCpe1LhOAFFle0Oi7DYZS2TxsI8odjhlZm/gs+5mog6GbZY7J1Vek
	13c/GeRjGoEe/TBy45/CPS4CKblHrTECnT5ILStkJp3HjzFnIgZrqI3ACRLwJA==
MIME-Version: 1.0
Date: Wed, 14 Sep 2022 09:27:19 +0200
From: Michael Walle <michael@walle.cc>
To: Yaliang Wang <Yaliang.Wang@windriver.com>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: gd25q256: replace
 gd25q256_default_init with gd25q256_post_bfpt
In-Reply-To: <948d4846-dd7e-04a3-51e7-588d266cc28e@windriver.com>
References: <20220913084023.2451929-1-yaliang.wang@windriver.com>
 <MN2PR17MB3375BC0E5878B19651475413B8479@MN2PR17MB3375.namprd17.prod.outlook.com>
 <948d4846-dd7e-04a3-51e7-588d266cc28e@windriver.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9b87331960933687145688308e2ab97a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_002724_668084_B1E83E21 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-09-14 05:05, schrieb Yaliang Wang:
> In case the mail list can't receive the email, I'd like to send the 
> email again.
> 
> Sorry, I didn't make it clear.
> I'm doing this because the flash info member parse_sfdp is initialized
> to "true" by PARSE_SFDP macro, as you can see below
>         { "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
>                 PARSE_SFDP
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | 
> SPI_NOR_TB_SR_BIT6)
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>                 .fixups = &gd25q256_fixups },
> 
> And when parse_sfdp is true, the function spi_nor_init_params() will
> call spi_nor_parse_sfdp() to initialize the parameters, and I can't
> see any other place to call the original default_init() hook in the
> fixups other than in spi_nor_init_params_deprecated()  ->
> spi_nor_manufacturer_init_params().
> 
> After checking the history of why we are adding this, that is to say
> the commit 48e4d973aefe ("mtd: spi-nor: Add a default_init() fixup
> hook for gd25q256") and the corresponding disscusions, I believe it
> was added for some reason, and we need to add back this function.
> 
> On 9/13/22 18:46, Vanessa Page wrote:
>> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>> 
>> Why are you doing this?

Vanessa Page is a bot/troll.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
