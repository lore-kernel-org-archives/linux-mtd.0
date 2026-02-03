Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA560E87834
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZrRJyK4YXjVSjEwQOvVyEc6tIbzhxmO7PTuzGVvxYQ=; b=I2nwDhWrOmihyk
	U9NlPPpoHv96MTwd+i6E1h7PXbGfoW62QsevB+5WzdNWbNRrpTx8Puj3eIMeMOTqG12KaeuUbUJMp
	Qha/5STx+OFXYiYs7oHUz9dX4FIgeowTsTSJRkk2LqicOVK2okZf4spmJN6mXmb6tycNWddlO/cwK
	txXZ+5l5LvhlU13F8+VMGqw8hc8jPN9OV/UCW8X7/zncZqw+asSgoblQlwLTqII9IHB44yKSrcWCZ
	M+4V2WvPeXeQpUSjxbstjAmhQm1YipPoYFP5ameid4ba9yJinlO7SggUlWsqnfP/nrqDueLuGg3zC
	2/Iby3X92lTHF7nBYqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHZj-00000006mSk-3a3P;
	Tue, 03 Feb 2026 14:40:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHZg-00000006mSA-1rob
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 14:40:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6185B4E42319;
	Tue,  3 Feb 2026 14:40:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22A4560728;
	Tue,  3 Feb 2026 14:40:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E65F6119A8888;
	Tue,  3 Feb 2026 15:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770129613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UxGr7oSFz0Iu/FRUMPlLMzfCGWOGWIwE1/BwPQKeYIo=;
	b=TmpOlWh77GlyPb5TfgMy4MkmIJRrXyou2xA1Ic4vTDfd19BZWOHmBsLQ4el/hKIBJuhEfj
	7XJ4T+bNtv6py44llJm0LlffT/vgloH2cmARXYiD801h4XSnxnaJVZVDUHCVMuFNgQjqHh
	UeZAZe3D8tHol3Lm0Z6v1k29RIowrd9YZZ6BtRq0RIIT54P8oyM4hyViyd90vj6cugMdtW
	WYTPyQLdbvdNCRUyjvLXbsiCbGLkOTMBZqIcGN26bABmi2qR0CSfNrkCwUQRgj9tbUvooR
	OpJXd7wDY7y0hkHAcvuLSbkXEix1HPd/CgioxhXbNB5JneUv6x1jqjZ0DXlotw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Richard Weinberger
 <richard@nod.at>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Martin
 Kurbanov <mmkurbanov@salutedevices.com>,  Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v4 1/2] mtd: spi-nand: Add support for randomizer
In-Reply-To: <20260203021358.693291-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Tue, 3 Feb 2026 10:13:57 +0800")
References: <20260203021358.693291-1-linchengming884@gmail.com>
	<20260203021358.693291-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 03 Feb 2026 15:40:09 +0100
Message-ID: <87ecn1hovq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_064016_639577_58152BE3 
X-CRM114-Status: GOOD (  23.60  )
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

SGVsbG8gQ2hlbmcgTWluZywKCk9uIDAzLzAyLzIwMjYgYXQgMTA6MTM6NTcgKzA4LCBDaGVuZyBN
aW5nIExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IENoZW5n
IE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBUaGlzIHBhdGNoIGFkZHMg
c3VwcG9ydCBmb3IgdGhlIHJhbmRvbWl6ZXIgZmVhdHVyZS4KPgo+IEl0IGludHJvZHVjZXMgYSAn
c2V0X3JhbmRvbWl6ZXInIGNhbGxiYWNrIGluICdzdHJ1Y3Qgc3BpbmFuZF9pbmZvJyBhbmQKPiAn
c3RydWN0IHNwaW5hbmRfZGV2aWNlJy4KPgo+IElmIGEgZHJpdmVyIGltcGxlbWVudHMgdGhpcyBj
YWxsYmFjaywgdGhlIGNvcmUgd2lsbCBjYWxsIGl0IGR1cmluZwo+IGRldmljZSBpbml0aWFsaXph
dGlvbiAoc3BpbmFuZF9pbml0KSB0byBlbmFibGUgdGhlIHJhbmRvbWl6ZXIuCgpJIHJlY2VudGx5
IGhhZCBhIHJlcXVlc3QgcmVnYXJkaW5nIHRoZSBzdW54aSBjb250cm9sbGVyIGRyaXZlcgpyYW5k
b21pemVyLiBJIHdvdWxkIGxpa2UgdG8gZ2V0IGJhY2sgdG8gaGF2aW5nIGEgbmFuZCB3aWRlIHJh
bmRvbWl6ZXIgRFQKcHJvcGVydHksIGJlY2F1c2UgYSBNYWNyb25peCBzcGVjaWZpYyB2YWx1ZSBo
b25lc3RseSBubyBsb25nZXIgbWFrZXMKc2Vuc2UuIFJhbmRvbWl6ZXJzIGhhdmUgYmVlbiB0aGVy
ZSBmb3IgYWdlcywgdGhleSBhcmUgbm90IHNvIG9mdGVuIHVzZWQKYmVjYXVzZSBzY3JhbWJsaW5n
IGRhdGEgaXMgbm90IGNvbnZlbmllbnQgZm9yIGRldmVsb3BlcnMgYnV0IHRoZXkgbWF5CmhhdmUg
YSByZWFsIGludGVyZXN0IGRlcGVuZGluZyBvbiB0aGUgTkFORCBjaGlwIG9yIHRoZSBleHRlcm5h
bApjb25kaXRpb25zLgoKV2Ugd2lsbCBuZWVkIHR3byBtdXR1YWxseSBleGNsdXNpdmUgb3B0aW9u
YWwgcHJvcGVydGllcyBpbgpuYW5kLWNoaXAueWFtbDoKbmFuZC1lbmFibGUtcmFuZG9taXplcjsK
bmFuZC1kaXNhYmxlLXJhbmRvbWl6ZXI7CgpCVFcsIHdoZXJlIGlzIHRoZSBwYXRjaCBhZGRpbmcg
dGhlIHByb3BlcnR5IHRvIHRoZSBiaW5kaW5ncz8gRGlkIHdlCmFscmVhZHkgbWVyZ2UgaXQ/IEkg
ZG8gbm90IGZpbmQgaXQgYW55bW9yZS4KCkxvb2tpbmcgYXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24sIEkgcmVhbGx5IGRvbid0IGxpa2UgdGhlIGNvcmUKYWx3YXlzIGNhbGxpbmcgaW4gdGhl
ICJpbml0IiBhbmQgdGhlIG1hbnVmYWN0dXJlciBkcml2ZXIgcmVhZGluZyB0aGUgRFQKYW5kIGRl
Y2lkaW5nIHdoZXRoZXIgb3Igbm90IGl0IGVuYWJsZXMgaXQuCgo+IFNpZ25lZC1vZmYtYnk6IENo
ZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1
ZGUvbGludXgvbXRkL3NwaW5hbmQuaCB8ICA5ICsrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9j
b3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBpbmRleCBkMjA3Mjg2NTcyZDgu
LjRmOGZmOTRmNWNjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBAQCAtMjA2LDYgKzIwNiwxMiBA
QCBzdGF0aWMgaW50IHNwaW5hbmRfY29udF9yZWFkX2VuYWJsZShzdHJ1Y3Qgc3BpbmFuZF9kZXZp
Y2UgKnNwaW5hbmQsCj4gIAlyZXR1cm4gc3BpbmFuZC0+c2V0X2NvbnRfcmVhZChzcGluYW5kLCBl
bmFibGUpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IHNwaW5hbmRfcmFuZG9taXplcl9lbmFibGUo
c3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICsJCQkJICAgICBib29sIGVuYWJsZSkK
PiArewo+ICsJcmV0dXJuIHNwaW5hbmQtPnNldF9yYW5kb21pemVyKHNwaW5hbmQsIGVuYWJsZSk7
CgpUaGlzIGhlbHBlciBzZWVtcyBtb3N0bHkgdXNlbGVzcy4KCj4gK30KPiArCj4gIHN0YXRpYyBp
bnQgc3BpbmFuZF9jaGVja19lY2Nfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCwgdTggc3RhdHVzKQo+ICB7Cj4gIAlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBzcGluYW5k
X3RvX25hbmQoc3BpbmFuZCk7Cj4gQEAgLTEyMTgsNiArMTIyNCwxOSBAQCBzdGF0aWMgaW50IHNw
aW5hbmRfY3JlYXRlX2Rpcm1hcHMoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICAJ
cmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgc3BpbmFuZF9yYW5kb21pemVyX2luaXQo
c3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICt7Cj4gKwlpbnQgcmV0Owo+ICsKPiAr
CWlmIChzcGluYW5kLT5zZXRfcmFuZG9taXplcikgewo+ICsJCXJldCA9IHNwaW5hbmRfcmFuZG9t
aXplcl9lbmFibGUoc3BpbmFuZCwgdHJ1ZSk7CgpQbGVhc2UgZGlyZWN0bHkgY2FsbCB0aGUgaG9v
ay4KCkdpdmVuIHRoZSBwcmV2aW91cyBmZWVkYmFjaywgeW91IHNob3VsZCBjaGFuZ2UgInRydWUi
IHRvIGJlIGJhc2VkIG9uIHRoZQpwcmVzZW5jZSBvZiB0aGUgRFQgcHJvcGVydHkuCgo+ICsJCWlm
IChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KClJl
c3QgTEdUTS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
