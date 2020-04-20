Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0E2C54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 03:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E63C214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 03:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bC0y+VmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E63C214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bY/Ng4isbCu05aLd/IKRtaZjxNgEYgJe1MK9AAzaXRc=; b=bC0y+VmI6AH1XcIV8VsfZ6upr
	tI4NNkgrpNoblirE++knm8krwShuVlTLHSfkAVr1hmP6Qb7mhAKK/cFIxvYmIILXJNrSFVFNHC9to
	zXBpQ/TzP1enYooxInJGYJvaLkQRdQ/csc5+teRry7RR+BkxP3ZeGGAUwznigskryM2ZAeLNOBDvz
	7OgTzhr0bBmSanACqZH5sh2Ox3MXdo5VUXNnQj1lPkMRDHSx8vYZ73U9M+ZMVKqwdwuauZjgiv3eG
	PX+cBF4kli26lK+heggDO7t+RK/3Cs+Felj8/TZSAYm+lzln4N3CrNJaMhpSUOYUzWLFosP1LArx4
	d0QGlFttg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQN6g-0006HN-V3; Mon, 20 Apr 2020 03:28:26 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQN6d-0006GJ-Be
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 03:28:24 +0000
IronPort-SDR: yPbYSYrmcqd/IkZyMuZIvAPUgRA7jDl7UC4NMsvVixX7hgUfGQ6JkcvEb+/8knqAoEN9FyTDEP
 CMRksAKHAGSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 20:28:20 -0700
IronPort-SDR: HAo3SnHSgS33uHmI/1WIj+u8MQgHZlw7cOFUr8mBDve0Oo8JvF0iK+RXOd39QJm38wIK6S1q0o
 bGN5MbOYUoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; d="scan'208";a="333784767"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2020 20:28:20 -0700
Received: from [10.249.68.96] (vramuthx-mobl1.gar.corp.intel.com
 [10.249.68.96])
 by linux.intel.com (Postfix) with ESMTP id 90C52580479;
 Sun, 19 Apr 2020 20:28:15 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200419222817.GK185537@smile.fi.intel.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <cee6075c-a801-a0a9-f0b7-83c0a8c4fe80@linux.intel.com>
Date: Mon, 20 Apr 2020 11:28:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419222817.GK185537@smile.fi.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_202823_410485_26333A5C 
X-CRM114-Status: GOOD (  16.89  )
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
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5keSwKCiDCoCBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgcmV2aWV3IGNvbW1lbnRz
IGFuZCB5b3VyIHRpbWUuLi4KCk9uIDIwLzQvMjAyMCA2OjI4IGFtLCBBbmR5IFNoZXZjaGVua28g
d3JvdGU6Cj4gT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6MjE6NDdQTSArMDgwMCwgUmFtdXRo
ZXZhcixWYWRpdmVsIE11cnVnYW5YIHdyb3RlOgo+PiBGcm9tOiBSYW11dGhldmFyIFZhZGl2ZWwg
TXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPj4K
Pj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBuZXcgSVAgb2YgTmFuZCBGbGFzaCBDb250cm9sbGVyKE5G
Qykgc3VwcG9ydAo+PiBvbiBJbnRlbCdzIExpZ2h0bmluZyBNb3VudGFpbihMR00pIFNvQy4KPj4K
Pj4gRE1BIGlzIHVzZWQgZm9yIGJ1cnN0IGRhdGEgdHJhbnNmZXIgb3BlcmF0aW9uLCBhbHNvIERN
QSBIVyBzdXBwb3J0cwo+PiBhbGlnbmVkIDMyYml0IG1lbW9yeSBhZGRyZXNzIGFuZCBhbGlnbmVk
IGRhdGEgYWNjZXNzIGJ5IGRlZmF1bHQuCj4+IERNQSBidXJzdCBvZiA4IHN1cHBvcnRlZC4gRGF0
YSByZWdpc3RlciB1c2VkIHRvIHN1cHBvcnQgdGhlIHJlYWQvd3JpdGUKPj4gb3BlcmF0aW9uIGZy
b20vdG8gZGV2aWNlLgo+Pgo+PiBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIGltcGxlbWVudHMgLT5l
eGVjX29wKCkgdG8gcmVwbGFjZSBsZWdhY3kgaG9va3MsCj4+IHRoZXNlIHNwZWNpZmljIGNhbGwt
YmFjayBtZXRob2QgdG8gZXhlY3V0ZSBOQU5EIG9wZXJhdGlvbnMuCj4gSSBndWVzcyB1bnRlc3Rl
ZCB2ZXJzaW9uIHNsaXBwZWQgaW50byBtYWlsaW5nIGxpc3QuLi4KPiBTZWUgYmVsb3cgd2h5LgoK
U29ycnksIFRoaXMgaXMgb3JpZ2luYWwgcGF0Y2ggb25seSAsIGhlYWRlciBmaWxlcyBhcmUgbWlz
LWFsaWduZWQgc28gCmxvb2tzIGxpa2UgdW4tdGVzdGVkIHBhdGNoLgoKPiAuLi4KPgo+PiArI2lu
Y2x1ZGUgPGxpbnV4L2Nsay5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2NvbXBsZXRpb24uaD4KPj4g
KyNpbmNsdWRlIDxsaW51eC9kbWFlbmdpbmUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtZGly
ZWN0aW9uLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPj4gKyNpbmNsdWRl
IDxsaW51eC9lcnIuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4+ICsjaW5jbHVkZSA8
bGludXgvaW9wb2xsLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+ICsjaW5jbHVk
ZSA8bGludXgvcmVzb3VyY2UuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgo+PiArI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL210ZC5oPgo+PiAr
I2luY2x1ZGUgPGxpbnV4L210ZC9yYXduYW5kLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL25h
bmRfZWNjLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ICsjaW5j
bHVkZSA8bGludXgvb2YuaD4KPiBEbyB5b3UgbmVlZCB0aGlzPwpOb3RlZCwgd2lsbCBjaGVjayBh
bmQgZHJvcCBpZiBpdCBpcyBub3RuZWNlc3NhcnkuCj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL3Bh
cnRpdGlvbnMuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4KPj4gKyNpbmNsdWRlIDxtdGQvbXRkLWFiaS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L21vZF9kZXZpY2V0YWJsZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L210ZC9uYW5kLmg+Cj4gQmFz
aWNhbGx5LCBkbyB5b3UgbmVlZCBhbGwgb2YgdGhlbT8KPgo+IEFuZCBtYXliZSBrZWVwIHRoZW0g
aW4gb3JkZXI/ClN1cmUsIHdpbGwgdXBkYXRlLgo+IC4uLgo+Cj4+ICtzdGF0aWMgaW50IGxnbV9k
bWFfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBsZ21fbmFuZF9ob3N0ICpsZ21faG9z
dCkKPj4gK3sKPj4gKwlpbnQgcmV0Owo+PiArCj4+ICsJLyogUHJlcGFyZSBmb3IgVFggRE1BOiAq
Lwo+PiArCWxnbV9ob3N0LT5kbWFfdHggPSBkbWFfcmVxdWVzdF9jaGFuKGRldiwgInR4Iik7Cj4+
ICsJaWYgKElTX0VSUihsZ21faG9zdC0+ZG1hX3R4KSkgewo+PiArCQlyZXQgPSBQVFJfRVJSKGxn
bV9ob3N0LT5kbWFfdHgpOwo+PiArCQlkZXZfZXJyKGRldiwgImNhbid0IGdldCB0aGUgVFggRE1B
IGNoYW5uZWwsIGVycm9yICVkIVxuIiwgcmV0KTsKPj4gKwkJZ290byBlcnI7Cj4+ICsJfQo+PiAr
Cj4+ICsJLyogUHJlcGFyZSBmb3IgUlg6ICovCj4+ICsJbGdtX2hvc3QtPmRtYV9yeCA9IGRtYV9y
ZXF1ZXN0X2NoYW4oZGV2LCAicngiKTsKPj4gKwlpZiAoSVNfRVJSKGxnbV9ob3N0LT5kbWFfcngp
KSB7Cj4+ICsJCXJldCA9IFBUUl9FUlIobGdtX2hvc3QtPmRtYV9yeCk7Cj4+ICsJCWRldl9lcnIo
ZGV2LCAiY2FuJ3QgZ2V0IHRoZSBSWCBETUEgY2hhbm5lbCwgZXJyb3IgJWRcbiIsIHJldCk7Cj4g
SSBzdXNwZWN0IHRoaXMgZXJyb3IgcGF0aCBoYXNuJ3QgYmVlbiB0ZXN0ZWQuIEkgZG9uJ3Qgc2Vl
IHdoZXJlIHR4IGNoYW5uZWwKPiBmcmVlaW5nIGlzIGhhcHBlbmluZy4KR29vZCBjYXRjaCwgVGhh
bmtzISwgd2lsbCB1cGRhdGUKPj4gKwkJZ290byBlcnI7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJu
IDA7Cj4+ICtlcnI6Cj4+ICsJcmV0dXJuIHJldDsKPiBSZWR1bmRhbnQgbGFiZWwuCk5vdGVkLgo+
PiArfQo+IC4uLgo+Cj4+ICsJcmVzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5
bmFtZShwZGV2LCBsZ21faG9zdC0+Y3NfbmFtZSk7Cj4+ICsJbGdtX2hvc3QtPm5hbmRhZGRyX3Zh
ID0gcmVzOwo+PiArCW5hbmRhZGRyX3BhID0gcmVzLT5zdGFydDsKPj4gKwlpZiAoSVNfRVJSKGxn
bV9ob3N0LT5uYW5kYWRkcl92YSkpCj4+ICsJCXJldHVybiBQVFJfRVJSKGxnbV9ob3N0LT5uYW5k
YWRkcl92YSk7Cj4gSSdtIHdvbmRlcmlnIHdoYXQgaXMgdGhpcy4gIEhvdyBpcyBpdCBldmVuIGNv
bXBpbGU/CgpBZ3JlZWQhLCBuZWVkIGEgY29ycmVjdGlvbiwgYnV0IGl0J3MgY29tcGlsZWQuCgpS
ZWdhcmRzClZhZGl2ZWwKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
