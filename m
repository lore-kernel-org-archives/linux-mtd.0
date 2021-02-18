Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A677C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:52:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D801764DF0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D801764DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t3tx3qo40WqjZGC3bwTvcslCYUYASjMO6ROsu80wSOE=; b=czns1njiV+OgetRe/ofWXTSAf
	XPxSH+HRJ8OTsJCkMn4nT86N3QOD2z4RsKeLzr3ik4Wgk1JiAWDrOoJJYbwp8tDDDtgto1fu549/o
	4gMMBZQaDCvQNaHUCVRmUoVLO1+rBGReyo8EWENZHxmZ+8bmGVN9XSB+eLCL1WEbIW2iA7YAWQY6X
	I+t9R/cF2T5bcldzCenHTGhYqGmKAfGWQwM9v04MhuCjKGbU4gFGwNdg8bFuuKQcqGM4+HNA0wcoJ
	sfebv4mahLhznIlGEcP8QJ7vtPQXlrXWmOXRIVBSugKsm5iqSjZmB4KUHfviCR3XCMMRPL8GDOsv0
	gME68OBMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCgtR-0005U2-D9; Thu, 18 Feb 2021 10:50:45 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCgtM-0005TB-Ux
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 10:50:43 +0000
IronPort-SDR: cqH66MA6sFAW57gncNRTUBBDVTBT1krV11Hw8PQQcPfwykhqxSWExvn0tvaY+UI4HuFofAAqwW
 bKY95tDoGOjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="180902283"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="180902283"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 02:50:38 -0800
IronPort-SDR: EUdxesrgedfBn4nDZhOsPrlSfp+UlHEiEtI4pRA/NSV6qLxONqAIGvVWTCE3Mw6EkvVmjXA+TK
 LHbJHzoyB2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="385838866"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 18 Feb 2021 02:50:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 02:50:38 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 02:50:36 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Thu, 18 Feb 2021 12:50:34 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Thread-Topic: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Thread-Index: AQHXBJBcj4Goi4XIwEe9K9Ji08dc+apcDHIAgADGOPCAALlRAIAAMDVA
Date: Thu, 18 Feb 2021 10:50:34 +0000
Message-ID: <b21d2b43a98f4947b062fe31bd350566@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <20210216181925.650082-4-tomas.winkler@intel.com> <87blcjarof.fsf@intel.com>
 <b08989f480564bbea5ce187797e9e30b@intel.com>
 <20210218094916.brm7j62if573xu5c@ldmartin-desk1>
In-Reply-To: <20210218094916.brm7j62if573xu5c@ldmartin-desk1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_055041_159310_414048A7 
X-CRM114-Status: GOOD (  17.59  )
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
Cc: Vignesh
 Raghavendra <vigneshr@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> 
> On Wed, Feb 17, 2021 at 08:58:12PM +0000, Winkler, Tomas wrote:
> >>
> >> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
> >> > Add the platform driver for i915 on-die spi device, exposed via mfd
> >> > framework.
> >> >
> >> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/Kconfig             |   2 +
> >> >  drivers/gpu/drm/i915/Makefile            |   3 +
> >> >  drivers/gpu/drm/i915/spi/intel_spi_drv.c | 116
> >> > +++++++++++++++++++++++
> >> >  3 files changed, 121 insertions(+)  create mode 100644
> >> > drivers/gpu/drm/i915/spi/intel_spi_drv.c
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/Kconfig
> >> > b/drivers/gpu/drm/i915/Kconfig index abcaa8da45ac..13c870e5878e
> >> > 100644
> >> > --- a/drivers/gpu/drm/i915/Kconfig
> >> > +++ b/drivers/gpu/drm/i915/Kconfig
> >> > @@ -27,6 +27,8 @@ config DRM_I915
> >> >  	select CEC_CORE if CEC_NOTIFIER
> >> >  	select VMAP_PFN
> >> >  	select MFD_CORE
> >> > +	select MTD
> >>
> >> Selecting MTD does not seem to be a popular thing to do, which is
> >> usually a clue it's probably the wrong thing to do.
> >Depends, if it is not selected you'll end with wrongly configured system.
> 
> no. I believe the idea is that having a CONFIG_I915_SPI, you could do
> 
> 	depends on MTD
> 
> like the other drivers doing similar thing:
> 
> 	git grep MTD -- ':(exclude)drivers/mtd' ':(exclude)arch/' '*Kconfig'
MTD is usually used on embedded systems rather than on general distros, i915_spi and actually a bit redefines its usage 
so w/o forceful select, it won't be enabled.

> 
> Lucas De Marchi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
