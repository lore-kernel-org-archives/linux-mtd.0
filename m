Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55447E95A95
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Xqg2uJ8uUnS2ITI16c3NAUf2HttO/0M9V5ibuqPmHA=; b=TkedbTFWhR4Rsz
	Te4NfcIv2sAWzEPqtFT8Tas3OdzaLKimQkoaSioXzzPAX5vH2VsWF7Od2yTGEScSK3fYMnNWuvtqz
	haxpdoxNyWHSzkiUv6ewRTcpbosB22uRQCY/hrm6a47pY4jDK1HRL4R4sShPVyZx8KV2Bz7bVOU97
	g+0S4ROEMsJJFPperibr7OXv5MAtpxviXcViychr2Zt1IxCz3EvzreUpu8mEF17bWjPq5wIVArxlY
	/Vs6MX0ZqUasOGMjY+8pryA2AdGPn9NkV6IE5T/+VVtXNXYgRsogsf5KCf8TPUICdE8HnO8hHjnX2
	teCzx0JjBa0Yjpz0vWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSF-00Ap8g-2m;
	Mon, 09 Oct 2023 13:37:51 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSC-00Ap7X-1n
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 13:37:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BC651C0006;
	Mon,  9 Oct 2023 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696858665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkCQZu/Nd/vuyAyFTi/s+rMXbY5uaNGrEiZfBlkZy44=;
	b=Afj/PbQ9pWRNc10VdrvsO5jkIXl2QMdCRq06etXr+5cT/qasr+QemFcU5kOJnSuG2H694A
	6Qm9Yt5uEr8ggwpWR1E8DSzywTapQS9Hqgev8fCwNu1DK1OntXHjVIElPJTQ2emt5da3Ir
	wboupFF9YmgWQ8ycWt+uL1peuqv5EqKOyZ6M9AO6H4X0hJPDHeJCmXSm7BL42ZaTWQF8gt
	Cj4xkw0cJGQt06SruD8RLw+CASFdGHrY6jgxnDQRe4QHGFQe5VpC3oH5J/BLdhkBKH07jm
	3U8YrldUisz379uew+qCOqvVXAtNJpO0Q1mQfyGdloIpFjDpyFiGOYeaSAIejw==
Date: Mon, 9 Oct 2023 15:37:41 +0200
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
Message-ID: <20231009153741.5b04a137@xps-13>
In-Reply-To: <55a03e14-7a92-4cf0-82d4-5cbde64d69db@app.fastmail.com>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
	<20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
	<CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
	<e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
	<20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
	<20231009144610.4ff82afa@xps-13>
	<55a03e14-7a92-4cf0-82d4-5cbde64d69db@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063748_885415_7C919C86 
X-CRM114-Status: GOOD (  21.59  )
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

SGkgQXJuZCwKCmFybmRAYXJuZGIuZGUgd3JvdGUgb24gTW9uLCAwOSBPY3QgMjAyMyAxNTowMTox
NyArMDIwMDoKCj4gT24gTW9uLCBPY3QgOSwgMjAyMywgYXQgMTQ6NDYsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4gPj4gT24gTW9uLCBPY3QgMDksIDIwMjMgYXQgMTA6NDM6NDZBTSArMDIwMCwgQXJu
ZCBCZXJnbWFubiB3cm90ZTogIAo+ID4+ID4gT24gTW9uLCBPY3QgOSwgMjAyMywgYXQgMDk6MjIs
IE1hc2FoaXJvIFlhbWFkYSB3cm90ZTogICAgCj4gPj4gPiA+IE9uIE1vbiwgT2N0IDksIDIwMjMg
YXQgNTowMuKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+ID4gQ2FuIHdlIGluc3RlYWQgcXVlc3Rpb24gdGhlIHVzZSBvZiBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyX3Byb2JlKCk/ICAKPiA+IEkgZG9uJ3QgaGF2ZSB0aGUgaGlzdG9yeSBpbiBtaW5k
LCBidXQgd2h5IG5vdCBqdXN0IHN3aXRjaCB0byByZWd1bGFyCj4gPiBtb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyKCkgcmVnaXN0cmF0aW9uIGluc3RlYWQ/IEl0IHNlZW1zIGxpa2UgdGhlCj4gPiBvcmln
aW5hbCBhdXRob3JzIGp1c3QgZGlkIG5vdCBjYXJlIGFib3V0IHRoZSByZW1vdmUgcGF0aCBhbmQg
d2VyZQo+ID4gaGFwcHkgdG8gc2tpcCBpdHMgaW1wbGVtZW50YXRpb24uCj4gPgo+ID4gT24gbXRk
IGRldmljZXMgb25lIGNhbiBhcmd1ZSB0aGF0IHRoZSBmbGFzaCB1bmRlcmx5aW5nIHN0b3JlcyB0
aGUKPiA+IHJvb3RmcyBhbmQgdGh1cyBjYW5ub3QgYmUgcmVtb3ZlZCwgYnV0IEkgYmVsaWV2ZSB0
b2RheSB0aGlzIGlzIGEKPiA+IHF1ZXN0aW9uYWJsZSAoc29mdHdhcmUpIGRlc2lnbi4gIAo+IAo+
IEl0IHdhcyBjaGFuZ2VkIHRvIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKSBpbiBjb21t
aXQKPiAzYTJhMTNmYTkwMmQyICgibXRkOiB0eHg5bmRmbWM6IHVzZSBtb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyX3Byb2JlKCkiKQo+IHdpdGggYSBzaG9ydCBjaGFuZ2Vsb2cgdGV4dDoKPiAKPiBjb21t
aXQgM2EyYTEzZmE5MDJkMjMyYTFlNTY1ODI2NDdhZWQ2Y2IyNTkxMzQ5Ygo+IEF1dGhvcjogSmlu
Z29vIEhhbiA8amcxLmhhbkBzYW1zdW5nLmNvbT4KPiBEYXRlOiAgIFR1ZSBNYXIgNSAxMzozMToy
NCAyMDEzICswOTAwCj4gCj4gICAgIG10ZDogdHh4OW5kZm1jOiB1c2UgbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcl9wcm9iZSgpCj4gICAgIAo+ICAgICBUaGlzIHBhdGNoIHVzZXMgbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcl9wcm9iZSgpIG1hY3JvIHdoaWNoIG1ha2VzCj4gICAgIHRoZSBjb2RlIHNtYWxs
ZXIgYW5kIHNpbXBsZXIuCj4gICAgIAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKaW5nb28gSGFuIDxq
ZzEuaGFuQHNhbXN1bmcuY29tPgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBBcnRlbSBCaXR5dXRza2l5
IDxhcnRlbS5iaXR5dXRza2l5QGxpbnV4LmludGVsLmNvbT4KPiAgICAgU2lnbmVkLW9mZi1ieTog
RGF2aWQgV29vZGhvdXNlIDxEYXZpZC5Xb29kaG91c2VAaW50ZWwuY29tPgo+IAo+IEluc3RlYWQg
b2YganVzdCBzaW1wbGlmeWluZyB0aGUgY29kZSwgSSB0aGluayB0aGF0IHdhcyBhY3R1YWxseQo+
IGEgYnVnZml4IGJlY2F1c2UgaXQgcHJldmVudGVkIGJvdGggdGhlIHByb2JlIGFuZCByZW1vdmUg
Y2FsbGJhY2tzCj4gZnJvbSBnZXR0aW5nIGNhbGxlZCBhZnRlciBnZXR0aW5nIGRyb3BwZWQgKGRl
ZmVycmVkIHByb2JlIG9yCj4gdW5iaW5kL3JlYmluZCkuIFVzaW5nIG1vZHVsZV9wbGF0Zm9ybV9k
cml2ZXIoKSBpcyBwcm9iYWJseQo+IGV2ZW4gYmV0dGVyIGhlcmUsIGJ1dCB0aGVuIHdlIG5lZWQg
dG8gcmVtb3ZlIGJvdGggdGhlIF9faW5pdAo+IGFuZCBfX2V4aXQgYW5ub3RhdGlvbnMuCgpBZ3Jl
ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
