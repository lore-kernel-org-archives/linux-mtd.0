Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F70C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1497E207D8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bK41VH41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1497E207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slY4+FmWiq1pFoFwo3C6v2Ksc43lGjzgOxnqYFgTwC0=; b=bK41VH41oENj8R
	ZfZlF0LY0OY42obVip2y/0Onq4G50aYu4Ig8fAbEMiCWbfvxzv5qPeP/YqfxCwDsVxufaCgRUFN2c
	NafJlZM83sLdZDrQ0Hj+1sXEqgq9qsEr8k3tXu6ECIupayV3R0i4jTxRhkogjPg1y7dj4pSVV1sIU
	FdwwrJ/KdgVd1Dd5j9wO6bx5oZv0Mllz4ZPA51DSM+86zJ1NSNGH1W2/f/9cudYqu/2w9z3gi5HeF
	lR9j473mXJwUuN0cIObvK/JN505adqG6KZFy7ZO4OZoSF6qmMjQQy8qIGRZA6OV2c2d9puaX2FrAN
	fOtXfKdlR5YMm1NCRe5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjdw5-00019Y-DL; Fri, 12 Jun 2020 07:17:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjdw2-00018y-5b
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 07:17:07 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1D41D2000D;
 Fri, 12 Jun 2020 07:16:59 +0000 (UTC)
Date: Fri, 12 Jun 2020 09:16:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V3 1/2] mtd: rawnand: qcom: avoid write to unavailable
 register
Message-ID: <20200612091658.4f9fba49@xps13>
In-Reply-To: <1591944589-14357-2-git-send-email-sivaprak@codeaurora.org>
References: <1591944589-14357-1-git-send-email-sivaprak@codeaurora.org>
 <1591944589-14357-2-git-send-email-sivaprak@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_001706_345395_1A827180 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: architt@codeaurora.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2l2YXByYWthc2gsCgpTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJv
cmEub3JnPiB3cm90ZSBvbiBGcmksIDEyIEp1bgoyMDIwIDEyOjE5OjQ4ICswNTMwOgoKPiBTRkxB
U0hDX0JVUlNUX0NGRyBpcyBvbmx5IGF2YWlsYWJsZSBvbiBvbGRlciBpcHEgbmFuZCBwbGF0Zm9y
bXMsIHRoaXMKPiByZWdpc3RlciBoYXMgYmVlbiByZW1vdmVkIHdoZW4gdGhlIE5BTkQgY29udHJv
bGxlciBpcyBtb3ZlZCBhcyBwYXJ0IG9mIHFwaWMKPiBjb250cm9sbGVyLgo+IAo+IGF2b2lkIHJl
Z2lzdGVyIHdyaXRlcyB0byB0aGlzIHJlZ2lzdGVyIG9uIGRldmljZXMgd2hpY2ggYXJlIGJhc2Vk
IG9uIHFwaWMKCkF2b2lkIHdyaXRpbmcgdGhpcyByZWdpc3RlciBvbiAuLi4KCj4gTkFORCBjb250
cm9sbGVycy4KPiAKPiBGaXhlczogYTA2Mzc4MzQgKG10ZDogbmFuZDogcWNvbTogc3VwcG9ydCBm
b3IgSVBRNDAxOSBRUElDIE5BTkRjb250cm9sbGVyKQo+IEZpeGVzOiBkY2U4NDc2MCAobXRkOiBu
YW5kOiBxY29tOiBTdXBwb3J0IGZvciBJUFE4MDc0IFFQSUMgTkFORCBjb250cm9sbGVyKQoKSSBk
b24ndCB0aGluayBoYXZpbmcgdHdvIEZpeGVzIHRhZyBpcyBhbGxvd2VkLiBUYWtlIHRoZSBvbGRl
ciBvbmUKaW5zdGVhZC4KCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJvcmEub3JnPgo+IC0t
LQo+IFtWM10KPiAgKiBBZGRyZXNzZWQgTWlxdWVsIGNvbW1lbnRzLCBhZGRlZCBmbGFnIGJhc2Vk
IG9uIG5hbmQgY29udHJvbGxlciBodwo+ICAgIHRvIGF2b2lkIHRoZSByZWdpc3RlciB3cml0ZXMg
dG8gc3BlY2lmaWMgaXBxIHBsYXRmb3Jtcwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9u
YW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggZjFkYWYz
My4uZTBjNTViYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtNDU5LDEx
ICs0NTksMTMgQEAgc3RydWN0IHFjb21fbmFuZF9ob3N0IHsKPiAgICogYW1vbmcgZGlmZmVyZW50
IE5BTkQgY29udHJvbGxlcnMuCj4gICAqIEBlY2NfbW9kZXMgLSBlY2MgbW9kZSBmb3IgTkFORAo+
ICAgKiBAaXNfYmFtIC0gd2hldGhlciBOQU5EIGNvbnRyb2xsZXIgaXMgdXNpbmcgQkFNCj4gKyAq
IEBpc19xcGljIC0gd2hldGhlciBOQU5EIENUUkwgaXMgcGFydCBvZiBxcGljIElQCj4gICAqIEBk
ZXZfY21kX3JlZ19zdGFydCAtIE5BTkRfREVWX0NNRF8qIHJlZ2lzdGVycyBzdGFydGluZyBvZmZz
ZXQKPiAgICovCj4gIHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIHsKPiAgCXUzMiBlY2NfbW9kZXM7
Cj4gIAlib29sIGlzX2JhbTsKPiArCWJvb2wgaXNfcXBpYzsKPiAgCXUzMiBkZXZfY21kX3JlZ19z
dGFydDsKPiAgfTsKPiAgCj4gQEAgLTI3NzQsNyArMjc3Niw4IEBAIHN0YXRpYyBpbnQgcWNvbV9u
YW5kY19zZXR1cChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjKQo+ICAJdTMyIG5h
bmRfY3RybDsKPiAgCj4gIAkvKiBraWxsIG9uZW5hbmQgKi8KPiAtCW5hbmRjX3dyaXRlKG5hbmRj
LCBTRkxBU0hDX0JVUlNUX0NGRywgMCk7Cj4gKwlpZiAoIW5hbmRjLT5wcm9wcy0+aXNfcXBpYykK
PiArCQluYW5kY193cml0ZShuYW5kYywgU0ZMQVNIQ19CVVJTVF9DRkcsIDApOwo+ICAJbmFuZGNf
d3JpdGUobmFuZGMsIGRldl9jbWRfcmVnX2FkZHIobmFuZGMsIE5BTkRfREVWX0NNRF9WTEQpLAo+
ICAJCSAgICBOQU5EX0RFVl9DTURfVkxEX1ZBTCk7Cj4gIAo+IEBAIC0zMDI5LDE4ICszMDMyLDIx
IEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIGlwcTgwNnhfbmFu
ZGNfcHJvcHMgPSB7Cj4gIAkuZWNjX21vZGVzID0gKEVDQ19SU180QklUIHwgRUNDX0JDSF84QklU
KSwKPiAgCS5pc19iYW0gPSBmYWxzZSwKPiArCS5pc19xcGljID0gZmFsc2UsCgpUaGlzIGxpbmUg
aXMgdW5uZWVkZWQuCgo+ICAJLmRldl9jbWRfcmVnX3N0YXJ0ID0gMHgwLAo+ICB9Owo+ICAKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIGlwcTQwMTlfbmFuZGNfcHJvcHMg
PSB7Cj4gIAkuZWNjX21vZGVzID0gKEVDQ19CQ0hfNEJJVCB8IEVDQ19CQ0hfOEJJVCksCj4gIAku
aXNfYmFtID0gdHJ1ZSwKPiArCS5pc19xcGljID0gdHJ1ZSwKPiAgCS5kZXZfY21kX3JlZ19zdGFy
dCA9IDB4MCwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcWNvbV9uYW5kY19wcm9w
cyBpcHE4MDc0X25hbmRjX3Byb3BzID0gewo+ICAJLmVjY19tb2RlcyA9IChFQ0NfQkNIXzRCSVQg
fCBFQ0NfQkNIXzhCSVQpLAo+ICAJLmlzX2JhbSA9IHRydWUsCj4gKwkuaXNfcXBpYyA9IHRydWUs
Cj4gIAkuZGV2X2NtZF9yZWdfc3RhcnQgPSAweDcwMDAsCj4gIH07Cj4gIAoKTXVjaCBiZXR0ZXIg
cGF0Y2ggSU1ITywganVzdCBhIGZldyBuaXRzIGFuZCB3ZSdsbCBiZSBnb29kLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
