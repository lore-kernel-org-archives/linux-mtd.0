Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD789C282EC
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WE2X0slMq7GqMAGrkifp1UDRV0B4w7UKNeMoer8U3FY=; b=T8k5JJVuIL9KwC
	RYdDht6/wrLSJol8EmlSVzgzI5+u73GFC1+e49T+TwcgDA6kjsotiW5xZf0MV7uG1eN2Hl/ypGwD/
	c4uXv2k1052uFSrO2UCbUlc5irg1yqikEVgSSPsMLCbdGDiRlBqGHGJcvvhKp5Mim92m7rkLIhD9K
	30f5rbaCIGcx1CkmyOZY2adiLLtfASzw9elCJcx9pA8kULlXLXhy0MiThpNxWwNhudfzlKp7y4eNe
	JcpYbZlHsx1qwXogAo+U/WmZYdmieia2nkI8NWtyj0pMIsk4v7NU27GootAkgGH5xgoss7vF+KFB/
	z/VkIx9GRwJXakQ2m2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Lp-0000000Am5s-1N8n;
	Thu, 06 Mar 2025 11:25:17 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq981-0000000Ak9r-1inX
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 11:11:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9BEA4427D;
	Thu,  6 Mar 2025 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741259459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/dqjpSRPY6IR2rsQN/xpXtLD4i58GyG/K3JKs5Wvbc=;
	b=jLKODI924xusmy0E50/cRwP5S0Ihhn9f5ovzlGCiGaSugfcp+VA9jiWCI6q+X+3sSQ/SGe
	m0LvgRxxMTiiF5UOU4fc6IjYkRgJ3os5bCeWsujR0ZKdCPmgX1itxzaw5Tz90BIG2KPdN8
	EEwFtIJW1V/PUMpWxGV9Y4TwELmtPxwognPBSBXKwwIe/kO3S++qoULh/LuDzqgAnbxahz
	PMgUysVp9/kKZwyoK0mIvKIpOSdkkuD08F7pB2iLtMnJktny9UpLNgtTy6vzAKIjvCrE5e
	eIHTM8DgSpwZB412E4S39LFLJKJjpsm7E+pslbdEGUX79XIg5FzJ/Z8O1wG26Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Cheng Ming Lin
 <linchengming884@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Improve spinand_info macros style
In-Reply-To: <3f5a150f-0a12-4055-8224-010c678ada02@linaro.org> (Tudor
	Ambarus's message of "Thu, 6 Mar 2025 10:42:21 +0000")
References: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
	<mafs0a5a1j7om.fsf@kernel.org> <871pvc296e.fsf@bootlin.com>
	<3f5a150f-0a12-4055-8224-010c678ada02@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Mar 2025 12:10:58 +0100
Message-ID: <87y0xitnwd.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhts
 hdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031102_211736_2F3418A2 
X-CRM114-Status: UNSURE (   7.98  )
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

SGVsbG8gVHVkb3IsCgo+Pj4+IExldCdzIGFzc3VtZSBhbGwgdGhlc2UgbWFjcm9zIHNob3VsZCBu
b3QgaGF2ZSBhIHRyYWlsaW5nIGNvbWEsIHRoaXMgd2F5Cj4+Pgo+Pj4gcy9jb21hL2NvbW1hCgou
Li4KCj4+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJJ2xsIHNlZSBtYXliZSBJJ2xsIGZpeCBp
dCB3aGlsZSBhcHBseWluZy4KPgo+IEl0J3MgYWx3YXlzIGdvb2QgdG8gYWRkcmVzcyByZXZpZXcg
ZmVlZGJhY2ssIGV2ZW4gb24gdHlwb3MuIE90aGVyd2lzZSBpdAo+IG1heSBlbmNvdXJhZ2UgcmV2
aWV3ZXJzIHRvIG5vdCBwb2ludCBvdXQgdHlwb3MgYW55bW9yZS4KClNvcnJ5IGZvciBub3QgYmVp
bmcgY2xlYXIsIEkgZG8gbm90IGludGVuZCB0byBsZWF2ZSB0aGUgdHlwby4gSSBtaWdodApob3dl
dmVyIGZpeCBpdCB3aGlsZSBhcHBseWluZywgYXMgbm8gY29kZSBpcyBhbnl3YXkgaW1wYWN0ZWQg
aW4gdGhpcwpjYXNlLgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
