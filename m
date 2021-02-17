Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF17C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 13:36:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EB1364E28
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 13:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EB1364E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jzVEi8hkxIMTFLoFV4IL9FPGIXO/YJjehQ1Qfec3pSQ=; b=2sP/QYf7ZbT0A/X2QtlIMaRGu
	Pu2Cr//MEco8+W5vbeW0Bk0nRikm5RUC2eZvpuHP+HQuUZghEly0e7WU/AkQ60eLQa8GyIbSXxjOv
	qu8ETz9XgiuNiJZLh0TD0qdYCPj5rOyj5wXyZ8W9HYZ+yswTb7ZOrzsZs69fiwwUgbVcN7Zs0VXyW
	Lp1HUvqABBOEEkI9fJTUNg3LtDXZebOpndvvMqkETSb50jZuDKufJutT5Mky+FsnfF2QS4G24S517
	pfVhZXHpjvhMSw78Xi+/5SaVMJsifiHQOMH7njAFvVlcew0N1PQnhDxZFu7vXUGXTCIZKduXYoaoK
	pYyjCHuHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCMzR-00065G-UO; Wed, 17 Feb 2021 13:35:37 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCMzP-00064b-QK
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 13:35:36 +0000
IronPort-SDR: p6haFsUQtb6ZqCSdonrhEgOYOSOVcntAs41ZqJHWRfYSwZtTBg9Ki9InF1/R+mq3+3NRNr0Y/o
 sKJz3kIch/gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202413227"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202413227"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 05:35:25 -0800
IronPort-SDR: E7KWUjU6pyOjNYF6HRxr6B+dxVyHroUbGhF3J5l8plQzlMsb3R99I7ELGnu3BC5EwFHt7QhBgj
 7Tej1d86EiqA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="385146056"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 05:35:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Winkler\, Tomas" <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
In-Reply-To: <062fec6f494b48fab840c64742fe767d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <87k0r7asmg.fsf@intel.com> <062fec6f494b48fab840c64742fe767d@intel.com>
Date: Wed, 17 Feb 2021 15:35:19 +0200
Message-ID: <875z2qbyw8.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_083536_024837_8C330500 
X-CRM114-Status: GOOD (  12.85  )
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
>> 
>> What's the plan wrt i915/spi maintainership?
>
> My suggestions is that this will be maintained by myself, as the major
> consumer is the manufacturing line.  It will be a separate section in
> MAINTAINERS file.

Works for me. Do you want to apply the patches directly to drm-intel, or
your own branch and send pull requests to i915 maintainers? Can also
start with the former, and move to the latter as needed.

Joonas, Rodrigo, thoughts?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
