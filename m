Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345D8C4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2024 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwRpbEc8VTcaI0EQ77c4FEnWyZN+fhaZAjODTD5IG5s=; b=XLSgBLhVriBk4e
	nyoeiKVDf6fgqO9ufKWnN99BCkrLa2LCouemrtpD72mAUE4JZDXqIjrwJ83GZhL97SqZgpKNAk4d3
	v8wZ9RHrHCzQ70BYcwyfw/UD1zCRV6B1vsXdZWC02JB3P5ARkELaEAuiRHOeMa3/iGM6W7tpS6utE
	uQxKF1G9uNB/eqo+IG2RtEI8NDaNm/ei1fCE8gDqNKD/tfQNmU/4wrbshPhh/4eAwtcKwMapw14vr
	zWOGlPyhA9JwlxKhEoWE5L4iBE8moE6GYPAgDU4PmKeGqo8U8ayVdFChkrnALbmO8EbSno0lx4BD9
	Xh5mcb4viUleBtZvfVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxO8V-00000001d9y-3qKp;
	Thu, 18 Apr 2024 09:32:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxO8S-00000001d87-2OSz
	for linux-mtd@lists.infradead.org;
	Thu, 18 Apr 2024 09:32:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BEFD1BF213;
	Thu, 18 Apr 2024 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713432767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnS9+FdxrmLsw9rMPbFlN43vqt5uCeXtLqiiBEoSh30=;
	b=Ms9IXqwjiQ5l+EkNE1vgQWTvVP35KHoPgVFEBgMmV800y18fc3DGmOKwuVNs9cF9+h1tuo
	AlnZumBLSJMvscZODtx9c/ZuuOHBU8DYD94GRBELVp5MVAMNwj761/xQbaKbnb0dXRtFyp
	YYGJ7SLo6EPqZbSWmqLss5mWR5QE5wHXQ8M4aD/KKvgeUKIbQ48z6bhAsLN1iZNO8dMnTq
	K0oHZ9oto3u83m47CXvsbUAcR2SI5U9fNR0D6fRBDFYDdI6q4/SmW6gEMOGgx/gY6m5amP
	Wpzz0ok4Va28Li30uYOyT2da+gjulRsI5jwy+jYpDleGicMausXUsd9BlJNbEw==
Date: Thu, 18 Apr 2024 11:32:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: nand: mxc_nand: disable subpage reads
Message-ID: <20240418113244.6e535d3f@xps-13>
In-Reply-To: <ZiDCKGlG4MZ23Tqo@pengutronix.de>
References: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
	<20240417-mtd-nand-mxc-nand-exec-op-v1-4-d12564fe54e9@pengutronix.de>
	<ZiDCKGlG4MZ23Tqo@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_023252_921348_CD4E61D2 
X-CRM114-Status: GOOD (  26.53  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUaHUsIDE4IEFwciAy
MDI0IDA4OjQ4OjA4ICswMjAwOgoKPiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCAwOToxMzozMUFN
ICswMjAwLCBTYXNjaGEgSGF1ZXIgd3JvdGU6Cj4gPiBUaGUgTkFORCBjb3JlIGVuYWJsZWQgc3Vi
cGFnZSByZWFkcyB3aGVuIGEgbGFyZ2VwYWdlIE5BTkQgaXMgdXNlZCB3aXRoCj4gPiBTT0ZUX0VD
Qy4gVGhlIGkuTVggTkFORCBjb250cm9sbGVyIGRvZXNuJ3Qgc3VwcG9ydCBzdWJwYWdlIHJlYWRz
LCBzbwo+ID4gY2xlYXIgdGhlIGZsYWcgYWdhaW4uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNh
c2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L214Y19uYW5kLmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhj
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L214Y19uYW5kLmMKPiA+IGluZGV4IGY0NGMx
MzBkY2ExOGQuLjE5YjQ2MjEwYmQxOTQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9teGNfbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5j
Cj4gPiBAQCAtMTY2Nyw2ICsxNjY3LDggQEAgc3RhdGljIGludCBteGNuZF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIAlpZiAoZXJyKQo+ID4gIAkJZ290byBlc2NhbjsK
PiA+ICAKPiA+ICsJdGhpcy0+b3B0aW9ucyAmPSB+TkFORF9TVUJQQUdFX1JFQUQ7Cj4gPiArICAK
PiAKPiBOYWgsIGl0IGRvZXNuJ3Qgd29yayBsaWtlIHRoaXMuIEl0IHR1cm5zIG91dCB0aGUgQkJU
IGlzIHJlYWQgdXNpbmcKPiBzdWJwYWdlIHJlYWRzIGJlZm9yZSB3ZSBjYW4gZGlzYWJsZSB0aGVt
IGhlcmUuCj4KPiBUaGlzIGlzIHRoZSBjb2RlIGluIG5hbmRfc2Nhbl90YWlsKCkgd2Ugc3R1bWJs
ZSB1cG9uOgo+IAo+IAkvKiBMYXJnZSBwYWdlIE5BTkQgd2l0aCBTT0ZUX0VDQyBzaG91bGQgc3Vw
cG9ydCBzdWJwYWdlIHJlYWRzICovCj4gCXN3aXRjaCAoZWNjLT5lbmdpbmVfdHlwZSkgewo+IAlj
YXNlIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ6Cj4gCQlpZiAoY2hpcC0+cGFnZV9zaGlmdCA+
IDkpCj4gCQkJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX1NVQlBBR0VfUkVBRDsKPiAJCWJyZWFrOwo+
IAo+IAlkZWZhdWx0Ogo+IAkJYnJlYWs7Cj4gCX0KPiAKPiBTbyB0aGUgY29kZSBhc3N1bWVzIHN1
YnBhZ2UgcmVhZHMgYXJlIG9rIHdoZW4gU09GVF9FQ0MgaXMgaW4gdXNlLCB3aGljaAo+IGluIG15
IGNhc2UgaXMgbm90IHRydWUuIEkgZ3Vlc3Mgc29tZSBkcml2ZXJzIGRlcGVuZCBvbiB0aGUKPiBO
QU5EX1NVQlBBR0VfUkVBRCBiaXQgbWFnaWNhbGx5IGJlIHNldCwgc28gc2ltcGx5IHJlbW92aW5n
IHRoaXMgY29kZSBpcwo+IGxpa2VseSBub3QgYW4gb3B0aW9uLiAgQW55IGlkZWFzIHdoYXQgdG8g
ZG8/CgpDYW4geW91IGVsYWJvcmF0ZSB3aHkgc3VicGFnZSByZWFkcyBhcmUgbm90IGFuIG9wdGlv
biBpbiB5b3VyCnNpdHVhdGlvbj8gV2hpbGUgc3VicGFnZSB3cml0ZXMgZGVwZW5kIG9uIGNoaXAg
Y2FwYWJpbGl0aWVzLCByZWFkcwpob3dldmVyIHNob3VsZCBhbHdheXMgd29yazogaXQncyBqdXN0
IHRoZSBjb250cm9sbGVyIHNlbGVjdGluZyB0aGUKY29sdW1uIHdoZXJlIHRvIHN0YXJ0IGFuZCB0
aGVuIHJlYWRpbmcgbGVzcyBkYXRhIHRoYW4gaXQgY291bGQgZnJvbSB0aGUKTkFORCBjYWNoZS4g
SXQncyBhIHZlcnkgYmFzaWMgTkFORCBjb250cm9sbGVyIGZlYXR1cmUsIGFuZCBJIHJlbWVtYmVy
CnRoaXMgd2FzIHdvcmtpbmcgb24gZWcuIGFuIGkuTVgyNy4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
