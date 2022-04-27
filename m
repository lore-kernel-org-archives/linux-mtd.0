Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F62C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYv/BHtWONgBM9BCZqoVZQuF1ze55dhAaRnsP8vyI4M=; b=dWFUdqpMh0KUYI
	jSeWOqUacqNh5NLW1CjKxHFkHQkVqZdFVlFQwCF5D902ZdBqZYy5gPreXtY0jMV3nr0mejo5nndDD
	EB1hZq+73mgF2hszoVilByO7YLgPJ7uJbCy8j/cPoqkO9Z6qT8h4y1lagFXQxe0RQhhu03yIdnR5G
	3WKVuc4yXg+18dK53YmDWuA0w7MaM9+hR6jEcW9KENTgquWPS5+Oz//NkjEJoIFN4+BI+a7yZ0Wow
	X6VJdVGHPBo375vTFZo/zCkub0faBaAyPm0GJyYptDDOwS277Oxa9DajZA4gjmRa/AV7rLl1C93Eb
	W8wQPlFh/1T2GzP9p50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nje6q-000mFq-QP; Wed, 27 Apr 2022 09:37:20 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nje6m-000mDu-RO
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 09:37:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD1531BF21A;
 Wed, 27 Apr 2022 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651052232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6OmSt9//PD2uTPBDmWbiLCiWUmqxq5pjMj19s/dXho=;
 b=YZabMqJ9NyUVCyuZtN6Ksq5nLmOdpu9LkeuZpkdN3yBVJRbyuQzWu3FtLOESoNlhcMbrA9
 XuzfqRH/wq0OxapMMU0pk3EoIU4efpIXQMBUc6uzbP+cLn/1i9TsrD0wF+zcs6W/FjqwYJ
 Dd/YOtLZrDiiXzeQliY1VgzdZva8ZrDIc/HHOlm+1mZBKO0sDWgK/wL/cPt+tZKS/8ZGti
 5aJ0DR48Ks91+QfgepkhaMv369WmrUfmBEjhYjDrWbp8SsQiLDq+WIhbbB49cnrSIsBWx7
 /k4/Dgze4AZIW7E//sbnsbrMGxWT1c6FSmLbJE+dgfGOSEPhBD/mWjMM3q3EjQ==
Date: Wed, 27 Apr 2022 11:37:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v7 0/4] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Message-ID: <20220427113709.01f460c8@xps13>
In-Reply-To: <20220411094047.06556ee1@xps13>
References: <20220323170458.5608-1-ikegami.t@gmail.com>
 <6b09d10e-2098-9fb7-be4c-ae67d802cd2d@leemhuis.info>
 <20220411094047.06556ee1@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_023717_235426_28D3E603 
X-CRM114-Status: GOOD (  25.02  )
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

SGkgVmlnbmVzaCwKCm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gTW9uLCAxMSBB
cHIgMjAyMiAwOTo0MDo0NyArMDIwMDoKCj4gSGVsbG8sCj4gCj4gcmVncmVzc2lvbnNAbGVlbWh1
aXMuaW5mbyB3cm90ZSBvbiBTdW4sIDEwIEFwciAyMDIyIDEwOjUxOjE3ICswMjAwOgo+IAo+ID4g
SGksIHRoaXMgaXMgeW91ciBMaW51eCBrZXJuZWwgcmVncmVzc2lvbiB0cmFja2VyLiBUb3AtcG9z
dGluZyBmb3Igb25jZSwKPiA+IHRvIG1ha2UgdGhpcyBlYXNpbHkgYWNjZXNzaWJsZSB0byBldmVy
eW9uZS4KPiA+IAo+ID4gTWlxdWVsLCBSaWNoYXJkLCBWaWduZXNoOiB3aGF0J3MgdXAgaGVyZT8g
VGhpcyBwYXRjaHNldCBmaXhlcyBhCj4gPiByZWdyZXNzaW9uLiBJdCdzIHF1aXRlIG9sZCwgc28g
aXQncyBub3QgdGhhdCB1cmdlbnQsIGJ1dCBpdCBsb29rZWQgbGlrZQo+ID4gbm90aGluZyBoYXBw
ZW5lZCBmb3IgdHdvIGFuZCBhIGhhbGYgd2VlayBub3cuIE9yIHdhcyBwcm9ncmVzcyBtYWRlCj4g
PiBzb21ld2hlcmU/ICAKPiAKPiBWaWduZXNoLCBJJ20gd2FpdGluZyBmb3IgeW91ciByZXZpZXcv
YWNrIDspCgpBcmUgeW91IHN0aWxsIGFyb3VuZD8gV2Ugd2FpdCBmb3IgeW91ciBhY2sgb24gdGhp
cy4KCj4gPiBDaWFvLCBUaG9yc3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBrZXJuZWwncyBy
ZWdyZXNzaW9uIHRyYWNrZXInIGhhdCkgIAo+IAo+IE5pY2UgJ3Rvb2wnIDopCj4gCj4gPiBQLlMu
OiBBcyB0aGUgTGludXgga2VybmVsJ3MgcmVncmVzc2lvbiB0cmFja2VyIEknbSBnZXR0aW5nIGEg
bG90IG9mCj4gPiByZXBvcnRzIG9uIG15IHRhYmxlLiBJIGNhbiBvbmx5IGxvb2sgYnJpZWZseSBp
bnRvIG1vc3Qgb2YgdGhlbSBhbmQgbGFjawo+ID4ga25vd2xlZGdlIGFib3V0IG1vc3Qgb2YgdGhl
IGFyZWFzIHRoZXkgY29uY2Vybi4gSSB0aHVzIHVuZm9ydHVuYXRlbHkKPiA+IHdpbGwgc29tZXRp
bWVzIGdldCB0aGluZ3Mgd3Jvbmcgb3IgbWlzcyBzb21ldGhpbmcgaW1wb3J0YW50LiBJIGhvcGUK
PiA+IHRoYXQncyBub3QgdGhlIGNhc2UgaGVyZTsgaWYgeW91IHRoaW5rIGl0IGlzLCBkb24ndCBo
ZXNpdGF0ZSB0byB0ZWxsIG1lCj4gPiBpbiBhIHB1YmxpYyByZXBseSwgaXQncyBpbiBldmVyeW9u
ZSdzIGludGVyZXN0IHRvIHNldCB0aGUgcHVibGljIHJlY29yZAo+ID4gc3RyYWlnaHQuCj4gPiAK
PiA+ICNyZWd6Ym90IHBva2UKPiA+IAo+ID4gT24gMjMuMDMuMjIgMTg6MDQsIFRva3Vub3JpIElr
ZWdhbWkgd3JvdGU6ICAKPiA+ID4gU2luY2UgY29tbWl0IGRmZWFlMTA3MzU4MygibXRkOiBjZmlf
Y21kc2V0XzAwMDI6IENoYW5nZSB3cml0ZSBidWZmZXIgdG8KPiA+ID4gY2hlY2sgY29ycmVjdCB2
YWx1ZSIpIGJ1ZmZlcmVkIHdyaXRlcyBmYWlsIG9uIFMyOUdMMDY0Ti4gVGhpcyBpcwo+ID4gPiBi
ZWNhdXNlLCBvbiBTMjlHTDA2NE4sIHJlYWRzIHJldHVybiAweEZGIGF0IHRoZSBlbmQgb2YgRFEg
cG9sbGluZyBmb3IKPiA+ID4gd3JpdGUgY29tcGxldGlvbiwgd2hlcmUgYXMsIGNoaXBfZ29vZCgp
IGNoZWNrIGV4cGVjdHMgYWN0dWFsIGRhdGEKPiA+ID4gd3JpdHRlbiB0byB0aGUgbGFzdCBsb2Nh
dGlvbiB0byBiZSByZXR1cm5lZCBwb3N0IERRIHBvbGxpbmcgY29tcGxldGlvbi4KPiA+ID4gRml4
IGlzIHRvIHJldmVydCB0byB1c2luZyBjaGlwX2dvb2QoKSBmb3IgUzI5R0wwNjROIHdoaWNoIG9u
bHkgY2hlY2tzCj4gPiA+IGZvciBEUSBsaW5lcyB0byBzZXR0bGUgZG93biB0byBkZXRlcm1pbmUg
d3JpdGUgY29tcGxldGlvbi4KPiA+ID4gCj4gPiA+IEZpeGVzOiBkZmVhZTEwNzM1ODMoIm10ZDog
Y2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVyIHRvIGNoZWNrIGNvcnJlY3QgdmFs
dWUiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21h
aWwuY29tPgo+ID4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yL2I2ODdjMjU5LTY0MTMtMjZjOS1kNGM5LWIzYWZhNjllYTEy
NEBwZW5ndXRyb25peC5kZS8KPiA+ID4gCj4gPiA+IFRva3Vub3JpIElrZWdhbWkgKDQpOgo+ID4g
PiAgIG10ZDogY2ZpX2NtZHNldF8wMDAyOiBNb3ZlIGFuZCByZW5hbWUKPiA+ID4gICAgIGNoaXBf
Y2hlY2svY2hpcF9yZWFkeS9jaGlwX2dvb2RfZm9yX3dyaXRlCj4gPiA+ICAgbXRkOiBjZmlfY21k
c2V0XzAwMDI6IFVzZSBjaGlwX3JlYWR5KCkgZm9yIHdyaXRlIG9uIFMyOUdMMDY0Tgo+ID4gPiAg
IG10ZDogY2ZpX2NtZHNldF8wMDAyOiBBZGQgUzI5R0wwNjROIElEIGRlZmluaXRpb24KPiA+ID4g
ICBtdGQ6IGNmaV9jbWRzZXRfMDAwMjogUmVuYW1lIGNoaXBfcmVhZHkgdmFyaWFibGVzCj4gPiA+
IAo+ID4gPiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAxMTIgKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLQo+ID4gPiAgaW5jbHVkZS9saW51eC9tdGQvY2ZpLmggICAg
ICAgICAgICAgfCAgIDEgKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCsp
LCA1OCBkZWxldGlvbnMoLSkKPiA+ID4gICAgIAo+ID4gICAKPiAKPiAKPiBUaGFua3MsCj4gTWlx
dcOobAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
