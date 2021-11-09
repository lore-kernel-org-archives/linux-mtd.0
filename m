Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC84C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED21C61186
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED21C61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0V3fpse198Yg2AOZrdse52a0EIxM5KKPrymoVTqR+rs=; b=B6X4UeMCsCZDRG85QspF0H7PQ1
	9I205desnjlf+YIfwZe18q1ZhB8l7AgSZAOgedTT8qViNqs0mYVkyMaauYXGZ7MOrJTeg92ifTMln
	L0KZM4e/wGW0pP4Y/Ty4OIKtHTjalGhaYgjANCaF1kimADulmn+kQPGDGPpADpo25/BYoZ/ccxDyR
	a96OF6JHWXAOR3t3Ywcs6dZhz7L8b3iTFzP9wjJUkNI+gYwkDT/S53XChNQRKUYuPF8EeCtaY6zAm
	ZQvBYNAjNFX5p88alsc9qp5gkbBBLaUnZdxDxzeFPg90P5RcxVO+zsczM7tVJpQ75iHDoLvO6oXJB
	ozv587zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMOf-000ycN-3I; Tue, 09 Nov 2021 08:22:25 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMNa-000yGZ-8p; Tue, 09 Nov 2021 08:21:19 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 67E5622234;
 Tue,  9 Nov 2021 09:21:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636446075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2ldhAroQnaHp9yHXauCKba58QkY3Y/gXoYqAjzWpr4=;
 b=sIdVoBhAfAQjiE+1LEQghd8HA32+XasEpoMNOGJRXifn0reLKgkt29GL9B2ruG6cqngPCi
 n0T4Xnk1Iv2vwN8Ueuh7M5btdRB5Oc8gDhBNa87YbkLtRHrBuxZ2/JiA041X988rb63VMh
 AXtWKNS2VilBiNWbr08/lcI260QT7Kk=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 09:21:15 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 02/25] mtd: spi-nor: core: Use container_of to get the
 pointer to struct spi_nor
In-Reply-To: <20211029172633.886453-3-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-3-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e755a5fd1e385d279be880c785cbab3e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_002118_534479_432A4651 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-29 19:26, schrieb Tudor Ambarus:
> "struct mtd_info mtd" is member of "struct spi_nor", there's no need
> to use "mtd->priv". Get the pointer to the containing struct spi_nor
> by using container_of. While here, make the function inline and
> get rid of the __maybe_unused.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
