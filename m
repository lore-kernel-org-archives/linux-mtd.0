Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07D2C43458
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jun 2026 03:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6F4Wx22tNjXN/woCGr9ygriuyKn7bmFuvl/efIqdAc=; b=SS7CertzXK5AL8
	cOebkFJI6EZrPMMD6GaOiLPzl4rRBDjggpNvKWqRflfKh8UVCos0y581b+TLMVR+nhFuebc2HWMTS
	7b4xeOK9k+DTQ7rAu+pqZC3zy1bcbaLyl5VN0Jev5jftJ+xHGn4HlExOLDnJKtd2IAJOP8V91PNwy
	fY31LescM1wC8I8Td1xG4Tp9NrFYbKDFW1zE9FDTxeiThQB6z1COcRmXI71z07KR3FBNdUV0Urh80
	APEy/lR7JfzHNfJCKFxgsV4oU8jPT4LABRFM+JbnwO0Pu8+tzns90SoScokPTyeRs69Weh8qZM9oN
	sr0rxmENgWBgvHUAewrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdgfH-0000000Cu0v-2t13;
	Sun, 28 Jun 2026 03:58:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdgfD-0000000Cu0a-3Q9P
	for linux-mtd@lists.infradead.org;
	Sun, 28 Jun 2026 03:58:37 +0000
Received: from smtpclient.apple (unknown [117.182.74.7])
	by APP-01 (Coremail) with SMTP id qwCowAAnztbpm0BqfUqqAw--.7329S2;
	Sun, 28 Jun 2026 11:58:33 +0800 (CST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] fix: mtd: mtd_device_parse_register: fix refcount
 imbalance on   add_mtd_device failure and multi-call scenarios
From: WenTao Liang <vulab@iscas.ac.cn>
In-Reply-To: <20260626151349.50859-1-vulab@iscas.ac.cn>
Date: Sun, 28 Jun 2026 11:58:22 +0800
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <52A2B858-B071-4644-8939-62BF8C292AA7@iscas.ac.cn>
References: <20260626151349.50859-1-vulab@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CM-TRANSID: qwCowAAnztbpm0BqfUqqAw--.7329S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4UKFyxKrWxCFWDJr17Awb_yoW5Gr45pr
	Z8Wa9Yy3y3Kr429wsrWF1qgFWUKasay34rur47Gw12kws3G34YqFZ8KFy7Ww18t34xGF4j
	qr4xXan5Cw4UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkCb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHGQDU
	UUU
X-Originating-IP: [117.182.74.7]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwIMA2pAixEbZQAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_205836_269794_7B29E3B3 
X-CRM114-Status: GOOD (  18.61  )
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

Cgo+IDIwMjblubQ25pyIMjbml6UgMjM6MTPvvIxXZW5UYW8gTGlhbmcgPHZ1bGFiQGlzY2FzLmFj
LmNuPiDlhpnpgZPvvJoKPiAKPiBhZGRfbXRkX2RldmljZSBpbml0aWFsaXplcyBtdGQtPnJlZmNu
dCB2aWEga3JlZl9pbml0IHVuY29uZGl0aW9uYWxseS4gVGhlCj4gIGNsZWFudXAgaW4gdGhlIG91
dCBsYWJlbCBvbmx5IGNhbGxzIGRlbF9tdGRfZGV2aWNlIHdoZW4KPiAgZGV2aWNlX2lzX3JlZ2lz
dGVyZWQgaXMgdHJ1ZS4gV2hlbiBhZGRfbXRkX2RldmljZSBmYWlscyBiZWZvcmUKPiAgZGV2aWNl
X3JlZ2lzdGVyLCB0aGUgcmVmY250IGlzIGxlZnQgYXQgMSAobGVhaykuIENvbnZlcnNlbHksIHdo
ZW4KPiAgQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIgaXMgZGlzYWJsZWQgYW5kIHRoZSBk
ZXZpY2Ugd2FzIGFscmVhZHkKPiAgcmVnaXN0ZXJlZCBieSBhIHByaW9yIGNhbGwsIHRoZSBlcnJv
ciBwYXRoIGluY29ycmVjdGx5IGNhbGxzCj4gIGRlbF9tdGRfZGV2aWNlIHdpdGhvdXQgYSBtYXRj
aGluZyBhZGRfbXRkX2RldmljZSBpbiB0aGlzIGludm9jYXRpb24sCj4gIGNhdXNpbmcgYSByZWZj
b3VudCB1bmRlcmZsb3cuCj4gCj4gVHJhY2sgd2hldGhlciBhZGRfbXRkX2RldmljZSBzdWNjZWVk
ZWQgaW4gdGhpcyBpbnZvY2F0aW9uIHdpdGggYQo+ICByZWdpc3RlcmVkIGZsYWcsIGFuZCBvbmx5
IGNhbGwgZGVsX210ZF9kZXZpY2Ugb24gZXJyb3Igd2hlbiByZWdpc3RlcmVkIGlzCj4gIHRydWUu
Cj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogMWM0YzIxNWNiZGNiICgi
bXRkOiBhZGQgbmV3IEFQSSBmb3IgaGFuZGxpbmcgTVREIHJlZ2lzdHJhdGlvbiIpCj4gU2lnbmVk
LW9mZi1ieTogV2VuVGFvIExpYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KPiAtLS0KPiBkcml2ZXJz
L210ZC9tdGRjb3JlLmMgfCAxMCArKysrKysrLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRk
Y29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5kZXggNTc2NTM3Nzc0NjI4Li41OWQ4
YTZjNjFmNTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTExMDgsNiArMTEwOCw3IEBAIGludCBtdGRfZGV2aWNl
X3BhcnNlX3JlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBjb25zdCBjaGFyICogY29uc3Qg
KnR5cGVzLAo+IAkJCSAgICAgIGludCBucl9wYXJ0cykKPiB7Cj4gCWludCByZXQsIGVycjsKPiAr
CWJvb2wgcmVnaXN0ZXJlZCA9IGZhbHNlOwo+IAo+IAltdGRfc2V0X2Rldl9kZWZhdWx0cyhtdGQp
Owo+IAo+IEBAIC0xMTE5LDYgKzExMjAsNyBAQCBpbnQgbXRkX2RldmljZV9wYXJzZV9yZWdpc3Rl
cihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgY29uc3QgY2hhciAqIGNvbnN0ICp0eXBlcywKPiAJCXJl
dCA9IGFkZF9tdGRfZGV2aWNlKG10ZCk7Cj4gCQlpZiAocmV0KQo+IAkJCWdvdG8gb3V0Owo+ICsJ
CXJlZ2lzdGVyZWQgPSB0cnVlOwo+IAl9Cj4gCj4gCWlmIChJU19SRUFDSEFCTEUoQ09ORklHX01U
RF9WSVJUX0NPTkNBVCkpIHsKPiBAQCAtMTEzNiw5ICsxMTM4LDExIEBAIGludCBtdGRfZGV2aWNl
X3BhcnNlX3JlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBjb25zdCBjaGFyICogY29uc3Qg
KnR5cGVzLAo+IAkJcmV0ID0gMDsKPiAJZWxzZSBpZiAobnJfcGFydHMpCj4gCQlyZXQgPSBhZGRf
bXRkX3BhcnRpdGlvbnMobXRkLCBwYXJ0cywgbnJfcGFydHMpOwo+IC0JZWxzZSBpZiAoIWRldmlj
ZV9pc19yZWdpc3RlcmVkKCZtdGQtPmRldikpCj4gKwllbHNlIGlmICghZGV2aWNlX2lzX3JlZ2lz
dGVyZWQoJm10ZC0+ZGV2KSkgewo+IAkJcmV0ID0gYWRkX210ZF9kZXZpY2UobXRkKTsKPiAtCWVs
c2UKPiArCQlpZiAoIXJldCkKPiArCQkJcmVnaXN0ZXJlZCA9IHRydWU7Cj4gKwl9IGVsc2UKPiAJ
CXJldCA9IDA7Cj4gCj4gCWlmIChyZXQpCj4gQEAgLTExNzAsNyArMTE3NCw3IEBAIGludCBtdGRf
ZGV2aWNlX3BhcnNlX3JlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBjb25zdCBjaGFyICog
Y29uc3QgKnR5cGVzLAo+IAkJbnZtZW1fdW5yZWdpc3RlcihtdGQtPm90cF9mYWN0b3J5X252bWVt
KTsKPiAJfQo+IAo+IC0JaWYgKHJldCAmJiBkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmbXRkLT5kZXYp
KSB7Cj4gKwlpZiAocmV0ICYmIHJlZ2lzdGVyZWQpIHsKPiAJCWVyciA9IGRlbF9tdGRfZGV2aWNl
KG10ZCk7Cj4gCQlpZiAoZXJyKQo+IAkJCXByX2VycigiRXJyb3Igd2hlbiBkZWxldGluZyBNVEQg
ZGV2aWNlICglZClcbiIsIGVycik7Cj4gLS0gCj4gMi4zOS41IChBcHBsZSBHaXQtMTU0KQoKUGxl
YXNlIGlnbm9yZSB0aGlzIHBhdGNoLiBJIHdpbGwgcmVzZW5kIGEgcHJvcGVyIHZlcnNpb24gYWZ0
ZXIKbGVhcm5pbmcgdGhlIGtlcm5lbCBzdWJtaXNzaW9uIHByb2Nlc3MuCgpBcG9sb2dpZXMgZm9y
IHRoZSBub2lzZS4KCkJlc3QgcmVnYXJkcywKV2VuVGFvIExpYW5nCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
