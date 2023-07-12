Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62824EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GpMCGESqdr1SDbzLfDlfmVjtClrzrR1anF2k95zyvU=; b=NuGOONUIs8J6ox
	WWoYqF3KkJN8lXX39DCaQ9hNYZOTW1h42N/XTGLpVbqc90tWSkON18VNPe8mwz7EhoqMCwwWxC0cU
	zM68vUYdmROvSrMLvDEdaorfyybQrcx2eqVvCi1YznH25prlpiMzlU6e9iDv04ABSa7xN4cJHHTFB
	5xS+wWhXCRPS5XZSYhMK42InccsaMtkdoa63cXCbgPyz9k8PZBfot2b4dxzBr7rOrUkcMR+wHRSWH
	saO60LpPKRhYhLLrgsGd/+y8sw1HVfsUl4RDQyjmPoklgGP744uSzlMd66IA1wbcuvur40gCq0bm2
	YDt4K0TE+363HZtzB+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYoB-00HVrs-2G;
	Wed, 12 Jul 2023 12:19:03 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYo7-00HVr9-2n
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 12:19:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5268BC0006;
	Wed, 12 Jul 2023 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689164335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gq0Z4mZPFZKT0qdEh5lY2e3LmdPHcYoPfLYbx7JiAec=;
	b=SkrR+zXS7/7NqGbNg1HqcSlJh/W2zdMQrzdyeGEUj1/NxQPKxGSuETmK3I0Hide5xFj499
	R2VLinIuNC3fSJyoDtyyNV/7c2tG1hhzKs2izKS6hUZQPI3P60Gd3n8eTHsOA79Iw6nxGW
	14Mnf/doDDKpBt1MCxvf2OWyIlMr/IbFv+EU4MG7XaKeSsQEJBmgg5ic+35AZoFLRXna5N
	C/sOZSfbtFeO1qZ55/49g/RX9EQMQkBYscLPV5s2F0rTt4nTZ/qBDISIxqU8FBEe8sVcLG
	6fBKYjqGkg9x5piyYU0qnqdIbpkSRsKnxeyAE81zHK56Ij36wW98ShXm7L64RA==
Date: Wed, 12 Jul 2023 14:18:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Yang Rong <yangrong@vivo.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
 luhongfei@vivo.com
Subject: Re: [PATCH v3] mtd: core: Fix resource leak in a
 for_each_child_of_node() loop
Message-ID: <20230712141850.0f30c70c@xps-13>
In-Reply-To: <ffc8f6162a863179f88304ed8801d44f@milecki.pl>
References: <20230711020752.2344-1-yangrong@vivo.com>
	<ffc8f6162a863179f88304ed8801d44f@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_051900_203898_7DA0216F 
X-CRM114-Status: GOOD (  17.65  )
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

SGkgUmFmYcWCLAoKcmFmYWxAbWlsZWNraS5wbCB3cm90ZSBvbiBUdWUsIDExIEp1bCAyMDIzIDE4
OjM3OjQyICswMjAwOgoKPiBPbiAyMDIzLTA3LTExIDA0OjAzLCBZYW5nIFJvbmcgd3JvdGU6Cj4g
PiBFbnN1cmUgY2hpbGQgbm9kZSByZWZlcmVuY2VzIGFyZSBwcm9wZXJseSBkZWNyZW1lbnRlZCBp
biB0aGUgZXJyb3IgcGF0aAo+ID4gICBvZiB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLiAg
Cj4gCj4gTml0cGlja2luZzogaXQncyBhY3R1YWxseSBhIC9zdWNjZXNzLyBjb2RlIHBhdGggdGhh
dCBtaXNzZXMKPiBvZl9ub2RlX3B1dCgpLgoKUGxlYXNlIGFsc28gYWRkOgoKQ2M6IHN0YWJsZS4u
LgoKPiAKPiAKPiA+IEZpeGVzOiAyZGYxMWYwMDEwMGQgKCJtdGQ6IGNvcmU6IHRyeSB0byBmaW5k
IE9GIG5vZGUgZm9yIGV2ZXJ5IE1URCA+IHBhcnRpdGlvbiIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
YW5nIFJvbmcgPHlhbmdyb25nQHZpdm8uY29tPiAgCj4gCj4gQWNrZWQtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiAKPiA+IC0tLQo+ID4gdjI6ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNzEwMDYxNDEyLjIyNzItMS15YW5ncm9uZ0B2aXZvLmNv
bS8KPiA+IFRoZSBtb2RpZmljYXRpb25zIG1hZGUgY29wYXJlZCB0byB0aGUgcHJldmlvdXMgdmVy
c2lvbiBhcmUgYXMgZm9sbG93czoKPiA+IDEuT3B0aW1pemVkIHRoZSBleHByZXNzaW9uIG9mIHRo
ZSBTdWJqZWN0LCBtYWtpbmcgaXQgbW9yZSBhY2N1cmF0ZS4KPiA+IDIuT3B0aW1pemVkIHRoZSBj
b250ZW50IG9mIHRoZSBjb21taXQgbWVzc2FnZS4KPiA+IDMuQWRkIHRoZSB0YWcgIkZpeGVzIi4K
PiA+IAo+ID4gIGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+ID4gIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMDA3NTUgZHJpdmVy
cy9tdGQvbXRkY29yZS5jCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+IGluZGV4IGUwMGIxMmFhNWVjOS4uYjAyY2I4
YjFhMzhkCj4gPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
bXRkL210ZGNvcmUuYwo+ID4gQEAgLTU5MSw2ICs1OTEsNyBAQCBzdGF0aWMgdm9pZCBtdGRfY2hl
Y2tfb2Zfbm9kZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+ICAJCWlmIChwbGVuID09IG10ZF9u
YW1lX2xlbiAmJgo+ID4gIAkJICAgICFzdHJuY21wKG10ZC0+bmFtZSwgcG5hbWUgKyBvZmZzZXQs
IHBsZW4pKSB7Cj4gPiAgCQkJbXRkX3NldF9vZl9ub2RlKG10ZCwgbXRkX2RuKTsKPiA+ICsJCQlv
Zl9ub2RlX3B1dChtdGRfZG4pOwo+ID4gIAkJCWJyZWFrOwo+ID4gIAkJfQo+ID4gIAl9ICAKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
