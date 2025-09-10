Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C5CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH697ICk6tOIBZg3PMLV8TTM57IHI7u5wRNpj3yFFyM=; b=mr8VGZoB3mbczh
	h7n9LDqxcgr8o3J4aT9mypcRLx2kR1mI1LCBNJWc5ezSjYB1JwlPtRPJh7OH6Xpj9t1MzmIlE78D+
	b2lDpTBLPf2i+GxyqWyhf5HvHsJ0vs9Jgix78h0LUVVeuClOWLXQfO2z6elhy9MqYkaUBZz4X52H1
	7ciHo6cpwL5shihr8k+nx2sGztZFfqjnhGUSJ9Xv/U9WVYqUKtJlZQ5k+09VMvFRrWao/WQ2+LbHW
	FiXt9D7TgANGQSaKyHAlIOOyek/0Ne8Jx/2m42kLICG1sgYrlgtE8qvcF/hA+ckS0tta5xAjQ0dGV
	fYflKnof219UdS+pIyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHMd-0000000DIoh-1YJk;
	Wed, 10 Sep 2025 09:43:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHMZ-0000000DIlp-3EZq
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 09:43:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 99B8A4E4065F;
	Wed, 10 Sep 2025 09:43:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80832606D4;
	Wed, 10 Sep 2025 09:43:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3EC2102F2888;
	Wed, 10 Sep 2025 11:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757497416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2S/DldGiyms7PYoDD6rDyYTN86fmzaucXIEEpvB0vHQ=;
	b=rrQ8eJRBp8qxEvDt/71iTHLE1NFWOSSJdJKGCNGiAcBZcihhbEA9rGsqW8T/xk/k9Rm6ql
	FtHRE4d1rAzeSY2XVI13jrWb3iZOeVWxd5+c5tXrL0KYdPJQZNZYAA4X1JGmAJ/x+9u2HU
	+7F1DKkYicid6ejufBE/c3/pFHuaWgX9XI3x2hrkWEfGaE29G4MKRAFq0vzn4rpotgzjWy
	mpFu7WGx322/8GqBZ4tD3pTZPtrGO+vsOeVOt9M0HWm4p1k2tB1L5+e5KC1p3FQdmu1Cl7
	aC2rKJM/105Hvb/WtbJhNhXK03sJl85XGui4103fZJCzxraQQebAQRz8Wpz8yg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  tudor.ambarus@linaro.org,
  mmkurbanov@salutedevices.com,  Takahiro.Kuwano@infineon.com,
  pratyush@kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 3/3] mtd: spi-nand: macronix: Add randomizer support
In-Reply-To: <CAAyq3SamY9vjQubd0BjpLb7J_W6JfKyyd987y+UioMV7UQ=94Q@mail.gmail.com>
	(Cheng Ming Lin's message of "Wed, 10 Sep 2025 17:26:13 +0800")
References: <20250910030301.1368372-1-linchengming884@gmail.com>
	<20250910030301.1368372-4-linchengming884@gmail.com>
	<87qzwed62q.fsf@bootlin.com>
	<CAAyq3SamY9vjQubd0BjpLb7J_W6JfKyyd987y+UioMV7UQ=94Q@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 11:43:14 +0200
Message-ID: <87ldmmd4nh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024339_947611_1EE43977 
X-CRM114-Status: GOOD (  11.32  )
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

T24gMTAvMDkvMjAyNSBhdCAxNzoyNjoxMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21p
bmc4ODRAZ21haWwuY29tPiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+Cj4gTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8IDIwMjXlubQ55pyIMTDml6Ug6YCx5LiJIOS4
i+WNiDU6MTLlr6vpgZPvvJoKPj4KPj4KPj4gPiArc3RhdGljIGludCBtYWNyb25peF9zZXRfcmFu
ZG9taXplcihzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4+ID4gK3sKPj4gPiArICAg
ICBzdHJ1Y3Qgc3BpX21lbV9vcCBleGVjX29wID0gU1BJTkFORF9QUk9HX0VYRUNfMVNfMVNfMF9P
UCgwKTsKPj4gPiArICAgICBzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBzcGluYW5kX3RvX25h
bmQoc3BpbmFuZCk7Cj4+ID4gKyAgICAgc3RydWN0IGRldmljZV9ub2RlICpkbiA9IG5hbmRkZXZf
Z2V0X29mX25vZGUobmFuZCk7Cj4+ID4gKyAgICAgaW50IHJhbmRvcHQsIHJldDsKPj4gPiArICAg
ICB1OCBjZmcsIHN0YXR1czsKPj4gPiArCj4+ID4gKyAgICAgcmV0ID0gc3BpbmFuZF9yZWFkX3Jl
Z19vcChzcGluYW5kLCBNQUNST05JWF9GRUFUVVJFX0FERFJfUkFORE9NSVpFUiwgJmNmZyk7Cj4+
ID4gKyAgICAgaWYgKHJldCkKPj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+ID4gKyAg
ICAgaWYgKGNmZykKPj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+PiA+ICsKPj4gPiArICAg
ICBjZmcgPSBNQUNST05JWF9DRkdfRU5QR00gfCBNQUNST05JWF9DRkdfUkFOREVOOwo+PiA+ICsg
ICAgIHJhbmRvcHQgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woZG4sICJteGljLHJhbmRvcHQiKTsK
Pj4KPj4gSXNuJ3QgdGhhdCBhIGxlZnRvdmVyPwo+Cj4gVGhlIHByb3BlcnR5ICJteGljLHJhbmRv
cHQiIGNvcnJlc3BvbmRzIHRvIGJpdDIgb2YgdGhlIGNvbmZpZ3VyYXRpb24KPiByZWdpc3RlciAw
eDEwLiBJdHMgcHVycG9zZSBpcyB0byBjb250cm9sIHdoZXRoZXIgdGhlIHJhbmRvbWl6ZXIgYWxz
bwo+IGNvdmVycyB0aGUgaW5pdGlhbCBwb3J0aW9uIG9mIHRoZSBzcGFyZSBhcmVhLgoKRG8gd2Ug
bmVlZCBhIERUIHByb3BlcnR5IGZvciB0aGF0PwoKSW4gYW55IGNhc2UsIGl0IG11c3QgYmUgZGVj
bGFyZWQgaW4gdGhlIGJpbmRpbmdzICh3aGljaCBJIGRvIG5vdCB0aGluawppdCBpcz8pLgoKPiBT
aW5jZSB0aGUgcmFuZG9taXplciBmZWF0dXJlIGlzIG9ubHkgZG9jdW1lbnRlZCBpbiBNYWNyb25p
eCBkYXRhc2hlZXRzLAo+IGl0IGlzIG5vdCBjbGVhciB3aGV0aGVyIHRoZSAicmFuZG9wdCIgYml0
IGlzIHVzZWQgYnkgYWxsIHZlbmRvcnMuIEZvcgo+IHRoaXMgcmVhc29uLCB0aGUgaGFuZGxpbmcg
aXMgcGxhY2VkIGluc2lkZSBtYWNyb25peC5jLgoKRGlkbid0IHdlIGRpc2N1c3MgaW4gdGhlIHBh
c3Qgb2YgYSB2b2xhdGlsZSB2ZXJzaW9uIGZvciBTUEkgTkFORApkZXZpY2VzPyBJIHRob3VnaHQg
d2UgY291bGQgdXNlIGEgdm9sYXRpbGUgYXBwcm9hY2ggaW5zdGVhZC4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
