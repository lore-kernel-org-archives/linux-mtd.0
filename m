Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E74CCF3183
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 20:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6o7ILhbg1RfM5aw+NDfIoXtAokGFr+1RjWbzUhEYKXA=; b=0SSTGyRnuNZR2A
	SSCgnEMbiBzwEQ0EaXvMp0LjEUPEO9yGaUsO6DL5oc/3dMUT97Xw6kocSyN1TzCbVHu9kyxpiE5fL
	QRDeoEUNdjzjeY7fi6EGrVoNkpHDaTQcgqQoch/2rfl1IdEsRjcP64L0WSjWO50HM1o0qPLpZaOEX
	LTIwiBIeGv6QhXTw2s5AqLs4/6U3TRT2tdbB5LbajnVA7rUoQfLN4QkMzS9QG6senB6kMCrlQhGtk
	qkm8mgkLYc3ahaC3uiSAwl2nCOuowNdvdm9BtuaG3v64LtYo/Jvn41hKJnaZGqnUQbxCs6YZvhJZM
	svMRUHE17BgTY8xnnYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjho-000000041aU-0JXX;
	Tue, 01 Oct 2024 20:42:48 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjgY-000000041QD-1Fi1;
	Tue, 01 Oct 2024 20:41:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4970240003;
	Tue,  1 Oct 2024 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727815287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4r1gnU2kI48G4bH3UKFvm7M16h9YIxfYz+Z1dmrAag=;
	b=OrJ4kNnTXAhNGXy3lhQzUWOhRp6lCm0BKAPPWoG8vc6fq5sV/c3FhS2ZNGXHRtH0wNx2fJ
	pZKO43QCAxvpHbWX/hBUJsFY2vDZxLFVWUD8+c2BS5MZ73HzNuAt8n2H0Awr8kaz8Dch40
	q4Qrjv13IZyEBlPpplH0hNWlWQlulMgYTfjHHfL71voBO5O74NQifNMF6lElI/gk8CUg1F
	yB3sqC1yhswITXGyxh41HoX8k9aEHg1XkH74k725aypNBmbsVKCoBLgyhCA7uhRSqzTrxF
	xpadLLjq46czvMAL8+w7+SH7LV2V0If8FS6sn/Pj+69evtvrFs0C8RSkKgXQHQ==
Date: Tue, 1 Oct 2024 22:41:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 nicolas.ferre@microchip.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: of atmel_pmecc_destroy_user
Message-ID: <20241001224125.032b2a1b@xps-13>
In-Reply-To: <Zvxdfh3FobjpvcRb@gallifrey>
References: <ZvmIvRJCf6VhHvpo@gallifrey>
	<20240930090817.0a86e538@collabora.com>
	<Zvxdfh3FobjpvcRb@gallifrey>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_134130_501097_D117A6AC 
X-CRM114-Status: GOOD (  23.58  )
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

SGksCgpsaW51eEB0cmVibGlnLm9yZyB3cm90ZSBvbiBUdWUsIDEgT2N0IDIwMjQgMjA6Mzc6MTgg
KzAwMDA6Cgo+ICogQm9yaXMgQnJlemlsbG9uIChib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bSkgd3JvdGU6Cj4gPiBIaSBEYXZpZCwKPiA+IAo+ID4gT24gU3VuLCAyOSBTZXAgMjAyNCAxNzow
NTowMSArMDAwMAo+ID4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxsaW51eEB0cmVibGlnLm9y
Zz4gd3JvdGU6Cj4gPiAgIAo+ID4gPiBIaSBCb3JpcyBhbmQgY28sCj4gPiA+ICAgT25lIG9mIG15
IHNjcmlwdHMgbm90aWNlZCB0aGF0ICdhdG1lbF9wbWVjY19kZXN0cm95X3VzZXInCj4gPiA+IGlz
bid0IGNhbGxlZCBhbnl3aGVyZTsgSSB3YXMgZ29pbmcgdG8gZGVsZXRlIGl0LCBidXQgaG1tLCBJ
IHdvbmRlcgo+ID4gPiBpZiBpdCdzIGFjdHVhbGx5IGEgbWlzc2luZyBjYWxsIGFuZCBsZWFraW5n
IChpbiB0aGUgdW5saWtlbHkgY2FzZQo+ID4gPiB0aGUgZGV2aWNlIHdhcyBldmVyIHJlbW92ZWQp
Lgo+ID4gPiAKPiA+ID4gSXQgd2FzIGFkZGVkIGJ5IHlvdXI6Cj4gPiA+ICAgY29tbWl0IGY4OGZj
MTIyY2MzNGMyNTQ1ZGVjOTU2MmVhYWIxMjE0OTRlNDAxZWYKPiA+ID4gICBBdXRob3I6IEJvcmlz
IEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPgo+ID4gPiAgIERhdGU6ICAgVGh1IE1h
ciAxNiAwOTowMjo0MCAyMDE3ICswMTAwCj4gPiA+IAo+ID4gPiAgICAgbXRkOiBuYW5kOiBDbGVh
bnVwL3Jld29yayB0aGUgYXRtZWxfbmFuZCBkcml2ZXIKPiA+ID4gCj4gPiA+IGFuZCBJIHNlZSB0
aGUgYWxsb2NhdGlvbiBpbjoKPiA+ID4gICAgICB1c2VyID0ga3phbGxvYyhzaXplLCBHRlBfS0VS
TkVMKTsKPiA+ID4gICAgICAgIGluCj4gPiA+ICAgICAgbmFuZC0+cG1lY2MgPSBhdG1lbF9wbWVj
Y19jcmVhdGVfdXNlcihuYy0+cG1lY2MsICZyZXEpOwo+ID4gPiAgICAgICAgY2FsbGVkIGluIGF0
bWVsX25hbmRfcG1lY2NfaW5pdAo+ID4gPiAgICAgICAgICBmcm9tIGF0bWVsX25hbmRfZWNjX2lu
aXQKPiA+ID4gICAgICAgICAgICBmcm9tIGF0bWVsX2hzbWNfbmFuZF9lY2NfaW5pdAo+ID4gPiAg
Cj4gPiA+IEJ1dCBJIGRvbid0IHNlZSBhbnkgZnJlZWluZy4KPiA+ID4gCj4gPiA+IChJIGRvbid0
IGtub3dpbmdseSBoYXZlIGhhcmR3YXJlIHRvIHRlc3QgYSBmaXgsIGFsdGhvdWdoIEkgZ3Vlc3MK
PiA+ID4gdGhlcmUncyBwcm9iYWJseSBvbmUgc29tZXdoZXJlLi4uLikKPiA+ID4gCj4gPiA+IFN1
Z2dlc3Rpb25zPyAgCj4gPiAKPiA+IFRoZXJlJ3MgZGVmaW5pdGVseSBhIGxlYWsuIEkgaGF2ZW4n
dCBsb29rZWQgYXQgTkFORCBzdHVmZiBmb3IgYSB3aGlsZQo+ID4gdGhvdWdoLCBzbyBJJ2xsIGxl
dCBNaXF1ZWwgYWR2aXNlIHlvdSBvbiB3aGVyZQo+ID4gYXRtZWxfcG1lY2NfZGVzdHJveV91c2Vy
KCkgc2hvdWxkIGJlIGNhbGxlZC4gIAo+IAo+IEkgc2VlIE1pcXVlbCBoYXMgcG9zdGVkIGEgZml4
Lgo+IAo+IFRoYW5rcyB0byBib3RoIG9mIHlvdSEKCkxvb2tzIGxpa2UgeW91J3ZlIGJlZW4gdG9v
IGZhc3QgOikgSSB3YXMgd2FpdGluZyBmb3IgdGhlIGxvcmUKbGluayB0byBiZSBhdmFpbGFibGUs
IHNvIHllcywgSSBsb29rZWQgaW50byBpdCBhbmQgZGVjaWRlZCB0byBmaXggaXQKdGhpcyB3YXk6
CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDEwMDEyMDMxNDkuMzg3NjU1
LTEtbWlxdWVsLnJheW5hbEBib290bGluLmNvbS9ULyN1CgpUaGFua3MgZm9yIHRoZSByZXBvcnQs
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
