Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67AACDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYyv7FU3FRQzhzufxzco1Yn0foj21JWsN3xQiVIRhMw=; b=dBtWo1ULOLedZp
	cSj12iTet3Reghyc9mq46AnUNxU7mWNtDCnwwkvpNVYa7cNY8hbxbqwlHicS8nTbr8vhg5/b36EAJ
	VkuQFzBnc8HrIthOcw4ejxyTbOR98jyCaTWzB61w3fW0S2t+SlUVI+agyODYTr5S9QM48RcFFOD9R
	A+8kjUF0OpbYFY+9jMnFOsVruE9fKzFMMxmdwEPpPlvgkP0uS0KN6vXGJgbmobWIQJP5nYOM3NPJF
	g14B4ggbRnyjwd/2nkAvx7kWO/AFHw79FUu3bz6KqQU31ouh0VlZZWib9FUYLSV0CDwwCx7NTrIBo
	Rut/qv94FDGOz5k2Ghwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJQB-008uXv-1e;
	Mon, 16 Oct 2023 08:57:55 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJQ5-008uUg-2X
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 08:57:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1ED6E0008;
	Mon, 16 Oct 2023 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697446663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8twWkfoS+52F5q11cAzMRnwRGmoKZNzcuZ6S/LXmAfQ=;
	b=LZibeEe4QaTLH4OeyVNbFipDRO00IrlycOnZ2v7eq2ca3kLq2GP29LSqEJGZ1tbAH1mmKO
	5PHaZx0gNuH38LZx4qooqqjOkO06/y+UXKi/d9Fl3B03qMc5kRlK1lB7efc1snriXFoW0J
	fRBRIOxfbAFhEkuu+kvZKeqqschboD4afrU2Z0ejwpUVddwEK9wbwOXLUq3aoFpotu7jLp
	jjxuS635RUVLgjXQU1fnhDvGdnCQStG1+24nphrWUb/VmFP7G8CQpNq700jc3QMUPFqudr
	lUWcc0tXl9eixJ0+b3qxSP6sj86CUoS2CqVXwv8A+6h4cI6cjD5uw69ZpKCycQ==
Date: Mon, 16 Oct 2023 10:57:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 "Masahiro Yamada" <masahiroy@kernel.org>, "David Woodhouse"
 <dwmw2@infradead.org>, linux-kbuild@vger.kernel.org, "Richard Weinberger"
 <richard@nod.at>, "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231016105737.7b851d85@xps-13>
In-Reply-To: <20231009153741.5b04a137@xps-13>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
	<20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
	<CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
	<e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
	<20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
	<20231009144610.4ff82afa@xps-13>
	<55a03e14-7a92-4cf0-82d4-5cbde64d69db@app.fastmail.com>
	<20231009153741.5b04a137@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_015750_237726_234928D6 
X-CRM114-Status: GOOD (  25.58  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgOSBPY3QgMjAy
MyAxNTozNzo0MSArMDIwMDoKCj4gSGkgQXJuZCwKPiAKPiBhcm5kQGFybmRiLmRlIHdyb3RlIG9u
IE1vbiwgMDkgT2N0IDIwMjMgMTU6MDE6MTcgKzAyMDA6Cj4gCj4gPiBPbiBNb24sIE9jdCA5LCAy
MDIzLCBhdCAxNDo0NiwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4gPj4gT24gTW9uLCBPY3Qg
MDksIDIwMjMgYXQgMTA6NDM6NDZBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZTogICAgCj4g
PiA+PiA+IE9uIE1vbiwgT2N0IDksIDIwMjMsIGF0IDA5OjIyLCBNYXNhaGlybyBZYW1hZGEgd3Jv
dGU6ICAgICAgCj4gPiA+PiA+ID4gT24gTW9uLCBPY3QgOSwgMjAyMyBhdCA1OjAy4oCvQU0gVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gPiBDYW4gd2Ug
aW5zdGVhZCBxdWVzdGlvbiB0aGUgdXNlIG9mIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUo
KT8gICAgCj4gPiA+IEkgZG9uJ3QgaGF2ZSB0aGUgaGlzdG9yeSBpbiBtaW5kLCBidXQgd2h5IG5v
dCBqdXN0IHN3aXRjaCB0byByZWd1bGFyCj4gPiA+IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSBy
ZWdpc3RyYXRpb24gaW5zdGVhZD8gSXQgc2VlbXMgbGlrZSB0aGUKPiA+ID4gb3JpZ2luYWwgYXV0
aG9ycyBqdXN0IGRpZCBub3QgY2FyZSBhYm91dCB0aGUgcmVtb3ZlIHBhdGggYW5kIHdlcmUKPiA+
ID4gaGFwcHkgdG8gc2tpcCBpdHMgaW1wbGVtZW50YXRpb24uCj4gPiA+Cj4gPiA+IE9uIG10ZCBk
ZXZpY2VzIG9uZSBjYW4gYXJndWUgdGhhdCB0aGUgZmxhc2ggdW5kZXJseWluZyBzdG9yZXMgdGhl
Cj4gPiA+IHJvb3RmcyBhbmQgdGh1cyBjYW5ub3QgYmUgcmVtb3ZlZCwgYnV0IEkgYmVsaWV2ZSB0
b2RheSB0aGlzIGlzIGEKPiA+ID4gcXVlc3Rpb25hYmxlIChzb2Z0d2FyZSkgZGVzaWduLiAgICAK
PiA+IAo+ID4gSXQgd2FzIGNoYW5nZWQgdG8gbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgp
IGluIGNvbW1pdAo+ID4gM2EyYTEzZmE5MDJkMiAoIm10ZDogdHh4OW5kZm1jOiB1c2UgbW9kdWxl
X3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgpIikKPiA+IHdpdGggYSBzaG9ydCBjaGFuZ2Vsb2cgdGV4
dDoKPiA+IAo+ID4gY29tbWl0IDNhMmExM2ZhOTAyZDIzMmExZTU2NTgyNjQ3YWVkNmNiMjU5MTM0
OWIKPiA+IEF1dGhvcjogSmluZ29vIEhhbiA8amcxLmhhbkBzYW1zdW5nLmNvbT4KPiA+IERhdGU6
ICAgVHVlIE1hciA1IDEzOjMxOjI0IDIwMTMgKzA5MDAKPiA+IAo+ID4gICAgIG10ZDogdHh4OW5k
Zm1jOiB1c2UgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgpCj4gPiAgICAgCj4gPiAgICAg
VGhpcyBwYXRjaCB1c2VzIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKSBtYWNybyB3aGlj
aCBtYWtlcwo+ID4gICAgIHRoZSBjb2RlIHNtYWxsZXIgYW5kIHNpbXBsZXIuCj4gPiAgICAgCj4g
PiAgICAgU2lnbmVkLW9mZi1ieTogSmluZ29vIEhhbiA8amcxLmhhbkBzYW1zdW5nLmNvbT4KPiA+
ICAgICBTaWduZWQtb2ZmLWJ5OiBBcnRlbSBCaXR5dXRza2l5IDxhcnRlbS5iaXR5dXRza2l5QGxp
bnV4LmludGVsLmNvbT4KPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPERh
dmlkLldvb2Rob3VzZUBpbnRlbC5jb20+Cj4gPiAKPiA+IEluc3RlYWQgb2YganVzdCBzaW1wbGlm
eWluZyB0aGUgY29kZSwgSSB0aGluayB0aGF0IHdhcyBhY3R1YWxseQo+ID4gYSBidWdmaXggYmVj
YXVzZSBpdCBwcmV2ZW50ZWQgYm90aCB0aGUgcHJvYmUgYW5kIHJlbW92ZSBjYWxsYmFja3MKPiA+
IGZyb20gZ2V0dGluZyBjYWxsZWQgYWZ0ZXIgZ2V0dGluZyBkcm9wcGVkIChkZWZlcnJlZCBwcm9i
ZSBvcgo+ID4gdW5iaW5kL3JlYmluZCkuIFVzaW5nIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSBp
cyBwcm9iYWJseQo+ID4gZXZlbiBiZXR0ZXIgaGVyZSwgYnV0IHRoZW4gd2UgbmVlZCB0byByZW1v
dmUgYm90aCB0aGUgX19pbml0Cj4gPiBhbmQgX19leGl0IGFubm90YXRpb25zLiAgCj4gCj4gQWdy
ZWVkLgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpGWUkgSSd2ZSBjb2xsZWN0ZWQgYWxsIHRoZSBw
YXRjaGVzIGluIHRoaXMgc2VyaWVzIGV4Y2VwdCB0aGUgdHh4OW5kZm1jCm9uZXMuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
