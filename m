Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B0AC02199
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzL5xuKRpK26pCwITuKMkds39GXEl1uGarOpnN2of0Y=; b=HVmAUZZ7ZWXJ98
	06sPI/uHTu6tAuZ0ziUwzFatclssKXlqZre14jV1zx1XTaATfLL8qXwNd9F9x6oB4oXFxlX/IdyLV
	To/Nl/sTljvifEg+E1WONkeC8lDx1VlGhhprfYrUe+tzjAYXcRHpKBmg0huYL+DsQsKznUpmEEqVU
	2nf1imdiXepa8dOgXxt3XAFJ51mPsRojvG6L6XSclv4RO9k3fuqVDMj2G6Y0yyFQX7MM3dxMycw3g
	T8Ys3p90wEnVpADDtAiMCum1KYUS7jm9aqmMar7jkBsEjDkAsDp52QkK5sh/Mf2AXvZFt2uhv9MCL
	kStniBi3+4h1iTRDtUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPf8-00000009wNc-1inc;
	Fri, 07 Feb 2025 14:48:58 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPci-00000009vaA-3ikO
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 14:46:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 093984441E;
	Fri,  7 Feb 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHLzY1AHhlbCSw+8jJ6rJyHUwTuNIdzGBdHorOCOS/I=;
	b=Ncyk4/qs6dFs/8W9ZZUSPH1mNYkDQx0nprk9epMEojro1jiNB/iWXo6+AyqoKDSz9f0+CD
	3ibn9an9GYAHz9MFJlr8mWzg7DUNXH6zbQ4ryeIdbqNcbVDIK6zYBVe2NBLGdE1W9s5oex
	3ViHeQo3zENdPO9yVNvcDowsy8+QNdUyUi4iGiO+QQ53uMQ5CjQZepl+qLUzEuk/4+KuON
	P9TslGgTnfpqSmrjDTXWaRjcsspxZO6tZ+0NiDaS2q7YC6sLNTqKjGVdbNFqYRpclRS+WZ
	luobTXIkK9PUewEKjipe/7IGzWY6bvfyHK1hFyaH5fZHVoHiir+3B7By3smyGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: christophe.jaillet@wanadoo.fr, 
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: gmpy.liaowx@gmail.com, jirislaby@kernel.org, kees@kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, 
 stable@vger.kernel.org, vigneshr@ti.com
In-Reply-To: <20250205023141.26195-1-jiashengjiangcool@gmail.com>
References: <f9a35a4f-b774-4480-910a-cdcf926df41b@wanadoo.fr>
 <20250205023141.26195-1-jiashengjiangcool@gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: Replace kcalloc() with devm_kcalloc()
Message-Id: <173893958598.2918383.9120476205146418740.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:46:25 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhirghshhgvnhhgjhhirghnghgtohholhesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopehgmhhphidrlhhirghofiigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064629_062452_A031D9C0 
X-CRM114-Status: UNSURE (   4.85  )
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

T24gV2VkLCAwNSBGZWIgMjAyNSAwMjozMTo0MCArMDAwMCwgSmlhc2hlbmcgSmlhbmcgd3JvdGU6
Cj4gUmVwbGFjZSBrY2FsbG9jKCkgd2l0aCBkZXZtX2tjYWxsb2MoKSB0byBwcmV2ZW50IG1lbW9y
eSBsZWFrcyBpbiBjYXNlIG9mCj4gZXJyb3JzLgo+IAo+IAoKQXBwbGllZCB0byBtdGQvbmV4dCwg
dGhhbmtzIQoKWzEvMl0gbXRkOiBSZXBsYWNlIGtjYWxsb2MoKSB3aXRoIGRldm1fa2NhbGxvYygp
CiAgICAgIGNvbW1pdDogYzc2ZjgzZjJlODM0MTAxNjYwMDkwNDA2YmE5MjU1MjZkNWYyN2MwNwpb
Mi8yXSBtdGQ6IEFkZCBjaGVjayBmb3IgZGV2bV9rY2FsbG9jKCkKICAgICAgY29tbWl0OiBkMTMy
ODE0ZmQ2ZmQyZWNiMzYxODU3N2YyNjY2MTFjYTEwZDY3NjExCgpQYXRjaGUocykgc2hvdWxkIGJl
IGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQg
UFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdh
cmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
