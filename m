Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161D3C6FA89
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Sep 2022 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+Pe9R2PD8xf0UoHR+S3ZBOqQidY/fGXm+sDjMQP0+w=; b=t7jS2tvtV+7BlW
	S1REeoRmuzn+nyrovuWgRNOhgbxbSKJq0V6L/rMvP/4t5vV9nqGpjqYxScdUi1t6S58mc39KpOrZ+
	VsXtKxMmqpsCA1wxVFYBuI6oJ9TNlDe0DQbAlwJec/kHLopenhHNE2iVfKIiPnwun5ys5HOPAxjtw
	smC5HnK3hmMzJzgBVjMtnf82B1SK486m3Wyneq6T4BjBoZAXE+6ISeMgBu89+BODK2pHvsOZQEeTm
	D3WeB4eBH/jsCU7Ied+inl9oKz8ZW6LkkMq6+SOkPIu4dAfKPJxNtrtje3AfhzzuitM4RoLg/tKbn
	7zPUMkgjPKcsEUaIuwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpZa-00AKkz-8u; Thu, 15 Sep 2022 14:10:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpZO-00AK4W-Pt; Thu, 15 Sep 2022 14:10:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id t65so17448930pgt.2;
        Thu, 15 Sep 2022 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZvbZ+uPDGtfELhlz8EprIDJKCOAE+6YrSNuARaSiQ60=;
        b=av/hQgpTDcsFs+Z8k5t2eaHxi3bGBOUsRyU0BLYKtdwXWMR3S3L9HR/AU75Zg2gQL2
         EDhVEZ/UnS5tpcNfkDJi4lITV670wrskyUdQCPvK+uloW+sgchaUt0F3HJxdvRCCc1Vn
         0NiNrA47CSxUr66dTCN+Fg3ORXLhZiaTrVsgYwz4WcbinEU+BaQnDMhtOAVWx7k9vfY4
         kI5JlK+QwEV9/adrYPgrdwzwAP9l8Vt/HG76FMngkVtS0YUdQt3oyrdTQWvDrIfa1+0u
         +xseOIMjz3VofGWz3g7xQuEyOT8SHGP1KA1qetkbUN31I3uQYP0ep2sZyo7QCXTcJ2b1
         BVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZvbZ+uPDGtfELhlz8EprIDJKCOAE+6YrSNuARaSiQ60=;
        b=gXyCTkqQqCO7zqV4eTNOVKwg+LBqR4CbBXF9D+83H65lJPMKO9GUMnTTPmKTZCSCl7
         DBxpmEYHdUwuTsiTEx2hels04oSU/aY6nwX30oK2s8Oo3896GsGKCkG6YttWyA7bSmvn
         9qPpTaKMIrwDvQMcfERk15buBm+MeNXzPXyVEXgWU/rrCcZenUYbY/v2uBqFSA5r5Krw
         HeexDDQEGuHGg4svm7yD1c8RT4PnJ9w3EYYjekF1sJKlhcANZ+ocXecEEDPrMu9ED9HF
         15hwDoGbDnxkL0uVxdLEbRwC5G0NeUYNQSByJNkhsRx1+XRAFWYErSAV6vd4rOyaOimi
         RF7Q==
X-Gm-Message-State: ACrzQf3dsK70OAKPOby3ibLYtopgOICbxzepZO1A1miqkmuMm5eWGpy9
	I2o17QJ4sMk03bWsOvYKPb5yKWv2sE+2jYSrO/s=
X-Google-Smtp-Source: AMsMyM7URSulhQIaqX+CGpMlGSVONRaTeXhuXJ/2zWvENhJ1JJWqDIXOwQwa+fQw4ZasPYWRztjlKYSHx8KfaVrTZ10=
X-Received: by 2002:aa7:915a:0:b0:549:e8ac:c933 with SMTP id
 26-20020aa7915a000000b00549e8acc933mr2021861pfi.72.1663251018018; Thu, 15 Sep
 2022 07:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220914201049.3508104-1-han.xu@nxp.com> <CAOMZO5AGxXqF8Q6jhfr7vbZmQd6MU4SzFpj5XQG7cPtmdFrFVQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AGxXqF8Q6jhfr7vbZmQd6MU4SzFpj5XQG7cPtmdFrFVQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 15 Sep 2022 11:10:06 -0300
Message-ID: <CAOMZO5CfokeopsZuf2j905hzsU7cJ4x5iEyzujnFXr+EjD7nEg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220915_071022_883287_BE2DDC0D 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Sep 14, 2022 at 5:51 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Han Xu,
>
> On Wed, Sep 14, 2022 at 5:11 PM Han Xu <han.xu@nxp.com> wrote:
> >
> > There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
> > should not be used. For instance, the default parent clock for QSPI is
> > pll2_bus, which is also the parent clock for quite a few modules, such
> > as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
> > hang due to pll2_bus rate changed.
>
> Thanks a lot for your patch.
>
> This fixes the kernel hang issue on a custom imx6sx board with NAND without the
> need of using the workaround found in the NXP kernel:
>
> https://source.codeaurora.org/external/imx/linux-imx/commit/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c?h=lf-5.15.y&id=d03eb99c393f8732f70a1d7d29a3b9c42cccbe48
>
> Tested-by: Fabio Estevam <festevam@denx.de>

Just noticed the build error. I manually applied it to 5.15, so that's
why I didn't notice the problem
with your original patch. It is missing the closing parenthesis:


--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -280,13 +280,13 @@ static void __init imx6sx_clocks_init(struct
device_node *ccm_node)
        hws[IMX6SX_CLK_SSI3_SEL]           =
imx_clk_hw_mux("ssi3_sel",         base + 0x1c,  14,     2,
ssi_sels,          ARRAY_SIZE(ssi_sels));
        hws[IMX6SX_CLK_SSI2_SEL]           =
imx_clk_hw_mux("ssi2_sel",         base + 0x1c,  12,     2,
ssi_sels,          ARRAY_SIZE(ssi_sels));
        hws[IMX6SX_CLK_SSI1_SEL]           =
imx_clk_hw_mux("ssi1_sel",         base + 0x1c,  10,     2,
ssi_sels,          ARRAY_SIZE(ssi_sels));
-       hws[IMX6SX_CLK_QSPI1_SEL]          =
imx_clk_hw_mux_flags("qspi1_sel", base + 0x1c,  7, 3, qspi1_sels,
ARRAY_SIZE(qspi1_sels), CLK_SET_RATE_PARENT);
+       hws[IMX6SX_CLK_QSPI1_SEL]          =
imx_clk_hw_mux("qspi1_sel", base + 0x1c,  7, 3, qspi1_sels,
ARRAY_SIZE(qspi1_sels));
        hws[IMX6SX_CLK_PERCLK_SEL]         =
imx_clk_hw_mux("perclk_sel",       base + 0x1c,  6,      1,
perclk_sels,       ARRAY_SIZE(perclk_sels));
        hws[IMX6SX_CLK_VID_SEL]            = imx_clk_hw_mux("vid_sel",
         base + 0x20,  21,     3,      vid_sels,
ARRAY_SIZE(vid_sels));
        hws[IMX6SX_CLK_ESAI_SEL]           =
imx_clk_hw_mux("esai_sel",         base + 0x20,  19,     2,
audio_sels,        ARRAY_SIZE(audio_sels));
        hws[IMX6SX_CLK_CAN_SEL]            = imx_clk_hw_mux("can_sel",
         base + 0x20,  8,      2,      can_sels,
ARRAY_SIZE(can_sels));
        hws[IMX6SX_CLK_UART_SEL]           =
imx_clk_hw_mux("uart_sel",         base + 0x24,  6,      1,
uart_sels,         ARRAY_SIZE(uart_sels));
-       hws[IMX6SX_CLK_QSPI2_SEL]          =
imx_clk_hw_mux_flags("qspi2_sel", base + 0x2c, 15, 3, qspi2_sels,
ARRAY_SIZE(qspi2_sels), CLK_SET_RATE_PARENT);
+       hws[IMX6SX_CLK_QSPI2_SEL]          =
imx_clk_hw_mux("qspi2_sel", base + 0x2c, 15, 3, qspi2_sels,
ARRAY_SIZE(qspi2_sels));
        hws[IMX6SX_CLK_SPDIF_SEL]          =
imx_clk_hw_mux("spdif_sel",        base + 0x30,  20,     2,
audio_sels,        ARRAY_SIZE(audio_sels));
        hws[IMX6SX_CLK_AUDIO_SEL]          =
imx_clk_hw_mux("audio_sel",        base + 0x30,  7,      2,
audio_sels,        ARRAY_SIZE(audio_sels));
        hws[IMX6SX_CLK_ENET_PRE_SEL]       =
imx_clk_hw_mux("enet_pre_sel",     base + 0x34,  15,     3,
enet_pre_sels,     ARRAY_SIZE(enet_pre_sels));

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
