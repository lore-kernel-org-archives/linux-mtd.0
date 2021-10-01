Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A7EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 19:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA0D61A58
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 19:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DA0D61A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBCBV0CvIbed0OfIGJGFjSEYHPIE6+DYr3CYau488oA=; b=0NHN/kXxvTjjU4
	q2SGE4sPaJdJffAZBVkZyATSxe4XV97Uzm/VPiEe1oRVnKbQLA7O6Qy2FkP/h0XSSdM6ak0bDXOtr
	MDVPkRfNuD7FbCMrU0zVFWACdcDJOMLF8U/j7x1TNcvHCEa6HkVL8Q/nIvb7BwQvTRiwJMICHP6u/
	uVEwq5jSas6VinmKHTfiBtPuVl059zGfg4awjpw/Fzejq1G3eeDyOOZPF2O2Z7qYdIzvZG9eJ/Dy2
	w90g0Cn6ybEAwQ7g9hL5N75698W0O7z7od8V2Q3G/X2wMLwM4lgjsi8P+TYpYIV70CGTRLQkrlzYN
	PMfPHb72xNrAW/CGnacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWOKl-001BlI-AT; Fri, 01 Oct 2021 19:36:39 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWOKi-001Biz-W8
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 19:36:38 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="311100668"
X-IronPort-AV: E=Sophos;i="5.85,340,1624345200"; d="scan'208";a="311100668"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 12:36:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,340,1624345200"; d="scan'208";a="708908639"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 12:36:14 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mWOKJ-007WjZ-IO; Fri, 01 Oct 2021 22:36:11 +0300
Date: Fri, 1 Oct 2021 22:36:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: spi-nor: intel-spi: Add support for Intel
 Ice Lake-N SPI serial flash
Message-ID: <YVdjKzD/SeNkfT5d@smile.fi.intel.com>
References: <20211001171530.15283-1-andriy.shevchenko@linux.intel.com>
 <0D47CDDE-0F9E-4D5D-8524-1D911BF52CEF@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0D47CDDE-0F9E-4D5D-8524-1D911BF52CEF@walle.cc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_123637_103875_FC5A338E 
X-CRM114-Status: GOOD (  12.35  )
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

On Fri, Oct 01, 2021 at 07:21:08PM +0200, Michael Walle wrote:
> Am 1. Oktober 2021 19:15:30 MESZ schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> >Intel Ice Lake-N has the same SPI serial flash controller as Ice Lake-LP.
> >Add Ice Lake-N PCI ID to the driver list of supported devices.
> >
> >The device can be found on MacBookPro16,2 [1].
> >
> >[1]: https://linux-hardware.org/?probe=f1c5cf0c43
> >
> >Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Hi Andy, 
> 
> there is currently a rewrite of this driver (to use spi-mem)
> in progress:
> 
> https://lore.kernel.org/linux-mtd/20210930100719.2176-1-mika.westerberg@linux.intel.com/
> 
> Could you try that series with your hardware? 

It's not mine - can't test myself. I'm helping to enable Linux on it.
But okay, I postpone this till the reworked version will be applied.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
