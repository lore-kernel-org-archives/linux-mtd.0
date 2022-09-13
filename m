Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C297C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3UWrknCyQctWDXG+27tXB7kYSe8tkhV4HUnv59HMi4=; b=LZpXBWy/NJ4Mxd
	m2sB/UP128gYcL2WVpx2XWDoP9vgnN0UpEQaibrmxARHC2SHSc24lOJg4TErdwlEmomOrARdG14SR
	E++WUzVu2utsRzxNNjYVZBQq9IoCB8257keG6UoK2nLl+qO5RpxMwWC8+GFUweATiK/+fjISJuXpq
	ji6popAACqJI9XCWanjeSXL35UKdh63uWZ0gmNcCZhibQRZvDXgfHSTTvCK8L+vbZS7h96lj/jpzE
	7OU0pKm2T7tRdypxlno7cs2Uz4KPN44UMSjI5IDALgZuTjlTLCVCgtdqwVTdPYbQNsGbBt19o8zrh
	K5GM3Y4Xs1D3EewzSnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY7Ap-00Bs1f-0X; Tue, 13 Sep 2022 14:46:03 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6rg-00BZQx-6J; Tue, 13 Sep 2022 14:26:17 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1280590722dso32600996fac.1;
        Tue, 13 Sep 2022 07:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=7RWaneRC8/NytetCZObAsUNo67j3yzk6oJ+xsdXrYf4=;
        b=HOSTFE31XJiEmOPGh1uPmxIqqHv2yGAJbvlxFBG3rdXunXRRqb2+Mfc+0o7fvtJmAx
         8EFPM1dyaB/HqeTOR9zmC4RGYen4KBe/qqHSke9Q/R1W7pj3Kmc1mQ5vb6GS7WIscTfB
         IcX+Cz7aB0Afln0v+f0BZmUbzO5XzzmwcXXDNpxywSD0vUX4M/+djdjvNP+FJGX3tmsI
         Znrdz8yxtyorwaGmI+mhMHVYy8tGvlovTuJQehJsPSMbNIwugTsOfCu0GcsRjgSTpcvO
         UIccdCmA5/p1+e7jg8pFv/eoYkSQLiFiAhyxRtm9q1BdyjEodnumXaOqCSLAAVhSP5wv
         s2JQ==
X-Gm-Message-State: ACgBeo0adArObyCKnr/Tfn4RNubpEDSfSLORIgd0iwxs9yqO04QaXdOs
	tTioceirj00LebOujdlhJA==
X-Google-Smtp-Source: AA6agR56X4nOuBVmlb1hHNay/YivDzxq3eWYSEJNyeQmir/p3WlQ97jnab+s2pE/O3fUGh03U3FVQA==
X-Received: by 2002:a05:6808:201e:b0:34f:b9bd:d678 with SMTP id q30-20020a056808201e00b0034fb9bdd678mr1641252oiw.1.1663079170617;
        Tue, 13 Sep 2022 07:26:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z26-20020a9d7a5a000000b006370abdc976sm6040184otm.58.2022.09.13.07.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:26:10 -0700 (PDT)
Received: (nullmailer pid 3620059 invoked by uid 1000);
	Tue, 13 Sep 2022 14:26:08 -0000
Date: Tue, 13 Sep 2022 09:26:08 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: devicetree@vger.kernel.org, jamie@jamieiles.com, vkoul@kernel.org, richard@nod.at, linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org, u.kleine-koenig@pengutronix.de, zhangqing@rock-chips.com, linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, vigneshr@ti.com, linux-kernel@vger.kernel.org, kishon@ti.com, kever.yang@rock-chips.com, heiko@sntech.de, linux-serial@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, linux-pwm@vger.kernel.org, philipp.tomsich@vrull.eu, sjg@chromium.org, gregkh@linuxfoundation.org, ulf.hansson@linaro.org, wim@linux-watchdog.org, broonie@kernel.org, linux-rockchip@lists.infradead.org, miquel.raynal@bootlin.com, thierry.reding@gmail.com
Subject: Re: [PATCH v1 03/11] dt-bindings: pwm: rockchip: add
 rockchip,rk3128-pwm
Message-ID: <20220913142608.GA3620009-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5dd0ee4-d97e-d878-ffde-c06e9b233e38@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_072616_454368_7CF18628 
X-CRM114-Status: UNSURE (   7.68  )
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

On Sat, 10 Sep 2022 00:02:22 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-pwm compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
