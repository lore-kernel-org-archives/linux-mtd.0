Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75597C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NI9jvHGvG56FgxYMHi1i0UttpvLFXV10trKw7UkR9XU=; b=OKguwPi0BaUTHC
	uWHGSRPjE5vqWHE89ghBx/BQ5ISCwdGQYMAbV96OrxcnW1AOqLDUd3kZCMGvJv8eRZLnBjN085LBj
	LWK8U/DCzM2pOSkNYpGDfz2ZeSqwHOozm+wYaUtWxnZ/Wp+2aCzUOH4apeJPLbgOZ25NMXhfZ9Tvb
	uzoRCZE9ttgcay2wOh+p/yBIPLGPnKNi7qgSNo2yoLW89J8SW2rjpGt4HXKnNfizalj+Wrk1BoT4M
	bR5mhnW0aqhemQV5ada3yEoVOa4II2PgzOO1wnL0HC+SQBvQ62ZmqM6H0hQgvjefgLY/tT1QWeM4Y
	SuwpSNGTO3cGtmhS/BAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiaT-0028dJ-0h; Tue, 19 Apr 2022 07:47:49 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiTr-0025Bh-Jq
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 07:41:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 134AD1BF204;
 Tue, 19 Apr 2022 07:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650354055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=of4YeTK1eJ00pFq6VieUlJBzisMH3rSgJqKoj0W85NI=;
 b=bcg8861t63+6BVYpGB0OsDpwva35+7JugamEk6l6VaV5mri9LyzSPrQ0CiBezR+t/k11MH
 oTtut1S2VfFHBoWP0kO1PCHWoVoDxthloH7LlxNdY20bLlw4AEhmyeoJkEeLwwFnDdChRJ
 O9cg9W0Jxf+cgz174Q5FGLgmbCGUSt+PcF+0hE5iz+whRvP5+3iuafrzCvL1U9KClt69SO
 uJMueiumos16vYue3bBk7ER8tN1ibEDHxj0qPvaMgm6WysfW/5GqjJ8z0tPwvNcXVu7LaV
 qzFnG3oOz0MEraSI2qV+MlPoPjjBswx4rT+LKdo2h0WYpbfG4lh2DoyhU6D/kw==
Date: Tue, 19 Apr 2022 09:40:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: cgel.zte@gmail.com
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>, Zeal
 Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] mtd: nand: gpmi-nand: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Message-ID: <20220419094051.3bb9fe45@xps13>
In-Reply-To: <20220418105549.2558765-1-chi.minghao@zte.com.cn>
References: <20220418105549.2558765-1-chi.minghao@zte.com.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_004059_846565_9D6BB3A6 
X-CRM114-Status: GOOD (  16.25  )
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

SGVsbG8sCgpjZ2VsLnp0ZUBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAxOCBBcHIgMjAyMiAxMDo1
NTo0OSArMDAwMDoKCj4gRnJvbTogTWluZ2hhbyBDaGkgPGNoaS5taW5naGFvQHp0ZS5jb20uY24+
Cj4gCj4gVXNpbmcgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCBpcyBtb3JlIGFwcHJvcHJpYXRl
Cj4gZm9yIHNpbXBsaWZpbmcgY29kZQoKV291bGQgeW91IG1pbmQgcmVkdWNpbmcgYSBsaXR0bGUg
Yml0IHRoZSB0aXRsZSBvZiB0aGUgY29tbWl0PyBPdGhld2lzZQpmaW5lIGJ5IG1lLgoKPiAKPiBS
ZXBvcnRlZC1ieTogWmVhbCBSb2JvdCA8emVhbGNpQHp0ZS5jb20uY24+Cj4gU2lnbmVkLW9mZi1i
eTogTWluZ2hhbyBDaGkgPGNoaS5taW5naGFvQHp0ZS5jb20uY24+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDE4ICsrKysrKy0tLS0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gaW5kZXggNDRi
MTRjOWRjOWE3Li42ZTc0NzdhZWY4YTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bt
aS1uYW5kL2dwbWktbmFuZC5jCj4gQEAgLTE0OCwxMSArMTQ4LDkgQEAgc3RhdGljIGludCBncG1p
X2luaXQoc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ICAJc3RydWN0IHJlc291cmNlcyAq
ciA9ICZ0aGlzLT5yZXNvdXJjZXM7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCXJldCA9IHBtX3J1bnRp
bWVfZ2V0X3N5bmModGhpcy0+ZGV2KTsKPiAtCWlmIChyZXQgPCAwKSB7Cj4gLQkJcG1fcnVudGlt
ZV9wdXRfbm9pZGxlKHRoaXMtPmRldik7Cj4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRf
Z2V0KHRoaXMtPmRldik7Cj4gKwlpZiAocmV0IDwgMCkKPiAgCQlyZXR1cm4gcmV0Owo+IC0JfQo+
ICAKPiAgCXJldCA9IGdwbWlfcmVzZXRfYmxvY2soci0+Z3BtaV9yZWdzLCBmYWxzZSk7Cj4gIAlp
ZiAocmV0KQo+IEBAIC01NDQsMTEgKzU0Miw5IEBAIHN0YXRpYyBpbnQgYmNoX3NldF9nZW9tZXRy
eShzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiBy
ZXQ7Cj4gIAo+IC0JcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyh0aGlzLT5kZXYpOwo+IC0JaWYg
KHJldCA8IDApIHsKPiAtCQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCh0aGlzLT5kZXYpOwo+
ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCh0aGlzLT5kZXYpOwo+ICsJaWYgKHJl
dCA8IDApCj4gIAkJcmV0dXJuIHJldDsKPiAtCX0KPiAgCj4gIAkvKgo+ICAJKiBEdWUgdG8gZXJy
YXR1bSAjMjg0NyBvZiB0aGUgTVgyMywgdGhlIEJDSCBjYW5ub3QgYmUgc29mdCByZXNldCBvbiB0
aGlzCj4gQEAgLTIyODYsMTEgKzIyODIsOSBAQCBzdGF0aWMgaW50IGdwbWlfbmZjX2V4ZWNfb3Ao
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCWZvciAoaSA9IDA7IGkgPCBHUE1JX01BWF9UUkFO
U0ZFUlM7IGkrKykKPiAgCQl0aGlzLT50cmFuc2ZlcnNbaV0uZGlyZWN0aW9uID0gRE1BX05PTkU7
Cj4gIAo+IC0JcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyh0aGlzLT5kZXYpOwo+IC0JaWYgKHJl
dCA8IDApIHsKPiAtCQlwbV9ydW50aW1lX3B1dF9ub2lkbGUodGhpcy0+ZGV2KTsKPiArCXJldCA9
IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQodGhpcy0+ZGV2KTsKPiArCWlmIChyZXQgPCAwKQo+
ICAJCXJldHVybiByZXQ7Cj4gLQl9Cj4gIAo+ICAJLyoKPiAgCSAqIFRoaXMgZHJpdmVyIGN1cnJl
bnRseSBzdXBwb3J0cyBvbmx5IG9uZSBOQU5EIGNoaXAuIFBsdXMsIGRpZXMgc2hhcmUKCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
