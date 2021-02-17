Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4351C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 13:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E88C64E0F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 13:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E88C64E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ioLUAzRhRAmbjFQYCy3uvNvMwpITvcWhrTguuUB3c14=; b=b9tVWDNpqtfMR/24Vnh7L8Tni
	QwpU4MBcNYuQ/JDnoHDtqtal2P5aQwzqoyq1cfZW1U1jBsvX0NLRIhVORL3G3rOuYf9Zzf35wNhQY
	WCLd5EJMYdtBTwPrD9hpEt3DFDSrV9ZyJkyJ/gzdsVCRpGcLyURM2W05nb+Mkke5iX+G1yS7wNXKy
	dObMKa+1ourTZatMHEFUB+xk3135V1IBxW8eI/ygwPFLvmCt8AicrnvYlIXsQF66MOogS6OmviVM5
	ygNCabLU4nFLyr8Jsjc+qC91Ko08q9g79v5stVNCq8iw4oqRL/N1jH66G6XmY1P6ntq5O7CBqGY6A
	D3w281tJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCNKE-0007dl-Rk; Wed, 17 Feb 2021 13:57:06 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCNKB-0007d3-Qa
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 13:57:05 +0000
IronPort-SDR: etvw3WATbu7/yAw1XhT0dTzOizuCCKkg4suSGbFIRSExlqUWvwpeddjs1+/snLkzYEV3yCwm8K
 ybdcROach4og==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="247265141"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="247265141"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 05:56:59 -0800
IronPort-SDR: DKgKrtDkr/nFkwXJ0kBzgY78+HaoCo/9ZgAQLEiJgUZoe27E6uiCoel8WPvJUmr3YaVxOCsW6P
 F8c8HrawnOfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="426392650"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2021 05:56:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Feb 2021 05:56:59 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Feb 2021 05:56:58 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Wed, 17 Feb 2021 15:56:56 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Topic: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Index: AQHXBJBTlGMG4b5GwU+w3NO1EU5QQapcDgwAgAA/+BA=
Date: Wed, 17 Feb 2021 13:56:56 +0000
Message-ID: <c430158c27c5460ba13a989c6f9646d7@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <878s7narev.fsf@intel.com>
In-Reply-To: <878s7narev.fsf@intel.com>
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
X-CRM114-CacheID: sfid-20210217_085704_032494_C041BE27 
X-CRM114-Status: GOOD (  22.48  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Lubart,
 Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> 
> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
> > Intel discrete graphic devices have internal spi storage, that holds
> > firmware and oprom images. The spi device is exposed to the user space
> > via mtd framework to be accessed during manufacturing.
> > The device is hardware locked after manufacturing and only read access
> > is provided.
> >
> > The i915 plays role of a multi function device (mfd) and spi device is
> > exposed as its child device. i915_spi platform driver binds to this
> > device.
> >
> > Because the graphic card may undergo reset at any time and basically
> > hot unplug all its child devices, this series also provides a fix to
> > the mtd framework to make the reset graceful.
> >
> > Tomas Winkler (9):
> >   drm/i915/spi: add spi device for discrete graphics
> >   drm/i915/spi: intel_spi_region map
> >   drm/i915/spi: add driver for on-die spi device
> >   drm/i915/spi: implement region enumeration
> >   drm/i915/spi: implement spi access functions
> >   drm/i915/spi: spi register with mtd
> >   drm/i915/spi: mtd: implement access handlers
> >   drm/i915/spi: serialize spi access
> >   mtd: use refcount to prevent corruption
> >
> >  drivers/gpu/drm/i915/Kconfig             |   3 +
> >  drivers/gpu/drm/i915/Makefile            |   6 +
> >  drivers/gpu/drm/i915/i915_drv.c          |   9 +
> >  drivers/gpu/drm/i915/i915_drv.h          |   4 +
> >  drivers/gpu/drm/i915/i915_reg.h          |   1 +
> >  drivers/gpu/drm/i915/spi/intel_spi.c     |  62 +++
> >  drivers/gpu/drm/i915/spi/intel_spi.h     |  24 +
> 
> I'm open to discussion, but after glancing through the series I've got a gut
> feeling spi/ subdir should be purely about the separate module, and the
> above two files should be in i915/ directory instead.

Maybe, I don't have strong feelings about that, it is just a decision from which point you want to look at that.
> 
> As it is, I think it's a bit confusing that spi/ is both about the spi kernel module
> and a singly .c file that's really part of i915.ko. Perhaps that messes up the
> conventional descending to subdirs in the kernel build too?

The intention was to make this capsulated from the file system point of view. 
In general the spi driver could be somewhere in mtd directory, but it doesn't really fit exactly there either.
I don't have a strong opinion about that, if you do I yield. 


Thanks
Tomas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
