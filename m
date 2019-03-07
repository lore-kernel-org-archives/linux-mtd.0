Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5533FC43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:10:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233E72081B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 13:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iG/pHfQw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233E72081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7YBIrrTyK/EAd+uKJ+RMg14nE8o6Kr9bbFHoSK6/Ck=; b=iG/pHfQwCDkSIL
	U1hUfIVkmzQUsWgrZ2RGofzeyUAjBDdcWv0NBsMFJM8+2Te2xafOPBaV9uvVJ5ZAyAP41YO7UFsIN
	ZbVh5Lf07N9bzgv3CeSAmtE/kFq3IlBngUB8VlSZXw/P+C6HxhbotzEJROr4U9BuFPwYmrI5CgBX1
	hzLmF319TnhuyTwFjxC2qwIwgywMUtwMtboohYcuEjzIXprtuqBnOMGSbC+68yhFYgnw3nSQvIExE
	v4LfH/3uGlZhHIatS/UZUMkRT6zsc4y2JrKaO3mH9OVIuBZrG9rRM8xgQnkJr7fH9gzwQevm+fp+S
	3II9A7PuXJQdZgj39W/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1snN-0007na-HF; Thu, 07 Mar 2019 13:10:45 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1snA-0007da-Mm; Thu, 07 Mar 2019 13:10:34 +0000
Received: from xps13 (aaubervilliers-681-1-31-179.w90-88.abo.wanadoo.fr
 [90.88.150.179]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9E43C100012;
 Thu,  7 Mar 2019 13:10:17 +0000 (UTC)
Date: Thu, 7 Mar 2019 14:09:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
Message-ID: <20190307140959.10092d45@xps13>
In-Reply-To: <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
 <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_051033_047255_8CF55BE2 
X-CRM114-Status: GOOD (  28.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPiB3cm90ZSBvbiBUdWUsCjUgTWFyIDIwMTkgMjM6MTI6NTEgKzAxMDA6Cgo+IEhpIExp
YW5nLAo+IAo+IE9uIE1vbiwgTWFyIDQsIDIwMTkgYXQgNTo1NSBBTSBMaWFuZyBZYW5nIDxsaWFu
Zy55YW5nQGFtbG9naWMuY29tPiB3cm90ZToKPiA+Cj4gPiBIZWxsbyBNYXJ0aW4sCj4gPgo+ID4g
T24gMjAxOS8zLzIgMjoyOSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZTogIAo+ID4gPiBIaSBM
aWFuZywKPiA+ID4KPiA+ID4gSSBhbSB0cnlpbmcgdG8gYWRkIHN1cHBvcnQgZm9yIG9sZGVyIFNv
Q3MgdG8gdGhlIG1lc29uLW5hbmQgZHJpdmVyLgo+ID4gPiBCYWNrIHdoZW4gdGhlIGRyaXZlciB3
YXMgaW4gZGV2ZWxvcG1lbnQgSSB1c2VkIGFuIGVhcmx5IHJldmlzaW9uIChvZgo+ID4gPiB5b3Vy
IGRyaXZlcikgYW5kIGRpZCBzb21lIG1vZGlmaWNhdGlvbnMgdG8gbWFrZSBpdCB3b3JrIG9uIG9s
ZGVyIFNvQ3MuCj4gPiA+Cj4gPiA+IE5vdyB0aGF0IHRoZSBkcml2ZXIgaXMgdXBzdHJlYW0gSSB3
YW50ZWQgdG8gZ2l2ZSBpdCBhbm90aGVyIHRyeSBhbmQKPiA+ID4gbWFrZSBhIHJlYWwgcGF0Y2gg
b3V0IG9mIGl0LiBVbmZvcnR1bmF0ZWx5IGl0J3Mgbm90IHdvcmtpbmcgYW55bW9yZS4KPiA+ID4K
PiA+ID4gQXMgZmFyIGFzIEkga25vdyB0aGUgTkZDIElQIGJsb2NrIHJldmlzaW9uIG9uIEdYTCBp
cyBzaW1pbGFyIChvciBldmVuCj4gPiA+IHRoZSBzYW1lPykgYXMgb24gYWxsIG9sZGVyIFNvQ3Mu
IEFzIGZhciBhcyBJIGNhbiB0ZWxsIG9ubHkgdGhlIGNsb2NrCj4gPiA+IHNldHVwIGlzIGRpZmZl
cmVudCBvbiB0aGUgb2xkZXIgU29DcyAod2hpY2ggaGF2ZSBhIGRlZGljYXRlZCBOQU5ECj4gPiA+
IGNsb2NrKToKPiA+ID4gLSB3ZSBkb24ndCBuZWVkIHRoZSAiYW1sb2dpYyxtbWMtc3lzY29uIiBw
cm9wZXJ0eSBvbiB0aGUgb2xkZXIgU29Dcwo+ID4gPiAgICBiZWNhdXNlIHdlIGRvbid0IG5lZWQg
dG8gc2V0dXAgYW55IG11eGluZyAoY29tbW9uIGNsb2NrIGZyYW1ld29yawo+ID4gPiAgICB3aWxs
IGRvIGV2ZXJ5dGhpbmcgZm9yIHVzKQo+ID4gPiAtICJyeCIgYW5kICJ0eCIgY2xvY2tzIGRvbid0
IGV4aXN0Cj4gPiA+IC0gSSBjb3VsZCBub3QgZmluZCBhbnkgb3RoZXIgZGlmZmVyZW5jZXMgYmV0
d2VlbiBNZXNvbjgsIE1lc29uOGIsCj4gPiA+ICAgIE1lc29uOG0yLCBHWEJCIGFuZCBHWEwKPiA+
ID4gIAo+ID4gVGhhdCBpcyByaWdodC4gdGhlIHNlcmlhbHMgTkZDIGlzIGFsbW9zdCB0aGUgc2Ft
ZSBleGNlcHQ6Cj4gPiAxKSBUaGUgY2xvY2sgY29udHJvbCBhbmQgc291cmNlIHRoYXQgTTgtc2Vy
aWFscyBhcmUgbm90IHNoYXJlIHdpdGggRU1NQy4KPiA+IDIpIFRoZSBiYXNlIHJlZ2lzdGVyIGFk
ZHJlc3MKPiA+IDMpIERNQSBlbmNyeXB0aW9uIG9wdGlvbiB3aGljaCB3ZSBkb24ndCBjYXJlIG9u
IE5GQyBkcml2ZXIuICAKPiBncmVhdCwgdGhhbmsgeW91IGZvciBjb25maXJtaW5nIHRoaXMhCj4g
Cj4gPiA+IEluIHRoaXMgc2VyaWVzIEknbSBzZW5kaW5nIHR3byBwYXRjaGVzIHdoaWNoIGFkZCBz
dXBwb3J0IGZvciB0aGUgb2xkZXIKPiA+ID4gU29Dcy4KPiA+ID4KPiA+ID4gVW5mb3J0dW5hdGVs
eSB0aGVzZSBwYXRjaGVzIGFyZSBjdXJyZW50bHkgbm90IHdvcmtpbmcgZm9yIG1lIChoZW5jZSB0
aGUKPiA+ID4gIlJGQyIgcHJlZml4KS4gSSBnZXQgYSAoc3RyYW5nZSkgY3Jhc2ggd2hpY2ggaXMg
dHJpZ2dlcmVkIGJ5IHRoZQo+ID4gPiBremFsbG9jKCkgaW4gbWVzb25fbmZjX3JlYWRfYnVmKCkg
LSBzZWUgYmVsb3cgZm9yIG1vcmUgZGV0YWlscy4KPiA+ID4KPiA+ID4gQ2FuIHlvdSBwbGVhc2Ug
aGVscCBtZSBvbiB0aGlzIG9uZT8gSSdkIGxpa2UgdG8ga25vdyB3aGV0aGVyOgo+ID4gPiAtIHRo
ZSBtZXNvbi1uYW5kIGRyaXZlciB3b3JrcyBmb3IgeW91IG9uIEdYTCBvciBBWEcgb24gbGludXgt
bmV4dD8KPiA+ID4gICAgKEkgd2FzIHJ1bm5pbmcgdGhlc2UgcGF0Y2hlcyBvbiB0b3Agb2YgbmV4
dC0yMDE5MDMwMSBvbiBteSBNOFMKPiA+ID4gICAgYm9hcmQgd2hpY2ggdXNlcyBhIDMyLWJpdCBN
ZXNvbjhtMiBTb0MuIEkgZG9uJ3QgaGF2ZSBhbnkgYm9hcmQgdXNpbmcKPiA+ID4gICAgYSBHWEwg
U29DIHdoaWNoIGFsc28gaGFzIE5BTkQpICAKPiA+IFllcywgaXQgd29ya3Mgb24gQVhHIHBsYXRm
b3JtIHVzaW5nIGEgTVhJQyBzbGMgbmFuZCBmbGFzaChNWDMwTEY0Ryk7IGJ1dAo+ID4gaSBhbiBu
b3Qgc3VyZSBpdCBydW5zIHRoZSBzYW1lIGZsb3cgd2l0aCB5b3Vycy4gYmVjYXVzZSBpIHNlZSB0
aGUgcHJpbnQKPiA+ICJDb3VubGQgbm90IGZpbmQgYSB2YWxpZCBPTkZJIHBhcmFtZXRlciBwYWdl
LCAuLi4uIiBpbiB5b3Vycy4gaSB3aWxsIHRyeQo+ID4gdG8gcmVwcm9kdWNlIGl0IG9uIEFYRyhp
IGRvbid0IGhhdmUgYSBNOCBwbGF0Zm9ybSBub3cpLiAgCj4gSSdtIGxvb2tpbmcgZm9yd2FyZCB0
byBoZWFyIGFib3V0IHRoZSB0ZXN0IHJlc3VsdHMgb24geW91ciBBWEcgYm9hcmRzCj4gZm9yIHJl
ZmVyZW5jZTogbXkgYm9hcmQgaGFzIGEgU0sgSHluaXggSDI3VUNHOFQyQiAoSUQgYnl0ZXM6IDB4
YWQgMHhkZQo+IDB4OTQgMHhlYiAweDc0IDB4NDQsIDIwbm0gTUxDKQo+IEkgaGF2ZSBhbm90aGVy
IGJvYXJkICh3aGVyZSBJIGhhdmVuJ3QgdGVzdGVkIHRoZSBORkMgZHJpdmVyIHlldCkgd2l0aAo+
IGEgU0sgSHluaXggSDI3VUNHOFQyRSAoSUQgYnl0ZXM6IDB4YWQgMHhkZSAweDE0IDB4YTcgMHg0
MiAweDRhLCAxWW5tCj4gTUxDKS4gaWYgaXQgaGVscHMgd2l0aCB5b3VyIGFuYWx5c2lzIEkgY2Fu
IHRlc3Qgb24gdGhhdCBib2FyZCBhcyB3ZWxsCgpMaWFuZywgeW91IGp1c3QgaGF2ZSB0byBmYWtl
IHRoZSBvdXRwdXQgb2YgdGhlIE9ORkkgcGFnZSBkZXRlY3Rpb24gYW5kCnlvdSB3aWxsIHByb2Jh
Ymx5IHJ1biBpbnRvIHRoaXMgZXJyb3Igd2hpY2ggd2lsbCB0aGVuIGJlIGVhc3kgdG8KcmVwcm9k
dWNlLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
