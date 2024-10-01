Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB37CE7CE7
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iPMC4qUcroB1mYBH1RRGSrkzgy/im2QZ1zUuBUoR1g=; b=MphJ9IOedImpop
	uDnBXvCYjGTFM5ACvbzZkdVNUyJ8Yn1Xe+R++lGo6knSTlRckwC3sMcsB+PKZBxOORQWTi8dcvfu9
	vkeNSiCo9KCiPk9Ht7xvQH+rnAn/fKZM5HGWBWUJ7v31jR4Mo9ZmdqUHuB29n06UBytFC/bYGwUDk
	vAiDXXPZQYJZLbFePCYmyWUR4EPY8OZkini9too8s+rSRdNu1agqtzjh0q7df+uXfgxj36fKK24O+
	kAke9Qs/7g1XRNNID6BSvESFSmRJqCLH2zbv5bU8ySqkPIckBof0cRlN+aKBTOz4VLCS6pzBdj/5Y
	/yCqhCC/JGulkeIllCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svYwH-00000002C9p-2fKF;
	Tue, 01 Oct 2024 09:13:01 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svYwE-00000002C7Y-06a5
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 09:12:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB4071BF205;
	Tue,  1 Oct 2024 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727773975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wn4FBOVtHOoxAtUICQyZujz1f15qkDm2lLUyaK/WqGk=;
	b=BsKBmYJ3IAN4SuRjTFNUfEwnvmTqwxiYMP2mlNx7HNBHVM80w/cCjWCFwRutyQEbvpwaIC
	D2hpIseVuxJsq7UPz6pTbA2aceak78mLDsOK2AucjiVEsWsBvvZKOoZCudf0npf7/btGpY
	ljEu1JyLLJ3mlTLCwSlXNeQSGVhz46RG57uNkROETI1iea7KNbRsdea4Qp+85BT8tHERvG
	0DRkTQhh7B2MG9v3ktXNd5v1zOMvBZ60Q+SyaoP6dSQgiT0DFn0BCcDUZrPOS3hubXQPAc
	JuPxPFkcLdL7zUzE58RUkscI+YF/pvXqNQc8UitQN15hJ83/GqsNRcI8FDEzWQ==
Date: Tue, 1 Oct 2024 11:12:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Michael Walle <michael@walle.cc>, "Mark Brown" <broonie@kernel.org>,
 Chia-Lin Kao <acelan.kao@canonical.com>, "Md Sadre Alam"
 <quic_mdalam@quicinc.com>, Ezra Buehler <ezra.buehler@husqvarnagroup.com>,
 Sridharan S N <quic_sridsn@quicinc.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Alexey Romanov
 <avromanov@salutedevices.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@salutedevices.com>
Subject: Re: [PATCH v2 1/5] mtd: spinand: make spinand_{read,write}_page
 global
Message-ID: <20241001111249.43d20f5d@xps-13>
In-Reply-To: <20240827174920.316756-2-mmkurbanov@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
	<20240827174920.316756-2-mmkurbanov@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_021258_493352_6CBFF843 
X-CRM114-Status: GOOD (  16.78  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUdWUsIDI3
IEF1ZyAyMDI0IDIwOjQ4OjU5ICswMzAwOgoKPiBDaGFuZ2UgdGhlc2UgZnVuY3Rpb25zIGZyb20g
c3RhdGljIHRvIGdsb2JhbCBzbyB0aGF0IHRvIHVzZSB0aGVtIGxhdGVyCj4gaW4gT1RQIG9wZXJh
dGlvbnMuIFNpbmNlIHJlYWRpbmcgT1RQIHBhZ2VzIGlzIG5vIGRpZmZlcmVudCBmcm9tIHJlYWRp
bmcKPiBwYWdlcyBmcm9tIHRoZSBtYWluIGFyZWEuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGlu
IEt1cmJhbm92IDxtbWt1cmJhbm92QHNhbHV0ZWRldmljZXMuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L210ZC9uYW5kL3NwaS9jb3JlLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgaW5j
bHVkZS9saW51eC9tdGQvc3BpbmFuZC5oIHwgIDYgKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MjYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gaW5k
ZXggZTBiNjcxNWU1ZGZlZC4uODA3YzI0YjBjN2M0ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBA
QCAtNTY2LDggKzU2NiwxNiBAQCBzdGF0aWMgaW50IHNwaW5hbmRfbG9ja19ibG9jayhzdHJ1Y3Qg
c3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIHU4IGxvY2spCj4gIAlyZXR1cm4gc3BpbmFuZF93cml0
ZV9yZWdfb3Aoc3BpbmFuZCwgUkVHX0JMT0NLX0xPQ0ssIGxvY2spOwo+ICB9Cj4gIAo+IC1zdGF0
aWMgaW50IHNwaW5hbmRfcmVhZF9wYWdlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwK
PiAtCQkJICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9wYWdlX2lvX3JlcSAqcmVxKQo+ICsvKioKPiAr
ICogc3BpbmFuZF9yZWFkX3BhZ2UoKSAtIFJlYWQgdGhlIHBhZ2UKCgkJCQkgYSBwYWdlPyAoc2Ft
ZSBiZWxvdykKCj4gKyAqIEBzcGluYW5kOiB0aGUgc3BpbmFuZCBkZXZpY2UKPiArICogQHJlcTog
dGhlIEkvTyByZXF1ZXN0Cj4gKyAqCj4gKyAqIFJldHVybjogMCBvciBhIHBvc2l0aXZlIG51bWJl
ciBvZiBiaXRmbGlwcyBjb3JyZWN0ZWQgb24gc3VjY2Vzcy4KPiArICogQSBuZWdhdGl2ZSBlcnJv
ciBjb2RlIG90aGVyd2lzZS4KPiArICovCj4gK2ludCBzcGluYW5kX3JlYWRfcGFnZShzdHJ1Y3Qg
c3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gKwkJICAgICAgY29uc3Qgc3RydWN0IG5hbmRfcGFn
ZV9pb19yZXEgKnJlcSkKPiAgewo+ICAJc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kID0gc3BpbmFu
ZF90b19uYW5kKHNwaW5hbmQpOwo+ICAJdTggc3RhdHVzOwo+IEBAIC01OTcsOCArNjA1LDE2IEBA
IHN0YXRpYyBpbnQgc3BpbmFuZF9yZWFkX3BhZ2Uoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kLAo+ICAJcmV0dXJuIG5hbmRfZWNjX2ZpbmlzaF9pb19yZXEobmFuZCwgKHN0cnVjdCBuYW5k
X3BhZ2VfaW9fcmVxICopcmVxKTsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBzcGluYW5kX3dyaXRl
X3BhZ2Uoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+IC0JCQkgICAgICBjb25zdCBz
dHJ1Y3QgbmFuZF9wYWdlX2lvX3JlcSAqcmVxKQo+ICsvKioKPiArICogc3BpbmFuZF93cml0ZV9w
YWdlKCkgLSBXcml0ZSB0aGUgcGFnZQo+ICsgKiBAc3BpbmFuZDogdGhlIHNwaW5hbmQgZGV2aWNl
Cj4gKyAqIEByZXE6IHRoZSBJL08gcmVxdWVzdAo+ICsgKgo+ICsgKiBSZXR1cm46IDAgb3IgYSBw
b3NpdGl2ZSBudW1iZXIgb2YgYml0ZmxpcHMgY29ycmVjdGVkIG9uIHN1Y2Nlc3MuCj4gKyAqIEEg
bmVnYXRpdmUgZXJyb3IgY29kZSBvdGhlcndpc2UuCj4gKyAqLwo+ICtpbnQgc3BpbmFuZF93cml0
ZV9wYWdlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiArCQkgICAgICAgY29uc3Qg
c3RydWN0IG5hbmRfcGFnZV9pb19yZXEgKnJlcSkKPiAgewo+ICAJc3RydWN0IG5hbmRfZGV2aWNl
ICpuYW5kID0gc3BpbmFuZF90b19uYW5kKHNwaW5hbmQpOwo+ICAJdTggc3RhdHVzOwo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9z
cGluYW5kLmgKPiBpbmRleCA1YzE5ZWFkNjA0OTk2Li41NTU4NDY1MTdmYWY2IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRk
L3NwaW5hbmQuaAo+IEBAIC01MTksNCArNTE5LDEwIEBAIGludCBzcGluYW5kX21hdGNoX2FuZF9p
bml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgaW50IHNwaW5hbmRfdXBkX2Nm
ZyhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIHU4IG1hc2ssIHU4IHZhbCk7Cj4gIGlu
dCBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCB1
bnNpZ25lZCBpbnQgdGFyZ2V0KTsKPiAgCj4gK2ludCBzcGluYW5kX3JlYWRfcGFnZShzdHJ1Y3Qg
c3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gKwkJICAgICAgY29uc3Qgc3RydWN0IG5hbmRfcGFn
ZV9pb19yZXEgKnJlcSk7Cj4gKwo+ICtpbnQgc3BpbmFuZF93cml0ZV9wYWdlKHN0cnVjdCBzcGlu
YW5kX2RldmljZSAqc3BpbmFuZCwKPiArCQkgICAgICAgY29uc3Qgc3RydWN0IG5hbmRfcGFnZV9p
b19yZXEgKnJlcSk7Cj4gKwo+ICAjZW5kaWYgLyogX19MSU5VWF9NVERfU1BJTkFORF9IICovCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
