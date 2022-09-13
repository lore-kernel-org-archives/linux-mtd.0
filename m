Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AC1C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eV0SiX8tDqALkYwF2VbzkZH9sKnNXUTF6gLf9IPd1Z4=; b=G2DIi4bW0GZxOv
	sCe/CsfZZ0TUiS3/un/cyzh0YKQR9eArFEq+2qjXuY5UzlOzKBegAf28OFRXhWoO3URSbqxmNZnCo
	Yijz5RqM8ZeTdMb5I+2Dpe69mWRUb4Jrh0nW03RgLX/CdlnZZNPgerWz9xcrXCe4JtgKFMGpFqPy+
	f3TxA7qgnZ5VHFF2ZAak/hKie/Q82/BMpmI0Y3ebqid7Mus1MuEG7/ByoPIa5TgN3IbttWeqTU2e1
	+62WMr1dM7UvI4RqqnAUsUiBV18HPB9z9fJaTVyP0l1Nfa+8C31cW4tbEz0qFC4UytRr+jWHDymXw
	1Gwgk2XtUMSEUvAtdpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6bA-00BKFf-Ox; Tue, 13 Sep 2022 14:09:12 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6YU-00BI4u-V4; Tue, 13 Sep 2022 14:06:28 +0000
Received: by mail-ot1-f45.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso8173089otv.1;
        Tue, 13 Sep 2022 07:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XwWk5SoJuKv1MY6V80vnF8Lyms9Ev4e9+aisy0cJdGI=;
        b=Sy2GSm+mh0AaYfexmk3W6bF47DlPod0g/zg9lkaa4v9H7s4xBtgnCKiHarZeHrb08n
         NHvrfvqL8GJebBwmFA/EQj0iGmKIeMNlh2srh/IKN10NpWLJVxH/hVwd9JQYnWpfqhHU
         JbpiNr9dFejwRs5FqruptCAJSeoLq7/ysnZtZxRGp14OS+8A8m/pNQYanHXsPjJnQwfM
         c7ZbjiT/PYdPH7Iz9+KV4ZMPkV6IJmWLJRkxLeWqpHdvvh6RcTJjAKMbL2dZWRWsl0RA
         xVQmOz5SXPLJ95052JRaZt5bjsAi30z4zRyUy/J9xKpq8JVHcpcVH9GDbXis1jrYVS3d
         c2tA==
X-Gm-Message-State: ACgBeo1SR7+0ySNWSxcm3io/iDnrZeoluGuSGRZpsS2cLJTkyxw9bNJG
	27lkI9HKS2jXFvcXLC8cpg==
X-Google-Smtp-Source: AA6agR5SWl6Oj+EGjpBSFta1Oh0daG7E4brT6mZmxxChyVqbTbfzFGLGAKFSANHqFwdD6yPA4tgYRw==
X-Received: by 2002:a9d:d89:0:b0:654:fc7e:f4ec with SMTP id 9-20020a9d0d89000000b00654fc7ef4ecmr8772019ots.49.1663077985195;
        Tue, 13 Sep 2022 07:06:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x88-20020a9d20e1000000b00637032a39a3sm5891387ota.6.2022.09.13.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:24 -0700 (PDT)
Received: (nullmailer pid 3592810 invoked by uid 1000);
	Tue, 13 Sep 2022 14:06:23 -0000
Date: Tue, 13 Sep 2022 09:06:23 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: linux-usb@vger.kernel.org, miquel.raynal@bootlin.com, wim@linux-watchdog.org, linux-phy@lists.infradead.org, robh+dt@kernel.org, linux@roeck-us.net, linux-pwm@vger.kernel.org, linux-rockchip@lists.infradead.org, richard@nod.at, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, vigneshr@ti.com, u.kleine-koenig@pengutronix.de, linux-arm-kernel@lists.infradead.org, heiko@sntech.de, sjg@chromium.org, linux-kernel@vger.kernel.org, broonie@kernel.org, ulf.hansson@linaro.org, philipp.tomsich@vrull.eu, kishon@ti.com, jamie@jamieiles.com, linux-i2c@vger.kernel.org, zhangqing@rock-chips.com, thierry.reding@gmail.com, kever.yang@rock-chips.com, gregkh@linuxfoundation.org, linux-watchdog@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 08/11] dt-bindings: arm: rockchip: pmu: add
 rockchip,rk3128-pmu
Message-ID: <20220913140623.GA3592754-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <faf2b30e-1a1a-0dc1-04ce-f40e5d758718@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <faf2b30e-1a1a-0dc1-04ce-f40e5d758718@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070627_098532_A18BDA29 
X-CRM114-Status: UNSURE (   7.56  )
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

On Sat, 10 Sep 2022 00:01:52 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pmu compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
