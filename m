Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137E0C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:17:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC73B60C3E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC73B60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9VGsCnUahDVQJNDJ1BgQX0i6H8G3/CZ3iNmKZ9pQpQ=; b=XcV/yjmkOeobBT
	ejDC0Mzd6YW9dMVhzT6cpDpn15jzvXJTlOZJ/HLRWETSjzASCIyhz2350qN7C7r72NGY+b48x2fSG
	VnzDd5yLiajQPNFNYJJsJGy5WjZrqJkxUgQQvPqLcFgyGMLTitBb8lXnB/owicyZZDEG4B+4TQquz
	ST96jUnrBJ2sP78DjjCAiCu15qVxjsKl9tEgmVPTsAqnUmb5Uw2sw58du6SbzqtKsjnfzIIPZajNh
	+cN5Utej0eguFIkz6isyM4euLv5Wee8Z+VRoVXC7zW3PLMbs6jLwbb400JW84CkG/NIcoJ1mdBc4T
	DIEWyWNi51VFX7ayx5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGABk-003qlF-Ro; Wed, 18 Aug 2021 01:16:16 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGABh-003qjR-Bx
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 01:16:14 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 108-20020a9d01750000b029050e5cc11ae3so790374otu.5
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 18:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pZhI8s0bq6Q/ufRFM0cKz5GDmu8z9ddT9tyGnPEkEkA=;
 b=aDSidZ9BSPLpHUN6uXr5SAS3ymqiL+2AnS9VF3DdMQ/mi+VytpUIXEbpRCop0rpbwY
 ans2rxACYBn2ElR7uvkycJ0Yz80gizdKwjdZub0SkjOf/AlpSB7r3Rjf8rOywavz9g7n
 QIts2DvtmtXeo6HbGW4bERIUwRaJF5kaemDXAtax5xdmH203FtxkDTFaOAbOjJNPO9it
 6OFLAssvzH9TpLsPtk8bU/2zWeJV2cPg4JIqJ/TXpiZFaR7AnOfEmGJEmiv6Dr1zmdni
 Ud8HYXA1oZng8GxVEMSVwbqD03WiPGVBNAYsOGvAho1TkMVH0exxH6Bu1kAr/SXHKpKk
 aGfg==
X-Gm-Message-State: AOAM531U/LFKSUwtEaKFuZ2GbJkWPXK1TEKm41FjsJCMu2RmQWBcCNji
 hlWvUREayD9NGZ1qDddznw==
X-Google-Smtp-Source: ABdhPJygYnXFnxnEh28gqMyYF6NthIHBysWjBhU7p2cYyKWsqAlZXR7MMNfgasUuDyAVpFFwk0mEQg==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr4970700otj.96.1629249371372;
 Tue, 17 Aug 2021 18:16:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l7sm747356ooq.28.2021.08.17.18.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:16:10 -0700 (PDT)
Received: (nullmailer pid 1176067 invoked by uid 1000);
 Wed, 18 Aug 2021 01:16:08 -0000
Date: Tue, 17 Aug 2021 20:16:08 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
Message-ID: <YRxfWJJ6+1GgVs33@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-10-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_181613_442911_13E3EE5C 
X-CRM114-Status: GOOD (  18.88  )
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

On Tue, Aug 17, 2021 at 04:27:29AM +0300, Dmitry Osipenko wrote:
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
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 62861a8fb5c6..07a08653798b 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -18,6 +18,7 @@ Required properties:
>  - resets: Must contain an entry for each entry in reset-names.
>    See ../reset/reset.txt for details.
>  - reset-names: Must include the following entries:
> +  - mc
>    - host1x

New entries should be at the end. Order matters.

>  
>  Optional properties:
> @@ -197,6 +198,7 @@ of the following host1x client modules:
>    - resets: Must contain an entry for each entry in reset-names.
>      See ../reset/reset.txt for details.
>    - reset-names: Must include the following entries:
> +    - mc
>      - 2d
>  
>    Optional properties:
> @@ -222,6 +224,8 @@ of the following host1x client modules:
>    - resets: Must contain an entry for each entry in reset-names.
>      See ../reset/reset.txt for details.
>    - reset-names: Must include the following entries:
> +    - mc
> +    - mc2 (Only required on SoCs with two 3D clocks)
>      - 3d
>      - 3d2 (Only required on SoCs with two 3D clocks)
>  
> -- 
> 2.32.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
