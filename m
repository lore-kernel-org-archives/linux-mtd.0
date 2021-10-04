Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AF0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63023611C1
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63023611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXyNKoRjAEheMp5LKkAVUkzkLHGSd1UkUqKLchwSnWs=; b=XlYaeQiJxPSm9o
	g4Vz64BVCOOeiKgdndRUO0BZWw9l3G5AcaF5IZXl/8VZZ/8hTN5HuF46k43wOgJv/ZdKFybLRnYgv
	u1J3BOl70seQNJYGWnZ1k1Vdtc1in7o+2xggyQnjdQ/xU+Tn5hA9zX1HCplFRBQszx99l31ax5EBv
	A2WjQiJgu3ulIj+QNEYIdWPKSytq+LQPPcZ1cgvj4iqFf9YzGYXahaCAXOrXBC7Wo2nYAE2VNIwn4
	eBOuuV5vf2HcrSumFQIHKNPccqAeb3nodwPEOXPr+0goUcG80yd+RSI66xDadYfCrqQ3115GYGlpH
	is/jRFZ9sNWd5aZhWVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXGN1-0058cv-JU; Mon, 04 Oct 2021 05:18:35 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXGMy-0058cK-7S
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 05:18:33 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="311487254"
X-IronPort-AV: E=Sophos;i="5.85,344,1624345200"; d="scan'208";a="311487254"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2021 22:18:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,344,1624345200"; d="scan'208";a="621568046"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2021 22:18:06 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 04 Oct 2021 08:18:04 +0300
Date: Mon, 4 Oct 2021 08:18:04 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mauro Lima <mauro.lima@eclypsium.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: spi-nor: intel-spi: Disable write protection
 only if asked
Message-ID: <YVqOjF/xjqFV+Dl3@lahna>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-2-mika.westerberg@linux.intel.com>
 <CAArk9MPWh4f1E=ecKBHy8PFzvU_y_ROgDyUU_O3ZQ0FuMhkj5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAArk9MPWh4f1E=ecKBHy8PFzvU_y_ROgDyUU_O3ZQ0FuMhkj5Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_221832_306449_1DE6EB52 
X-CRM114-Status: GOOD (  10.69  )
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

On Fri, Oct 01, 2021 at 05:23:23PM -0300, Mauro Lima wrote:
> Question for maintainers: With these changes is it safe to remove the
> *(DANGEROUS)* tag from menuconfig?

I don't think we want to remove that. This driver is not for regular
users, at least in its current form.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
