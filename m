Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9193C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 07:27:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA07C2074B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 07:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQSSbEUT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA07C2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEtFPdkF49QPmOjXocBlTaTKei+z2PygjXgJqhdsOj4=; b=NQSSbEUTClR1xF
	zz5AG+Vvg+Qdtg2n8z/ph+KYd7yS+qLSpcNUBmUl3GAE3QQLeJpoYEkCroXtD/I4xdSMu71Adq3o5
	v8TJ5ncsrvaJ2RVAoXr77OMTts5gOov/Fv6h+wPafigk6VjxxW5UEhqmHTDcRr7RNCoHwXDjV2Ymx
	HO0Xpx0Mc6FUgbfQv7iCuRdqk0dSFWp2JorPtfEMzQ4CDjRLcsyyQ7kiWQ6qi27HbukpTcst6CPNO
	M5NEosmDZEUyScuakqfdSWjqKwJdVWLcHducuVgZyKKR2nKVe4CQCKXxuf9o6Z1uisyx8qOKPO1AP
	yg2d1bzf0SKS8Jy23lnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjHcR-0006YS-Eu; Thu, 11 Jun 2020 07:27:23 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjHcN-0006Xa-N3
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 07:27:22 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C516324000C;
 Thu, 11 Jun 2020 07:27:08 +0000 (UTC)
Date: Thu, 11 Jun 2020 09:27:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH  2/2] mtd: rawnand: brcmnand: Ecc error handling on EDU
 transfers
Message-ID: <20200611092707.75da8c6a@xps13>
In-Reply-To: <20200611054454.2547-2-kdasu.kdev@gmail.com>
References: <20200611054454.2547-1-kdasu.kdev@gmail.com>
 <20200611054454.2547-2-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_002720_021300_04BED99A 
X-CRM114-Status: GOOD (  18.82  )
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
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gVGh1
LCAxMSBKdW4gMjAyMCAwMTo0NDo1NAotMDQwMDoKCj4gSW1wbGVtZW50ZWQgRUNDIGNvcnJlY3Rh
YmxlIGFuZCB1bmNvcnJlY3RhYmxlIGVycm9yIGhhbmRsaW5nIGZvciBFRFUKCkltcGxlbWVudD8K
Cj4gcmVhZHMuIElmIEVDQyBjb3JyZWN0YWJsZSBiaXRmbGlwcyBhcmUgZW5jb3VudGVyZWQgIG9u
IEVEVSB0cmFuc2ZlciwKCmV4dHJhIHNwYWNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCgo+IHJlYWQgcGFnZSBhZ2FpbiB1c2luZyBwaW8sIFRoaXMgaXMgbmVlZGVk
IGR1ZSB0byBhIGNvbnRyb2xsZXIgbG1pdGF0aW9uCgpzL3Bpby9QSU8vCgo+IHdoZXJlIHJlYWQg
YW5kIGNvcnJlY3RlZCBkYXRhIGlzIG5vdCB0cmFuc2ZlcnJlZCB0byB0aGUgRE1BIGJ1ZmZlciBv
biBFQ0MKPiBlcnJvcnMuIFRoaXMgaG9sZHMgdHJ1ZSBmb3IgRUNDIGNvcnJlY3RhYmxlIGVycm9y
cyBiZXlvbmQgc2V0IHRocmVzaG9sZC4KCmVycm9yLgoKTm90IHN1cmUgd2hhdCB0aGUgbGFzdCBz
ZW50ZW5jZSBtZWFucz8KCj4gCj4gRml4ZXM6IGE1ZDUzYWQyNmE4YiAoIm10ZDogcmF3bmFuZDog
YnJjbW5hbmQ6IEFkZCBzdXBwb3J0IGZvciBmbGFzaC1lZHUgZm9yIGRtYSB0cmFuc2ZlcnMiKQo+
IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29tPgo+IC0tLQoK
TWlub3Igbml0cyBiZWxvdyA6KQoKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MjYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYwo+IGluZGV4IDBjMWQ2ZTU0MzU4Ni4uZDdkYWE4M2M4YTU4IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gQEAgLTE4NTUsNiArMTg1NSwyMiBAQCBz
dGF0aWMgaW50IGJyY21uYW5kX2VkdV90cmFucyhzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCwg
dTY0IGFkZHIsIHUzMiAqYnVmLAo+ICAJZWR1X3dyaXRlbChjdHJsLCBFRFVfU1RPUCwgMCk7IC8q
IGZvcmNlIHN0b3AgKi8KPiAgCWVkdV9yZWFkbChjdHJsLCBFRFVfU1RPUCk7Cj4gIAo+ICsJaWYg
KHJldCA9PSAwICYmIGVkdV9jbWQgPT0gRURVX0NNRF9SRUFEKSB7CgohcmV0Cgo+ICsJCXU2NCBl
cnJfYWRkciA9IDA7Cj4gKwo+ICsJCS8qCj4gKwkJICogY2hlY2sgZm9yIGVjYyBlcnJvcnMgaGVy
ZSwgc3VicGFnZSBlY2MgZXJyb3MgYXJlCj4gKwkJICogcmV0YWluZWQgaW4gZWNjIGVycm9yIGFk
ZHIgcmVnaXN0ZXIKCnMvZWNjL0VDQy8Kcy9lcnJvcy9lcnJvcnMvCnMvYWRkci9hZGRyZXNzLwoK
PiArCQkgKi8KPiArCQllcnJfYWRkciA9IGJyY21uYW5kX2dldF91bmNvcnJlY2NfYWRkcihjdHJs
KTsKPiArCQlpZiAoIWVycl9hZGRyKSB7Cj4gKwkJCWVycl9hZGRyID0gYnJjbW5hbmRfZ2V0X2Nv
cnJlY2NfYWRkcihjdHJsKTsKPiArCQkJaWYgKGVycl9hZGRyKQo+ICsJCQkJcmV0ID0gLUVVQ0xF
QU47Cj4gKwkJfSBlbHNlCj4gKwkJCXJldCA9IC1FQkFETVNHOwoKSSBkb24ndCBsaWtlIHZlcnkg
bXVjaCB0byBzZWUgdGhlc2UgdmFsdWVzIGJlaW5nIHVzZWQgd2l0aGluIE5BTkQKY29udHJvbGxl
ciBkcml2ZXJzIGJ1dCBJIHNlZSBpdCdzIGFscmVhZHkgdGhlIGNhdXNlLCBzbyBJIGd1ZXNzIEkg
Y2FuCmxpdmUgd2l0aCB0aGF0LgoKPiArCX0KPiArCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+
IEBAIC0yMDU4LDYgKzIwNzQsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JlYWQoc3RydWN0IG10
ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAl1NjQgZXJyX2FkZHIgPSAw
Owo+ICAJaW50IGVycjsKPiAgCWJvb2wgcmV0cnkgPSB0cnVlOwo+ICsJYm9vbCBlZHVfcmVhZCA9
IGZhbHNlOwo+ICAKPiAgCWRldl9kYmcoY3RybC0+ZGV2LCAicmVhZCAlbGx4IC0+ICVwXG4iLCAo
dW5zaWduZWQgbG9uZyBsb25nKWFkZHIsIGJ1Zik7Cj4gIAo+IEBAIC0yMDc1LDYgKzIwOTIsMTAg
QEAgc3RhdGljIGludCBicmNtbmFuZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLAo+ICAJCQllbHNlCj4gIAkJCQlyZXR1cm4gLUVJTzsKPiAgCQl9Cj4g
Kwo+ICsJCWlmIChoYXNfZWR1KGN0cmwpKQo+ICsJCQllZHVfcmVhZCA9IHRydWU7CgpZb3UgZG9u
J3QgbmVlZCB0aGlzIGV4dHJhIHZhbHVlLCB5b3UgYWxyZWFkeSBoYXZlIHRoZSBjbWQgcGFyYW1l
dGVyCndoaWNoIHRlbGxzIHlvdSBpZiBpdCBpcyBhIHJlYWQgb3IgYSB3cml0ZS4gWW91IG1pZ2h0
IGV2ZW4gd2FudCB0bwpjcmVhdGUgYSBpZiBibG9jayBzbyBzZXQgZGlyIGFuZCBlZHVfY21kIGFu
ZCBldmVudHVhbGx5IGEgbG9jYWwKZWR1X3JlYWQgaWYgeW91IHRoaW5rIGl0IHN0aWxsIG1ha2Vz
IHNlbnNlLgoKPiArCj4gIAl9IGVsc2Ugewo+ICAJCWlmIChvb2IpCj4gIAkJCW1lbXNldChvb2Is
IDB4OTksIG10ZC0+b29ic2l6ZSk7Cj4gQEAgLTIxMjIsNiArMjE0MywxMSBAQCBzdGF0aWMgaW50
IGJyY21uYW5kX3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsCj4gIAlpZiAobXRkX2lzX2JpdGZsaXAoZXJyKSkgewo+ICAJCXVuc2lnbmVkIGludCBjb3Jy
ZWN0ZWQgPSBicmNtbmFuZF9jb3VudF9jb3JyZWN0ZWQoY3RybCk7Cj4gIAo+ICsJCS8qIGluIGNh
c2Ugb2YgZWR1IGNvcnJlY3RhYmxlIGVycm9yIHdlIHJlYWQgYWdhaW4gdXNpbmcgcGlvICovCgpz
L2VkdS9FRFUvID8Kcy9waW8vUElPLwoKPiArCQlpZiAoZWR1X3JlYWQpCj4gKwkJCWVyciA9IGJy
Y21uYW5kX3JlYWRfYnlfcGlvKG10ZCwgY2hpcCwgYWRkciwgdHJhbnMsIGJ1ZiwKPiArCQkJCQkJ
ICAgb29iLCAmZXJyX2FkZHIpOwo+ICsKPiAgCQlkZXZfZGJnKGN0cmwtPmRldiwgImNvcnJlY3Rl
ZCBlcnJvciBhdCAweCVsbHhcbiIsCj4gIAkJCSh1bnNpZ25lZCBsb25nIGxvbmcpZXJyX2FkZHIp
Owo+ICAJCW10ZC0+ZWNjX3N0YXRzLmNvcnJlY3RlZCArPSBjb3JyZWN0ZWQ7CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
