Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37504C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:08:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9AC61029
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED9AC61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIF+17BeWbMmmWckfmryjtRUADQj6YlRai+1gszLGmQ=; b=D0wNoaPkaiu5tE
	waWJQOgdF6TJf2qqAfzbTPtnY2TfbspqnqHNYD5RsDiVauecGF4k2kO20rv8foXwXH+PH+D2X4R6n
	FkWyScHKhjMjDELZ3dENeA6WZvVHZNGjy79E3AUcrugfp0x8qyUnDy9QFBKCmrFWIYltUYFG3KWOC
	50JVaQ4fYky7otTSSl7vlechjVp90hI7V4LJ4tCzCs9Bx0wcegruSGk2Txc9XKM/ebj0CgWNVMUrZ
	TJGwVeMXDmrzXelgOuZe0J8YCK6UD77e02RqDA2BIgSz71VIvdmNsTt1bHh58Qxq4DKOpPVR3LiQG
	9Mw7wNJ45HixiG0F4M5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYsPx-003QdV-8s; Fri, 08 Oct 2021 16:08:17 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYsPq-003QUw-Lk
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 16:08:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C69211C000E;
 Fri,  8 Oct 2021 16:07:53 +0000 (UTC)
Date: Fri, 8 Oct 2021 18:07:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>
Cc: Stefan =?UTF-8?B?UmllZG3DvGxsZXI=?= <S.Riedmueller@phytec.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211008180752.09f33896@xps13>
In-Reply-To: <6364938.4vTCxPXJkl@n95hx1g2>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211008152905.2fbdcce9@xps13> <20211008153631.3f1a09aa@xps13>
 <6364938.4vTCxPXJkl@n95hx1g2>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_090810_905076_4AE6C7B8 
X-CRM114-Status: GOOD (  25.57  )
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

SGkgQ2hyaXN0aWFuLAoKY2VnZ2Vyc0BhcnJpLmRlIHdyb3RlIG9uIEZyaSwgOCBPY3QgMjAyMSAx
NTo0OToyMSArMDIwMDoKCj4gT24gRnJpZGF5LCA4IE9jdG9iZXIgMjAyMSwgMTU6MzY6MzEgQ0VT
VCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IAo+ID4gbWlxdWVsLnJheW5hbEBib290bGluLmNv
bSB3cm90ZSBvbiBGcmksIDggT2N0IDIwMjEgMTU6Mjk6MDUgKzAyMDA6Cj4gPiAgIAo+ID4gPiAK
PiA+ID4gSWYgdGhpcyBjbG9jayAoYXMgSSB1bmRlcnN0YW5kKSBkb2VzIG5vdCBwcmV2ZW50IHVz
IHRvIGFjY2VzcyB0aGUKPiA+ID4gcmVnaXN0ZXJzIGJ1dCBvbmx5IGZlZWRzIHRoZSBleHRlcm5h
bCBOQU5EIGJ1cyBwYXJ0LCB0aGVuIHRoZXJlIGlzIG5vCj4gPiA+IG5lZWQgdG8gZW5hYmxlIGl0
IGluIHRoZSBwcm9iZSwganVzdCBhY3F1aXJpbmcgaXQgd2lsbCBiZSBlbm91Z2guICAKPiAKPiBj
bG9ja3NbMF0gaXMgImdwbWlfaW8iIHdoaWNoIHNvdW5kcyBtb3JlIGxpa2UgaS9vIHRoYW4gcmVn
aXN0ZXJzLiBTbyBsZXRzCj4gdHJ5IHRvIHJlbW92ZSB0aGUgaW5pdGlhbCBjYWxsIHRvIGNsa19z
ZXRfcmF0ZSgpLgo+IAo+ID4gPiBUaGVuLCB0aGUgZmlyc3QgY2FsbCBmb3IgYW4gSU8gb3BlcmF0
aW9uIHdpdGggLT5tdXN0X2FwcGx5X3RpbWluZ3MKPiA+ID4gc2hvdWxkOgo+ID4gPiAKPiA+ID4g
CWlmIChpbXg2KQo+ID4gPiAJCWRpc2FibGVfY2xrKCk7Cj4gPiA+IAo+ID4gPiAJY2xrX3NldF9y
YXRlKCk7Cj4gPiA+IAo+ID4gPiAJaWYgKGlteDYpCj4gPiA+IAkJZW5hYmxlX2NsaygpOyAgCj4g
Cj4gRG8geW91IHRoaW5rIHRoYXQgdGhlIG5lZWQgZm9yIGF2b2lkaW5nIGNsb2NrIGdsaXRjaGVz
IGlzIGkuTVg2IHNwZWNpZmljPwo+IFRoZSBlcnJhdGEgSSBtZW50aW9uZWQgaXMgc3BlY2lmaWMg
Zm9yIHRoZSBib290bG9hZGVyIHNvZnR3YXJlLCBidXQgKEkgdGhpbmspCj4gdGhlIHJlcXVpcmVt
ZW50IGZvciBzd2l0Y2hpbmcgb2ZmIHRoZSBjbG9ja3MgZ2F0ZXMgcHJpb3IgY2hhbmdpbmcgdGhl
IGRpdmlkZXJzCj4gbWF5IGFwcGx5IGFsc28gZm9yIG90aGVyIHNlcmllcy4KCkkgaG9uZXN0bHkg
ZG9uJ3Qga25vdywgcGVyaGFwcyBIYW4gaGF2ZSBtb3JlIGRldGFpbHMgYWJvdXQgaXQuIElmIHlv
dQp0aGluayBpdCdzIGEgd2lkZXIgaXNzdWUsIHRoZW4gd2UgY2FuIGp1c3QgZG8gdGhlIGRpc2Fi
bGUvZW5hYmxlIHN0ZXAKd2l0aG91dCBhbnkgZnVydGhlciBjaGVja3MuCgo+ID4gQWN0dWFsbHkg
d2Ugc2hvdWxkIGVuc3VyZSBjbGtzIGFyZSBlbmFibGVkIGluIHRoZSAhaW14NiBjYXNlIGFueXdh
eSwKPiA+IGJ1dCB0aGlzIGlzIG5lZWRlZCBvbmx5IG9uY2Ugc28gZWl0aGVyIHdlIGtlZXAgZW5h
YmxpbmcgdGhlIGNsb2NrIGluCj4gPiB0aGUgcHJvYmUgb3Igd2UgY2hlY2sgaGVyZSBpZiB0aGUg
Y2xrIGhhcyBhbHJlYWR5IGJlZW4gZW5hYmxlZCBvciBub3QuICAKPiBUaGUgY2xvY2tzIGFyZSBh
bHJlYWR5IGVuYWJsZWQgKGFuZCBrZXB0IG9uKSBpbiBwcm9iZS4gVGhlIGluaXRpYWwgY2FsbCB0
bwo+IGNsa19zZXRfcmF0ZSgpIGlzIGp1c3QgYWJvdmUgdGhpcyAoYnV0IHRoZSBjbG9ja3MgYXJl
IG5vdCBkaXNhYmxlZCBhdCB0aGlzCj4gc3RhZ2UgYXMgYWxsIGdhdGVzIGhhdmUgYmVlbiBlbmFi
bGVkIGJ5IHRoZSBib290IGxvYWRlcikuCgpUaGUgSU8gY2xvY2sgc2hvdWxkIGJlIGVuYWJsZWQg
YW5kIHNldCB0byBhIHBhcnRpY3VsYXIgcmF0ZSB0aGUgZmlyc3QKdGltZSB0aGUgZGllIGlzIHNl
bGVjdGVkIHRvIHBlcmZvcm0gYSBOQU5EIG9wZXJhdGlvbiwgb3Igd2hlbiB3ZSBzd2l0Y2gKZnJv
bSBvbmUgZGV2aWNlIHRvIHRoZSBvdGhlciAodGhpcyBkb2VzIG5vdCBhcHBseSB0byB0aGUgR1BN
SSBkcml2ZXIKZm9yIG5vdykuIFNvIHdlIGNhbiBkcm9wIHRoZSBlbmFibGUvc2V0X3JhdGUgY2Fs
bCBpbiB0aGUgcHJvYmUgaWYgdGhlCmFzc3VtcHRpb24gdGhhdCB0aGlzIGNsb2NrIG9ubHkgZmVl
ZHMgdGhlIGV4dGVybmFsIGJ1cyBpcyByaWdodC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
