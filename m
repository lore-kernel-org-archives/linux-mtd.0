Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AE4C83004
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 07:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 379902053B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 07:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OlbB09nb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 379902053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc5ij3vizxY/0KggXrJijyiKlDaxMxxI2PQlhXIv5Bk=; b=OlbB09nbqcdFF1
	kC8GXOS71dIZB+Fggm4cMhTrSuGSbYvXI/DHQ5O6EkErODE2KrWESnVOaD4NqRY9IqV3TEOZbvAgl
	K43F4ZdAoTRyCyuuD3aluUSN4oE+qhwgePMEonhooQ10kkDbxl+juOeToikMPr3RMx23Glv19suJB
	UAmp7jI7w4Z2FOVvbaSvxQs+wEYSoAKjihNWB09cSRz9kuzC6KjxOH5ib565C83LyKtlRSwWlDI0T
	xwDa3IMzyRTsSx+ws0+SrYMLCPhOo9zlskkOx+R6i2SvSoMY5AV0E/jAjtnPhNgRXKNtW583rgXxE
	mUfeQD0HCZdZ53Ois5fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTL0U-0006QM-Bg; Tue, 28 Apr 2020 07:50:18 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTL0R-0006Mz-PH
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 07:50:17 +0000
IronPort-SDR: n5tF7omna2CNnzSxaD7gzeCosiKEraQaj/RA6Oe6El0zYqEKq4dZ52cEugiq7KCaM5CDcTYWtk
 3H1gMXVOvUxg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 00:50:15 -0700
IronPort-SDR: Awb1bZFMitFdF85kM6dXZn8cxfRuQgpSwj/DQ+BOpdnC/L1goQEp2Qap4LoAD1NZkgDzGVUWrH
 3V9iLhcCGMGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; d="scan'208";a="367419227"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2020 00:50:14 -0700
Received: from [10.214.149.60] (vramuthx-MOBL1.gar.corp.intel.com
 [10.214.149.60])
 by linux.intel.com (Postfix) with ESMTP id 7E9755807CA;
 Tue, 28 Apr 2020 00:50:07 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
 <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
 <20200428084704.5e04232a@collabora.com>
 <f72b5ae0-b0ac-61b8-8f64-c0e0f48afe02@linux.intel.com>
 <20200428094049.3c0d4730@xps13>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
Date: Tue, 28 Apr 2020 15:50:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428094049.3c0d4730@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_005015_839818_4E9C0C2E 
X-CRM114-Status: GOOD (  17.81  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 masonccyang@mxic.com.tw, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMjgvNC8yMDIwIDM6NDAgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgVmFkaXZlbCBNdXJ1Z2FuWCwKPiAKPiAiUmFtdXRoZXZhciwgVmFkaXZlbCBNdXJ1Z2FuWCIK
PiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3JvdGUgb24g
VHVlLCAyOCBBcHIgMjAyMAo+IDE0OjUwOjM1ICswODAwOgo+IAo+PiBIaSBCb3JpcywKPj4KPj4g
T24gMjgvNC8yMDIwIDI6NDcgcG0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPj4+IE9uIFR1ZSwg
MjggQXByIDIwMjAgMTQ6NDA6NTggKzA4MDAKPj4+ICJSYW11dGhldmFyLCBWYWRpdmVsIE11cnVn
YW5YIgo+Pj4gPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgo+Pj4gICAgCj4+Pj4gSGkgQm9yaXMsCj4+Pj4KPj4+PiBPbiAyOC80LzIwMjAgMjoyNyBw
bSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+Pj4+PiBPbiBUdWUsIDI4IEFwciAyMDIwIDE0OjE3
OjMwICswODAwCj4+Pj4+ICJSYW11dGhldmFyLCBWYWRpdmVsIE11cnVnYW5YIgo+Pj4+PiA8dmFk
aXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+Pj4+ICAg
ICA+Pj4+IEhpIE1pcXVlbCwKPj4+Pj4+Cj4+Pj4+PiAgICAgICAgVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgdGhlIHJldmlldyBjb21tZW50cyBhbmQgeW91ciB0aW1lLi4uCj4+Pj4+Pgo+Pj4+Pj4g
T24gMjcvNC8yMDIwIDExOjUxIHBtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+Pj4+IEhpIFJh
bXV0aGV2YXIsCj4+Pj4+Pj4gICAgICAgID4+Pj4+Pj4gK3N0YXRpYyBpbnQgZWJ1X25hbmRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+PiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+Pj4+Pj4+PiArCXN0cnVjdCBlYnVf
bmFuZF9jb250cm9sbGVyICplYnVfaG9zdDsKPj4+Pj4+Pj4+ICsJc3RydWN0IG5hbmRfY2hpcCAq
bmFuZDsKPj4+Pj4+Pj4+ICsJcGh5c19hZGRyX3QgbmFuZGFkZHJfcGE7Cj4+Pj4+Pj4+PiArCXN0
cnVjdCBtdGRfaW5mbyAqbXRkOwo+Pj4+Pj4+Pj4gKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKPj4+
Pj4+Pj4+ICsJaW50IHJldDsKPj4+Pj4+Pj4+ICsJdTMyIGNzOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+
Pj4gKwllYnVfaG9zdCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZWJ1X2hvc3QpLCBHRlBf
S0VSTkVMKTsKPj4+Pj4+Pj4+ICsJaWYgKCFlYnVfaG9zdCkKPj4+Pj4+Pj4+ICsJCXJldHVybiAt
RU5PTUVNOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKwllYnVfaG9zdC0+ZGV2ID0gZGV2Owo+Pj4+
Pj4+Pj4gKwluYW5kX2NvbnRyb2xsZXJfaW5pdCgmZWJ1X2hvc3QtPmNvbnRyb2xsZXIpOwo+Pj4+
Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBk
ZXYsIElPUkVTT1VSQ0VfTUVNLCAiZWJ1bmFuZCIpOwo+Pj4+Pj4+Pj4gKwllYnVfaG9zdC0+ZWJ1
X2FkZHIgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKPj4+Pj4+Pj4+
ICsJaWYgKElTX0VSUihlYnVfaG9zdC0+ZWJ1X2FkZHIpKQo+Pj4+Pj4+Pj4gKwkJcmV0dXJuIFBU
Ul9FUlIoZWJ1X2hvc3QtPmVidV9hZGRyKTsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsJcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgImhzbmFu
ZCIpOwo+Pj4+Pj4+Pj4gKwllYnVfaG9zdC0+bmFuZF9hZGRyID0gZGV2bV9pb3JlbWFwX3Jlc291
cmNlKCZwZGV2LT5kZXYsIHJlcyk7Cj4+Pj4+Pj4+PiArCWlmIChJU19FUlIoZWJ1X2hvc3QtPm5h
bmRfYWRkcikpCj4+Pj4+Pj4+PiArCQlyZXR1cm4gUFRSX0VSUihlYnVfaG9zdC0+bmFuZF9hZGRy
KTsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMy
KGRldiwgIm5hbmQsY3MiLCAmY3MpOwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDUyBpZHMgc2hvdWxkIGJl
IGVuY29kZWQgaW4gdGhlIHJlZyBwcm9wZXJ0eSAoc2VlIFsxXSkuCj4+Pj4+Pj4KPj4+Pj4+PiBJ
cyBpdCB5b3VyIGNob2ljZSB0byBvbmx5IHN1cHBvcnQgYSBzaW5nbGUgQ1Mgb3IgaXMgaXQgYWN0
dWFsbHkgYQo+Pj4+Pj4+IGNvbnRyb2xsZXIgbGltaXRhdGlvbj8KPj4+Pj4+Cj4+Pj4+PiBZZXMg
LCBpdHMgY29udHJvbGxlciBsaW1pdGF0aW9uIHRvIHN1cHBvcnQgb25seSBvbmUgQ1MKPj4+Pj4K
Pj4+Pj4gSSdtIHByZXR0eSBzdXJlIHRoYXQncyBub3QgdHJ1ZSwgb3RoZXJ3aXNlIHlvdSB3b3Vs
ZG4ndCBoYXZlIHRvIHNlbGVjdAo+Pj4+PiB0aGUgQ1MgeW91IHdhbnQgdG8gdXNlIDpQLgo+Pj4+
Cj4+Pj4gQXQgYSB0aW1lIGl0IHN1cHBvcnRzIG9ubHkgb25lIGNoaXAgc2VsZWN0Lgo+Pj4KPj4+
IFllcywgbGlrZSA5OSUgb2YgdGhlIE5BTkQgY29udHJvbGxlcnMsIGJ1dCB0aGF0IGRvZXNuJ3Qg
bWVhbiB5b3UgY2FuJ3QKPj4+IHN1cHBvcnQgbXVsdGktQ1MgY2hpcHMuIEFsbCB5b3UgaGF2ZSB0
byBkbyBpcyBhdHRhY2ggYW4gYXJyYXkgb2YKPj4+IGVidV9uYW5kX2NzIHRvIHlvdXIgZWJ1X25h
bmRfY2hpcCAoYXMgZG9uZSBpbiB0aGUgYXRtZWwgZHJpdmVyIEkKPj4+IHBvaW50ZWQgdG8pLiBu
YW5kX29wZXJhdGlvbi5jcyB0ZWxscyB5b3Ugd2hpY2ggQ1MgKGluZGV4IGluIHlvdXIKPj4+IGVi
dV9uYW5kX2NzIGFycmF5KSBhIHNwZWNpZmljIG9wZXJhdGlvbiBpcyB0YXJnZXRpbmcsIGFuZCB5
b3UgY2FuIHBpY2sKPj4+IHRoZSByaWdodCBNTUlPIHJhbmdlL3JlZyB2YWx1ZSBiYXNlZCBvbiB0
aGF0Lgo+Pgo+PiBBZ3JlZWQsIHN1cmUgSSB3aWxsIGFkZCB0aGF0IGFuZCB1cGRhdGUgbmV4dCBz
ZXJpZXMgb2YgcGF0Y2hlcyAuCj4gCj4gVGhlcmUgYXJlIGFsc28gbWFueSBvdGhlciBwbGFjZXMg
d2hlcmUgeW91IGFzc3VtZSBibGluZGx5IHRoYXQgdGhlcmUKPiBpcyBvbmx5IG9uZSBDUy4gWW91
IGNhbiBjaGVjayB0aGUgQXRtZWwgTkFORCBjb250cm9sbGVyIGRyaXZlciBhcyBCb3Jpcwo+IHNh
aWQgYW5kIHdlIHdpbGwgcHJvYmFibHkgcHJvcG9zZSBtb3JlIGxpdHRsZSBjaGFuZ2VzIHRvIGJl
IG1vcmUKPiBnZW5lcmljLgpzaW5jZSBMR00gRUJVX05BTkQgY29udHJvbGxlciBzdXBwb3J0cyBv
bmx5IG9uZSBjaGlwIHNlbGVjdCBhdCBhIHRpbWUsIApzbyBhc3N1bWVkIGxpa2UgdGhhdCwgd2ls
bCBjaGFuZ2UgYXMgZ2VuZXJpYyB3YXkgaWYgY29uc2lkZXIgbGlrZSBtb3JlIApjaGlwIHNlbGVj
dCBzdXBwb3J0cywgVGhhbmtzIQoKU3VyZSAsIEkgd2lsbCBkbyB0aGUgY2hhbmdlcyBhcyBwZXIg
eW91ciByZXZpZXcgY29tbWVudHMuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
