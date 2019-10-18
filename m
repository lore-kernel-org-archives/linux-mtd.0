Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD5DCA9EA2
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 06:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A69121925
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 06:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0XsoIue"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A69121925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LA0LChAXByKfE/XD5S6X0hpBVaHdYjGmBy6cHENTvA=; b=Y0XsoIuekhnOkD
	4VVLBG0x0vh8n1oTzVUuMkRGAVfEO7lN1UDbe1fFphl/S5PsEJCeiieNuGZGBN9KeQnrZEJ7Lsdb4
	iYb2f//F12VGlD3L7+inoBkUGGDbZQLeQPSIxER8/aR752LZvk7eu0pFN7F/8RZfloiUk2BSXnPwp
	2oVKdkbPWw6Gg1lvsLriFEWekn2z8cVdED+OWZEjs7Lr7aTU+OrbY0WpitJYkvNqzhhDBKwCmvCci
	OeDyb8hFPXkl24XcSkluYo4a/ax0XvHSe4bGZxQOTmz8MjI3POHwtKSLvzuu7yPf4QFW0v9eZbO21
	7cohCOi77UKxGzEw0y9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLLVd-0008Sn-US; Fri, 18 Oct 2019 06:13:09 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLLVY-0008Rt-LG
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2019 06:13:07 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,310,1566889200"; d="scan'208";a="190270930"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.55])
 ([10.237.72.55])
 by orsmga008.jf.intel.com with ESMTP; 17 Oct 2019 23:12:58 -0700
Subject: Re: [PATCH] MAINTAINERS: mtd/ubi/ubifs: Remove inactive maintainers
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20191017142229.3853-1-miquel.raynal@bootlin.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <a5914504-9eac-afff-0e7e-8c70bb1b5eac@intel.com>
Date: Fri, 18 Oct 2019 09:11:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017142229.3853-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_231304_738955_AD0846C7 
X-CRM114-Status: GOOD (  20.58  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTcvMTAvMTkgNToyMiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBEZXNwaXRlIHRoZWly
IHN1YnN0YW50aWFsIHBlcnNvbmFsIGludmVzdG1lbnQgaW4gdGhlIE1URC9VQkkvVUJJRlMgYQo+
IGZldyB5ZWFycyBiYWNrLCBEYXZpZCwgQnJpYW4sIEFydGVtIGFuZCBBZHJpYW4gYXJlIG5vdCBh
Y3RpdmVseQo+IG1haW50YWluaW5nIHRoZSBzdWJzeXN0ZW0gYW55bW9yZS4gV2Ugd2FybWx5IHNh
bHV0ZSB0aGVtIGZvciBhbGwgdGhlCj4gd29yayB0aGV5IGhhdmUgYWNoaWV2ZWQgYW5kIHdpbGwg
b2YgY291cnNlIHN0aWxsIHdlbGNvbWUgdGhlaXIKPiBwYXJ0aWNpcGF0aW9uIGFuZCByZXZpZXdz
Lgo+IAo+IFRoYXQgc2FpZCwgTWFyZWsgcmV0aXJlZCBoaW1zZWxmIGEgZmV3IHdlZWtzIGFnbyBx
dW90aW5nIEhhcmFsZCBbMV06Cj4gCj4gICAgICAgICBJdCBtYXR0ZXJzIHdobyBoYXMgd2hpY2gg
dGl0bGUgYW5kIHdoZW4uIFNob3VsZCBzb21lYm9keSBub3QKPiAgICAgICAgIGJlIGFuIGFjdGl2
ZSBtYWludGFpbmVyLCBtYWtlIHN1cmUgaGUncyBub3QgbGlzdGVkIGFzIHN1Y2guCj4gCj4gRm9y
IHRoaXMgc2FtZSByZWFzb24sIGxldOKAmXMgdHJpbSB0aGUgbWFpbnRhaW5lcnMgbGlzdCB3aXRo
IHRoZQo+IGFjdHVhbGx5IGFjdGl2ZSBvbmVzIG92ZXIgdGhlIHBhc3QgdHdvIHllYXJzLgo+IAo+
IFsxXSBodHRwOi8vbGFmb3JnZS5nbnVtb25rcy5vcmcvYmxvZy8yMDE4MDMwNy1tY2hhcmR5LWdw
bC8KPiAKPiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgo+IENjOiBC
cmlhbiBOb3JyaXMgPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4KPiBDYzogQXJ0ZW0gQml0
eXV0c2tpeSA8ZGVkZWtpbmQxQGdtYWlsLmNvbT4KPiBDYzogQWRyaWFuIEh1bnRlciA8YWRyaWFu
Lmh1bnRlckBpbnRlbC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5j
b20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6
IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2
ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1
c0BtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpBY2tlZC1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRl
ckBpbnRlbC5jb20+Cgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDUgLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJ
TlRBSU5FUlMKPiBpbmRleCAwNjMyNDIyY2U5ZDQuLjBlNWUwNzM2ZWU1NSAxMDA2NDQKPiAtLS0g
YS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTEwNTI4LDggKzEwNTI4LDYg
QEAgRjoJaW5jbHVkZS9saW51eC92bWFsbG9jLmgKPiAgRjoJbW0vCj4gIAo+ICBNRU1PUlkgVEVD
SE5PTE9HWSBERVZJQ0VTIChNVEQpCj4gLU06CURhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFk
ZWFkLm9yZz4KPiAtTToJQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+
Cj4gIE06CU1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gIE06CVJp
Y2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gIE06CVZpZ25lc2ggUmFnaGF2ZW5k
cmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBAQCAtMTY1NzksOCArMTY1NzcsNiBAQCBGOglkcml2ZXJz
L21lZGlhL3BjaS90dzY4NngvCj4gIAo+ICBVQkkgRklMRSBTWVNURU0gKFVCSUZTKQo+ICBNOglS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IC1NOglBcnRlbSBCaXR5dXRza2l5
IDxkZWRla2luZDFAZ21haWwuY29tPgo+IC1NOglBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVy
QGludGVsLmNvbT4KPiAgTDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAgVDoJZ2l0
IGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL3ViaWZzLTIuNi5naXQKPiAgVzoJaHR0cDovL3d3dy5s
aW51eC1tdGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpZnMuaHRtbAo+IEBAIC0xNjY5Nyw3ICsxNjY5
Myw2IEBAIFM6CU1haW50YWluZWQKPiAgRjoJZHJpdmVycy9zY3NpL3Vmcy91ZnMtbWVkaWF0ZWsq
Cj4gIAo+ICBVTlNPUlRFRCBCTE9DSyBJTUFHRVMgKFVCSSkKPiAtTToJQXJ0ZW0gQml0eXV0c2tp
eSA8ZGVkZWtpbmQxQGdtYWlsLmNvbT4KPiAgTToJUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KPiAgVzoJaHR0cDovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy8KPiAgTDoJ
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
