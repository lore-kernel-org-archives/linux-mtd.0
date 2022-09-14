Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC770ECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Sep 2022 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOM2oNn5tUUJSQlMnd+Mgx26UQbOawWObw/0hwafWcE=; b=0fMs0c/x5AeQAm
	lyHPiKNMr8uRbwORHUZzOWSuQhIuOJMgeGne+2okZSGAOuE5s16SJvgTHA/pL5t8bafPjKTsjCoc9
	X/4K8I5GdX3i6Hvy8DqhWiwIfACEbMBXDxUp5wqEbacwG+es4CsvQxPduIy2SClmxBh5l8C5ggOKA
	cR1cmHCQlCZT+kiBRiIfOK1JTVSFtfiT7WzR3U9NXEfZJGiJaZj22slV8SfPtWZPeS3eh9xPaPZx7
	wtyB6UDuCpi4cSbWwMrkrQvVAshDmrvML9qx9OKTtctogdPA09grsiX3gybrl/PHVDaKozrHPanQ6
	xY4xeGygJx2N4W3dSRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZMF-009X1s-1n; Wed, 14 Sep 2022 20:51:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZM1-009WrO-St; Wed, 14 Sep 2022 20:51:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id go6so11539054pjb.2;
        Wed, 14 Sep 2022 13:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dlyCVmQYKvV9dtFJPrSziTcD5W40HZ0uDRKK1oXcTjY=;
        b=nQ2uU+3R3PULyzrTap/XMmm6mJFph0hl/rwnZDVw4fHif64LfKbHO5rnhHo7ZBGOhY
         Y+K6cgM4AMO5ADpYIlPnp0jr65QZdHHyYjxW3ZqMKO0iLcGO0nCwAHDEI3uBPvfrcl2j
         49PHNjtCegfj1qk5vtGsD9x6EtUsobJDjYldgWkP8TeMOTJuNuXjCl3smhpkRV8//W9n
         JZycJBfXGmUQJvbuV7hICwvCZYZNe39ycv/ITCW0Vu9F0iL+aJ5R386WELsGIzJjwDDp
         81xNJ26VgXtES9YHUSfP0fRtEDxe2rjAbaQJ0oFLWXGODCW0tM2h8ClQBwclicg1Uuba
         I+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dlyCVmQYKvV9dtFJPrSziTcD5W40HZ0uDRKK1oXcTjY=;
        b=6gDRK/X+jLMlaPaLPiPAOkojtekXZ1H+MAartmXSoUGzL4Weo9xWBEqJcupreZ7vdp
         2zRtxO5OS4wzat2cGCa9dkVmiNiTrLdtP/I+dNirlV5B9c9GI9fbTYgHKBR2CTXjII1c
         gsYD5bI/AFlZ7jTT/9lbwycm7IxSQeISFY4ysCA875KXrC8nMBzqQADtA6+/j9pszKk4
         Cp2gCJT68g2hGABHNakbWZgt7G62iRLvinrnHXvUhIwzO5Qv1v9twAZdokrjAp5Ah9en
         qca7b2KzWL4aa5eokPBGlKQaI/CGLzt5LDHWFqw8fAD6kFUCpsws5b5jbUMEqSqk3Kxr
         7HrQ==
X-Gm-Message-State: ACrzQf00rVIvzm5MXq2homLdPx0LWrAOl9z0WQTv1vuTp/SwiJTnMmI4
	w2G+zWlgBToZeRj4L5+ARI5WjJ6im0F0KphXqP0nA9h+XHfuBA==
X-Google-Smtp-Source: AMsMyM4KjrM0IM3832iUKTWtgifnk8PV7Aeeje1iXgE7szIfUB5EJlsMpXz2Wp+mJmuo+laDp3uhoy2nfimJMACoQmc=
X-Received: by 2002:a17:90b:17cf:b0:202:95a2:e310 with SMTP id
 me15-20020a17090b17cf00b0020295a2e310mr7000218pjb.76.1663188687895; Wed, 14
 Sep 2022 13:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220914201049.3508104-1-han.xu@nxp.com>
In-Reply-To: <20220914201049.3508104-1-han.xu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Sep 2022 17:51:16 -0300
Message-ID: <CAOMZO5AGxXqF8Q6jhfr7vbZmQd6MU4SzFpj5XQG7cPtmdFrFVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx6sx: remove the SET_RATE_PARENT flag for
 QSPI clocks
To: Han Xu <han.xu@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, 
	"open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_135129_966848_EBEABFF3 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Han Xu,

On Wed, Sep 14, 2022 at 5:11 PM Han Xu <han.xu@nxp.com> wrote:
>
> There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
> should not be used. For instance, the default parent clock for QSPI is
> pll2_bus, which is also the parent clock for quite a few modules, such
> as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
> hang due to pll2_bus rate changed.

Thanks a lot for your patch.

This fixes the kernel hang issue on a custom imx6sx board with NAND without the
need of using the workaround found in the NXP kernel:

https://source.codeaurora.org/external/imx/linux-imx/commit/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c?h=lf-5.15.y&id=d03eb99c393f8732f70a1d7d29a3b9c42cccbe48

Tested-by: Fabio Estevam <festevam@denx.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
