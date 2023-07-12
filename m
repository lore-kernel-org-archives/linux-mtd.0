Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DFCEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yp97lSBZrZ4X2rxivbO/7iJZyVttChiNk/Jt1QHcUl8=; b=tdP+gtQAJEVmk8
	Trn2dtYFwhGWniUMo1AJZUiccLNC9g8f8tv2eajGEKOxjG31zwji9+iw3m0frlxcSviRxqsEZSKdK
	pNKsYY0xdsiQXB6QHWK1NRm8AlPPc0862q7OwRcaj2nMfu14xPdaE2Rm7cbWz8/4WFNXMfmHOalZq
	c1/X0h5TDMIccUunuowlHKyOA1ADE0++m65oZR9KeSQBSEsNgHEWTjnFu5k75Nsjtjc5Xqv3IF/oB
	th247FR6e5csw7jMcAVF0eYPVQruaMgDwICs6ssmEevi8JlFXyLHLckzEbQAth+rUjPyhv5QLKmFO
	vUoMEsvujPTFg7hiFdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYfX-00HUak-2y;
	Wed, 12 Jul 2023 12:10:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYfR-00HUZQ-0v
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 12:10:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C5EB1BF214;
	Wed, 12 Jul 2023 12:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689163796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvTXj2XKIImCanBcXd2KzasaETb74Ehz2NCjHpi8yRA=;
	b=flF18ImExTNqBaUSiEUNqXskEu134Ys8W2gfI8indQjF8nRIKYFPdmi5VGR+vPgzm2ob1d
	CVohabiv7UJjNqBz2mdRRPrgFEEsRmyswj+7isa3Nq86JPDCZplyVZG2f7VBSGs6WyqjHZ
	/mBWutSDzFKrrkk4nLIExk/fHlpAmTE9wIgdIDQoH7TaDbc/Wr6J1JptosxhOxJaTDbr+9
	O+P0Xss+c1njp+zC60pzXqsVqVqwQLPUnzubjgMmiaW8fDVzXnE1h8zkwORGVvsJprHT/e
	APIewenREK6JwuAjx+t31q+0e2/xHTZfMWjFlkfrxHF3WJGNNUB8eH18oxn9CA==
Date: Wed, 12 Jul 2023 14:09:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/18] mtd: rawnand: davinci: Convert to
 devm_platform_ioremap_resource()
Message-ID: <20230712140953.30b5309c@xps-13>
In-Reply-To: <20230707040622.78174-9-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
	<20230707040622.78174-9-frank.li@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_051004_968199_1377E76F 
X-CRM114-Status: GOOD (  19.61  )
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

SGkgWWFuZ3RhbywKCmZyYW5rLmxpQHZpdm8uY29tIHdyb3RlIG9uIEZyaSwgIDcgSnVsIDIwMjMg
MTI6MDY6MTMgKzA4MDA6Cgo+IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSB0
byBzaW1wbGlmeSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPGZyYW5rLmxp
QHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kYXZpbmNpX25hbmQuYyB8
IDIxICsrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvZGF2aW5jaV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kYXZpbmNpX25hbmQuYwo+
IGluZGV4IDQxNWQ2YWFhODI1NS4uMmRiMWNkMWQzZDAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2RhdmluY2lfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
ZGF2aW5jaV9uYW5kLmMKPiBAQCAtNzEwLDggKzcxMCw3IEBAIHN0YXRpYyBpbnQgbmFuZF9kYXZp
bmNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBk
YXZpbmNpX25hbmRfcGRhdGEJKnBkYXRhOwo+ICAJc3RydWN0IGRhdmluY2lfbmFuZF9pbmZvCSpp
bmZvOwo+IC0Jc3RydWN0IHJlc291cmNlCQkJKnJlczE7Cj4gLQlzdHJ1Y3QgcmVzb3VyY2UJCQkq
cmVzMjsKPiArCXN0cnVjdCByZXNvdXJjZQkJCSpyZXM7Cj4gIAl2b2lkIF9faW9tZW0JCQkqdmFk
ZHI7Cj4gIAl2b2lkIF9faW9tZW0JCQkqYmFzZTsKPiAgCWludAkJCQlyZXQ7Cj4gQEAgLTczNiwy
NiArNzM1LDI0IEBAIHN0YXRpYyBpbnQgbmFuZF9kYXZpbmNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaW5mbyk7
Cj4gIAo+IC0JcmVzMSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgMCk7Cj4gLQlyZXMyID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0Vf
TUVNLCAxKTsKPiAtCWlmICghcmVzMSB8fCAhcmVzMikgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRl
diwgInJlc291cmNlIG1pc3NpbmdcbiIpOwo+IC0JCXJldHVybiAtRUlOVkFMOwo+IC0JfQo+IC0K
PiAtCXZhZGRyID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlczEpOwo+ICsJ
dmFkZHIgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gIAlpZiAo
SVNfRVJSKHZhZGRyKSkKPiAgCQlyZXR1cm4gUFRSX0VSUih2YWRkcik7Cj4gIAo+ICsJcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAxKTsKPiArCWlmICgh
cmVzKSB7Cj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAicmVzb3VyY2UgbWlzc2luZ1xuIik7Cj4g
KwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gIAkvKgo+ICAJICogVGhpcyByZWdpc3RlcnMgcmFu
Z2UgaXMgdXNlZCB0byBzZXR1cCBOQU5EIHNldHRpbmdzLiBJbiBjYXNlIHdpdGgKPiAgCSAqIFRJ
IEFFTUlGIGRyaXZlciwgdGhlIHNhbWUgbWVtb3J5IGFkZHJlc3MgcmFuZ2UgaXMgcmVxdWVzdGVk
IGFscmVhZHkKPiAgCSAqIGJ5IEFFTUlGLCBzbyB3ZSBjYW5ub3QgcmVxdWVzdCBpdCB0d2ljZSwg
anVzdCBpb3JlbWFwLgo+ICAJICogVGhlIEFFTUlGIGFuZCBOQU5EIGRyaXZlcnMgbm90IHVzZSB0
aGUgc2FtZSByZWdpc3RlcnMgaW4gdGhpcyByYW5nZS4KPiAgCSAqLwo+IC0JYmFzZSA9IGRldm1f
aW9yZW1hcCgmcGRldi0+ZGV2LCByZXMyLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMyKSk7Cj4g
KwliYXNlID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3Np
emUocmVzKSk7Cj4gIAlpZiAoIWJhc2UpIHsKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJpb3Jl
bWFwIGZhaWxlZCBmb3IgcmVzb3VyY2UgJXBSXG4iLCByZXMyKTsKPiArCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJpb3JlbWFwIGZhaWxlZCBmb3IgcmVzb3VyY2UgJXBSXG4iLCByZXMpOwoKSSBiZWxp
ZXZlIHRoaXMgaXMgdGhlIG9ubHkgdXNlIG9mIHRoZSByZXNvdXJjZSwgSSBhbSBpbiBmYXZvciBv
ZiBqdXN0CnVzaW5nIHRoZSByZWd1bGFyIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgp
IGhlbHBlciBoZXJlIGFuZCBqdXN0CmRyb3AgdGhlIHJlZmVyZW5jZSB0byB0aGUgcmVzb3VyY2Ug
ZnJvbSB0aGUgbWVzc2FnZS4KCkkgd2lsbCBhcHBseSBhbGwgb3RoZXIgcGF0Y2hlcywgcGxlYXNl
IHNlbmQgYSB2MiBvbmx5IGZvciB0aGlzIG9uZQpvbmNlIGltcHJvdmVkLgoKPiAgCQlyZXR1cm4g
LUVBRERSTk9UQVZBSUw7Cj4gIAl9Cj4gIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
