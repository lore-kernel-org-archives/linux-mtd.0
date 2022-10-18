Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7901C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSb3678T8P/F9Nv+iULDjDO8kdQkRYlkRdC64A/MuU0=; b=nO3eZYc237Z8EC
	BrOT5oGNsqLsH1nUtbokIBql5HC1nSD//qIvRid6hm201Izz5bWJv85wEcgVcMbPY2iqakPFO2J9X
	MfPtEuQwOludyAsLao6W98UNbX891VFMfBOZ5GKbaS/sVOk8Bm0KGX5E1OwRbFVFRJUj2fwYUor91
	n5rj4nMy/fM681HYiQJgQQQhj1s/wKIkBNo9jSyfQ7JoQ817pxp1wOCABZzzE/R9EwE8aEIDS8NW0
	P5AA+/Z97y7V2YYGKPcAO6hJO7vzUXX5Q5e9o/m71t7FP5OZBWwfsbL8Jf3kFeBf6HfyfU3DHQZyj
	G6EvB0yIJv04QSqmcltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjKk-005Ol9-SH; Tue, 18 Oct 2022 09:56:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjKJ-005O6Z-CI; Tue, 18 Oct 2022 09:56:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 749F9240010;
	Tue, 18 Oct 2022 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666086956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMcXIkL+nvRSGz9bJcoeIxWVctnTAOc43A22A4uBfDc=;
	b=hGtr3RmGXUOTWNJnsTlSAnrlwI1g2/ziwgCBu48BF9TX1LSiY3B8/Kc85ZR+kmZkx6OEZo
	0RIvhz3wy09RC4ufLYCnc3MkQnqhh4f5Iq/QK6DB01+EEDnkaR7qI9rIifXnDBbW0umMav
	xU/9o2sCrd21/7wOKuTLEXJNZjJShSwGC16gihHfg1XUxKgP/rXVMO89Ggzji9LAewdymB
	ExgO1TlKUaOnztGhNMErVMv/nWW3TSJ395ftwNa/NTh9yUjahmUvFfHz5mq4KFmMJYw6Ul
	kd7mqSel48md0rACsrUVqzXafLO0a0FUkHUJiIcu5+0fT6jy11dnWGJ66e/4tQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	bcm-kernel-feedback-list@broadcom.com,
	John Crispin <john@phrozen.org>,
	=?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 2/2] mtd: parsers: add TP-Link SafeLoader partitions table parser
Date: Tue, 18 Oct 2022 11:55:48 +0200
Message-Id: <20221018095548.542866-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015092950.27467-2-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'aec4d5f5ffd0f0092bd9dc21ea90e0bc237d4b74'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025559_613774_169F563F 
X-CRM114-Status: UNSURE (   7.94  )
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

T24gU2F0LCAyMDIyLTEwLTE1IGF0IDA5OjI5OjUwIFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRoaXMgcGFyc2VyIGRlYWxzIHdpdGggbW9zdCBUUC1MaW5rIGhvbWUgcm91dGVy
cy4gSXQgcmVhZHMgaW5mbyBhYm91dAo+IHBhcnRpdGlvbnMgYW5kIHJlZ2lzdGVycyB0aGVtIGlu
IHRoZSBNVEQgc3Vic3lzdGVtLgo+IAo+IEV4YW1wbGUgZnJvbSBUUC1MaW5rIEFyY2hlciBDNSBW
MjoKPiAKPiBzcGktbm9yIHNwaTAuMDogczI1ZmwxMjhzMSAoMTYzODQgS2J5dGVzKQo+IDE1IHRw
bGluay1zYWZlbG9hZGVyIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBzcGkwLjAKPiBD
cmVhdGluZyAxNSBNVEQgcGFydGl0aW9ucyBvbiAic3BpMC4wIjoKPiAweDAwMDAwMDAwMDAwMC0w
eDAwMDAwMDA0MDAwMCA6ICJmcy11Ym9vdCIKPiAweDAwMDAwMDA0MDAwMC0weDAwMDAwMDQ0MDAw
MCA6ICJvcy1pbWFnZSIKPiAweDAwMDAwMDQ0MDAwMC0weDAwMDAwMGU0MDAwMCA6ICJyb290ZnMi
Cj4gMHgwMDAwMDBlNDAwMDAtMHgwMDAwMDBlNDAyMDAgOiAiZGVmYXVsdC1tYWMiCj4gMHgwMDAw
MDBlNDAyMDAtMHgwMDAwMDBlNDA0MDAgOiAicGluIgo+IDB4MDAwMDAwZTQwNDAwLTB4MDAwMDAw
ZTQwNjAwIDogInByb2R1Y3QtaW5mbyIKPiAweDAwMDAwMGU1MDAwMC0weDAwMDAwMGU2MDAwMCA6
ICJwYXJ0aXRpb24tdGFibGUiCj4gMHgwMDAwMDBlNjAwMDAtMHgwMDAwMDBlNjAyMDAgOiAic29m
dC12ZXJzaW9uIgo+IDB4MDAwMDAwZTYxMDAwLTB4MDAwMDAwZTcwMDAwIDogInN1cHBvcnQtbGlz
dCIKPiAweDAwMDAwMGU3MDAwMC0weDAwMDAwMGU4MDAwMCA6ICJwcm9maWxlIgo+IDB4MDAwMDAw
ZTgwMDAwLTB4MDAwMDAwZTkwMDAwIDogImRlZmF1bHQtY29uZmlnIgo+IDB4MDAwMDAwZTkwMDAw
LTB4MDAwMDAwZWUwMDAwIDogInVzZXItY29uZmlnIgo+IDB4MDAwMDAwZWUwMDAwLTB4MDAwMDAw
ZmUwMDAwIDogImxvZyIKPiAweDAwMDAwMGZlMDAwMC0weDAwMDAwMGZmMDAwMCA6ICJyYWRpb19i
ayIKPiAweDAwMDAwMGZmMDAwMC0weDAwMDAwMTAwMDAwMCA6ICJyYWRpbyIKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CgpBcHBsaWVkIHRvIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
