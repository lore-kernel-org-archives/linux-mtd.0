Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D00C87FCB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtRb/+Enk2atc3KSlaUgczkdZb2awYOJAs3yrCCxs6s=; b=DFffz6e486iufd
	DHtW5MuBzZK1RE8jbyobSWMqV7tDq8dmoh4PWYpJVU3jjyjnVGxDMPdPqc29r98JqFZSgExEZ79k0
	Zn+PzbRXjbtjIMM0PWkF6R6k0XkAVUMuoiRMGk2EtCkYcc9n3Zv66Wov1sVy/prhGBOli06PQQGEj
	bhI45p0xh9iO2r7vTFsUoxg0OQZwMybXwRGILrhc58TRIpNEephH+GpYMRloOBNI8InuMKHf7/ZsX
	Y9yURv9mc5jrg++0q0akB0/Bx6r0MSBIx9jpSadrjWIQQhP1KVlc7KldeMFjPQRSaiIh1BcG3RdTg
	JOaTiKFSpHwNf1+66jnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKYN-0000000DIl4-0wB2;
	Tue, 05 Aug 2025 16:30:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJX8-0000000D8Rc-02Va;
	Tue, 05 Aug 2025 15:24:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C703438DF;
	Tue,  5 Aug 2025 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754407495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bR0VckSoN9YaJX4wlOvB009sshe3mAwoA7HDDGUCpI=;
	b=Ci72ZknI4OXBeJS8vhqNr/IUn2BHA2NeY694ItlWgUdkWtdHx0y4S+KYkdzppkzW0cVwpK
	kBWY9e4b29rek3ZdCzZtlIDgwHk2MrV68RC64LfmiSIGG4/gUaU9VxnMia3Eex+wdt6Ajv
	7C/i0N3DLleoUJldMMTEZo2//+zf0J3VSHMdvICfy3CDa/kx4h04G8zaSwi0CFbqMOTcXe
	xRTIuc98AQ/k1S4UiVqS+29CX/A37APSl6fsKJPEE7IoIgDgpp6hFu3qmGCM0633s2TWU/
	bd2sGoZvfT09zx0Bl0XsrBSsKBQs783ttrhMwkeZDgxWkV4h0TrSJrs+GRR/zw==
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
Subject: Re: [PATCH 1/4] drivers: mtd: spi-nand: fix direct mapping creation
 sizes.
In-Reply-To: <20250804192132.1406387-2-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Mon, 4 Aug 2025 22:21:29 +0300")
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
	<20250804192132.1406387-2-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 17:24:50 +0200
Message-ID: <87sei5hjul.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfeuiefghffhiedvveejuefgueffvedugeevjeejgeetgfefgeffveetgefgleenucffohhmrghinhepohhppghtmhhplhdruggrthgrnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepmhhikhhhrghilhdrkhhshhgvvhgvthhskhhihiesihhophhshihsrdgvuhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhorhgvnhiioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrhidrlhhiuhesrghirhhoh
 hgrrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_082458_693211_9556374B 
X-CRM114-Status: GOOD (  17.13  )
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

SGVsbG8gTWlraGFpbCwKClRoYW5rcyBhIGxvdCBmb3IgdGhpcyBzZXJpZXMhCgpPbiAwNC8wOC8y
MDI1IGF0IDIyOjIxOjI5ICswMywgTWlraGFpbCBLc2hldmV0c2tpeSA8bWlraGFpbC5rc2hldmV0
c2tpeUBpb3BzeXMuZXU+IHdyb3RlOgoKPiBDb250aW51b3VzIG1vZGUgaXMgb25seSBzdXBwb3J0
ZWQgZm9yIG5vbi1yYXcgZGF0YSByZWFkcywgdGh1cyByYXcgSS9PCj4gb3Igbm9uLXJhdyB3cml0
aW5nIHJlcXVpcmVzIG9ubHkgc2luZ2xlIGZsYXNoIHBhZ2UgbWFwcGluZy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE1pa2hhaWwgS3NoZXZldHNraXkgPG1pa2hhaWwua3NoZXZldHNraXlAaW9wc3lzLmV1
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCA4ICsrKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jCj4gaW5kZXggYjA4OTg5OTBiMmE1Li5iNDJjNDJlYzU4YTQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jCj4gQEAgLTExMDMsOSArMTEwMyw2IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9jcmVhdGVf
ZGlybWFwKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCX07Cj4gIAlzdHJ1Y3Qg
c3BpX21lbV9kaXJtYXBfZGVzYyAqZGVzYzsKPiAgCj4gLQlpZiAoc3BpbmFuZC0+Y29udF9yZWFk
X3Bvc3NpYmxlKQo+IC0JCWluZm8ubGVuZ3RoID0gbmFuZGRldl9lcmFzZWJsb2NrX3NpemUobmFu
ZCk7Cj4gLQo+ICAJLyogVGhlIHBsYW5lIG51bWJlciBpcyBwYXNzZWQgaW4gTVNCIGp1c3QgYWJv
dmUgdGhlIGNvbHVtbiBhZGRyZXNzICovCj4gIAlpbmZvLm9mZnNldCA9IHBsYW5lIDw8IGZscyhu
YW5kLT5tZW1vcmcucGFnZXNpemUpOwo+ICAKPiBAQCAtMTExNyw2ICsxMTE0LDggQEAgc3RhdGlj
IGludCBzcGluYW5kX2NyZWF0ZV9kaXJtYXAoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
LAo+ICAKPiAgCXNwaW5hbmQtPmRpcm1hcHNbcGxhbmVdLndkZXNjID0gZGVzYzsKPiAgCj4gKwlp
ZiAoc3BpbmFuZC0+Y29udF9yZWFkX3Bvc3NpYmxlKQo+ICsJCWluZm8ubGVuZ3RoID0gbmFuZGRl
dl9lcmFzZWJsb2NrX3NpemUobmFuZCk7Cj4gIAlpbmZvLm9wX3RtcGwgPSAqc3BpbmFuZC0+b3Bf
dGVtcGxhdGVzLnJlYWRfY2FjaGU7Cj4gIAlkZXNjID0gZGV2bV9zcGlfbWVtX2Rpcm1hcF9jcmVh
dGUoJnNwaW5hbmQtPnNwaW1lbS0+c3BpLT5kZXYsCj4gIAkJCQkJICBzcGluYW5kLT5zcGltZW0s
ICZpbmZvKTsKPiBAQCAtMTEzMiw2ICsxMTMxLDkgQEAgc3RhdGljIGludCBzcGluYW5kX2NyZWF0
ZV9kaXJtYXAoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICAJCXJldHVybiAwOwo+
ICAJfQo+ICAKPiArCS8vIEVDQyByZWFkaW5nL3dyaXRpbmcgYWx3YXlzIGhhcHBlbiBpbiBub24t
Y29udGludW91cyBtb2RlCgpUaGlzIGNvbW1lbnQgZG9lcyBub3Qgc291bmQgaGVscGZ1bCwgYXQg
bGVhc3QgSSBkbyBub3QgdW5kZXJzdGFuZCBpdD8KKGFuZCB0aGUgY29tbWVudCBzdHlsZSBzaG91
bGQgYmUgLyogKi8pCgo+ICsJaW5mby5sZW5ndGggPSBuYW5kZGV2X3BhZ2Vfc2l6ZShuYW5kKSAr
IG5hbmRkZXZfcGVyX3BhZ2Vfb29ic2l6ZShuYW5kKTsKPiArCj4gIAlpbmZvLm9wX3RtcGwgPSAq
c3BpbmFuZC0+b3BfdGVtcGxhdGVzLnVwZGF0ZV9jYWNoZTsKPiAgCWluZm8ub3BfdG1wbC5kYXRh
LmVjYyA9IHRydWU7Cj4gIAlkZXNjID0gZGV2bV9zcGlfbWVtX2Rpcm1hcF9jcmVhdGUoJnNwaW5h
bmQtPnNwaW1lbS0+c3BpLT5kZXYsCgpNYXkgSSBzdWdnZXN0IHRvIHVzZSB0d28gZGlmZmVyZW50
IGRpcm1hcCBpbmZvcz8gT25lIHdpdGggYSBsYXJnZSBzaXplCihmb3IgcmVhZHMpIGFuZCBhIHBh
Z2Utc2l6ZWQgb25lIGZvciBvdGhlciBjYXNlcyAoaW5jbHVkaW5nIHRoZSBmYWxsYmFjawp5b3Un
cmUgaW50cm9kdWNpbmcgaW4gUEFUQ0ggMikuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
