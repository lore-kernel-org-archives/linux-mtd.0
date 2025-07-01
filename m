Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B82BC7EE30
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTCys1WmBZP45Bshvya3bjksjSA8d/HUyUWlz/g2UbM=; b=vO3LX0jWSmfvIP
	PfL3LJgwzJII+x+Kj0Vzn8XWRQkT5/ew1bX5aRS9qV2J5ZhZJ2Q62wSR+GAPuM/szu2XBdLM8uuzy
	kMWhkfndoDU+HibXkTTLYKQXa8hQHSSHPNkEbGpOewma1fFiG/8XK6mimGPFRCI1jCOY55OIG/bQW
	8ObyVNOs06dzIUk4hi97nM7HVJ1vkFoFFXa/Wu9Szv2F/bJ7HDQKdYqynwrbyJ1YdN77bkvKD+2Pr
	UE/I3wXVVNIk7TzhK1qjhwRZVylqjC1JXOSC01Cf0xj3yQ6wtiWTB2fuoyLeaG6/V+AsbvN9m9vy3
	uRVIyG1TnPYdDtHl06PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdmV-000000061qH-2QZt;
	Tue, 01 Jul 2025 16:24:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWc8e-00000005kJ2-2v6H;
	Tue, 01 Jul 2025 14:39:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3C91205B2;
	Tue,  1 Jul 2025 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751380750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prNrXolkjfaud3bDDiSuiyyGfRfPFPDh9Iys4bsEwLk=;
	b=kOYb2rUxixLfppnTRvGBVq741Tu4dTNQQ/xfJWB/FikMaWEB7QW3H1NB6sI7ZgSbPp7SUX
	81/jelmC1MZn0M0e5aTZpZZiZrQmZ6KXAIilp3MLnnLfsqjApojvbTsyZzwWNwUf04o8H6
	a46No/sjlgOzlA/V7TLEDpXLThDU64bxCh0RejAroK5fDMVFzDljDpihYNkLJj6JiR/d/0
	k1QsbxuQYM53YsqUH+xfpKe42PiSzbkbTQHj8fA66tlQdvCQJvTiDudpDNTubV2FzCeNgi
	4PqYs4PE5cOqz6Crbb5q2lbB9TLvvO6xd09cIP5yNsnIyHX0H1H8V2TCiPrT8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
In-Reply-To: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
	(A. Sverdlin's message of "Tue, 1 Jul 2025 15:33:28 +0200")
References: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 16:39:07 +0200
Message-ID: <87ikkcou0k.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheekkeegvdfgudevueetfeekuddvhefhgeekheduueejudeukedtveejkeehteeunecuffhomhgrihhnpehmihgtrhhotghhihhprdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrt
 ghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_073912_871524_90869E30 
X-CRM114-Status: GOOD (  15.38  )
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

SGVsbG8gQWxleGFuZGVyLAoKT24gMDEvMDcvMjAyNSBhdCAxNTozMzoyOCArMDIsICJBLiBTdmVy
ZGxpbiIgPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4gd3JvdGU6Cgo+IEZyb206IEFs
ZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPgo+Cj4gSGF2
aW5nIHNldHVwIHRpbWUgMCB2aW9sYXRlcyB0QVIsIHRDTFIgb2Ygc29tZSBjaGlwcywgZm9yIGlu
c3RhbmNlCj4gVE9TSElCQSBUQzU4TlZHMlMzRVRBSTAgY2Fubm90IGJlIGRldGVjdGVkIHN1Y2Nl
c3NmdWxseSAoZmlyc3QgSUQgYnl0ZQo+IGJlaW5nIHJlYWQgZHVwbGljYXRlZCwgaS5lLiA5OCA5
OCBkYyA5MCAxNSA3NiAxNCAwMyBpbnN0ZWFkIG9mCj4gOTggZGMgOTAgMTUgNzYgLi4uKS4KPgo+
IEF0bWVsIEFwcGxpY2F0aW9uIE5vdGVzIHBvc3R1bGF0ZWQgMSBjeWNsZSBOUkRfU0VUVVAgd2l0
aG91dCBleHBsYW5hdGlvbgo+IFsxXSwgYnV0IGl0IGxvb2tzIG1vcmUgYXBwcm9wcmlhdGUgdG8g
anVzdCBjYWxjdWxhdGUgc2V0dXAgdGltZSBwcm9wZXJseS4KPgo+IFdpdGhvdXQgdGhlIGZpeCB3
ZSd2ZSBtZWFzdXJlZCAtMm5zIHRBUiBkZWxheSAoUkVuIGFzc2VydGVkIGJlZm9yZSBBTEUKPiBk
ZWFzc2VydCEpOyB3aXRoIHRoZSBmaXggLS0gNjBucyAoc3ViamVjdCB0byBtb2R1bGUgY2xvY2sp
Lgo+Cj4gWzFdIExpbms6IGh0dHBzOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2FlbURv
Y3VtZW50cy9kb2N1bWVudHMvTVBVMzIvQXBwbGljYXRpb25Ob3Rlcy9BcHBsaWNhdGlvbk5vdGVz
L2RvYzYyNTUucGRmCj4gRml4ZXM6IGY5Y2UyZWRkZjE3NiAoIm10ZDogbmFuZDogYXRtZWw6IEFk
ZCAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkgaG9va3MiKQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPgoKUGxlYXNlIGFk
ZCBDYzogc3RhYmxlCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNv
bnRyb2xsZXIuYyB8IDE3ICsrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCBkZWRjY2E4N2RlZmM3Li44NDRkZjcyZjQ1
MDYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJv
bGxlci5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVy
LmMKPiBAQCAtMTM3NywxNCArMTM3NywyNSBAQCBzdGF0aWMgaW50IGF0bWVsX3NtY19uYW5kX3By
ZXBhcmVfc21jY29uZihzdHJ1Y3QgYXRtZWxfbmFuZCAqbmFuZCwKPiAgCWlmIChyZXQpCj4gIAkJ
cmV0dXJuIHJldDsKPiAgCj4gKwkvKgo+ICsJICogUmVhZCBzZXR1cCB0aW1pbmcgZGVwZW5kcyBv
biB0aGUgb3BlcmF0aW9uIGRvbmUgb24gdGhlIE5BTkQ6Cj4gKwkgKgo+ICsJICogTlJEX1NFVFVQ
ID0gbWF4KHRBUiwgdENMUikKPiArCSAqLwo+ICsJdGltZXBzID0gbWF4KGNvbmYtPnRpbWluZ3Mu
c2RyLnRBUl9taW4sIGNvbmYtPnRpbWluZ3Muc2RyLnRDTFJfbWluKTsKPiArCW5jeWNsZXMgPSBE
SVZfUk9VTkRfVVAodGltZXBzLCBtY2twZXJpb2Rwcyk7Cj4gKwl0b3RhbGN5Y2xlcyArPSBuY3lj
bGVzOwo+ICsJcmV0ID0gYXRtZWxfc21jX2NzX2NvbmZfc2V0X3NldHVwKHNtY2NvbmYsIEFUTUVM
X1NNQ19OUkRfU0hJRlQsCj4gKwkJCQkJICBuY3ljbGVzKTsKCk5pdCBhcyB5b3UnbGwgbmVlZCB0
byByZXNlbmQgYW55d2F5IDopLCB0aGlzIGNhbiBiZSBvbiB0aGUgcHJldmlvdXMgbGluZS4KCk90
aGVyd2lzZSBsZ3RtLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
