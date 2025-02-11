Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D856C0219B
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtbOAsgdVL89S280oyFec2QHUYP3gOan+37Qn9vmpvc=; b=cKiMlvWS1anPxE
	1tndV3fiCYrDPH+Tn5AIkidrwk5IllpvAn4KeU8kbT983FV1/8w7BBREPWauAO8iSG1XTWVq3hHnr
	XupJ1TjXjso8nHoJzqpYvHgZa3A/x8NRgnGKnU2uiD2p+C2cutAp2JvFagdrLq2wAr9ItGHlj0vuG
	SWvxkaKgVuY4hbEWh0X9DQ1kRSOUkOOPYJy09iiL+JgYGyHygqADSzBbOTkw0v5oraNFNicAARrAn
	0f5HowrBR4dKF7ix0XlJPbl7f7luwLXktwWdmgun5KH2/DI/jWv2zQ7IApxB93JQzV0NgvECuLo5U
	o6UR1cO8WFNuGYl4Dgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tho44-00000003T5O-2gQp;
	Tue, 11 Feb 2025 11:04:28 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnvJ-00000003R4R-3hu2
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 10:55:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8707B41E0D;
	Tue, 11 Feb 2025 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739271323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNAL4qcDpZADEcFGQJigZHn9NAqCEryKx7MhvZmyVLc=;
	b=aM2e2a5ZRNus+//jkXB7rQ3t2k+vf14eyttffiLsJBwOBsqez1SCdQbPYuKbWzEJIIlCkf
	4gwmrY4LpEfpXYkLwnNsuC1sawJ6twdSrAhsvQ0SCLZ3nI5wMTSWBNHKslJZsyXl1Yu4uq
	tW7aiMLvURuBu19jzkHQXAs2//tHwA2Jem04Y2NoC/KL+WrwTwyTFFAj7yikHuluB2GBFC
	O9DkGeOl2UuV33nAuEj4aSfs/mvo7IztjgTu9wFj7Pui7Vt4QM/lOUsbXb9nPSHgppcBSM
	JaW3ygaW46SPDvDN22XP0YCafv5JahZFZqTJcRZpJoX9SpjpQ6oujETDBqSIKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
In-Reply-To: <67aa6527.050a0220.173001.b011@mx.google.com> (Christian
	Marangi's message of "Mon, 10 Feb 2025 21:44:21 +0100")
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
	<877c5xu8yt.fsf@bootlin.com>
	<67aa6527.050a0220.173001.b011@mx.google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 11:55:22 +0100
Message-ID: <87bjv8sqcl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpr
 hgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_025526_068977_2AA913B4 
X-CRM114-Status: GOOD (  12.85  )
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

SGkgQ2hyaXN0aWFuLAoKPj4gSSdtIGZpbmUgd2l0aCB5b3VyIHR3byBwYXRjaGVzLiBJIHdhcyBh
Ym91dCB0byBhcHBseSB0aGVtLCBidXQgdGhlIGZpcnN0Cj4+IG9uZSBuZWVkcyB0byBnbyB0aHJv
dWdoIGZpeGVzLCB3aGVyZWFzIHRoZSBzZWNvbmQgdGhyb3VnaCBuZXh0LCBhbmQgdGhleQo+PiBh
cmUgZGVwZW5kZW50IG9uIGVhY2ggb3RoZXIuIEkgcHJvcG9zZSB0aGUgZm9sbG93aW5nIG1vZGlm
aWNhdGlvbjoKPj4gLSBjcmVhdGUgcGF0Y2ggMS8yIHdpdGggdGhlIGNvbnRlbnQgb2YgdGhlIGNs
ZWFudXAgZG9uZSBqdXN0IGJlbG93LCBidXQKPj4gICBvbmx5IGFkYXB0ZWQgdG8gdGhlIHZlcnkg
c3BlY2lmaWMgc3BvdCB0aGF0IGlzIHRvdWNoZWQgYnkgdGhlIGZpeCAiZml4Cj4+ICAgYnJva2Vu
IGNvbmZpZy4uLiIuIEl0IHdvdWxkIGJlIGEgcHJlcmVxdWlzaXRlIGZvciB0aGUgZml4Lgo+PiAt
IHBhdGNoIDIvMiB3b3VsZCBiZSB0aGUgY29udGVudCBvZiAiZml4IGJyb2tlbiBjb25maWcuLi4i
Cj4+IAo+PiBBbmQgYXNpZGUsIGEgdG90YWxseSBpbmRlcGVuZGVudCBwYXRjaCBlYXN5IHRvIGFw
cGx5IG9uIC1yYzEgd2l0aCB0aGUKPj4gcmVzdCBvZiB0aGlzIHBhdGNoLgo+PiAKPj4gV291bGQg
dGhhdCB3b3JrIGZvciB5b3U/Cj4+Cj4KPiBNaGhoIGFyZSB0aGV5IHJlYWxseSBkZXBlbmRlbnQg
b24gZWFjaCBvdGhlcj8KPgo+IEkgcG9zdGVkIHRoZW0gaW4gMiBzZXBhcmF0ZSBwYXRjaCBhcyBv
bmUgc2hvdWxkIGhhdmUgcHJpb3JpdHkgYW5kIGJlCj4gYXBwbGllZCBBU0FQLiBUaGUgb3RoZXIg
aXMgcmVhbGx5IGEgY2xlYW51cCBhbmQgZnJvbSB3aGF0IEkgY2FuIHNlZSBubwo+IGRlbHRhIGlu
IHRoZSBwYXRjaCBnZXRzIGFmZmVjdGVkIGJ5IHRoZSBmaXggaW4gdGhlIG90aGVyIHBhdGNoLgo+
Cj4gSW4gdGhlb3J5IHRoZXkgc2hvdWxkIGFwcGx5IGluZGVwZW5kZW50bHkuCgpBaCBvaywgSSBt
dXN0IGhhdmUgbWlzcmVhZCB0aGVtLCBmaW5lIHRoZW4uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
