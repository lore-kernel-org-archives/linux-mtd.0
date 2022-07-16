Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EBBC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFoFpbSibwATAHrUI7kRypFdtUnUKKnBAp3GHZpjMfo=; b=TNXC9jLhZBrmO2Lv1CSC1C2fjK
	Mdx9F7ZdECVv5NQcEob9eGOkaWt3yQF23mAeSjoVvFAg32uAlaFEOikZYrP/wojzYH9QFNMWXCaMu
	nWlB3C/WBnNTAMBzcMVdxHJYPPPhJEUe0EDoxkgrWCMWo+NdOB9iqZdwvmb2gXhbL8bIiX0hiYNUc
	BybbiB/Qr15SwSCjIhpOTXc6PpOQC1ryCOXGykPzP2XMnsk5ZylVNkPYg5CvFR+afdn/iK5B/JRDY
	08m7F7OAI/2TBBtKGu7OGlFYQvMZtEr+S/5GdGb9CknJW9JtIY5wvnXDNV/KD7Kq5qFARIIhYGOC4
	ZeZtZhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCeN1-00F6ba-OI; Sat, 16 Jul 2022 09:45:56 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCeLy-00F5zz-Jh; Sat, 16 Jul 2022 09:44:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 9411622239;
	Sat, 16 Jul 2022 11:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657964688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFmP/Rr8fzwWcTss+FmGkFnGfEeJujXpyOeGsJcQUTA=;
	b=s8conBUmb9JGXwwVjZrki9huq/w0u3VoszbNJxKt88UipHZLbE53o3m38UfYtUEqqcUjlj
	Kzdux7F7BY49G1fPWWBtkG/QJC0ADnQF11Na7M6UiZluRGFsCFMxvErZnwr5jSN/uscV2M
	QDqvc8ORq4lWyHiBi3LgKVTs+nIQbnU=
MIME-Version: 1.0
Date: Sat, 16 Jul 2022 11:44:48 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-sunxi@lists.linux.dev, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
In-Reply-To: <20220716093850.GL17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
 <20220714220744.GF17705@kitsune.suse.cz>
 <20220715092017.2ftoyzm22i4amrbt@ti.com>
 <20220716082027.GK17705@kitsune.suse.cz>
 <c6955eed3a445f4b87920fe0d47e7230@walle.cc>
 <20220716093850.GL17705@kitsune.suse.cz>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <50ec7bf33d8eca5eb68a079f7bcc12b7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_024450_848165_1F9C4286 
X-CRM114-Status: GOOD (  29.35  )
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

QW0gMjAyMi0wNy0xNiAxMTozOCwgc2NocmllYiBNaWNoYWwgU3VjaMOhbmVrOgo+IE9uIFNhdCwg
SnVsIDE2LCAyMDIyIGF0IDExOjMwOjEyQU0gKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+
IEFtIDIwMjItMDctMTYgMTA6MjAsIHNjaHJpZWIgTWljaGFsIFN1Y2jDoW5lazoKPj4gCj4+ID4g
PiBTbyBpZiBEVCBzYXlzIHRoZXJlIGlzbid0IGEgZmxhc2ggb24gYSBzcGVjaWZpYyBDUyB3aGVu
IHRoZXJlIGlzLCB0aGVuCj4+ID4gPiBEVCBzaG91bGQgYmUgZml4ZWQgdG8gZGVzY3JpYmUgdGhl
IGZsYXNoLCBhbmQgdGhlbiB3ZSBjYW4gcHJvYmUgaXQuCj4+ID4gPiBZb3UKPj4gPiA+IGJvdGgg
c2VlbSB0byBiZSBzYXlpbmcgdGhlIHNhbWUgdGhpbmcgaGVyZSwgYW5kIEkgYWdyZWUuCj4+ID4K
Pj4gPiBUaGUgZGlzYWdyZWVtZW50IGlzIGFib3V0IHRoZSBzaXR1YXRpb24gd2hlbiB0aGVyZSBp
cyBzb21ldGltZXMgYSBmbGFzaAo+PiA+IGNoaXAuCj4+IAo+PiBOby4gVGhlIGRpc2FncmVlbWVu
dCBpcyB3aGF0IHNob3VsZCBoYXBwZW4gaWYgdGhlIERUIHNheXMgdGhlcmUgaXMKPj4gYSBkZXZp
Y2UgYnV0IHRoZXJlIGlzbid0LiBXaGljaCByaWdodCBub3cgaXMgYW4gZXJyb3IgYW5kIGl0IHNo
b3VsZAo+PiBzdGF5IHRoYXQgd2F5LiBZb3VyIGhhcmR3YXJlIGRlc2NyaXB0aW9uIHNheXMgdGhl
cmUgaXMgYSBmbGFzaAo+PiBidXQgaXQgY2Fubm90IGJlIHByb2JlZCwgc28gaXQgaXMgYW4gZXJy
b3IuIFdoYXQgYWJvdXQgYSBib2FyZAo+PiB3aGljaCBoYXMgYW4gYWN0dWFsIGVycm9yIGFuZCB0
aGUgZmxhc2ggaXNuJ3QgcmVzcG9uZGluZz8gWW91Cj4+IHRyYWRlIG9uZSB1c2UgY2FzZSBmb3Ig
YW5vdGhlci4KPiAKPiBBbmQgd2hhdCBpZiB5b3UgaGF2ZSBhIFNBVEEgY29udHJvbGxlciB3aXRo
IGEgYmFkIGNhYmxlPwo+IAo+IE9yIGEgYmFkIGNvbm5lY3Rpb24gdG8gYSBtbWMgY2FyZD8KCkFn
YWluLiBZb3UgZG9uJ3QgdGVsbCB0aGUga2VybmVsIHZpYSB0aGUgRFQgdGhhdCB0aGVyZSBpcyBh
bgpNTUMgY2FyZCBub3IgdGhhdCB0aGVyZSBpcyBhIFNBVEEgU0RELiBJbiBjb250cmFzdCB0byBT
UEktTk9SLi4KCgo+IFRoZW4gdGhlIGtlcm5lbCBhbHNvIGRvZXMgbm90IHNheSB0aGVyZSBpcyBh
biBlcnJvciBhbmQgc2ltcGx5IGRvZXMgbm90Cj4gc2VlIHRoZSBkZXZpY2UuCj4gCj4gVGhpcyBp
cyBub3JtYWwuIE5vdCBhbGwgZGV2aWNlcyB0aGF0IGNhbiBwb3RlbnRpYWxseSBleGlzdCBkbyBl
eGlzdC4gSXQKPiBpcyB1cCB0byB0aGUgdXNlciB0byBkZWNpZGUgaWYgaXQncyBhbiBlcnJvciB0
aGF0IHRoZSBkZXZpY2UgaXMgCj4gbWlzc2luZy4KPiAKPj4gQWxzbyBJJ3ZlIGxvb2tlZCBhdCB0
aGUgUEhZIHN1YnN5c3RlbSBhbmQgdGhlcmUsIGlmIGEgUEhZIGlzIGRlc2NyaWJlZAo+PiBpbiB0
aGUgRFQgYnV0IGlzbid0IHRoZXJlLCB0aGUgZm9sbG93aW5nIGVycm9yIHdpbGwgYmUgcHJpbnRl
ZDoKPj4gICBkZXZfZXJyKCZtZGlvLT5kZXYsICJNRElPIGRldmljZSBhdCBhZGRyZXNzICVkIGlz
IG1pc3NpbmcuXG4iLCAKPj4gYWRkcik7Cj4+IAo+PiBBbmQgdGhhdCBpcyBmb3IgYSBidXMgd2hp
Y2ggY2FuIGV2ZW4gYmUgYXV0b21hdGljYWxseSBiZQo+PiBwcm9iZWQvZGV0ZWN0ZWQuCj4gCj4g
SWYgdGhlcmUgaXMgbm8gdXNlIGNhc2UgZm9yIGhhdmluZyBhIGNhcmQgd2l0aCB1bnBvcHVsYXRl
ZCBQSFkgdGhlbiBpdAo+IG1ha2VzIHNlbnNlLgo+IAo+IEhlcmUgd2UgZG8gaGF2ZSBhIHVzZSBj
YXNlIHNvIHRoZSBjb21wYXJpc29uIGlzIG1vb3QuCgpBbmQgd2hhdCB1c2UgY2FzZSBpcyB0aGF0
PyBZb3UgYXJlIGp1c3QgZGVtb3RpbmcgYW4gZXJyb3IKdG8gYW4gaW5mby4gQXBwYXJlbnRseSB5
b3UganVzdCB3YW50IHRvIHNlZSB0aGF0IGVycm9yCmdvIGF3YXksIHRoZXJlIGlzIG5vIGNoYW5n
ZSBpbiBmdW5jdGlvbmFsaXR5LgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
