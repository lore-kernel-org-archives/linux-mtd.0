Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5574AC5DF60
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 19:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C6CF217F4
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 19:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KdNcEcoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C6CF217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNDnUEXHiJ6/QJ5p4fSTTKRnTnLVvbMbcWEPxppHuQI=; b=KdNcEcoXGy4F6n
	/1XOLIwrS383Vyed02fyX06GXamlCQkLhw0j48niwcyGRKtppzhWtl/dKeZgU9F+rgJSzvnk+TFTz
	xuY+9JUWqLgeloszRI2o+rElMYAtMQeI/B3EgKgzWMLT5dze0ryc+sxduW86kFoJjTVbXVR/dZ4nh
	5+9THCzgaNpRDP5RmN9qEyQVBtYcS3Lqqvvugq4Lch5Qdex95jCWMxfGPSIIJRABfeKnDoPBordiO
	UwwDWyZqP4pAE9k57e/FFzgbgFkNgWdmzo3oDxcUov3XzMpKolBJjcwgeIcMsswsUx40WQgDU2Pd8
	nv+wnULnRXyD4L9rf+tA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS47N-0002KI-H1; Tue, 05 Nov 2019 19:03:53 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS47K-0002JA-LO
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 19:03:52 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4E88320004;
 Tue,  5 Nov 2019 19:03:46 +0000 (UTC)
Date: Tue, 5 Nov 2019 20:03:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
Message-ID: <20191105200344.1e8c3eab@xps13>
In-Reply-To: <20191021193343.41320-1-kdasu.kdev@gmail.com>
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_110350_836277_1C0764AA 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpSaWNoYXJkLCBzb21ldGhpbmcgdG8gbG9vayBpbnRvIGJlbG93IDopCgpLYW1h
bCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAyMSBPY3QgMjAxOSAx
NTozMjo1MgotMDQwMDoKCj4gQ2hlY2sgbXRkIHBhbmljIHdyaXRlIGZsYWcgYW5kIHNldCB0aGUg
bXRkIHBhcnRpdGlvbiBwYW5pYwo+IHdyaXRlIGZsYWcgc28gdGhhdCBsb3cgbGV2ZWwgZHJpdmVy
cyBjYW4gdXNlIGl0IHRvIHRha2UKPiByZXF1aXJlZCBhY3Rpb24gdG8gZW5zdXJlIG9vcHMgZGF0
YSBnZXRzIHdyaXR0ZW4gdG8gYXNzaWduZWQKPiBtdGQgcGFydGl0aW9uLgoKSSBmZWVsIHRoZXJl
IGlzIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uCnJlZ2Fy
ZGluZyBwYXJ0aXRpb25zIGJ1dCBJIGFtIG5vdCBzdXJlIHRoaXMgaXMgdGhlIHJpZ2h0IGZpeC4g
SXMgdGhpcwpzb21ldGhpbmcgeW91IGRldGVjdGVkIHdpdGggc29tZSBraW5kIG9mIHN0YXRpYyBj
aGVja2VyIG9yIGRpZCB5b3UKYWN0dWFsbHkgZXhwZXJpZW5jZSBhbiBpc3N1ZT8KCkluIHRoZSBj
b21taXQgbG9nIHlvdSBzYXkgImNoZWNrIG10ZCAoSSBzdXBwb3NlIHlvdSBtZWFuIHRoZQptYXN0
ZXIpIHBhbmljIHdyaXRlIGZsYWcgYW5kIHNldCB0aGUgbXRkIHBhcnRpdGlvbiBwYW5pYyB3cml0
ZSBmbGFnIgp3aGljaCBtYWtlcyBzZW5zZSwgYnV0IGluIHJlYWxpdHkgbXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0IHlvdSBkbyB0aGUKb3Bwb3NpdGU6IHlvdSBjaGVjayBtdGQtPm9vcHNfcGFuaWNf
d3JpdGUgd2hpY2ggaXMgdGhlIHBhcnRpdGlvbnMnCnN0cnVjdHVyZSwgYW5kIHNldCBwYXJ0LT5w
YXJlbnQtPm9vcHNfcGFuaWNfd3JpdGUgd2hpY2ggaXMgdGhlIG1hc3RlcidzCmZsYWcuCgpBbHNv
LCBJIGFtIG5vdCBzdXJlIGlmIGl0IGlzIHdvcnRoIGNoZWNraW5nIGFueXRoaW5nLCB3aHkgbm90
IGp1c3Qgc2V0Cm10ZC0+b29wc19wYW5pY193cml0ZSBpbiB0aGlzIGZ1bmN0aW9uPwoKU2FtZSBj
b21tZW50IGZvciB0aGUgLWFscmVhZHkgZXhpc3RpbmctIGNvbmRpdGlvbiBpbiBtdGRfcGFuaWNf
d3JpdGUuCkFzIHNvb24gYXMgd2UgYXJlIGluIHRoZXNlIGZ1bmN0aW9ucywgd2Uga25vdyB0aGVy
ZSBpcyBhIHBhbmljLCByaWdodD8KU28gd2h5IGNoZWNraW5nIGlmIHRoZSBiaXQgaXMgYWxyZWFk
eSBzZXQgYmVmb3JlIGZvcmNpbmcgaXQ/Cgo+IAo+IEZpeGVzOiA5Zjg5N2JmZGQ4ICgibXRkOiBB
ZGQgZmxhZyB0byBpbmRpY2F0ZSBwYW5pY193cml0ZSIpCj4gU2lnbmVkLW9mZi1ieTogS2FtYWwg
RGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL210ZHBhcnQu
YyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IGlu
ZGV4IDczMjhjMDY2YzViYS4uYjRmNjQ3OWFiZWRhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L210ZHBhcnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IEBAIC0xNTksNiArMTU5
LDEwIEBAIHN0YXRpYyBpbnQgcGFydF9wYW5pY193cml0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
bG9mZl90IHRvLCBzaXplX3QgbGVuLAo+ICAJCXNpemVfdCAqcmV0bGVuLCBjb25zdCB1X2NoYXIg
KmJ1ZikKPiAgewo+ICAJc3RydWN0IG10ZF9wYXJ0ICpwYXJ0ID0gbXRkX3RvX3BhcnQobXRkKTsK
PiArCj4gKwlpZiAobXRkLT5vb3BzX3BhbmljX3dyaXRlKQo+ICsJCXBhcnQtPnBhcmVudC0+b29w
c19wYW5pY193cml0ZSA9IHRydWU7Cj4gKwo+ICAJcmV0dXJuIHBhcnQtPnBhcmVudC0+X3Bhbmlj
X3dyaXRlKHBhcnQtPnBhcmVudCwgdG8gKyBwYXJ0LT5vZmZzZXQsIGxlbiwKPiAgCQkJCQkgIHJl
dGxlbiwgYnVmKTsKPiAgfQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
