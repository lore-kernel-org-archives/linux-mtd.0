Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ADCC83F17
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBLZFd6BdhnkCR9pGCX7pxjev04xcJRPp9aJWuRN9PI=; b=B7ixMeKo8hpuWK
	NslgyE1tKuJh0bfe3fZ5PRPkXcAQqG+x1p6hdNFRZYAfYyOm+CfTcj7BXQcPOSSsazyJDxZhihMSa
	u8QbOFITeO6uQrw6D30D0tnmp5uNVj5hKeoYHxAgaQPT4rVuqPKAOLgbtIUpErxQy5vYEr8LhYunv
	3edRfc6DfMNm94J8gnAO0qCq6QFeN9xy5oHRa0/VO2dB+NogfUyj+fFq3eMOWCoKY+7xjZDia+0YN
	U3g95mVw/hmr/saIG1vT+VP07ZsLns0JatgwlreLWN8iKD8JLcKe/hKnxP0tRtXdPSkKK1132Xu3J
	YeSr2j5JFwOzy7seSdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKxQ-0000000ECui-3QXN;
	Mon, 28 Jul 2025 10:19:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKux-0000000ECXO-3vpj
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Jul 2025 10:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=r1rfcU6bVAroB+JlXo4xz195PlOMcJxuJT/+Bzp7VP0=; b=WFIPsMnWZTtcPdJZYMf6dGOlZ0
	xewqku/dhK9XcasbfzZtLB8ZC0A93cZzRfjFLx2ODNIYGd/f0i8l7H0dFK6ZzTh1gjRD2OW5dPNex
	yqRa/I2M2budjkTOMJHqdI6UslWbuDczq+ZlWUycCeFofe/8z6Ld2akaxKDzSisey2ApqlXaPtmAo
	zr4aQ9ITy4SbDydr4jEFltW29PbnqagADswpWkOA/DO3xESruxhQLudaxFu0kTY/SX/CkATXFu4W1
	ypOYrPVyyRyrT9G6siWeJogHWzqyUiSeE5J2kz94yypCCtZEjA6R6JTGzT3C+rUXq+/ty/DBiKLnf
	ORWe/4TA==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKuq-0000000CQx8-1MKX
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:17:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60BF843216;
	Mon, 28 Jul 2025 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1rfcU6bVAroB+JlXo4xz195PlOMcJxuJT/+Bzp7VP0=;
	b=MmPNSoMyWtFWYBokuTGwidoP3LyRH6iia+669R49ySQ4QmUwJlKh059AT7CpYf0GfjYqpF
	3+KpnHOTtSCtL07PcpHsi+yjFPIX5AOdIJF+zffnTUJ8fJM8OzrOwzqs6qOFG6j0d4jLGi
	/vXinb5e45jkQ/03yNXwhRtpYRItTY6e3AdWxys7TIHZk0yKrKo7ukXdN9M8+R9X8xCvFC
	zy0bHEH3mb6Y05rQEL8fgoJAXLkaPNd+YY5mBYH9svZIG5KulZu4Xk3vYuR+40T5tytpib
	tIFvNYPgQTRUZqqnF0Tpa/iMZ+3zv5zIV07ERFOSUq2dBRDtV8aro7KO+WU11Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 bcm-kernel-feedback-list@broadcom.com, william.zhang@broadcom.com, 
 anand.gore@broadcom.com, florian.fainelli@broadcom.com, 
 kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
 =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
 rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
 vigneshr@ti.com, richard@nod.at, bbrezillon@kernel.org, 
 kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, kilobyte@angband.pl, 
 jonas.gorski@gmail.com, dgcbueu@gmail.com, dregan@mail.com, 
 david regan <dregan@broadcom.com>
In-Reply-To: <20250703024719.2256470-1-dregan@broadcom.com>
References: <20250703024719.2256470-1-dregan@broadcom.com>
Subject: Re: [PATCH v3] mtd: nand: brcmnand: fix mtd corrected bits stat
Message-Id: <175369782433.102528.8293919155705720078.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:04 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffhfdufefgueeuheeuveduieeijefhjeduveduveeitedvteeftdffhfejieelfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegurhgvghgrnhessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopegughgtsghuvghusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhir
 dgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehjrghimhgvlhhirghordhtfiesghhmrghilhdrtghomhdprhgtphhtthhopegtohhmphhuthgvrhhsfhhorhhpvggrtggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111710_174185_A528B8E2 
X-CRM114-Status: UNSURE (   5.41  )
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

T24gV2VkLCAwMiBKdWwgMjAyNSAxOTo0NzowNSAtMDcwMCwgZGF2aWQgcmVnYW4gd3JvdGU6Cj4g
Q3VycmVudGx5IHdlIGF0dGVtcHQgdG8gZ2V0IHRoZSBhbW91bnQgb2YgZmxpcHBlZCBiaXRzIGZy
b20gYSBoYXJkd2FyZQo+IGxvY2F0aW9uIHdoaWNoIGlzIHJlc2V0IG9uIGV2ZXJ5IHN1YnBhZ2Uu
IEluc3RlYWQgb2J0YWluIHRvdGFsIGZsaXBwZWQKPiBiaXRzIHN0YXQgZnJvbSBoYXJkd2FyZSBh
Y2N1bXVsYXRvci4gSW4gYWRkaXRpb24gaWRlbnRpZnkgdGhlIGNvcnJlY3QKPiBtYXhpbXVtIHN1
YnBhZ2UgY29ycmVjdGVkIGJpdHMuCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtz
IQoKWzEvMV0gbXRkOiBuYW5kOiBicmNtbmFuZDogZml4IG10ZCBjb3JyZWN0ZWQgYml0cyBzdGF0
CiAgICAgIGNvbW1pdDogYTAyNzY1NTBkZDQ0NzRhMzc2N2I0MzVkYjFiNDFjMzdlYTVkZDcxOAoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
