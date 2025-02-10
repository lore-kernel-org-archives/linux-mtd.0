Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D91C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMCbhYS+PXjNrILue8GM82QoVXXAzaL8Hm4jRjoRM6M=; b=TwxEIzSm5aQC+6
	Gsv9GS14HAIlGDLmE7vHiYq4Hs6M/8Dsod70uQnOjimuCcMOcHVMeHifTYvkxIskeGUNfeKlJxoF6
	EcVbvG3aA7JBzjG2PMO2KJLD5z0L3cyjj567cqKo9vbdeUdws/rvoD38oV3WKLXMWxO6I4oitP/RE
	303F9pVHU32JgQvjEwSKMncWoDWkRAb/Kp7+dVJs6EoxDjdg2HDWhZ0SZKtm6mp/QPI8cm6vZqqnx
	ow783gN6YoKUeLkiHP9N6jh8mRFwGkhPQqxyrEnV47NWL+8VZWl06ofpkKV2pDoDcTXgK2uDPbuX1
	UgFYT+kLfc42L+uxIPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVAM-00000000CJ9-2dkm;
	Mon, 10 Feb 2025 14:53:42 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVAK-00000000CHN-0l9I
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 14:53:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A151D43284;
	Mon, 10 Feb 2025 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739199216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zZrO0KLbSQ2XywzkXBgNHLK/s1K4eKjEMkdaYs4fmA=;
	b=UPbiTZCqI4usBfaAgNZYYsZQ7SuLoCoki0of3T+ZPKKAihVAatwUd2uxPVUiPUCmC69UhC
	u5JxOXnW0X7xF6mYHoP75nj2cOIeUVofUc31A0+5cIoAw04kL1Cn5xUHhgO1eFFECOLK3w
	JRwmJXqRkuud5zew2O0G77H+3XEQLiohuSIqvh0/wthA7VhG9aGH9H+AVtxNakQUsIpvEE
	WjAz0c5Kb3SaFJ6tU4HtFljofbus/3c+3csAV45Twytp5vP99DMPpIiCiFyyuMqGdq7vC6
	SPQqiBXj6exnVOQMU1CNmRPUywV/Spb49809uMfuD+KzMFfwErBNPOuPXV/U2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, 
 Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Alexey Romanov <avromanov@salutedevices.com>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 kernel@salutedevices.com
In-Reply-To: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
References: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
Subject: Re: [PATCH v5 0/6] mtd: spinand: add OTP support
Message-Id: <173919920944.55950.11601296425116850330.b4-ty@bootlin.com>
Date: Mon, 10 Feb 2025 15:53:29 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepvgiirhgrrdgsuhgvhhhlvghrsehhuhhsqhhvrghrnhgrghhrohhuphdrtghomhdprhgtphhtthhopegthhgvnhhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopegurghnihgvlhesmhgrkhhrohhtohhpihgrrdhorhhgpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhmpdhrtghpthhtoheplhhin
 hhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghvrhhomhgrnhhovhesshgrlhhuthgvuggvvhhitggvshdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_065340_359559_463200A7 
X-CRM114-Status: UNSURE (   7.59  )
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

T24gTW9uLCAxMCBGZWIgMjAyNSAxNzozNDoxMiArMDMwMCwgTWFydGluIEt1cmJhbm92IHdyb3Rl
Ogo+IFRoaXMgcGF0Y2hzZXQgaW1wbGVtZW50cyB0aGUgU1BJLU5BTkQgT1RQIGZ1bmN0aW9ucyB0
byBhbGxvdyBhY2Nlc3MgdG8KPiB0aGUgU1BJLU5BTkQgT1RQIGRhdGEuCj4gU3BlY2lmaWMgc3Vw
cG9ydCBpcyBhZGRlZCBmb3IgTWljcm9uIE1UMjlGMkcwMUFCQUdEIGFuZCBFU01UIEY1MEwxRzQx
TEIvCj4gRjUwRDFHNDFMQiBmbGFzaCBjaGlwcy4KPiAKPiBDaGFuZ2Vsb2c6Cj4gICB2NSBzaW5j
ZSB2NCBhdCBbMV06Cj4gICAgIC0gUmViYXNlZCB0byBtYXN0ZXIKPiAKPiBbLi4uXQoKQXBwbGll
ZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzZdIG10ZDogc3BpbmFuZDogbWFrZSBzcGluYW5k
X3tyZWFkLHdyaXRlfV9wYWdlIGdsb2JhbAogICAgICBjb21taXQ6IDA3ZDBhYTkzOTNhYmM4ZmQ2
NGQwYTE3NGVkZmI2OGM1ODA4MTg3ZTQKWzIvNl0gbXRkOiBzcGluYW5kOiBhZGQgT1RQIHN1cHBv
cnQKICAgICAgY29tbWl0OiBjMDZiMWY3NTNiZWE0MGEyODJmMjlhOTM4M2ZjZjM2YjEyMzIzMTA4
ClszLzZdIG10ZDogc3BpbmFuZDogbWFrZSBzcGluYW5kX3t3YWl0LG90cF9wYWdlX3NpemV9IGds
b2JhbAogICAgICBjb21taXQ6IGUyNzhiOGM3M2IwNTI2ZjhlM2VlMjJmNDgyN2M4ZmUwN2MyMTA5
YmEKWzQvNl0gbXRkOiBzcGluYW5kOiBvdHA6IGFkZCBoZWxwZXJzIGZ1bmN0aW9ucwogICAgICBj
b21taXQ6IDlhZDI4NTdjODJkNTYwMTc0MDIyNTZmZDNlMmVkNDAxY2M3ZjZmYjkKWzUvNl0gbXRk
OiBzcGluYW5kOiBtaWNyb246IE9UUCBhY2Nlc3MgZm9yIE1UMjlGMkcwMUFCQUdECiAgICAgIGNv
bW1pdDogYjc0MWQzZmE1ZDNjZjk4OWI3ZGVjNzZjY2E4MzIzOTYxMjhkZmU0OApbNi82XSBtdGQ6
IHNwaW5hbmQ6IGVzbXQ6IE9UUCBhY2Nlc3MgZm9yIEY1MHtMLER9MUc0MUxCCiAgICAgIGNvbW1p
dDogYTNiMjE5ZTQ3NmQzYzcyNmUyMzA4NGNkNzk2NDlmZTk3ODQ4NGIyOAoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
