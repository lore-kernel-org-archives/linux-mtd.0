Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686CD49205
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NL7pfThzq9k5Ju8sLK9DtZVCTmx66gpYJ5EFn5zsObo=; b=F1Ayxa/qMM05BA
	r8nZ8MpTTuWDhTxF63eKOAQnMh/UEKZVBCVhH5BGlcrbqNKlZrxkL4fDwteDF9MpItiKBkHap5+dT
	0KyielbpCs50C9yEHeOsehmfqi/5kcabNhh9gEB3pTzAp2Qypq66Ja020UcuLswBWcKiuMju7g/+L
	kPehC2jhPKtgemlz7Ry1VMkWq2E5+TsqybBa82InqUndP2yXB75EPdNR3fbkG/DN9QBFy2tR2PdgW
	zzjMV4B1eWRF8fX2nNdyl2jkLIVRYNnoHwJatGjxXXo+dlZbLGTVns0lhPuG8dnPPmF9Io4FgN2/W
	aiyMyEPhzpczJwuI0row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz33-000000095fr-1PGw;
	Mon, 18 Nov 2024 10:32:01 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz2x-000000095e7-26DZ
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 10:31:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2798F1BF20D;
	Mon, 18 Nov 2024 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731925912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dcC3Xe5zohmo64rpnW3zHlxj6r5J3OjyHF6/WkG0CLQ=;
	b=QOEHaYretuz+WxWtygPy9SWFMvrzZ7jl3dwGOmEQQ6Hd9xkAC8V6ltrruhj5ZLOdELTMVi
	/riB4Cx1fG9KBrXhIHMV+SFCHomIHtiudG0c+18y50pbtEyOGlc/WCIM6XEVfmN1/LX6fa
	PRMeYa9crD2M7hXN6IM5GuNzFfiuxnOHRxes8fYqkFj2je1xPHBOmSjc8dlsgwazADGT5z
	yTfEPA9lOFkP69WVtFGxW+yQYSCUWmjHvoAcAXQuDAZs62F1QlZbwHeiSALPsk5UGVxCSz
	M1spmQPNhJsIR1QHwZtGt2+0tzkoyzrGO+17QkzGx82Jl/ALTXCB9rlddsnFqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/2] mtd: spi-nand: Add read retry support
In-Reply-To: <20241114023528.181583-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Thu, 14 Nov 2024 10:35:27 +0800")
References: <20241114023528.181583-1-linchengming884@gmail.com>
	<20241114023528.181583-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:31:50 +0100
Message-ID: <87a5dw25pl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_023155_808348_49A494C0 
X-CRM114-Status: GOOD (  21.24  )
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

CkhpIENoZW5nIE1pbmcsCgpPbiAxNC8xMS8yMDI0IGF0IDEwOjM1OjI3ICswOCwgQ2hlbmcgTWlu
ZyBMaW4gPGxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBDaGVuZyBN
aW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+Cj4gV2hlbiB0aGUgaG9zdCBFQ0Mg
ZmFpbHMgdG8gY29ycmVjdCB0aGUgZGF0YSBlcnJvciBvZiBOQU5EIGRldmljZSwKPiB0aGVyZSdz
IGEgc3BlY2lhbCByZWFkIGZvciBkYXRhIHJlY292ZXJ5IG1ldGhvZCB3aGljaCBob3N0IHNldHVw
cwoKSGVyZSBpcyBhIHN1Z2dlc3Rpb24gZm9yIHJld29yZGluZyB0aGUgc2Vjb25kIHBhcnQgb2Yg
eW91ciBjb21taXQgbG9nOgoKLi4uIHdoaWNoIGNhbiBiZSBzZXR1cCBieSB0aGUgaG9zdCBmb3Ig
dGhlIG5leHQgcmVhZC4gVGhlcmUgYXJlIHNldmVyYWwKcmV0cnkgbGV2ZWxzIHRoYXQgY2FuIGJl
IGF0dGVtcHRlZCB1bnRpbCB0aGUgbG9zdCBkYXRhIGlzIHJlY292ZXJlZCBvcgpkZWZpbml0ZWx5
IGFzc3VtZWQgbG9zdC4KCj4gZm9yIHRoZSBuZXh0IHJlYWQgcmV0cnkgbW9kZSBhbmQgbWF5IHJl
Y292ZXIgdGhlIGxvc3QgZGF0YSBieSBob3N0Cj4gRUNDIGFnYWluLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiAtLS0KPiAgZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0KPiAgaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oIHwgMTQgKysrKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRk
L25hbmQvc3BpL2NvcmUuYwo+IGluZGV4IDRkNzZmOWY3MWEwZS4uYmQ1MzM5YTMwOGFhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvc3BpL2NvcmUuYwo+IEBAIC02NzIsMTAgKzY3MiwxNCBAQCBzdGF0aWMgaW50IHNwaW5h
bmRfbXRkX3JlZ3VsYXJfcGFnZV9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJv
bSwKPiAgCXN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCA9IG10ZF90b19zcGluYW5kKG10
ZCk7Cj4gIAlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBtdGRfdG9fbmFuZGRldihtdGQpOwo+
ICAJc3RydWN0IG5hbmRfaW9faXRlciBpdGVyOwo+ICsJc3RydWN0IG10ZF9lY2Nfc3RhdHMgb2xk
X3N0YXRzOwoKUmV2ZXJzZSBjaHJpc3RtYXMgdHJlZSBpcyBuaWNlciA6KQoKPiAgCWJvb2wgZGlz
YWJsZV9lY2MgPSBmYWxzZTsKPiAgCWJvb2wgZWNjX2ZhaWxlZCA9IGZhbHNlOwo+ICsJdW5zaWdu
ZWQgaW50IHJldHJ5X21vZGUgPSAwOwo+ICAJaW50IHJldDsKPiAgCj4gKwlvbGRfc3RhdHMgPSBt
dGQtPmVjY19zdGF0czsKPiArCj4gIAlpZiAob3BzLT5tb2RlID09IE1URF9PUFNfUkFXIHx8ICFt
dGQtPm9vYmxheW91dCkKPiAgCQlkaXNhYmxlX2VjYyA9IHRydWU7Cj4gIAo+IEBAIC02ODcsMTgg
KzY5MSw0MyBAQCBzdGF0aWMgaW50IHNwaW5hbmRfbXRkX3JlZ3VsYXJfcGFnZV9yZWFkKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwKPiAgCQlpZiAocmV0KQo+ICAJCQlicmVhazsK
PiAgCj4gK3JlYWRfcmV0cnk6Cj4gIAkJcmV0ID0gc3BpbmFuZF9yZWFkX3BhZ2Uoc3BpbmFuZCwg
Jml0ZXIucmVxKTsKPiAgCQlpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVCQURNU0cpCj4gIAkJCWJy
ZWFrOwo+ICAKPiAtCQlpZiAocmV0ID09IC1FQkFETVNHKQo+ICsJCWlmIChyZXQgPT0gLUVCQURN
U0cgJiYgc3BpbmFuZC0+c2V0X3JlYWRfcmV0cnkpIHsKPiArCQkJaWYgKHNwaW5hbmQtPnJlYWRf
cmV0cmllcyAmJiAoKytyZXRyeV9tb2RlIDwgc3BpbmFuZC0+cmVhZF9yZXRyaWVzKSkgewo+ICsJ
CQkJcmV0ID0gc3BpbmFuZC0+c2V0X3JlYWRfcmV0cnkoc3BpbmFuZCwgcmV0cnlfbW9kZSk7Cj4g
KwkJCQlpZiAocmV0IDwgMCkgewo+ICsJCQkJCWVjY19mYWlsZWQgPSB0cnVlOwo+ICsJCQkJCWJy
ZWFrOwoKV2hhdCBpcyB0aGlzIGJyZWFrIGdvbm5hIGRvPyBZb3UncmUgbm90IGluIGEgbG9vcC4g
SSBkb24ndCB0aGluayBicmVha3MKaGF2ZSBhbnkgZWZmZWN0IG9uIGlmIGJsb2Nrcy4KCj4gKwkJ
CQl9Cj4gKwo+ICsJCQkJLyogUmVzZXQgZWNjX3N0YXRzOyByZXRyeSAqLwo+ICsJCQkJbXRkLT5l
Y2Nfc3RhdHMgPSBvbGRfc3RhdHM7Cj4gKwkJCQlnb3RvIHJlYWRfcmV0cnk7Cj4gKwkJCX0gZWxz
ZSB7Cj4gKwkJCQkvKiBObyBtb3JlIHJldHJ5IG1vZGVzOyByZWFsIGZhaWx1cmUgKi8KPiArCQkJ
CWVjY19mYWlsZWQgPSB0cnVlOwo+ICsJCQl9Cj4gKwkJfSBlbHNlIGlmIChyZXQgPT0gLUVCQURN
U0cpIHsKPiAgCQkJZWNjX2ZhaWxlZCA9IHRydWU7Cj4gLQkJZWxzZQo+ICsJCX0gZWxzZSB7Cj4g
IAkJCSptYXhfYml0ZmxpcHMgPSBtYXhfdCh1bnNpZ25lZCBpbnQsICptYXhfYml0ZmxpcHMsIHJl
dCk7Cj4gKwkJfQo+ICAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
