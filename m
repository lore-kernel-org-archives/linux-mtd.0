Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C470C7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgKUrPDl4JshUl0Q+M3/5g0SbFSP2cqqhZt4qyq2wrI=; b=uaGsq97q0306UU
	TG74CHh8RiN+1yJ4dV1+0UDBoCCOZiUKJx+yg0KohuWLSG/v6CB0Qp9Cvlpjc8OKGUIa9kqcxO0qn
	32p99/Qar1xCShpi+O3HKnqGTdIqlKqSomj6gcWq94T8JlSo7cn9fymx5JJctIVfoVJ+6Xz3pvW8y
	Vjb4e++eR8lKMpNDL0mD3ADYpHPxoHITaJhz/4p1s5+Ia/5leBCC2lQ8JqHKm7JiAGx8AvURttdsP
	uSLn5nrDXq5IpW4bfdGlkPdnDSAPSRuPJewjvv8O+i8U/ePp5F/+c6ypj6V414I+s8wFovtj/ZFYs
	vVN8lKQGh5rAdkae3P9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKCz-0000000Dzo6-3feV;
	Thu, 19 Jun 2025 18:41:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIqF-0000000DjeM-3bzv
	for linux-mtd@bombadil.infradead.org;
	Thu, 19 Jun 2025 17:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0y5yexOVwlV1Wvadmy3Eqs/L9PzD4G6ueQ2AoKMdnSI=; b=IWhdVT6dt8D1+elM9/Eds+ZRVz
	w+PTuNht1CavDD81n0DTzLOgJgyjnXpP2KQYqk1t0n4WV9z+rxych5USJU+a5uZ9Ib3SYM0MLy0pn
	odqxBkz2YW90M0qDGEsX0rwJRiF3cf+IVMe25Gb4vdPXq6bZ2ym97uKzPOREYGOzVAqjA3/P3AkMp
	cpuLYhWb0577da3EuY2NWcjvKp7JtKA1Z/5ze3aP3Y1P4lQHlHrXHxz1g8UQniZZWatJj/BefVooa
	rqedNpnKCFNvXnW8/IF2AH5k/S21ntOPe/WwG+WvzI243FmO4/qvpLd9rdAgzj9C4INjqCv3P9sik
	gWR03uzQ==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIqA-00000004ULL-0jFw
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 17:14:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9652A1FCF0;
	Thu, 19 Jun 2025 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750353255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0y5yexOVwlV1Wvadmy3Eqs/L9PzD4G6ueQ2AoKMdnSI=;
	b=dD1LejOnl+FD9wAluEdg900E84eGlFKEUytfwWigAwGDHFTKTRrPFWWrRYePxoC37N/he6
	iPDNoqf3rVfJfgnMyyjgHhSvqJkIb3i9wk1/FVKbMhSVzvNZNiMyisvN6leLfjCy2Z0W/h
	Qlc5XaZlO2UC/S0IVWcEt6OR9533A+0rOjlZ2vfCNRpEkBdI/Si14kAuXpYMpP+hNYgQ1b
	fHCChLIezmL5uI3+hroCFRmhPBg5ek50PAC+szM7WODFF63lhHzX3KSj3oZ+x16PLvESN3
	C68U23W+RJpnhVpsi/EQmj/whcpFzCrRiLBr3YDjEniVFHpS97clHDJFcKOXJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20250618113516.2137583-1-pmartin-gomez@freebox.fr>
References: <20250618113516.2137583-1-pmartin-gomez@freebox.fr>
Subject: Re: [PATCH v2] mtd: spinand: fix memory leak of ECC engine conf
Message-Id: <175035325428.438027.12157858724101868993.b4-ty@bootlin.com>
Date: Thu, 19 Jun 2025 19:14:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphhmrghrthhinhdqghhomhgviiesfhhrvggvsghogidrfhhr
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_181418_339723_5D1952AC 
X-CRM114-Status: UNSURE (   6.01  )
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

T24gV2VkLCAxOCBKdW4gMjAyNSAxMzozNToxNiArMDIwMCwgUGFibG8gTWFydGluLUdvbWV6IHdy
b3RlOgo+IE1lbW9yeSBhbGxvY2F0ZWQgZm9yIHRoZSBFQ0MgZW5naW5lIGNvbmYgaXMgbm90IHJl
bGVhc2VkIGR1cmluZyBzcGluYW5kCj4gY2xlYW51cC4gQmVsb3cga21lbWxlYWsgdHJhY2UgaXMg
c2VlbiBmb3IgdGhpcyBtZW1vcnkgbGVhazoKPiAKPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZm
ZmZmODAwNjRmMDBlMCAoc2l6ZSA4KToKPiAgIGNvbW0gInN3YXBwZXIvMCIsIHBpZCAxLCBqaWZm
aWVzIDQyOTQ5Mzc0NTgKPiAgIGhleCBkdW1wIChmaXJzdCA4IGJ5dGVzKToKPiAgICAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLi4uLi4uCj4gICBi
YWNrdHJhY2UgKGNyYyAwKToKPiAgICAga21lbWxlYWtfYWxsb2MrMHgzMC8weDQwCj4gICAgIF9f
a21hbGxvY19jYWNoZV9ub3Byb2YrMHgyMDgvMHgzYzAKPiAgICAgc3BpbmFuZF9vbmRpZV9lY2Nf
aW5pdF9jdHgrMHgxMTQvMHgyMDAKPiAgICAgbmFuZF9lY2NfaW5pdF9jdHgrMHg3MC8weGE4Cj4g
ICAgIG5hbmRkZXZfZWNjX2VuZ2luZV9pbml0KzB4ZWMvMHgyN2MKPiAgICAgc3BpbmFuZF9wcm9i
ZSsweGEyYy8weDE2MjAKPiAgICAgc3BpX21lbV9wcm9iZSsweDEzMC8weDIxYwo+ICAgICBzcGlf
cHJvYmUrMHhmMC8weDE3MAo+ICAgICByZWFsbHlfcHJvYmUrMHgxN2MvMHg2ZTgKPiAgICAgX19k
cml2ZXJfcHJvYmVfZGV2aWNlKzB4MTdjLzB4MjFjCj4gICAgIGRyaXZlcl9wcm9iZV9kZXZpY2Ur
MHg1OC8weDE4MAo+ICAgICBfX2RldmljZV9hdHRhY2hfZHJpdmVyKzB4MTVjLzB4MWY4Cj4gICAg
IGJ1c19mb3JfZWFjaF9kcnYrMHhlYy8weDE1MAo+ICAgICBfX2RldmljZV9hdHRhY2grMHgxODgv
MHgyNGMKPiAgICAgZGV2aWNlX2luaXRpYWxfcHJvYmUrMHgxMC8weDIwCj4gICAgIGJ1c19wcm9i
ZV9kZXZpY2UrMHgxMWMvMHgxNjAKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRo
YW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDogZml4IG1lbW9yeSBsZWFrIG9mIEVDQyBlbmdpbmUg
Y29uZgogICAgICBjb21taXQ6IDY0NjNjYmUwOGIwY2JmOWJiYTg3NjMzMDY3NjRmNWZkNjQzMDIz
ZTEKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdp
bGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFp
bnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
