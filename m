Return-Path: <SRS0=dRpU=HV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D40C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 06:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650E064EB2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 06:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650E064EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4N9/nFHnch95wT67jYtUAhUIIvbriUEMP6CZcqQYhUM=; b=1+G6YXPrWmipcol1k1RL0NqUi
	3QfaMbv7ikZlAkUOMuoJV59MZGBWlZBrIWhhK7PVfyOiSFS9FVvZf8DP9eaOAMvdD37N5zYHAt1qX
	Oq+2wQn9BTQ/HGx0tYF97aKfwBcOe6HjbmSb6XlSTzMq9zIAeOhE/h5Zw43mnksy5mysGcl2LsBMo
	dH7uqRxvapCJ2LLBM0NGHcNMQsJEnUiAgu/G8TCT+LHNcPDSwcITfTPBgVo+zswm+RlJpnulJtekP
	/dgkdVVUhgGcZp/vMjvx2Y+/cOkSVfqirw8ZSOLqKIkiibmvpmtLCzLcvvsu6R/ugWM/bvwhjqN3P
	TIAUOoenQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCyvi-0007i0-L3; Fri, 19 Feb 2021 06:06:18 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCyvf-0007hc-Nt
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2021 06:06:16 +0000
IronPort-SDR: CbTWuyYgDq9dbR/P50vcp+PkqHcT/d/jEFEprCeITUOMNBnywFsZ0gA25C/ptUO6AO4kjy7luI
 7XMxYlJIZt+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="171424687"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="171424687"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 22:06:12 -0800
IronPort-SDR: llnJFfyEqocWfcNAMxYYZ5cN66L+Fpki96CW5085hOOAah9Q2j4iECLIdyBn62w5BWQAGjSeg8
 n5Iri5ePGS0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="581571758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 18 Feb 2021 22:06:12 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 22:06:11 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 22:06:10 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Fri, 19 Feb 2021 08:06:08 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Thread-Topic: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Thread-Index: AQHXBJBcj4Goi4XIwEe9K9Ji08dc+apcDHIAgADGOPCAALlRAIAAJMVw
Date: Fri, 19 Feb 2021 06:06:08 +0000
Message-ID: <23876b68716b4c5085145b54029b90bc@intel.com>
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
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_010615_967120_FCB6995C 
X-CRM114-Status: GOOD (  18.81  )
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
 I know the pattern and it can be done, the issue is that mtd is used mostly in embedded systems so it is not selected by the desktop distros.
The intel spi both on PCH and in GFX takes this into different direction and usage.

Thanks
Tomas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
