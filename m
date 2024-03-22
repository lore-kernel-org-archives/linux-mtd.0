Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0D7C47DD9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pVxdOI+cI8MLPcl0d+YUPQc437XUNt3rfQ/817OhDRY=; b=j9J5y2I9T54/Js34/rH6RxIjp5
	l+/embPHE21kJ13jNN2+K6iDCHbU4dRrff27FioDnzY40xTQfGiYsaSBx/hkSiFKsu/bfLAkoBSrX
	2/oBRlbC7G6SUE7S8APvVV05LlwJY76miMEeqIXrAfmz6UW0JG8niiQw5vfG2xzS/9UcQ8sEle5P5
	CBGppHmMbxZvJFphUiVhsMgY5iVL0Q2qe5e4eoni6kxhkDmokdwHIjSAC0j3UUaPYceTJh9AxycS2
	O4Z+Jm6R0Ta+/ZvBKGeFiknDwVBTInQWkX6uk42ZhMVUCdbERiTD8iW4KPbMzDGfuvp1G/Yf5OfQ6
	cgWo0jCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhOZ-00000007s5s-2VvA;
	Fri, 22 Mar 2024 16:05:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhOV-00000007s2m-0Shp
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 16:05:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6223C6450948;
	Fri, 22 Mar 2024 17:05:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id apiN5osYyNZi; Fri, 22 Mar 2024 17:05:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F245161F0A9F;
	Fri, 22 Mar 2024 17:05:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EYt00MZaZPo2; Fri, 22 Mar 2024 17:05:18 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B6A4B61F0A9D;
	Fri, 22 Mar 2024 17:05:18 +0100 (CET)
Date: Fri, 22 Mar 2024 17:05:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	david oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <2125862147.90778.1711123518626.JavaMail.zimbra@nod.at>
In-Reply-To: <Zf2qQSRWYDzKd4--@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org> <20240219120156.383a1427@xps-13> <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at> <ZdvV1KABu_UCSL7B@makrotopia.org> <1754825522.38834.1710105437883.JavaMail.zimbra@nod.at> <Ze5uUyUuEDBM3p43@makrotopia.org> <1196553263.78350.1710887478387.JavaMail.zimbra@nod.at> <Zf2qQSRWYDzKd4--@makrotopia.org>
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: provide NVMEM layer over UBI volumes
Thread-Index: tOfo7y+yLt5SSiGVRI1o4gXoH7tsLw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_090523_334022_BFE9B9DE 
X-CRM114-Status: UNSURE (   7.12  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBTbzogaG9sZCBteSBiZWVyLCBJJ2xsIGJlIGJhY2sgc2hv
cnRseSA7KQo+IAo+IElmIGFueW9uZSBoYXMgYmV0dGVyIGlkZWFzIG9uIGhvdyB0byB1dGlsaXpl
IHN1cHBvcnQgZm9yIHJhdyBOQU5EIG9yIHRoZQo+IE9uZU5BTkQgY29udHJvbGxlciBpbiBRRU1V
IGluIGEgZGV2aWNlLXRyZWUgZW52aXJvbm1lbnQgd2hpY2ggYWN0dWFsbHkKPiB3b3JrcywgdGhh
dCdkIGJlIGdyZWF0LiBPYnZpb3VzbHkgSSBkb24ndCBjYXJlIGFib3V0IG90aGVyIHBlcmlwaGVy
YWxzCj4gbGlrZSBCbHVldG9vdGggYW5kIGFsbCB0aGUgY29tcGxpY2F0ZWQgc3R1ZmYgb2YgdGhl
IE44MHguLi4KClNwZWFraW5nIG9mICJob2xkIG15IGJlZXIiLCBtYXliZSB3ZSBjYW4gaGFjayBz
b21ldGhpbmcgaW50byBuYW5kc2ltCnRvIGFjdCBsaWtlIGEgZGV2aWNlIHRyZWUgYXR0YWNoYWJs
ZSBkZXZpY2U/CkluIHRoZW9yeSwgZGV2aWNlIHRyZWUgaXMgYWxzbyBhdmFpbGFibGUgb24geDg2
IGFuZCBvdGhlciBub24tZW1iZWRkZWQgYXJjaHMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
