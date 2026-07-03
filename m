Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E06C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0C4Xa/CnzU0uqdynCXvXUxP4qgGO8fSfsxPL6LoG9o=; b=ugeR1Ma9P0iMEZ
	G5UfY5Dws8qT2upY1R8woSE/GtUl1zDB+Z94PY/rvSdAXwGngR/9QnhHDT+LJ+1B1XEXsDL1kewJ6
	QdnDsnTM1bNv/yoImEtZPYI4fa5SXgDEA/YGpwC9PVWpjlld3Y6uLYiVaYw+cr1uoWZ8za73Y+xfQ
	QqRqILUb/lECxmhPXkXxefx517mzfetAgEt35ZUb6hkAgSRyMqvAA+tOMU0z4jixm1C1G5d7/gCFo
	sCTFt3GyXg4Y0ViBZisp/N+zBW0W/Z9STDWE0KmJXp4YDCGY25fZdOw8bLh9CzYHGKTaHqE5zflt1
	f3C0N27hHRVd3De7g/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdaJ-000000072gJ-1TF4;
	Fri, 03 Jul 2026 13:05:35 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdaF-000000072e2-3rZJ;
	Fri, 03 Jul 2026 13:05:33 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 08A4D4E2;
	Fri,  3 Jul 2026 15:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1783083920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OreQQ0XdKsQWlU/ho4QuvNgm2eEyh+R1RO2QdadtGn8=;
	b=nbrNh1zRQhB03C1yi+przXweH4RnERZffAT3vCSDaaxFgOrgAE3JWwxbVruloGmMtqMku6
	T0AD0QKO85hwr06F2IJL9gKTBfGEYHPc9gCGM9BAbBkT9GLr6KFcq80FuRVMVlFY84ZJ01
	/ZT59/9gw0hoskPrAhdBxSIlLd857e/7CKd0ZAYJ9GBaqAgTDBOp1pWkJR3y0eyVwj2C21
	Wl+VrFYl3v7WRGDz8sjsns9LPSiqfPnjo2mf1c8lqxtacN2yZRDbCgvSHOFh1CVV6IH5ga
	XVRmYNWdAmYfOXvdAT8gY979h7ypsdOF0e3iWSproq2mdHOZqf/rcwxsygAS6A==
Mime-Version: 1.0
Date: Fri, 03 Jul 2026 15:05:19 +0200
Message-Id: <DJOYHWDYJUT1.2PIRY8CG488AY@walle.cc>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
Cc: <Manikandan.M@microchip.com>, <krzk@kernel.org>, <pratyush@kernel.org>,
 <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Rob Herring"
 <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com>
 <20260702-utopian-termite-of-perfection-f1f3ec@quoll>
 <860213fd-6a4b-42d4-a8f7-7308e070f09e@microchip.com>
 <20260702163723.GA227454-robh@kernel.org> <8733y0penb.fsf@bootlin.com>
In-Reply-To: <8733y0penb.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_060532_126656_08083FDD 
X-CRM114-Status: GOOD (  20.14  )
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

T24gRnJpIEp1bCAzLCAyMDI2IGF0IDEyOjEwIFBNIENFU1QsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gT24gMDIvMDcvMjAyNiBhdCAxMTozNzoyMyAtMDUsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4+IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0IDA2OjU1OjE1QU0gKzAw
MDAsIE1hbmlrYW5kYW4uTUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4gSGkgS3J6eXN6dG9mLAo+
Pj4gCj4+PiBPbiA3LzIvMjYgMTE6NDYgQU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+
PiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+Pj4gPiAKPj4+ID4gT24gVHVl
LCBKdW4gMzAsIDIwMjYgYXQgMDI6NTQ6MDBQTSArMDUzMCwgTWFuaWthbmRhbiBNdXJhbGlkaGFy
YW4gd3JvdGU6Cj4+PiA+PiBBZGQgYW4gb3B0aW9uYWwgInNmZHAiIGNoaWxkIG5vZGUgKGNvbXBh
dGlibGUgImplZGVjLHNmZHAiKSB0aGF0Cj4+PiA+PiBkZXNjcmliZXMgdGhlIFNGRFAgYXMgYSBy
ZWFkLW9ubHkgTlZNRU0gcHJvdmlkZXIgdmlhIG52bWVtLnlhbWwsIHNvIGl0cwo+Pj4gPiAKPj4+
ID4gV2hhdCBpcyBTRkRQPwo+Pj4gPiAKPj4+IFNGRFAgaXMgdGhlIFNlcmlhbCBGbGFzaCBEaXNj
b3ZlcmFibGUgUGFyYW1ldGVycyAtLSBhIEpFREVDLXN0YW5kYXJkaXNlZAo+Pj4gKEpFU0QyMTYp
IHJlYWQtb25seSBwYXJhbWV0ZXIgdGFibGUgcHJlc2VudCBpbiBtb3N0IFNQSSBOT1IgZmxhc2hl
cywgdGhlIAo+Pj4gdGFibGUgY29udGVudHMgcHJvdmlkZSBiYXNpYyBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgZmxhc2guIFRoZXJlIGFyZSAKPj4+IHN0YW5kYXJkIHRhYmxlcyB3aGljaCBhcmUgc3Bl
Y2lmaWVkIGJ5IHRoZSBKRURFQyBzdGFuZGFyZCBhbmQgdGhlcmUgYXJlIAo+Pj4gdmVuZG9yIHRh
Ymxlcy4KPj4KPj4gSXMgU0ZEUCBwcmVzZW50IG9yIG5vdCBkaXNjb3ZlcmFibGU/IE9yIHdlIGhh
dmUgYSB0YWJsZSBvZiBkaXNjb3ZlcmFibGUgCj4+IHBhcmFtZXRlcnMgdGhhdCBpdHNlbGYgaXMg
bm90IGRpc2NvdmVyYWJsZS4KPgo+IFNGRFAgaXMgYWxtb3N0IGFsd2F5cyB0aGVyZS4gSSBkb24n
dCB0aGluayB0aGVyZSBhcmUgYW55IG5vbiBTRkRQIGNoaXBzCj4gbWFudWZhY3R1cmVkIHRvZGF5
ICg/KS4KCk9oIGkgYmV0IHRoZXJlIGFyZSwgYW5kIElJUkMgdGhlcmUgd2VyZSBzb21lIGFkZGl0
aW9ucyBsYXRlbHkuIE5vdApzdXJlIGlmIHRoZSBjaGlwIHdhcyBuZXcgdGhvdWdoLgoKPiBUaGUg
dGhpbmcgaXMsIGV2ZW4gaWYgd2UgZG9uJ3QgbmVlZCB0byBkZWZpbmUgaXQKPiBpbiBEVCwgd2Ug
bWlnaHQgbmVlZCB0byBwb2ludCB0byBpdCBpbiBvcmRlciB0byBleHRyYWN0IGVnLiBhIHVuaXF1
ZSBJRAo+IG9yIGEgTUFDIGFkZHJlc3MgdGhyb3VnaCB0aGUgTlZNRU0gaW50ZXJmYWNlLgoKRXhh
Y3RseS4gV2UgY2FuIGRldGVjdCB3aGV0aGVyIGlzIGEgU0ZEUCB0YWJsZSBvciBub3QsIGJ5IHRy
eWluZyB0bwpyZWFkIGl0cyBzaWduYXR1cmUgdXNpbmcgdGhlIFJEU0ZEUCBvcGNvZGUuIEJ1dCBh
cyBNaXF1ZWwgcG9pbnRlZApvdXQsIHRoYXQncyBub3Qgd2hhdCB0aGlzIGlzIGFib3V0LiBGb3Ig
dGhlIG52bWVtIHBhcnQgYmVpbmcgdXNlZnVsLAp3ZSBoYXZlIHRvIGhhdmUgc29tZSBub2RlIHRv
IHBvaW50IHRvLiBBdCB0aGUgbW9tZW50LCB0aGVyZSBhcmUKdGhyZWUgZGlmZmVyZW50IGtpbmQg
b2YgTlZNRU0gZGV2aWNlcyBhbiBzcGkgbm9yIGZsYXNoIGNhbiBjcmVhdGU6CiAtIHBhcnRpdGlv
bnMKIC0gZmFjdG9yeSBPVFAgKGkuZS4gT1RQIGJ5IHRoZSBmbGFzaCBtYW51ZmFjdHVyZXIpCiAt
IHVzZXIgT1RQIChpLmUuIHdoYXQgYW4gT0VNIGNvdWxkIHdyaXRlIHRvKQoKTm93IHRoZXJlJ3Mg
YSBmb3VydGggb25lOiBTRkRQLiBJdCBjYW4gY29udGFpbiB2ZW5kb3Igc3BlY2lmaWMKdGFibGVz
LCB3aGljaCBpbiB0aGUgbWNocCBjYXNlIGlzIHVzZWQgdG8gc3RvcmUgYSBtYWMgYWRkcmVzcywK
d2hpY2ggaXMgdGhlbiB1c2VkIGZvciBhIE5JQy4KClNvIHdlIHNvbWVob3cgaGFzIHRvIG9yZ2Fu
aXplIGFsbCBvZiB0aGVtLCB0aHVzIHRoZSBzZmRwIG5vZGUuIEEKbW9yZSBjb21wbGV0ZSBleGFt
cGxlIHdvdWxkIGJlOgoKZmxhc2hAMCB7Cgljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwoK
CXBhcnRpdGlvbnMgewoJCWNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CgoJCXBhcnRp
dGlvbkAwIHsKCQkJY29tcGF0aWJsZSA9ICJudm1lbS1jZWxscyI7CgkJfTsKCX07CgoJb3RwLTEg
ewoJCWNvbXBhdGlibGUgPSAiZmFjdG9yeS1vdHAiOwoJfTsKCglvdHAtMiB7CgkJY29tcGF0aWJs
ZSA9ICJ1c2VyLW90cCI7Cgl9OwoKCXNmZHAgewoJCWNvbXBhdGlsZSA9ICJqZWRlYyxzZmRwIjsK
CX07Cn07CgpBbGwgYmVpbmcgTlZNRU0gZGV2aWNlcyBhbmQgZXhwb3NlIHNvbWUga2luZCBvZiBk
YXRhIHVzZWQgZm9yCmRyaXZlcnMuCgpIVEgKLW1pY2hhZWwKCj4gU0ZEUCBpcyBzcGxpdCBpbnRv
IHNldmVyYWwgc3ViLXRhYmxlcywgdGhlIGZpcnN0IG9uZSBpcyBtYW5kYXRvcnksIGJ1dAo+IHRo
ZW4gdGhlcmUgYXJlIG9wdGlvbmFsIHRhYmxlcyB3aGljaCBjYW4gYmUgZGlzY292ZXJlZCBkeW5h
bWljYWxseS4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
