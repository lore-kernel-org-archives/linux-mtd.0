Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A4BC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:40:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11298651DE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11298651DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MWf+Ht6F8wZDaAuCTJ0dmZMCA322PcCdxO+yDQmuTIo=; b=MzOABBOZPP2ZiWyUY0j7XbIo6
	9tkithGFyCQDOA4MPQr3z/oLhoLKpvaWVRZK6b3Jxn+mNsB+ckxAhKeBUdJOQCL++zK+eQfbqGyDc
	t7p32Sks4LSWELRD1bf9UMM/wttMpEq3X2N72yBJVFaGWDxe5StsdiCd66pu1Y3JU3mW7QEYyEKWn
	BYemhFNGAOXV8TGaljV5M0p+g6/xRHx9CYk2IdPR8BXOSt2MbIRbGJiflUjAH9/ljgfW0b/rQdDpw
	HJrNkxs99iMKZ9hUCmIcb+4s25E0UNtuwrjx3x5lxU7dlIxA8jrtjfmTgTvcHi5L4t2WHLQ6de0AB
	6cRJL0pkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9Y1-00FWIf-Ki; Mon, 08 Mar 2021 06:39:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9QI-00FV0x-B2
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jQVVYm9xDa4Kj5RbvXjgg6ArXkkqi7Oqj8EzHKawVGo=; b=HmaJlDdDxa3+SsBnrKLWtXkvAK
 r0AGhilUgPzyBPVgAjQRARqUqxHgDtXx8kvAaWICdOg+KGA4Byc6EBzkDu7qmAUyROGzMQ8hSKNCB
 OVNtJSQK4lNFxavyOEldlGLfM4z3cn7F8mqQXsmXXeIC47IthAoVsGN9/ILM5QOja9tMpdBpAgHPJ
 FcA90cpyl+sNy0jl1qFpDVZs0G07bMV3sYIkP0fBvBOwhC9SV3wqbjN6xY0VLjOVal30APmbbaOVq
 NWrJainXosJmGWOQCt+Xif5Vx+Ilh0P0fqErGYadYJnWgUJw+Vx1eQQcbL45R0x+2tZCpBdcIun6v
 6sjP1ndQ==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Pf-00F8AW-Md
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:31:09 +0000
IronPort-SDR: 9iVEfAJibbZUKhBI+oiWRW7HrVnliOk0qoWimgT02GYpb8PlUP2teZCH15r7wUOnjrgebCxB9D
 nmEgygJ4ThkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084529"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:34 -0800
IronPort-SDR: Z+T8H/+nt6auK0aiH5DmMiNNG5QJqF/6TBXwMiiTcPDEghr1OO/lrpFSWg7ozgEpJ4lR6q7SiT
 bv7qzC2pGVNw==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409182028"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:31 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Subject: [RFC PATCH 09/10 v2] MAINTAINERS: add Intel i915 spi driver entry
Date: Mon,  8 Mar 2021 08:27:47 +0200
Message-Id: <20210308062748.208017-10-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_063053_960153_073DA40E 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

Add entry for Intel i915 spi driver.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
V2:
1. New in the series.

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 23f3c02493a8..dfe46844bbef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8992,6 +8992,17 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/intel-hid.c
 
+INTEL I915 SPI DRIVER
+M:	Tomas Winkler <tomas.winkler@intel.com>
+L:	intel-gfx@lists.freedesktop.org
+S:	Supported
+W:	https://01.org/linuxgraphics/
+Q:	http://patchwork.freedesktop.org/project/intel-gfx/
+B:	https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
+C:	irc://chat.freenode.net/intel-gfx
+T:	git git://anongit.freedesktop.org/drm-intel
+F:	drivers/gpu/drm/i915/spi/*
+
 INTEL I/OAT DMA DRIVER
 M:	Dave Jiang <dave.jiang@intel.com>
 R:	Dan Williams <dan.j.williams@intel.com>
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
