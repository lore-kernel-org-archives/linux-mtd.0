Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E398C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 22:49:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4CB61409
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 22:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4CB61409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ffQdmKkmLkEsFctfu4hXXv4yMj/HFb8fqCZteGW2oFg=; b=ra35MFF6gSDOd8OvrM+wdrX3+
	o8sb4iskjfsY1jWQN28GfIp3A9WTQDTPCzX15xBHAU0MXnFM4OkTQXIq2ViGyh18UPW+NrRzJGPlw
	ArvHABnQ5aGUKhweqv37QhnvkKpY3AkZMCx62d3E9+yrQUICYu7sz1yWX1mbLKiz/YYDs/Jx5pYwg
	hu6OfrOP58IMnQTprwYKB5Mrj2mG/IYcoQVgHlaHgeu4qDfpMGZYhkb+lxfE5ssSaTXeIxxAdVFjA
	Isyjh5wh+ungtxQDksNZHUGzN53oqfwLDdiarHSRWzh6gHmIEJaMDWwMS4IpyPtKbEtiMJecYoZSz
	Py6Ioz2Vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcFSr-006fJD-I3; Thu, 29 Apr 2021 22:48:58 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcFSY-006fEX-61; Thu, 29 Apr 2021 22:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=xpz2vUSKO6/55m06O1O//fMXB/R8r80PGS4qvX8VdOA=; b=AX+n1nZsDihEh7XD/5TTaC4TZv
 ktLFen48FVGIHLBcg5fRkeYSfoXjBVGEnIcnw+7TsQyuBqPl9oqP4os8oDsl/8mRTPhKcdLrUoQ9g
 HW4A9T3CXc48dRdWhMgkHP+6CNQNaMAh0wA7RujPqzCHH8zdTeY4+IQVBoG5TkRQb+h9TvpCZdePe
 b6ZdIYybjQr0NZmsoYeO84p0ycSNr+hvwryUppyW6u/AKi679Ta/6mtBKbfiM/BUTcgdogqjY0pQP
 AynA4UsRF9WPDBq07+qzYR2QmWu6Lgia6gntkSmZ7BO9d/Vrb19G451cmed29UMcUg3HJ7WHOMvUb
 GfsT7U6A==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcFSJ-00111Q-Dn; Thu, 29 Apr 2021 22:48:26 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ED2C722239;
 Fri, 30 Apr 2021 00:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619736502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpz2vUSKO6/55m06O1O//fMXB/R8r80PGS4qvX8VdOA=;
 b=KOaVJvx2SFj3w7VND+/8f0UbPBoIs2iOrXTSKfUdMbbBF3dPXNTB4A1VqL7QJYYmKKv5ky
 JiwTmts0NWMc0U7gYZ1q3tjXUtQ60O0yxgExMiq7EL/t9vkM8HRlAx4FUN8UepmmCTxszc
 QmHd5ITnUhYuaOPla46NvkRpgmApDiY=
MIME-Version: 1.0
Date: Fri, 30 Apr 2021 00:48:21 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 5/6] spi: cadence-qspi: Tune PHY to allow running at
 higher frequencies
In-Reply-To: <20210311191216.7363-6-p.yadav@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-6-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <143b24c61109823f6e616cf91d28d16c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_154823_650270_D77797AD 
X-CRM114-Status: UNSURE (   6.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-03-11 20:12, schrieb Pratyush Yadav:
> +	if (of_property_read_u32(np, "cdns,phy-tx-start", 
> &f_pdata->phy_tx_start))
> +		f_pdata->phy_tx_start = 16;
> +
> +	if (of_property_read_u32(np, "cdns,phy-tx-end", 
> &f_pdata->phy_tx_end))
> +		f_pdata->phy_tx_end = 48;
> +

I didn't see a dt-bindings patch for these.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
