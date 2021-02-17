Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14276C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 18:35:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB23161481
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 18:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB23161481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2SEYm6aXSbGcHxyr5uvxdJ5qFoXQvjnKCdFbV9Zk87s=; b=2SYJWxfRXEI/rpAH++SC+N6I+
	8ytX9zh1Q2eYN3SsibbT1Z3ZJkGp3Q3fVLoPq/J1z/9EbdbLeZsA0xJNNHx/wmcZ5H6fYRYADi3tw
	7K14Xk1/RibuEgbaN4/ZaHif0DBM0itcfBCjmBkfR+uQM5Xe2brbn+55QRziuuZBz8mQGaF6z3iyF
	IFls5vOYYowjzgvtMDP5WuR7nWDgoJTbqEvq2ZysfNedP27d5U96hRvuwwIzLS8QvLHYDcJJpDcgz
	pr2ITuwJoQbIY9wa5okGjWZ7JP+8/E6R9Q5ccJIYBCnaHkDkJ7nMO2KaVXAhjAasPLW3bKg8V2BLE
	5Lte+hKsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCReQ-0000B2-9P; Wed, 17 Feb 2021 18:34:14 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCReM-00009m-O2
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 18:34:12 +0000
IronPort-SDR: BHlcqj5tYfdycpVXAKzwOJIfkLUc0qD5FUrJzkZ80vvEKuVzziBKbUM4xwhondkZaTAqIV+Wua
 cKKRgpHayowQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="202511829"
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="202511829"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:34:01 -0800
IronPort-SDR: Nf/vLJGW2tPZejivdgqKuERm/bHhUiP5QV+jM++9sVEyoaL8swPBrJZrBofUwBEppgL/c9FqgF
 u8u+MN0vDQyw==
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="385294068"
Received: from gfreude-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.209.147.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:34:00 -0800
Date: Wed, 17 Feb 2021 13:33:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 0/9] drm/i915/spi: discrete graphics
 internal spi
Message-ID: <YC1hlyv3xMIrVDrN@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <87k0r7asmg.fsf@intel.com>
 <062fec6f494b48fab840c64742fe767d@intel.com>
 <875z2qbyw8.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875z2qbyw8.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_133410_952410_97C934C1 
X-CRM114-Status: GOOD (  19.60  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 17, 2021 at 03:35:19PM +0200, Jani Nikula wrote:
> On Wed, 17 Feb 2021, "Winkler, Tomas" <tomas.winkler@intel.com> wrote:
> >> 
> >> On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
> >> > Intel discrete graphic devices have internal spi storage, that holds
> >> > firmware and oprom images. The spi device is exposed to the user space
> >> > via mtd framework to be accessed during manufacturing.
> >> > The device is hardware locked after manufacturing and only read access
> >> > is provided.
> >> >
> >> > The i915 plays role of a multi function device (mfd) and spi device is
> >> > exposed as its child device. i915_spi platform driver binds to this
> >> > device.
> >> 
> >> What's the plan wrt i915/spi maintainership?
> >
> > My suggestions is that this will be maintained by myself, as the major
> > consumer is the manufacturing line.  It will be a separate section in
> > MAINTAINERS file.
> 
> Works for me. Do you want to apply the patches directly to drm-intel, or
> your own branch and send pull requests to i915 maintainers? Can also
> start with the former, and move to the latter as needed.
> 
> Joonas, Rodrigo, thoughts?

No strong opinion here. But I believe the pull request flow makes sense.

> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
