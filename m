Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A5EC87FCF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jul 2025 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pps/WLPTR1ev6q+l9g7ldhYH/ldqZglfzPORHJTRXlg=; b=eXziAjwhuGmsk8
	EMVCeRPHLGmpV8rQ5SE8oE55DjCCIQyAM881+LSVPvFVats6CCSHF/H5JA49T3Jr9Vg0yLf2dhYMs
	inTj+hauLbj/C96BvtwAGRyL2+q7V2hS8y7Co0fYlhquK/kW9Z6t+W9zykvPtd8/8SQhpGHCV6QN7
	hzMHl39ASGVwa/PZnqOCmhfzrlN6/BBRDGZPXDMbolofY9L0LyMhRmcRlq8xeUdWvQVbZRAp/Hu7z
	WM0tyEeBet+8B8Yh6r130QaWOHVNgPIb2DCaWJB0BLrYlg/ftuKxpNoGKJ1/tJ/LOK+oINn1wyQL+
	GeLHJdynsHHqVHzbh5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcu-0000000A8fi-0Zjl;
	Fri, 25 Jul 2025 15:46:28 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKaN-0000000A8DL-05Qe;
	Fri, 25 Jul 2025 15:43:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A1F343979;
	Fri, 25 Jul 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753458225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGJrMrC5GgDrciuEXkM5ywtIb5dq9WZZRsYzDkf8Yrg=;
	b=ICcacUBMNsofq5G/8w66CrwZcfEtyXK1bYPPWz62hLo1wI1cIcnzLxJL7j7oQSkusQk8RV
	UcYq3BrsADr1HjqdsLTgangW8lcUEA2w+MuEnKmd5MpdfrbaSobiLIx3C4q2oCa5U+wSAn
	BR2kcZNWLaKT7pSzVYFr/TptYLX5teTmHZIis+3mH08f+kHMP0diAMiosNaKcuA9IZYOb3
	YN7ItV/IIb/KQ0fH4s55Nt2WYTrpl9l0qV1QGqaeGJ+eF0sEdEzSMZegYaLmby8e1GNMe9
	pIbyuHnGdurskVd5dshqm2B8RtobP3GIJHLGgZZm5M8SVLSoAH5eNQbnC1w8lQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Balamanikandan.Gunasundar@microchip.com>
Cc: <alexander.sverdlin@siemens.com>,  <bbrezillon@kernel.org>,
  <linux-mtd@lists.infradead.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <Nicolas.Ferre@microchip.com>,  <alexandre.belloni@bootlin.com>,
  <claudiu.beznea@tuxon.dev>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
In-Reply-To: <24142dc4-a3a9-4d17-bc85-913cc9a56261@microchip.com>
	(Balamanikandan Gunasundar's message of "Tue, 22 Jul 2025 09:51:43
	+0000")
References: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
	<24142dc4-a3a9-4d17-bc85-913cc9a56261@microchip.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 25 Jul 2025 17:43:44 +0200
Message-ID: <87jz3ws2bz.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeeurghlrghmrghnihhkrghnuggrnhdrifhunhgrshhunhgurghrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhou
 gdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopefpihgtohhlrghsrdfhvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084351_187675_B230EDB4 
X-CRM114-Status: UNSURE (   5.21  )
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

SGkgQmFsYSwKCk9uIDIyLzA3LzIwMjUgYXQgMDk6NTE6NDMgR01ULCA8QmFsYW1hbmlrYW5kYW4u
R3VuYXN1bmRhckBtaWNyb2NoaXAuY29tPiB3cm90ZToKCj4gSGksCj4KPiBUaGlzIGNoYW5nZSBs
b29rcyBnb29kIHRvIG1lLiBCdXQgaXQgZGlkbid0IGFwcGx5IGluIGFueSBvZiBteSB0cmVlcy4g
QW0gCj4gaSBtaXNzaW5nIHNvbWUgdGhpbmc/Cj4KPiBIb3dldmVyIEkgZ290IHRoaXMgcGF0Y2gg
bW9kaWZpZWQgYW5kIHRlc3RlZCBpbiBmZXcgb2Ygb3VyIGJvYXJkcy4KClN0YWJsZSBpcyBtaXNz
aW5nLCBhbmQgSSB0b29rIHRoZSBvcHBvcnR1bml0eSB0byByZXBvcnQgYSBuaXQsIGhlbmNlCnRo
aXMgcGF0Y2ggd2FzIG1hcmtlZCBkb25lIG9uIG15IHNpZGUsIHdhaXRpbmcgZm9yIHYyLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
