Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87213C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ynT41D0Y6hpqVSiY3bzEbDRe14dnozb9HXoPU90ps8=; b=1/aBKLYx5Iy26O
	Waa7CpsA6FZrMD/G+aYiutewaROoQoTTVAAIh9ueSgFt4Sfutthejv307/RlZqqZRf6U8M6xLzizN
	9bf0G+xcvXpUyWY7bbnBzKh0K6sOq4zXy+FvcYVT6hIMY0t1oyEEjFOR36GY/Z248BfiztQCPQ8a+
	mC17T1XMC+tPBA/uNKrwCRajQ9D06vdGINkqwVguGKDI6o1AzgREdIDrMVAKXsVqEEROsTEexYDdt
	wLl+w3Vy3qSEAnTO7eXZY+jrmqxefrD4aT79Z50eDLTg15L0iCPSlxjA4x//VWQI9toV5Tz3S8zhU
	rOokQ8RUuOLWqVRE8F7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5bJ-00000007WYH-1uCp;
	Mon, 02 Jun 2025 13:53:17 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5bG-00000007WWN-2BWX
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 13:53:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E111143B27;
	Mon,  2 Jun 2025 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748872389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PfIDQOstnIKPbNm8LZJHuQa/qFaaDg5YKgwC3Nw0u84=;
	b=Kz2KEqCWBYAgQTS9+r3JiPTGOAcMAHu4g7y0y4+oBJ+GwiZrC2BzraQHmNLCpMcwlQy0qT
	djZzCIHV+aBFGAhDkVTYHr9l5O3nq3Vn582LTBzNvIOQki6boLSSTtaHyLjVlivjaZgyEp
	VBqgxTVjeDHhrnckQOsFIYBsR1vuCyZg8wvXneqMIoInXEYVQVIVR6wPTfDGcgn5LWgE/F
	6eoy8jCiCqKt+vNlvLW6x/khuWCO2Xw4+SlifVZR7qWBzzE4phl4Y7D8kAgSpKrvwM0iQh
	RQbC9ztEj5uLcDKLCyCoNOncA9HLefyN3PwKpXZLOjKO6CBVnfu/Ftwm3LcAPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Md Sadre Alam
 <quic_mdalam@quicinc.com>,  Varadarajan Narayanan
 <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Lakshmi Sowjanya D
 <quic_laksd@quicinc.com>
Subject: Re: [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
In-Reply-To: <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
	(Gabor Juhos's message of "Thu, 29 May 2025 19:25:11 +0200")
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
	<20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Jun 2025 15:53:08 +0200
Message-ID: <87iklep7wb.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeekgeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesq
 hhuihgtihhntgdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_065315_165880_5E1A743F 
X-CRM114-Status: GOOD (  15.29  )
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

SGVsbG8sCgpPbiAyOS8wNS8yMDI1IGF0IDE5OjI1OjExICswMiwgR2Fib3IgSnVob3MgPGo0Zzh5
N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgY29tbW9uIFFQSUMgY29kZSBkb2VzIG5vdCBkbyBh
bnkgYm91bmRhcnkgY2hlY2tpbmcgd2hlbiBpdCBoYW5kbGVzCj4gdGhlIGNvbW1hbmQgZWxlbWVu
dHMgYW5kIHNjYXR0ZXIgZ2F0ZXIgbGlzdCBhcnJheXMgb2YgYSBCQU0gdHJhbnNhY3Rpb24sCj4g
dGh1cyBpdCBhbGxvd3MgdG8gYWNjZXNzIG91dCBvZiBib3VuZHMgZWxlbWVudHMgaW4gdGhvc2Uu
Cj4KPiBBbHRob3VnaCBpdCBpcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGdpdmVuIGRyaXZl
ciB0byBhbGxvY2F0ZSBlbm91Z2gKPiBzcGFjZSBmb3IgYWxsIHBvc3NpYmxlIEJBTSB0cmFuc2Fj
dGlvbiB2YXJpYXRpb25zLCBob3dldmVyIHRoZXJlIGNhbiBiZQo+IG1pc3Rha2VzIGluIHRoZSBk
cml2ZXIgY29kZSB3aGljaCBjYW4gbGVhZCB0byBoaWRkZW4gbWVtb3J5IGNvcnJ1cHRpb24KPiBp
c3N1ZXMgd2hpY2ggYXJlIGhhcmQgdG8gZGVidWcuCj4KPiBUaGlzIGtpbmQgb2YgcHJvYmxlbSBo
YXMgYmVlbiBvYnNlcnZlZCBkdXJpbmcgdGVzdGluZyB0aGUgJ3NwaS1xcGljLXNuYW5kJwo+IGRy
aXZlci4gQWx0aG91Z2ggdGhlIGRyaXZlciBoYXMgYmVlbiBmaXhlZCB3aXRoIGEgcHJlY2VkaW5n
IHBhdGNoLCBidXQgaXQKPiBzdGlsbCBtYWtlcyBzZW5zZSB0byByZWR1Y2UgdGhlIGNoYW5jZSBv
ZiBoYXZpbmcgc3VjaCBlcnJvcnMgYWdhaW4gbGF0ZXIuCj4KPiBJbiBvcmRlciB0byBwcmV2ZW50
IHN1Y2ggZXJyb3JzLCBjaGFuZ2UgdGhlIHFjb21fYWxsb2NfYmFtX3RyYW5zYWN0aW9uKCkKPiBm
dW5jdGlvbiB0byBzdG9yZSB0aGUgbnVtYmVyIG9mIGVsZW1lbnRzIG9mIHRoZSBhcnJheXMgaW4g
dGhlCj4gJ2JhbV90cmFuc2FjdGlvbicgc3RydWN1dHJlIGR1cmluZyBhbGxvY2F0aW9uLiBBbHNv
LCBhZGQgc2FuaXR5IGNoZWNrcyB0bwo+IHRoZSBxY29tX3ByZXBfYmFtX2RtYV9kZXNjX3tjbWQs
ZGF0YX0oKSBmdW5jdGlvbnMgdG8gYXZvaWQgdXNpbmcgb3V0IG9mCj4gYm91bmRzIGluZGljZXMg
Zm9yIHRoZSBhcnJheXMuCj4KPiBUZXN0ZWQtYnk6IExha3NobWkgU293amFueWEgRCA8cXVpY19s
YWtzZEBxdWljaW5jLmNvbT4gICAgICMgb24gU0RYNzUKPiBTaWduZWQtb2ZmLWJ5OiBHYWJvciBK
dWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KCkknbSBmaW5lIHdpdGggdGhpcyBwYXRjaCBnb2luZyB0
aHJvdWdoIHNwaSwKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
