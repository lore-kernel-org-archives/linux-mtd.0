Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EE6C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 11:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC7564E57
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 11:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FC7564E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mGUibyxDoxMSaeZLS4dGOVkGjYzMJQTknOVo8pWLUbQ=; b=O/+vQhvCh2ozhgBPUsJ2b8Xmc
	0PCNV++bGlX937ddpYAzlyjD0CaI4QUHKcKWque8n5lW3cPysy3r7EGQvRp4xZ9BIrBi8S+hFRRlq
	I313r9z6bj/hybuJKqCHH//1aOCm2p3EWty6ecgKPuk4H+zNenu+Y+A08aZJ6zIE7zVI32b3VBBlh
	hKyzrVr+Bpx2T9VVCXADj4P2pmf3VpKQegv1aae11QH5c6ZZXXVUG96CL5sQiOxTpNf9iDv0K7Vib
	jC2Gw6T6S/HNKvEmURweVLfDfN6qMc/Cl7DlerooLmzgscwv4NKpZLhRbc+6rb2RM9v/3rFJVnggR
	yEGej/xMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE9Qi-0005fc-Io; Mon, 22 Feb 2021 11:31:08 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE9Qg-0005f7-Fv
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 11:31:07 +0000
IronPort-SDR: /KvPV1olgPAtI1zPn9K4+gFx+PEB7ElhUACBirHwCHUNr3Pu3QyizPOTUPsX8BMLJMK2BL8oWG
 uUxyQAqR9Smw==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="248467249"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="248467249"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 03:30:59 -0800
IronPort-SDR: YbD29sYxXz1R+7wjyIr3QtF0L45UQP9h44HLwp+8IjWOq58YjgTZ50Ea6HNr358EAYqgBOozX0
 OYeI94D+Ge+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="379975893"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 22 Feb 2021 03:30:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 03:30:59 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 03:30:57 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Mon, 22 Feb 2021 13:30:56 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [RFC PATCH 2/9] drm/i915/spi: intel_spi_region map
Thread-Topic: [RFC PATCH 2/9] drm/i915/spi: intel_spi_region map
Thread-Index: AQHXBJBVKwf5piBMOke5w08ZELz+LapcCZsAgAC3KiCABxx5AIAANLrA
Date: Mon, 22 Feb 2021 11:30:56 +0000
Message-ID: <ef89f4dc32d843df84719b8fcf11d385@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <20210216181925.650082-3-tomas.winkler@intel.com> <87eehfas5d.fsf@intel.com>
 <9768d50298114d7daf9736f17c6ed009@intel.com> <87v9akfltn.fsf@intel.com>
In-Reply-To: <87v9akfltn.fsf@intel.com>
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
X-CRM114-CacheID: sfid-20210222_063106_676240_D7D80A04 
X-CRM114-Status: GOOD (  24.96  )
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


> On Wed, 17 Feb 2021, "Winkler, Tomas" <tomas.winkler@intel.com> wrote:
> >> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
> >> > Add the dGFX spi region map and convey it via mfd cell platform
> >> > data to the spi child device.
> >> >
> >> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/spi/intel_spi.c | 9 +++++++++
> >> > drivers/gpu/drm/i915/spi/intel_spi.h | 5 +++++
> >> >  2 files changed, 14 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c
> >> > b/drivers/gpu/drm/i915/spi/intel_spi.c
> >> > index 07da7197bd5d..6f83f24f7208 100644
> >> > --- a/drivers/gpu/drm/i915/spi/intel_spi.c
> >> > +++ b/drivers/gpu/drm/i915/spi/intel_spi.c
> >> > @@ -14,11 +14,20 @@ static const struct resource spi_resources[] = {
> >> >  	DEFINE_RES_MEM_NAMED(GEN12_GUNIT_SPI_BASE, 0x80, "i915-
> >> spi-mmio"),
> >> > };
> >> >
> >> > +static const struct i915_spi_region regions[I915_SPI_REGIONS] = {
> >> > +	[0] = { .name = "DESCRIPTOR", },
> >> > +	[2] = { .name = "GSC", },
> >> > +	[11] = { .name = "OptionROM", },
> >> > +	[12] = { .name = "DAM", },
> >> > +};
> >> > +
> >> >  static const struct mfd_cell intel_spi_cell = {
> >> >  	.id = 2,
> >> >  	.name = "i915-spi",
> >> >  	.num_resources = ARRAY_SIZE(spi_resources),
> >> >  	.resources = spi_resources,
> >> > +	.platform_data = (void *)regions,
> >> > +	.pdata_size    = sizeof(regions),
> >> >  };
> >> >
> >> >  void intel_spi_init(struct intel_spi *spi, struct drm_i915_private
> >> > *dev_priv) diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h
> >> > b/drivers/gpu/drm/i915/spi/intel_spi.h
> >> > index 276551fed993..6b5bf053f7d3 100644
> >> > --- a/drivers/gpu/drm/i915/spi/intel_spi.h
> >> > +++ b/drivers/gpu/drm/i915/spi/intel_spi.h
> >> > @@ -8,6 +8,11 @@
> >> >
> >> >  struct drm_i915_private;
> >> >
> >> > +#define I915_SPI_REGIONS 13
> >> > +struct i915_spi_region {
> >> > +	const char *name;
> >> > +};
> >>
> >> Does this need to be exposed to the rest of i915?
> > This part is between the device which is part of i915 and the driver.
> >>If we're trying to isolate
> >> spi/, I'd prefer it if this header was the only header included from
> >>the rest of  i915, and contained the minimum required information.
> >
> >> As the driver has grown bigger, we've tried to minimize the
> >> interconnections between the modules, and it's slow going. Let's try
> >> to keep the new parts isolated.
> >>
> > So do you prefer we create another header or duplicate the structure
> definition?
> 
> I didn't see the struct being used in i915, or am I missing something?
This file is part of i915
 
> Have a header that contains the interface exposed to the rest of i915, and
> another header with stuff internal to spi/?

The spi `device` is part of i915 (as a mfd cell) and  struct i915_spi_region is  passed to the spi `driver` as platform_data of the device.
In order for driver to be able to understand  it needs to know ' struct i915_spi_region' 

Thanks
Tomas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
