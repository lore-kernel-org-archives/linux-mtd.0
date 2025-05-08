Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C46C3ABC6
	for <linux-mtd@archiver.kernel.org>; Thu,  8 May 2025 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Klv58d1IPh0nbcTjwFdHw4LTnX6PYmLfcu1Wp9iL4xM=; b=OFXs045bVz5AtB
	idgABw0fL+oJrSDwjCugmLPwpR8N6KlV96GffoWL7ERcTWVw0p1FuoEUiISRTx9WzbEw8vL6SMYUw
	ABn64ALfAGsLhbXIyHe5Ngp8xiHPBW3KnhJCHHIdroAyTeKda+TUGoGA0v9mNeu4nhPWM0xqDeusx
	FA08uq8rDkitzQqnKvK6sfk9im2u1U/EK01kthbzqNhDeA+/oFD7og4T5iYyIRjeG4T35lqIYuQCC
	VBICAkc2PzPlnxFmAJrebMx4CuF6UmTP+ve61lchIkTKVE8/K7qIe/oXM8QpOeSqqZiN6qW9tSQZH
	Ap+DZw8g6JNHwz1wH9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6G8-00000001aJY-0W0q;
	Thu, 08 May 2025 18:46:16 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD69S-00000001ZGh-2fqU
	for linux-mtd@lists.infradead.org;
	Thu, 08 May 2025 18:39:24 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 3659FA0780;
	Thu,  8 May 2025 20:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=6nb2cCPK5LUfQe9tE52LNNxXl3+TZ5aWJppwBidSKUA=; b=
	qSdAdYpDUUJNE/vqy7gs09hYUg+hlZLscu8jMLH6KwUNPl8489698KT8re2qw0fU
	PUYCSdbLf1oOPuYT3Sfnnw8TUrkymiPVgejF0lyLesiop5hN0yXyaNczzmBdxhLz
	DwpLsSmdEPIi/wnALPMQHJ+3sWpTQxbj/4afJvt6UMpWpR88+T72t/Qj/0feuuox
	GyiL3mBnguzFcn4yBHlVYN0VhE0JWo0aBtvHICfg9jk9BUrh3drYOaN0L+qc5+kB
	JsRSlF8APf3nAsdn6NVpIqghzRnGopKqGWN+3WUAeIi+QXZouAhbQx9l8nTBEis8
	0xsRlRYc6F8041gj6HDwEWZLPrvlxplUs/zPbum5J9Uug4Yl64gCUcE/WqkTEIOu
	CI2682NuBrzxBM6GYoGdblDOgB9O+f6UKDvavw2m3zf2hCwtVhhkmR0OYSH453oe
	8i2sEKZym2SobQEzFW9tdl2fEkQNigR5DklJkStMKlK5xKTefIDO6NI/Gm5j3oro
	7pBMB/ETbNu6ygRPSmRbKNIfOMkLdgovgzSa/iPvDXCAQnNX7HqLntZauxNPuxJB
	uV0a6RgEhJ3mPxa75Ck1MEqWkDEqAZPr3ZwgREOTXeXRUS8FQmsTjFj780YRPv6B
	1RQiQBOwlk+KhQOClGo+K74mczSnVGh5AWUpkX76MEc=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Michael
 Walle" <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2] mtd: Verify written data in paranoid mode
Date: Thu, 8 May 2025 20:37:34 +0200
Message-ID: <20250508183733.514124-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1746729557;VERSION=7990;MC=2616487500;ID=244882;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853667D62
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_113923_136427_CBC1AD78 
X-CRM114-Status: GOOD (  16.65  )
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

RnJvbTogQ3PDs2vDoXMsIEJlbmNlIDxjc29rYXMuYmVuY2VAcHJvbGFuLmh1PgoKQWRkIE1URF9Q
QVJBTk9JRCBjb25maWcgb3B0aW9uIGZvciB2ZXJpZnlpbmcgYWxsIHdyaXR0ZW4gZGF0YSB0byBw
cmV2ZW50CnNpbGVudCBiaXQgZXJyb3JzIGJlaW5nIHVuZGV0ZWN0ZWQsIGF0IHRoZSBjb3N0IG9m
IHNvbWUgYmFuZHdpZHRoIG92ZXJoZWFkLgoKU2lnbmVkLW9mZi1ieTogQ3PDs2vDoXMsIEJlbmNl
IDxjc29rYXMuYmVuY2VAcHJvbGFuLmh1PgotLS0KCk5vdGVzOgogICAgQ2hhbmdlcyBpbiB2MjoK
ICAgICogcmVmYWN0b3IgdG8gYmUgaW4gbXRkY29yZSBpbnN0ZWFkIG9mIHNwaS1ub3IgY29yZQoK
IGRyaXZlcnMvbXRkL0tjb25maWcgICB8IDE0ICsrKysrKysrKysrKwogZHJpdmVycy9tdGQvbXRk
Y29yZS5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL0tjb25maWcgYi9kcml2ZXJzL210ZC9LY29uZmlnCmluZGV4IDc5
NmEyZWNjYmVmMC4uZTc1ZjRhNTdkZjZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9LY29uZmln
CisrKyBiL2RyaXZlcnMvbXRkL0tjb25maWcKQEAgLTIwNiw2ICsyMDYsMjAgQEAgY29uZmlnIE1U
RF9QQVJUSVRJT05FRF9NQVNURVIKIAkgIHRoZSBwYXJlbnQgb2YgdGhlIHBhcnRpdGlvbiBkZXZp
Y2UgYmUgdGhlIG1hc3RlciBkZXZpY2UsIHJhdGhlciB0aGFuCiAJICB3aGF0IGxpZXMgYmVoaW5k
IHRoZSBtYXN0ZXIuCiAKK2NvbmZpZyBNVERfUEFSQU5PSUQKKwlib29sICJSZWFkIGJhY2sgd3Jp
dHRlbiBkYXRhIChwYXJhbm9pZCBtb2RlKSIKKwloZWxwCisJICBUaGlzIG9wdGlvbiBtYWtlcyB0
aGUgTVREIGNvcmUgcmVhZCBiYWNrIGFsbCBkYXRhIG9uIGEgd3JpdGUgYW5kCisJICByZXBvcnQg
YW4gZXJyb3IgaWYgaXQgZG9lc24ndCBtYXRjaCB0aGUgd3JpdHRlbiBkYXRhLiBUaGlzIGNhbgor
CSAgc2FmZWd1YXJkIGFnYWluc3Qgc2lsZW50IGJpdCBlcnJvcnMgcmVzdWx0aW5nIGZyb20gYSBm
YXVsdHkgRmxhc2gsCisJICBjb250cm9sbGVyIG9kZGl0aWVzLCBidXMgbm9pc2UgZXRjLgorCisJ
ICBJdCBpcyB1cCB0byB0aGUgbGF5ZXIgYWJvdmUgTVREIChlLmcuIHRoZSBmaWxlc3lzdGVtKSB0
byBoYW5kbGUKKwkgIHRoaXMgY29uZGl0aW9uLCBmb3IgZXhhbXBsZSBieSBnb2luZyByZWFkLW9u
bHkgdG8gcHJldmVudCBmdXJ0aGVyCisJICBkYXRhIGNvcnJ1cHRpb24sIG9yIHRvIG1hcmsgYSBj
ZXJ0YWluIHJlZ2lvbiBvZiBGbGFzaCBhcyBiYWQuCisKKwkgIElmIHlvdSBhcmUgdW5zdXJlLCBz
ZWxlY3QgJ24nLgorCiBzb3VyY2UgImRyaXZlcnMvbXRkL2NoaXBzL0tjb25maWciCiAKIHNvdXJj
ZSAiZHJpdmVycy9tdGQvbWFwcy9LY29uZmlnIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRk
Y29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCmluZGV4IDViYTlhNzQxZjVhYy4uMTM5Y2Jh
YzUxMTMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJpdmVycy9t
dGQvbXRkY29yZS5jCkBAIC0xNzQ1LDggKzE3NDUsOCBAQCBpbnQgbXRkX3JlYWRfb29iKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwgc3RydWN0IG10ZF9vb2Jfb3BzICpvcHMpCiB9
CiBFWFBPUlRfU1lNQk9MX0dQTChtdGRfcmVhZF9vb2IpOwogCi1pbnQgbXRkX3dyaXRlX29vYihz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IHRvLAotCQkJCXN0cnVjdCBtdGRfb29iX29wcyAq
b3BzKQorc3RhdGljIGludCBfbXRkX3dyaXRlX29vYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9m
Zl90IHRvLAorCQkJICBzdHJ1Y3QgbXRkX29vYl9vcHMgKm9wcykKIHsKIAlzdHJ1Y3QgbXRkX2lu
Zm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVyKG10ZCk7CiAJaW50IHJldDsKQEAgLTE3NzEsNiAr
MTc3MSw1MyBAQCBpbnQgbXRkX3dyaXRlX29vYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90
IHRvLAogCiAJcmV0dXJuIG10ZF93cml0ZV9vb2Jfc3RkKG10ZCwgdG8sIG9wcyk7CiB9CisKK3N0
YXRpYyBpbnQgX210ZF92ZXJpZnkoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6
ZV90IGxlbiwgY29uc3QgdTggKmJ1ZikKK3sKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmbXRkLT5k
ZXY7CisJdV9jaGFyICp2ZXJpZnlfYnVmOworCXNpemVfdCByX3JldGxlbjsKKwlpbnQgcmV0Owor
CisJdmVyaWZ5X2J1ZiA9IGRldm1fa21hbGxvYyhkZXYsIGxlbiwgR0ZQX0tFUk5FTCk7CisJaWYg
KCF2ZXJpZnlfYnVmKQorCQlyZXR1cm4gLUVOT01FTTsKKworCXJldCA9IG10ZF9yZWFkKG10ZCwg
dG8sIGxlbiwgJnJfcmV0bGVuLCB2ZXJpZnlfYnVmKTsKKwlpZiAocmV0IDwgMCkKKwkJZ290byBl
cnI7CisKKwlpZiAobGVuICE9IHJfcmV0bGVuKSB7CisJCS8qIFdlIHNob3VsZG4ndCBzZWUgc2hv
cnQgcmVhZHMgKi8KKwkJZGV2X2VycihkZXYsICJWZXJpZnkgZmFpbGVkLCB3cml0dGVuICV6ZCBi
dXQgb25seSByZWFkICV6ZCIsCisJCQlsZW4sIHJfcmV0bGVuKTsKKwkJcmV0ID0gLUVJTzsKKwkJ
Z290byBlcnI7CisJfQorCisJaWYgKG1lbWNtcCh2ZXJpZnlfYnVmLCBidWYsIGxlbikpIHsKKwkJ
ZGV2X2VycihkZXYsICJWZXJpZnkgZmFpbGVkLCBjb21wYXJlIG1pc21hdGNoISIpOworCQlyZXQg
PSAtRUlPOworCX0KKworZXJyOgorCWRldm1fa2ZyZWUoZGV2LCB2ZXJpZnlfYnVmKTsKKwlyZXR1
cm4gcmV0OworfQorCitpbnQgbXRkX3dyaXRlX29vYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9m
Zl90IHRvLAorCQkgIHN0cnVjdCBtdGRfb29iX29wcyAqb3BzKQoreworCWludCByZXQgPSBfbXRk
X3dyaXRlX29vYihtdGQsIHRvLCBvcHMpOworCisjaWYgSVNfRU5BQkxFRChDT05GSUdfTVREX1BB
UkFOT0lEKQorCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gcmV0OworCisJcmV0ID0gX210ZF92ZXJp
ZnkobXRkLCB0bywgb3BzLT5yZXRsZW4sIG9wcy0+ZGF0YnVmKTsKKyNlbmRpZiAvLyBDT05GSUdf
TVREX1BBUkFOT0lECisJcmV0dXJuIHJldDsKK30KIEVYUE9SVF9TWU1CT0xfR1BMKG10ZF93cml0
ZV9vb2IpOwogCiAvKioKCmJhc2UtY29tbWl0OiBkNzZiYjFlYmI1NTg3ZjY2YjBmOGI4MDk5YmZi
YjQ0NzIyYmMwOGIzCi0tIAoyLjQ5LjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
