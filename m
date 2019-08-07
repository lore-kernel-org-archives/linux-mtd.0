Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673CFC433FF
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 09:51:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2B1222FC
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 09:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+uvzJvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A2B1222FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSrXO1mNVhh/DhL72D8ACSh8ZrND+N4X3zVCD74BuMw=; b=P+uvzJvsNTNmwe
	vfU7eUNOoM869rjdJY5BwLNDU05nzkNa56evp900cEHiE/+TQYiN0XrpV1ZrdhRR7yZ+yKLnQiHVi
	Z5Wb8/JiX9HWAzVrHFvwDBOerz96iV9I09IjzC7qzjX9pualWobp30OaulnyCOYAG3Pv9wgnTEpMi
	8gMRgFa86yGfAU6yDRfE0w/D1240M2th8EOGml13HPueWRelCFcnc5dDbmsJbC6lM7Cq6J0zzje5g
	1mqDOLcp6G45s8iypotOog8sJWiMOudPQFDfP1swQtAyKY5SWtJ6uaJUg2L16mttjaMR0mi5szHZB
	qNMWmVCnmGFcE6qQXsrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvIbX-0004AD-LR; Wed, 07 Aug 2019 09:51:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvIbU-00049N-4t
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 09:51:33 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 83D3D200009;
 Wed,  7 Aug 2019 09:51:25 +0000 (UTC)
Date: Wed, 7 Aug 2019 11:51:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 5/8] mtd: spinand: micron: prepare for generalizing driver
Message-ID: <20190807115124.2f4f5d8e@xps13>
In-Reply-To: <20190722055621.23526-6-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-6-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_025132_505270_50F564D4 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDIyIEp1
bCAyMDE5IDA3OjU2OjE4ICswMjAwOgoKPiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAKCiJtdGQ6IHNwaW5hbmQ6IG1pY3JvbjogUmVuYW1lIGhl
bHBlcnMgYW5kIHN0cnVjdHVyZXMgdG8gYmUgbW9yZSBnZW5lcmljIgoKPiBHZW5lcmFsaXplIE9P
QiBsYXlvdXQgc3RydWN0dXJlIGFuZCBmdW5jdGlvbiBuYW1lcy4KCkNoYW5nZSB0aGUgcHJlZml4
IG9mIE1pY3JvbiBkcml2ZXIncyBmdW5jdGlvbnMgYW5kIHN0cnVjdHVyZXMgYmVmb3JlCnN1cHBv
cnRpbmcgbW9yZSBjaGlwczogcy9tdDI5ZjJnMDFhYmFnZC9taWNyb24vCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFNoaXZhbXVydGh5IFNoYXN0cmkgPHNzaGl2YW11cnRoeUBtaWNyb24uY29tPgo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYyB8IDI4ICsrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYyBi
L2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gaW5kZXggN2Q3YjFmN2ZjZjcxLi45NWJj
NTI2NGViYzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+IEBAIC0zNCwzOCArMzQsMzggQEAg
c3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFModXBkYXRlX2NhY2hlX3ZhcmlhbnRzLAo+ICAJCVNQ
SU5BTkRfUFJPR19MT0FEX1g0KGZhbHNlLCAwLCBOVUxMLCAwKSwKPiAgCQlTUElOQU5EX1BST0df
TE9BRChmYWxzZSwgMCwgTlVMTCwgMCkpOwo+ICAKPiAtc3RhdGljIGludCBtdDI5ZjJnMDFhYmFn
ZF9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiAtCQkJ
CQlzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKnJlZ2lvbikKPiArc3RhdGljIGludCBtaWNyb25fb29i
bGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gKwkJCQlzdHJ1
Y3QgbXRkX29vYl9yZWdpb24gKnJlZ2lvbikKPiAgewo+ICAJaWYgKHNlY3Rpb24pCj4gIAkJcmV0
dXJuIC1FUkFOR0U7Cj4gIAo+IC0JcmVnaW9uLT5vZmZzZXQgPSA2NDsKPiAtCXJlZ2lvbi0+bGVu
Z3RoID0gNjQ7Cj4gKwlyZWdpb24tPm9mZnNldCA9IG10ZC0+b29ic2l6ZSAvIDI7Cj4gKwlyZWdp
b24tPmxlbmd0aCA9IG10ZC0+b29ic2l6ZSAvIDI7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAg
Cj4gLXN0YXRpYyBpbnQgbXQyOWYyZzAxYWJhZ2Rfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9p
bmZvICptdGQsIGludCBzZWN0aW9uLAo+IC0JCQkJCSBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKnJl
Z2lvbikKPiArc3RhdGljIGludCBtaWNyb25fb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZv
ICptdGQsIGludCBzZWN0aW9uLAo+ICsJCQkJIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9u
KQo+ICB7Cj4gIAlpZiAoc2VjdGlvbikKPiAgCQlyZXR1cm4gLUVSQU5HRTsKPiAgCj4gIAkvKiBS
ZXNlcnZlIDIgYnl0ZXMgZm9yIHRoZSBCQk0uICovCj4gIAlyZWdpb24tPm9mZnNldCA9IDI7Cj4g
LQlyZWdpb24tPmxlbmd0aCA9IDYyOwo+ICsJcmVnaW9uLT5sZW5ndGggPSAobXRkLT5vb2JzaXpl
IC8gMikgLSAyOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3Ry
dWN0IG10ZF9vb2JsYXlvdXRfb3BzIG10MjlmMmcwMWFiYWdkX29vYmxheW91dCA9IHsKPiAtCS5l
Y2MgPSBtdDI5ZjJnMDFhYmFnZF9vb2JsYXlvdXRfZWNjLAo+IC0JLmZyZWUgPSBtdDI5ZjJnMDFh
YmFnZF9vb2JsYXlvdXRfZnJlZSwKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0
X29wcyBtaWNyb25fb29ibGF5b3V0X29wcyA9IHsKPiArCS5lY2MgPSBtaWNyb25fb29ibGF5b3V0
X2VjYywKPiArCS5mcmVlID0gbWljcm9uX29vYmxheW91dF9mcmVlLAo+ICB9Owo+ICAKPiAtc3Rh
dGljIGludCBtdDI5ZjJnMDFhYmFnZF9lY2NfZ2V0X3N0YXR1cyhzdHJ1Y3Qgc3BpbmFuZF9kZXZp
Y2UgKnNwaW5hbmQsCj4gLQkJCQkJIHU4IHN0YXR1cykKPiArc3RhdGljIGludCBtaWNyb25fZWNj
X2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICsJCQkJIHU4IHN0
YXR1cykKPiAgewo+ICAJc3dpdGNoIChzdGF0dXMgJiBNSUNST05fU1RBVFVTX0VDQ19NQVNLKSB7
Cj4gIAljYXNlIFNUQVRVU19FQ0NfTk9fQklURkxJUFM6Cj4gQEAgLTk4LDggKzk4LDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX2luZm8gbWljcm9uX3NwaW5hbmRfdGFibGVbXSA9IHsK
PiAgCQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gIAkJCQkJICAgICAgJnVwZGF0
ZV9jYWNoZV92YXJpYW50cyksCj4gIAkJICAgICAwLAo+IC0JCSAgICAgU1BJTkFORF9FQ0NJTkZP
KCZtdDI5ZjJnMDFhYmFnZF9vb2JsYXlvdXQsCj4gLQkJCQkgICAgIG10MjlmMmcwMWFiYWdkX2Vj
Y19nZXRfc3RhdHVzKSksCj4gKwkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl9vb2JsYXlv
dXRfb3BzLAo+ICsJCQkJICAgICBtaWNyb25fZWNjX2dldF9zdGF0dXMpKSwKPiAgfTsKPiAgCj4g
IHN0YXRpYyBpbnQgbWljcm9uX3NwaW5hbmRfZGV0ZWN0KHN0cnVjdCBzcGluYW5kX2RldmljZSAq
c3BpbmFuZCkKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
