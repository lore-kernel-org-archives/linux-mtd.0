Return-Path: <SRS0=norF=OG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90138C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Sep 2021 19:50:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6098F61251
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Sep 2021 19:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6098F61251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwPe2TDtvb/3EBikNgLQQa+HcivQZmjN4MteDf/Hn20=; b=R0Cmru/t+ueDHz
	s6di1tq6AZ2hmJaCDFMLuLv18XRImZm55GOh05ch7pUtU1wRR4cUuFHOaYOvubuDrRd8JPDvH5ldX
	FYOqld/gZxNq+Bj2N6aCeP5+QmWEd01Ot2W9RfV2oDTYIwoV+xx3Zcy1Oayyrfz2uoR2SUNlO/gSF
	Nv6i7DN5wqPgoojiLBoHm87xQ9P+TlQfw3NflSJCHORx/3J3HtyLPOgpJehqZv53UkTsunhgbAgGU
	funLDnSVhg17ogpmyqIzXFfUoMtLvUAG0/3LGL0h0RZKA/i8J0d0RZF03b0GSMR4b8/GC3M437amo
	Q4fyz9kQ9XUogrAGF1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQxNp-00CHTF-CA; Thu, 16 Sep 2021 19:49:21 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQxNl-00CHS1-Nq
 for linux-mtd@lists.infradead.org; Thu, 16 Sep 2021 19:49:19 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so9792271otf.6
 for <linux-mtd@lists.infradead.org>; Thu, 16 Sep 2021 12:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0KsoWtKkhaXMiBJDC0/XxZwnXXQWFGw8B4mYJMIPHr0=;
 b=SNjrbRTeRc8Ky08SIzBqOlbPkEfcV1oQH/GeuUn+yhY3VE12UJtVN4N5NHZXyWff8l
 k2VMWa5Kqye79cjVsNcfsH7JziowS8jM4HINcUnkxKrGZj2BQ/7vUFnGXhiLkG+fcquB
 B08DPW8Fcig6arDIB0I5chKkV9U767PT2gTJy0GUxwn6RCNBgpXqpJtQTxh671TljpGv
 rNHqjO4CAl6BGA5ibxCR9p3gAylmgMz+Edl9kuht0+xVaAjUKPD0AuanpaOxuvXJ3jGs
 Jq583uCKqEN2kHGMskFDgRzmy6V9sL/qom3fzEivkwEE+fRr2bQEe4zVqsaz1E+eE7f2
 5a/A==
X-Gm-Message-State: AOAM531sTD5ZilHbSZxJsx6Qbg3IM1pn9BU6XyO2c7tAuWMTWUyFHT7N
 qJ/vJjgp1X6n2QhuahS3CBo/pij9/Q==
X-Google-Smtp-Source: ABdhPJxEEp/Qsw3alHt8zhmxwHRpVnbr0IilY/Bi03MDyZNTmeQPJrTz7p+nPBP14eKxCi6oX/vdRA==
X-Received: by 2002:a9d:70cc:: with SMTP id w12mr6143201otj.306.1631821755916; 
 Thu, 16 Sep 2021 12:49:15 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id z7sm948074oti.65.2021.09.16.12.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 12:49:15 -0700 (PDT)
Received: (nullmailer pid 1377102 invoked by uid 1000);
 Thu, 16 Sep 2021 19:49:11 -0000
Date: Thu, 16 Sep 2021 14:49:11 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Lucas Stach <dev@lynxeye.de>,
 linux-mmc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Nishanth Menon <nm@ti.com>,
 linux-pwm@vger.kernel.org, 
 Lee Jones <lee.jones@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
 linux-tegra@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-mtd@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 linux-spi@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-pm@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 08/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
Message-ID: <YUOftwuVt7EqtA5I@robh.at.kernel.org>
References: <20210912200832.12312-1-digetx@gmail.com>
 <20210912200832.12312-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912200832.12312-9-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_124917_806011_95356A4F 
X-CRM114-Status: GOOD (  12.39  )
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

On Sun, 12 Sep 2021 23:08:06 +0300, Dmitry Osipenko wrote:
> Memory Client should be blocked before hardware reset is asserted in order
> to prevent memory corruption and hanging of memory controller.
> 
> Document Memory Client resets of Host1x, GR2D and GR3D hardware units.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
