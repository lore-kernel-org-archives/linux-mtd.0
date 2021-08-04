Return-Path: <SRS0=SwGG=M3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1BFC4338F
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Aug 2021 08:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D204D60EE8
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Aug 2021 08:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D204D60EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsrpQstZNZHSjOL9GKpZgVPu1vNx29tOQUBKx6aLmIo=; b=324VjVy2yjmIe4
	15n41w9bTxOHPPZEqx9fgV7CeHPmFA2+Ose7e/mDjmmJPa2alH96a30lO/vU+323mTedX9xTGO9o/
	U18ZsnfQB07nn79KJ8wBS2MMgznLbi7HPU2BULCm2vo0vqYiVKIta2j0CTzoIzx4VFrsxTGxB8nxV
	tijgvzFmhB0PcXDln7hKNlh8jcNso410GCeB6iuKLllZ+/vyimdU0hj8P05oEFtZKkicV6wPT6SoM
	fnJmcEcttrV6HjyCFxWxGk/OHJAErMkSGNa9kL3zKm6j1W9DZN0j4eqGWvKRles2giYdpJSVvWnzw
	hrSZ2awrRXZHehGNnoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBByz-0055jb-I1; Wed, 04 Aug 2021 08:10:33 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBByv-0055j0-Nm; Wed, 04 Aug 2021 08:10:32 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17489ufq063718;
 Wed, 4 Aug 2021 03:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1628064596;
 bh=pkA2MLtmBxyQjEhkM13PYXEaqOlhxpOBXQuHuJmDqSk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=HoOxpwd98umlMwg7U1gBpgQZ5+70DmPhU4vEe7Jij99hSyDSAJQjVqIgDLAh0Taz7
 ViaQu2V697KelU0pfEG5Fxct6Bm1x+BKiSI9hp9FwR0OV/I+iX3ttRBNYuu6IGIyos
 ZE+uHYWmVzEnP1ZhKAhSZQ/juJQB8nESJ7JOmGDY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17489uaq092583
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Aug 2021 03:09:56 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 4 Aug
 2021 03:09:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 4 Aug 2021 03:09:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17489tcN072164;
 Wed, 4 Aug 2021 03:09:55 -0500
Date: Wed, 4 Aug 2021 13:39:54 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 01/35] mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
Message-ID: <20210804080952.4ys7wmae4j4h4ktk@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_011030_780578_1FB6BB7E 
X-CRM114-Status: GOOD (  18.78  )
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

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> SPI NOR flashes that statically declare one of the
> SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags and do not support
> the RDSFDP command are gratuiously receiving the RDSFDP command
> in the attempt of parsing the SFDP tables. It is not desirable to issue
> commands that are not supported, so introduce a flag to help on this
> situation.
> 
> New flash additions that support the SFDP standard should be declared
> using SPI_NOR_PARSE_SFDP. Support that can be discovered when parsing
> SFDP should not be duplicated by explicit flags at flash declaration.
> All the flash parameters will be discovered when parsing SFDP.
> Sometimes manufacturers wrongly define some fields in the SFDP tables.
> If that's the case, SFDP data can be amended with the fixups() hooks.
> It is not common, but if the SFDP tables are entirely wrong, and it
> does not worth the hassle to tweak the SFDP parameters by using the
> fixups hooks, or if the flash does not define the SFDP tables at all,
> then statically init the flash with the SPI_NOR_SKIP_SFDP flag and
> specify the rest of flash capabilities with the flash info flags.
> 
> With time, we want to convert all flashes to SPI_NOR_PARSE_SFDP and
> stop triggering the SFDP parsing with the
> SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
> SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easily achievable, the rest
> are a long term goal.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
