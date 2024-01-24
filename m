Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DEEC47E49
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZcVbjrMq8lRqgTpRC96ekTgAadGLfVuYkUFuhn79ug=; b=PSqut7kuqEkyn8
	eveEsSt4EsSG5nI/X4kbxFT5fQUJj4BFdHIBGSO+srdlJMMGIJKMP3l2X1F+wJTd249wgfQDCz5hS
	wHf+5b7yQ9y8Ox3eNFC/ZwTtdhMMtVRHpjcVH92MyBw49KGaavpGsyOGzQE/N/xyDSPRNjBoSRQvT
	lXQGZyU9eFYrvwxmVYIiBt/DP0YK3U99U4HhWRefD+TcCD7LWcU/bPRqgcVtM1Kb8+PMllXOTSGh0
	OFVnCfN8e41iLHpf7Rzce+pCQ8aDhkqBz6DlsAD/nGa+Vq5ZVOD95ckQfHEWt5ndDryfdEXa0gVN1
	eWPkVs5crFR10f+bvKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh8p-004Vjs-37;
	Wed, 24 Jan 2024 17:34:23 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh8l-004VgV-37;
	Wed, 24 Jan 2024 17:34:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B028FF80A;
	Wed, 24 Jan 2024 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706117656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cweCaAiE6FgNPCpoAXah+6pzlGbqY4pEQljXXTAVLA=;
	b=ILsM2fPKJAw2eaPsNWSOn1m+5vkZrmjYQxPfh9Kw/R75f1QcbBPpiicexXreoqf8mORtm/
	zEFAtXiP8oQrAMPdpx2nVzOpTRSiCflo9BVVhAKmoXp2MJZPYDWGwj2pZcDQ5oJ51xFy2W
	kqI7kMCHDtprGiIps9k8AvIpWzg4ZgfX5krPpSX/HdE7QZwQuZqYiIgTA2x64r+DWB98Xp
	nA9GXQxSAhurAzdqMZJLFv1kodXRljXJbMqr22Qb0fWGXX0NDcgOA4srqeXJAXxrIuvkVF
	t02ysdMs9kcgrzIMS5NJcTaS6vbBFU/CjQda95Ds6guVUUx9Z0LAg+liV0zTSQ==
Date: Wed, 24 Jan 2024 18:34:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 kursad.oney@broadcom.com, florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v3 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
Message-ID: <20240124183408.245b7bb4@xps-13>
In-Reply-To: <20240124030458.98408-2-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-2-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_093420_147282_C3C3DCFA 
X-CRM114-Status: GOOD (  11.97  )
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

SGkgRGF2aWQsCgpkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMjMgSmFuIDIwMjQg
MTk6MDQ6NDkgLTA4MDA6Cgo+IEZyb206IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJv
YWRjb20uY29tPgo+IAo+IFVwZGF0ZSB0aGUgZGVzY3JpcHRpb25zIHRvIHJlZmxlY3QgZGlmZmVy
ZW50IGZhbWlsaWVzIG9mIGJyb2FkYmFuZCBTb0MgYW5kCj4gdXNlIHRoZSBnZW5lcmFsIG5hbWUg
YmNtYmNhIGZvciBBUk0gYmFzZWQgU29DLgo+IAo+IEFkZCBicmNtLG5hbmQtdXNlLXdwIHByb3Bl
cnR5IHRvIGhhdmUgYW4gb3B0aW9uIGZvciBkaXNhYmxpbmcgdGhpcwo+IGZlYXR1cmUgb24gYnJv
YWRiYW5kIGJvYXJkIGRlc2lnbiB0aGF0IGRvZXMgbm90IHVzZSB3cml0ZSBwcm90ZWN0aW9uLgo+
IAo+IEFkZCBicmNtLG5hbmQtZWNjLXVzZS1zdHJhcCB0byBnZXQgZWNjIHNldHRpbmcgZnJvbSBi
b2FyZCBib290IHN0cmFwIGZvcgo+IGJyb2FkYmFuZCBib2FyZCBkZXNpZ25zIGJlY2F1c2UgdGhl
eSBkbyBub3Qgc3BlY2lmeSBlY2Mgc2V0dGluZyBpbiBkdHMKPiBidXQgcmF0aGVyIHVzaW5nIHRo
ZSBzdHJhcCBzZXR0aW5nLgo+IAo+IFJlbW92ZSB0aGUgcmVxdWlyZW1lbnQgb2YgaW50ZXJydXB0
cyBwcm9wZXJ0eSB0byByZWZsZWN0IHRoZSBkcml2ZXIKPiBjb2RlLiBBbHNvIGFkZCBteXNlbGYg
dG8gdGhlIGxpc3Qgb2YgbWFpbnRhaW5lcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBa
aGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhdmlkIFJl
Z2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPgoKUGxlYXNlIHNwbGl0IHRoaXMgaW50byB0aHJlZSBj
b21taXRzLiBkdC1iaW5kaW5ncyBhcmUgaGFyZCBlbm91Z2ggdG8KdGhpbmsgYWdhaW4sIG1peGlu
ZyBjaGFuZ2VzIGlzIGRlZmluaXRlbHkgbm90IGEgZ29vZCBpZGVhLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
