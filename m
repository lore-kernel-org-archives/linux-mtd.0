Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E511C87FCB
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG0kHWd8TKxY1LERLwIS0k9+CwrS273Nyrkb9MwS5B4=; b=JMxP5wsnI/7MVy
	9DjAEfKwOMFxSPH1QQeVGtAVZNPJ6fOgTfB+6n01sFNTksmWxWyzdqq3w4vIx5AJ43oGHSgRbWier
	Nse1zIdtKiD2F3Gzze+e5ULdVUfE1X2lfYin/xUi6gvhvKoioJRNGy52OIOQj0VI2y5gQXY6cqzAo
	clAF3wGbNLeQ4Xya5HW0NZxdW3FVn/Ak80cB3XMau4SBSZBynqiZhJWWa1tvxu02iDeqLLvCwNgR2
	r75xytYd41pKsADaNpZnsK45dvpBQoBcQoHtwpVp+BS8uoA1ZI5at9poIWO0HJWVuI26vZWDcQzrT
	Qiz/ucF1HJ5OUyO67Z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2sn-000000014lj-00BW;
	Wed, 30 Jul 2025 09:13:57 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2sk-000000014lH-0GvT
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 09:13:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBFCA43176;
	Wed, 30 Jul 2025 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753866830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8j+HOjEuqgjt4NUWrWNaCZst/RjQqcT8RPfplsJswCc=;
	b=kEEee4leBC7lJw3lub0jiNnKM2ew0eiIj1TFbv3AQvcgjpRX39xF5r0xc8mST69AMFr1U4
	0HAzfNYxoxMRWL38ejUzlwyWS323col+nZHChT8CJOumLJH/zuK/mQV7g6cxa28c3DDPUv
	O26DBh8mcsY1Lmx7mGrInves6eBu5PJSr0+AptIY7qV1FjAVwkUowO4lyOPwyG8fdeA0Sw
	mzaysIS5YIiKdYsgN5poLzVvCe2gF7sJ9O82Go3uhbnOxAIw5B6iUXX8ztmPKa0TN+pmqx
	VbDznpl2yfrltj/KLkH4Wr89xpH5L1pEPp2dMnuRhCKChc+Frwo1WSbzk9eMMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Yogesh S <yogeshs@ti.com>,  Santhosh Kumar K
 <s-k6@ti.com>,  Steam Lin <STLin2@winbond.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/8] Enhance Winbond SPI NAND support
In-Reply-To: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
	(Miquel Raynal's message of "Wed, 18 Jun 2025 14:14:17 +0200")
References: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 30 Jul 2025 11:13:49 +0200
Message-ID: <87v7nam46q.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevteeiudefudfgjeevheevgfevgfdvheelfeekudettdffvefhgeejgefgkeeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohephihoghgvshhhshesthhirdgtohhmpdhrtghpthhtohepshdqkheisehtihdrtghomhdprhgtphhtthhopefuvffnihhnvdesfihinhgso
 hhnugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsphhisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_021354_597755_399F9893 
X-CRM114-Status: GOOD (  19.39  )
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

SGVsbG8sCgpPbiAxOC8wNi8yMDI1IGF0IDE0OjE0OjE3ICswMiwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IEJvdGggdzI1bioqancgYW5kIHczNW4q
Kmp3IGNoaXBzIGhhdmUgYSAibm9ybWFsIiBhbmQgYSAiaGlnaCBzcGVlZCIKPiBtb2RlLiBJbiBv
cmRlciB0byB1c2UgdGhlIGhpZ2ggc3BlZWQgbW9kZXMsIHdlIG5lZWQgdG8gY29uZmlndXJlCj4g
aW50ZXJuYWwgcmVnaXN0ZXJzIGFuZCBhZGFwdCB0aGUgbnVtYmVyIG9mIGR1bW15IGN5Y2xlcy4g
VGhlIGJlbmVmaXRzCj4gYXJlIHRvbyBpbnRlcmVzdGluZyBmb3Igbm90IHBheWluZyBhdHRlbnRp
b24gdG8gdGhpcyBsaXR0bGUgZXh0cmEKPiBjb25maWd1cmF0aW9uLiBJbiBwYXJ0aWN1bGFyLCBp
dCBpcyBhbiBpbXBvcnRhbnQgYnVpbGRpbmcgYmxvY2sgZm9yIHRoZQo+IGludHJvZHVjdGlvbiBv
ZiBQSFkgY2FsaWJyYXRpb24gb24gVEkgU1BJIGNvbnRyb2xsZXJzLiBXaXRoIHRoZXNlCj4gY2hh
bmdlcyBjb21iaW5lZCwgdGhlIGZyZXF1ZW5jeSB1c2VkIG9uIHRoZXNlIGNoaXBzIGNhbiBiZSBi
dW1wZWQgZnJvbQo+IH4yNU1IeiB1cCB0byAxNjZNSHouCj4KPiBUaGlzIHNlcmllcyB3YXMgdGVz
dGVkIG9uIFRJIEFNNjJBIFNLIHdpdGggYSBXMzVOMDFKVyBhbmQgb24gTnV2b3Rvbgo+IE1BMzVE
IHdpdGggYSBXMjVOMDFKVy4gQXQgbG93IHNwZWVkcywgdGhpcyBzZXJpZXMgZG9lcyBub3QgYnJp
bmcgYW55Cj4gaW1wcm92ZW1lbnQuIEhvd2V2ZXIgd2hlbiBlbmFibGluZyBoaWdoIHNwZWVkIG1v
ZGVzIChvbiBUSSdzIHBsYXRmb3JtKSwKPiB0aGUgZGlmZmVyZW5jZSBpcyBvdXRzdGFuZGluZzoK
Pgo+IFczNU4qSlcgcnVubmluZyBpbiAxUy04Uy04UyBAIDI1TUh6Ogo+Cj4gCSBlcmFzZWJsb2Nr
IHJlYWQgc3BlZWQgaXMgOTU1MiBLaUIvcwo+IAkgcGFnZSByZWFkIHNwZWVkIGlzIDk1MTYgS2lC
L3MKPiAJIDIgcGFnZSByZWFkIHNwZWVkIGlzIDk1NTIgS2lCL3MKPgo+IFczNU4qSlcgcnVubmlu
ZyBpbiAxUy04Uy04UyBAIDE2Nk1IejoKPgo+IAllcmFzZWJsb2NrIHJlYWQgc3BlZWQgaXMgMzU1
NTUgS2lCL3MKPiAJcGFnZSByZWFkIHNwZWVkIGlzIDMzNjg0IEtpQi9zCj4gCTIgcGFnZSByZWFk
IHNwZWVkIGlzIDM1MDY4IEtpQi9zCj4KPiBFbmFibGluZyBoaWdoIHNwZWVkcyBjdXJyZW50bHkg
cmVxdWlyZXMgYXBwbHlpbmcgZXh0cmEgcGF0Y2hlcyBmcm9tIFRJCj4gdG8gZW5hYmxlIFBIWSBj
YWxpYnJhdGlvbi4gVGhleSBhcmUgY3VycmVudGx5IGluIHRoZSB1cHN0cmVhbWluZyBwcm9jZXNz
Lgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL21pcXVlbHJheW5hbC9saW51eC90cmVlL3dp
bmJvbmQvNi4xNi1yYzEvb2N0YWwtcGh5Cj4KPiBJbiBvcmRlciB0byBpbnRyb2R1Y2UgYWxsIHRo
ZXNlIHZhcmlhbnRzIGFuZCBkZXJpdmUgdGhlIHF1aWNrZXN0IG9uZSwgSQo+IGhhZCB0byBpbXBy
b3ZlIGEgYml0IHRoZSBoZWxwZXIgZGVyaXZpbmcgdGhlIHRpbWUgYW4gb3BzIHdvdWxkCj4gdGFr
ZS4gVGhlc2UgY2hhbmdlcyBjYW4gZ28gdGhyb3VnaCB0aGUgc3BpIHRyZWUsIHRoZSBvdGhlciBw
YXRjaGVzIGRvCj4gbm90IGRlcGVuZCBvbiB0aGVtIGFuZCB0aGUgcGVyZm9ybWFuY2UgaGl0IGlz
IHJhdGhlciBhY2NlcHRhYmxlIHdpdGhvdXQuCj4KPiBXaGlsZSBhdCBhZGRpbmcgbWF4aW11bSBv
cGVyYXRpb24gZnJlcXVlbmNpZXMsIEkgcmVhbGl6ZWQgSSBnb3QgbXlzZWxmCj4gY29uZnVzZWQg
d2l0aCB0aGUgbWFjcm8gcGFyYW1ldGVycyBkdWUgdG8gc29tZSBvZiB0aGVtIGJlaW5nCj4gb3B0
aW9uYWwgKHdpdGggdmFyaWFibGUgYXJndW1lbnRzIGluIG1hY3JvcykuIEkgZGVjaWRlZCBpdCB3
YXMgdG9vIGVycm9yCj4gcHJvbmUgc28gSSBwcm9wb3NlIHRvIGFkZCB0aGVzZSB2YWx1ZXMgb24g
YWxsIFJFQURfRlJPTV9DQUNIRQo+IHZhcmlhbnRzICh3aGVyZSB0aGV5IGFyZSBvZnRlbiByZWxl
dmFudCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgo+IC0tLQo+IE1pcXVlbCBSYXluYWwgKDgpOgo+ICAgICAgIHNwaTogc3BpLW1l
bTogVXNlIHBpY29zZWNvbmRzIGZvciBjYWxjdWxhdGluZyB0aGUgb3AgZHVyYXRpb25zCj4gICAg
ICAgc3BpOiBzcGktbWVtOiBUYWtlIGludG8gYWNjb3VudCB0aGUgYWN0dWFsIG1heGltdW0gZnJl
cXVlbmN5Cj4gICAgICAgbXRkOiBzcGluYW5kOiBGaXggbWFjcm8gYWxpZ25tZW50Cj4gICAgICAg
bXRkOiBzcGluYW5kOiBBZGQgYSBmcmVxdWVuY3kgZmllbGQgdG8gYWxsIFJFQURfRlJPTV9DQUNI
RSB2YXJpYW50cwo+ICAgICAgIG10ZDogc3BpbmFuZDogQWRkIGEgLT5jb25maWd1cmVfY2hpcCgp
IGhvb2sKPiAgICAgICBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEVuYWJsZSBoaWdoLXNwZWVkIG1v
ZGVzIG9uIHcyNW4weGp3Cj4gICAgICAgbXRkOiBzcGluYW5kOiB3aW5ib25kOiBFbmFibGUgaGln
aC1zcGVlZCBtb2RlcyBvbiB3MzVuMHhqdwo+ICAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDog
QWRkIGNvbW1lbnQgYWJvdXQgdGhlIG1heGltdW0gZnJlcXVlbmN5CgpTZXJpZXMgYXBwbGllZCB0
byBuYW5kL25leHQgYWZ0ZXIgZml4aW5nIGNvbmZsaWN0cyBkdWUgdG8gc29tZSBmaXhlcy4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
