Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDBAC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F8760C3E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02F8760C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42Kj9BrSbCQoBcbWAwww7+cfMkkOJ50iSJaczIGMqfQ=; b=w6OJWMHk1ognBs
	Kt4MA+KBxM1jjTm0rvb/Q07XPypQsccOThtmrhC0kJfshycwiuWzEnA097Hy6xYgC9QdtO0WD5R9C
	QVMWPLxkTGKE/I9qdFTTJ3cQYLxLDBMtX+vaKa3YV8BY/0I4vYS55byLbiSmZg19wfJGFJPUQqj6h
	LGBdREOzQ42A5c9RowJtncEVOf98Z2mhvBpPxwd6e4bis898+jn4uIZZ2eSJjINW4VoobHbNY2VEK
	uloyPVYGqz/SDkS/W45LIpKb03ha02FKDaQ6Ph52iYTvRRE1KvYy6RI20BbRy/NDfrA0ZHDw8NPsu
	60b6a3tgqqrEbIl7CVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGACi-003r0t-JA; Wed, 18 Aug 2021 01:17:16 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGACd-003qyE-5Q
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 01:17:14 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 108-20020a9d01750000b029050e5cc11ae3so792679otu.5
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 18:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XEHzbtXC9SGv3p+rZWW31lZL4W4bCoeIEjmW3iiT8EM=;
 b=dy0Myep39jK6TraxArGcCoWWfSZaZOFQHJAon1Suu3yjD+R73c1/K9C5c83BQWQ6LV
 G4brOA7rnuItn0zGi9Ny+jC8fPqqqJCJrRnT8gKPlOdcaoJJlZvNhyJmu+cv28J8UCgN
 Zyrjni94PMgpH6mj6lqXRQbP6yacGSi2p4m3ddBrwzGwN5BA9fmv16J531KrxHkXZpqJ
 fl+NrfL3UwKSixKE3Qq++Vf6i8LoRRy/38Fjuk75YgcfZ5sfdaoG1WInpUi8VaOf7yFO
 1hZlyNLvSEhiBJV38Bij8ybyQzIdNweF/tJ7mxJXm+cI4bT4GjHkyLjiUpUzlG048jTF
 uYKA==
X-Gm-Message-State: AOAM533k8d8dKgKkykYhublfpz5AZHhP/7aTKpKP7Fhrh4SuDjQsp0DU
 20JSKbkqjHfqoHoDLCHRdA==
X-Google-Smtp-Source: ABdhPJzvnfsw5vj8+qJCFSRdy3z+gWAr1zQdU+wI2EZ0149D+ruRFQnz03+14sCvIKuRUTBry0K2dQ==
X-Received: by 2002:a05:6830:418b:: with SMTP id
 r11mr4821586otu.204.1629249430269; 
 Tue, 17 Aug 2021 18:17:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j70sm760918otj.38.2021.08.17.18.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:17:09 -0700 (PDT)
Received: (nullmailer pid 1177455 invoked by uid 1000);
 Wed, 18 Aug 2021 01:17:08 -0000
Date: Tue, 17 Aug 2021 20:17:08 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, devicetree@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, linux-media@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Stach <dev@lynxeye.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mmc@vger.kernel.org, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, Nishanth Menon <nm@ti.com>,
 linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee.jones@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org, 
 Peter Chen <peter.chen@kernel.org>, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Adrian Hunter <adrian.hunter@intel.com>, linux-staging@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-pwm@vger.kernel.org, 
 Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH v8 23/34] media: dt: bindings: tegra-vde: Convert to schema
Message-ID: <YRxflCWb9ovs9d7H@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-24-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-24-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_181711_248162_D7BEB89F 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, 17 Aug 2021 04:27:43 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra video decoder binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/media/nvidia,tegra-vde.txt       |  64 -----------
>  .../bindings/media/nvidia,tegra-vde.yaml      | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
