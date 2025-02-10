Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9CFC02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKj0C1ZLD5YVito9RZBAi6qIDKW/Y/YA4rbRjh9dj9I=; b=bB78jtzaqGcv3L
	HPaz9lO4RsV/f5C8HcPBppB3AlSpfsIEm4k8SH1zYAwlFDqfSOO675hVXjr43f9/k2nQJPLbqncuV
	40oaVu2zZicN8Mpguwis7BDV1M7OUxpOFQF22i4LYsO6h7hKoCi0Ok+IP6UXj7kyk1iBJZ6JA0+zb
	yTKVu5kh47arNAriWdIvHx3/v2sw03ir6ENCc0PVkEJJWPD1xUqT7fqSVVDDz/fSM2FdxkDktVJuN
	16S0pvbrkKaCfeKbAj3pThYRpqK6c3V9450gSfhCzhoPArEazTTnvu+SobY6Mcl5FaVhErXxkt7Ug
	pVDqKbbA/5B8DN5Jht4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVVh-00000000Gkh-214K;
	Mon, 10 Feb 2025 15:15:45 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVVe-00000000Gj3-3NFs
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 15:15:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89D0E440F7;
	Mon, 10 Feb 2025 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739200540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2BuDequG6EZO1QNTpWbwf3tZ30bqjnVT5i0K+9L/qjc=;
	b=c9sM934H6A4jJUaJ7FMnoMxHxOqVbwve9CAwl3B2Bsm7c/jdmfq6IqRF1GlpWXXgdeO9DZ
	xFHN0KGd29zwmUooY/o0oGyeH+h9qjlFFMh+AWcHrBACdljmIy1kwClGuzRvrVgv8t60u0
	pGHWzFvBgC3Duuwdgj1dgSEp0DzVKJwyNRMWQ8T2JUJFkT5BrKY44BFzDRt6HFbkFDfcBf
	78x8QcmYiMlhAgNjTGTPBsSAmmwTUMmYMqWkCPGwWDIlLYNSuMPSs/YfKmwFXxBh02Jfgz
	mmZ6TBaguGRqRKSnVGPTry0V35Gi3ntOfyIgYQZN+o5BwppWPIGq1TUpG+N0tA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
In-Reply-To: <20250209145439.19047-1-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Sun, 9 Feb 2025 15:54:32 +0100")
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 16:15:38 +0100
Message-ID: <877c5xu8yt.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_071543_328789_0BAF3070 
X-CRM114-Status: GOOD (  12.22  )
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

SGVsbG8gQ2hyaXN0aWFuLAoKT24gMDkvMDIvMjAyNSBhdCAxNTo1NDozMiArMDEsIENocmlzdGlh
biBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFdpdGggc29tZSByZXNl
YXJjaCBpbiBzb21lIG9ic2N1cmUgb2xkIFFTREssIGl0IHdhcyBwb3NzaWJsZSB0byBmaW5kIHRo
ZQo+IE1BU0sgb2YgdGhlIGxhc3QgcmVnaXN0ZXIgdGhlcmUgd2VyZSBzdGlsbCBzZXQgd2l0aCBy
YXcgc2hpZnQgYW5kCj4gY29udmVydCB0aGVtIHRvIEZJRUxEX1BSRVAgQVBJLgo+Cj4gVGhpcyBp
cyBvbmx5IGEgY2xlYW51cCBhbmQgbW9kZXJuaXplIHRoZSBjb2RlIGEgYml0IGFuZCBkb2Vzbid0
IG1ha2UKPiBhbnkgYmVoYXZpb3VyIGNoYW5nZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jICAgIHwgMzYgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQoK
SSdtIGZpbmUgd2l0aCB5b3VyIHR3byBwYXRjaGVzLiBJIHdhcyBhYm91dCB0byBhcHBseSB0aGVt
LCBidXQgdGhlIGZpcnN0Cm9uZSBuZWVkcyB0byBnbyB0aHJvdWdoIGZpeGVzLCB3aGVyZWFzIHRo
ZSBzZWNvbmQgdGhyb3VnaCBuZXh0LCBhbmQgdGhleQphcmUgZGVwZW5kZW50IG9uIGVhY2ggb3Ro
ZXIuIEkgcHJvcG9zZSB0aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbjoKLSBjcmVhdGUgcGF0Y2gg
MS8yIHdpdGggdGhlIGNvbnRlbnQgb2YgdGhlIGNsZWFudXAgZG9uZSBqdXN0IGJlbG93LCBidXQK
ICBvbmx5IGFkYXB0ZWQgdG8gdGhlIHZlcnkgc3BlY2lmaWMgc3BvdCB0aGF0IGlzIHRvdWNoZWQg
YnkgdGhlIGZpeCAiZml4CiAgYnJva2VuIGNvbmZpZy4uLiIuIEl0IHdvdWxkIGJlIGEgcHJlcmVx
dWlzaXRlIGZvciB0aGUgZml4LgotIHBhdGNoIDIvMiB3b3VsZCBiZSB0aGUgY29udGVudCBvZiAi
Zml4IGJyb2tlbiBjb25maWcuLi4iCgpBbmQgYXNpZGUsIGEgdG90YWxseSBpbmRlcGVuZGVudCBw
YXRjaCBlYXN5IHRvIGFwcGx5IG9uIC1yYzEgd2l0aCB0aGUKcmVzdCBvZiB0aGlzIHBhdGNoLgoK
V291bGQgdGhhdCB3b3JrIGZvciB5b3U/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
