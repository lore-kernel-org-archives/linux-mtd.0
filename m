Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7115C79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IciFho+DpkDvdph9ZVKK08hxGwuuVHE0LmH6rQblc8=; b=c7uIjgy8aUs/bl
	mCDa69DJpbQEnq9oBX077G9xUXN94pkP4BgDRNXMSI9mHYLgb86epS2yyrqlFrYdi/RrCZVwMzevT
	0UfS5YG5e/flFBaeTv8QCBtWXtHgrhgZA2KhPJNi5C8O6Slq4uBEGdMR294hwewvuH41YKdaiVxPX
	/jNQxEw2lF9amkiX715IxETFYyaHnl/kFkCCKZWW2av7h97x80O2GwZATCE2plnonGE6PP4ELV5Vt
	37pYN22FLI/0mUIAeRoeNtzRHNU9JNummspdyUE9keNqqrLahwjA7EluLK7Eb7XXoenSqXPN+oQEP
	lp7C4oHnQn9DN6tjFGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y9n-00000009YwA-2IJC;
	Tue, 08 Sep 2026 15:54:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3y9l-00000009Yve-3uXq
	for linux-mtd@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6jYHof1xozakTmB//jQ3mXI6cUayuxeFSdZ/OEuL1ao=; b=L0EAzoGJcKbDBuH0CvNzcfjkIR
	uX6dMNFZLiIYlAWRfRGg5RC8B7+iGaQpNKPmyXUvxJw91s7Y3/mIkrdN9JYMTqA9WH3H4JvpLcKtr
	mUCjVblLxW5R0AjtwPtDf0grAj77NwX1tk8STl3AdZkuz9Wv3CdoMEMziYn1K5iwpZx/ECMA1wMbl
	AXWRJzA2Q1tGNJH1KdQzH8AXo2CJ6Vxx04xV1Aoy2vOs/m7TqaEqkdWNzBl9fdsujx7D9XP+0PUVQ
	Trv5p/vGynMMuAnBjczTbJQYC9dUFjdMYNMFaDxL8PiUj7+ONI2pERKyJ35oV226ex1Fn2CZ0s0+F
	9Hxannmg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3y9j-00000000388-0lYM
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 15:54:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2401E1A1A5A;
	Tue,  8 Sep 2026 15:54:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB8D36031F;
	Tue,  8 Sep 2026 15:54:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70CC511C7AF49;
	Tue,  8 Sep 2026 17:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788882881; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6jYHof1xozakTmB//jQ3mXI6cUayuxeFSdZ/OEuL1ao=;
	b=toaa46GBaAVcoNTbW8tvTfTTrSljE7hWXu0MeOJ3pAxuye9gHyQlI+d7ll5ckFxmRkV1hk
	WggaIc0lIOCtjc/uq0/8ndwbEKD4BxyQ2ljIgGd/pMdkvIZSAFR7/NmMFT89A1yRueyQvn
	Ji8OvEZOI4a/v7mjyVKI/lz3htZvA0rApBWEgXnrT5E6Jtt4Y0NDkN+P9YKJt52znXPNSZ
	cbPRegXkxAZXTa276Y8SA8Dpc1vIO/CuWXSba1Pm3IHktv0xGu7hSXK3GIdVDRBeaNhRAk
	aLNq91/BCjCNxMkrqfRrcE22fSrYDoEdozDJMRN8sp3NBt7KzNmCAgycKnkiuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,
  <sebin.francis@ti.com>,  <u-kumar1@ti.com>,  <a-dutta@ti.com>
Subject: Re: [PATCH v9 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
In-Reply-To: <693550b9-a1fb-4732-b6ab-b06fd6b11423@ti.com> (Santhosh Kumar
	K.'s message of "Tue, 8 Sep 2026 18:44:13 +0530")
References: <20260825171737.776052-1-s-k6@ti.com>
	<20260825171737.776052-17-s-k6@ti.com> <8733vp0yuv.fsf@bootlin.com>
	<693550b9-a1fb-4732-b6ab-b06fd6b11423@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 17:54:38 +0200
Message-ID: <874ifzu4ap.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_165443_341542_9EF09B28 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gU2FudGhvc2gsCgo+Pj4gKwkJaWYgKCFyZXQgJiYgc3BpbmFuZC0+bWF4X3JlYWRfb3Au
bWF4X2ZyZXEpIHsKPj4+ICsJCQl0ZW1wbGF0ZXMtPnJlYWRfY2FjaGUgPSBiZXN0Owo+Pj4gKwkJ
CWlmIChzcGluYW5kLT5hbGxfY29udF9yZWFkX3ZhcmlhbnRzKSB7Cj4+PiArCQkJCXRlbXBsYXRl
cy0+Y29udF9yZWFkX2NhY2hlID0KPj4+ICsJCQkJCXNwaW5hbmRfZmluZF9jb250X3JlYWRfdmFy
aWFudChzcGluYW5kLCBiZXN0LCBpZmFjZSk7Cj4+PiArCQkJCXNwaW5hbmQtPmNvbnRfcmVhZF9w
b3NzaWJsZSA9Cj4+PiArCQkJCQkhIXRlbXBsYXRlcy0+Y29udF9yZWFkX2NhY2hlOwo+PiBJIGJl
bGlldmUgeW91IGFsbW9zdCBhZGRyZXNzZWQgdGhlIGNvbmNlcm5zIHJhaXNlZCBpbiB2NyBhYm91
dAo+PiBjb250X3JlYWRfcG9zc2libGUsIGV4Y2VwdCB3aGF0IHlvdSBkbyBoZXJlIGlzIHN0aWxs
IGEgYml0IGRhbmdlcm91cwo+PiBzaW5jZSB5b3UgY291bGQgcmUtZW5hYmxlIGNvbnRpbnVvdXMg
cmVhZHMgb24gbm9fY3NfYXNzZXJ0aW9uIGNhcGFibGUKPj4gY29udHJvbGxlcnMuIEkgYmVsaWV2
ZSB5b3Ugc2hvdWxkIGNsZWFyIHRoZSBmbGFnIG9ubHksIG5ldmVyIHJpc2sgdG8gc2V0Cj4+IGl0
LCBzb21ldGhpbmcgbGlrZToKPj4gaWYgKCF0ZW1wbGF0ZXMtPmNvbnRfcmVhZF9jYWNoZSkKPj4g
ICAgICBzcGluYW5kLT5jb250X3JlYWRfcG9zc2libGUgPSBmYWxzZTsKPj4gV2l0aCB0aGlzIGZp
eGVkLAo+PiBSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPgo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KPgo+IEZpeGVkIGFzIHlvdSBzdWdn
ZXN0ZWQgLSBzcGluYW5kX3RyeV9yYW5rZWRfdmFyaWFudCgpIG5vdyBvbmx5IGNsZWFycwo+IGNv
bnRfcmVhZF9wb3NzaWJsZSB3aGVuIHRoZSBuZXdseSBzZWxlY3RlZCB2YXJpYW50IGhhcyBubyBt
YXRjaGluZwo+IGNvbnRfcmVhZCBjb3VudGVycGFydDsgV2lsbCBjYXJyeSB0aGlzIGludG8gdjEw
IGFsb25nIHdpdGggdGhlIG90aGVyCj4gZml4ZXMuCgpQZXJmZWN0LCB0aGFuayB5b3UuIEknbSBn
b29kIHdpdGggaXQgdGhlbi4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
