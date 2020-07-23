Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00126C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 06:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9ADF206C1
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 06:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MHvBb2Ru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9ADF206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aRVbGq7N2Dljp390GyPceCzGtY6DKLKKYv3LzIkwnuI=; b=MHvBb2Ru6om4F9ZPKLBZKrNTX
	9XpTglEn3XSF8TUEgikAHK48Sk/H3hI06/069+7FoCLEcGdtR170R0yWwpgl5cPUSOyaAFrQWm/K+
	d6zAiNYgoEY3EyfaiHqSQhEHtH+VJ2MwVG0QODLTX1si9tfJH0nUWB/3qHt5T8vthkY4snfzlxArc
	M55NIN7zsC8ZUjT336UFXSeSrNwIG8u8dY9wREpIkmBlTPAJyLOhPSHn3Si2QSePWjHb2nzj5g8AP
	zw+UktRlg5gEfriK7pnlANINbqzRo0uiOdRKPzQ1aZh9mm5/VwtDBHfpA5ZHgbX6qCyr2J09NfY7l
	LAcCb7brg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyUdA-00057S-GC; Thu, 23 Jul 2020 06:23:00 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyUd8-00056i-6Y
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 06:22:59 +0000
IronPort-SDR: 0dWaBopUqaJBWEKaT+pz7ay01OOIIBuZux87bF5Tem9XOv/mpU4xBHoic4t/5onOf9aYXnnDao
 YNaXAyrdtBmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="147965393"
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; d="scan'208";a="147965393"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 23:22:56 -0700
IronPort-SDR: +qBj/sN4MZPxY4m7ng2TpFYlzzbCueatcNMUHjax+5NgP4EWq9ePx1xDHyQ5suWmKcEKgGGEce
 hBvcKx79NNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; d="scan'208";a="392904286"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 22 Jul 2020 23:22:53 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 23 Jul 2020 09:22:52 +0300
Date: Thu, 23 Jul 2020 09:22:52 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Simulate WRDI command
Message-ID: <20200723062252.GR5180@lahna.fi.intel.com>
References: <282e1305-fd08-e446-1a22-eb4dff78cfb4@nokia.com>
 <b5c17892-24ec-a690-96ca-d2238b8925d1@microchip.com>
 <20200722143604.GQ5180@lahna.fi.intel.com>
 <99e3f6c7-e9a6-584c-883a-0882f5137b7b@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99e3f6c7-e9a6-584c-883a-0882f5137b7b@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_022258_380791_698C2056 
X-CRM114-Status: GOOD (  22.65  )
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
Cc: ibr@ilbers.de, linux-mtd@lists.infradead.org, alexander.sverdlin@nokia.com,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2020 at 03:18:50PM +0000, Tudor.Ambarus@microchip.com wrote:
> On 7/22/20 5:36 PM, Mika Westerberg wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi,
> > 
> > On Wed, Jul 22, 2020 at 02:28:30PM +0000, Tudor.Ambarus@microchip.com wrote:
> >> + Mika
> >>
> >> Hi, Mika,
> >>
> >> Would you please review the patch from below?
> > 
> > Sure, there is minor comment below.
> > 
> >>
> >> Thanks!
> >>
> >> On 7/22/20 5:01 PM, Alexander Sverdlin wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> >>>
> >>> After spi_nor_write_disable() return code checks were introduced in the
> >>> spi-nor front end intel-spi backend stopped to work because WRDI was never
> >>> supported and always failed.
> >>>
> >>> Just pretend it was sucessful and ignore the command itself. HW sequencer
> >>> shall do the right thing automatically, while with SW sequencer we cannot
> >>> do it anyway, because the only tool we had was preopcode and it makes no
> >>> sense for WRDI.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: bce679e5ae3a ("mtd: spi-nor: Check for errors after each Register Operation")
> >>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> >>> ---
> >>>  drivers/mtd/spi-nor/controllers/intel-spi.c | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> >>> index 61d2a0a..134b356 100644
> >>> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> >>> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> >>> @@ -612,6 +612,14 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
> >>>                 return 0;
> >>>         }
> >>>
> >>> +       /*
> >>> +        * We hope that HW sequencer will do the right thing automatically and
> >>> +        * with the SW seuencer we cannot use preopcode any way, so just ignore
> >                            ^^^^^^^^
> > Typo, should be sequencer.
> > 
> > Otherwise looks good to me.
> > 
> 
> It looks good to me too. Should I add your R-b tag when applying?
> I can fix the typo.

Sure. Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
