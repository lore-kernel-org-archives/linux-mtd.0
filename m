Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE81C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 16:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CAE76103B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 16:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CAE76103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiD/JlOJKOMlaEWd4tzH7fZ7byhgypIuLaqhBq+1ku4=; b=xYZ9zBhTURHoWG
	sdqvcrSnp2L1i8acr+gpyRadAf8drI5J24bEMs1UdCJMS+u+POykPgVE4i3HReqNry16cKo4kt1ml
	h/44D9aLUL4zyZ9x6oBZ+hisSKoD5AMUxkoKVCYKFaUqNG/g/8V1uFwg4Kq6czBzFxTihaN18r8F+
	soPH3cVDyOdTbdmJRL+bPi8/CZbex4vOgGiZ6Kh12xCZ/Zf9nJPmdYi7xG+8UtctEd+oXtizqX7if
	+eGCg680aMl0aksuqevATF1Ed7n6SwdgfAlpLRONViiGbdx9H3uOVwDYbLji30AeaztRlWYHnINLM
	Zcn30JgnhGkll5Kvib3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUtZX-003NUa-Pt; Mon, 27 Sep 2021 16:33:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUtZU-003NRI-Gw
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 16:33:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 872CA1C0005;
 Mon, 27 Sep 2021 16:33:29 +0000 (UTC)
Date: Mon, 27 Sep 2021 18:33:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Arnd Bergmann
 <arnd@arndb.de>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Serge Semin
 <Sergey.Semin@baikalelectronics.ru>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC] mtd: fixup CFI on ixp4xx
Message-ID: <20210927183328.2f200fc2@xps13>
In-Reply-To: <20210927141045.1597593-1-arnd@kernel.org>
References: <20210927141045.1597593-1-arnd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_093340_722644_F7EEF8FB 
X-CRM114-Status: GOOD (  20.87  )
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

SGkgQXJuZCwKCmFybmRAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDI3IFNlcCAyMDIxIDE2OjEw
OjM3ICswMjAwOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IGRy
aXZlcnMvbXRkL21hcHMvaXhwNHh4LmMgcmVxdWlyZXMgTVREX0NGSV9CRV9CWVRFX1NXQVAgdG8g
YmUgc2V0Cj4gaW4gb3JkZXIgdG8gY29tcGlsZS4KPiAKPiBkcml2ZXJzL210ZC9tYXBzL2l4cDR4
eC5jOjU3OjQ6IGVycm9yOiAjZXJyb3IgQ09ORklHX01URF9DRklfQkVfQllURV9TV0FQIHJlcXVp
cmVkCj4gCj4gVGhpcyBwYXRjaCBhdm9pZHMgdGhlICNlcnJvciBvdXRwdXQgYnkgZW5mb3JjaW5n
IHRoZSBwb2xpY3kgaW4KPiBLY29uZmlnLiBOb3Qgc3VyZSBpZiB0aGlzIGlzIHRoZSByaWdodCBh
cHByb2FjaCwgYnV0IGl0IGhlbHBzIGRvaW5nCj4gcmFuZGNvbmZpZyBidWlsZHMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiBBbnkgb3Ro
ZXIgaWRlYXMgZm9yIGhvdyB0byBhZGRyZXNzIGl0PwoKSSBhbSBmaW5lIHdpdGggdGhlIGFwcHJv
YWNoLiBTaG91bGQgSSB3YWl0IGZvciBzb21lb25lIGVsc2UncyBBY2s/CgpUaGFua3MsCk1pcXXD
qGwKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL2NoaXBzL0tjb25maWcgfCAyICsrCj4gIGRyaXZlcnMv
bXRkL21hcHMvS2NvbmZpZyAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL0tj
b25maWcgYi9kcml2ZXJzL210ZC9jaGlwcy9LY29uZmlnCj4gaW5kZXggYWVmMTQ5OTBlNWY3Li4x
OTcyNmViZDk3M2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvS2NvbmZpZwo+ICsr
KyBiL2RyaXZlcnMvbXRkL2NoaXBzL0tjb25maWcKPiBAQCAtNTUsMTIgKzU1LDE0IEBAIGNob2lj
ZQo+ICAJICBMSVRUTEVfRU5ESUFOX0JZVEUsIGlmIHRoZSBieXRlcyBhcmUgcmV2ZXJzZWQuCj4g
IAo+ICBjb25maWcgTVREX0NGSV9OT1NXQVAKPiArCWRlcGVuZHMgb24gIUFSQ0hfSVhQNFhYIHx8
IENQVV9CSUdfRU5ESUFOCj4gIAlib29sICJOTyIKPiAgCj4gIGNvbmZpZyBNVERfQ0ZJX0JFX0JZ
VEVfU1dBUAo+ICAJYm9vbCAiQklHX0VORElBTl9CWVRFIgo+ICAKPiAgY29uZmlnIE1URF9DRklf
TEVfQllURV9TV0FQCj4gKwlkZXBlbmRzIG9uICFBUkNIX0lYUDRYWAo+ICAJYm9vbCAiTElUVExF
X0VORElBTl9CWVRFIgo+ICAKPiAgZW5kY2hvaWNlCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L21hcHMvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL21hcHMvS2NvbmZpZwo+IGluZGV4IGFhYTE2NGI5
NzdmZS4uNDk0NWNhYTg4MzQ1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL21hcHMvS2NvbmZp
Zwo+ICsrKyBiL2RyaXZlcnMvbXRkL21hcHMvS2NvbmZpZwo+IEBAIC0zMDIsNyArMzAyLDcgQEAg
Y29uZmlnIE1URF9EQzIxMjg1Cj4gIAo+ICBjb25maWcgTVREX0lYUDRYWAo+ICAJdHJpc3RhdGUg
IkNGSSBGbGFzaCBkZXZpY2UgbWFwcGVkIG9uIEludGVsIElYUDR4eCBiYXNlZCBzeXN0ZW1zIgo+
IC0JZGVwZW5kcyBvbiBNVERfQ0ZJICYmIE1URF9DT01QTEVYX01BUFBJTkdTICYmIEFSQ0hfSVhQ
NFhYCj4gKwlkZXBlbmRzIG9uIE1URF9DRkkgJiYgTVREX0NPTVBMRVhfTUFQUElOR1MgJiYgQVJD
SF9JWFA0WFggJiYgTVREX0NGSV9BRFZfT1BUSU9OUwo+ICAJaGVscAo+ICAJICBUaGlzIGVuYWJs
ZXMgTVREIGFjY2VzcyB0byBmbGFzaCBkZXZpY2VzIG9uIHBsYXRmb3JtcyBiYXNlZAo+ICAJICBv
biBJbnRlbCdzIElYUDR4eCBmYW1pbHkgb2YgbmV0d29yayBwcm9jZXNzb3JzIHN1Y2ggYXMgdGhl
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
