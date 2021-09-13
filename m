Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2301BC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E45E66101C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E45E66101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lLO4RZfPg0mTUZdA48TyraTG0UXHr2+7raLdHYK50Q=; b=xQnIxxtw/NBO+c
	MsGbiuBkRYgSAldnmw9c6i++aAfVA4MgQfj8Guwnkn5p7bFfwYc2GIgiOcLj9NRPFY5YxLVN6HS0Y
	XKaDedo9BaDXDWvaQBLWmPU9VbjFRsKcWyTM1MAc8lHaiAE+MRgqrsER5rcwV0TR1LhkRe8uYY6xb
	tK/jBClqaYzbhPW/kXSO1Cw6YLF63pFKxvToOOG4U9yDuhD65qObjmeQ/KDE+aNdleCGCG0p3TwOr
	MeaBN9lOiSF58iwr+bHSgiFZ3oCyhJ1kIUChOvNQLkTTQPozoSMSLQoK1yGeAkpb5NJjz/sHHcIsZ
	M6oDBlqlo6FQhEagufpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPilz-001BN1-93; Mon, 13 Sep 2021 10:01:11 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPilv-001BLg-AR
 for linux-mtd@lists.infradead.org; Mon, 13 Sep 2021 10:01:08 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="243945641"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="243945641"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:01:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="650301093"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:01:02 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 13 Sep 2021 13:00:59 +0300
Date: Mon, 13 Sep 2021 13:00:59 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mauro Lima <mauro.lima@eclypsium.com>
Cc: linux-mtd@lists.infradead.org, daniel.gutson@eclypsium.com,
 richard@hughsie.com, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH 1/4] mtd: intel-spi: rename intel-spi to intel-spi-base
Message-ID: <YT8hWweR2NtpVX/R@lahna>
References: <20210910211348.642103-1-mauro.lima@eclypsium.com>
 <20210910211348.642103-2-mauro.lima@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910211348.642103-2-mauro.lima@eclypsium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_030107_461619_31ED60AC 
X-CRM114-Status: UNSURE (   9.46  )
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

On Fri, Sep 10, 2021 at 06:13:45PM -0300, Mauro Lima wrote:
> Rename the files we want to split as base files.
> Include the new files in intel-spi-{pci|platform}.c.
> Change the intel-spi obj Makefile to be built with
> intel-spi-base.

I don't think this brings any benefits over the existing name.
Furthermore if this needs to be done, -core.c would make more sense.
IMHO.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
