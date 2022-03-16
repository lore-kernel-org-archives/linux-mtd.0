Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1725C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfPkIL+ACIYH7V5X1lGg9Luh4qo7D3y1kDBeHYH98rY=; b=DL401fO5lXmZUb
	Ak4eB2jCdlUkZ/49uKkwGbNLC5bgOuyV/jL4RsPzNtf80zP6Bx3t+1I8Fu2I7cXezLdcURcslViEw
	T+yC+wW2vTAqZRQkjT18FjNJce74rTlyojyxbuWWIYnoIfGLtMJYVhFZQCqWz5iUeQeArM3cRw5ik
	1d9+Q0I95mdOly+Y5jlBIWg0F3Dfgg4wohy4YuGs1V+OfDSicOpWSUmFuJZNXQAuzY+nUHlNizO4n
	200A1nhDnbXOUaA+kNRG3QS75/HT4kQjr4F3aiufWtVo5Z3u2dWWeC7Ljz+zLz5sDjRZsw6+he7kM
	1ijnggE8psocOzonPyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUXQW-00Dxt5-3o; Wed, 16 Mar 2022 17:27:12 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUXQS-00Dxr4-Kq
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 17:27:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9CD80200010;
 Wed, 16 Mar 2022 17:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647451627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scq8Zb1lfOk6h+QLgGzlnO+0bMXFS+z430N4mkT6XOs=;
 b=Q6e5qnx21aoq6asNXsmEuw6WTpfSFBnbcPLQ66ACIOXZzqRraC/xSQjzSAypvcsn+ImRk4
 jewrm9HYbNcwvVxa4D6+xYbq3Xfj1FsCCO6NjHo8kCXXkOpKxM9rXt7m+AqKycpZSHXJn9
 ICIzZZ8K77OeAr9dNnCbLuXjxVPJYbFgogdc71T7+eaxE91ymetoqcsQKjCq5TzjqZotyI
 LH73vk6xr0hS7ZFZW+moHlbYlsmCB8QMoM6W2oIcTXFPavcHAImX1mJN9z2vT319Kv4Al7
 3xy28vM2GmVJpYmxb2kDsWmol80f+6mmeHg9Y3UP5RxRaDK46if+yc6jTl+OvA==
Date: Wed, 16 Mar 2022 18:27:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Message-ID: <20220316182705.7b38828b@xps13>
In-Reply-To: <20220316155455.162362-1-ikegami.t@gmail.com>
References: <20220316155455.162362-1-ikegami.t@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_102708_865590_36FC64EE 
X-CRM114-Status: GOOD (  13.97  )
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

SGkgVG9rdW5vcmksCgppa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMTcgTWFyIDIw
MjIgMDA6NTQ6NTIgKzA5MDA6Cgo+IEFzIHBvaW50ZWQgb3V0IGJ5IHRoaXMgYnVnIHJlcG9ydCBb
MV0sIGJ1ZmZlcmVkIHdyaXRlcyBhcmUgbm93IGJyb2tlbiBvbgo+IFMyOUdMMDY0Ti4gVGhpcyBp
c3N1ZSBjb21lcyBmcm9tIGEgcmV3b3JrIHdoaWNoIHN3aXRjaGVkIGZyb20gdXNpbmcgY2hpcF9n
b29kKCkKPiB0byBjaGlwX3JlYWR5KCksIGJlY2F1c2UgRFEgdHJ1ZSBkYXRhIDB4RkYgaXMgcmVh
ZCBvbiBTMjlHTDA2NE4gYW5kIGFuIGVycm9yCj4gcmV0dXJuZWQgYnkgY2hpcF9nb29kKCkuIE9u
ZSB3YXkgdG8gc29sdmUgdGhlIGlzc3VlIGlzIHRvIHJldmVydCB0aGUgY2hhbmdlCj4gcGFydGlh
bGx5IHRvIHVzZSBjaGlwX3JlYWR5IGZvciBTMjlHTDA2NE4uCgpUaGFua3MgZm9yIHlvdXIgcXVp
Y2sgaXRlcmF0aW9ucyBidXQgb3ZlcmFsbCBJIHNlcmlvdXNseSBkb24ndCBmZWVsCnRoaXMgc2Vy
aWVzIGlzIHJlYWR5LiBBdCBsZWFzdCByaWdodCBub3cgSSBhbSBzdGlsbCBub3Qgc2F0aXNmaWVk
IGJ5Cml0cyBzaGFwZS4KCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYjY4N2My
NTktNjQxMy0yNmM5LWQ0YzktYjNhZmE2OWVhMTI0QHBlbmd1dHJvbml4LmRlLwo+IAo+IEZpeGVz
OiBkZmVhZTEwNzM1ODMoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVy
IHRvIGNoZWNrIGNvcnJlY3QgdmFsdWUiKQoKLi4uIGFuZCB0aGlzIEZpeGVzIHRhZyBwb2ludHMg
dG8gYSB2NC4xOCBrZXJuZWwsIHNvIGlmIHRoaXMgaXMgdHJ1ZSwgd2UKc2hvdWxkIGhhdmUgYSBi
YWNrcG9ydC1hYmxlIHBhdGNoLiBUaGlzIGFsc28gbWVhbnMgdGhhdCB0aGlzIGlzIG5vdCBhcwpj
cml0aWNhbCB0aGFuIEkgdGhvdWdodCBpZiBwZW9wbGUgYWxyZWFkeSBsaXZlZCA0IHllYXJzIHdp
dGggdGhlIGJ1Zy4KClZpZ25lc2gsIEkgbGV0IHlvdSBjb250aW51ZSBpdGVyYXRpbmcgd2l0aCBU
b2t1bm9yaSBhbmQgYWNrIHRoZSBzZXJpZXMKd2hlbiB5b3UgZmVlbCBpdCdzIHJlYWR5LgoKPiBT
aWduZWQtb2ZmLWJ5OiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21haWwuY29tPgo+IFRl
c3RlZC1ieTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4KPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwo+IAo+IFRva3Vub3JpIElrZWdhbWkgKDMpOgo+ICAgbXRkOiBj
ZmlfY21kc2V0XzAwMDI6IE1vdmUgYW5kIHJlbmFtZQo+ICAgICBjaGlwX2NoZWNrL2NoaXBfcmVh
ZHkvY2hpcF9nb29kX2Zvcl93cml0ZQo+ICAgbXRkOiBjZmlfY21kc2V0XzAwMDI6IFVzZSBjaGlw
X3JlYWR5KCkgZm9yIHdyaXRlIG9uIFMyOUdMMDY0Tgo+ICAgbXRkOiBjZmlfY21kc2V0XzAwMDI6
IEFkZCBTMjlHTDA2NE4gSUQgZGVmaW5pdGlvbgo+IAo+ICBkcml2ZXJzL210ZC9jaGlwcy9jZmlf
Y21kc2V0XzAwMDIuYyB8IDkzICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKPiAKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
