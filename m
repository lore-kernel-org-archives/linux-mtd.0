Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1EDC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsvODxO6Qdmc9opIFKR8mDx60rueZiOMosSbCzyIlZ4=; b=PqOdpMl1PEFabQ9vxmjakzLP1m
	RKFx7JqHkMd5tN8rVQZ60tEbJsLsXDF1BvJSNpZwuDzLWtewmlWJ/XjFC2FcTAPyLHKNt4u4OJG/h
	Wo5B3NyKcnidBtxCyaIe+Ry9lo8LGT+1j/XnUq3J5LCu4nXXp3xbjQDkkcFtRj7QF6G3LhhYeRj6s
	pF9RNumkRtb6zfcWT0/jFvqV/eDmyPke3zO8XIHVZ5hg0smB0oUc48TCjUcwwKKagu1EqbLU2OvW9
	x/jF14KqYkb6PYEqk5vBEswZO4kWJUj0Ax3A7Ep8PMmQhtpvzdKg7XcOVXRBGF7SuiRncS5fGF6hx
	fGOn1uzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npRms-00FO8F-3S; Fri, 13 May 2022 09:40:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npRmo-00FO6e-SW
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 09:40:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1690D2222E;
 Fri, 13 May 2022 11:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652434835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tenagGblhPNyZiWuKwTdEorMbMxRh2I+9kI9eYSXctE=;
 b=KbEiUZ+YObdji70EruAzVIhHSRWw2LvKWNQeEPcWQkGCdxNUBqeDrhQWZZEOlXpK1yJ8x0
 wRZ+89IpoYuRRYfYrYO9k7zfvBfHM6gYam8TchYP4EWksa1JJbH/07IfS6w5am8nenhe4+
 12AlEhDq3XmpNBFBpGuLwxIgGOsZBfw=
MIME-Version: 1.0
Date: Fri, 13 May 2022 11:40:35 +0200
From: Michael Walle <michael@walle.cc>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
In-Reply-To: <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0eea594f72858ec0ee099d45da71bc96@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_024039_114231_053BC600 
X-CRM114-Status: GOOD (  15.94  )
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

W2J0dyB0aGUgc3ViamVjdCBzdGlsbCBoYXMgdGhlIG9sZCBuYW1lIG9mIHRoZSBhZGRyX3dpZHRo
XQoKQW0gMjAyMi0wNS0xMyAwMzoyNiwgc2NocmllYiBUYWthaGlybyBLdXdhbm86Cj4gT24gNS8x
My8yMDIyIDc6MTQgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IEFtIDIwMjItMDUtMTAgMDA6
MTAsIHNjaHJpZWIgdGt1dzU4NDkyNEBnbWFpbC5jb206Cj4+PiBGcm9tOiBUYWthaGlybyBLdXdh
bm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+PiAKPj4+IEluIDRCQUlUIHBhcnNl
LCBrZWVwIG5vci0+cGFyYW1zLT5hZGRyX3dpZHRoIGJlY2F1c2UgaXQgbWF5IGJlIHVzZWQgCj4+
PiBhcwo+Pj4gY3VycmVudCBhZGRyZXNzIG1vZGUgaW4gU01QVCBwYXJzZSBsYXRlciBvbi4KPj4g
Cj4+IE1oIEknbSBub3Qgc3VyZSB0aGlzIGlzIG5lZWRlZCBhdCBhbGwuCj4+IAo+PiBTRkRQIHNw
ZWMgc2F5cwo+PiDCoCBWYXJpYWJsZSBhZGRyZXNzIGxlbmd0aCAodGhlIGN1cnJlbnQgc2V0dGlu
ZyBvZiB0aGUgYWRkcmVzcwo+PiDCoCBsZW5ndGggbW9kZSBkZWZpbmVzIHRoZSBhZGRyZXNzIGxl
bmd0aCkKPj4gCj4+IGFuZAo+PiDCoCBXaGVuIHRoZSBsZW5ndGggaXMgZGVmaW5lZCBhcyB2YXJp
YWJsZSwgdGhlIHNvZnR3YXJlIG9yIGhhcmR3YXJlCj4+IMKgIGNvbnRyb2xsaW5nIHRoZSBtZW1v
cnkgaXMgYXdhcmUgb2YgdGhlIGFkZHJlc3MgbGVuZ3RoIG1vZGUgbGFzdAo+PiDCoCBzZXQgaW4g
dGhlIG1lbW9yeSBkZXZpY2UgYW5kIHRoaXMgc2FtZSBsZW5ndGggb2YgYWRkcmVzcy4KPj4gCj4+
IFdlIGRvbid0IHNldCBhbnkgYWRkcmVzcyBtb2RlIHVudGlsIGFsbCB0aGUgU0ZEUCBwYXJzaW5n
IGlzCj4+IG92ZXIuIFRoZXJlZm9yZSB3ZSBzaG91bGQgYWx3YXlzIGJlIGluIDMgYnl0ZSBtb2Rl
LCBubz8KPj4gCj4gQWN0dWFsbHkgdGhlcmUgYXJlIHNvbWUgZGV2aWNlcyB0aGF0IGhhdmUgdmFy
aWFibGUgYWRkcmVzcyBsZW5ndGggYnV0Cj4gNCBieXRlIG1vZGUgYnkgZGVmYXVsdCAoSSB3aWxs
IHdvcmsgb24gdGhvc2UgZGV2aWNlcyBhZnRlciB0aGlzIHNlcmllcwo+IGlzIHNldHRsZWQpLiBU
byBzdXBwb3J0IHN1Y2ggY2FzZSwgSSBwcmVmZXIgdG8gdXNlIHBhcmFtcy0+YWRkcl9uYnl0ZXMK
PiBhcyBjdXJyZW50IGFkZHJlc3MgbW9kZSBzbyB0aGF0IEkgY2FuIGZpeCBpdCBpbiBwb3N0X2Jm
cHRfZml4dXAoKSBob29rLgoKQXJlIHRoZXJlIHB1YmxpYyBkYXRhc2hlZXRzIGF2YWlsYWJsZT8g
U28gdGhlc2UgZGV2aWNlcyBoYXZlIGEgMyBieXRlCmFuZCBhIDQgYnl0ZSBtb2RlLCBidXQgYWZ0
ZXIgcmVzZXQsIHRoZXkgYXJlIGluIHRoZSA0IGJ5dGUgbW9kZT8gTG9va3MKbGlrZSBpdCBzaG91
bGQgYmUgZml4ZWQgaW4gYSBkaWZmZXJlbnQgd2F5LiBJJ20gbm90IHN1cmUgdGhlICJjdXJyZW50
Cm1vZGUiIGhhbmRsaW5nIGlzIGNvcnJlY3QuCgpXZSBuZWVkIHRvIGRpZmZlcmVudGlhdGUgYmV0
d2VlbiB0aGUgbW9kZSB0aGUgZmxhc2ggY3VycmVudGx5IGlzIHVzaW5nCihub3ItPmFkZHJfbmJ5
dGVzKSBhbmQgdGhlIG1vZGUgcGFyc2VkIGJ5IFNGRFAgKHBhcmFtcy0+YWRkcl9uYnl0ZXMpLgoK
QXQgc29tZSBwb2ludCwgdGhlIG1vZGUgaXMgc3dpdGNoZWQgYW5kIG5vci0+YWRkcl9uYnl0ZXMg
YmVjb21lcwpwYXJhbXMtPmFkZHJfbmJ5dGVzLiBJdCBzZWVtcyBpbiB5b3VyIGNhc2Ugbm9yLT5h
ZGRyX25ieXRlcyBzaG91bGQKYmUgNCByaWdodCBmcm9tIHRoZSBiZWdpbm5pbmcuIFdoaWNoIGFs
c28gbWVhbnMgbm9yLT5hZGRyX25ieXRlcwpzaG91bGQgYmUgMyBmb3IgdGhlIG90aGVyIGNhc2Vz
IChhbmQgcHJvYmFibHkgbm90IDApLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
