Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EE7C83038
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Tz71QCv7NSsoMAu903R1rBPZOpOB9apJ8niM2RVGyA=; b=F+v5zSZBhc5WPQ
	Yj9Bw7NGMmuRniK+aKcA+NigLibdRQo/9m+L0lzppSHgQwtBBJsX0HzCOXiLEyCOQ4Ozj17+78VWE
	DuQSmA0X97I8+DUzdS9tp0cLiIkEmRZLQOX/E6ncv4wvYUzwcvKmod20mBgoQb5Lr97ea/C3Rv4ey
	48yJP5oHla/GuA8Dba4HRn1ubWZvlwuMNB8pO9wjKJ09UufHAB5TvmA8/o+0zT4VOr2v+l1XggnUR
	JOmnkh7+MUnExl63HZ923h+3DPhMPVP1sDs+PUuo2zfc5+MW/o2BzdC5eISXW8d41qh/5nhiteY3V
	uXzdDi/YsiwenTaNPr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbqU-00000005g5g-3Xfd;
	Tue, 01 Jul 2025 14:20:26 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaSX-00000005NwT-21zr;
	Tue, 01 Jul 2025 12:51:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2F154424C;
	Tue,  1 Jul 2025 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751374293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+4c+g5QJfhyC+UXQix6d3ko58wc2ZtIIOw1DxZ0qcM=;
	b=cwbNa/ulZeyBqE/Afx6KxKecnKJXH6g0zoZYET/B6cuUD+qx84sK+owpBM6wUTtCB8kxWL
	7xFDF7Tow7WgtB6WD6lJaibV98kgtmzh6hBp7t+w9VSUiqISPaNGKOcW48eKThTfEUrViP
	ME79fVcszUk2/wJ8oASxs1xSrsop9FX1it1/+D9aKBmwbtSFbxKT9Vh/avEnx66zA7cpYf
	M+bDikFmx4P/K6qiYempyctg2+SGVGwV9r7QRkCLZUl7M0MHR3U5iV0yaoR6fZz04j5kmB
	U5enoet4yQe41GfIFtTt54LKZuZEWw7zesYyesxZlvdLLvSZNjw2GYyj7agUEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Alexander Dahl <ada@thorsis.com>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix dma_mapping_error() address
In-Reply-To: <20250701114427.24910-2-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Tue, 1 Jul 2025 13:44:23 +0200")
References: <20250701114427.24910-2-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 14:51:31 +0200
Message-ID: <878ql8qdkc.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepfhhouhhrihgvrhdrthhhohhmrghssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegruggrsehthhhorhhsihhsrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_055137_967086_FFDB2438 
X-CRM114-Status: UNSURE (   8.88  )
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

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpPbiAwMS8wNy8yMDI1IGF0IDEzOjQ0
OjIzICswMiwgVGhvbWFzIEZvdXJpZXIgPGZvdXJpZXIudGhvbWFzQGdtYWlsLmNvbT4gd3JvdGU6
CgpUaGUgc3ViamVjdCBwcmVmaXggc2hvdWxkIGJlICdtdGQ6IHJhd25hbmQ6IGF0bWVsOicKCj4g
SXQgc2VlbXMgbGlrZSB3aGF0IHdhcyBpbnRlbmRlZCBpcyB0byB0ZXN0IGlmIHRoZSBkbWFfbWFw
IG9mIHRoZQo+IHByZXZpb3VzIGxpbmUgZmFpbGVkIGJ1dCB0aGUgd3JvbmcgZG1hIGFkZHJlc3Mg
d2FzIHBhc3NlZC4KPgo+IEZpeGVzOiBmODhmYzEyMmNjMzQgKCJtdGQ6IG5hbmQ6IENsZWFudXAv
cmV3b3JrIHRoZSBhdG1lbF9uYW5kCj4gZHJpdmVyIikKCk1pc3Npbmc6CgpDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwoKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRm91cmllciA8Zm91cmllci50
aG9tYXNAZ21haWwuY29tPgo+IC0tLQoKT3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUhCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
