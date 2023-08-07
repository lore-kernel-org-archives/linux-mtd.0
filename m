Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB65C001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ/wQVnpHJs166uSvwarTk8cUBFW6mHmC/UtMNBFKH0=; b=J0rG6TFEUIHx3aNyswCqhX5XMY
	inQX0NECWxENNIIKv/MsmmY3203EJAibAskJumwHwiOaU5lP+0zGiqiFRLJMMRoTRMk3jxJ+sC67Q
	ppzgsGjTkAQGIW+5EgLbMpSFZvl9BSKn2saze8Kvn5Bn2Qox1p5VhSeQIHfAlGnUnaK6gK6bir3W+
	SCbDx6ajQaI8jh6y0SuDCnLIGG6r1iLy4WBrfpzyG8GspHT89KOIOu6WsGOAwCuzBMUbysZ7K7Izs
	3QfmKrlbACdjJwK88GALMS8HyeBdfQOiNS7VDkdI5r/+GSQFig+f69CdI87KOGTk1KUzwN6bdlWhc
	VL/NMWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStsH-00GHO9-15;
	Mon, 07 Aug 2023 06:37:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStsE-00GHNg-0Y
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 06:37:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D08AE61540;
	Mon,  7 Aug 2023 06:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0551C433C7;
	Mon,  7 Aug 2023 06:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691390268;
	bh=VbID8l3gYaI22U2ulCr8cvyMF65PwbgnhqFshPGcF08=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r2ShMwCis2o58DMNdcmwqwsupZgJbfNvYXAtp62Tz+aoSAW6EzPlzc4JU/WGVIbkh
	 KekZTHck1/n1B+6KHQoqctS4iIExW1uYgb4HsvrbetC2pDUkP6dtrsredm3NZOh73q
	 zIvo4rTWF9sX+qS6LVnlDUmLW1BX3kyvxjh0Ka1IbKvUBJUFiDWvh9ZBDR5hIvA6O5
	 0mFwUr8bngEEtrikL/2a5r0a+U5hqdRQ4AXU7PzgL6kY1695tnEx0u6ATDY8Mah2Wi
	 2n25j35+sYMJm6Bj7ge/nJuA+IZxPUno4Kl6VGLolDhfS5iMlIb9VC0m7h+EvO6rKz
	 Oob+TvYuzLasQ==
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 08:37:44 +0200
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
In-Reply-To: <20230804095409.278419-3-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com>
Message-ID: <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_233750_318165_6E9AB52C 
X-CRM114-Status: GOOD (  23.38  )
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

Am 2023-08-04 11:54, schrieb Jaime Liao:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Patch ID for flash support is a thing that we keep striving to do.
> Follow the optimization of software architecture, parse SFDP is
> the mainstream in SPI-NOR subsystem.
> Label "spi-nor-generic" to the flash which didn't include in ID table
> but support SFDP, is a good way for flash support.
> Building upon this fundation, achieve hooking the manufacturer using 
> the
> 1st ID byte.

This won't work beacuse the manufacturer id is not always
one byte long, think of continuation codes. In fact, as the
flash_info table is of now, we cannot even rely on the
continuation codes, but we have to always check for the
complete id_len, i.e. there is at least one hack where
the id is reversed and the manufacturer is the last byte,
iirc. some oddball cypress mram chip.

If you want to get the correct manufacturer for spi-nor-generic,
you should extract it from the SFDP tables. It seems that the
BFPT don't include a manufacturer id, but if there are proprietary
tables, you *might* use that id. I say might, because it only works
with one byte manufacturer ids, no continuation codes... *sigh*

-michael


> Consequently, extend support even for parts not descibed in SFDP.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5f29fac8669a..eb0a09c06bf4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2036,10 +2036,13 @@ static const struct flash_info 
> *spi_nor_match_id(struct spi_nor *nor,
>  	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
>  		for (j = 0; j < manufacturers[i]->nparts; j++) {
>  			part = &manufacturers[i]->parts[j];
> -			if (part->id_len &&
> -			    !memcmp(part->id, id, part->id_len)) {
> -				nor->manufacturer = manufacturers[i];
> -				return part;
> +			if (part->id_len) {
> +				/* Hook manufacturers when first byte (maf ID) is same as other 
> IDs on ID table */
> +				if (!nor->manufacturer && !memcmp(part->id, id, 1))
> +					nor->manufacturer = manufacturers[i];
> +
> +				if (!memcmp(part->id, id, part->id_len))
> +					return part;
>  			}
>  		}
>  	}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
