Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB0BC369AB
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44jWXMtBhHO3SGkI3ywQV6U4dZfLHbO8owBRCgKfmAg=; b=jwos27WYINdq72
	uQp7+Bw2RBE8EwT9t/pVzfQ0DIkV8g9nbngpFfrPzwycw0YIdqi4K628q2933ABJ8Nmnpyht5UO30
	5WDVtLtkZ/zXB1mRHQyXMts8dGzcpgqXVr3C6X3WAxdhSWbzRdbw+QgdBrKiaMbmyLACL2To6QnHS
	UjukoaW2/EvJfX+CQCAm4x+tqQVStHWrD5JwKVzwvyfufIBqZbdJxd5ERp8TJOweDnh33oHq3REvF
	uIy+Qxx1qij0e75AgtD8xcaxMECs0cz9BwNkFF2deb093QZImBkwJxHCb+6HKq6SuMvv81XQoA0Qq
	BXmzfGdIqL/a+n0tj7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdA-0000000FXiH-2hXm;
	Fri, 18 Apr 2025 07:59:24 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fxq-0000000FRxe-3aMj
	for linux-mtd@lists.infradead.org;
	Fri, 18 Apr 2025 07:16:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A28242DFF;
	Fri, 18 Apr 2025 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744960597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYNxJoWZ8XK9Q/PKX7v1WG7eFI6f3AV7B0xhe6fecXw=;
	b=jWJy+xDBlJyR325bmiRQIS0aC6zYbc74Z5BoJ0RfWZybs4kVR2XmEibfmnL8qFkVncjAg0
	XveF+RnsCzfMy+5E+JYgjgmOu04J1wUfS3KST8K2qh+YlCikO2SQHwq/zSzvk5vg4a0IFv
	S7YsnRJSVbe7FLlbyR4T4nuvyqD4ocw908TfZpKI8Xw9hllIe2+ZxDoYaVyS9nnHD9r/zW
	j0MehJkAkWvOWGnxSlfYMdvOMApFyxvCKogsfz0nTf1mlDuKspwO5t8XFkS8UmKvIolffK
	vJc/ApnUQjLd2HRaixbEa/2idF3dE1ODw8FCxCpeN3CY3wviWiZCEOolbUe0PQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roland =?utf-8?Q?Kov=C3=A1cs?= <roland.kovacs@est.tech>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,  Malin
 Jonsson <malin.jonsson@est.tech>
Subject: Re: Questions about MTD subpartitioning
In-Reply-To: <AM7P189MB07258ABAA4DA1823DDDE78579BBC2@AM7P189MB0725.EURP189.PROD.OUTLOOK.COM>
	("Roland =?utf-8?Q?Kov=C3=A1cs=22's?= message of "Thu, 17 Apr 2025 12:08:42
 +0000")
References: <AM7P189MB07258ABAA4DA1823DDDE78579BBC2@AM7P189MB0725.EURP189.PROD.OUTLOOK.COM>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 18 Apr 2025 09:16:37 +0200
Message-ID: <878qnyndm2.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhholhgrnhgurdhkohhvrggtshesvghsthdrthgvtghhpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmrghlihhnrdhjohhnshhsohhnsegvshhtrdhtvggthh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_001643_045119_B753CE37 
X-CRM114-Status: GOOD (  13.10  )
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

SGkgUm9sYW5kLAoKT24gMTcvMDQvMjAyNSBhdCAxMjowODo0MiBHTVQsIFJvbGFuZCBLb3bDoWNz
IDxyb2xhbmQua292YWNzQGVzdC50ZWNoPiB3cm90ZToKCj4gSGksIAo+Cj4gSSdkIGxpa2UgdG8g
YXNrIHNvbWUgcXVlc3Rpb25zIHJlZ2FyZGluZyBtdGRjaGFyIGRldmljZSBkcml2ZXIuCj4gV2Un
ZCBsaWtlIHRvIGFkZCBzdWJwYXJ0aXRpb25zIHRvIHRoZSBQRFIgcmVnaW9uIG9mIGEgTk9SLWZs
YXNoIGRldmljZSBmcm9tIHVzZXJzcGFjZSwgYnV0IHdlIGhpdCBhIGNoZWNrIGluIHRoZSBCTEtQ
Rwo+IGlvY3RsIGNhbGwgd2hpY2ggcHJldmVudHMgc3VicGFydGl0aW9uaW5nLgo+IEFzIGZhciBh
cyBJIGNhbiB0ZWxsLCB0aGlzIGNoZWNrIHByZWRhdGVzIHRoZSBzdXBwb3J0IGZvciBzdWJwYXJ0
aXRpb25zIGluIG10ZHBhcnQuYyBhbmQgSSBjb3VsZG4ndCBmaW5kIGluZm9ybWF0aW9uIG9uCj4g
d2h5IHRoaXMgaXMgdGhlIGNhc2UuCj4KPiBJcyB0aGVyZSBhIHBhcnRpY3VsYXIgcmVhc29uIHdo
eSBzdWJwYXJ0aXRpb25zIHRocm91Z2ggQkxLUEcgaXMgbm90IGFsbG93ZWQ/IAo+IE9yIGRvIHlv
dSBoYXZlIGFueSBvdGhlciByZWNvbW1lbmRlZCB3YXkgb2YgZG9pbmcgc3VicGFydGl0aW9ucyBm
cm9tCj4gdXNlcnNwYWNlPwoKSW4gZ2VuZXJhbCBJIGRvIG5vdCB1c2Ugc3VicGFydGl0aW9uaW5n
IGZyb20gdXNlcnNwYWNlLCBzbyBJIG11c3QgYWRtaXQKdGhpcyBpcyBnb2luZyB0byBiZSBhIGJs
aW5kIGFkdmlzZS4KCkxvb2tpbmcgYXQgdGhlIGNvZGUgSSBzZWUgdGhhdCBwYXJ0aXRpb25pbmcg
aXMgb25seSBhbGxvd2VkIG9uIG1hc3RlcgpkZXZpY2VzLCBub3QgcGFydGl0aW9ucy4gQnV0IGlm
IHlvdSBoYXZlIHBhcnRpdGlvbnMgaW4geW91IERULCB0aGUKbWFzdGVyIGRldmljZSBpcyBub3Qg
a2VwdCAoZm9yIGhpc3RvcmljYWwgcmVhc29ucykuIEJ1dCBpZiB5b3UgbmVlZCBpdAp5b3UgbWF5
IHNlbGVjdCBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUi4KCklmIHRoYXQgZG9lcyBub3Qg
aGVscCwgcGxlYXNlIGdpdmUgbW9yZSBkZXRhaWxzIGFib3V0IHRoZSBjb21tYW5kCmF0dGVtcHRl
ZCwgdGhlIGRldmljZSBpZGVudGlmaWNhdGlvbiBhbmQgZ2VvbWV0cnkgYXMgd2VsbCBhcyB0aGUg
ZXJyb3JzCnlvdSBnZXQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
