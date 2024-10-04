Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257DDCFA74F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqNlE0F5+PnP2KNTt+Tn0UXdbRBV6JRB4HK3Ic/xq4g=; b=vBUga+oUbGG5yR
	+CikbfwCXYDH+XBDcDE0jRhzIYo5iXNYXv2VC2iaeAXVHOt9m47bPkNkAA58Sn46FdDLn9q0eDWwl
	f3d6J6H1u9Xu8m7obg2yeuM/wE+zuvwcWVKe11LoPqsorNbzRpivzPEbUn67ShgsaY/e6cd1BsWZI
	VTCI0+/U7DIDlVTU/+8WOBGHI+lrdK0AGmRHH7MCtWC74F0Ckjqu/xGxbbYYFhApIWxN0D65aoBsf
	6SO5tXqzXqS2Njt7WTybC9gvwajKqrC8uDPztb6mAitzEJ2rRtaIqtshZP6Y/MwbrnpLpltImlgoW
	TpLq+5AxjsfGYyy/SX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swcdN-0000000BDG7-3mdV;
	Fri, 04 Oct 2024 07:21:53 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swcdK-0000000BDFM-0X1m
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 07:21:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B0B01BF205;
	Fri,  4 Oct 2024 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728026507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EB50ZWS7pX3weSaYhuDUsmGhx18VRAut/5Y88goDLAs=;
	b=T2s4OCbSOKMvGOHD6OxayLMLTxecMZym5OYdLujEe7H4xs0nCrgOAvHLLfNOa2GfC9cjWm
	0pNeenGg0ExLblVpsEvQOeLHb1QhZ3l1v8GxuN/VOyZ9lX6pUmnoJYtCX5YVNiGA/ycR51
	ShQINcdSv9RPwKw8QIzy6pI8TMh8iYxgRI/MHm8fWzKzmsYTgvQR+ma6mlA8Jsmbm55N4Q
	ffn/zyYmvXcPrdRFa5Xb0NkS+kJv5kURt2KxMKCz22acMTKuOfudWi5vMc7Gw8SlL+QeiH
	+w2l+R77SyZ/bz3JY0bKlpWDj8xk2w8zMEZJK5rsT8P0Gr04zosNtYL1Sh4Nnw==
Date: Fri, 4 Oct 2024 09:21:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241004092144.3e0d89b5@xps-13>
In-Reply-To: <20241003200508.x7tbf2lpbg6ngm7q@cozumel>
References: <20241002153944.69733-1-han.xu@nxp.com>
	<20241002153944.69733-2-han.xu@nxp.com>
	<20241003093840.2965be20@xps-13>
	<20241003150500.uz2efay7kadu47if@cozumel>
	<20241003172820.50324192@xps-13>
	<20241003200508.x7tbf2lpbg6ngm7q@cozumel>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_002150_772734_AE6A7E46 
X-CRM114-Status: GOOD (  21.24  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gVGh1LCAzIE9jdCAyMDI0IDE1OjA1OjA4
IC0wNTAwOgoKPiBPbiAyNC8xMC8wMyAwNToyOFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4g
SGkgSGFuLAo+ID4gCj4gPiBoYW4ueHVAbnhwLmNvbSB3cm90ZSBvbiBUaHUsIDMgT2N0IDIwMjQg
MTA6MDU6MTYgLTA1MDA6Cj4gPiAgIAo+ID4gPiBPbiAyNC8xMC8wMyAwOTozOEFNLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOiAgCj4gPiA+ID4gSGkgSGFuLAo+ID4gPiA+IAo+ID4gPiA+IGhhbi54dUBu
eHAuY29tIHdyb3RlIG9uIFdlZCwgIDIgT2N0IDIwMjQgMTA6Mzk6NDQgLTA1MDA6Cj4gPiA+ID4g
ICAgIAo+ID4gPiA+ID4gVGhlIGNvbW1pdCByZWZhY3RvcnMgdGhlIHBvd2VyIG1hbmFnZW1lbnQg
aGFuZGxpbmcgaW4gdGhlIGdwbWkgbmFuZAo+ID4gPiA+ID4gZHJpdmVyLiBJdCByZW1vdmVzIHJl
ZHVuZGFudCBwbV9ydW50aW1lIGNhbGxzIGluIHRoZSBwcm9iZSBmdW5jdGlvbiwKPiA+ID4gPiA+
IGhhbmRsZXMgdGhlIHBhZCBjb250cm9sIGluIHN1c3BlbmQgYW5kIHJlc3VtZSwgYW5kIG1vdmVz
IHRoZSBjYWxscyB0bwo+ID4gPiA+ID4gYWNxdWlyZSBhbmQgcmVsZWFzZSBETUEgY2hhbm5lbHMg
dG8gdGhlIHJ1bnRpbWUgc3VzcGVuZCBhbmQgcmVzdW1lCj4gPiA+ID4gPiBmdW5jdGlvbnMuICAg
IAo+ID4gPiA+IAo+ID4gPiA+IE1heSBJIGtub3cgdGhlIG1vdGl2YXRpb24gdG8gYWNxdWlyZSBh
bmQgcmVsZWFzZSB0aGUgRE1BIGNoYW5uZWxzCj4gPiA+ID4gZHVyaW5nIHN1c3BlbmQ/IEluIGdl
bmVyYWwgaXQgc2VlbXMgbGlrZSBhIGRpZmZlcmVudCBjaGFuZ2Ugd2hpY2ggSSdkCj4gPiA+ID4g
cHJlZmVyIHRvIHNlZSBpbiBpdHMgb3duIGNvbW1pdCB3aXRoIGEganVzdGlmaWNhdGlvbi4gVGhl
IHJlc3QgbG9va3MKPiA+ID4gPiBvayBvdGhlcndpc2UuICAgIAo+ID4gPiAKPiA+ID4gSGkgTWlx
dWVsLAo+ID4gPiAKPiA+ID4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBJTUhPIHRoZXJlIGlz
IG5vIG11Y2ggbG9naWMgY2hhbmdlcyBpbmRlZWQsIGp1c3QgbW92ZQo+ID4gPiB0aGUgZG1hIGNo
YW5uZWwgYWNxdWlyZSBhbmQgcmVsZWFzZSBmcm9tIHN5c3RlbSBwbSB0byB0aGUgcnVudGltZSBw
bSwgcmVsZWFzaW5nCj4gPiA+IHRoZSB1bnVzZWQgcmVzb3VyY2VzIGFzIGVhcmx5IGFzIHBvc3Np
YmxlLiBJZiB5b3UgdGhpbmsgaXQncyBuZWNlc3NhcnkgSSB3aWxsCj4gPiA+IHNwbGl0IHRoZSBw
YXRjaCBpbnRvIHR3byBwYXJ0cy4gIAo+ID4gCj4gPiBBY3R1YWxseSBJIGRvbid0IHVuZGVyc3Rh
bmQgd2h5IHRoZXNlIGNoYW5uZWxzIGFyZSByZWxlYXNlZCBhbmQKPiA+IGFjcXVpcmVkIGFnYWlu
LiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZG8gdGhhdCBpbiB0aGUgKHJ1bnRpbWUpCj4gPiBzdXNw
ZW5kL3Jlc3VtZSBwYXRoPyBJJ2QgYmUgaW4gZmF2b3Igb2YgYXZvaWRpbmcgdGhpcyBleHRyYQo+
ID4gY29uZmlndXJhdGlvbiB3aGljaCBhcyBhIGZpcnN0IHNpZ2h0IGRvZXMgbm90IHNlZW0gcmVx
dWlyZWQgaGVyZS4gIAo+IAo+IE91ciBsb2NhbCBteHMtZG1hIGRyaXZlciAod2lsbCB1cHN0cmVh
bSB0aGUgY2hhbmdlcyBsYXRlcikgaW1wbGVtZW50ZWQgdGhlIHJ1bnRpbWUKPiByZXN1bWUvc3Vz
cGVuZCBpbiBjaGFubmVsIGFsbG9jL3JlbGVhc2UgZnVuY3Rpb25zLCBzbyBJIGRpZCB0aGlzIGlu
IHRoZSBncG1pCj4gbmFuZCBkcml2ZXIgc3VzcGVuZC9yZXN1bWUgcGF0aC4KCkkgdGhpbmsgaXQg
bm8gbG9uZ2VyIG1ha2VzIHNlbnNlLiBSUE0gdGFrZXMgY2FyZSBvZiB0aGUKc3VwcGxpZXJzLCBh
dCBsZWFzdCBzaW5jZSBmd19kZXZsaW5rPXJwbS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
