Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580F9C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 12:34:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFCCB64E31
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 12:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFCCB64E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NsJekJAXWSzf1Bh4qQ3unts2W7R5a7HAeRVX982+QFA=; b=Z+0O/0zaaI1L4rh/96l6OWBgC
	zPEMxR58C6N9IauAtqS/Gh59jEgjqTPmIBAzjvKz7Q0We1jeDmPWglzjltG8gDfFTZh6YRaWlbZVV
	1qgoi+/bI943Dg0SfiT3155F4RVvEWQ/aC0q0V3nGC8uwXwumPegXeYzC0Z1cF/taNeqeHCyA3E2O
	O1XqJlqvIlD8ka8uVs58h4pLj4qrG0CM1+uzBT5FCYUk87pdvKplMtlMat89b5hdsNLqAN06ynlba
	UBVx0HDSmmj5tYb/Zgtwz9e4ilf2kd2BPQlkahXds9B7el1nTsNKfIYUSmd0VYADje70NsNzQJ5Xk
	S6asFG60A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhkC-000487-9R; Mon, 01 Mar 2021 12:33:48 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhk9-00047L-6q
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 12:33:47 +0000
IronPort-SDR: Uhh6lsL0nUPwd8vGRHBsFY3Yh1oVr011u+G3Ywf6Eh5StCmDbdkSjTB1aU6E6yQB4pl2ANxlSD
 LM5+qcpFaMHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="185769886"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="185769886"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:33:35 -0800
IronPort-SDR: zppyfdXU5QvJl1RJocMEzyXKeStU7c36DtaZ7JYbXq0FqPYgFRBWiBhsmQ4p92q35z+jSxNMvr
 7WMXiULCDUtQ==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="406204935"
Received: from dumser-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.43.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:33:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Winkler\, Tomas" <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
In-Reply-To: <c430158c27c5460ba13a989c6f9646d7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <878s7narev.fsf@intel.com> <c430158c27c5460ba13a989c6f9646d7@intel.com>
Date: Mon, 01 Mar 2021 14:33:29 +0200
Message-ID: <875z2bdpeu.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_073345_418774_5E020F8D 
X-CRM114-Status: GOOD (  24.16  )
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

On Wed, 17 Feb 2021, "Winkler, Tomas" <tomas.winkler@intel.com> wrote:
>> 
>> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
>> > Intel discrete graphic devices have internal spi storage, that holds
>> > firmware and oprom images. The spi device is exposed to the user space
>> > via mtd framework to be accessed during manufacturing.
>> > The device is hardware locked after manufacturing and only read access
>> > is provided.
>> >
>> > The i915 plays role of a multi function device (mfd) and spi device is
>> > exposed as its child device. i915_spi platform driver binds to this
>> > device.
>> >
>> > Because the graphic card may undergo reset at any time and basically
>> > hot unplug all its child devices, this series also provides a fix to
>> > the mtd framework to make the reset graceful.
>> >
>> > Tomas Winkler (9):
>> >   drm/i915/spi: add spi device for discrete graphics
>> >   drm/i915/spi: intel_spi_region map
>> >   drm/i915/spi: add driver for on-die spi device
>> >   drm/i915/spi: implement region enumeration
>> >   drm/i915/spi: implement spi access functions
>> >   drm/i915/spi: spi register with mtd
>> >   drm/i915/spi: mtd: implement access handlers
>> >   drm/i915/spi: serialize spi access
>> >   mtd: use refcount to prevent corruption
>> >
>> >  drivers/gpu/drm/i915/Kconfig             |   3 +
>> >  drivers/gpu/drm/i915/Makefile            |   6 +
>> >  drivers/gpu/drm/i915/i915_drv.c          |   9 +
>> >  drivers/gpu/drm/i915/i915_drv.h          |   4 +
>> >  drivers/gpu/drm/i915/i915_reg.h          |   1 +
>> >  drivers/gpu/drm/i915/spi/intel_spi.c     |  62 +++
>> >  drivers/gpu/drm/i915/spi/intel_spi.h     |  24 +
>> 
>> I'm open to discussion, but after glancing through the series I've got a gut
>> feeling spi/ subdir should be purely about the separate module, and the
>> above two files should be in i915/ directory instead.
>
> Maybe, I don't have strong feelings about that, it is just a decision from which point you want to look at that.

*shrug*

No strong feelings either, and I don't think the decision is carved in
stone. We can move them around later if we want.

Up to you.

BR,
Jani.


>> 
>> As it is, I think it's a bit confusing that spi/ is both about the spi kernel module
>> and a singly .c file that's really part of i915.ko. Perhaps that messes up the
>> conventional descending to subdirs in the kernel build too?
>
> The intention was to make this capsulated from the file system point of view. 
> In general the spi driver could be somewhere in mtd directory, but it doesn't really fit exactly there either.
> I don't have a strong opinion about that, if you do I yield. 
>
>
> Thanks
> Tomas
>

-- 
Jani Nikula, Intel Open Source Graphics Center

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
