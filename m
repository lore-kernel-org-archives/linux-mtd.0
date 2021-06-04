Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E43C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 14:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6DA60FE7
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 14:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6DA60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+R08Ia/+6+eKqYBrQm0z666z+7qmUVy3XHiV8uzOh2Q=; b=4t0oyqh+LTC+Sp
	bDg/VS2RhoTBh1RYc0nHMSY3Qqwk4WM08Lw3VQMvVQl3w0FW8SSuQxilmGFcTSb5iPTuhPGx7EKSA
	vDGGUtO+GJuj5ni8VKKaJFHxtIU2O8lsRaOJPobWwmGozJJpK69ejYS9HT/9/xV6qoGPdEV9TwBE/
	moJCjkpH5Oet716T0w8ukvibM3+f6qZduIakTFKSTlwVgr0RwINQW4s0sa4CRhcyWAD5+V069NKEU
	SK0KF+h9YOWwDeJ2guocIRuzW6hxS/himOz9WSt7P6K9vNj7HgssgAWUeQUvVX8cmG+G925Mh4r7x
	cSEkzwzidYTgGsTPweKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpAXb-00DsxG-KX; Fri, 04 Jun 2021 14:11:15 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpAWs-00DsgW-O1
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 14:10:33 +0000
IronPort-SDR: /vPY309BpfZ+I2dDwXlWSlxsU3J7a6W9WPkBjD2alItf4IUVjCkjtqzwvaKAI6beUS+hvK2knX
 fvEHsp0Edqww==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="184665397"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="184665397"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 07:10:29 -0700
IronPort-SDR: I2P87V9me+RbSA6Ezc7S0FNIuY6KdQiDcO8+cqbm76s1dY6w1I/ZzMWG2KsmCzIdOTx6Gjuac6
 cG3ng19ZLwzQ==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="483923072"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 07:10:25 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 04 Jun 2021 17:10:22 +0300
Date: Fri, 4 Jun 2021 17:10:22 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
Message-ID: <YLo0TrtBVEEfXrXH@lahna.fi.intel.com>
References: <20210525191414.dc45h27rzqen4dce@ti.com>
 <20210526091250.GY291593@lahna.fi.intel.com>
 <20210526092417.GA291593@lahna.fi.intel.com>
 <e82f44552d0d4284fc5ed22ee0bee85a@walle.cc>
 <20210526102810.GB291593@lahna.fi.intel.com>
 <YLTILUh+bPhZ4ToR@lahna.fi.intel.com>
 <YLi3/DRqGzdlosNf@lahna.fi.intel.com>
 <20210603180843.hjzynysgby3d3e5r@ti.com>
 <YLoOSMxeGXP07Tfw@lahna.fi.intel.com>
 <20210604115339.GC4045@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604115339.GC4045@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_071030_841233_C62A2F1C 
X-CRM114-Status: GOOD (  16.98  )
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

On Fri, Jun 04, 2021 at 12:53:39PM +0100, Mark Brown wrote:
> On Fri, Jun 04, 2021 at 02:28:08PM +0300, Mika Westerberg wrote:
> 
> > Yes, exactly. With ACPI/DT the SPI core handles this after the SPI
> > master device is registered and that would result spi_nor_probe() to be
> > called for the children. However, with this one there is no ACPI node
> > for the controller (it is PCI enumerated) so there would need to be some
> > way to create that child device. In the old days that would be "platform
> > data" but that's pretty much frowned upon these days ;-)
> 
> No, that's totally fine and normal - it's just like probing a MFD, we do
> it all the time for child devices.

Okay, thanks! Then I think I have all the questions answered and can try
to convert the driver over the "SPI MEM" framework.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
