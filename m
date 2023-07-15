Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D129C001B0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LWqYR7S1fEaarea6eXx4AAOJlHKxzTywTtUxZ736cA=; b=bBBJ8oz9sjR966
	KFsgnC+PvGt5kLLNzu9Kkjp0BTUViQyAJZMW8WWfuKi7ltZ1kfLz6Uy/VZSpB5aki0Rv7goOKGT/h
	+EOLZkJon+qBI+SXO9plSOVSQmjoSVabCwVUQiWMk9A7HwfQd2lBS9FCjQcgIA0o5VJCyJsOiezO8
	SH7ptKoyJ6pur+0cm9YXPwBlOI/K82e6wIo/v7hkcK5NSptY15UIMUZW0iJX4T8uJU9anwMGYhHhH
	KwYspsj5TE0KyiPNjb/1kKdTxrzpjBWC9AmnYY/ExND7vwZd1E19C1MUz03JNNVGOFfSzNXvJOeoJ
	oZk7ZTnxRAj3ko2ebuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhwJ-0096P1-1y;
	Sat, 15 Jul 2023 16:16:11 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhwE-0096N1-1O;
	Sat, 15 Jul 2023 16:16:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD7BAC000A;
	Sat, 15 Jul 2023 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689437762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLvZjvyKtYjdqlbWdTcVIvaH5ulaFg7tfDn1cNGzLjk=;
	b=duVRSGeKTPFmrl+NBpnM0ULc8COFL8Tq5toYfJ/mkhRQb9/blw/BI+uTD6n0/Aaqif4tOd
	dVf2jhP+Gv5PbFyfFHhXUwcKlIyc5LUN2mqTcLOH3HYup9YQD8h2v3Eo3eceyV7UupedDO
	8mnwyxoGv0KTGKx47VnrrEvKfNHUsVDO/zwUlbJzU+mG4sXPLjAwK7V9/6Q3neo8RuIEQA
	Pd0Jn6rKYAq9hYWODN/bn1oMcmzJt8eZNeQvSwcF72iAHTffAZ58tQr+DtGbDTUjObtJnY
	Vs4PC5+fHKlPZzXiHxp5e6rjPJiDQSg0pY1qPh5FuzTuHTx/ExQBIYAsB1YCLQ==
Date: Sat, 15 Jul 2023 18:15:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 0/3] support 512B ECC step size for Meson NAND
Message-ID: <20230715181553.1d2b5637@xps-13>
In-Reply-To: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_091606_624372_70C4AF2B 
X-CRM114-Status: GOOD (  11.08  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDExIEp1
bCAyMDIzIDE1OjIxOjI2ICswMzAwOgoKPiBIZWxsbywKPiAKPiB0aGlzIHBhdGNoc2V0IGFkZHMg
c3VwcG9ydCBmb3IgNTEyQiBFQ0Mgc3RlcCBzaXplIGZvciBNZXNvbiBOQU5ELiBDdXJyZW50Cj4g
aW1wbGVtZW50YXRpb24gb25seSBzdXBwb3J0cyAxMDI0Qi4gVGhlcmUgYXJlIHRocmVlIHBhdGNo
ZXM6Cj4gCj4gMSkgVXBkYXRlIGZvciBkZXZpY2UgdHJlZSBiaW5kaW5ncyB0byByZXBsYWNlICdj
b25zdCcgdHlwZSBvZiBmaWVsZAo+ICAgICduYW5kLWVjYy1zdGVwLXNpemUnIHdpdGggJ2VudW0n
IHdoaWNoIGNvbnRhaW5zIDUxMiBhbmQgMTAyNC4KPiAKPiAyKSBVcGRhdGUgZm9yIGRldmljZSB0
cmVlIGJpbmRpbmdzIHRvIGFkZCBkZXBlbmRlbmN5IGJldHdlZW4gcHJvcGVydGllcwo+ICAgICdu
YW5kLWVjYy1zdHJlbmd0aCcgYW5kICduYW5kLWVjYy1zdGVwLXNpemUnLgo+IAo+IDMpIFVwZGF0
ZSBmb3IgTWVzb24gZHJpdmVyIC0gbmV3IGVudW0gdmFsdWUgZm9yIDUxMkIgRUNDIGFuZCByZXdv
cmtlZAo+ICAgIEVDQyBjYXBhYmlsaXRpZXMgc3RydWN0dXJlIHRvIHN1cHBvcnQgYm90aCA1MTJC
IGFuZCAxMDI0QiBFQ0MuIEJ5Cj4gICAgZGVmYXVsdCB0aGlzIGRyaXZlciB1c2VzIDEwMjRCIEVD
QywgNTEyQiBjb3VsZCBiZSBlbmFibGVkIGluIGRldmljZQo+ICAgIHRyZWUuCgpUaGlzIHNlcmll
cyBkb2VzIG5vdCBhcHBseSBjb3JyZWN0bHkgb24gbmFuZC9uZXh0LCB3b3VsZCB5b3UgbWluZApy
ZWJhc2luZyAobmFuZC9uZXh0IG9uIGxpbnV4LW10ZCkgYW5kIHNlbmRpbmcgaXQgYWdhaW4/CgpC
VFcgdGhlICJyZmMiIHByZWZpeCBpcyBvbmx5IG5lZWRlZCBmb3IgdGhlICJmaXJzdCIgc3VibWlz
c2lvbiwgd2hlbgp5b3UgdHJ5IHNvbWV0aGluZyAibmV3Iiwgb3RoZXJ3aXNlIGl0IGlzIG5vIGxv
bmdlciByZXF1aXJlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
