Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03080C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHBXmEOPxMIdPQGn9MKnp4h0/KzppiAT12xzKArHfmI=; b=PYkpAhz48jieYq
	GDKDnyuxaf2BLPIyZZXPaT+1DqJp6ljHHGGng8GxBE+uhTmuneVFAgP5eK99HnZczFqgUuZlbRVYR
	7rwJGvzOHC/2rFFcD1mK3+8/ZfS+HdiSeAz6M5OTIdTW3ih1rzRNhao2gXHI3+y7GalsnXgDgTnS1
	4wmxflxxVYpZsimTTZHQjyCpPDSEHXdCgyWQTcRWMXIol0sbJXMvH6o3IzxAeKJvhmOs2swNgLOZw
	qyQjqaJNa4PlzkveJLrwPRy4caFGK4e8aT9QwSeQ6Pk+xAK6AndMKhPCue8b7oXrOOFe14/9Qqp3a
	nBV/HCXuTwGZNHswn4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8Km-00000007vQs-0rY8;
	Mon, 02 Jun 2025 16:48:24 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8Kj-00000007vQY-3xuO
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 16:48:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F81043256;
	Mon,  2 Jun 2025 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748882899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+YBTVgcoFXaKaAop7n+T/oLWbkgtu2yx4zE9my8lxA=;
	b=K0M6ATqisEDTQ5JXBUf70L1RzleTU9AcyUP7nCdIwSAthviwV8iCPuluPLq5BggEZg/69I
	K9uW5vwcP5BC5ZC+LrwjE5UIQtVdHJMdeAldQmE4YDiz9O/VG+wOaAYQFxqphxhgBVbzNG
	760t3BM7yqm0hnrFtzy+S4p4c6KxWAYMexJTvmd9u6LwrMns6dij+falxJ2WgARtPbJIIT
	7ZCckEcH1nsjHcaAYwM8FEvm6NVTeel1En92qb593xBLLv3aEuQ0ekYOz6y7yANGCSyKFG
	ZQ6Al6iphBrwwplSMyACr5817tT8aTvfRs+Umfd7nwTKeCedxLb3ygMzfBmHLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.16
In-Reply-To: <mafs0ldqrtqzx.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	20 May 2025 14:18:26 +0200")
References: <mafs0ldqrtqzx.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Jun 2025 18:48:18 +0200
Message-ID: <87ldqaks31.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkedvtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_094822_116079_00214E4B 
X-CRM114-Status: UNSURE (   5.70  )
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

SGVsbG8sCgpPbiAyMC8wNS8yMDI1IGF0IDE0OjE4OjI2ICswMiwgUHJhdHl1c2ggWWFkYXYgPHBy
YXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBIZXJlIGFyZSB0aGUg
U1BJIE5PUiBjaGFuZ2VzIGZvciB2Ni4xNi4KClNvcnJ5IGZvciB0aGUgZGVsYXksIEknbSBsYXRl
IHRoaXMgY3ljbGUuIFB1bGxlZCBpbiBtdGQvbmV4dCwgdGhhbmtzIQoKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
