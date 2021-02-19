Return-Path: <SRS0=dRpU=HV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC320C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 23:00:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7991664E2F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 23:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7991664E2F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s+PcIWgmWi16DAyBsGdNDUCgo1DcTsyxjkacr6FPwmU=; b=tCR2vDv0W9puxv73MEzYUp8ue
	aJON35hlj/TyqwRZcNKkfBkpDBdCpiQFKZAAzb6QyXx9JjfMnFGnP/v/6NL7L8HVbwOyhAVERJDoL
	wOAIEntmlI7Hjn8T1sJx8YQDmxjwJUOJlzShJP6cjPTi6jraGX/CBbcK46A1TAH5HON+U8dA4v0Qk
	kSZpsRVgqhU0rnayzS6rlt51ahGcn0+CzQiieOUjEb7/dLylFcoZvmlG6Sayq1S/mjP/maWgt9cJD
	w/s67m9/v5K5S5g1RKCzkqVrCmrYgrvWhmZw6znh89SIiPqMGyEieDR8JFwhA/urBneLf3gAe+eKK
	iW84ddk1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDEkJ-0005Ki-Gd; Fri, 19 Feb 2021 22:59:35 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDEkG-0005Jt-Uz
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2021 22:59:33 +0000
IronPort-SDR: 3MFKBHlAkNbN2foX3p1xPLBLnHs3kJ/4GRnF0Ho8eKY3H5V1fnTr8ltnZGsb6/J/Jdp2hLpA/n
 +/7NcMyVR6VA==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="163137241"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="163137241"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 14:59:27 -0800
IronPort-SDR: AWDqcz5aNrLMlSfE/jADiJ87e1OB9HgLGeULywBPWsNAYDKLrsPZJ27RPCAOax6TNbUX9KSxBF
 +5f4vN5edIyQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="591048457"
Received: from anmitta2-mobl2.gar.corp.intel.com (HELO ldmartin-desk1)
 ([10.209.128.21])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 14:59:26 -0800
Date: Fri, 19 Feb 2021 14:59:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 3/9] drm/i915/spi: add driver for on-die
 spi device
Message-ID: <20210219225926.ldwxla7b6bppx6dz@ldmartin-desk1>
X-Patchwork-Hint: comment
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <20210216181925.650082-4-tomas.winkler@intel.com>
 <87blcjarof.fsf@intel.com>
 <b08989f480564bbea5ce187797e9e30b@intel.com>
 <20210218094916.brm7j62if573xu5c@ldmartin-desk1>
 <23876b68716b4c5085145b54029b90bc@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23876b68716b4c5085145b54029b90bc@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_175933_179288_899A900A 
X-CRM114-Status: GOOD (  19.25  )
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

On Thu, Feb 18, 2021 at 10:06:08PM -0800, Winkler, Tomas wrote:
>
>>
>> On Wed, Feb 17, 2021 at 08:58:12PM +0000, Winkler, Tomas wrote:
>> >>
>> >> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
>> >> > Add the platform driver for i915 on-die spi device, exposed via mfd
>> >> > framework.
>> >> >
>> >> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
>> >> > ---
>> >> >  drivers/gpu/drm/i915/Kconfig             |   2 +
>> >> >  drivers/gpu/drm/i915/Makefile            |   3 +
>> >> >  drivers/gpu/drm/i915/spi/intel_spi_drv.c | 116
>> >> > +++++++++++++++++++++++
>> >> >  3 files changed, 121 insertions(+)  create mode 100644
>> >> > drivers/gpu/drm/i915/spi/intel_spi_drv.c
>> >> >
>> >> > diff --git a/drivers/gpu/drm/i915/Kconfig
>> >> > b/drivers/gpu/drm/i915/Kconfig index abcaa8da45ac..13c870e5878e
>> >> > 100644
>> >> > --- a/drivers/gpu/drm/i915/Kconfig
>> >> > +++ b/drivers/gpu/drm/i915/Kconfig
>> >> > @@ -27,6 +27,8 @@ config DRM_I915
>> >> >  	select CEC_CORE if CEC_NOTIFIER
>> >> >  	select VMAP_PFN
>> >> >  	select MFD_CORE
>> >> > +	select MTD
>> >>
>> >> Selecting MTD does not seem to be a popular thing to do, which is
>> >> usually a clue it's probably the wrong thing to do.
>> >Depends, if it is not selected you'll end with wrongly configured system.
>>
>> no. I believe the idea is that having a CONFIG_I915_SPI, you could do
>>
>> 	depends on MTD
>>
>> like the other drivers doing similar thing:
>>
>> 	git grep MTD -- ':(exclude)drivers/mtd' ':(exclude)arch/' '*Kconfig'
> I know the pattern and it can be done, the issue is that mtd is used mostly in embedded systems so it is not selected by the desktop distros.
>The intel spi both on PCH and in GFX takes this into different direction and usage.

humn... but then we have a problem here. You're saying most of the
people won't need it because it's used only for manufacturing*.
And yet you want it to be force selected on everybody?  That
doesn't sound like a good plan.

Lucas De Marchi


* it may actually also be useful for kernel developers too, to dump its
content and validate the parser, help debug other systems, etc.

>
>Thanks
>Tomas
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
