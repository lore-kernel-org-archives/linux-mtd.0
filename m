Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D4FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmcdgVrFNwN7wgGgDgIoCdVNMZurWnF4Cup/FayypzQ=; b=nCJNzi1K3MDKgS
	6RtnGkSI4kndOLKKQvKd9N/kNqemOTtCJPg+juXfeEuZvKwrfgPvEbIamAgdOsCrVkZmoh83ysbo0
	QvXOhF42PS1L6KjQuB1An7CobNKmJ7S4KN8spIzE+1wDrLtsJYdLAlRHuGl1eJbmQfu/ppMs+k0Z0
	fg/KZaQIlL2W25+XQdBhQNevvQd6RDd+Z8tRJIW4gA+BHM+H8ngudMJcxt53v18R5UiYoMmP0gWuy
	mYwzgqHGgQFN9sEmnSkIFjjf3Uib/MwXFHAl4B0Bba6DwJMHownIYb1AFPVmg+R51+8pzxksULVIO
	CjWLcEEendD++2uGseeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msiv6-00BjR0-TF; Thu, 02 Dec 2021 10:02:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msiv3-00BjQ8-Sm; Thu, 02 Dec 2021 10:02:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B2A1ugx109432;
 Thu, 2 Dec 2021 04:01:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638439316;
 bh=RB9K8RDiTRZmoh9I9ZSSj7S9WpHWn5RK8xP8xlJt168=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=BgI3sq/wcNGOqsWetBvay8KXTCKtTRh3VQfNLZOphuRqVbpSXTylnAYGJ3qA/U2Nz
 8iXJvDWB1zGlSrotLxe3VPaS9/05zmB8DkCYTmfID6Wkhu209IhH/y6uF7b6a9JrCo
 RHkFpKlHBto7YU7xlIPYX6FgZ3VPPe6Z1x2tLeFo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B2A1uVt049502
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 Dec 2021 04:01:56 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Dec 2021 04:01:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Dec 2021 04:01:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B2A1tmi100607;
 Thu, 2 Dec 2021 04:01:55 -0600
Date: Thu, 2 Dec 2021 15:31:54 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 05/13] mtd: spi-nor: Rework the flash_info flags
Message-ID: <20211202100152.h2j2hlsbf7xwvi3h@ti.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-6-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211122095020.393346-6-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_020226_050143_9728E390 
X-CRM114-Status: GOOD (  27.97  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/11/21 11:50AM, Tudor Ambarus wrote:
> Clarify for what the flash_info flags are used for. Split them in
> four categories and a bool:
> 1/ FLAGS: flags that indicate support that is not defined by the JESD216
>    standard in its SFDP tables.
> 2/ NO_SFDP_FLAGS: these flags are used when the flash does not define the
>    SFDP tables. These flags indicate support that can be discovered via
>    SFDP. Used together with SPI_NOR_SKIP_SFDP flag.
> 3/ FIXUP_FLAGS: flags that indicate support that can be discovered
>    via SFDP ideally, but can not be discovered for this particular flash
>    because the SFDP table that indicates this support is not defined by
>    the flash. In case the table for this support is defined but has wrong
>    values, one should instead use a post_sfdp() hook to set the SNOR_F
>    equivalent flag.
> 4/ MFR_FLAGS: manufacturer private flags. Used in the manufacturer
>    fixup hooks to differentiate support between flashes of the same
>    manufacturer.
> 5/ PARSE_SFDP: sets info->parse_sfdp to true. All flash_info entries
>    that support SFDP should be converted to set info->parse_sfdp to true.
> 
> SPI NOR flashes that statically declare one of the
> SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags and do not support
> the RDSFDP command are gratuiously receiving the RDSFDP command
> in the attempt of parsing the SFDP tables. It is not desirable to issue
> commands that are not supported, so introduce PARSE_SFDP to help on this
> situation.
> 
> New flash additions/updates should be declared/updated to use either
> PARSE_SFDP or SPI_NOR_SKIP_SFDP.  Once all the flash_info entries are
> converted to use SPI_NOR_SKIP_SFDP or PARSE_SFDP, we can get rid of the
> SPI_NOR_SKIP_SFDP flag and use just the bool nor->info->parse_sfdp to
> determine whether to parse SFDP or not. SPI_NOR_SKIP_SFDP flag is kept
> just as a way to differentiate whether a flash is converted to the new
> flags logic or not.
> Support that can be discovered when parsing SFDP should not be duplicated
> by explicit flags at flash declaration. All the flash parameters will be
> discovered when parsing SFDP. Sometimes manufacturers wrongly define some
> fields in the SFDP tables. If that's the case, SFDP data can be amended
> with the fixups() hooks. It is not common, but if the SFDP tables are
> entirely wrong, and it does not worth the hassle to tweak the SFDP
> parameters by using the fixups hooks, or if the flash does not define the
> SFDP tables at all, then statically init the flash with the
> SPI_NOR_SKIP_SFDP flag and specify the rest of flash capabilities with
> the flash info flags.
> 
> With time, we want to convert all flashes to use PARSE_SFDP and
> stop triggering the SFDP parsing with the
> SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
> SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easily achievable,
> the rest are a long term goal.
> 
> Manufacturer specific flags like USE_CLSR, USE_FSR, SPI_NOR_XSR_RDY,
> will be removed in a future series.
> 
> No functional changes intended in this patch.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Thanks, this looks quite good to me.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
