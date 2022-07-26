Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA447C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Enl4YCfNPvbQNRTYpzdKNYZuNHx/ylrpgmcwM3A1C8c=; b=Zourrg8J2xXojb
	9s3F0yiCukY4DhsPmNxoVG7sHgfgIM6rAi0JVZl4AzeBfEmk9RpnWbXhNVSGP2MjiQN2eiwEKut5I
	zxV8IwA+e4kMh2oG+16utT1ONRjMHcadGDMf4SSZ2Q2t4qc8I2T0BJwDEf8MvOLVkZI2ArdNddXt8
	x+soDdSjeGwIeAp3Ape+Q5hrbOs5TI3EZFaMEkgHNT7Tzdhm0tR9LxeKmJmsgzoEcCq41lHDquWGH
	jx5B7LV3jY3BRV8U4bGVtTWG7rKrSf45ABTXfWHRS8vx5qSXZ/Nefk/o0nheF+6UUfWsUtUudU9QS
	QCOFOhjo4jhiZ560Vd/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHMX-00C4CB-Gu; Tue, 26 Jul 2022 10:00:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHMN-00C3tV-6a
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 10:00:16 +0000
Received: by mail-pg1-x52a.google.com with SMTP id e132so12722851pgc.5
        for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2022 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mRh/G63uXFb/m/g4glGo/TFB6cAKq2kxka9sd5vTbAQ=;
        b=S8Wxdbx1Zd0XXYo8YtaytgKmdxCAYZuFipvn6aXJz0JTWd6M3o7/Og/HswNPqV1vFw
         OHVi8abn+4FpDdEgKUFgWGH/20AywoQ7YOOoKZiruhKk8nCUOFOSFSqwlK5shPrQ/FSJ
         upZUC1Ic+hy/kTv7s/Q4I74Dp1Vwv8gKTyvtFG9Ll31cDlgqv7q8q30L4peOr9Umw16t
         2ysiHygkPgeC9WRJEns9NHJSKtlM78ldhpjasvdMvdsAbp5YG5zcor7Xp78Xx94oHrCJ
         THSbaOA8GMDwqESH0w/XZRIh/ndeMjFOJhnWreTkI3V05ecmUXQEjVnIYk87KHPuSU88
         Assw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mRh/G63uXFb/m/g4glGo/TFB6cAKq2kxka9sd5vTbAQ=;
        b=dAn7GRagOdeBAYoPWwebFNJS3SIwDL8/4R8gp2Jityu3P6fmlXgsvpSkYOsDQUKwvJ
         pwGoH0VpegHSTIHXuzOjw3ADri37arZtKiCGQOIIzkKUU7Us1fv5J3x2gJ4U9hcMVgrI
         xqyHnKMjG6eAxp5Z+W+kaCNAiLCLrZuDzxy3xyzOi1b8b5Ok/JLCdhejfK2PgkYcLcCe
         xORkhOIvSLoZO+dC4VWsiwrSf1q2UZ/t1OefHVME67xE/WLGPgW3KIGiN3TTJnqDqWMY
         x7KZyduU9FPd2bSzv3KRztx9Hh1hBFcPwtpgLARbQUPyiz/zArfUuCUBlGEVqWR313y2
         g5SA==
X-Gm-Message-State: AJIora9JpVla6XExGm8QWYl34h9KMsm6ygIkcreEfXX/KCwxRbVUg1aC
	HrMFbeu7mZiL2KmszLWe5OA=
X-Google-Smtp-Source: AGRyM1s+NXwzdR0/LDg/tPJPyJDNjn4Vi7Pcc9WY2s6aHDWTi7FwEjTnmyNofx0gbWnJkhwY4WrYbw==
X-Received: by 2002:a65:5605:0:b0:419:d863:8d94 with SMTP id l5-20020a655605000000b00419d8638d94mr14196384pgs.359.1658829612415;
        Tue, 26 Jul 2022 03:00:12 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902e80c00b0016a11b7472csm11054574plg.166.2022.07.26.03.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 03:00:12 -0700 (PDT)
Message-ID: <a37fe861-ee02-f17d-07b4-501ab15ff9a7@gmail.com>
Date: Tue, 26 Jul 2022 19:00:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] mtd: spi-nor: hide jedec_id sysfs attribute if not
 present
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220513133520.3945820-1-michael@walle.cc>
 <20220513133520.3945820-2-michael@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220513133520.3945820-2-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_030015_329217_EEFF1D2E 
X-CRM114-Status: UNSURE (   7.75  )
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

On 5/13/2022 10:35 PM, Michael Walle wrote:
> Some non-jedec compliant flashes (like the Everspin flashes) don't have
> an ID at all. Hide the attribute in this case.
> 
> Fixes: 36ac02286265 ("mtd: spi-nor: add initial sysfs support")
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
