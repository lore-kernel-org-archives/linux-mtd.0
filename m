Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC12C83F05
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK/xX4tkuLkE0Sp3tDPHkaYlM0hTg0vpSfwx2yTMQto=; b=zspPYuCfL2l3Dh
	/NRnfs3O81jzSJA5HjlfGEJlfkgbgQObyghkPIZvH04+678z7bR2Rbukapg1WM2GhxiPcOgffos5s
	YUKCOPOX67Y4D1HMR/BB9O9gkQQBl09hpL5B6ZH9Un49x9AUJgURFxtDAQG+GftqD/MoS6Rpeq/u6
	Ew9i6OxRec9gti34FAl45TprC7PeT9B2EL4wBQZA6+k896SypFSos41LZiL+OJILythO3OmzwJEBI
	F6ZGGEXdiKu6E62Op10PLtBhxigBY79f1VDzmyvS9r/SzkUQQANurLnGwj7NLGj40IgBTlYl4VlIQ
	SWNjAunBAzHynN2b59yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Zs-000000090Hn-11Fw;
	Wed, 02 Jul 2025 16:44:56 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzqT-00000008s9L-41KF
	for linux-mtd@lists.infradead.org;
	Wed, 02 Jul 2025 15:58:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90D78444EC;
	Wed,  2 Jul 2025 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751471878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hfDPZP3goEnu8Nns41kP0rSut7x+DAY1Oqm+6uGkYY=;
	b=QYafDFnnUxW8bTyChHQaAIDR1Gj+INHqaDrY+O6uONURspxRU0jM33avII/QtJREUyQNvd
	Ot+jpm++bzkwIBjz9K50HYhg9InxRGP6fXhJayrMp6TxTr6M4JRV8Orsrdcy04PVMc6JaR
	xAGNg1wN7ACBpzTRbhwlU/Fm5UZj0fQ5H0kwTpB0bWYVZbiRXG/XjCrx6Q4j5Io+fSXZ3d
	U2E504d9B/bIhotxffcPos/AfFDodSAXcgUGOOu3fvLWi2HIgiEPrJJAIhWJmX1/9boekX
	LzhswHqQoTnatOuSuxNdvxLGd5vHzdzaLUobgAL73mQcDGmIByC4KjhEA1+Ylw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Manivannan Sadhasivam
 <mani@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Varadarajan Narayanan
 <quic_varada@quicinc.com>,  Md Sadre Alam <quic_mdalam@quicinc.com>,
  Sricharan Ramabadhran <quic_srichara@quicinc.com>,
  linux-spi@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: nand: qpic-common: add defines for ECC_MODE
 values
In-Reply-To: <20250702-qpic-snand-8bit-ecc-v2-1-ae2c17a30bb7@gmail.com> (Gabor
	Juhos's message of "Wed, 02 Jul 2025 14:35:23 +0200")
References: <20250702-qpic-snand-8bit-ecc-v2-0-ae2c17a30bb7@gmail.com>
	<20250702-qpic-snand-8bit-ecc-v2-1-ae2c17a30bb7@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 02 Jul 2025 17:57:57 +0200
Message-ID: <87ikkamvp6.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrnhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepqhhuihgtpghvrghrrggurgesqhhuihgtihhntgdrtghomhdpr
 hgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_085802_598289_795E8C4D 
X-CRM114-Status: UNSURE (   8.87  )
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

SGkgR2Fib3IsCgpPbiAwMi8wNy8yMDI1IGF0IDE0OjM1OjIzICswMiwgR2Fib3IgSnVob3MgPGo0
Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBBZGQgZGVmaW5lcyBmb3IgdGhlIHZhbHVlcyBvZiB0
aGUgRUNDX01PREUgZmllbGQgb2YgdGhlIE5BTkRfREVWMF9FQ0NfQ0ZHCj4gcmVnaXN0ZXIgYW5k
IGNoYW5nZSBib3RoIHRoZSAncWNvbS1uYW5kYycgYW5kICdzcGktcXBpYy1zbmFuZCcgZHJpdmVy
cyB0bwo+IHVzZSB0aG9zZSBpbnN0ZWFkIG9mIG1hZ2ljIG51bWJlcnMuCj4KPiBObyBmdW5jdGlv
bmFsIGNoYW5nZXMuIFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9yIGFkZGluZyA4IGJpdCBFQ0Mg
c3RyZW5ndGgKPiBzdXBwb3J0IGZvciB0aGUgJ3NwaS1xcGljLXNuYW5kJyBkcml2ZXIuCj4KPiBS
ZXZpZXdlZC1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogR2Fib3IgSnVob3MgPGo0Zzh5N0BnbWFpbC5jb20+CgpJIGhlcmVieSBhZ3Jl
ZSB0byBsZXQgTWFybSB0YWtlIHRoaXMgcGF0Y2guCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
