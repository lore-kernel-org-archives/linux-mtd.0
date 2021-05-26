Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867B4C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:17:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D50A613C0
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D50A613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oq/znCbt3WIQ1UxRGMQBVpf4fBinnzQ2VDQq/UatxqU=; b=seccntWmqpGDBZ
	+ugWjN/+2XZno6E9ec6QbbrK4p2Myl2yk8BvAlOL1HBXfFVwpDLASUjVQe3AcRqfeq3y9BDGDj6M2
	A6co6RsTu2pszFlf8Aozqa1wz5Hdga9ECjSpB0FGhqBvT0YZn7gSu+fiXZ2tb9LcliMRPZXPANo7p
	iUiy35VQJ5VQMCSujkhOY7qQuXANietQYh1PAvB+immOPqpYb6TFs8KvyqlojFEqCI2ZCRG21WN9D
	WCDZud6GvRxeCYUduCE2arLByZWjXvnjyLtM5GGKC+pfZ/eASTt+BWcRg0LMCOOgm6/LV5DGUiwzx
	liaxNoF2SsMUbH/fRSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llrWo-00DTo8-Bu; Wed, 26 May 2021 11:16:46 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpm5-00CqgB-6H
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:24:26 +0000
IronPort-SDR: Za/tKhgVVgsTvNifMSdwy5//sCHMPECb+nrmWA/603n3kcYxbVRfqrBJQrwLjPFiss5jlkFbSW
 oHZp46Qsimqw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182750030"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="182750030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 02:24:22 -0700
IronPort-SDR: yERV+GRQ1APL7OYrp+LYBQ0c+3zAOwxQtuXZq0ueh8r5BxLI5LZLtBv4sQhqMaVAXhXVpRT6/2
 7tGDfWniQ56Q==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="397742585"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 02:24:19 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 26 May 2021 12:24:17 +0300
Date: Wed, 26 May 2021 12:24:17 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
Message-ID: <20210526092417.GA291593@lahna.fi.intel.com>
References: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
 <20210525191414.dc45h27rzqen4dce@ti.com>
 <20210526091250.GY291593@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526091250.GY291593@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_022425_293687_DEA6030D 
X-CRM114-Status: GOOD (  31.13  )
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

On Wed, May 26, 2021 at 12:12:56PM +0300, Mika Westerberg wrote:
> Hi,
> 
> On Wed, May 26, 2021 at 12:44:16AM +0530, Pratyush Yadav wrote:
> > Hi,
> > 
> > On 25/05/21 07:03PM, Mika Westerberg wrote:
> > > Intel SPI flash controller has been supporting two chip selects long
> > > time already even if the most common configuration is to have single
> > > flash chip for the BIOS and related data. This adds support for the
> > > second chip select if we find out that there are two flash components
> > > (this information is available in the mandatory flash descriptor on the
> > > first chip). The second chip is exposed as is without any partition
> > > information with name "chip1". The first chip continues work as is.
> > > 
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > >  drivers/mtd/spi-nor/controllers/intel-spi.c | 208 ++++++++++++++------
> > 
> > Aren't the drivers in controllers/ supposed to move to use SPI MEM? I 
> > don't know if this has been discussed before, but I would like all 
> > drivers in controllers/ to move to SPI MEM API at some point in the 
> > future. This would let us drop support for this "legacy" controller API 
> > from SPI NOR, cleaning up the core quite a bit. No more if (nor->spimem) 
> > needed anywhere.
> 
> What is SPI MEM? :) Looking at the mainline v5.13-rc3 controllers/ there
> is no single driver "converted" to SPI MEM, at least from a quick
> clance.
> 
> > I wonder what other folks think about this. I vote for freezing all new 
> > features in controllers/. If you want something new, move to SPI MEM.
> 
> I think at this point it is not reasonable to expect that all controller
> drivers move to your new framework that has not even landed the
> mainline ;-) Or did I miss something?

Oh, I see now this commit:

a314f6367787 ("mtd: spi-nor: Convert cadence-quadspi to use spi-mem framework")

So "SPI MEM" means generic SPI subsystem for memory mapped devices.
Unfortunately Intel controller at least is not capable of running
generic SPI transactions. It only supports accessing SPI-NOR flashes and
for those there is small set of commands that supports. I don't think it
is even possible to convert the driver to generic SPI subsystem.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
