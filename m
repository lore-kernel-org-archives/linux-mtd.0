Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBE3C369DC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R61vtdly4pNk9ZAG5UQhHrHcQpjwZjuC5ZOer37fEXY=; b=jEFGCxZIkhKaL/
	gVkaa/y0Hu9fRVjqWghRJF6vJrNcgAvAG9xv/PpRZyEb/o1m/FQ32aQqGS1gFDNnEk57waWC5k1re
	deJhCYTGmBQBZbWieuEgc/ilRqQjylxUhQO4ZTLoOhSj3IMBd72tlYTsrbKlb3iQ5cEAQvjqj7jEX
	cQlzzYmw8OOnLHa4oec1B/dfVzUA3UVKOLO9wzjvDkAtohCNe2k6+V8W3yjGjfJV9mBMvxU8wslUK
	h8VQMinIQ1iT0lslpSUdxnstOGV61T/cHpDXjIqmoagaYEpefXH+VhHtK65ejDKysAkRAK5GjEfye
	6iniBLgUO3oH8veRD60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hCR-0000000979O-2TEB;
	Tue, 29 Apr 2025 09:24:23 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hCP-0000000978e-28Cj
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:24:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A73F21FCE8;
	Tue, 29 Apr 2025 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iwqF6BF29WKxLPB1mnKIBn54GPZ4UWzMpcM2FejtGJM=;
	b=WTC7v3TzH+Hqsh3zNVdkJXyioJYWcM0kodb6Xi12W2MXkTwOyWaeG2sLQaTbGLijNkZH+R
	qcwc378/lT1QQ3hOjUtjurs5Q44/p7f+nF53q4uawPwLZ9GtkRdEwh5cismVrGEGwTvGg3
	GfyuLD1EaMoh3fpRBZwuaQHqhxzNWf2QAz6sqROvLEGTyFTmygIiACtRHotipsatSv2on9
	L69y8rZkg1Cem/G8fYuJmWeLPZZiXRK2zrlQGuG1sbfPSazLXIxVyCdXQXZvxkdBj7EXsj
	LUH9hqxrqEkxHfIXHl9EsZJ6DaUmeZf5UPBu/KyXTEvOGrkIwbitjWBV4NlTUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen Ridong <chenridong@huawei.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250417093428.28571-2-phasta@kernel.org>
References: <20250417093428.28571-2-phasta@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: Use non-hybrid PCI devres API
Message-Id: <174591865790.993381.15992314896975862083.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:24:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghhvghnrhhiughonhhgsehhuhgrfigvihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepphhhrghsthgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhto
 heplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022421_724136_6C195168 
X-CRM114-Status: UNSURE (   7.14  )
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

T24gVGh1LCAxNyBBcHIgMjAyNSAxMTozNDoyOSArMDIwMCwgUGhpbGlwcCBTdGFubmVyIHdyb3Rl
Ogo+IGRlbmFsaV9wY2kuYyBlbmFibGVzIGEgUENJIGRldmljZSB3aXRoIHBjaW1fZW5hYmxlX2Rl
dmljZSgpLiBUaGlzLAo+IGltcGxpY2l0bHksIHN3aXRjaGVzIHRoZSBmdW5jdGlvbiBwY2lfcmVx
dWVzdF9yZWdpb25zKCkgaW50byBtYW5hZ2VkCj4gbW9kZSwgd2hlcmUgaXQgYmVjb21lcyBhIGRl
dnJlcyBmdW5jdGlvbi4KPiAKPiBUaGUgUENJIHN1YnN5c3RlbSB3YW50cyB0byByZW1vdmUgdGhp
cyBoeWJyaWQgbmF0dXJlIGZyb20gaXRzCj4gaW50ZXJmYWNlcy4gVG8gZG8gc28sIHVzZXJzIG9m
IHRoZSBhZm9yZW1lbnRpb25lZCBjb21iaW5hdGlvbiBvZgo+IGZ1bmN0aW9ucyBtdXN0IGJlIHBv
cnRlZCB0byBub24taHlicmlkIGZ1bmN0aW9ucy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5k
L25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogVXNlIG5vbi1oeWJyaWQgUENJIGRl
dnJlcyBBUEkKICAgICAgY29tbWl0OiA1MjljYmM5YzY0ODkwNGU5YmYwN2YzNDg1YTM0ZDZlMWNk
MzA5MWE3CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFu
ZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29t
cGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
