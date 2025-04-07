Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659E3C3601E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+ABv34CfQeBV/vnrVh3AVw3WHUTxfrVnpx09+3zg6o=; b=awKHaTIMoCgRA0
	GEkG5EZnj/GznFK0BWBAb2Eb3E2Q0bA49O5FJY13dH2PpAyDrKZKExFGYDjh6WGchQcPGDh3s+IO4
	emOr12Rx32+N4tI/ule9r5XKSA6LuuG17OzAvL0hXA/9uLkbAdbro5Sp3LCwZrdvxVQbqTJOfAyhV
	WvPyTeywj5uyxtMckswYxGHOrsRqpmIQdoN50VyekUDvDXfhKDe88hVe7D/NlsPgMeFQQ7teqYyAz
	Zp2liZOg8ImWsYRdJK7Sxifezo+Nt36nk8D1JRVe/CzrxlB1y5z/CwsqB6cBhIdYQNfbSfoOmOTq1
	lzMYLQ20tVW/C9qIazNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gmD-0000000GiyV-2b1p;
	Mon, 07 Apr 2025 07:20:13 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ghi-0000000Ghzu-0GY5
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:15:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E592544333;
	Mon,  7 Apr 2025 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744010132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mq0cKrEu/AdyuV9FD6tDt/Sm8vJBsOcghCm2NXRd/A=;
	b=BGFezA8nPRx3KzbnQi283cljlKc89nvrvF7aAJBisnkUE3/V+XL3jErPyZ9oIIlOhJSZ22
	JZ1kMDo7bWcSrBkeQ521ZuZOpGXTrOoLS17CWZ39A1shsSwVx850I2QM0DbI2Q7tX3A4L3
	p86dAZuB55w5wAaXC5dRg5NBlOeQvRXUsDXNbHTyCMvYHShkrdg6bEckMbhyjztYeCTyNu
	0kwerge2E/E6HesJ0JIuReEaU1EG3NbrNWrDoRnUwnU9zI6Gov77xVzBKev9MqfL0jhET2
	JZypXkMYKoe77OzWdof5HDDPVKf/8PF8eZ18L7SJUO/NhepFURaE145MUj5+gQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: maximlevitsky@gmail.com, richard@nod.at, vigneshr@ti.com, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20250402075624.3261-1-vulab@iscas.ac.cn>
References: <20250402075624.3261-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: Add status chack in r852_ready()
Message-Id: <174401013184.998658.14198639159193393153.b4-ty@bootlin.com>
Date: Mon, 07 Apr 2025 09:15:31 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepvhhulhgrsgesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehmrgigihhmlhgvvhhithhskhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvl
 hesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrth
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001534_244467_E42C9B73 
X-CRM114-Status: UNSURE (   6.30  )
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

T24gV2VkLCAwMiBBcHIgMjAyNSAxNTo1NjoyMyArMDgwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IEluIHI4NTJfcmVhZHkoKSwgdGhlIGRldiBnZXQgZnJvbSByODUyX2dldF9kZXYoKSBuZWVkIHRv
IGJlIGNoZWNrZWQuCj4gQW4gdW5zdGFibGUgZGV2aWNlIHNob3VsZCBub3QgYmUgcmVhZHkuIEEg
cHJvcGVyIGltcGxlbWVudGF0aW9uIGNhbgo+IGJlIGZvdW5kIGluIHI4NTJfcmVhZF9ieXRlKCku
IEFkZCBhIHN0YXR1cyBjaGVjayBhbmQgcmV0dXJuIDAgd2hlbiBpdCBpcwo+IHVuc3RhYmxlLgo+
IAo+IAoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDog
QWRkIHN0YXR1cyBjaGFjayBpbiByODUyX3JlYWR5KCkKICAgICAgY29tbWl0OiBiNzlmZTE4Mjk5
NzU1NTY4NTQ2NjUyNThjZjRkMjQ3Njc4NGE4OWRiCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWls
YWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHBy
b3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApN
aXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
