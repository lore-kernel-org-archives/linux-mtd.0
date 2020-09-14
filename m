Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A3DC43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 22:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9067120732
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 22:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ED8xdobd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9067120732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TD7d4vwzpY123ygmmSsFKj0BesMKsFWmu8V4KragwoI=; b=ED8xdobdnaN5oCu36DtjFpWaC
	rZVquX0RnZ1hkeo+Fq7Fi3xqa4oY61VqKMLZFeWYz9Zzk0QPkwX7ZpXVZp7dNr63uvJSBTRPYbMpe
	h9wWPx98+XnJ4DOJY9nWOGjxYYfDKBBiRCt6shheJoKQ+5uQzbO60o08rXkDjNMbjNO/eQFb975H3
	xi+KbtG2FBPuBr9F4B4vpYM1uas8OkKOg7kTa48JSfjxiyGKL2pJ/Xmq4iiZK7sort7nzXFNzSkNt
	HdSu94IJK7EIqNiJxY4gBmOXIqyZ7UwVAGB+J4F/ZIpBTX9dLpdcJFvRvmpTox3yfBleZavqSJ3uY
	ruopHvoiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHxM1-0006G5-73; Mon, 14 Sep 2020 22:53:45 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHxLu-0006F4-2E; Mon, 14 Sep 2020 22:53:40 +0000
Received: by mail-il1-f194.google.com with SMTP id t12so1211838ilh.3;
 Mon, 14 Sep 2020 15:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qADdGXdYZqT13TlNq77A8iEBF6/xm6VQ88F8vF+6Mt0=;
 b=L6GL5JOBYSLD6yYYT/ibxB0GOdIuFZWu0Bmn3F1FHI845lBXbtF0B+r8vkDfLvbW2s
 TSFGH0OV+lhCSGLpVFMIKmkblMW2E1mjDytGpu7WGwt71zM4QYx668k+i8iZ/VeXmpis
 f/RAdF4eTeuKcnTTIoEBPXn2QS6rXbcuM80Pq8pyaVqrMsEH3ZOTP02hleteiBC9fHb7
 qLAEbJFSjB+egSJlA76vK+UjNiUfFqneTFA/XzG+IT0uPotBVYtamVFM3ymEPsyVX8om
 QlmkEVLlEbG6TWXj1+R1PDtwM2YS+EiqM+2kCWgZBV6rR4i1NoySdF6NX/2jse7wCf+I
 vH2Q==
X-Gm-Message-State: AOAM531bVMoSAOg7/E1tKKx+qxJy5vyriZg0f3p9Ln1m/Lyghun/4WmM
 +KPXI9DQNFmc0YW94gbHoA==
X-Google-Smtp-Source: ABdhPJxQ6XmFgSPgsFsEuxc9KsSWx/uXdnk7BWY/+ZvrQLIouNhajOLGL/a9iRpmAURP/dKuGjOVsg==
X-Received: by 2002:a92:b109:: with SMTP id t9mr13133758ilh.191.1600124017132; 
 Mon, 14 Sep 2020 15:53:37 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id v20sm7670949ile.42.2020.09.14.15.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:53:36 -0700 (PDT)
Received: (nullmailer pid 419687 invoked by uid 1000);
 Mon, 14 Sep 2020 22:53:32 -0000
Date: Mon, 14 Sep 2020 16:53:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 00/14] dt-bindings: Cleanup of i.MX 8
Message-ID: <20200914225332.GA418101@bogus>
References: <20200904152404.20636-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904152404.20636-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_185340_039012_584EE03B 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 05:23:50PM +0200, Krzysztof Kozlowski wrote:
> Hi Rob,
> 
> I am resending the series (v3) without actual changes.  You already
> reviewed many of them.  I think that subsystem maintainers are hesitant
> to pick them up, so maybe this could go via your tree (all of them)?
> 
> Changes against previous revisions are in individual patches.
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (14):
>   dt-bindings: perf: fsl-imx-ddr: Add i.MX 8M compatibles
>   dt-bindings: pwm: imx-pwm: Add i.MX 8M compatibles
>   dt-bindings: serial: fsl-imx-uart: Add i.MX 8M compatibles
>   dt-bindings: serial: fsl-lpuart: Fix compatible matching
>   dt-bindings: watchdog: fsl-imx-wdt: Add i.MX 8M compatibles
>   dt-bindings: reset: fsl,imx7-src: Add i.MX 8M compatibles
>   dt-bindings: thermal: imx8mm-thermal: Add i.MX 8M Nano compatible
>   dt-bindings: nvmem: imx-ocotp: Update i.MX 8M compatibles
>   dt-bindings: mfd: rohm,bd71847-pmic: Correct clock properties
>     requirements
>   dt-bindings: interrupt-controller: fsl,irqsteer: Fix compatible
>     matching
>   dt-bindings: mtd: gpmi-nand: Add i.MX 8M compatibles
>   dt-bindings: mtd: gpmi-nand: Fix matching of clocks on different SoCs
>   dt-bindings: mtd: nand-controller: Fix matching with size-cells==1
>   dt-bindings: clock: imx8m: Integrate duplicated i.MX 8M schemas

I've applied patches 1-11 and 14.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
