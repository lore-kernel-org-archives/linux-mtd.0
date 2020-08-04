Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14128C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 14:09:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4102075F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 14:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uqhxw/44"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD4102075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aEkMKHpAQWdIC/iIvPi8nu4TTtYP/ZqsGDoVzr6jP9E=; b=Uqhxw/4435IhYNORX/OTHuoNn
	x5frjmxx5thHhugQwUvh5pS8HnxQqiuEN/VvPoA3XPMM6r3XoSVC2mW3S1AsjegVEsWFMpwMXB+Qs
	m38mNdjrDKUqp85F1fCoGtOWHNhAEzlebr0Sp7hv1KWVC4rb3FW3ZQuxES/PNtv5BusexN0QoB+5W
	WB6qcPz5AMqH2RQNwC1ceoOgKCislEDY//FOtDcNmmuXar/aWVnf0f5elJ5z7qXAZy/ZNRWR5G/Al
	08i/1TObN+sxFTXA7Qf9l9H9fwZ6KtD8mk+ughIJ4nP2ik81Eug3pD8D9aCOZoqwxGFNZtGoFbedb
	L5CydROsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2xcb-0002OD-3e; Tue, 04 Aug 2020 14:08:53 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2xcX-0002MX-N2
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 14:08:50 +0000
IronPort-SDR: Uk9d4kshcfDmeMFrznIDkqmXJjGFWP2hD0LHw1mJKYE3n+ZOXEg6ljyH3I7d1c7ySPTYP4A7iJ
 b0QY54idn2QA==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="150106107"
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="150106107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 07:08:40 -0700
IronPort-SDR: jpVdsLPzPtpjw2/cTI6dzHctykOsudeBCyXp9XKBMoS4rFelUd68/jIuqJ52axOOw5S+7ClqQx
 Cmd23apcxHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="396582659"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 04 Aug 2020 07:08:35 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 04 Aug 2020 17:08:34 +0300
Date: Tue, 4 Aug 2020 17:08:34 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daniel Gutson <daniel.gutson@eclypsium.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI
 flash chip writable
Message-ID: <20200804140834.GR1375436@lahna.fi.intel.com>
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_100849_888080_40D53B11 
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2020 at 10:58:17AM -0300, Daniel Gutson wrote:
> Currently, the intel-spi-pci driver tries to unconditionally set
> the SPI chip writeable. After discussing in the LKML, the original
> author decided that it was better  to remove the attempt.
> 
> Context, the intel-spi has a module argument that controls
> whether the driver attempts to turn the SPI flash chip writeable.
> The default value is FALSE (don't try to make it writeable).
> However, this flag applies only for a number of devices, coming from the
> platform driver, whereas the devices detected through the PCI driver
> (intel-spi-pci) are not subject to this check since the configuration
> takes place in intel-spi-pci which doesn't have an argument.
> 
> This patch removes the code that attempts to turn the SPI chip writeable.
> 
> Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
