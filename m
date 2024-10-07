Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D69CFB43F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKfjT8qz4DlizCHukHTqp9T2J/hwFkZXSmcmtwKzF1c=; b=cqF2MKGCUQceKd
	d98Fr638N+v+0cpFN+v+iOw+TYdlPvjbDHhu74GRTKPd5rJTtjkAQSHe9xa03o8pGlnCqA9XtdEge
	9Dow3CenqEzNhMDWu7ot2goi0nt+qMw9u/JPdfBQTaXghxdABbT+G9w0ALM1/As5bQCYm2cGX7xVL
	1cM+TVdLj7RjSFXaJNimAfeZSqz1K1vBT02etCZSHJpSa7fvJGp9QWv77NL7NRy9mDvPQ2my2Of8y
	5DSSZFWeyot/kkQzUvYz+f2iMl/QBY2bDaYd+Le+YJ2ey0Ac9O+ezb2JesNUxMvqTPPIDEvCNXBn1
	f6NY7YZ6pI9EgC+T5/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkPc-00000001xuO-0Jf7;
	Mon, 07 Oct 2024 09:52:20 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkPZ-00000001xt8-0HZ5
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 09:52:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F378B40009;
	Mon,  7 Oct 2024 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728294733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDiPinINBvr6bJAxMdyt3dgUnwijd1daj//Q8bC6Vds=;
	b=SKga1kwR5GAKPcVI05WN/Vo904GPfbFLRsmuoMPVqB1AYvGwUlfDCXu7IVXRR2sLrkgTen
	/XPxAzviHAcavd65dJGk1QGf6DZ4H+hdHF4t6aSoJqe7IOqKAuRpdc6hn9wNj6/RlpJQEl
	ohl2xj/4fatcsrb+szOdNHPC3b9Hs22hyCHznRPoo/iE/v+vgLPDkRrszX2mbfCSlfNgwu
	fruIRjFZwxZR+QjftdpWXLOuIAs3effI3HmLDYDdPUgxE9PQl6CWoQ8iM3wkptSPBqstXm
	pLVkg8UPTr2+weIjd4PJ5tmNi667E1lRVFypKqXW7qiVuJxlXKrfH1MJmK+zwQ==
Date: Mon, 7 Oct 2024 11:52:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241007115211.0ad33fda@xps-13>
In-Reply-To: <20241004092144.3e0d89b5@xps-13>
References: <20241002153944.69733-1-han.xu@nxp.com>
	<20241002153944.69733-2-han.xu@nxp.com>
	<20241003093840.2965be20@xps-13>
	<20241003150500.uz2efay7kadu47if@cozumel>
	<20241003172820.50324192@xps-13>
	<20241003200508.x7tbf2lpbg6ngm7q@cozumel>
	<20241004092144.3e0d89b5@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_025217_601970_39312578 
X-CRM114-Status: GOOD (  23.43  )
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

SGkgTWlxdWVsLAoKbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBGcmksIDQgT2N0
IDIwMjQgMDk6MjE6NDQgKzAyMDA6Cgo+IEhpIEhhbiwKPiAKPiBoYW4ueHVAbnhwLmNvbSB3cm90
ZSBvbiBUaHUsIDMgT2N0IDIwMjQgMTU6MDU6MDggLTA1MDA6Cj4gCj4gPiBPbiAyNC8xMC8wMyAw
NToyOFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+IEhpIEhhbiwKPiA+ID4gCj4gPiA+
IGhhbi54dUBueHAuY29tIHdyb3RlIG9uIFRodSwgMyBPY3QgMjAyNCAxMDowNToxNiAtMDUwMDoK
PiA+ID4gICAgIAo+ID4gPiA+IE9uIDI0LzEwLzAzIDA5OjM4QU0sIE1pcXVlbCBSYXluYWwgd3Jv
dGU6ICAgIAo+ID4gPiA+ID4gSGkgSGFuLAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBoYW4ueHVAbnhw
LmNvbSB3cm90ZSBvbiBXZWQsICAyIE9jdCAyMDI0IDEwOjM5OjQ0IC0wNTAwOgo+ID4gPiA+ID4g
ICAgICAgCj4gPiA+ID4gPiA+IFRoZSBjb21taXQgcmVmYWN0b3JzIHRoZSBwb3dlciBtYW5hZ2Vt
ZW50IGhhbmRsaW5nIGluIHRoZSBncG1pIG5hbmQKPiA+ID4gPiA+ID4gZHJpdmVyLiBJdCByZW1v
dmVzIHJlZHVuZGFudCBwbV9ydW50aW1lIGNhbGxzIGluIHRoZSBwcm9iZSBmdW5jdGlvbiwKPiA+
ID4gPiA+ID4gaGFuZGxlcyB0aGUgcGFkIGNvbnRyb2wgaW4gc3VzcGVuZCBhbmQgcmVzdW1lLCBh
bmQgbW92ZXMgdGhlIGNhbGxzIHRvCj4gPiA+ID4gPiA+IGFjcXVpcmUgYW5kIHJlbGVhc2UgRE1B
IGNoYW5uZWxzIHRvIHRoZSBydW50aW1lIHN1c3BlbmQgYW5kIHJlc3VtZQo+ID4gPiA+ID4gPiBm
dW5jdGlvbnMuICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE1heSBJIGtub3cgdGhlIG1vdGl2
YXRpb24gdG8gYWNxdWlyZSBhbmQgcmVsZWFzZSB0aGUgRE1BIGNoYW5uZWxzCj4gPiA+ID4gPiBk
dXJpbmcgc3VzcGVuZD8gSW4gZ2VuZXJhbCBpdCBzZWVtcyBsaWtlIGEgZGlmZmVyZW50IGNoYW5n
ZSB3aGljaCBJJ2QKPiA+ID4gPiA+IHByZWZlciB0byBzZWUgaW4gaXRzIG93biBjb21taXQgd2l0
aCBhIGp1c3RpZmljYXRpb24uIFRoZSByZXN0IGxvb2tzCj4gPiA+ID4gPiBvayBvdGhlcndpc2Uu
ICAgICAgCj4gPiA+ID4gCj4gPiA+ID4gSGkgTWlxdWVsLAo+ID4gPiA+IAo+ID4gPiA+IFRoYW5r
cyBmb3IgeW91ciBjb21tZW50cy4gSU1ITyB0aGVyZSBpcyBubyBtdWNoIGxvZ2ljIGNoYW5nZXMg
aW5kZWVkLCBqdXN0IG1vdmUKPiA+ID4gPiB0aGUgZG1hIGNoYW5uZWwgYWNxdWlyZSBhbmQgcmVs
ZWFzZSBmcm9tIHN5c3RlbSBwbSB0byB0aGUgcnVudGltZSBwbSwgcmVsZWFzaW5nCj4gPiA+ID4g
dGhlIHVudXNlZCByZXNvdXJjZXMgYXMgZWFybHkgYXMgcG9zc2libGUuIElmIHlvdSB0aGluayBp
dCdzIG5lY2Vzc2FyeSBJIHdpbGwKPiA+ID4gPiBzcGxpdCB0aGUgcGF0Y2ggaW50byB0d28gcGFy
dHMuICAgIAo+ID4gPiAKPiA+ID4gQWN0dWFsbHkgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGVz
ZSBjaGFubmVscyBhcmUgcmVsZWFzZWQgYW5kCj4gPiA+IGFjcXVpcmVkIGFnYWluLiBEb2VzIGl0
IG1ha2Ugc2Vuc2UgdG8gZG8gdGhhdCBpbiB0aGUgKHJ1bnRpbWUpCj4gPiA+IHN1c3BlbmQvcmVz
dW1lIHBhdGg/IEknZCBiZSBpbiBmYXZvciBvZiBhdm9pZGluZyB0aGlzIGV4dHJhCj4gPiA+IGNv
bmZpZ3VyYXRpb24gd2hpY2ggYXMgYSBmaXJzdCBzaWdodCBkb2VzIG5vdCBzZWVtIHJlcXVpcmVk
IGhlcmUuICAgIAo+ID4gCj4gPiBPdXIgbG9jYWwgbXhzLWRtYSBkcml2ZXIgKHdpbGwgdXBzdHJl
YW0gdGhlIGNoYW5nZXMgbGF0ZXIpIGltcGxlbWVudGVkIHRoZSBydW50aW1lCj4gPiByZXN1bWUv
c3VzcGVuZCBpbiBjaGFubmVsIGFsbG9jL3JlbGVhc2UgZnVuY3Rpb25zLCBzbyBJIGRpZCB0aGlz
IGluIHRoZSBncG1pCj4gPiBuYW5kIGRyaXZlciBzdXNwZW5kL3Jlc3VtZSBwYXRoLiAgCj4gCj4g
SSB0aGluayBpdCBubyBsb25nZXIgbWFrZXMgc2Vuc2UuIFJQTSB0YWtlcyBjYXJlIG9mIHRoZQo+
IHN1cHBsaWVycywgYXQgbGVhc3Qgc2luY2UgZndfZGV2bGluaz1ycG0uCgpKdXN0IHRvIGJlIGNs
ZWFyLCB5b3UgY2FuIHNlbmQgdjMgYWRkcmVzc2luZyBGcmFuaydzIGNvbW1lbnQgYW5kIGp1c3QK
a2VlcCB0aGUgRE1BIGNoYW5uZWxzIGhhbmRsaW5nIGFzIGl0IGlzLCBidXQgcGxlYXNlIHdvcmsg
b24gcmVtb3ZpbmcKdGhpcyBoYWNrIG9mIGRyb3BwaW5nL2FsbG9jYXRpbmcgRE1BIGNoYW5uZWxz
IGluIHN1c3BlbmQvcmVzdW1lIHBhdGgsIGl0CmlzIHJlYWxseSBub3Qgd29ydGggdGhlIHRyb3Vi
bGUgYW5kIHB1cmVseSB1c2VsZXNzIHdpdGggYW55IHJlY2VudAprZXJuZWwuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
