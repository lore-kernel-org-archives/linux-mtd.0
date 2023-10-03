Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F304CE8FDB0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Oct 2023 19:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1rYt2M6hSVI5n53n6Uja+kC9m+jbtrGKUpycBPMtXqM=; b=Fgw2Ilgpl76Cun4lchhrh59CPz
	7idN5aRNxdNz8svUOKKbI1M8E3cLtW7cv362UvOhDI/QrhmaYNcnx2Qh6CDG0h0VUBHJAoKInD4Ge
	lAuX3CAj9g/VvSFj/SY7M5KVyk+BR/gUYNMOb97+BZ47OgJRyYw5AKzdLwDgKafpL+vb9XufywPT9
	uWk5vIC0tPMnd4/6YYcIO7Kj9rFVJior48Dx7P1O9Nt41C7ddT4Z9S+VFAU8hiXFf5w3m1IcAjXbd
	kqMHadwNYyePZvw4QJb0ILPWAsaWxxGZhb+BMQYfkF44HEzE5D+Y1vpL42uEhuY0Lg4yMqoROhEDZ
	MwD0L+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnlKs-00FCd7-32;
	Tue, 03 Oct 2023 19:45:38 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnlKp-00FCbq-0g
	for linux-mtd@lists.infradead.org;
	Tue, 03 Oct 2023 19:45:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4C38C6340DF3;
	Tue,  3 Oct 2023 21:45:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 3ulYD1wGVKZI; Tue,  3 Oct 2023 21:45:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EA3E26340E0F;
	Tue,  3 Oct 2023 21:45:27 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mJfZ--EnOnn8; Tue,  3 Oct 2023 21:45:27 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C40526340DF3;
	Tue,  3 Oct 2023 21:45:27 +0200 (CEST)
Date: Tue, 3 Oct 2023 21:45:27 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <226381209.31782.1696362327615.JavaMail.zimbra@nod.at>
In-Reply-To: <df8cfc16a0047c1041a8f8d0069c6312bb83da0d.1691717480.git.daniel@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org> <df8cfc16a0047c1041a8f8d0069c6312bb83da0d.1691717480.git.daniel@makrotopia.org>
Subject: Re: [PATCH v4 5/8] mtd: ubi: attach MTD partition from device-tree
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: attach MTD partition from device-tree
Thread-Index: kqr0xqm+jR+lBv0FwDpbk9UYfLM3MQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_124535_447033_8A79B746 
X-CRM114-Status: UNSURE (   8.65  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5kZXggZTA2MThiYmRl
MzYxMy4uOTliNWY1MDJjOWRiYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2su
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gQEAgLTQ3MCw3ICs0NzAsNyBAQCBp
bnQgdWJpYmxvY2tfcmVtb3ZlKHN0cnVjdCB1Ymlfdm9sdW1lX2luZm8gKnZpLCBib29sIGZvcmNl
KQo+IAl9Cj4gCj4gCS8qIEZvdW5kIGEgZGV2aWNlLCBsZXQncyBsb2NrIGl0IHNvIHdlIGNhbiBj
aGVjayBpZiBpdCdzIGJ1c3kgKi8KPiAtCW11dGV4X2xvY2soJmRldi0+ZGV2X211dGV4KTsKPiAr
CW11dGV4X2xvY2tfbmVzdGVkKCZkZXYtPmRldl9tdXRleCwgU0lOR0xFX0RFUFRIX05FU1RJTkcp
OwoKVGhlIHVzYWdlIG9mIG11dGV4X2xvY2tfbmVzdGVkKCkgaW4gdGhpcyBwYXRjaCBsb29rcyBm
aXNoeS4KQ2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRlIGEgYml0IG1vcmUgd2h5IGFsbCB0aGVzZSBt
dXRleGVzIGNhbiBiZSB0YWtlbiB0d2ljZT8KKEFueSB3aHkgbm90IG1vcmUgb2Z0ZW4pLgoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
