Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37E3C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+N7uXDp+svWkvB7m83guTcGx9OaUfSkRtZ1+iNRbLo=; b=zGkjsviTfGau1E
	I+K4EmiST9gJTzTiHYjs+GJdnZqSEK3g0faHbwZYaSfWlPwp47Qpty9GPQgDqDO8/kfksILWMJJ48
	8cpjDiOYp7XDLE7Kd3V7FhHcpFG7rYsg2OEAp/HHMzJdmLaUTu7cYWXrxn6YVn7hO/rXqddoZBrYH
	lCdLgFrGMAxngF4G6Bh9gSZu8c5dgm7ApJOt/HvAk+xJxzIMm/CbO5DguqZ2ZYu0+m5AXATf0OZXp
	CXktS9/lE7mBftRd78mmGZEjwyQdYsww2fqYCrI5ht/ZNZiATal0yswlhWCqZeQ9bLNY/VLc0gv2e
	n7WsK6M2UcLkbo4xtoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8LO-00000007vaK-1X8x;
	Mon, 02 Jun 2025 16:49:02 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM8LL-00000007vZ6-1wQM
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 16:49:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ADD443A56;
	Mon,  2 Jun 2025 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748882937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEri49oApM7VTwoXFlBohj2NdW3k4CujQHJ/5GEIQ6s=;
	b=DxsBo2YkYcjzdXnVLXklZ4cO6cpfFRqdLEdqP1aDJoWpLzWeYVRldQ4PiAFOJgcdhn2A87
	bqZVOSKKpDJz9ssoWwiaE+yUrMIheTCNdAKC9hiwj4zQu234MFpVwF7zrRjhmwKRPE/d0b
	Yz6eDl/s5mz51liRnNGr8Mx0cABGrczQdyucMPS3ZszIjhlXauJTvCe4F91N83Ho/RXLns
	SEz2amXWA41aZl+YLvAKB4uOGVPBPLv1A8U/zKe/GZWQAsdN/pEyq7kVYI/zV/YhKVuTyG
	LTK9OD7xJxbAnCrxv+yIabeNASW/fWiANkJrtH8z7FoxY1ka3VxB+CX/3umohw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.16
In-Reply-To: <87tt4yksiw.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 02
	Jun 2025 18:38:47 +0200")
References: <87tt4yksiw.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Jun 2025 18:48:54 +0200
Message-ID: <87cybmks21.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkeduleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopefvuhguohhrrdetmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepfhhrihgvuggvrhdrshgthhhrvghmphhfsehkohhnthhrohhnrdguvgdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgtt
 gdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_094859_636102_82825E04 
X-CRM114-Status: UNSURE (   4.41  )
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

T24gMDIvMDYvMjAyNSBhdCAxODozODo0NyArMDIsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIZWxsbywKPgo+IFRoaXMgaXMgdGhlIE5BTkQgUFIg
Zm9yIDYuMTYuCgpQdWxsZWQgaW50byBtdGQvbmV4dCAoc29ycnkgZm9yIHRoZSB2ZXJ5IGxpdHRs
ZSBkZWxheSkuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
