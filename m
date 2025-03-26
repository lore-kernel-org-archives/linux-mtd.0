Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C35C3600E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKS2O6wuK77RJ1aU5D9nm4UDgoYtvNMh/NEJ7i1wCaU=; b=pxDuW68gJiLch5
	3IJ2z+SbyiBR5bXL01FTYJrbIQuyQHC64zKForbxyBor9aiViQQ2vlvKjXVI0DMVOiZJgL6Hycg/F
	bOpKr+wSB29PF72MAqLzb5joEP7R4KFf/yMWLR8P3M7cSdjgZWxF8BMdfFgAW78oCO939GhYFRAEP
	TUFEgHIymq/+MAs+beXD5Juz4nMuRQwaGqxWpHoJn+l8iq+7w8PCNbvCwNyGTYtMtn6r5GCrf5Zpm
	dZePu+4RQ7vDrMeHtWDjkcNUqQrPleRrQSTNO1serj59PRgMRAJsSWsHGm1rgsccLqc8Ggu/bd+HF
	mg3VyZIcyUBu4q9Ld9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUVc-00000009ARq-2OX6;
	Wed, 26 Mar 2025 17:25:44 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txU3N-000000095Oy-0rnp
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 16:56:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F09EC44430;
	Wed, 26 Mar 2025 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743008191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bXJ0oLNBJborP8h9cyHjqDVZTHl+kJAv4+LmY4HiteE=;
	b=QbM8kxMPImrGfqF9p3+No83/t+WyUVxfVNs/L0d0z2vUk/leyEF4Zx/TwywPHZ1Qro2CNz
	lxWvBQ9ErT6upGfp1dDLgndh/jtlfruny4TIlbRRQqQQ1AZJYPrvv97VHpA034E9oK3LY6
	gArvg8O9LO10Zttnt0OEEr2q8syIEDoFDHEK9BuUa6SKuOQIKQGhtXh6EApipoJc9djCX/
	K6VKnqDryZR0TW6NUjGFc4fo2pS9y1R7cxPj/D6wuzgZDLZW4wGqC5FI3A6mk68J6dkHqc
	B6EZe8ptg1vt4pXN/y106q8QqmkVp5SHfjjqV5+ZK2DnShFMhBkazvoAuXR/9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  "open list:SPI
 NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,  open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.15
In-Reply-To: <b4a5c030-e8af-4724-a0aa-b53f7e08f365@linaro.org> (Tudor
	Ambarus's message of "Tue, 18 Mar 2025 08:21:01 +0200")
References: <b4a5c030-e8af-4724-a0aa-b53f7e08f365@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 26 Mar 2025 17:56:30 +0100
Message-ID: <87a597ohmp.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeitdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhop
 ehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_095633_386025_61A458FA 
X-CRM114-Status: UNSURE (   5.28  )
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

T24gMTgvMDMvMjAyNSBhdCAwODoyMTowMSArMDIsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IEhpLCBNaXF1ZWwsCj4KPiBIZXJlIGlzIHRoZSBTUEkg
Tk9SIFBSIGZvciB2Ni4xNS4gV2UnbGwgdHJ5IHRvIGhhdmUgaXQgYSB3ZWVrIGVhcmxpZXIKPiBu
ZXh0IHRpbWUuCgpObyB3b3JyaWVzLCBJIGRvIG5vdCBuZWVkIGVhcmxpZXIgdGhhbiB0aGF0LgoK
UHVsbGVkIGludG8gbXRkL25leHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
