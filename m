Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A2CC35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4PZlbZuLjkR/jYCbAerO8ACeIhtNuheA5CbEH+Gp8o=; b=F3bwJENe1+RKBD
	BLac0tdJC/CRDWflEH8CWvPI1OyZU2P7ZtD4dOH0Herv1EhSzoE/p43ulSw39Ok3POf3p0X+wXzdb
	JQVEwY0M7UtvVxabHHan7uVIkb5xWIdL7O5ZbTuDsnTYDB+oFe5ixlHXicp/7oBtfirejakH/Thn1
	t1RA5aL/gQn6f11u241agipP+fclRi1AoPVuXqx9Gl8vPuX9VN5mWc6uBTRIcFJkDSJL63u3P4ylF
	c1ziZqSG9WBIXZ2DONE+QG/gQzkclgJY+n0xuT+7SNhshcn6Ts3OO33/hHR3QcSJX65Kes/JVSHje
	o2uKQ1ThFv9KVm16Dxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF7gm-009Iqg-1I;
	Mon, 18 Dec 2023 07:05:20 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF7gi-009IoN-2Y
	for linux-mtd@lists.infradead.org;
	Mon, 18 Dec 2023 07:05:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 289BF1BF205;
	Mon, 18 Dec 2023 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702883110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pCADSogZK79IR7x+P2Nc6fAgr4N1layvnkqfeF/Lhk=;
	b=an2/oE4i6QfChTNyT07C4TXk44v2PDcwGykdhvSYxJ+RSkA+q2egcUGKEpaQIrVm0cgWht
	XJ5b5giexmZkngiS4cspqdfVZG0shzQfpBGW/6cn77TD+cq5dAONrACmB1V9m55UAw7gRr
	txPOMfr4ThzaJvh336DNy1Yc6QxSMMTqXvK2tkSEug4sAS+eZARoK94HQxMsgbAcsfw1SI
	kcsOkbS0WJHvzXPZatffQK17XAGMXYjg2JOQjSLBALANWl8AcHqftWc+s4wMBhgl4T/Nho
	A8g2BlnfZQ3v2o6TcXkc22Z98fAu6XIRGaZB1rQXud+kF4B+JTuoxYK2xTzEgg==
Date: Mon, 18 Dec 2023 08:05:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] dt-bindings: mtd: ubi-volume: allow UBI volumes
 to provide NVMEM
Message-ID: <20231218080508.1803ac17@xps-13>
In-Reply-To: <778eaad045dbf9e10448dc5db7c0ef468191488e.1702850093.git.daniel@makrotopia.org>
References: <cover.1702850093.git.daniel@makrotopia.org>
	<778eaad045dbf9e10448dc5db7c0ef468191488e.1702850093.git.daniel@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_230516_979977_7291FF95 
X-CRM114-Status: UNSURE (   9.61  )
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

SGkgRGFuaWVsLAoKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvdWJpLXZvbHVtZS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3ViaS12b2x1bWUueWFtbAo+IEBAIC0xNSwyMSAr
MTUsMjYgQEAgbWFpbnRhaW5lcnM6Cj4gIAo+ICBwcm9wZXJ0aWVzOgo+ICAgIHZvbGlkOgo+IC0g
ICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiIKPiArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ICAgICAgZGVz
Y3JpcHRpb246Cj4gICAgICAgIE1hdGNoIFVCSSB2b2x1bWUgSUQKPiAgCj4gICAgdm9sbmFtZToK
PiAtICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmciCj4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcKPiAgICAg
IGRlc2NyaXB0aW9uOgo+ICAgICAgICBNYXRjaCBVQkkgdm9sdW1lIElECj4gIAo+ICsgIG52bWVt
LWxheW91dDoKPiArICAgICRyZWY6IC9zY2hlbWFzL252bWVtL2xheW91dHMvbnZtZW0tbGF5b3V0
LnlhbWwjCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhpcyBjb250YWluZXIgbWF5IHJl
ZmVyZW5jZSBhbiBOVk1FTSBsYXlvdXQgcGFyc2VyLgo+ICsKPiAgYW55T2Y6Cj4gICAgLSByZXF1
aXJlZDoKPiAtICAgIC0gdm9saWQKPiArICAgICAgLSB2b2xpZAo+ICAKPiAgICAtIHJlcXVpcmVk
Ogo+IC0gICAgLSB2b2xuYW1lCj4gKyAgICAgIC0gdm9sbmFtZQoKVGhpcyBzaG91bGQgYmUgc3F1
YXNoZWQgaW4gcGF0Y2ggMS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
