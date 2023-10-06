Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7E0E81E07
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:From:Date:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A73UqJwWFBzpfxStoQJkW1peycMJaU+D2KSvs18EXMs=; b=ax/0XyjQ40v/aG
	MxISfd0qKOs4HvEQ54bd19l8oiEfn2A6C/18BhBiHHh+SbxOuUmeuy1N8ac1tCc3S6PLFHde21HeF
	Jm6w1fAtXsfJavoNpv2ws11bLt1GnmtU+Wc/TC2DduKWpNcU6IsU2qmBIsIuuEHERO54fWiSCnMmJ
	9zfHAxU+R/9vpwXmtjvP+fnkK3RniPLGnilPqo/A1uXrI/bnS1FOw7dB9do00ssitfcgbB5rT11aQ
	3S52o8Z5HrM4RaGsISJ6tCu91v6/VDLARghnd9aFsP76G7OJ279hAylo/3X/k1uUyDaPVesSMMFZs
	Q4PinihN9iZ4aFGCkyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qomXE-0064CO-0T;
	Fri, 06 Oct 2023 15:14:36 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qomXB-0064Bf-1k
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 15:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696605273; x=1728141273;
  h=date:from:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=huPc4rVdST50Hrp24BOOy+5pYnjFSHRfnqsmLwx8krY=;
  b=ErEp6/8V8zs6UBMz0dLReUWLY+Dj+hryqaCG81dGC4XvVD7X2Ngq/NoE
   QU9IffrhoHdFbIwfCe97Mt4J8vbTwT9gdbl6fXQIh8SyIlwR+e4I8qwTO
   Coa9ctpNU5jgh0bQCiYk2gcvdg36zmgRMHB/mWpkRGygI3VEqU2PZWXl/
   13PgfSBNg+nKEH/eHniYjDtyg29OeSW7hOnt+CEPIbS/DSodk4HrhkBC9
   LVqsxlHuJBd+j8VLGHnT/zSzcMQwUKtdjyKGy7L3ISjLlgaDhk4gGbna/
   yV+Lj2vMw0BWblnT8/wCEpoS9Xo9jEy/dWt21f/di1gjBnf5b/YnlgjrD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386594522"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="386594522"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 08:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842857824"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="842857824"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 08:14:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qomX2-00000003LUj-3wVc;
	Fri, 06 Oct 2023 18:14:24 +0300
Date: Fri, 6 Oct 2023 18:14:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: rawnand: Remove unused of_gpio.h inclusion
Message-ID: <ZSAkUMnXw4SbS2pC@smile.fi.intel.com>
References: <20230615164210.25515-1-andriy.shevchenko@linux.intel.com>
 <CAFBinCAJ5m+NTVry56=0AYMYr9xiM9KS7F837Hqb=ptOG_u54g@mail.gmail.com>
 <ZKvW0yzxU1ktDALd@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZKvW0yzxU1ktDALd@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_081433_729290_05480F93 
X-CRM114-Status: GOOD (  14.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

K0NjOiBHUElPIG1haW50YWluZXJzCgpPbiBNb24sIEp1bCAxMCwgMjAyMyBhdCAwMTowMDo1MVBN
ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQg
MTI6MTA6NTJBTSArMDIwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+IE9uIFRodSwg
SnVuIDE1LCAyMDIzIGF0IDY6NDLigK9QTSBBbmR5IFNoZXZjaGVua28KPiA+IDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgb2ZfZ3Bpby5o
IGlzIG5vdCBhbmQgc2hvdWxkbid0IGJlIHVzZWQgaW4gdGhlIGRyaXZlcnMuIFJlbW92ZSBpdC4K
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gPiBBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8
bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiAKPiBUaGFuayB5b3UhCj4gCj4g
Q2FuIGl0IGJlIGFwcGxpZWQgbm93PwoKU28sIHRoaXMgaXMgc3RpbGwgbm90IGFwcGxpZWQsIGRv
ZXMgaXQgbWVhbiB3ZSBuZWVkIHRvIGdvIHZpYSBHUElPIHRyZWUKd2l0aCBpdD8KCi0tIApXaXRo
IEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
