Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CFEC43327
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ov/uZ9EMJnk1mQfh+9MIAKaENVTV3BNYYL0gOXGew9I=; b=kVoP4Cj+G8pI4D
	DPCBmY+yT1HD+vTbUY3oSrjTTJXpgmQjDjga6WFWk3GU4FSeynLe4JLdhRfvNwjTf+wMiNjCAiprJ
	khCzoSuIFO9lNJaV0IbB/DTOG5wNSUDNBRAx9VwfqlDVM+tgGlvrz48dijem273wKFmAewaJ7VRN8
	Bmo//wRkRKPRk43HNk0p6x/0X26Z3JiaSdhBwaE7aMkMSnNJCUubibedixbNdwuhst0NdDURrcUgl
	xt6gwo2Z0z/7d8DANo61RUbPXASOtqYQ0BLsEc7GTfcAU6Xpls96emvxW+7UWvnO1TDq4skaCaTa5
	T7xM3WCS89ygGQHcjvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDf-0000000Ev03-1Wwv;
	Mon, 29 Jun 2026 14:44:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDc-0000000EuxW-1Oya
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:44:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DAE681A05FA;
	Mon, 29 Jun 2026 14:44:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A78435FF96;
	Mon, 29 Jun 2026 14:44:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA8C1106F17BD;
	Mon, 29 Jun 2026 16:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R81EncgDsQZYvZWC/rq9Lp4af9ej1YZMEyfe4sNo9+I=;
	b=bvpt3saTbgtjpETFD40LXSK9ELYQfhzh/KTYyJDtOZ4+XklHTDoHN3cLoaxiPVVjSzMMxP
	1f+O3mbmEspENBCYYzZq5okknU1tQdqNbLnMJQDwdG8AskEmBj0yAmwMrb+IOHM5unfuT5
	UyqhEn5DcHAmBpbknIe0+yVynzcOP7l2Kc1jxOr4RJ5XR16abN6tsCSg23NGJxP5atCAbL
	FBUcozmKMaPCdVtfeMQ5Iiw5jxxPjoDyXkvs2/DmV1tXtLdmhuHgSDYeHjtGGMN3FDo5Bi
	SONRNM+oo/+L08TDUgVeDfhJFl4tc/ooNukggTd+evuS498dFihgAWv/p0+TEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rosen Penev <rosenp@gmail.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Chris Down <chris@chrisdown.name>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260618205835.1497952-1-arnd@kernel.org>
References: <20260618205835.1497952-1-arnd@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: ndfc: add CONFIG_OF dependency
Message-Id: <178274425052.260178.10460685423994198344.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:44:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074416_543333_B9DBAA54 
X-CRM114-Status: UNSURE (   6.17  )
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

T24gVGh1LCAxOCBKdW4gMjAyNiAyMjo1ODoyNyArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToK
PiBXaGVuIGNvbXBpbGUtdGVzdGluZyBvbiB4ODYgd2l0aG91dCBDT05GSUdfT0YsIHRoZSBuZGZj
IGRyaXZlciBwcm9kdWNlcwo+IGEgaGFybWxlc3Mgd2FybmluZzoKPiAKPiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uZGZjLmM6IEluIGZ1bmN0aW9uICduZGZjX3Byb2JlJzoKPiBpbmNsdWRlL2xpbnV4
L2Rldl9wcmludGsuaDoxNTQ6MzE6IGVycm9yOiAnbGVuJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQg
Wy1XZXJyb3I9dW5pbml0aWFsaXplZF0KPiAgIDE1NCB8ICAgICAgICAgZGV2X3ByaW50a19pbmRl
eF93cmFwKF9kZXZfZXJyLCBLRVJOX0VSUiwgZGV2LCBkZXZfZm10KGZtdCksICMjX19WQV9BUkdT
X18pCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmRmYy5jOjE5NjoxNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdk
ZXZfZXJyJwo+ICAgMTk2IHwgICAgICAgICAgICAgICAgIGRldl9lcnIoJm9mZGV2LT5kZXYsICJ1
bmFibGUgcmVhZCByZWcgcHJvcGVydHkgKCVkKVxuIiwgbGVuKTsKPiAKPiBbLi4uXQoKQXBwbGll
ZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogbmRmYzogYWRkIENP
TkZJR19PRiBkZXBlbmRlbmN5CiAgICAgIGNvbW1pdDogOTdmOWU1MDlkODM5ZjdlNWI5YTMyMTA1
YWUzMjJlNTIyM2M4Njc4NgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
