Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9835AC77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 07:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifL/sbpLerfWhNALaeY4hvZVL6crtUOhbr81AgjHTig=; b=IesV/ceaxHIyzH
	obw0E1D+55pRM2f2rgfoPI8K1ThO5MGzhet2o1NeN6+oSisN0/2ouQum6FIk5FKGyQdybRkGQpRif
	EmBWqd/H8pHt9U6miQocxYXoAqodwGRcKfSulNX+2pQfLbvUZ9XFyw2wGUs9YR5U2/Q8sQguBccSn
	IOILnmrxctEzrB/bP/sL/j85we2QcIWA+JPzeBQrVW6ULCUUy/lnpv2ipr3VH3MvowHHqdwu6tv2u
	HPpu7TFDKEi3Axqpqge+Nv53F0z1mXOEZ0iEbjkFwXE3gwFoKrYtdCUEWhjMzbT9aME0SpqKr1Qhr
	Vm7xWLSGw4mO+I/pvEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u1x-00Cmvr-2Z;
	Tue, 30 May 2023 07:44:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u1s-00CmsX-1Z;
	Tue, 30 May 2023 07:44:30 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685432664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fOSXuwa5qNQTlbZ+yAfd+pe1WH2YkOx4imfXGbwKHUw=;
	b=frOHFMcA+eC2S94i1B/AgAHDDLvh0pZ31vqzDUnYqTpplzeHpXksOpKOe33b2LK98ysFtW
	4rtvqN8N4Yljh9c0WQAc3qtSJx5pnM/alRLxBCsF4Jofz2qNvObYif4SLBduzJYDIyQpaJ
	eASn6fo/0mdn54M65+7P3OQnguQk9YwYhEVGm5VpcvQwiJ6ueo216DWNHjUNcVG6RWPQcc
	wcxiojiePYg0gcwHTE/VfV2RSZtR8+aGyZ1kBjg2PjEm/KjI41hjsX4IBVeUbIKjYGsb90
	/583cp83GJ3GEnuUkPlBTr6OYNfjfFknJPO35kdwueku5jlEvMdMuWp/M4zhXQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF8D7E0012;
	Tue, 30 May 2023 07:44:21 +0000 (UTC)
Date: Tue, 30 May 2023 09:44:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] mtd: rawnand: meson: move OOB to non-protected
 ECC area
Message-ID: <20230530094420.06281ab5@xps-13>
In-Reply-To: <b9f0a38a-0d50-23f0-4509-c38362d05f12@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-3-AVKrasnov@sberdevices.ru>
	<20230522173334.7aa6f917@xps-13>
	<ebbc26e3-6a1c-eead-051c-8f93beba41f3@sberdevices.ru>
	<20230526190347.6e34a2be@xps-13>
	<b9f0a38a-0d50-23f0-4509-c38362d05f12@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_004428_950699_98A14383 
X-CRM114-Status: GOOD (  22.24  )
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

SGkgQXJzZW5peSwKCj4gPj4+PiAtc3RhdGljIHZvaWQgbWVzb25fbmZjX2dldF91c2VyX2J5dGUo
c3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKm9vYl9idWYpCj4gPj4+PiAtewo+ID4+Pj4gLQlz
dHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCAqbWVzb25fY2hpcCA9IHRvX21lc29uX25hbmQobmFu
ZCk7Cj4gPj4+PiAtCV9fbGU2NCAqaW5mbzsKPiA+Pj4+IC0JaW50IGksIGNvdW50Owo+ID4+Pj4g
KwlpbnQgaTsKPiA+Pj4+ICAKPiA+Pj4+IC0JZm9yIChpID0gMCwgY291bnQgPSAwOyBpIDwgbmFu
ZC0+ZWNjLnN0ZXBzOyBpKyssIGNvdW50ICs9IDIpIHsKPiA+Pj4+ICsJZm9yIChpID0gMDsgaSA8
IG5hbmQtPmVjYy5zdGVwczsgaSsrKSB7Cj4gPj4+PiAgCQlpbmZvID0gJm1lc29uX2NoaXAtPmlu
Zm9fYnVmW2ldOwo+ID4+Pj4gLQkJb29iX2J1Zltjb3VudF0gPSAqaW5mbzsKPiA+Pj4+IC0JCW9v
Yl9idWZbY291bnQgKyAxXSA9ICppbmZvID4+IDg7Cj4gPj4+PiArCQkvKiBBbHdheXMgaWdub3Jl
IHVzZXIgYnl0ZXMgcHJvZ3JhbW1pbmcuICovICAgIAo+ID4+Pgo+ID4+PiBXaHk/ICAgIAo+ID4+
Cj4gPj4gSSB0aGluayBjb21tZW50IG1lc3NhZ2UgaXMgd3JvbmcgYSBsaXR0bGUgYml0LiBIZXJl
ICJ1c2VyIGJ5dGVzIiBhcmUKPiA+PiB1c2VyIGJ5dGVzIHByb3RlY3RlZCBieSBFQ0MgKGUuZy4g
bG9jYXRpb24gb2YgdGhlc2UgYnl0ZXMgZGlmZmVycyBmcm9tIG5ldwo+ID4+IE9PQiBsYXlvdXQg
aW50cm9kdWNlZCBieSB0aGlzIHBhdGNoKS4gRHVyaW5nIHBhZ2Ugd3JpdGUgdGhpcyBoYXJkd2Fy
ZQo+ID4+IGFsd2F5cyB3cml0ZXMgdGhlc2UgYnl0ZXMgYWxvbmcgd2l0aCBkYXRhLiBCdXQsIG5l
dyBPT0IgbGF5b3V0IGFsd2F5cyBpZ25vcmVzCj4gPj4gdGhlc2UgNCBieXRlcywgc28gc2V0IHRo
ZW0gdG8gMHhGRiBhbHdheXMuICAKPiA+IAo+ID4gV2hlbiBwZXJmb3JtaW5nIHBhZ2UgcmVhZHMv
d3JpdGVzLCB5b3UgbmVlZCB0byB0YWtlIHRoZSBkYXRhIGFzIGl0J3MKPiA+IGJlZW4gcHJvdmlk
ZWQuIFlvdSBtYXkgbW92ZSB0aGUgZGF0YSBhcm91bmQgaW4gdGhlIGJ1ZmZlciBwcm92aWRlZCB0
bwo+ID4gdGhlIGNvbnRyb2xsZXIsIHNvIHRoYXQgaXQgZ2V0IHRoZSBFQ0MgZGF0YSBhdCB0aGUg
cmlnaHQgbG9jYXRpb24sIGFuZAo+ID4geW91IG5lZWQgb2YgY291cnNlIHRvIHJlb3JnYW5pemUg
dGhlIGRhdGEgd2hlbiByZWFkaW5nIGFzIHdlbGwsIHNvIHRoYXQKPiA+IHRoZSB1c2VyIHNlZXMg
WGtpQiBvZiBkYXRhICsgWUIgb2YgT09CLiBUaGF0J3MgYWxsIHlvdSBuZWVkIHRvIGRvIGluCj4g
PiB0aGVzZSBoZWxwZXJzLgo+ID4gICAKPiAKPiBJIHRoaW5rIHRoZXJlIGlzIHNvbWUgbWlzdW5k
ZXJzdGFuZGluZyBhYm91dCB0aGVzZSAidXNlciBieXRlcyIgYWJvdmU6IHRoZXJlIGFyZSA0Cj4g
Ynl0ZXMgd2hpY2ggdGhpcyBOQU5EIGNvbnRyb2xsZXIgYWx3YXlzIHdyaXRlcyB0byBwYWdlIGlu
IEVDQyBtb2RlIC0gaXQgd2FzIGZyZWUgT09CCj4gYnl0ZXMgY292ZXJlZCBieSBFQ0MuIENvbnRy
b2xsZXIgZ3JhYnMgdmFsdWVzIGZyb20gRE1BIGJ1ZmZlciAoc2Vjb25kIERNQSBidWZmZXIgd2hp
Y2gKPiBkb2Vzbid0IGNvbnRhaW5zIHBhZ2UgZGF0YSkgYW5kIHdyaXRlcyBpdCBhbG9uZyB3aXRo
IGRhdGEgYW5kIEVDQyBjb2Rlcy4gSWRlYSBvZiB0aGlzCj4gY2hhbmdlIGlzIHRvIGFsd2F5cyBz
dXBwcmVzcyB0aGlzIHdyaXRlIGJ5IHNldHRpbmcgdGhlbSB0byAweEZGIChtYXkgYmUgdGhlcmUg
aXMgc29tZQo+IGNvbW1hbmQgb3B0aW9uIHRvIG5vdCB3cml0ZSBpdCwgYnV0IEkgZG9uJ3QgaGF2
ZSBkb2MpLCBiZWNhdXNlIGFsbCBvZiB0aGVtICg0IGJ5dGVzKQo+IGJlY29tZSB1bmF2YWlsYWJs
ZSB0byByZWFkZXIvd3JpdGVyLgoKQXQgdGhlIE5BTkQgY29udHJvbGxlciBsZXZlbCwgSSB3b3Vs
ZCByYXRoZXIgYXZvaWQgZG9pbmcgdGhpbmdzIGxpa2UKdGhhdC4KCkkgYmVsaWV2ZSB5b3UgY2Fu
IGp1c3QgdXBkYXRlIHRoZSBvb2JsYXlvdXQgc28gdGhhdCBwcm90ZWN0ZWQgT09CIGJ5dGVzCmFy
ZSBub3QgZXhwb3NlZCB0byB0aGUgdXNlciBhcyBmcmVlIGJ5dGVzLiBUaGVuIHlvdXIgYnVmZmVy
cyBzaG91bGQKYWxyZWFkeSBjb250YWluIDB4ZmZmZmZmIGF0IHRoZSBwcm9ibGVtYXRpYyBsb2Nh
dGlvbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
