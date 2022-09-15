Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BDDECAAA1
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Sep 2022 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0xClGnMl1O9ilF2X2vm5xZBaOarmo8k6C1wDHojFzM=; b=gl7aWx3pBtyHoP
	8syw3mamwXl2+PitZDcVFJL/fuVOL84soqBfEjtoZhVV835AWzpkMl3/lwO/zxGXmhjP8jsv7/GkL
	1dMCEpaygdD1O8CFRLtTwtSbtQtQxVDgkwNKhWiJzjPPPTunlcL+uwCjxFPRX2sjxtTgofmglW623
	8+HVlNvrHUYRsfMqX/OkeuGPYSj6x98r39IobzB1wXukOnE849lLtJpNTRfP2DO3JFzpnOsbQZtBT
	BXgrzAPFM+QtWsU0x30g5S8hPx+XzU8ixb7/wEPTDXlfp5WtzVJnV3x5CxN9ifbR0ZEvRYZaUx/1l
	sSDel1Da55GUCq4vkKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYr82-00CYcG-2j; Thu, 15 Sep 2022 15:50:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYr7d-00CYVV-EN; Thu, 15 Sep 2022 15:49:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so17851985pjh.3;
        Thu, 15 Sep 2022 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o8GIMFSFfJaC+NseNm4sPm6vviClb1WTiOKE9g6u8d0=;
        b=Kpb4UPsyc0fBVJ1kG8S0WqzJBoKaa0B0H4jZg2t5WRgA5DK0eem2whcmCniUqCAhze
         M4BMsNzAKvR12z9CTEwk046L8BqoPCrCt+S7i3rNECUmvWiRzaQJESAvYfSoQ4CtKSLR
         XZuUIXijfiAfM4syb6THz0NNKlyV0zjM7H/hAWwAOZp6UqvpgZn+QJEEs2xwc5H7LVSz
         87KBcABZUDOufMToZFbqYjj50T7bh8YAkVoPYCT5NnuUE/CGlydVy3n5G0nQrrw3xTqv
         YYeAyjpwTHedndwxgNcrZxCJ4OUbl57ohiu2V4vD4lYgOHP8mw27/Jk3aHUNDX40kIsa
         D6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o8GIMFSFfJaC+NseNm4sPm6vviClb1WTiOKE9g6u8d0=;
        b=vDPF+fW2r9TkW4mwKwpgm92XQ23J+LQ9pEP0JU9i/E/BZOQFZ1IkfdQx3bDKzJx3hE
         o99PtMvUZwiCwediOPtGntLx2WleDwkXT795gRPVEKct5kwYUtxi0n+LiGoPPkN/qBJy
         vVw606mC+SIfHmvgNdskBcQBdMqDk7k7QkoqHEos8iOMYBEERMG7KmqvmHRsr/6oJkEs
         w8Tb80ToOga3a1hhYxEFDheSNjYB4/4pK3KYAvqZYE97caDw6lYQMo0Ta8u4EuBDAdCb
         nyMCbn4cTgSJtKBDie9jOAM+r7j5alhirW3q7aMq1LLOto9kOCyJPZvt5IXxG6qMSHDK
         zjCg==
X-Gm-Message-State: ACrzQf2ULORkWK6Al+XnMAW79jzmpBv8AzlFH5/PGNP9CXiOsnUNv/nY
	bVzaz2BK5LYvVrLQ/Kef9lONMGGRUpMnLWvAc90=
X-Google-Smtp-Source: AMsMyM4wChBybAsL7iXfbCcR1cc7DTRSZVNv+umTCL/5uSKEZkSGTle1Cc9DUNgAD8N2inzbz5TuUu+5890Jpf7iGXI=
X-Received: by 2002:a17:902:f782:b0:173:1206:cee0 with SMTP id
 q2-20020a170902f78200b001731206cee0mr96463pln.130.1663256986323; Thu, 15 Sep
 2022 08:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220915150959.3646702-1-han.xu@nxp.com>
In-Reply-To: <20220915150959.3646702-1-han.xu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 15 Sep 2022 12:49:34 -0300
Message-ID: <CAOMZO5CPLUCdxrZa7T8E=ic8WN_sAKZbNZZdTaGQ-1ZZ9pJBVA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx: imx6sx: remove the SET_RATE_PARENT flag for
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
X-CRM114-CacheID: sfid-20220915_084949_576898_EF7D9548 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 15, 2022 at 12:10 PM Han Xu <han.xu@nxp.com> wrote:
>
> There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
> should not be used. For instance, the default parent clock for QSPI is
> pll2_bus, which is also the parent clock for quite a few modules, such
> as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
> hang due to pll2_bus rate changed.
>
> Fixes: f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
> Signed-off-by: Han Xu <han.xu@nxp.com>

Tested-by: Fabio Estevam <festevam@denx.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
