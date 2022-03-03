Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6668C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Mj3/74ZL2o9Uz/FG1eK8PIBTPCuGLnvb83igFvOE1g=; b=OzrkYkyuoQrG1TOMHnmTiw98hK
	kDvM45WsQzvFbHR8rUwtiYWOkAGkR0vEGfOZMcYd83zLpCfNky5qlSR1mNMqqqGPfnLhMqeODJVy5
	PcymLx/MZ6FfOfu1RJ2ttJ6A6lA1OfkI/0eFseNzTXl5N6LtTdu5FhR3IMPk1GvdosQJ+E+VXArIr
	rfxvJi6WiY96ZESsUq72cMDH8RV25vnLUiou6/MDWVYHgh1l0U997Yf8yQ+1HbNlryl6xsAdU9pMd
	I5hYkXkAHlU9AU1HPxNrAe8tXC4JFEkEKTTpW831HBIP/Xec5xfs7VQRSPS8dfZpzLOE8yxzrm4qt
	Mb8GdaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnSe-006qgq-5A; Thu, 03 Mar 2022 15:33:48 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnS9-006qXl-Ts; Thu, 03 Mar 2022 15:33:19 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 893B82223B;
 Thu,  3 Mar 2022 16:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646321595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MyV4GqD5dB5xCfves9XhJrUGCWgVRJsI4ROjbj+Kj1c=;
 b=QBmUJCFppLDasvaO98kBA/ANbOwPQ4qkTiKKfnxwV9eTZWSlQOkbxDfJiuZ/b1QsC2HRM/
 Qj6/I3TkpisN0e0e9CZtYlFXT6yfup9y86AO5l/YbGRAhJe/nJrRooDSt5u0TuLgaO3Uqf
 4Rf6mywHGxhkaDimc2Ha2L+eFriXsFo=
MIME-Version: 1.0
Date: Thu, 03 Mar 2022 16:33:14 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
In-Reply-To: <d6e3dae6-fc46-1697-e496-33ab11469807@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-4-tudor.ambarus@microchip.com>
 <67810d13180a2718ad7ccc28815d2894@walle.cc>
 <d6e3dae6-fc46-1697-e496-33ab11469807@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <6bb1aafe7e156db8dfcf77f04a9d100e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_073318_157030_829EE9EC 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wMy0wMyAxNjoyOCwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy8xLzIyIDIzOjU3LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIyLTAyLTI4IDE0OjQ1LCBzY2hy
aWViIFR1ZG9yIEFtYmFydXM6Cj4+PiBNYWNyb25peCBoYXMgYSBiYWQgaGFiYml0IG9mIHJldXNp
bmcgZmxhc2ggSURzLiBXaGlsZSBNWDI1TDMyMzNGCj4+PiBzdXBwb3J0cwo+Pj4gUkRTRkRQIG9w
Y29kZSwgTVgyNUwzMjA1RCBkb2VzIG5vdCBzdXBwb3J0IGl0IGFuZCBkb2VzIG5vdCByZWNvbW1l
bmQKPj4+IGlzc3Vpbmcgb3Bjb2RlcyB0aGF0IGFyZSBub3Qgc3VwcG9ydGVkICgiSXQgaXMgbm90
IHJlY29tbWVuZGVkIHRvIAo+Pj4gYWRvcHQKPj4+IGFueSBvdGhlciBjb2RlIG5vdCBpbiB0aGUg
Y29tbWFuZCBkZWZpbml0aW9uIHRhYmxlLCB3aGljaCB3aWxsCj4+PiBwb3RlbnRpYWxseQo+Pj4g
ZW50ZXIgdGhlIGhpZGRlbiBtb2RlLiIpLgo+Pj4gCj4+PiBXZSB0ZXN0ZWQgdGhlIFJEU0ZEUCBv
biB0aGUgTVgyNUwzMjA1RCBhbmQgdGhlIGNvbmNsdXNpb24gaXMgdGhhdCB0aGUKPj4+IGZsYXNo
IGRpZG4ndCByZXBseSBhbnl0aGluZy4gR2l2ZW4gdGhhdCBpdCBpcyB1bmxpa2VseSB0aGF0IFJE
U0ZEUCAKPj4+IHdpbGwKPj4+IGNhdXNlIGFueSBwcm9ibGVtcyBmb3IgdGhlIG9sZCBNWDI1TDMy
MDVELCBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlCj4+PiB0d28KPj4+IGZsYXNoZXMgYnkgcGFy
c2luZyBTRkRQLgo+Pj4gCj4+PiBUZXN0ZWQgTVgyNUwzMjMzRi4gR2VuZXJhdGVkIGEgMjU2IEti
eXRlIHJhbmRvbSBkYXRhIGFuZCBkaWQgYW4gCj4+PiBlcmFzZSwKPj4+IHdyaXRlLCByZWFkIGJh
Y2sgYW5kIGNvbXBhcmUgdGVzdC4gVGhlIGZsYXNoIHVzZXMgZm9yIHJlYWRzCj4+PiBTUElOT1Jf
T1BfUkVBRF8xXzRfNCAweGViLCBmb3IgZXJhc2VzIFNQSU5PUl9PUF9CRV80SyAweDIwLCBhbmQg
Zm9yCj4+PiB3cml0ZXMKPj4+IFNQSU5PUl9PUF9QUCAweDAyLgo+Pj4gCj4+PiBTaWduZWQtb2Zm
LWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4+PiBBY2tl
ZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+Pj4gLS0tCj4+PiAjwqAgY2F0
Cj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vYWhiL2FoYjphcGIvZjAwMjAwMDAuc3BpL3NwaV9t
YXN0ZXIvc3BpMS9zcGkxLjAvc3BpLW5vci9qZWRlY19pZAo+Pj4gYzIyMDE2Cj4+PiAjIGNhdAo+
Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi9haGI6YXBiL2YwMDIwMDAwLnNwaS9zcGlfbWFz
dGVyL3NwaTEvc3BpMS4wL3NwaS1ub3IvbWFudWZhY3R1cmVyCj4+PiBtYWNyb25peAo+Pj4gIyBj
YXQKPj4+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9haGIvYWhiOmFwYi9mMDAyMDAwMC5zcGkvc3Bp
X21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yL3BhcnRuYW1lCj4+PiBteDI1bDMyMzNmCj4+PiAj
IGNhdAo+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi9haGI6YXBiL2YwMDIwMDAwLnNwaS9z
cGlfbWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1ub3Ivc2ZkcAo+Pj4gPiBteDI1bDMyMzNmLXNmZHAK
Pj4+IAo+Pj4gCj4+PiAjIHh4ZCAtcCBteDI1bDMyMzNmLXNmZHAKPj4+IDUzNDY0NDUwMDAwMTAx
ZmYwMDAwMDEwOTMwMDAwMGZmYzIwMDAxMDQ2MDAwMDBmZmZmZmZmZmZmZmZmZgo+Pj4gZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZTUyMGYxZmZmZmZmZmYwMTQ0ZWIwODZiCj4+
PiAwODNiMDRiYmVlZmZmZmZmZmZmZjAwZmZmZmZmMDBmZjBjMjAwZjUyMTBkODAwZmZmZmZmZmZm
ZmZmZmYKPj4+IGZmZmZmZmZmZmZmZjAwMzY1MDI2OWNmOTc3NjRmZWNmZmZmZmZmZmZmZmZmCj4+
IAo+PiBJcyBxdWFkIGVuYWJsZSB3b3JraW5nIG9yIGhhcyB0aGlzIHRoZSBzYW1lIHByb2JsZW0g
YXMKPj4gdGhlIG1hY3Jvbml4IGZsYXNoIGluIHBhdGNoIDQ/IEp1ZGdpbmcgYnkgdGhlIGxlbmd0
aCBvZiB0aGUgU0ZEUAo+PiB0aGlzIGFsc28gbGFja3MgdGhlIHJlcXVpcmVkIGluZm9ybWF0aW9u
IHRvIHNlbGVjdCBhbgo+PiBhcHByb3ByaWF0ZSBlbmFibGUgbWV0aG9kLiBJIGhhdmVuJ3QgaGFk
IGNsb3NlciBsb29rIHRob3VnaC4KPiAKPiBpdCB3b3JrZWQsIHllcy4gQXMgSSBzcGVjaWZpZWQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBJIHRlc3RlZCBpdCBhbmQgCj4gaXQgdXNlZAo+IFNQSU5P
Ul9PUF9SRUFEXzFfNF80IDB4ZWIgb3Bjb2RlIGZvciByZWFkcy4KCkknbSBjb25mdXNlZCwgd2h5
IGlzIEhlaWtvIHJlcG9ydGluZyB0aGF0IHRoZSBDUi9TUiB3cml0aW5nIGlzbid0Cndvcmtpbmcg
YmVjYXVzZSBhIHdyb25nIHF1YWRfZW5hYmxlIG1ldGhvZCBpcyBjaG9zZW4sIGJ1dCBoZXJlIGl0
CndpbGwgd29yay4gV2hhdCBhbSBJIG1pc3Npbmc/CgotbWljaGFlbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
