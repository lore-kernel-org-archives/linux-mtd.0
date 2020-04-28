Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6603BC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A752064A
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:28:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpZR3AXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A752064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y15J63LZSSsSzMI4sqq44XDO+4gUeIsUThKT0i1RbeA=; b=mpZR3AXV86mN9c
	07GMwEL+soxiwYhQlye3/Q4eEJbU8YQM71ul4M8engk8VUFfOzyh6RkNTQrIGsfyeezMuXmZL+6Gk
	Vll++gacecVr/VfpGq55HuWrVJNHwNx1IzYqpZbhH6vG0//rcUPScZPLKN+Tgn4VZZCyGd/cdmd+e
	MAtcpBS6FFpj3ZsQ6V3QI2lGLUinLh0on1DoZtw7bIp4FMSgSHRyKktQmxasl/ssXbxVnzexvGdQX
	sVf/bbCu5LjD15DSoYr9MlDmpZBOXwz4Y+uT+lFMzqIvZy2pyQXkX/2WU15iaHRA9IskutGwwUct2
	BndTKuTONvWLbI7bS4DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTLbd-00026h-43; Tue, 28 Apr 2020 08:28:41 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTLba-00026D-F5
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:28:39 +0000
IronPort-SDR: w65KafUChMLKKOSE0Jag5DLkufCY9no9yVUlIr/ze7xtlrSVrjGZaWrcl2K38KBG2X97z6e4yo
 5tD5Fx6ksvsQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 01:28:38 -0700
IronPort-SDR: cXF0nyAj5HPxlSisvPTOTOweP9i/MFPapWw0UV9p1jNLtkuxqInvF0mnwzyPpwM0AyPx+4SQo2
 cUiwjg1mD0JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; d="scan'208";a="282070540"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2020 01:28:36 -0700
Received: from [10.214.149.60] (vramuthx-MOBL1.gar.corp.intel.com
 [10.214.149.60])
 by linux.intel.com (Postfix) with ESMTP id 87A465804B6;
 Tue, 28 Apr 2020 01:28:28 -0700 (PDT)
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
 <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
 <20200428095459.6727fab0@xps13>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <5c086349-d17f-2ebd-1a70-005fa64e050f@linux.intel.com>
Date: Tue, 28 Apr 2020 16:28:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428095459.6727fab0@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_012838_516937_42834A4B 
X-CRM114-Status: GOOD (  19.38  )
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

SGkgTWlxdWVsLAoKT24gMjgvNC8yMDIwIDM6NTQgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGVsbG8sCj4gCj4gIlJhbXV0aGV2YXIsIFZhZGl2ZWwgTXVydWdhblgiCj4gPHZhZGl2ZWwubXVy
dWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdyb3RlIG9uIFR1ZSwgMjggQXByIDIw
MjAKPiAxNTo1MDowNiArMDgwMDoKPiAKPj4gSGkgTWlxdWVsLAo+Pgo+PiBPbiAyOC80LzIwMjAg
Mzo0MCBwbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIFZhZGl2ZWwgTXVydWdhblgsCj4+
Pgo+Pj4gIlJhbXV0aGV2YXIsIFZhZGl2ZWwgTXVydWdhblgiCj4+PiA8dmFkaXZlbC5tdXJ1Z2Fu
eC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3JvdGUgb24gVHVlLCAyOCBBcHIgMjAyMAo+
Pj4gMTQ6NTA6MzUgKzA4MDA6Cj4+PiAgICAKPj4+PiBIaSBCb3JpcywKPj4+Pgo+Pj4+IE9uIDI4
LzQvMjAyMCAyOjQ3IHBtLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgMjgg
QXByIDIwMjAgMTQ6NDA6NTggKzA4MDAKPj4+Pj4gIlJhbXV0aGV2YXIsIFZhZGl2ZWwgTXVydWdh
blgiCj4+Pj4+IDx2YWRpdmVsLm11cnVnYW54LnJhbXV0aGV2YXJAbGludXguaW50ZWwuY29tPiB3
cm90ZToKPj4+Pj4gICAgID4+Pj4gSGkgQm9yaXMsCj4+Pj4+Pgo+Pj4+Pj4gT24gMjgvNC8yMDIw
IDI6MjcgcG0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPj4+Pj4+PiBPbiBUdWUsIDI4IEFwciAy
MDIwIDE0OjE3OjMwICswODAwCj4+Pj4+Pj4gIlJhbXV0aGV2YXIsIFZhZGl2ZWwgTXVydWdhblgi
Cj4+Pj4+Pj4gPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgo+Pj4+Pj4+ICAgICAgPj4+PiBIaSBNaXF1ZWwsCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgICAg
ICAgVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHJldmlldyBjb21tZW50cyBhbmQgeW91ciB0
aW1lLi4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDI3LzQvMjAyMCAxMTo1MSBwbSwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPj4+Pj4+Pj4+IEhpIFJhbXV0aGV2YXIsCj4+Pj4+Pj4+PiAgICAgICAgID4+
Pj4+Pj4gK3N0YXRpYyBpbnQgZWJ1X25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPj4+Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+Pj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2Owo+Pj4+Pj4+Pj4+PiArCXN0cnVjdCBlYnVfbmFuZF9jb250cm9sbGVyICplYnVf
aG9zdDsKPj4+Pj4+Pj4+Pj4gKwlzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kOwo+Pj4+Pj4+Pj4+PiAr
CXBoeXNfYWRkcl90IG5hbmRhZGRyX3BhOwo+Pj4+Pj4+Pj4+PiArCXN0cnVjdCBtdGRfaW5mbyAq
bXRkOwo+Pj4+Pj4+Pj4+PiArCXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+Pj4+Pj4+Pj4+PiArCWlu
dCByZXQ7Cj4+Pj4+Pj4+Pj4+ICsJdTMyIGNzOwo+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+ICsJ
ZWJ1X2hvc3QgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmVidV9ob3N0KSwgR0ZQX0tFUk5F
TCk7Cj4+Pj4+Pj4+Pj4+ICsJaWYgKCFlYnVfaG9zdCkKPj4+Pj4+Pj4+Pj4gKwkJcmV0dXJuIC1F
Tk9NRU07Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gKwllYnVfaG9zdC0+ZGV2ID0gZGV2Owo+
Pj4+Pj4+Pj4+PiArCW5hbmRfY29udHJvbGxlcl9pbml0KCZlYnVfaG9zdC0+Y29udHJvbGxlcik7
Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Vf
YnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAiZWJ1bmFuZCIpOwo+Pj4+Pj4+Pj4+PiArCWVi
dV9ob3N0LT5lYnVfYWRkciA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMp
Owo+Pj4+Pj4+Pj4+PiArCWlmIChJU19FUlIoZWJ1X2hvc3QtPmVidV9hZGRyKSkKPj4+Pj4+Pj4+
Pj4gKwkJcmV0dXJuIFBUUl9FUlIoZWJ1X2hvc3QtPmVidV9hZGRyKTsKPj4+Pj4+Pj4+Pj4gKwo+
Pj4+Pj4+Pj4+PiArCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9S
RVNPVVJDRV9NRU0sICJoc25hbmQiKTsKPj4+Pj4+Pj4+Pj4gKwllYnVfaG9zdC0+bmFuZF9hZGRy
ID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlcyk7Cj4+Pj4+Pj4+Pj4+ICsJ
aWYgKElTX0VSUihlYnVfaG9zdC0+bmFuZF9hZGRyKSkKPj4+Pj4+Pj4+Pj4gKwkJcmV0dXJuIFBU
Ul9FUlIoZWJ1X2hvc3QtPm5hbmRfYWRkcik7Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gKwly
ZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAibmFuZCxjcyIsICZjcyk7Cj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+PiBDUyBpZHMgc2hvdWxkIGJlIGVuY29kZWQgaW4gdGhlIHJlZyBwcm9w
ZXJ0eSAoc2VlIFsxXSkuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSXMgaXQgeW91ciBjaG9pY2UgdG8g
b25seSBzdXBwb3J0IGEgc2luZ2xlIENTIG9yIGlzIGl0IGFjdHVhbGx5IGEKPj4+Pj4+Pj4+IGNv
bnRyb2xsZXIgbGltaXRhdGlvbj8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gWWVzICwgaXRzIGNvbnRyb2xs
ZXIgbGltaXRhdGlvbiB0byBzdXBwb3J0IG9ubHkgb25lIENTCj4+Pj4+Pj4KPj4+Pj4+PiBJJ20g
cHJldHR5IHN1cmUgdGhhdCdzIG5vdCB0cnVlLCBvdGhlcndpc2UgeW91IHdvdWxkbid0IGhhdmUg
dG8gc2VsZWN0Cj4+Pj4+Pj4gdGhlIENTIHlvdSB3YW50IHRvIHVzZSA6UC4KPj4+Pj4+Cj4+Pj4+
PiBBdCBhIHRpbWUgaXQgc3VwcG9ydHMgb25seSBvbmUgY2hpcCBzZWxlY3QuCj4+Pj4+Cj4+Pj4+
IFllcywgbGlrZSA5OSUgb2YgdGhlIE5BTkQgY29udHJvbGxlcnMsIGJ1dCB0aGF0IGRvZXNuJ3Qg
bWVhbiB5b3UgY2FuJ3QKPj4+Pj4gc3VwcG9ydCBtdWx0aS1DUyBjaGlwcy4gQWxsIHlvdSBoYXZl
IHRvIGRvIGlzIGF0dGFjaCBhbiBhcnJheSBvZgo+Pj4+PiBlYnVfbmFuZF9jcyB0byB5b3VyIGVi
dV9uYW5kX2NoaXAgKGFzIGRvbmUgaW4gdGhlIGF0bWVsIGRyaXZlciBJCj4+Pj4+IHBvaW50ZWQg
dG8pLiBuYW5kX29wZXJhdGlvbi5jcyB0ZWxscyB5b3Ugd2hpY2ggQ1MgKGluZGV4IGluIHlvdXIK
Pj4+Pj4gZWJ1X25hbmRfY3MgYXJyYXkpIGEgc3BlY2lmaWMgb3BlcmF0aW9uIGlzIHRhcmdldGlu
ZywgYW5kIHlvdSBjYW4gcGljawo+Pj4+PiB0aGUgcmlnaHQgTU1JTyByYW5nZS9yZWcgdmFsdWUg
YmFzZWQgb24gdGhhdC4KPj4+Pgo+Pj4+IEFncmVlZCwgc3VyZSBJIHdpbGwgYWRkIHRoYXQgYW5k
IHVwZGF0ZSBuZXh0IHNlcmllcyBvZiBwYXRjaGVzIC4KPj4+Cj4+PiBUaGVyZSBhcmUgYWxzbyBt
YW55IG90aGVyIHBsYWNlcyB3aGVyZSB5b3UgYXNzdW1lIGJsaW5kbHkgdGhhdCB0aGVyZQo+Pj4g
aXMgb25seSBvbmUgQ1MuIFlvdSBjYW4gY2hlY2sgdGhlIEF0bWVsIE5BTkQgY29udHJvbGxlciBk
cml2ZXIgYXMgQm9yaXMKPj4+IHNhaWQgYW5kIHdlIHdpbGwgcHJvYmFibHkgcHJvcG9zZSBtb3Jl
IGxpdHRsZSBjaGFuZ2VzIHRvIGJlIG1vcmUKPj4+IGdlbmVyaWMuCj4+IHNpbmNlIExHTSBFQlVf
TkFORCBjb250cm9sbGVyIHN1cHBvcnRzIG9ubHkgb25lIGNoaXAgc2VsZWN0IGF0IGEgdGltZSwg
c28gYXNzdW1lZCBsaWtlIHRoYXQsIHdpbGwgY2hhbmdlIGFzIGdlbmVyaWMgd2F5IGlmIGNvbnNp
ZGVyIGxpa2UgbW9yZSBjaGlwIHNlbGVjdCBzdXBwb3J0cywgVGhhbmtzIQo+IAo+IFdoYXQgZG8g
eW91IG1lYW4gImF0IGEgdGltZSI/CgpJIG1lYW4gaXQgc3VwcG9ydHMgbXVsdGktQ1MsIGR1cmlu
ZyB0aGUgcnVuIHRpbWUgaXQgc2VsZWN0cyBvbmUuClRoYW5rcyEKClJlZ2FyZHMKVmFkaXZlbAo+
IAo+IERvIHdlIGhhdmUgYWNjZXNzIHRvIHRoZSBzcGVjIG9yIGEgcmVnaXN0ZXIgbWFwPyBXZSBj
b3VsZCB0ZWxsIHlvdSB2ZXJ5Cj4gcXVpY2tseSBpZiBpdCBpcyB3b3J0aCB0aGUgdHJvdWJsZS4g
QnV0IEkgYW0gcHJldHR5IHN1cmUgYXMgd2VsbCB0aGF0Cj4gdGhlIGNvbnRyb2xsZXIgc3VwcG9y
dHMgbW9yZSB0aGFuIDEgQ1MuCj4gCj4+IFN1cmUgLCBJIHdpbGwgZG8gdGhlIGNoYW5nZXMgYXMg
cGVyIHlvdXIgcmV2aWV3IGNvbW1lbnRzLgo+Pj4KPj4+IFRoYW5rcywKPj4+IE1pcXXDqGwKPj4+
ICAgIAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
