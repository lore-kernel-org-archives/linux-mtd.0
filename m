Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6465C4332B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 17:20:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBE420709
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 17:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cu8RXrZK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBBE420709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqaixLtQrAj6pZJ5tEB7+9AN6rR9hns7I6EIgxxuERw=; b=Cu8RXrZK6JvCIw
	//Db/c78pv2TFwdiqL/IOxEfUL9Gip8+pehHzhjAQB5qSM1DWZmk3R8eSY97dUNrrfs/TqrBKq0X6
	o24oIjvzovDR28Ke5KIha0YqRkaRtCzua2kYOAEOpYWnpmSJw3CGR2+vwd7dE6Q+QaUFHlhUQ2BAx
	T0YtiKG6PJeMSICf3IG6ZaMdV+1B60FLRT8jJi5IWYp9XuFQBHLP+Gg18KpsJPHps4tXNH4rQUOar
	HIzzq8MRi/k2vLMNfx3DE1oyW7uJoXku44jre7PdQpvFusp6xroctMe6Bq7QUNrob1z4fLAMKxoi2
	D0Ijay+ZLqtQ7VzdWQDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFLJb-0008Lj-8L; Fri, 20 Mar 2020 17:20:11 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFLJY-0007gh-SM
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2020 17:20:10 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CD39D20010;
 Fri, 20 Mar 2020 17:20:03 +0000 (UTC)
Date: Fri, 20 Mar 2020 18:20:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: Re: [PATCH v3] mtd: rawnand: toshiba: Support actual bitflips for
 BENAND (Built-in ECC NAND)
Message-ID: <20200320182002.4573fa61@xps13>
In-Reply-To: <1583907583-5967-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
References: <1583907583-5967-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_102009_195604_ABFCD585 
X-CRM114-Status: GOOD (  17.62  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29t
PiB3cm90ZSBvbiBXZWQsIDExIE1hcgoyMDIwIDE1OjE5OjQzICswOTAwOgoKClRoZSB0aXRsZSBp
cyBtaXNsZWFkaW5nLCB3b3VsZCBpdCBiZSBiZXR0ZXI6CgoJIlN1cHBvcnQgcmVhZGluZyB0aGUg
bnVtYmVyIG9mIGJpdGZsaXBzIiAKCj4gQWRkIHN1cHBvcnQgdmVuZG9yIHNwZWNpZmljIGNvbW1h
bmRzIGZvciBLSU9YSUEgQ09SUE9SQVRJT04gQkVOQU5ELgo+IFRoZSBhY3R1YWwgYml0ZmxpcHMg
bnVtYmVyIGNhbiBiZSBnZXQgYnkgdGhpcyBjb21tYW5kLgoKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0cmlldmVkPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaW8gRnVy
dXlhbWEgPHl0Yy1tYi15ZnVydXlhbWE3QGtpb3hpYS5jb20+Cj4gLS0tCj4gY2hhbmdlbG9nW3Yz
XTpUZXN0ZWQgdmVyc2lvbi4KPiBvcmlnaW5hbCBwYXRjaDoiW1JGQyx2Ml0gbXRkOiBuYW5kOiB0
b3NoaWJhOiBBZGQgc3VwcG9ydCBmb3IgLT5leGVjX29wKCkiLgo+IAo+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX3Rvc2hpYmEuYyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfdG9zaGliYS5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF90b3NoaWJhLmMKPiBpbmRleCA5YzAzZmJiLi4x
MGZjZmJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfdG9zaGliYS5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF90b3NoaWJhLmMKPiBAQCAtMTQsMTQg
KzE0LDY1IEBACj4gIC8qIFJlY29tbWVuZGVkIHRvIHJld3JpdGUgZm9yIEJFTkFORCAqLwo+ICAj
ZGVmaW5lIFRPU0hJQkFfTkFORF9TVEFUVVNfUkVXUklURV9SRUNPTU1FTkRFRAlCSVQoMykKPiAg
Cj4gKy8qIEVDQyBTdGF0dXMgUmVhZCBDb21tYW5kIGZvciBCRU5BTkQgKi8KPiArI2RlZmluZSBU
T1NISUJBX05BTkRfQ01EX0VDQ19TVEFUVVNfUkVBRAkweDdBCj4gKwo+ICsvKiBFQ0MgU3RhdHVz
IE1hc2sgZm9yIEJFTkFORCAqLwo+ICsjZGVmaW5lIFRPU0hJQkFfTkFORF9FQ0NfU1RBVFVTX01B
U0sJCTB4MEYKPiArCj4gKy8qIFVuY29ycmVjdGFibGUgRXJyb3IgZm9yIEJFTkFORCAqLwo+ICsj
ZGVmaW5lIFRPU0hJQkFfTkFORF9FQ0NfU1RBVFVTX1VOQ09SUgkJMHgwRgo+ICsKPiArc3RhdGlj
IGludCB0b3NoaWJhX25hbmRfYmVuYW5kX3JlYWRfZWNjc3RhdHVzX29wKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsCj4gKwkJCQkJCSB1OCAqYnVmKQo+ICt7Cj4gKwl1OCAqZWNjX3N0YXR1cyA9IGJ1
ZjsKPiArCj4gKwlpZiAobmFuZF9oYXNfZXhlY19vcChjaGlwKSkgewo+ICsJCWNvbnN0IHN0cnVj
dCBuYW5kX3Nkcl90aW1pbmdzICpzZHIgPQo+ICsJCQluYW5kX2dldF9zZHJfdGltaW5ncygmY2hp
cC0+ZGF0YV9pbnRlcmZhY2UpOwo+ICsJCXN0cnVjdCBuYW5kX29wX2luc3RyIGluc3Ryc1tdID0g
ewo+ICsJCQlOQU5EX09QX0NNRChUT1NISUJBX05BTkRfQ01EX0VDQ19TVEFUVVNfUkVBRCwKPiAr
CQkJCSAgICBQU0VDX1RPX05TRUMoc2RyLT50QURMX21pbikpLAo+ICsJCQlOQU5EX09QXzhCSVRf
REFUQV9JTihjaGlwLT5lY2Muc3RlcHMsIGVjY19zdGF0dXMsIDApLAo+ICsJCX07Cj4gKwkJc3Ry
dWN0IG5hbmRfb3BlcmF0aW9uIG9wID0gTkFORF9PUEVSQVRJT04oY2hpcC0+Y3VyX2NzLCBpbnN0
cnMpOwo+ICsKPiArCQlyZXR1cm4gbmFuZF9leGVjX29wKGNoaXAsICZvcCk7Cj4gKwl9Cj4gKwo+
ICsJcmV0dXJuIC1FTk9UU1VQUDsKPiArfQo+ICsKPiAgc3RhdGljIGludCB0b3NoaWJhX25hbmRf
YmVuYW5kX2VjY3N0YXR1cyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICB7Cj4gIAlzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+ICAJaW50IHJldDsKPiAgCXVuc2ln
bmVkIGludCBtYXhfYml0ZmxpcHMgPSAwOwo+IC0JdTggc3RhdHVzOwo+ICsJdTggc3RhdHVzLCBl
Y2Nfc3RhdHVzWzhdOwoKU2hhbGwgd2UgZGVmaW5lIHRoaXMgICAgICAgICAgXiA/Ckl0IGlzIHN0
cmFuZ2UgdG8gaGF2ZSB0aGUgbnVtYmVyIG9mIHN0ZXBzIGhhcmRjb2RlZCB0aGlzIHdheS4KCj4g
IAo+ICAJLyogQ2hlY2sgU3RhdHVzICovCj4gKwlyZXQgPSB0b3NoaWJhX25hbmRfYmVuYW5kX3Jl
YWRfZWNjc3RhdHVzX29wKGNoaXAsIGVjY19zdGF0dXMpOwo+ICsJaWYgKCFyZXQpIHsKPiArCQl1
bnNpZ25lZCBpbnQgaSwgYml0ZmxpcHMgPSAwOwo+ICsKPiArCQlmb3IgKGkgPSAwOyBpIDwgY2hp
cC0+ZWNjLnN0ZXBzOyBpKyspIHsKPiArCQkJYml0ZmxpcHMgPSBlY2Nfc3RhdHVzW2ldICYgVE9T
SElCQV9OQU5EX0VDQ19TVEFUVVNfTUFTSzsKPiArCQkJaWYgKGJpdGZsaXBzID09IFRPU0hJQkFf
TkFORF9FQ0NfU1RBVFVTX1VOQ09SUikgewo+ICsJCQkJbXRkLT5lY2Nfc3RhdHMuZmFpbGVkKys7
Cj4gKwkJCX0gZWxzZSB7Cj4gKwkJCQltdGQtPmVjY19zdGF0cy5jb3JyZWN0ZWQgKz0gYml0Zmxp
cHM7Cj4gKwkJCQltYXhfYml0ZmxpcHMgPSBtYXgobWF4X2JpdGZsaXBzLCBiaXRmbGlwcyk7Cj4g
KwkJCX0KPiArCQl9Cj4gKwo+ICsJCXJldHVybiBtYXhfYml0ZmxpcHM7Cj4gKwl9Cj4gKwo+ICsJ
LyoKPiArCSAqIEZhbGxiYWNrIHRvIHJlZ3VsYXIgc3RhdHVzIGNoZWNrIGlmCj4gKwkgKiB0b3No
aWJhX25hbmRfYmVuYW5kX3JlYWRfZWNjc3RhdHVzX29wKCkgZmFpbGVkLgo+ICsJICovCj4gIAly
ZXQgPSBuYW5kX3N0YXR1c19vcChjaGlwLCAmc3RhdHVzKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0
dXJuIHJldDsKPiBAQCAtMTA4LDcgKzE1OSw3IEBAIHN0YXRpYyB2b2lkIHRvc2hpYmFfbmFuZF9k
ZWNvZGVfaWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCSAqLwo+ICAJaWYgKGNoaXAtPmlk
LmxlbiA+PSA2ICYmIG5hbmRfaXNfc2xjKGNoaXApICYmCj4gIAkgICAgKGNoaXAtPmlkLmRhdGFb
NV0gJiAweDcpID09IDB4NiAvKiAyNG5tICovICYmCj4gLQkgICAgIShjaGlwLT5pZC5kYXRhWzRd
ICYgMHg4MCkgLyogIUJFTkFORCAqLykgewo+ICsJICAgICEoY2hpcC0+aWQuZGF0YVs0XSAmIFRP
U0hJQkFfTkFORF9JRDRfSVNfQkVOQU5EKSAvKiAhQkVOQU5EICovKSB7Cj4gIAkJbWVtb3JnLT5v
b2JzaXplID0gMzIgKiBtZW1vcmctPnBhZ2VzaXplID4+IDk7Cj4gIAkJbXRkLT5vb2JzaXplID0g
bWVtb3JnLT5vb2JzaXplOwo+ICAJfQoKTG9va3MgZmluZSBvdGhlcndpc2UuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
