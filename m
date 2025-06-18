Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF2BC7115E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEW2htgTIm4crrgFI1c5KwZCRt0ReSkZbLTpX3abTF0=; b=Ft5zPtQku2klT4
	nJB0MZjqcPy9ZVtM+JMjR8NKcVpqGwcz7dZCZUgGW712i7KbGoI291IaNHl8zy2Tkqc7DhIoKKP5n
	QxN3rURyOedQl1Try3TFK2AnMvMiHH3ijX5eL0FvFZBY9mdqM/G0O3aTN4uvvjjp83+O0XmFRTWp3
	F5uSMqlBwv76P+X0b2LLGZ5vmKHQMgIE/hFYrNY3mmiKubHwSmS6t/9VOY8WX2HJCRVkIlZ2LyEJM
	Ksm6T9omvKglLseP3Fj70laMhZd4IcZx7WpY3CrvlXccy3PVr+M9PcmPHK7h/C3EzFl7xfk0m6Fhc
	QXP0BfjgHujiBvoPjaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRowk-00000009Y6f-1hIQ;
	Wed, 18 Jun 2025 09:19:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouy-00000009WYg-1Pt8
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 09:17:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F08604444B;
	Wed, 18 Jun 2025 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750238231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaCiWk1uCV6f32Pf9vYpmKTKHSEQ9o15TWK0/frA/pQ=;
	b=BRTgA/pQhK39kpr6tYdoZLw+2CYzmAk7AVPdXv1Y6k4OO45Wu9w5MK4xR67uwXWtzjMMn6
	J8draniOZCheJ/PZROitctZfpPeUUDx4sE4o/DSRBSXI58Xx1xupUw5NG0zflULoKopZcU
	gm0GXMqvO+1j4JjcrhYCarBBXyn/AyWDPWXyjQWQarwXUzAMkpYqIJva6Dxb2RhRu9OE24
	KjgVu8Gp/9Grm0lnlcv9KAkC9bvU8IV2jL8mJQfdDb65VgBc7RTKhxXgu5JL2xIGTsFgDN
	xSI3QFGWnY1KCKzNXU86eFOqK8K9SSuxrvydmx0w0YiA+mKo5iguwxEEGRcVUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250610092526.2640870-1-arnd@kernel.org>
References: <20250610092526.2640870-1-arnd@kernel.org>
Subject: Re: [PATCH] mtd: nftl: reduce stack usage in NFTL_movebuf()
Message-Id: <175023823094.1656646.8809228432720307763.b4-ty@bootlin.com>
Date: Wed, 18 Jun 2025 11:17:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegrrhhnugesrghrnhgusgdruggv
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_021716_750200_29B34A59 
X-CRM114-Status: UNSURE (   7.47  )
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

T24gVHVlLCAxMCBKdW4gMjAyNSAxMToyNToyMiArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToK
PiBUaGUgY29kZSBpbiB0aGUgbnRmbCB3cml0ZSBmdW5jdGlvbiBpcyByYXRoZXIgY29tcGxleCwg
YW5kIGl0IGNvbnRhaW5zCj4gYSA1MTIgYnl0ZSBvbi1zdGFjayBidWZmZXIuIFRoZSBjb21iaW5h
dGlvbiBvZiB0aGVzZSB0d28gbGVhZHMgdG8gdXNpbmcKPiBtb3JlIHRoYW4gdGhlIHBlci1mdW5j
dGlvbiBzdGFjayB3YXJuaW5nIGxpbWl0IGluIHNvbWUgY29uZmlndXJhdGlvbnMsCj4gZXNwZWNp
YWxseSB3aXRoIEtBU0FOIGVuYWJsZWQ6Cj4gCj4gZHJpdmVycy9tdGQvbmZ0bGNvcmUuYzo2NzM6
MTI6IGVycm9yOiBzdGFjayBmcmFtZSBzaXplICgxMzI4KSBleGNlZWRzIGxpbWl0ICgxMjgwKSBp
biAnbmZ0bF93cml0ZWJsb2NrJyBbLVdlcnJvciwtV2ZyYW1lLWxhcmdlci10aGFuXQo+IAo+IFsu
Li5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IG5mdGw6IHJlZHVj
ZSBzdGFjayB1c2FnZSBpbiBORlRMX21vdmVidWYoKQogICAgICBjb21taXQ6IGQyMmQ1ZjQ3ZWNi
MmM0ZTE0MGMwZWU1MjIwNGY0ZGQ4ZmQwZTg1ZWIKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxh
YmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJv
dmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
