Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B127C2BB85
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 11:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FC621D7F
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 11:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E55ZMGyh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FC621D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBMBhyY5eYKecIyueEVHqpe8Yhh3jUcyuidAi7UhrWg=; b=E55ZMGyhHToSIK
	YotQsJQ9rmozKB4YgYflnBOuin0UIX7nnH9BeqJR1h8Y3QHeX+wh82mxEdzPpWlf/WEbpYbuO9uYc
	zEP85+s81uRokQxmJHNyRVjQqnVn23pzjQEenBdiXj6MtUarZWLffmLvwaGpBbfdbDuwQC5MMqieE
	NcpCnM8XrAmlcLJNDn1xxdwP+NnbaO5WRZd8gj6hcGynET/XcA1TCRWs2SsLnnlLKJRCmYl58eiev
	VL2IciK/fKmsnCmINSYVTTDYDxSoP3GvtbjqjcX7DyiJXkhc1EeRDx7J2OAjPQyvMs6N6sq8FdC5m
	bhe3+Yawnu8UImGOeP+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP2lN-0006dM-9P; Thu, 16 Apr 2020 11:32:57 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP2lK-0006cR-SB
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 11:32:56 +0000
IronPort-SDR: FhwhRWlvzk1z2Bqi4XHP2kbFWiEz0EJS3GYueX5BszsU8yAxYMkvyERdTDD41AACGTJpNpwRKJ
 9/UkKuubCx5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 04:32:53 -0700
IronPort-SDR: JLjViU3I/7OhNUNFa14OtK4jxawo6cL4DIbAiuwxDw0aNbt8rAsEQeI/aVasFOrEUV6+diXta5
 ZTj7u56OWrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="454295922"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005.fm.intel.com with ESMTP; 16 Apr 2020 04:32:48 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1jP2lG-00113k-Db; Thu, 16 Apr 2020 14:32:50 +0300
Date: Thu, 16 Apr 2020 14:32:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200416113250.GA185537@smile.fi.intel.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
 <20200416122619.2c481792@collabora.com>
 <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
 <20200416131725.51259573@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416131725.51259573@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_043254_959654_E9B4AA73 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 01:17:25PM +0200, Boris Brezillon wrote:
> On Thu, 16 Apr 2020 18:40:53 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
> > >>> we'll be happy to have one more of the existing driver converted to  
> > >>> ->exec_op() ;-).  
> > >> I have completely adapted to ->exec_op() hook up to replace the legacy
> > >> call-back.  
> > > I suspect porting what you've done to the xway driver shouldn't be too
> > > complicated.  
> > Not ported from xway_nand.c driver , we have developed from the scratch 
> > to make it work on
> > Intel LGM SoC , it's new x86 ATOM based SoC, IP itself completely 
> > different and most of the registers won't match.
> > if we port then it would be ugly and also what are the problem may occur 
> > we do not know.
> 
> Sorry but IMO they look similar enough to try to merge them.

I agree. I tried to convince them internally... but here we are.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
