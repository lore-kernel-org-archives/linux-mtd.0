Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5C3C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 09:50:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD6F6148E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 09:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD6F6148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqdekEMncVUimrNq3YY+Cywq2qvoYo+2r35p3K2iMOo=; b=V1B1pbgm2hBO8/rYGEZG/dt5c
	Rk9H8yR7gxjCK+IRWhMN8v8Qf1Bh06HOnQebS3oD+ROCQLLUeyUC7KM/AGJqJqZYoP2LU4bR9hBHB
	7fxy7ayBQ/9201GLpEg5/mYnLo7KBNRZFgmnBHQlVdU96Jd3RhfQNdjo69XuLrlOOp4KmH/nod/KP
	qymqj77YJHI5z8BGIwbl8RnTUsun4jaUx9jPpqaPGTkKeMovb72UWRgvXH/Jln2u1SN23CRjnwKPD
	95gJg0XjWpAmQfceSqVAACNPDANYvDrdv5pNi1xraQjQLCqxh5z9/uX8ptEwGAJQo3p9M5nfHtQMz
	Zr5nXVxwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCfw2-0007Y0-N9; Thu, 18 Feb 2021 09:49:22 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCfvz-0007XT-JP
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 09:49:20 +0000
IronPort-SDR: 72aIdIbK4DKehLE196E6W7X22ZleLxHClNlk1G89zxWkSpFxkOF04MQFwom6RFDJCvLAtbRpN1
 4h/famE7obNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="182660617"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="182660617"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 01:49:18 -0800
IronPort-SDR: NP6a+DOSWEaEeCjPNJhH5vjacxJCsa/izqu+KBmhaj/Xr+M3s1y52/SZYQ1amy0+aixdvseJDL
 vRO1EfDl98Eg==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="378350425"
Received: from oogunmoy-mobl1.amr.corp.intel.com (HELO ldmartin-desk1)
 ([10.209.147.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 01:49:17 -0800
Date: Thu, 18 Feb 2021 01:49:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Message-ID: <20210218094916.brm7j62if573xu5c@ldmartin-desk1>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <20210216181925.650082-4-tomas.winkler@intel.com>
 <87blcjarof.fsf@intel.com>
 <b08989f480564bbea5ce187797e9e30b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b08989f480564bbea5ce187797e9e30b@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_044919_798963_22542407 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 17, 2021 at 08:58:12PM +0000, Winkler, Tomas wrote:
>>
>> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
>> > Add the platform driver for i915 on-die spi device, exposed via mfd
>> > framework.
>> >
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/Kconfig             |   2 +
>> >  drivers/gpu/drm/i915/Makefile            |   3 +
>> >  drivers/gpu/drm/i915/spi/intel_spi_drv.c | 116
>> > +++++++++++++++++++++++
>> >  3 files changed, 121 insertions(+)
>> >  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi_drv.c
>> >
>> > diff --git a/drivers/gpu/drm/i915/Kconfig
>> > b/drivers/gpu/drm/i915/Kconfig index abcaa8da45ac..13c870e5878e 100644
>> > --- a/drivers/gpu/drm/i915/Kconfig
>> > +++ b/drivers/gpu/drm/i915/Kconfig
>> > @@ -27,6 +27,8 @@ config DRM_I915
>> >  	select CEC_CORE if CEC_NOTIFIER
>> >  	select VMAP_PFN
>> >  	select MFD_CORE
>> > +	select MTD
>>
>> Selecting MTD does not seem to be a popular thing to do, which is usually a
>> clue it's probably the wrong thing to do.
>Depends, if it is not selected you'll end with wrongly configured system.

no. I believe the idea is that having a CONFIG_I915_SPI, you could do

	depends on MTD

like the other drivers doing similar thing:

	git grep MTD -- ':(exclude)drivers/mtd' ':(exclude)arch/' '*Kconfig'

Lucas De Marchi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
