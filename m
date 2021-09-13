Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9FCC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:07:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B916101C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2B916101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uujYJiv+Uqd3FtWaNgdPUzxWYSGWEYUIHor9Z22XnLc=; b=Sk3pskdbI/xzn5
	rKP1mpgJlhZSAWMoGjX0iLjc2+kLzWR8Ez5DdxGzSFGmTlG3JubNOZY54dnk/hXMmWtzzWhCjMTLh
	1vM7Lz8M1clMQy3QAviQP+4Tgbh6I9YtC6fBPNz46Dyc733/gsHCd/JpGi7Kvz2/VeYwGLXJVuLvi
	VzewLrUW66eGki4bPGIi/+3FSGhj1ayFOy8yb4d7Angb32I7DUoBTnUO6G7gQRG8YEIqa0PTGDf+D
	T77MXXNEE8z/Nw24ppctoAiJft4GryynncEoSTEI+Gq+Nf3Y3OWsNF7xOHZ1mjeHLKKmD6qs9hKJj
	jGr1IeRK+mZTIlCuNGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPir9-001Crb-Ej; Mon, 13 Sep 2021 10:06:31 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPir5-001CqH-Sw
 for linux-mtd@lists.infradead.org; Mon, 13 Sep 2021 10:06:29 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="208732530"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="208732530"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:06:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="650302844"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:06:03 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 13 Sep 2021 13:06:00 +0300
Date: Mon, 13 Sep 2021 13:06:00 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mauro Lima <mauro.lima@eclypsium.com>
Cc: linux-mtd@lists.infradead.org, daniel.gutson@eclypsium.com,
 richard@hughsie.com, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH 4/4] mtd: intel-spi: add read only stubs
Message-ID: <YT8iiCHFvhb1AEhp@lahna>
References: <20210910211348.642103-1-mauro.lima@eclypsium.com>
 <20210910211348.642103-5-mauro.lima@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910211348.642103-5-mauro.lima@eclypsium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_030628_348296_953CB203 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, Sep 10, 2021 at 06:13:48PM -0300, Mauro Lima wrote:
> Add read only stub functions (as __weak) in read only mode,
> so they can be override on read-write mode.
> Remove the (DANGEROUS) tag in read only mode.
> Add write mode option if pci or platform driver is selected.
> Change the intel-spi recepie to be able to build read only
> or read-write mode.

This looks pretty convoluted way to get rid of the "DANGEROUS" in the
name ;-)

What is the firmware information fwupd is looking for? Perhaps there are
other, better, ways to do this?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
