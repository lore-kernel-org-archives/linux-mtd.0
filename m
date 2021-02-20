Return-Path: <SRS0=vMMB=HW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ADBC433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Feb 2021 17:58:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5731D64EB4
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Feb 2021 17:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5731D64EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uvzcVZge0VKYNWH6DJoEV8rFbpBDHHtuJZ80WMtR1yE=; b=ADacK56+3xsuHbgtM8s2Luujc
	sUVyGkALA0iz5KajJ7ATmqo2dB2pqliPZYtKOIlPcYtXLqAxOvyedbCZ8UiazD2eTMtol0/sQQsef
	dz1uc7jrQvxhsssn3AQ1dA42CbW84y7I/qnPAwAmFgEx0AqJ5qBMYPr2NKOqVKhj0ebr708ayl7At
	BOGQGYV7B1d5Ca9EsLaC0dS45J7oaBYhV2hixcbuPR2QmXBFd2meH8GRKrqJB4mt9OimQEK99vmA9
	9F8lzTttSXiq8kek+7XkRGMkyQhDzB6QcYhi3Cdd68bcEDNHA5ekwdsIH0GnW6XimK4iFdI6V2CpY
	BNpzOMRdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDWUa-0007vV-Qf; Sat, 20 Feb 2021 17:56:32 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDWUU-0007vA-HY
 for linux-mtd@lists.infradead.org; Sat, 20 Feb 2021 17:56:27 +0000
IronPort-SDR: m5MX/l907K7tHGkOJmw+7XZx7Tb10LMABXsVkz6ua4PnHVUDQE9WE/CTsXCaDMAWU84cYtB0XO
 nNWpm4HM/zmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9901"; a="183348900"
X-IronPort-AV: E=Sophos;i="5.81,193,1610438400"; d="scan'208";a="183348900"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2021 09:56:23 -0800
IronPort-SDR: 64IZRj4XcA7JeOQeVSxnh7Paj02UWEJlMG/3ngHRO1a2fasVDRqaufgMEFGs19i7sNYxP7GocW
 Xo6XeN1L4gSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,193,1610438400"; d="scan'208";a="387841258"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 20 Feb 2021 09:56:23 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 20 Feb 2021 09:56:22 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 20 Feb 2021 09:56:21 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Sat, 20 Feb 2021 19:56:19 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Thread-Topic: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Thread-Index: AQHXBJBcj4Goi4XIwEe9K9Ji08dc+apcDHIAgADGOPCAALlRAIAAJMVwgAJKVQCAAVwC4A==
Date: Sat, 20 Feb 2021 17:56:19 +0000
Message-ID: <6f49005359df46328226498724eecbcc@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <20210216181925.650082-4-tomas.winkler@intel.com> <87blcjarof.fsf@intel.com>
 <b08989f480564bbea5ce187797e9e30b@intel.com>
 <20210218094916.brm7j62if573xu5c@ldmartin-desk1>
 <23876b68716b4c5085145b54029b90bc@intel.com>
 <20210219225926.ldwxla7b6bppx6dz@ldmartin-desk1>
In-Reply-To: <20210219225926.ldwxla7b6bppx6dz@ldmartin-desk1>
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
X-CRM114-CacheID: sfid-20210220_125626_735984_3B92166F 
X-CRM114-Status: GOOD (  25.58  )
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



> On Thu, Feb 18, 2021 at 10:06:08PM -0800, Winkler, Tomas wrote:
> >
> >>
> >> On Wed, Feb 17, 2021 at 08:58:12PM +0000, Winkler, Tomas wrote:
> >> >>
> >> >> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com>
> wrote:
> >> >> > Add the platform driver for i915 on-die spi device, exposed via
> >> >> > mfd framework.
> >> >> >
> >> >> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> >> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> >> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> >> >> > ---
> >> >> >  drivers/gpu/drm/i915/Kconfig             |   2 +
> >> >> >  drivers/gpu/drm/i915/Makefile            |   3 +
> >> >> >  drivers/gpu/drm/i915/spi/intel_spi_drv.c | 116
> >> >> > +++++++++++++++++++++++
> >> >> >  3 files changed, 121 insertions(+)  create mode 100644
> >> >> > drivers/gpu/drm/i915/spi/intel_spi_drv.c
> >> >> >
> >> >> > diff --git a/drivers/gpu/drm/i915/Kconfig
> >> >> > b/drivers/gpu/drm/i915/Kconfig index abcaa8da45ac..13c870e5878e
> >> >> > 100644
> >> >> > --- a/drivers/gpu/drm/i915/Kconfig
> >> >> > +++ b/drivers/gpu/drm/i915/Kconfig
> >> >> > @@ -27,6 +27,8 @@ config DRM_I915
> >> >> >  	select CEC_CORE if CEC_NOTIFIER
> >> >> >  	select VMAP_PFN
> >> >> >  	select MFD_CORE
> >> >> > +	select MTD
> >> >>
> >> >> Selecting MTD does not seem to be a popular thing to do, which is
> >> >> usually a clue it's probably the wrong thing to do.
> >> >Depends, if it is not selected you'll end with wrongly configured system.
> >>
> >> no. I believe the idea is that having a CONFIG_I915_SPI, you could do
> >>
> >> 	depends on MTD
> >>
> >> like the other drivers doing similar thing:
> >>
> >> 	git grep MTD -- ':(exclude)drivers/mtd' ':(exclude)arch/' '*Kconfig'
> > I know the pattern and it can be done, the issue is that mtd is used mostly
> in embedded systems so it is not selected by the desktop distros.
> >The intel spi both on PCH and in GFX takes this into different direction and
> usage.
> 
> humn... but then we have a problem here. You're saying most of the people
> won't need it because it's used only for manufacturing*.
> And yet you want it to be force selected on everybody?  That doesn't sound
> like a good plan.
It depends, whether manufacturing is done on shipping OS or not, both approaches are in use.
One approach for the first case can be that the distro prevent the module loading via modprobe.d 
and it's forcefully loaded during manufacturing.  Still it should be compiled and signed.
> 
> Lucas De Marchi
> 
> 
> * it may actually also be useful for kernel developers too, to dump its content
> and validate the parser, help debug other systems, etc.
True.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
