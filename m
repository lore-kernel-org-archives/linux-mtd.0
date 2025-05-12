Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43052C3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4OLoZZW+fzhUAla/QPzVKGjnlJLRGneIc4gPZX8xc8=; b=AGG8OtfSO+d4qD
	W9zn2Oe76iEK507U9Ot8Axa9VuG7vcGy1Er150bJHoP4YeCsg1q2fhicEMWjbrTKKF39cnN2BNUb+
	Q6P2I2u1oKTZlbXAuQXZdPsP+L+qDjds2Uk/hFGt7OlYCc0qyZssuwGbkIsED1Rn8VizW9NhD5DyH
	s1VcNkPOuXrnRNfx3WyMaekKGDpkMHjtql4lBBzUbL1JiTYn9BURdFw/ESvXQnRlZEjuys5AuRIty
	lY6c59RQ7NpuWqgKT/bhdyjsXB3Lc0iTKwcA77E4Aec96tNoqam69Qo0PAdjyZOu5ucJBJQz+sRDc
	ETnwr4C33rusKdCT+C0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO2j-00000008fwg-1jAC;
	Mon, 12 May 2025 07:57:45 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO2Y-00000008fuQ-2lWz
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 07:57:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4263C443B0;
	Mon, 12 May 2025 07:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747036649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0UXmvT4l/lV+IOemda0bORxvLERjQAhLzRUt2IKiC9A=;
	b=cXBu04rnMwdt723IhMe6evlmHTiMH6v6VHqlcJfe8ePya2grX9TZw9ykAIElFNUeyZkPmk
	bAq7cjWpS1oEF0Bvwny7r1eKLNMAldacyovQ2FJ4IcFWlzsDBqfhUdh76Q8XXl14ldpCHB
	EBrPBuiX0gu9E5D5GY4Tu1Za0gh22dsg1TuGMlaore+S1z/xPWlIzZrT3/KPth+sk14Nnr
	WR3d3fDJTlJ9+NvrGOr7Ya+eAqgrY+HzQ9aayE4Nk+NM61CLXLt679mTdNwOLttBKbm8EP
	GboUsV5ccTuBxGV7VveZGaz6bW0L556OopZYkdrf+AlkaR+fiBM/oNE90Mq9vA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Luke Wang
 <ziniu.wang_1@nxp.com>,  "broonie@kernel.org" <broonie@kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "michael@walle.cc" <michael@walle.cc>,  "p.yadav@ti.com"
 <p.yadav@ti.com>,  "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com"
 <vigneshr@ti.com>,  Bough Chen <haibo.chen@nxp.com>,  Han Xu
 <han.xu@nxp.com>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
In-Reply-To: <mafs0zffo3gea.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	07 May 2025 09:43:25 +0000")
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
	<10b40148-b949-442d-9d43-0db09517269a@linaro.org>
	<mafs0zffo3gea.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 09:57:27 +0200
Message-ID: <87cycep8go.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepiihinhhiuhdrfigrnhhgpgdusehngihprdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhsphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggt
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_005734_841222_92A5FAC7 
X-CRM114-Status: GOOD (  17.66  )
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

SGVsbG8sCgpPbiAwNy8wNS8yMDI1IGF0IDA5OjQzOjI1IEdNVCwgUHJhdHl1c2ggWWFkYXYgPHBy
YXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBMdWtlLAo+Cj4gT24gVHVlLCBBcHIgMjkg
MjAyNSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPgo+PiBPbiA0LzI5LzI1IDEwOjAzIEFNLCBMdWtl
IFdhbmcgd3JvdGU6Cj4+PiBIaSBQcmF0eXVzaCwKPj4+IAo+Pj4gSSdtIGZvbGxvd2luZyB1cCBv
biB0aGlzIHBhdGNoIHNlcmllcyBbMV0gQXZvaWQgb2RkIGxlbmd0aC9hZGRyZXNzIHJlYWQvCj4+
PiB3cml0ZXMgaW4gOEQtOEQtOEQgbW9kZS4gV2hpbGUgc29tZSBvZiB0aGUgc2VyaWVzIGhhcyBi
ZWVuIG1lcmdlZCwgdGhlCj4+PiBwYXRjaCA0LTYgcmVtYWlucyB1bm1lcmdlZC4KPj4+IAo+Pj4g
SW4gZmFjdCwgd2UgYWxzbyBlbmNvdW50ZXJlZCBzaW1pbGFyIHJlYWQvd3JpdGUgaXNzdWUgb2Yg
b2RkIGFkZHJlc3MvCj4+PiBsZW5ndGggd2l0aCBOWFAgRlNQSSBjb250cm9sbGVyIChzcGktbnhw
LWZzcGkuYykuIEN1cnJlbnRseSwgd2UgaGFuZGxlZAo+Pj4gdGhlIG9kZCBhZGRyZXNzL2xlbmd0
aCBpbiB0aGUgY29udHJvbGxlciBkcml2ZXIsIGJ1dCBJIHRoaW5rIHRoaXMgc2hvdWxkCj4+PiBi
ZSBhIGNvbW1vbiBpc3N1ZSBpbiB0aGUgb2N0YWwgZHRyIG1vZGUuIFdhcyB0aGVyZSBhIHRlY2hu
aWNhbCByZWFzb24KPj4+IGZvciBub3QgbWVyZ2luZyB0aGUgY29yZSBsYXllciBzb2x1dGlvbj8K
Pj4KPj4gSSBndWVzcyBJIHN0dW1ibGVkIG9uIHRob3NlIHNtYWxsIGNvbW1lbnRzIGFuZCBkaWQg
bm90IGNvbnNpZGVyIHRoZQo+PiBncmVhdGVyIGJlbmVmaXQgb2YgdGFraW5nIHRoZSBwYXRjaGVz
LiBObyBvbmUgY2FyZWQgYW5kIHdlIGZvcmdvdCBhYm91dAo+PiBpdC4gUGxlYXNlIGFkZHJlc3Mg
dGhlIGNvbW1lbnRzIGFuZCByZXN1Ym1pdC4KPgo+IFllcywgaXQgc2hvdWxkIGhhdmUgYmVlbiBh
IHNpbXBsZSBuZXh0IHJldmlzaW9uIGZyb20gbWUgYnV0IGFwcGFyZW50bHkKPiBpdCBmZWxsIHRo
cm91Z2ggdGhlIGNyYWNrcy4gSSBkbyBzdHJvbmdseSBhZ3JlZSB0aGF0IHRoaXMgc2hvdWxkIGJl
IGRvbmUKPiBpbiBTUEkgTk9SLCBhbmQgbm90IGluIGNvbnRyb2xsZXIgZHJpdmVycy4gU28gaXQg
d291bGQgYmUgZ3JlYXQgaWYgeW91Cj4gY2FuIHJlc3BpbiB0aGUgcmVtYWluaW5nIHBhdGNoZXMg
b2YgdGhlIHNlcmllcy4KClRoZSBmYWN0IGlzIHRoYXQgd2Ugd2lsbCBoYXZlIG9jdGFsIERUUiBz
dXBwb3J0IGluIFNQSSBOQU5EIGFzIHdlbGwgYXQgc29tZQpwb2ludCwgaGVuY2UgYSBjb21tb24g
c29sdXRpb24gd291bGQgYmUgd2VsY29tZSBhcyB3ZSB3aWxsIGxpa2VseSBmYWNlCnNpbWlsYXIg
cHJvYmxlbXMgd2hlbiBwZXJmb3JtaW5nIHRoZXNlIHVuYWxpZ25lZCBhY2Nlc3Nlcy4gSSBkb24n
dCBrbm93CmhvdyBmZWFzaWJsZSBpdCBpcyB5ZXQsIGJ1dCBpZiB3ZSBoYXZlIGEgZml4IGZvciBT
UEkgTk9SLCB3ZSB3aWxsIG5lZWQKc29tZXRoaW5nIHNpbWlsYXIgZm9yIFNQSSBOQU5ELgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
