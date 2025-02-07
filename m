Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B376C02194
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 14:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLoR76rZnYG1PYNDeO32cTc6zjc8/5rP/OzNhwp3eGw=; b=N+ujrx855YyhNw
	WUihCW/EITMacNrfN5t1/X6miutXKM+2yKnt/oSMQdqYCL1eZx/EkEX0i9xDt4pfjA7XAVgiJb5Xu
	ghPwW/GK8Kejl9qFaBF375WOTmVZWxoBk+gLCNz3zgMwlgXtq40k/bRS+koD7lYBIUR7ZRVv25wqf
	s4fdAi9GAIYCHxBAybpLIZBwUwPFTq+vYp5Ivyef9OjyM6mxO+j0XvK2qd0ItLH2jR7ZQ7W2R9Es5
	+m6n8bCE7aekFSpCYgPljOoiRKUF7ORAPaJB5PAHZgDYAuQfsSFIkNGA8cXhmLA8logB9xjWi2RPD
	84oGNSQWuLrCLVZjiJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPYn-00000009uMy-3Zei;
	Fri, 07 Feb 2025 14:42:25 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPYK-00000009uIM-3RKp
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 14:41:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F287B4432C;
	Fri,  7 Feb 2025 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xw5LjzfhjaQii1Qy1nV7yusM+UcRAZ3+6y3iLh6xEkQ=;
	b=l7Ah+102SX+DPU9iK6kWo9mBvTrHy9XlCzlq9tTyLw51+akOb82lPcKYnJ5SgC1xqBaje1
	itxODv10n/X/cfCDi5OcShipqQAbQhBykOwFF1QrPcjk5DSMLfG1a+dfPnKd7Fglp9heZz
	WRrhlm5zmmJAZHFVD+RGOdsuvGOZfhr51S3qB2DHJXlnI75yoInx+RG4av2Usc5CYd95kI
	2JrmVO11J655bBRJuskQL2NNXwzun/cWqDCtlu///GHlcZX9pJ+wuq1VvEqaZhxxA+IOx2
	Q5SJ6BZnStrq27db8wWIkyJyBttncchUwtRmcNmg4vFb1VMIm27/hxGylu7bXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ezra Buehler <ezra.buehler@husqvarnagroup.com>,  Cheng
 Ming Lin <chengminglin@mxic.com.tw>,  Pratyush Yadav
 <pratyush@kernel.org>,  Daniel Golle <daniel@makrotopia.org>,  Frieder
 Schrempf <frieder.schrempf@kontron.de>,  Alexey Romanov
 <avromanov@salutedevices.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <kernel@salutedevices.com>
Subject: Re: [PATCH v4 0/6] mtd: spinand: add OTP support
In-Reply-To: <20250127153848.199526-1-mmkurbanov@salutedevices.com> (Martin
	Kurbanov's message of "Mon, 27 Jan 2025 18:38:18 +0300")
References: <20250127153848.199526-1-mmkurbanov@salutedevices.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Feb 2025 15:41:51 +0100
Message-ID: <87jza124wg.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopegviihrrgdrsghuvghhlhgvrheshhhushhqvhgrrhhnrghgrhhouhhprdgtohhmpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrt
 hifpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesmhgrkhhrohhtohhpihgrrdhorhhgpdhrtghpthhtohepfhhrihgvuggvrhdrshgthhhrvghmphhfsehkohhnthhrohhnrdguvg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064157_312314_5561012F 
X-CRM114-Status: UNSURE (   7.15  )
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

SGVsbG8gTWFydGluLAoKT24gMjcvMDEvMjAyNSBhdCAxODozODoxOCArMDMsIE1hcnRpbiBLdXJi
YW5vdiA8bW1rdXJiYW5vdkBzYWx1dGVkZXZpY2VzLmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2hz
ZXQgaW1wbGVtZW50cyB0aGUgU1BJLU5BTkQgT1RQIGZ1bmN0aW9ucyB0byBhbGxvdyBhY2Nlc3Mg
dG8KPiB0aGUgU1BJLU5BTkQgT1RQIGRhdGEuCj4gU3BlY2lmaWMgc3VwcG9ydCBpcyBhZGRlZCBm
b3IgTWljcm9uIE1UMjlGMkcwMUFCQUdEIGFuZCBFU01UIEY1MEwxRzQxTEIvCj4gRjUwRDFHNDFM
QiBmbGFzaCBjaGlwcy4KClRoZSBzZXJpZXMgaXMgcmVhZHkgZm9yIG1lLCBidXQgaXQgbG9va3Mg
bGlrZSB5b3UgYXJlbid0IGJhc2VkIG9uIHRoZQpsYXRlc3QgLXJjMSB3aGljaCBwcm9kdWNlcyBj
b25mbGljdHMgd2hpbGUgYXBwbHlpbmcuIENhbiB5b3UgcGxlYXNlIHNlbmQKYSByZWJhc2VkIHZl
cnNpb24/IChjb25mbGljdHMgc2hvdWxkIGJlIGVhc3kgdG8gaGFuZGxlKS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
