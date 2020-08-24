Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76025C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 20:08:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7752067C
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 20:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YTcIf22K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQddYGaO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D7752067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MRmHM2V0uV/GvN2o86/90GtkbZW7EzblJG2JgQeeqbU=; b=YTcIf22Kh8rV0KQ6KLGccZr3i
	D1kEbjYnG5/Pj54N/yi6w5l5ThFbm5vP3KuPHzy5lumFDqef7BXvIW5hdPEi2C4xfx2IOPjLvxwHv
	8xyE1Ti7RVAc8LLtQgb78byrui9xCN2a6+BKfcvbs4CZgH1yy/2TftgrDtjAfuIZ/DnGFqNSHbV3O
	etVeWHYrO/gqI/oWde8CD+f3+F3o7gQWGxfK2ATZj/L50lbqbtkJlriU2RfAndBqQkuT9EGiCzl8/
	D1rpwdTPMr2tDulD03LSyTXOXoOSh2ZyqznwMQwVPNbI+icelLgxp8rGcW/f1HHBH5jV4iliFlzCY
	xrjGZ3uCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAIlA-0000cw-8S; Mon, 24 Aug 2020 20:08:04 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAIl7-0000c0-4j; Mon, 24 Aug 2020 20:08:02 +0000
Received: by mail-lf1-x143.google.com with SMTP id u23so2770733lfl.10;
 Mon, 24 Aug 2020 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4hEOJDy5VpY/6gwUau8NPAOLJV8wtmaTzguYs5BYd4s=;
 b=kQddYGaOjOGa9RJhgb6w3LT/vF+N7ObNoa4VwX8jngRhh/xFAWm3lyg92kYN1hpfZT
 bd2whc7oFU0tGl0t+fPiGTbxlMlzHVjwXlSaq13j2RdpPXar6z+lCFcEhYTmPNS2mCSM
 PIwpNub9tetSKh4iqu/r9GoBauRjnkU08yjuCasVcAvjeHEOcCoCuBMuzxRWFygqc+YB
 haLOVIueiFh0LRhtFh7YREN46exas9OebZvaUz+Lt8YYeVvAQUZVwZOsMqfyN77vXrOM
 won13lN5ZIbI/9qEuTrptYPDsWppwGErKsRYU2ahC3zTd2OO04iKoyy7MCMakyPBV6I3
 PJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hEOJDy5VpY/6gwUau8NPAOLJV8wtmaTzguYs5BYd4s=;
 b=jjvTi6OH8Svumslb/5//UmOiEstlzDx4+u/uiMgHi9n/bs50OVNDpCCFSsmLXZ4aDI
 mYDUgTkZ46wSkVT0XjV81ykbek4EhJCExR/7z1pCjv3rarvBnDgOifRLtJkj8Wx3bNx3
 8b7YICbwk7Bq7bxLuy8NibeybvFNCmzq5t5zCB24v7dTzvDCoWZynwX3CjxZivIf3mRc
 TI+SMBXFtj8gtR3vVGf8n9sPnvbwMuCTDthgZ/PENUWzFVNFlHszeCO4T7YCfMkQSXPZ
 /6PFSoo9tLdbwgJFW03jO0WIS/vhWvCP5h1PZZEA8Eajq7hsXWK1p2zXmIz4ZYXk3/g+
 a8/Q==
X-Gm-Message-State: AOAM531SfDCAjtAp9cyRGHnffaWXBEityQQKfmSOfVJg/yZg8YnkeEuF
 /V5LegwzHzQdwhUElTQrmqD1fRCZP+zw+32e6E0=
X-Google-Smtp-Source: ABdhPJyDWK54OaNTznXHTHtxiBDJUsjV7st4S/DmUVjYLMEuSdDcBlmLrgy/zRKgFobf79N1zm3VopVh0dKl9vknAHM=
X-Received: by 2002:a19:4ace:: with SMTP id x197mr3295387lfa.70.1598299679565; 
 Mon, 24 Aug 2020 13:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-4-krzk@kernel.org>
In-Reply-To: <20200824190701.8447-4-krzk@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Aug 2020 17:07:48 -0300
Message-ID: <CAOMZO5BgqJba+-Lqq_Js1Opkii8SZ3p66O7xOQibV1zgrXxS=Q@mail.gmail.com>
Subject: Re: [PATCH 04/16] arm64: dts: imx8mm-beacon-baseboard: Correct SPI CS
 polarity
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_160801_211352_1B0B4AA3 
X-CRM114-Status: GOOD (  11.69  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Anson Huang <Anson.Huang@nxp.com>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Han Xu <han.xu@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On Mon, Aug 24, 2020 at 4:07 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> index bf0859f1e1fa..5b5af8b381df 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> @@ -70,7 +70,7 @@
>  &ecspi2 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_espi2>;
> -       cs-gpios = <&gpio5 9 0>;
> +       cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;

I have already sent a patch fixing this:
https://www.spinics.net/lists/arm-kernel/msg830895.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
