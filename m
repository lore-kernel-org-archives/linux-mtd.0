Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DC9C6FA8D
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWr6kyWmjUlEEAmtiL1h9gdYnxZzHPWRUIBD9EHSvOE=; b=f7MMJRS/uwu/ot
	dz+AK5z6j6hP+8qOZJWNXJZyZPUdbrT0KNuRHaaVm6d79x9eGfBGJ7LRZkvgRsnkM2ofZBhzTJcwW
	CnVHCUX4dicO3gqaUTvyK1SlGBSRjHWGP1c9IM9n1EpT2nY0tktu6GCHE/acK+a3NIONX2GlbSEFN
	8aBym9baiGlhMZiSwV1dY1F6kcYbBkGpOzbodsPPVxqbAweF0mB66b8/QTQwRrIZ4o5ZaojmUxHyx
	x/7w9E25pUP6q4SZVif6lKZqgj9wbHUDbZFdPY19EpAr/k+8ucfuvsk0lANT0I7lFBz4a8SIMYtWO
	E3ra97cH82+LH0hwc7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6Y1-00BHTk-1j; Tue, 13 Sep 2022 14:05:57 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6Xw-00BHHR-Ri; Tue, 13 Sep 2022 14:05:54 +0000
Received: by mail-oo1-f51.google.com with SMTP id u19-20020a4a9e93000000b004757198549cso986026ook.0;
        Tue, 13 Sep 2022 07:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gUoMuqH8RQNLf6TD5ZgHBTjgUa9ZzQ80Xl0NxTsaRAQ=;
        b=nFoXAl1dpqqpk/S02MnJm/FvW7oiIfKIZx3FMACOowYhDCtfUZP98KZKr/7oxjxHj5
         azbDwIemXGd1dOlgf7bTozPcDC32lzy3wxaJY7EVZrLf0cEkn2u/n4Pf0DPgghM6pBG3
         2AgWumjAzJ3qoOm9TD+8/fahRfgpjMBtZ7OUjZgpftcBqR340Kns00QilijzFqo6IeL/
         64+F2EcC8QoyMmO2TuMWLahhRZinByI4NybInxWFr6QiN68xvsdRTtoVzIKs7Xuph3en
         nnbtuCO3kotGBz5y1vYP8YqrKbRw/BTNeFOUFozfZV0YQG7KGeJ3TbS+0mAdB0IM4Vyd
         nfEg==
X-Gm-Message-State: ACgBeo0zZYaKhSpnXJJg+9fnTYDI6kae6HkkQfnZ2P7S0XDAND7m1uFj
	rKY9a7X9a8BC5tqm2BMeYA==
X-Google-Smtp-Source: AA6agR6RrtTNw9L8FzOsi4f1dPwDybzh223SP/qImE6imeHr6gssP4vZDFglDT81BonBYIffpKUqWw==
X-Received: by 2002:a4a:b04e:0:b0:472:912a:63c9 with SMTP id g14-20020a4ab04e000000b00472912a63c9mr8418280oon.87.1663077951213;
        Tue, 13 Sep 2022 07:05:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870818600b0010d7242b623sm7045343oae.21.2022.09.13.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:05:50 -0700 (PDT)
Received: (nullmailer pid 3591626 invoked by uid 1000);
	Tue, 13 Sep 2022 14:05:49 -0000
Date: Tue, 13 Sep 2022 09:05:49 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: philipp.tomsich@vrull.eu, linux-kernel@vger.kernel.org, sjg@chromium.org, heiko@sntech.de, thierry.reding@gmail.com, vigneshr@ti.com, linux-rockchip@lists.infradead.org, linux-mmc@vger.kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, u.kleine-koenig@pengutronix.de, kishon@ti.com, robh+dt@kernel.org, miquel.raynal@bootlin.com, jamie@jamieiles.com, wim@linux-watchdog.org, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, zhangqing@rock-chips.com, linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, vkoul@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, ulf.hansson@linaro.org, kever.yang@rock-chips.com
Subject: Re: [PATCH v1 01/11] dt-bindings: serial: rockchip: add
 rockchip,rk3128-uart
Message-ID: <20220913140549.GA3591205-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070552_946063_76C5D0C3 
X-CRM114-Status: UNSURE (   7.66  )
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

On Sat, 10 Sep 2022 00:01:28 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-uart compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
