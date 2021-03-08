Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C145FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:30:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34992651F8
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34992651F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WxfJlFpJf1yP7v4mlotdEUsimjjpmIGNSHd1+sD5B8w=; b=ap61PLI4L2iXw9bwa/vuE6vQGS
	C80qUQmwqe+5yxoLhTXZR546fE/ALFsHfzSr1K+RP9CfkJ2iQEg7pkfoUXMZAlWutOw04qH9Ei10t
	ft/TQERthiG4S69AAY+P2uZ4CUotHHtML6oN3krl8JyRHOzzxS7wkcfiYb4TiKP9prXD/v1aUhcsq
	nKJo0hYepju6ZxPTAIfphucEg6xBPGQDVyitnLqiEj9ZxefsFrITHSqq5nzAUAWUJrrTzD/3SP4bG
	yNLD4u4SKp20O5D0Ytlwtp2w2faFjVD5qnYa+1Lm9AcfxDLx19jBh0XWiBdmY5E1lpPrTwU0K23Q9
	8iRUkfJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9OR-00FUax-JW; Mon, 08 Mar 2021 06:29:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9OO-00FUaP-0F
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=YUneJ7j5gJHdpTN26sbta8lPgMdza+oOHJeweMbxZDs=; b=FBVooGCJNkqfysPzhajkNg9zqi
 um7XO1VFEVt/Wus4dknUbhq+zLflX8RMnrGtwSgwxHtVlbFt5F02ii5htc8f4adKRf3THDK9w7vOa
 cO7FjKll4lQ20MEAXXbrhxca2xgtwGb5tnKUIsoZWatz9Sg9EWY94yM7mtJBZ+hLAOeeEAOLaq4jl
 sA664y6RY1AguXeqLbaLrXmD1MYyYFYu7l/1lg266nbhryQ6a7z3QQwQSF4EvpTvnjYEIH5o+ZSPp
 GDjMMsdbavlsrv27HzlbMHAc8Ypo+KBW8VHiFQNvxX3LTD4SH79B1Gre1tYvBL9kk4Jjp9RgY6qGG
 XbtuA54w==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9O8-00F81V-Qx
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:29:19 +0000
IronPort-SDR: 5ZiPSKS/QRTCbh/AVPUoyD9knG1eQJ0DJ04g+hijjvUwX7ER4ehfAYa8Hc6WhTEdsXsz+o+91t
 V2xWSXiXvQaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084453"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:01 -0800
IronPort-SDR: CWvx1z7gpnU9AgJ39vLXpWvqpox+5VXZ31mE3yfxyUQzofwQRQWc2embaa46PFetO2Kp/wtHA2
 f/0D1awsROUg==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181879"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:27:58 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Subject: [RFC PATCH 00/10 v2] drm/i915/spi: discrete graphics internal spi
Date: Mon,  8 Mar 2021 08:27:38 +0200
Message-Id: <20210308062748.208017-1-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062911_519633_14B062E9 
X-CRM114-Status: GOOD (  12.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Intel discrete graphic devices have internal spi storage, that holds
firmware and oprom images. The spi device is exposed to the user space
via mtd framework to be accessed during manufacturing.
The device is hardware locked after manufacturing and only read access
is provided.

The i915 plays role of a multi function device (mfd) and spi device
is exposed as its child device. i915_spi platform driver binds to 
this device.

Because the graphic card may undergo reset at any time and basically hot
unplug all its child devices, this series also provides a fix to the mtd
framework to make the reset graceful.

V2: 
1. Adding separate Makefile for i915_spi module
2. Adding MAINTAINERS entry
3. Addressing other small comments
4. Haven't got comments from the MTD maintainers so just resending the
patch.



Tomas Winkler (10):
  drm/i915/spi: add spi device for discrete graphics
  drm/i915/spi: intel_spi_region map
  drm/i915/spi: add driver for on-die spi device
  drm/i915/spi: implement regions enumeration
  drm/i915/spi: implement spi access functions
  drm/i915/spi: spi register with mtd
  drm/i915/spi: mtd: implement access handlers
  drm/i915/spi: serialize spi access
  MAINTAINERS: add Intel i915 spi driver entry
  mtd: use refcount to prevent corruption

 MAINTAINERS                          |  11 +
 drivers/gpu/drm/i915/Kconfig         |   3 +
 drivers/gpu/drm/i915/Makefile        |   4 +
 drivers/gpu/drm/i915/i915_drv.c      |   7 +
 drivers/gpu/drm/i915/i915_drv.h      |   4 +
 drivers/gpu/drm/i915/i915_reg.h      |   1 +
 drivers/gpu/drm/i915/spi/Kconfig     |  17 +
 drivers/gpu/drm/i915/spi/Makefile    |   7 +
 drivers/gpu/drm/i915/spi/i915_spi.c  | 675 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/spi/intel_spi.c |  49 ++
 drivers/gpu/drm/i915/spi/intel_spi.h |  22 +
 drivers/mtd/mtdcore.c                |  64 ++-
 drivers/mtd/mtdcore.h                |   1 +
 drivers/mtd/mtdpart.c                |  13 +-
 include/linux/mtd/mtd.h              |   2 +-
 15 files changed, 848 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/spi/Kconfig
 create mode 100644 drivers/gpu/drm/i915/spi/Makefile
 create mode 100644 drivers/gpu/drm/i915/spi/i915_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
