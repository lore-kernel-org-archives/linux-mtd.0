Return-Path: <SRS0=mYMn=LT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4EEC2B9F4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 08:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5785F61426
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 08:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5785F61426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgEWhqL7FLbvho4DGIpqiP/jlEwIrOPJnJUPymHVPfc=; b=m2W0SLfVgcs8zt5jK+z1antXoy
	0C+2JHeoaf6Tixfr9y/koDlJOL1b4VcfTy18V+msFrPSGW+0on2Gwl6N71zNIW+3FGz+TOxzSx2Tf
	75FcDvpzlZUxcI6aNSkHzg9VmvkBkl0F2Ab7uK1QUZ4UP2Gu1sPtvS2mpfgTU8ITcb5okOni0GaWY
	HFSc7AcPuabREtMEAACkKg1CO7RGaat+E6rXzK5MQPLABjBXr9pSmVDxNfMbiRZ1IZJAL6Y0RtLOx
	3yKKekc+4sri5Tzmo0a1q9/nHMLbnnLu4wLDe/48W9IX9VPbX1ijRvbcoXaE/ouO5gapFGFryLS7U
	pzJy+mxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwgwQ-000EdU-I6; Fri, 25 Jun 2021 08:11:58 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwgZc-0007ac-1I; Fri, 25 Jun 2021 07:48:25 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 60A1B22249;
 Fri, 25 Jun 2021 09:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1624607297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muVToPjbhEudsJJAmtZrtjaYbzMMnT/oWsAuUQB7DeY=;
 b=uvpeR03zX5HVoJhVXczBF1935yKR5tSpkMX0iwaXWRRGDNa2bZwkhs7zy9BzCpbThTzfO1
 5dCjy86V2SQ2dtSNeluBrmQsAoZv5Hbcn2UlK5Z0Oa2Atyct/f5FYM82KfNKGu9vchjSOE
 tmOdXknO4aVm/SG5J7TGdxLGQDsBSTk=
MIME-Version: 1.0
Date: Fri, 25 Jun 2021 09:48:15 +0200
From: Michael Walle <michael@walle.cc>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, Chris
 Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v9 02/10] spi: rockchip-sfc: add rockchip serial flash
 controller
In-Reply-To: <20210625071702.10374-3-jon.lin@rock-chips.com>
References: <20210625071702.10374-1-jon.lin@rock-chips.com>
 <20210625071702.10374-3-jon.lin@rock-chips.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <118417b6dc18d345a1d1e10efd0c8a1a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_004824_272909_1B554ACF 
X-CRM114-Status: UNSURE (   7.98  )
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

Hi Jon,

Am 2021-06-25 09:16, schrieb Jon Lin:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the rockchip serial flash controller (SFC) driver.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> Changes in v1: None

This look wrong. Wasn't there any changes in any patches but 1/10?

Please include a proper version history instead of putting the
burden to the reviewer.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
