Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E53C87FD1
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7b76BGIZFM7qU03oOGFebnp482BroLLgPi63kNxqCTc=; b=1Vn0veXj9r6Cx/
	DZ4xxGWzOBl/+HQWqvB6kNk84yCwulpCkN+sK5TtObAqImc/VkyZkXWY8l8tJk8N7Z7drWo7zs5DD
	tEfXeQwVZ3RIkw32Q+TxmqBARL1Yg4l6x7F5qgdRxWpf6EWG7czoMZdLu9s2A0OftcV/2LKa2M3P5
	wJmCqFYSJww6QCOLCaFQelwF/nriqXJJ2EcYOTCHHv6xpIAmtuPDNEgo/EqRagbqlkwdUO19AkWQi
	ZUmsY3TDjrwQjVTBzlhAt10DGye00CP5TZYGJtDQk4ks4Scax4vMU9aWmCQqvN/HJdgYJPVsx966C
	SZ6Dw6Qx3sBjGxrZSftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL3j-0000000DMp7-1qmR;
	Tue, 05 Aug 2025 17:02:43 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJiK-0000000DA0u-14pq;
	Tue, 05 Aug 2025 15:36:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0464043913;
	Tue,  5 Aug 2025 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754408189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZcPDMkJ+pPommrt/oJ4Duet/sc/kc8Z/rAj63Jyev8=;
	b=OJMRPIB0vCWnZyP1Ih+XiHQtPyCjsi7tq/VM5VkDiIGRKSWcw9OotSyUJDJTup6V/6SpTb
	9y98FQEJVax+Fl7XnbhVvcIAEuRmEjcbevuVs7G/YHtiYwPDG5CoG6XYrZsJ+BQnFzbPSi
	mhtVYo1anHTJGqw5jq+1FbF9hRnfyEBT95GZwpSGFNpi8gG6ANtbMwqE7JG07mvSwNTOlk
	RkAgzuXlOZb8IbbfrT2y99gMWSo335fpsSptE5JffHvc40MvwqCsCUTVoV9udOdMrO+J27
	ycc8Aw5oja8WOpQo0VDR1+3Y0f/AcUH+B/+YrSaFC4wceYpNSpQ1cBVjI2QITQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH 3/4] drivers: mtd: spi-nand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <20250804192132.1406387-4-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Mon, 4 Aug 2025 22:21:31 +0300")
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
	<20250804192132.1406387-4-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 17:36:27 +0200
Message-ID: <875xf1hjb8.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehmihhkhhgrihhlrdhkshhhvghvvghtshhkihihsehiohhpshihshdrvghupdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlohhrvghniihosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrgihrdhlihhusegrihhrohhhrgdrtghomhdprhgtphhtthhopegsrhhoohhnihgvs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmmhhkuhhrsggrnhhovhesshgrlhhuthgvuggvvhhitggvshdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_083632_445047_28DB6B75 
X-CRM114-Status: GOOD (  19.60  )
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

T24gMDQvMDgvMjAyNSBhdCAyMjoyMTozMSArMDMsIE1pa2hhaWwgS3NoZXZldHNraXkgPG1pa2hh
aWwua3NoZXZldHNraXlAaW9wc3lzLmV1PiB3cm90ZToKCj4gQ29udGludW91cyByZWFkaW5nIG1h
eSByZXN1bHQgaW4gbXVsdGlwbGUgZmxhc2ggcGFnZXMgcmVhZGluZyBpbiBvbmUKPiBvcGVyYXRp
b24uIFVuZm9ydHVuYXRlbHksIG5vdCBhbGwgc3BpLW5hbmQgY29udHJvbGxlcnMgc3VwcG9ydCBz
dWNoCj4gbGFyZ2UgcmVhZGluZy4gVGhleSB3aWxsIHJlYWQgbGVzcyBkYXRhLiBVbmZvcnR1bmF0
ZWx5LCB0aGUgb3BlcmF0aW9uCj4gY2FuJ3QgYmUgY29udGludWVkLgo+Cj4gSW4gdGhpcyBjYXNl
Ogo+ICAqIGRpc2FibGUgY29udGludW91cyByZWFkaW5nIG9uIHRoaXMgKG5vdCBnb29kIGVub3Vn
aCkgc3BpIGNvbnRyb2xsZXIKPiAgKiByZXBlYXQgcmVhZGluZyBpbiByZWd1bGFyIG1vZGUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaWtoYWlsIEtzaGV2ZXRza2l5IDxtaWtoYWlsLmtzaGV2ZXRza2l5
QGlvcHN5cy5ldT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgMTkgKysr
KysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBpbmRleCBmZjZhMWUyZmNmZGMuLjg4ZTRj
MDBjY2NjNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBAQCAtNDMxLDcgKzQzMSw3IEBAIHN0YXRp
YyBpbnQgc3BpbmFuZF9yZWFkX2Zyb21fY2FjaGVfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpz
cGluYW5kLAo+ICAJCSAqIFRvZ2dsaW5nIHRoZSBDUyBkdXJpbmcgYSBjb250aW51b3VzIHJlYWQg
aXMgZm9yYmlkZGVuLgo+ICAJCSAqLwo+ICAJCWlmIChuYnl0ZXMgJiYgcmVxLT5jb250aW51b3Vz
KQo+IC0JCQlyZXR1cm4gLUVJTzsKPiArCQkJcmV0dXJuIC1FMkJJRzsKPiAgCX0KPiAgCj4gIAlp
ZiAocmVxLT5kYXRhbGVuKQo+IEBAIC04OTMsMTUgKzg5MywyNiBAQCBzdGF0aWMgaW50IHNwaW5h
bmRfbXRkX3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLAo+ICAJc3RydWN0
IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0gbXRkX3RvX3NwaW5hbmQobXRkKTsKPiAgCXN0cnVj
dCBtdGRfZWNjX3N0YXRzIG9sZF9zdGF0czsKPiAgCXVuc2lnbmVkIGludCBtYXhfYml0ZmxpcHMg
PSAwOwo+IC0JaW50IHJldDsKPiArCWludCByZXQgPSAtRTJCSUc7Cj4gIAo+ICAJbXV0ZXhfbG9j
aygmc3BpbmFuZC0+bG9jayk7Cj4gIAo+ICAJb2xkX3N0YXRzID0gbXRkLT5lY2Nfc3RhdHM7Cj4g
IAo+IC0JaWYgKHNwaW5hbmRfdXNlX2NvbnRfcmVhZChtdGQsIGZyb20sIG9wcykpCj4gKwlpZiAo
c3BpbmFuZF91c2VfY29udF9yZWFkKG10ZCwgZnJvbSwgb3BzKSkgewo+ICAJCXJldCA9IHNwaW5h
bmRfbXRkX2NvbnRpbnVvdXNfcGFnZV9yZWFkKG10ZCwgZnJvbSwgb3BzLCAmbWF4X2JpdGZsaXBz
KTsKPiAtCWVsc2UKPiArCQlpZiAocmV0ID09IC1FMkJJRykgewo+ICsJCQkvKgo+ICsJCQkgKiBT
b21lIHNwaSBjb250cm9sbGVycyBtYXkgbm90IHN1cHBvcnQgcmVhZGluZyB1cCB0bwo+ICsJCQkg
KiBlcmFzZSBibG9jayBzaXplLiBUaGV5IHdpbGwgcmVhZCBsZXNzIGRhdGEgdGhhbgo+ICsJCQkg
KiBleHBlY3RlZC4gSWYgdGhpcyBoYXBwZW4gZGlzYWJsZSBjb250aW51b3VzIG1vZGUKCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhhcHBlbnMsCgo+ICsJCQkg
KiBhbmQgcmVwZWF0IHJlYWRpbmcgaW4gbm9ybWFsIG1vZGUuCj4gKwkJCSAqLwo+ICsJCQlzcGlu
YW5kLT5jb250X3JlYWRfcG9zc2libGUgPSBmYWxzZTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJaWYg
KHJldCA9PSAtRTJCSUcpCgpXaGlsZSBJIGFncmVlIHdpdGggdGhlIG92ZXJhbGwgbG9naWMsIEkg
ZmluZCBwcmV0dHkgdW5yZWFkYWJsZSB0bwpwZXJmb3JtIHRoZSByZWd1bGFyIHJlYWQgdXBvbiBh
IHJldHVybiB2YWx1ZSB0aGF0IGlzIGFuIGVycm9yIGNvZGUgc2V0CmluIHRoZSBpbml0IHNlcXVl
bmNlLiBDYW4geW91IHBsZWFzZSBwcm9wb3NlIGFuIGFsdGVybmF0ZSBpbXBsZW1lbnRhdGlvbj8K
Cj4gIAkJcmV0ID0gc3BpbmFuZF9tdGRfcmVndWxhcl9wYWdlX3JlYWQobXRkLCBmcm9tLCBvcHMs
ICZtYXhfYml0ZmxpcHMpOwo+ICAKPiAgCWlmIChvcHMtPnN0YXRzKSB7CgpUaGFua3MhCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
