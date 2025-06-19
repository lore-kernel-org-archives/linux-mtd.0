Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C1BC7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMVhSaL8Xzvwi2forzI6ix11IZEjgS041f3ihrGJmBQ=; b=gMT5PxciCijC5S
	KS/wPyvl2lzoPypYZKOUpbue9TzLhXAWd+7L6EtNSHKOSedDnXVHv0MEWUEhjISLqHHNHwUuf25ZN
	tF8rAPFyJcFCiBR5bm1FE0rDVLAhJTMxbWwJ/31aYpDro1rkkAJbnrBv4Fx4X7SiSphIceEzsczjE
	I/h4RZW7ULIH7xdidl+78eLqoTYZK8TpLyM9KYjcqJFm1d1v+bxUH1r5grgQXtx8tS7HQt/yGMwDb
	kdN/QdZXjRTC/aNFGEl6yIqvFHR69yNbbLJS/W57dLZzxxuNR9XtTL0UwIgg2/HjoyzrvF/Fq+NQJ
	tx8PyunDLq9NHJsHIU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKCU-0000000DzDe-3IC3;
	Thu, 19 Jun 2025 18:41:26 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIp5-0000000Diw3-2uC2
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 17:13:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BC74444FA;
	Thu, 19 Jun 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750353190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/E3RtjgKcBTQh9hUreB5CJGBGKHBJ8ax9sosU7KAo4=;
	b=iRHOQ0WdYr2K1a7t8NWNn24Q9UjT3IMdAf/PwHGvNL2Ye9tSDO8TeXbyp88X7RhaM5Pd/Y
	MqzXnUaveKy3EPDr6XJAWdcTJ+xSCBHSse2692BZ/zckB6+PXnwdq69uLZhx76crZjeDaD
	z9I9fPoVo+pBDqIogn/NfMeCkwvOnwDT1tJ/VFRWWxOrcMIMZnl2UEcneS2RO6AMBhdiHU
	7eq4OlTnhDBPxn+4W8dFUprexThVDuRL9l1b1Agnzup4H1dq+V0MinipAB/iX/T0/Vnv/Q
	QP+PDUIQOe3ci/AzTHi1NgADEQJwo2TUUZZrRjpIAAL9dY0JcER9WsD521dx1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] Revert "mtd: core: always create master device"
Date: Thu, 19 Jun 2025 19:12:58 +0200
Message-ID: <175035310479.437524.13121526908548942023.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618085444.1649852-1-miquel.raynal@bootlin.com>
References: <20250618085444.1649852-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefuefgvdfffefhudfhteffgfeiieduueegffdvhedvvdeludejjeevvdfgtdevgfenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehli
 hhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_101311_863125_0FE39B97 
X-CRM114-Status: GOOD (  10.11  )
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

T24gV2VkLCAxOCBKdW4gMjAyNSAxMDo1NDo0NCArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGUgaWRlYSBiZWhpbmQgdGhpcyBwYXRjaCB3YXMgdG8gYWx3YXlzIGxldCBhICJtYXN0ZXIi
IG10ZCBkZXZpY2UKPiBhdmFpbGFibGUgdG8gYW5jaG9yIHJ1bnRpbWUgUE0uIEhpc3RvcmljYWxs
eSwgdGhlcmUgd2FzIG5vIG10ZCBkZXZpY2UKPiByZXByZXNlbnRpbmcgdGhlIHdob2xlIHN0b3Jh
Z2UgYXMgc29vbiBhcyBwYXJ0aXRpb25zIHdlcmUgY29taW5nIGludG8KPiBwbGF5LiBUaGUgaW50
cm9kdWN0aW9uIG9mIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSIGFsbG93ZWQgdG8ga2Vl
cAo+IHRoaXMgIm1hc3RlciIgZGV2aWNlLCBidXQgd2FzIG5vdCBlbmFibGVkIGJ5IGRlZmF1bHQg
dG8gYXZvaWQgYnJlYWtpbmcKPiBleGlzdGluZyB1c2VycyAob3RoZXJ3aXNlIHRoZSBtdGQgZGV2
aWNlIG51bWJlcmluZyB3b3VsZCBiZSB0b3RhbGx5Cj4gbWVzc2VkIHVwIHdpdGggYW4gb2ZmIGJ5
IDEsIGF0IGxlYXN0KS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMKClsxLzFdIFJl
dmVydCAibXRkOiBjb3JlOiBhbHdheXMgY3JlYXRlIG1hc3RlciBkZXZpY2UiCiAgICAgIGNvbW1p
dDogNjM1ZTExODMxN2ZmYTc3M2Y2ZDI1ZWM2YTcxYjc5MjdkN2U4ODg2YQoKUGF0Y2hlKHMpIHNo
b3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRo
ZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
