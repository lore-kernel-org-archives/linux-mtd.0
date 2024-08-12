Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1C1C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KUlzAF5Ht0E6T5TnQZ4WSq4l9GJfEVXQg+gxvcz8PY=; b=cIyTVHwJniLGbO
	3YDxVPETWA9HtuJGsDe63yU8AvWHr6pBslfauS7mxMVtnnOIaYd2wxzeXGC6EvvXvju/CayF7cueT
	dcHTLuVDzwNV2UbXp/+b7xfSOxz1pETOAGc6UlROz9+LGPRb/BI0qk4+WTwwZ2ZgMiwaOJgPhQAs/
	IdC5OeyukpWQaYRS43eybXuGQgqLCQF/aivY5WjcBTF8bBkafP0CSfVvCJJy9P/WEtbEcn6fZfeN2
	Q5mCsVzVfVUqSKX/xAizdvV4iEcjtXrpuoWORK6v8vnIr8lsxBD4KoP78m8hS8VHlewAvGDc0iCGe
	SEdlG/MSIuhHb39AjYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQqz-0000000HLJc-1Paq;
	Mon, 12 Aug 2024 08:56:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQqw-0000000HLIy-1mm2
	for linux-mtd@lists.infradead.org;
	Mon, 12 Aug 2024 08:56:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E074C000F;
	Mon, 12 Aug 2024 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723452992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ElaYv5EFcS4qx0+W9y9TrVOp03MbKNX4bj9TdrCX//s=;
	b=l0pdecR3K/faB/eH1Bvsg0H7j9FsAESWgceRwwtx7nUHrmTgY9LdtkeXoMx40fkOd8kZFG
	+8GoxAyqS41ZnBr0Qrw2EqeyGDMOh62Vcy3sArH0W41M0/vXvx7WpPvxCbwKhb1MmVpcK+
	ShIwUsPbvIDOmFuO09T0hf/+646G/2hP0gkHTBilJOBmEQE6qbZ8yO5zWhN9nVPZk6UsAI
	P1pV6JtwGwk8N3ChDTFT7chxCpP+zJTCtb7evYS6CEYLfcGlbm6+kkxqCTeNHqQ5mVmfkv
	B2Aaj2DmBRwly9d8f2w7uro+zdObfqypxWrty5uxrmUZJYAAuyhlxNFVLA6ofA==
Date: Mon, 12 Aug 2024 10:56:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 0/2] Add fixups for two-plane serial NAND flash
Message-ID: <20240812105630.2b71ed19@xps-13>
In-Reply-To: <20240718075356.488253-1-linchengming884@gmail.com>
References: <20240718075356.488253-1-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_015634_616219_F71FFA4D 
X-CRM114-Status: GOOD (  15.92  )
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

SGkgQ2hlbmcsCgpsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMTggSnVs
IDIwMjQgMTU6NTM6NTQgKzA4MDA6Cgo+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmds
aW5AbXhpYy5jb20udHc+Cj4gCj4gTWFjcm9uaXggc2VyaWFsIE5BTkQgZmxhc2ggd2l0aCBhIHR3
by1wbGFuZSBzdHJ1Y3R1cmUKPiByZXF1aXJlcyBpbnNlcnRpb24gb2YgUGxhbmUgU2VsZWN0IGJp
dCBpbnRvIHRoZSBjb2x1bW4KPiBhZGRyZXNzIGR1cmluZyB0aGUgd3JpdGVfdG9fY2FjaGUgb3Bl
cmF0aW9uLgo+IAo+IEFkZGl0aW9uYWxseSwgZm9yIE1YMzV7VSxGfTJHMTRBQywgaW5zZXJ0aW9u
IG9mIFBsYW5lCj4gU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcyBpcyByZXF1aXJl
ZCBkdXJpbmcKPiB0aGUgcmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KCkkgZ3Vlc3MgaWYgdGhl
IHBsYW5lIGJpdCBpcyBuZWVkZWQgZm9yIHlvdXIgY2hpcHMsIGl0IGlzIGFsc28gbmVlZGVkCmZv
ciBvdGhlciB3aGlwcyB3aXRoIHR3byBwbGFuZXM/IENvdWxkIGl0IGJlIHBvc3NpYmxlIHRoYXQg
d2UgbmV2ZXIgaGFkCnN1cHBvcnQgZm9yIGRldmljZXMgd2l0aCBtb3JlIHRoYW4gb25lIHBsYW5l
IGFuZCB5b3UganVzdCBmYWxsIGludG8gYQpjb21tb24gaXNzdWU/IE1heWJlIHdlIHNob3VsZCBh
bHdheXMgYWRkIHRoZSBwbGFuZSBpbmZvcm1hdGlvbiB3aGVuCnRoZXJlIGlzIG1vcmUgdGhhbiBv
bmUgcGxhbmUgdG8gYWRkcmVzcz8gQ2FuIHlvdSBjaGVjayB3aGV0aGVyIHRoaXMgaXMKc3BlY2lm
aWMgdG8gTWFjcm9uaXggb3Igbm90PwoKSW4gdGhpcyBjYXNlIHdlIHdvdWxkbid0IG5lZWQgYSBz
cGVjaWZpYyBmaXh1cC4KCj4gCj4gVGhlc2UgZmxhc2hlcyBoYXZlIGJlZW4gdmFsaWRhdGVkIG9u
IFhpbGlueCB6eW5xLXBpY296ZWQKPiBib2FyZCB3aGljaCBpbmNsdWRlZCBNYWNyb25peCBTUEkg
SG9zdC4KPiAKPiBDaGVuZyBNaW5nIExpbiAoMik6Cj4gICBtdGQ6IHNwaW5hbmQ6IEFkZCBmaXh1
cHMgZm9yIHNwaW5hbmQKPiAgIG10ZDogc3BpbmFuZDogbWFjcm9uaXg6IEZpeHVwcyBmb3IgUGxh
bmUgU2VsZWN0IGJpdAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgICAgIHwgIDcg
KysrKwo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jIHwgNjYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tCj4gIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAgICAg
fCAxNyArKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
