Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0122E6FE53
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bakehsnZ6xkV4LjOV6miWlkqGSJnSGfeIh5ERLd5jSc=; b=dwcY9HIjskb5UK
	UraIfZAFLauGu8Mpv2UFU8pN1sVvol7+pTiTUd9ZwtGkgAn+Y9v0f9lGkbjcX8d2P7c4sUWKGLZO3
	IR9nPfRUIhUlOyAR1ZBquXjUYK2/6V1/uD1fHnwsMHmtnizNzpYoRbnSGN+64E0uKBaDWoCkZxyIa
	6zEOER37kWlhp4nNSdeqkpHdBRPpYyLnXAdUDONtAR861cpqrX0pTL0qck+8KQM3v5uvrxPTdbKEn
	j20ABgdXumXp0kgSFFyadQzX/zigd2JXe7UW4Zy/Lp9oqf7TnckVNrsrtRWlY5fkgCVVEjnJzD/Zl
	dMNCqws7+VZAd2TTQVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smrTi-0000000EjmU-2gK6;
	Sat, 07 Sep 2024 09:11:34 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smrTf-0000000Ejlu-3U9d
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 09:11:33 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E909B236;
	Sat,  7 Sep 2024 11:11:28 +0200 (CEST)
Mime-Version: 1.0
Date: Sat, 07 Sep 2024 11:11:28 +0200
Message-Id: <D3ZXP46U6RQK.331FLSMEHHKUU@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for gd25 and gd55 series
 chips.
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>, "Renjun Wang"
 <renjunw0@foxmail.com>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <tencent_983A0FB4662661C03E98E1AC214E32179F0A@qq.com>
 <47e0745c-e7a4-4201-b1bf-bb8e44e5911d@wanadoo.fr>
In-Reply-To: <47e0745c-e7a4-4201-b1bf-bb8e44e5911d@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_021132_060069_7C7AE1DA 
X-CRM114-Status: UNSURE (   5.21  )
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

SGksCgpPbiBTYXQgU2VwIDcsIDIwMjQgYXQgOTowNCBBTSBDRVNULCBDaHJpc3RvcGhlIEpBSUxM
RVQgd3JvdGU6Cj4gTGUgMDcvMDkvMjAyNCDDoCAwODozMiwgUmVuanVuIFdhbmcgYSDDqWNyaXTC
oDoKPiA+IEFkZCBzdXBwb3J0IGZvciBnZDI1bHEyNTUsIGdkMjVsYjI1NiwgZ2QyNWxiNTEybSwg
Z2QyNWI1MTJtLCBnZDU1YjAxZ2UKPiA+IGFuZCBnZDU1bGIwMWdlLiBBbGwgdGhlc2UgY2hpcHMg
YXJlIHRlc3RlZCBvbiBSb2NrY2hpcCBib2FyZHNbMV0uCj4gPiAKPiA+IFsxXWh0dHBzOi8vZ2l0
aHViLmNvbS9yb2NrY2hpcC1saW51eC9rZXJuZWwvYmxvYi9kZXZlbG9wLTUuMTAvZHJpdmVycy9t
dGQvc3BpLW5vci9naWdhZGV2aWNlLmMKClRoYXQncyBldmVuIG9sZGVyLiBTb3JyeSBidXQgbm8u
CgpIYXZlIHlvdSBjaGVja2VkIHRoYXQgdGhlc2UgZmxhc2hlcyBkb2Vzbid0IGhhdmUgU0ZEUCB0
YWJsZXM/CgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
