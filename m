Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E436C47096
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 11:09:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE944613DC
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 11:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE944613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tA8S57TfiD1Hkxvxxgtsl/e8WgBBmr4j+j0nPxImYx4=; b=Nnj2VepwKn1XnB
	9YoWDIoY9cWkYHupeUh8uMaRWFdm/LTw3SMsKVPjjoNwgd0m0LN/I51zgU7x6sZe/TbK4BpOitsWb
	ZvpcJ4iI81vImIre8iOsxMFQF3nLcYRT0Ett07wk3SLLih20l9Bqw5VcvWsdFpg3qxYUedg/Ge8Qs
	hggpMfMbb4EuiGZfPCRB1NZGJ4Z/SxnBT1fbiBuUYAo0kDAIzdNnCUVqMbFk5e4AexFoBm6HILjIr
	y9DEr4vzLtD8boTB472vN07LPITEgC79puxWlBcyXG375SKBh544B5AsZGYLC4cC879Pi3MyppUm5
	k+8fJ8nn/3si6MNEP5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lolCo-008Eks-3S; Thu, 03 Jun 2021 11:08:06 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lolCU-008Egg-Pf
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 11:07:48 +0000
IronPort-SDR: bxteUAHXUUHtZgX9TrUm1k7iZhgTrEcYbEOc+XVYMw5ku75ZMMgK4QMGyu1EVQ+x7Uhw16NV/3
 1q6h4lk9wHeQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="202160470"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="202160470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 04:07:45 -0700
IronPort-SDR: iUkTnAzXxpT1t7N0+xaJ4K8ig8Os3bNBH10tLkwe35qldMnOeHifaOvwqkjs/PElYfl3l5poIw
 iOqct6WEsRVw==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="446251042"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 04:07:42 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 03 Jun 2021 14:07:40 +0300
Date: Thu, 3 Jun 2021 14:07:40 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Pratyush Yadav <p.yadav@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
Message-ID: <YLi3/DRqGzdlosNf@lahna.fi.intel.com>
References: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
 <20210525191414.dc45h27rzqen4dce@ti.com>
 <20210526091250.GY291593@lahna.fi.intel.com>
 <20210526092417.GA291593@lahna.fi.intel.com>
 <e82f44552d0d4284fc5ed22ee0bee85a@walle.cc>
 <20210526102810.GB291593@lahna.fi.intel.com>
 <YLTILUh+bPhZ4ToR@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLTILUh+bPhZ4ToR@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_040746_893269_9C25D7D4 
X-CRM114-Status: GOOD (  33.40  )
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

Hi Tudor,

On Mon, May 31, 2021 at 02:29:59PM +0300, Mika Westerberg wrote:
> Hi guys,
> 
> On Wed, May 26, 2021 at 01:28:16PM +0300, Mika Westerberg wrote:
> > Hi,
> > 
> > On Wed, May 26, 2021 at 11:31:58AM +0200, Michael Walle wrote:
> > > > Oh, I see now this commit:
> > > > 
> > > > a314f6367787 ("mtd: spi-nor: Convert cadence-quadspi to use spi-mem
> > > > framework")
> > > > 
> > > > So "SPI MEM" means generic SPI subsystem for memory mapped devices.
> > > > Unfortunately Intel controller at least is not capable of running
> > > > generic SPI transactions. It only supports accessing SPI-NOR flashes and
> > > > for those there is small set of commands that supports. I don't think it
> > > > is even possible to convert the driver to generic SPI subsystem.
> > > 
> > > AFAIK it stands for SPI memory device (memory mapped is not a requirement).
> > > Eg. spi-nxp-fspi doesn't support generic SPI devices either, but just SPI
> > > flashes. So I'd guess SPI MEM is exactly what you are looking for.
> > 
> > OK, I see that there is ->mem_ops that can be used to implement
> > different higher level commands. What I'm not seeing is that how the
> > child SPI flash is created using this scheme? DeviceTree and ACPI are
> > supported fine but what about scanning? I mean the intel_spi driver has
> > this:
> > 
> >   spi_nor_scan(&ispi->nor, NULL, &hwcaps);
> > 
> > But if the driver is to be moved under drivers/spi/* you can't really
> > call these functions anymore or can you? Or the point is to keep the
> > driver under controllers/ and just call spi_nor_scan(), and in addition
> > implement the new mem_ops?
> > 
> > Thanks in advance and sorry about many questions but there does not seem
> > to be a conversion guide nor any (non-DT/ACPI) examples that I can take
> > a look. :-)
> 
> Can you provide some guidance here? So in order to use the generic SPI
> subsystem with "SPI MEM" parts of it, I would need to be able to create
> the child SPI-NOR flash device without using ACPI or DT (as these
> systems do not have any ACPI/DT description), or use spi_nor_scan() but
> none of the driver under drivers/spi are calling it.

As the main SPI-NOR maintainer, what's your take on this?

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
