Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77A6C87FCE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRwO0dmoKnr7ua7rUpHQ9W0q641sfj7uDCAxmnOoZtI=; b=c9pnBvfEqzkjX4
	Psgu64CzHVjYHTwGJzuD7GJkpqa0HdU/hjYmkzzks57Fzqp1cbGdeChRtNYayp1rQfvaAMS2AaO41
	JSlxzKR7HCYarVRo3lLTxLJF+YpLH6h+FeufIzvo5iJuyk53CTt6wVEaHt2w4dbm3BzdG2l4CMG3w
	c415inejiElZOYkOqDgo4ev5gYZ0sCX6xvm4u5LhWJwz5uhTAYH8na/HL1uGY472PWMBIjI19nlvT
	cFqEfzBJwffdEQ2hsk462TrD35TV6morzGVFNL/FWNg8Hu4WSBZGWVQErzkRlSMcazUfgmNIfy/eS
	PD0/K9Xej4x3loFWSMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKxP-0000000ECuD-3d9c;
	Mon, 28 Jul 2025 10:19:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKut-0000000ECWJ-2snP;
	Mon, 28 Jul 2025 10:17:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 533254329B;
	Mon, 28 Jul 2025 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2pizfwQKoKGdOMNPF3BacZFLWH5qaDvaOE2TTeK/ok=;
	b=Zkjm2shC8dNPGEV/0FDraPI/Gg1TM6vzU4y67mQAQKjGs7GIW7cMATKaDnPj+LMlVvAL5v
	AnhlTFDspYEHISwt70asIz8Bb6M+QkY5nqza3mta+yabDsmRBIpV4GUUeUu5wty2XFvzKg
	V+lNpJfKQwIPfp+QwGVBLhGf1EJ99eXxPTitG73IkgBtfPEnOAQgqYBViXdQDnagnJzkw9
	lJ9BFClJWot2fPgP2LTnwTSf1c3JD9gLDrPuNDT7cGzVCUqlQ6/30uZtZPmFhSolXVugiB
	exNfyxDXBiOPsSQW1YY7ulGIE0acjFwrsheLnC7oLFBSnndJrUhmfxFwYmXQvg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 dan.carpenter@linaro.org, bbrezillon@kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: Zixun LI <admin@hifiphile.com>, 
 Ada Couprie Diaz <ada.coupriediaz@arm.com>
In-Reply-To: <20250721104340.113581-1-balamanikandan.gunasundar@microchip.com>
References: <20250721104340.113581-1-balamanikandan.gunasundar@microchip.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: set pmecc data setup time
Message-Id: <175369782927.102528.5580599335079355284.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:09 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrghlrghmrghnihhkrghnuggrnhdrghhunhgrshhunhgurghrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtu
 higohhnrdguvghvpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprggumhhinheshhhifhhiphhhihhlvgdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_031711_858140_EDFC93AF 
X-CRM114-Status: UNSURE (   4.46  )
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

T24gTW9uLCAyMSBKdWwgMjAyNSAxNjoxMzo0MCArMDUzMCwgQmFsYW1hbmlrYW5kYW4gR3VuYXN1
bmRhciB3cm90ZToKPiBTZXR1cCB0aGUgcG1lY2MgZGF0YSBzZXR1cCB0aW1lIGFzIDMgY2xvY2sg
Y3ljbGVzIGZvciAxMzNNSHogYXMgcmVjb21tZW5kZWQKPiBieSB0aGUgZGF0YXNoZWV0Lgo+IAo+
IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogYXRt
ZWw6IHNldCBwbWVjYyBkYXRhIHNldHVwIHRpbWUKICAgICAgY29tbWl0OiBjMTE1ZTdlZDY2ZjBk
YzZjZjk2ZjliZjNlM2M0NmY2YzQ0YWE1MzFiCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
