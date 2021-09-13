Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3CBC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 884E960EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 884E960EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwQWUc/pU5ixplYG+lAUCQ3KlXs01L9VMCAfZViqxtE=; b=vTBks8Ym1rg4re
	C33QZWrDi2kxv2WNN/qvnV02/1X5GuDQqyouP0fCo86iK9gn/Jluzeo+krnZSeSSFkqpYHl1TpYEO
	ddCSz3uSqlqDtNq+k7MlRDsq+9QAoTuZ7Ba2frTJuJziqjIeVqSzJD1bB3Yo1biQlguk9dDBDoAYh
	GcETmPQ6IxBEYax7RA04GIAiy6LPpmSAbGyMJxz4TbbVPxpF+I7TXAK3e8U46hfzqdGEzJH+OazcH
	GmiGV3wEuhMYhdqfsPCLR5g/Jb4TALfJVXWO2vFJu9d5ZhjRoaWUBJHCwe0j1+MlOvzgnUJiYe/cF
	CoPx58oXXp02XzCa1ESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPikK-001Apa-Si; Mon, 13 Sep 2021 09:59:28 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPikF-001Anq-WF
 for linux-mtd@lists.infradead.org; Mon, 13 Sep 2021 09:59:25 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="201134976"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="201134976"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 02:59:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="507149927"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 02:59:13 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 13 Sep 2021 12:59:09 +0300
Date: Mon, 13 Sep 2021 12:59:09 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mauro Lima <mauro.lima@eclypsium.com>
Cc: linux-mtd@lists.infradead.org, daniel.gutson@eclypsium.com,
 richard@hughsie.com, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH 0/4] mtd: intel-spi: split read/write modes
Message-ID: <YT8g7Xm38cP4Todu@lahna>
References: <20210910211348.642103-1-mauro.lima@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910211348.642103-1-mauro.lima@eclypsium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_025924_125909_C0220013 
X-CRM114-Status: GOOD (  10.05  )
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

Hi,

On Fri, Sep 10, 2021 at 06:13:44PM -0300, Mauro Lima wrote:
> The purpose of the following patchset is to split read/write
> functionality from the Intel PCH/PCU SPI flash driver.
> Being able to use the driver in read-only mode (harmless), the users
> can get important firmware information from userspace which also
> includes being able to perform firmware attestation to verify
> integrity.

The SPI-NOR maintainers wanted that the driver converted first to use
"SPI MEM" framework before any new features can be added. I'm currently
working on that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
