Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092ABC2BA2B
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 06:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE01D206E9
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 06:02:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cmETKYbP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE01D206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q+2tc4a3Yqg+fBYbFOWINN6426uowyekIfoPPQoIClI=; b=cmETKYbPmVVNF8bP62TOhMwN6
	WDDX7cIXt7ZOIOBv+WXzGq2iglIQexCTtfySdJmWhvwCrQZEAyiQsWPk5d945Jq+onGk8d0cqa0/K
	L5Y06P6zTLLBKDF0WPAf/+F7jHdtYpdYKGXdzfjHxdBUO0MaUwPdIyU3hmSkGDCO2EUFNRqusJIpy
	swkIMMxFmsL42duxpNXmolf+PYDn3SB9w6alPwEC8iX5ADDXavy6vcfSNTNVzwFyfmGA4yOyml6U/
	RO3u2sbTB3mkrymmNV4tsm0gZzHvBSZ9XcYs8ZbzFF+GWXkgz69SMHealuqOScBN7BnxR1l/wZShs
	GwG/0JK4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOb7f-0007kQ-NC; Wed, 15 Apr 2020 06:02:07 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOb7c-0007jx-Lr
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 06:02:06 +0000
IronPort-SDR: pL4jskSHQ7wPxTbbuw6UxaB/xBOQjWcN6gC8MxYkmRiPFC9QwyO95BhqnmC3yKhjfBjSaOCpNS
 /L0FhqSGaklA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 23:02:03 -0700
IronPort-SDR: XI465BG+7j67qXFLT9dIcHvFNQBQDHurw6IfghYezG/NpWEdYCVIsNDT2k6ZC1QusTyPJdtTbR
 h6Ep06sJKl6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="332402681"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2020 23:02:03 -0700
Received: from [10.214.160.145] (unknown [10.214.160.145])
 by linux.intel.com (Postfix) with ESMTP id 218755802C9;
 Tue, 14 Apr 2020 23:01:56 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200414022433.36622-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200414092132.525053f1@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <bb9d2f29-acef-cc1b-8606-bbb38b488cce@linux.intel.com>
Date: Wed, 15 Apr 2020 14:01:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414092132.525053f1@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_230204_724181_F048045A 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, richard@nod.at, qi-ming.wu@intel.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgogwqDCoMKgIFRoYW5rIHlvdSBzbyBtdWNoIGZvciByZXZpZXcgY29tbWVudHMg
YW5kIHlvdXIgdGltZS4uLgoKT24gMTQvNC8yMDIwIDM6MjEgcG0sIEJvcmlzIEJyZXppbGxvbiB3
cm90ZToKPiBIZWxsbyBSYW11dGhldmFyLAo+Cj4gT24gVHVlLCAxNCBBcHIgMjAyMCAxMDoyNDoz
MyArMDgwMAo+ICJSYW11dGhldmFyLFZhZGl2ZWwgTXVydWdhblgiCj4gPHZhZGl2ZWwubXVydWdh
bngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4+ICsJbGdtX2hvc3QtPmNo
aXAubGVnYWN5LnJlYWRfYnl0ZSA9IGxnbV9yZWFkX2J5dGU7Cj4+ICsJbGdtX2hvc3QtPmNoaXAu
bGVnYWN5LnJlYWRfYnVmID0gbGdtX3JlYWRfYnVmOwo+PiArCWxnbV9ob3N0LT5jaGlwLmxlZ2Fj
eS53cml0ZV9idWYgPSBsZ21fd3JpdGVfYnVmOwo+PiArCWxnbV9ob3N0LT5jaGlwLmxlZ2FjeS5z
ZWxlY3RfY2hpcCA9IGxnbV9zZWxlY3RfY2hpcDsKPj4gKwlsZ21faG9zdC0+Y2hpcC5sZWdhY3ku
ZGV2X3JlYWR5ID0gbGdtX2Rldl9yZWFkeTsKPj4gKwlsZ21faG9zdC0+Y2hpcC5sZWdhY3kuY21k
X2N0cmwgPSBsZ21fY21kX2N0cmw7Cj4+ICsJbGdtX2hvc3QtPmNoaXAubGVnYWN5LmNoaXBfZGVs
YXkgPSAzMDsKPj4gKwlsZ21faG9zdC0+Y2hpcC5sZWdhY3kuZHVtbXlfY29udHJvbGxlci5vcHMg
PSAmbGdtX25hbmRfY29udHJvbGxlcl9vcHM7Cj4+ICsKPiBTZXJpb3VzbHksIHdoYXQncyBub3Qg
Y2xlYXIgaW4gWzFdPyBPa2F5LCBsZXQncyBzYXkgeW91IG92ZXJsb29rZWQgdGhpcwo+IGNvbW1l
bnQsIGlzbid0IHRoZSBuYW1lIG9mIHRoZSBmaWVsZCBleHBsaWNpdCBlbm91Z2g/IFdlIHJlY2Vp
dmVkIGEKPiBmZXcgb3RoZXIgZHJpdmVycyBpbXBsZW1lbnRpbmcgdGhlIGxlZ2FjeSBpbnRlcmZh
Y2UgaW4gdGhlIGxhc3QgZmV3Cj4gbW9udGhzIHNvIG1heWJlIHRoZXJlJ3Mgc29tZXRoaW5nIHRv
IGltcHJvdmUgb24gb3VyIGVuZCAodXBkYXRlIHRoZQo+IGRvYywgbW92ZSBsZWdhY3kgZHJpdmVy
cyB0byBhIGxlZ2FjeSBzdWItZGlyPykuClVuZGVyc3Rvb2QgdGhlIGxlZ2FjeSB0byBsYXRlc3Qg
aW1wbGVtZW50YXRpb24gYmFzZWQgLT5leGVjX29wKCksIFRoYW5rcyEKPgo+IEJhY2sgdG8gbW9y
ZSBjb25zdHJ1Y3RpdmUgY29tbWVudCBub3c6IHBsZWFzZSBpbXBsZW1lbnQgLT5leGVjX29wKCkg
dG8KPiByZXBsYWNlIHRob3NlIGxlZ2FjeSBob29rcy4KCkFncmVlZCwgd2lsbCBkbyB0aGUgaW1w
bGVtZW50YXRpb24gb2YgZXhlY19vcCgpIGhvb2sgYW5kIHVwZGF0ZSB0aGUgcGF0Y2hlcy4KClJl
Z2FyZHMKVmFkaXZlbAo+Cj4gUmVnYXJkcywKPgo+IEJvcmlzCj4KPiBbMV1odHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS43LXJjMS9zb3VyY2UvaW5jbHVkZS9saW51eC9tdGQvcmF3
bmFuZC5oI0w5ODcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
