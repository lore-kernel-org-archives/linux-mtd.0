Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F2AC54754
	for <linux-mtd@archiver.kernel.org>; Fri, 16 May 2025 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ef+XJVBTzayCFcLXY0L48/hB0cXVGGim6E1j+NzCUV4=; b=zdOpfXS86DTK0A
	aYE7tRTJiD5lurf/gWlxZTEZlBgj+pkmZjAwhkdztD+oKjA/Nu+Va9kgJCH+buWxKg3iZsz2iT+Kp
	ilPqZwEGQikGpCbM28JCZVoN/xomZq3Jgf0ePTCk1KLNdylhAno+F64oHVjp72bqcnhndWrA+ifYN
	0aiXdg9VUq0Ei0nzmaFojR4PofzGKU6O1Yp1K494bYYwVP5YB0qY34jrKi7Yt1NCJT39P1dqcUH7W
	MnGgBTCj8/25YmiTatj5nuyHZJXjqK98E2E70EpYXHzphuj6wemtEDNbqKqOkXik2eL8JBHnY6dGH
	ODNDRDwwgkHbB0YzjFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwl1-00000003oEP-1DHy;
	Fri, 16 May 2025 15:13:55 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwSt-00000003jvL-0WRz
	for linux-mtd@lists.infradead.org;
	Fri, 16 May 2025 14:55:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 362F543962;
	Fri, 16 May 2025 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747407308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKJ192BkT+/Te47Jo008xSiKTVWBSpodH/ly6QojItY=;
	b=FFTPCxAmm6zzC/2OpQEQdR5dqcS/gt0ZnzKLwwqYgkeR8enay0pqm6vOOqrrJD5mauMmD1
	sHarL/wXEofkSQCKiN7N43dgBawJsRIbg1GuZV5IzI6bpKBjJ7jEq8KWqMvucuu5at9jig
	dkKA+TrzivbeZJGMYxj1OzNHhEZm3/eb88/JxAuRxal60rbpV3HINA6hol7PXTvggXLNmM
	erAJeT/zqgd5GdmOkt/bo+fEeT1vcRTUafpKK1v8BI7Ud0Vn/seoQhcaWAjqWPVe3CN96+
	DmWQCndKQAC4zToUPlcoqEDU8HmC6t7k1vPNDztRYYuRpjBiwAl0lpuOuHAZqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>, 
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>, 
 George Moussalem <george.moussalem@outlook.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 robimarko@gmail.com
In-Reply-To: <20250515-spinand-esmt-v1-1-37507b7335b8@outlook.com>
References: <20250515-spinand-esmt-v1-1-37507b7335b8@outlook.com>
Subject: Re: [PATCH] mtd: spinand: esmt: fix id code for F50D1G41LB
Message-Id: <174740730816.360599.8674629463051075941.b4-ty@bootlin.com>
Date: Fri, 16 May 2025 16:55:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepghgvohhrghgvrdhmohhushhsrghlvghmsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtohepvhhighhnvghsh
 hhrsehtihdrtghomhdprhgtphhtthhopegviihrrgdrsghuvghhlhgvrheshhhushhqvhgrrhhnrghgrhhouhhprdgtohhmpdhrtghpthhtoheprhhosghimhgrrhhkohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_075511_603614_BD2FB688 
X-CRM114-Status: UNSURE (   5.66  )
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

T24gVGh1LCAxNSBNYXkgMjAyNSAyMTo0NjowNSArMDQwMCwgR2VvcmdlIE1vdXNzYWxlbSB3cm90
ZToKPiBVcG9uIGRldGVjdGluZyB0aGUgSUQgZm9yIHRoZSBFU01UIEY1MEQxRzQxTEIgY2hpcCwg
dGhlIGZpZnRoIGJ5dGUKPiByZXR1cm5lZCBpcyBhbHdheXMgMHgwMCBpbnN0ZWFkIG9mIHRoZSBl
eHBlY3RlZCBKRURFQyBjb250aW51YXRpb24gY29kZQo+IG9mIDB4N2YuIFRoaXMgY2F1c2VzIGRl
dGVjdGlvbiB0byBmYWlsOgo+IAo+IFsgICAgMC4zMDQzOTldIHNwaS1uYW5kIHNwaTAuMDogdW5r
bm93biByYXcgSUQgYzgxMTdmN2YwMAo+IFsgICAgMC41MDg5NDNdIHNwaS1uYW5kOiBwcm9iZSBv
ZiBzcGkwLjAgZmFpbGVkIHdpdGggZXJyb3IgLTUyNAo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5h
bmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBzcGluYW5kOiBlc210OiBmaXggaWQgY29kZSBm
b3IgRjUwRDFHNDFMQgogICAgICBjb21taXQ6IGRkMjY0MDI2NDJhMDg5OWZkZTU5ZWE2YjA4NTJm
YWQzZDc5OWI0Y2MKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5n
aXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2Jv
dCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
