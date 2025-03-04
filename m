Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F648C021B8
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mz30gqTj/loGMmq5wocKS19kVFPaN5+xZ+50iUwWiuM=; b=ZYPPbhm8rgFdj7
	wNTOs+nSMREPgI3RvIxE2Cjn9xvqXBG/hIib7CpP5rUeMaZfgl71an4lkj99tBm+vYaav2oDNi7DO
	FUfrTtZprO6VgLTtzJOQvjx1djDtbgGAH5FkgTruqmWZRP1kDGUtfWxDQNLKpgZYgWXbWaFzbJnpH
	01nGfB79rXdtKak1UOy3QCsHVKI3pMsJkjJrdIYCJHYPx+tT6GCre/o5WgVORmi+R0HtZig9eQdD0
	2o1o31XzBYtEqB6CvhFGIwU2kewXG9uOYaqHI34QJt24FQne3lu7FKPgoek0CYscYyd0abKpLLC0M
	dfmx7YpcWckWt3oeLlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpShB-00000004qqY-07tc;
	Tue, 04 Mar 2025 13:52:29 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSh7-00000004qpS-3fb2
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 13:52:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5957E442DF;
	Tue,  4 Mar 2025 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741096343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgvnIz652GdCe+1GOXltyjv7Y3wMFnRZ17oZzmJ1J3I=;
	b=aumIJXyw7r4wXdnxFIp7qTFxnKKhDnYzaa1H0Z4eQxjKOTu/R4qWGqqHuOXaLyUBFEPdBR
	UJ+H+aYc42fQWZQi/72HimeHW45R+AvJcSRTVhORNnJFiKN18i1U/p4EYPSKwtmA8ERprS
	IwzuB19aLvyrN9t2OUGl+qnZIHn6NQbcXTsdVF6OjBRLPU6olQwlp5o6trMvuSye8q5PIY
	UmdeL284CV3nQ7sDsIaEGbCbTPCADsep0sSLV5VXb5dkS3JdTVmYfzXz5EY2mj9PXgSAlp
	le2UMWyql+a4uaTUdPGmcSZ9LwpBOeoqbzx+hOKEGq+KXIz6TRHTw5atQtnraQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-media@vger.kernel.org
Subject: Re: [PATCH v12 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <CAJhJPsUw7YGKfBuFtUirOGuCA9hV6e-wjrL4L9b-5kmuVUW=ow@mail.gmail.com>
	(Keguang Zhang's message of "Tue, 4 Mar 2025 19:46:39 +0800")
References: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
	<20250121-loongson1-nand-v12-2-53507999de39@gmail.com>
	<87tt972dt0.fsf@bootlin.com>
	<CAJhJPsUw7YGKfBuFtUirOGuCA9hV6e-wjrL4L9b-5kmuVUW=ow@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Mar 2025 14:52:21 +0100
Message-ID: <87a5a0299m.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvvhhnuhhllhdokhgvghhurghnghdriihhrghnghdrghhmrghilhdrtghomheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_055226_061827_E2A824B2 
X-CRM114-Status: GOOD (  10.23  )
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

SGVsbG8gS2VndWFuZywKCj4+ID4gK3N0YXRpYyBpbnQgbHMxeF9uYW5kX2V4ZWNfb3Aoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgbmFuZF9vcGVyYXRpb24gKm9wLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
IGJvb2wgY2hlY2tfb25seSkKPj4gPiArewo+PiA+ICsgICAgIGludCByZXQ7Cj4+ID4gKwo+Pgo+
PiAgICAgICAgIGlmIChjaGVja19vbmx5KSA/Cj4KPiBTb3JyeSwgSSdtIG5vdCBzdXJlIGlmIEkg
dW5kZXJzdGFuZCBjb3JyZWN0bHkuCj4gbmFuZF9vcF9wYXJzZXJfZXhlY19vcCgpIG9ubHkgY2hl
Y2tzIHBhdHRlcm5zIGFuZCB3aWxsIHNraXAKPiBwYXR0ZXJuLT5leGVjKCkgd2hlbiBjaGVja19v
bmx5ID0gdHJ1ZS4gVGhlcmVmb3JlLAo+IGxzMXhfbmFuZF9jaGVja19vcCgpIHNob3VsZCBoYW5k
bGUgYWxsIG9wY29kZSBjaGVja3MgaW4gdGhhdCBjYXNlLCBhbmQKPiBsZWF2ZSBjaGVja19vbmx5
ID0gZmFsc2UgdG8gbmFuZF9vcF9wYXJzZXJfZXhlY19vcCgpLgo+IFRoZW4gdGhlIGNvZGUgd2ls
bCByZXR1cm4gdG86Cj4KPiBpZiAoY2hlY2tfb25seSkKPiAgICAgICAgIHJldHVybiBsczF4X25h
bmRfY2hlY2tfb3AoY2hpcCwgb3ApOwo+Cj4gcmV0dXJuIG5hbmRfb3BfcGFyc2VyX2V4ZWNfb3Ao
Y2hpcCwgJmxzMXhfbmFuZF9vcF9wYXJzZXIsIG9wLCBjaGVja19vbmx5KTsKPgo+IEFtIEkgcmln
aHQ/CgpBYnNvbHV0ZWx5LCB5ZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
