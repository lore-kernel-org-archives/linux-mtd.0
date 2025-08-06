Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28BDC87FD1
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Aug 2025 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9zoOMWZa9qT/FBn6WrlHeSrREWqWE4nF28DwENoB2c=; b=qkz0SwEOuDibLv
	BV4oizV/Wba7163Mm8/q9INDR/Y8fSUAMEY1dRPqI9I4LH+vBDjESg5TJzt+QYEFg/rhMQMuDAWoH
	wLXpCard+8aO71nvZ1+FVTpHUnOwXX6iQmmRs6UHWR65MM5tChC25h18PvA9XU/Rg7WqmR2Y7G1eM
	AqugrkJ+gXD76TnmgH/TUgCqFkDZocH7oqWAnH64D7D2FYYKzhDZmzXiud/45XEvDZUot5UFbOBYE
	IfuclcVs6JciDEHYA8DWZpKt6IvB6H7Wpt4QDXSzSsfYLZuLh6JWT69zVKUSIPGUKosyQ8ilidkVP
	cKQptHKblMMwdwPYKzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaEc-0000000Ejxx-2Trd;
	Wed, 06 Aug 2025 09:14:58 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uja3p-0000000EhyV-47s5;
	Wed, 06 Aug 2025 09:03:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BC1A42E80;
	Wed,  6 Aug 2025 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754471025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2SJZ+WkY9JJeEOIvvNfCty+u80yCMpablRY/xpxidc=;
	b=m1h55Hf8VZKSJxHXFh9xDevBv211iW+KdfELcDweNdedMwQTyjFCgPBdxYGqo8tRNcQlfR
	81Ub7UJjEPC3WwYXwArokgCufykW4OTShM5w778954lVUssyGkw7XGZ3gmMiauiv+mDvOg
	pGT4fChW9kWLrWG6Mtfdtn3t4cKuK8ahYxRb29T7v0gaO+yHJWWYxfDjICR4JUo8LsaTbL
	2F35PG4l7NzS8EwwWwe14hKyjxQ4ntouLF/5ap4rbNgq5juZwPJ/JcqP/n5SKdKbTE+fHc
	A6vQltP2e0YGTjoYf8Ga5V9B85+7x74zG3ltQasDqI9wWgOLkIwr5fSbUomVfg==
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
Subject: Re: [PATCH 2/4] drivers: mtd: spi-nand: try a regular dirmap if
 creating a dirmap for continuous reading fails
In-Reply-To: <74646064-0c8c-46b9-8ec3-653c4f80b70f@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Tue, 5 Aug 2025 18:35:32 +0300")
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
	<20250804192132.1406387-3-mikhail.kshevetskiy@iopsys.eu>
	<87jz3hhjlj.fsf@bootlin.com>
	<74646064-0c8c-46b9-8ec3-653c4f80b70f@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 06 Aug 2025 11:03:43 +0200
Message-ID: <87cy98g6ts.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehmihhkhhgrihhlrdhkshhhvghvvghtshhkihihsehiohhpshihshdrvghupdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlohhrvghniihosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrgihrdhlihhusegrihhrohhhrgdrtghomhdprhgtphhtthhopegsrhhoohhnihgvs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmmhhkuhhrsggrnhhovhesshgrlhhuthgvuggvvhhitggvshdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_020350_850771_C03B6584 
X-CRM114-Status: GOOD (  12.70  )
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

SGVsbG8sCgo+Pj4gQEAgLTExMTQsMTEgKzExMTQsMzIgQEAgc3RhdGljIGludCBzcGluYW5kX2Ny
ZWF0ZV9kaXJtYXAoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+Pj4gIAo+Pj4gIAlz
cGluYW5kLT5kaXJtYXBzW3BsYW5lXS53ZGVzYyA9IGRlc2M7Cj4+PiAgCj4+PiAtCWlmIChzcGlu
YW5kLT5jb250X3JlYWRfcG9zc2libGUpCj4+PiArCWRlc2MgPSBOVUxMOwo+Pj4gKwlpZiAoc3Bp
bmFuZC0+Y29udF9yZWFkX3Bvc3NpYmxlKSB7Cj4+PiArCQkvKgo+Pj4gKwkJICogc3BpLWNvbnRy
b2xsZXJzIG1heSByZXR1cm4gYW4gZXJyb3IgaWYgaW5mby5sZW5ndGggaXMKPj4+ICsJCSAqIHRv
byBsYXJnZQo+Pj4gKwkJICovCj4+PiAgCQlpbmZvLmxlbmd0aCA9IG5hbmRkZXZfZXJhc2VibG9j
a19zaXplKG5hbmQpOwo+Pj4gLQlpbmZvLm9wX3RtcGwgPSAqc3BpbmFuZC0+b3BfdGVtcGxhdGVz
LnJlYWRfY2FjaGU7Cj4+PiAtCWRlc2MgPSBkZXZtX3NwaV9tZW1fZGlybWFwX2NyZWF0ZSgmc3Bp
bmFuZC0+c3BpbWVtLT5zcGktPmRldiwKPj4+IC0JCQkJCSAgc3BpbmFuZC0+c3BpbWVtLCAmaW5m
byk7Cj4+PiArCQlpbmZvLm9wX3RtcGwgPSAqc3BpbmFuZC0+b3BfdGVtcGxhdGVzLnJlYWRfY2Fj
aGU7Cj4+PiArCQlkZXNjID0gZGV2bV9zcGlfbWVtX2Rpcm1hcF9jcmVhdGUoJnNwaW5hbmQtPnNw
aW1lbS0+c3BpLT5kZXYsCj4+PiArCQkJCQkJICBzcGluYW5kLT5zcGltZW0sICZpbmZvKTsKPj4+
ICsJfQo+Pj4gKwo+Pj4gKwlpZiAoSVNfRVJSX09SX05VTEwoZGVzYykpIHsKPj4gSGVyZSBpZiB0
aGUgcHJvYmxlbSBpcyBjb250aW51b3VzIHJlYWRpbmcsIEkgZXhwZWN0IGFuIGVycm9yIGFuZCBu
b3QgYQo+PiBOVUxMIHBvaW50ZXIuCj4gTlVMTCBpcyBwb3NzaWJsZSBpZiBmbGFzaCBkb2VzIG5v
dCBzdXBwb3J0cyBjb250aW51b3VzIHJlYWRpbmcKPj4KPj4+ICsJCS8qCj4+PiArCQkgKiBjb250
aW51b3VzIHJlYWRpbmcgaXMgbm90IHN1cHBvcnRlZCBieSBmbGFzaCBvcgo+PiBOb3QgYnkgdGhl
IGZsYXNoLCBoZXJlIGlmIHdlIGdldCBhbiBlcnJvciwgaXQgaXMgdGhlIHNwaSBjb250cm9sbGVy
Cj4+IChzdGlsbCB3aXRob3V0ICctJyA7KSApIHRoYXQgZmFpbHMgKHBsZWFzZSBmaXggdGhlIGNv
bW1lbnQpLgo+Cj4gd2UgY2FuIGdvIGhlcmUgaW4gMiBjYXNlczoKClllcywgYW5kIHRoYXQgaXMg
bWlzbGVhZGluZy4gSXQgZmVlbHMgbGlrZSB0aGUgY29kZSBpcyB1bmNsZWFyIHRoaXMKd2F5LiBD
b3VsZCB3ZSBmaW5kIGEgYmV0dGVyIG9yZ2FuaXphdGlvbj8KCj4gMSkgc3BpbmFuZC0+Y29udF9y
ZWFkX3Bvc3NpYmxlIGlzIGZhbHNlIChmbGFzaCBkb2VzIG5vdCBzdXBwb3J0cwo+IGNvbnRpbnVv
dXMgcmVhZGluZykKPgo+IDIpIHNwaSBjb250cm9sbGVyIHJldHVybnMgYW4gZXJyb3IgKHNwaSBj
b250cm9sbGVyIGRvZXMgbm90IGxpa2UKPiBjb250aW51b3VzIHJlYWRpbmcpCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
