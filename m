Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E07EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jul 2023 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5YBpFKaAx+bAz1ib+buLJCNwttDI32Pex8YKy78KAg=; b=fu0imTQAFeMhf5
	Jr+7w1zVYSqJuwUsajIVo5OT5++35wEuVm72BBomRix8IDXrcKoyfnmNIaVVF+Vxd/2X/o1q04VmJ
	7xW2m3QHcwUVllNd9H3YSd4XAFQN+tP4J4A99CkmOhZzhh0iY1G1DFYbxNk7xg/j6/L1VluOIkBUD
	F5D3PukW47Pw9iLTobpcV+O91CcnkZcuXxD2SyIfyoZUUMmNqadEtmAJkkNj25S2/zUwZ9D9E4jn6
	6SLRWtNrcwaDid3emWa/+jpy0HXM5znVc5RpI08P024+2Tcawhxi2yJ+19WM7sltkWZksaYLlZ7lL
	KFQ84E4OVnSQ/NAkbjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInhU-00B9M3-0c;
	Mon, 10 Jul 2023 10:01:00 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInhQ-00B9JI-31
	for linux-mtd@lists.infradead.org;
	Mon, 10 Jul 2023 10:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688983256; x=1720519256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=luSbHsx5d1FecnumIWJGPoVnuKwT7pnZ0idb4x+0LEI=;
  b=adCOxY1/5NHwymzqlCT415B9a3twbKTQsTbsKPd1jjC+HsAd17SjH2wj
   2UKispnfj1rDk6jdtCtwmpPf1vyuo/FbGpyGnZh/r3HhVCeUr7UOZZhAp
   QDicVIMzDmiz3aHgBFHUxDa3Z/wM8CqH0JEagq04UnCvADWcSkkOq9+O6
   XvHfQvHN66AVI57QrHZzNHjmX0KDbxbfal6pNX7w8fPI7vX/zK8e1g5h+
   BU/Nx53SNXB32IkqAQG6xO3PAC0VP37SszOUXbb7CftJwnuTfyu+kv5P5
   Xxn1LC2paVAhK9Syqwq67UCyRgt5wpGXdzuwOjF/0jJz+XbIBHuAVAD21
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="363169644"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="363169644"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 03:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="790736520"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="790736520"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 03:00:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qInhL-001WM3-2h;
	Mon, 10 Jul 2023 13:00:51 +0300
Date: Mon, 10 Jul 2023 13:00:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: rawnand: Remove unused of_gpio.h inclusion
Message-ID: <ZKvW0yzxU1ktDALd@smile.fi.intel.com>
References: <20230615164210.25515-1-andriy.shevchenko@linux.intel.com>
 <CAFBinCAJ5m+NTVry56=0AYMYr9xiM9KS7F837Hqb=ptOG_u54g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAJ5m+NTVry56=0AYMYr9xiM9KS7F837Hqb=ptOG_u54g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_030057_020751_BC18266D 
X-CRM114-Status: GOOD (  11.79  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTI6MTA6NTJBTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBUaHUsIEp1biAxNSwgMjAyMyBhdCA2OjQy4oCvUE0gQW5keSBTaGV2
Y2hlbmtvCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gVGhlIG9mX2dwaW8uaCBpcyBub3QgYW5kIHNob3VsZG4ndCBiZSB1c2VkIGluIHRoZSBkcml2
ZXJzLiBSZW1vdmUgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gQWNrZWQtYnk6IE1hcnRpbiBCbHVt
ZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpUaGFuayB5b3Uh
CgpDYW4gaXQgYmUgYXBwbGllZCBub3c/CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hl
dmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
