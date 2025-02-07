Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77848C0219D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PxCLtg14dxsM40MrzOCzz4Fkscj43BS6hgZoHzTVCM=; b=3SHhT0H6aEMjeA
	dkVk9pt7EeoEMRt/gmShORWoGe+lGl5uyoRKlMKnVfEg8wNoOWrKhGmolEuHJxbJX299ufQZlQz6t
	JJ/nNhkHpPid6/kql+7+WwqIazBBd5cTFJPES2o9Zg2O0tdptaD6caQ0qytEzwFsVBWB68LHEO6YS
	jNMnSU3+0z8P7VpXZp5qvSr8LG/GQNnk0kQwRP/GNrgbLXb0TXarPZkU8ws+bggQcyEQuLobcjmc7
	WOqsl6ujXbqDuNMmEcG4D23HLc5aqUIg4SZF7SZ2jFBqAsCABqQX2O3EqtvMKxnCqGdw+qW8tMOx1
	e922HZubFJKPM2/B/C7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPgX-00000009ww6-3Vfe;
	Fri, 07 Feb 2025 14:50:25 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPdQ-00000009voT-2NOT
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 14:47:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12868204A9;
	Fri,  7 Feb 2025 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpI2edtbUAkl7Pk3+d3AA5YEgCOsQaOIF4NmC7POzv8=;
	b=bMxpm79108QBRUdxCCdN5krj6MIdBumPFmBPh1gWXDPYYu0yVb8lZs4VYWUd3wkrW6r8Cf
	bJWsszmSt0FkvB/KZKu+msKcUDFlx4zcm/rpFRNNPlRAitkBX6PRsGeLarfaXU8Z7cVsvs
	4+RJUB3mLfGDvZpRMmuTfOMKhGe+pCrPTllnpZDITeY/MZ6RLs4A9ZnGdZuPZROOovMYjJ
	H0kn+ai+XGSBV1JIJN0z98u4nY/fGG1/5WvUkz3+sjrzHu/BATX46NRQk2stkO+cwDhjMz
	LNvlCs9dKNqvpMsCJQwJz/UUVd8aKQ/rIhj301OvEPcQw3KHXF4npcBv6Cy/pA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250203213042.12657-1-robh@kernel.org>
References: <20250203213042.12657-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: arasan,nand-controller: Ensure all
 properties are defined
Message-Id: <173893962795.2918632.15480410452310039878.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:47:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhou
 gdrrghtpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064712_753887_BC84EC65 
X-CRM114-Status: UNSURE (   4.82  )
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

T24gTW9uLCAwMyBGZWIgMjAyNSAxNTozMDo0MSAtMDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3Jv
dGU6Cj4gRGV2aWNlIHNwZWNpZmljIHNjaGVtYXMgc2hvdWxkIG5vdCBhbGxvdyB1bmRlZmluZWQg
cHJvcGVydGllcyB3aGljaCBpcwo+IHdoYXQgJ3VuZXZhbHVhdGVkUHJvcGVydGllczogdHJ1ZScg
YWxsb3dzLiBGaXggdGhpcyBjb25zdHJhaW50Lgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQs
IHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBtdGQ6IGFyYXNhbixuYW5kLWNvbnRyb2xsZXI6
IEVuc3VyZSBhbGwgcHJvcGVydGllcyBhcmUgZGVmaW5lZAogICAgICBjb21taXQ6IDQ5OWE0YjE2
YTQ4NjlhOTAxYTliYzYwMWJjMWUwYjhmNjAxNTFlOTMKClBhdGNoZShzKSBzaG91bGQgYmUgYXZh
aWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAo
cHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMs
Ck1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
