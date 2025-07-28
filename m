Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A96C87FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFoWM/+e5ki2oDp10ajSj9wIQV11DPZOiOt7+vnCLfU=; b=zlL3fJ4xAdEmDY
	iHqDqrOD8NzMjG5dslyMzz2cYG/JH5jQn5f7ttW/BLhtdgqqrZVF6wuSTyJTp+9NbYXUK/uvoaSk/
	c4ZJLx32454FBDub8YADtbHryJIe8f+KEdBVp17Yh+SdhNe7Igthc8FVddXK93JwR95ruwhF0LM0r
	osFslDPWVA5zh5RJzFsNvPtofvlcSrayH8Sg2TLC+znCOz6ycls5klKOH2B2FMAvMTNXl1Bjz/Drh
	aph0MxHRDTQRuvH/YMBIZ9f6NixgVyaQ5JKdfwQ9dNPPQU5zX9xPHGpvNEVQmSB3GMOrjZkDsPGew
	q30Ln3DHN+vQdBF4M2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL2K-0000000EDqy-2Ipg;
	Mon, 28 Jul 2025 10:24:52 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKw6-0000000ECiH-0NA7
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:18:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99ECF43207;
	Mon, 28 Jul 2025 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4wkqLxHY+RoBc1uK2vAFB86qGeFPMMdWw1AN5D2+K0=;
	b=ZEn4oMM7Iv+ycDpPwVaonXt85rgzoSjZ3I5sxVaIISnN+aNRaHgQ2RgjwEfygtEEMBjQeX
	tZWcfVDq0qj7kHjM3K7sIuTQkDxwtxsE4dRCcAyAF4XfZKXXN1H7BKKVOAA8PvlUU/aghT
	WFZup0ZtoX+xiXBCaiLnUsuQlY/n2/QWwoLeboPzAaafcyo88/yG5pyXTK7xvOzalf+bbk
	J5IrnLChtCJOJl4/mcdt5EAxBzmIXE2/MgvpSUpv5Jad7IsKXI2Mmu1Glelo7yHSCxPdkF
	wJy3E8A9bvdVgcrJ2KbtE6YORE7d2A9J8dE1mNQFfJMkD+pzgG1F8uXpRM2UnA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20250626160812.325940-1-andriy.shevchenko@linux.intel.com>
References: <20250626160812.325940-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] mtd: map: Don't use "proxy" headers
Message-Id: <175369790143.102852.15567348497821292698.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:18:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehli
 hhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_031826_273194_CFE825E4 
X-CRM114-Status: UNSURE (   6.05  )
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

T24gVGh1LCAyNiBKdW4gMjAyNSAxOTowODoxMiArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IFVwZGF0ZSBoZWFkZXIgaW5jbHVzaW9ucyB0byBmb2xsb3cgSVdZVSAoSW5jbHVkZSBXaGF0
IFlvdSBVc2UpCj4gcHJpbmNpcGxlLgo+IAo+IE5vdGUgdGhhdCBrZXJuZWwuaCBpcyBkaXNjb3Vy
YWdlZCB0byBiZSBpbmNsdWRlZCBhcyBpdCdzIHdyaXR0ZW4KPiBhdCB0aGUgdG9wIG9mIHRoYXQg
ZmlsZS4KPiAKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0g
bXRkOiBtYXA6IERvbid0IHVzZSAicHJveHkiIGhlYWRlcnMKICAgICAgY29tbWl0OiA1NmViN2Mx
M2I5N2M2ZjllMmZlZDllOTg5OWIwMWQxYTZhNTk1ZjI4CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2
YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIg
KHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRz
LApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
