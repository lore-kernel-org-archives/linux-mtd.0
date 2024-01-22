Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3EBC47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn9APSpzPS4ij0hPHORwzG0p27+ZfeYurIA6OEoh0ww=; b=11vQNhJfQVcfR3Z8Mrvh2KKREB
	EW5bA9gkIgs2DfuSmKt+0jp4DJh6HGDu4YX18hsWmJweg9cS2ud8c6EvNAi1tmDeGEohBsSJbM2Pf
	V5+WYOOD6c38+E6x3oZ3/+TFmGF4lTs3TxFUSlfEFsNG3DjRx2dJAM2l3koUPoOqQPkM/HQYPnT8R
	SpfJJDcKQQjpi+3XF8ppcBF6vN7FX9Z7ZoA/HzHGuISNDWVJHDc+Ei4rDiks3UybElcZ908i2eq1Y
	nsBjU+grVtcRWLnBVD5lJfui5Bzq0pNLS0KfZ60nzssdAaaW99bcs+rXWZVGFZtyZ8ZLFNW2t0wz5
	LDD/PVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzUh-00DdDV-2r;
	Mon, 22 Jan 2024 18:58:03 +0000
Received: from 5.mo575.mail-out.ovh.net ([46.105.62.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzUd-00DdBZ-3B
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 18:58:02 +0000
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.9.204])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 1A5F62CB65
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jan 2024 18:57:51 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rjzw4 (unknown [10.110.168.247])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6D3251FD40;
	Mon, 22 Jan 2024 18:57:49 +0000 (UTC)
Received: from RCM-web7.webmail.mail.ovh.net ([151.80.29.19])
	by ghost-submission-6684bf9d7b-rjzw4 with ESMTPSA
	id kSWvGK26rmV8AAAA/jY1oA
	(envelope-from <rafal@milecki.pl>); Mon, 22 Jan 2024 18:57:49 +0000
MIME-Version: 1.0
Date: Mon, 22 Jan 2024 19:57:49 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: dregan@broadcom.com, miquel.raynal@bootlin.com
Cc: dregan@mail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 kursad.oney@broadcom.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v2 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
In-Reply-To: <20240118195356.133391-2-dregan@broadcom.com>
References: <20240118195356.133391-1-dregan@broadcom.com>
 <20240118195356.133391-2-dregan@broadcom.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <12d06516e5f1310b508c5d8136131787@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 13451970613610064715
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpefghfeuiefhiedttedtheefhfeifeffveekvdegteetkeetjedtiedvvdfhgfffffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdduhedurdektddrvdelrdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_105800_188283_B20D81CA 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyNC0wMS0xOCAyMDo1MywgZHJlZ2FuQGJyb2FkY29tLmNvbSB3cm90ZToKPiBAQCAtMTEx
LDYgKzExMywxNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICBlYXJsaWVyIHZlcnNpb25zIG9mIHRo
aXMgY29yZSB0aGF0IGluY2x1ZGUgV1AKPiAgICAgIHR5cGU6IGJvb2xlYW4KPiAKPiArICBicmNt
LG5hbmQtdXNlLXdwOgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFVzZSB0aGlzIHByb3Bl
cnR5IHRvIGluZGljYXRlIGlmIGJvYXJkIGRlc2lnbiB1c2VzCj4gKyAgICAgIGNvbnRyb2xsZXIn
cyB3cml0ZSBwcm90ZWN0aW9uIGZlYXR1cmUgYW5kIGNvbm5lY3RzIGl0cwo+ICsgICAgICBOQU5E
X1dQYiBwaW4gdG8gbmFuZCBjaGlwJ3MgV1BfTCBwaW4uIERyaXZlciBkZWZhdWx0cyB0bwo+ICsg
ICAgICB1c2UgdGhpcyBmZWF0dXJlIHdoZW4gdGhpcyBwcm9wZXJ0eSBkb2VzIG5vdCBleGlzdC4K
PiArICAgICAgU2V0IHRvIDAgaWYgV1AgcGlucyBhcmUgbm90IGNvbm5lY3RlZCBhbmQgZmVhdHVy
ZSBpcyBub3QKPiArICAgICAgdXNlZC4gU2V0IHRvIDEgaWYgV1AgcGlucyBhcmUgY29ubmVjdGVk
IGFuZCBmZWF0dXJlIGlzIHVzZWQuCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MzIKPiArICAgIGVudW06IFswLCAxXQo+ICsKPiAgcGF0dGVyblByb3Bl
cnRpZXM6Cj4gICAgIl5uYW5kQFthLWYwLTldJCI6Cj4gICAgICB0eXBlOiBvYmplY3QKClBsZWFz
ZSB0YWtlIGEgbG9vayBhdDoKW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IG10ZDogYnJjbW5hbmQ6
IGFkZCAibm8td3AiIHByb3BlcnR5Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8y
MDIxMTEwOTExNTIxNS41YmNlZjBkYkB4cHMxMy9ULwoKTWlxdWVsIHN1Z2dlc3RlZCBhIGdlbmVy
aWMgcHJvcGVydHkgYXBwbGljYWJsZSB0byBhbGwgcmF3IE5BTkRzIGZvcgpzdWNoIHB1cnBvc2Uu
IFVuZm9ydHVuYXRlbHkgSSBkcm9wcGVkIHRoZSBiYWxsIG9uIHRoYXQuCgotLSAKUmFmYcWCIE1p
xYJlY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
