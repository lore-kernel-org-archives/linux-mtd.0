Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79CAC2BB85
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 09:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779E321BE5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 09:38:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4JSu5je"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 779E321BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLxrjFViDOjISQVuU6wV1d7C+jR7hzjpDAa//MHEJDo=; b=a4JSu5jeQpFd85
	anbEg5CMPfKDQBl42oKdx+UDMJqoY96omkCKgQn0sUEyKY13OdsHLbwQTY3of7iDe20vCfPpgj4IL
	Znm0lr/d5C2nF03MZx4dXoQ48OHvhN14fT2XkcUfhJgr8LqtyuuIoFNmfTrWkragP1fAYMswSrEFB
	bjfe11laxZN5NAagDTuXkOTkACmuKyexesv/j1nBpzyVSwEbUAalIgSRl3I3cKFgi1Wy1hRTM/L1A
	na5KMSpoZGZq4N0z7rqpOjISGqdVc9bbfHTuG+R5g9IOoubm03dRfpphovFhrcxAzg8GOLyv33DYg
	JjJ3gS1zxUEH7V77AfAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP0yf-0004Z4-Jf; Thu, 16 Apr 2020 09:38:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP0yc-0004Yd-9y
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 09:38:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DED562A1115;
 Thu, 16 Apr 2020 10:38:26 +0100 (BST)
Date: Thu, 16 Apr 2020 11:38:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200416113822.2ef326cb@collabora.com>
In-Reply-To: <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_023830_471520_7EC49D18 
X-CRM114-Status: GOOD (  20.71  )
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
 anders.roxell@linaro.org, andriy.shevchenko@intel.com, arnd@arndb.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNiBBcHIgMjAyMCAxNzozNToyNiArMDgwMAoiUmFtdXRoZXZhciwgVmFkaXZlbCBN
dXJ1Z2FuWCIKPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgoKPiBIaSBNYXJ0aW4sCj4gCj4gIMKgwqDCoCBUaGFuayB5b3Ugc28gbXVjaCBmb3IgcmV2
aWV3IGNvbW1lbnRzIGFuZCB5b3VyIHRpbWUuLi4KPiAKPiBPbiAxNi80LzIwMjAgNjowNSBhbSwg
TWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IGZpcnN0IG9mIGFsbDog
dGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHVwc3RyZWFtaW5nIHRoaXMuCj4gPiBFc3BlY2lhbGx5
IHNpbmNlIHlvdSBhcmUgZ29pbmcgdG8gdXNlIHRoZSBuZXcgZXhlY19vcCBzdHlsZSBpbiB2MiBh
cwo+ID4gQm9yaXMgc3VnZ2VzdGVkLgo+ID4gIAo+ID4+IEZyb206IFJhbXV0aGV2YXIgVmFkaXZl
bCBNdXJ1Z2FuIDx2YWRpdmVsLm11cnVnYW54LnJhbXV0aGV2YXJAbGludXguaW50ZWwuY29tPgo+
ID4+Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBuZXcgSVAgb2YgTmFuZCBGbGFzaCBDb250cm9s
bGVyKE5GQykgc3VwcG9ydAo+ID4+IG9uIEludGVsJ3MgTGlnaHRuaW5nIE1vdW50YWluKExHTSkg
U29DLgo+ID4+Cj4gPj4gRE1BIGlzIHVzZWQgZm9yIGJ1cnN0IGRhdGEgdHJhbnNmZXIgb3BlcmF0
aW9uLCBhbHNvIERNQSBIVyBzdXBwb3J0cwo+ID4+IGFsaWduZWQgMzJiaXQgbWVtb3J5IGFkZHJl
c3MgYW5kIGFsaWduZWQgZGF0YSBhY2Nlc3MgYnkgZGVmYXVsdC4KPiA+PiBETUEgYnVyc3Qgb2Yg
OCBzdXBwb3J0ZWQuIERhdGEgcmVnaXN0ZXIgdXNlZCB0byBzdXBwb3J0IHRoZSByZWFkL3dyaXRl
Cj4gPj4gb3BlcmF0aW9uIGZyb20vdG8gZGV2aWNlLiAgCj4gPiBJIGFtIHdvbmRlcmluZyBob3cg
dGhpcyBuZXcgaGFyZHdhcmUgaXMgZGlmZmVyZW50IGZyb20gdGhlIExhbnRpcSBOQU5ECj4gPiBj
b250cm9sbGVyIElQIC0gZm9yIHdoaWNoIHRoZXJlIGlzIGFscmVhZHkgYSBkcml2ZXIgaW4gbWFp
bmxpbmUgKGl0J3MKPiA+IGluIGRyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jKS4KPiA+
IFRoZSBDT04gYW5kIFdBSVQgcmVnaXN0ZXJzIGxvb2sgc3VzcGljaW91c2x5IHNpbWlsYXIuCj4g
Pgo+ID4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGUgIm9sZCIgU29DcyAoVlJYMjAwIGFuZCBl
YXJsaWVyKSBkb24ndCBoYXZlCj4gPiBhIGJ1aWx0LWluIEVDQyBlbmdpbmUuIFRoaXMgc2VlbXMg
dG8gaGF2ZSBjaGFuZ2VkIHdpdGggQVJYMzAwIHRob3VnaAo+ID4gKGFnYWluLCBBRkFJSykuCj4g
Pgo+ID4gQSBiaXQgb2YgbGluZWFnZSBvbiB0aGVzZSBTb0NzIChpbml0aWFsbHkgdGhlc2Ugd2Vy
ZSBkZXZlbG9wZWQgYnkKPiA+IEluZmluZW9uLiBMYW50aXEgdGhlbiBzdGFydGVkIGFzIGFuIElu
ZmluZW9uIHNwaW4tb2ZmIGluIDIwMDkgYW5kCj4gPiB3YXMgdGhlbiBhY3F1aXJlZCBieSBJbnRl
bCBpbiAyMDE1KToKPiA+IC0gRGFudWJlCj4gPiAtIEFSWDEwMCBmcm9tIDIwMDgvMjAwOQo+ID4g
LSBWUlgyMDAgZnJvbSAyMDA5LzIwMTAKPiA+IC0gQVJYMzAwIGZyb20gMjAxNAo+ID4gLSBHUlgz
NTAgZnJvbSAyMDE1LzIwMTYKPiA+IC0gR1JYNTUwIGZyb20gMjAxNwo+ID4gLSBhbmQgbm93IGZp
bmFsbHk6IExHTSBmcm9tIDIwMjAgKGVzdC4pCj4gPgo+ID4gVGhlIGV4aXN0aW5nIHh3YXlfbmFu
ZCBkcml2ZXIgc3VwcG9ydHMgdGhlIERhbnViZSwgQVJYMTAwIGFuZCBWUlgyMDAKPiA+IFNvQ3Mu
ICAKPiBMYW50aXEgdXBzdHJlYW1lZCBhIGRyaXZlciBmb3IgYW4gb2xkZXIgdmVyc2lvbiBvZiB0
aGlzIElQIGNvcmUgOCB5ZWFycyAKPiBhZ28sIHNlZSBoZXJlOgo+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y1LjUuNi9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9u
YW5kLmMgCj4gSXQgZG9lcyBub3Qgc3VwcG9ydCBETUEgYW5kIEVDQy4KClRoZW4gbGV0J3MganVz
dCBleHRlbmQgdGhpcyBkcml2ZXIgdG8gc3VwcG9ydCB0aGUgbmV3IGZlYXR1cmVzLiBQbHVzLAp3
ZSdsbCBiZSBoYXBweSB0byBoYXZlIG9uZSBtb3JlIG9mIHRoZSBleGlzdGluZyBkcml2ZXIgY29u
dmVydGVkIHRvCi0+ZXhlY19vcCgpIDstKS4KCj4gVGhpcyB1cHN0cmVhbSBkcml2ZXIgd29ya3Mg
d2l0aCB0aGUgeHJ4MjAwLCBJIGRvIG5vdCBrbm93IGhvdyB3ZWxsIGl0IAo+IHdvcmtzIHdpdGgg
b3RoZXIgU29Dcy4KPiAKPiBSZWdhcmRzCj4gVmFkaXZlbAo+ID4KPiA+Cj4gPiBCZXN0IHJlZ2Fy
ZHMsCj4gPiBNYXJ0aW4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
