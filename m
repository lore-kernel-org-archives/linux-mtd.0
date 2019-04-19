Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A70C282DF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:01:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931D1217FA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5FIZDys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931D1217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hz2Z/Vfw/kcKSiKrso8ckJHCC/prElMILE9kjUaYFhk=; b=g5FIZDysyB/5xo
	BFBAP77ClxATdvd+CvwBYwtCb23xhI6Niyd6gHkTKlKRaYKeVfndZO9veQj34D62B8MrCMzcIKniV
	/Ut6rCqEbbZ6fodADm20TGZAmuO7F9uKQqNeeiBwzPtXS5nIWXIIlCSyDPKg45OipO88YdmLGfPaa
	HsnfHgCnRfRahoyvG5jJqdSWpw5l+7rqVEERgdhv7A8NdInPpm57ROuraHBQAxsS8fgd6jeELWl4k
	8i2jUO3eJjTyoxNuDAHl3KgHP1grYIzGN7EQusSKEjAOAY5cO80L/0BodQWWdEYiiPaFnip6docRN
	UqbYB+nMEpFAgF0ziT4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHPOP-0008Ou-Bf; Fri, 19 Apr 2019 09:01:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHPOE-0008F7-Vl; Fri, 19 Apr 2019 09:01:00 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A093720011;
 Fri, 19 Apr 2019 09:00:46 +0000 (UTC)
Date: Fri, 19 Apr 2019 11:00:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 4/4] mtd: rawnand: meson: only initialize the RB
 completion once
Message-ID: <20190419110044.6a2d7d86@xps13>
In-Reply-To: <CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
 <20190411220056.19109-5-martin.blumenstingl@googlemail.com>
 <bd1900db-7ca1-a6e5-39f9-db54e0b570dd@amlogic.com>
 <CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_020059_326182_F3FDC97C 
X-CRM114-Status: GOOD (  22.27  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org,
 linux-amlogic@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4gd3JvdGUgb24gVGh1LAoxOCBBcHIgMjAxOSAyMTo0NDowNSArMDIwMDoKCj4g
SGkgTGlhbmcsCj4gCj4gT24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgODowNCBBTSBMaWFuZyBZYW5n
IDxsaWFuZy55YW5nQGFtbG9naWMuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4gT24gMjAxOS80LzEy
IDY6MDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6ICAKPiA+ID4gRG9jdW1lbnRhdGlvbi9z
Y2hlZHVsZXIvY29tcGxldGlvbi50eHQgc3RhdGVzOgo+ID4gPiAgICBDYWxsaW5nIGluaXRfY29t
cGxldGlvbigpIG9uIHRoZSBzYW1lIGNvbXBsZXRpb24gb2JqZWN0IHR3aWNlIGlzCj4gPiA+ICAg
IG1vc3QgbGlrZWx5IGEgYnVnIGFzIGl0IHJlLWluaXRpYWxpemVzIHRoZSBxdWV1ZSB0byBhbiBl
bXB0eSBxdWV1ZSBhbmQKPiA+ID4gICAgZW5xdWV1ZWQgdGFza3MgY291bGQgZ2V0ICJsb3N0IiAt
IHVzZSByZWluaXRfY29tcGxldGlvbigpIGluIHRoYXQgY2FzZSwKPiA+ID4gICAgYnV0IGJlIGF3
YXJlIG9mIG90aGVyIHJhY2VzLgo+ID4gPgo+ID4gPiBJbml0aWFsaXplIG5mYy0+Y29tcGxldGlv
biBpbiBtZXNvbl9uZmNfcHJvYmUgdXNpbmcgaW5pdF9jb21wbGV0aW9uIGFuZAo+ID4gPiBjaGFu
Z2UgdGhlIGNhbGwgaW4gbWVzb25fbmZjX3F1ZXVlX3JiIHRvIHJlaW5pdF9jb21wbGV0aW9uIHNv
IHRoZSBsb2dpYwo+ID4gPiBtYXRjaGVzIHdoYXQgdGhlIGRvY3VtZW50YXRpb24gc3VnZ2VzdHMu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMvbXRk
L25hbmQvcmF3L21lc29uX25hbmQuYyB8IDMgKystCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jCj4gPiA+IGluZGV4IDU3Y2M0YmQzZjY2NS4uZWE1N2RkY2VjNDFlIDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+ID4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPiA+IEBAIC00MDAsNyArNDAwLDcg
QEAgc3RhdGljIGludCBtZXNvbl9uZmNfcXVldWVfcmIoc3RydWN0IG1lc29uX25mYyAqbmZjLCBp
bnQgdGltZW91dF9tcykKPiA+ID4gICAgICAgY2ZnIHw9IE5GQ19SQl9JUlFfRU47Cj4gPiA+ICAg
ICAgIHdyaXRlbChjZmcsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NGRyk7Cj4gPiA+Cj4gPiA+
IC0gICAgIGluaXRfY29tcGxldGlvbigmbmZjLT5jb21wbGV0aW9uKTsKPiA+ID4gKyAgICAgcmVp
bml0X2NvbXBsZXRpb24oJm5mYy0+Y29tcGxldGlvbik7ICAKPiA+IFRlc3RlZC1ieTpMaWFuZyBZ
YW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29tPgo+ID4gQWNrZWQtYnk6IExpYW5nIFlhbmcgPGxp
YW5nLnlhbmdAYW1sb2dpYy5jb20+ICAKPiB0aGFuayB5b3UgZm9yIHJldmlld2luZyBhbmQgdGVz
dGluZyBteSBwYXRjaGVzIQo+IAo+IFsuLi5dCj4gPiBUZXN0ZWQtYnk6TGlhbmcgWWFuZyA8bGlh
bmcueWFuZ0BhbWxvZ2ljLmNvbT4KPiA+IEFja2VkLWJ5OiBMaWFuZyBZYW5nIDxsaWFuZy55YW5n
QGFtbG9naWMuY29tPiAgCj4gcGxlYXNlIGNvbnNpZGVyIHRoZSBmb2xsb3dpbmcgbm90ZSBmb3Ig
ZnV0dXJlIGNvZGUtcmV2aWV3czoKPiBtb3N0IG1haW50YWluZXJzIHRha2UgdGhlIHBhdGNoIGZy
b20gcGF0Y2h3b3JrIGFuZCBhcHBseSBpdCB0byB0aGVpciBnaXQgdHJlZS4KPiBob3dldmVyLCBw
YXRjaHdvcmsgaXMgbm90IHNtYXJ0IGVub3VnaCB0byBkZXRlY3Qgd2hlbiB0aGUgc2FtZQo+IFRl
c3RlZC1ieS9BY2tlZC1ieSBpcyBzZW50IG11bHRpcGxlIHRpbWVzLgo+IHRoaXMgcmVzdWx0cyBp
biB0aGUgc2FtZSBUZXN0ZWQtYnkvQWNrZWQtYnkgYmVpbmcgbGlzdGVkIG11bHRpcGxlCj4gdGlt
ZXMgaW4gdGhlIGZpbmFsIGNvbW1pdDogWzBdCj4gCj4gd2hhdCBJIGRvIGluc3RlYWQgaXMgdG8g
cmVwbHkgd2l0aCBvbmUgc2V0IG9mIFRlc3RlZC1ieS9BY2tlZC1ieQo+IChiZWxvdyB0aGUgYXV0
aG9yJ3MgU2lnbmVkLW9mZi1ieSkgd2hpY2ggaXMgdGhlbiB2YWxpZCBmb3IgdGhlIHdob2xlCj4g
cGF0Y2guCj4gVGhlcmUncyBubyBwcm9ibGVtIHRvIGhhdmUgVGVzdGVkLWJ5IGFuZCBBY2tlZC1i
eSBhdCB0aGUgc2FtZSB0aW1lLAo+IHRoZSBpc3N1ZSBvbmx5IHNob3dzIHVwIGlmIHlvdSBzZW5k
IEFja2VkLWJ5IChvciBhbnkgb3RoZXIgdGFnKSBmb3IKPiB0aGUgc2FtZSBwYXRjaCBtdWx0aXBs
ZSB0aW1lcy4KCkNyYXAsIEkgZGlkIG5vdCBub3RpY2VkIHRoYXQuCgpUaGFua3MgZm9yIHBvaW50
aW5nIGl0LiBJIGRvbid0IGhhdmUgdGltZSByaWdodCBub3cgdG8gZml4IGl0IGFuZCBzZW5kCmEg
bmV3IFBSLCBJJ2xsIHNlZSBpbiBvbmUgd2Vlay4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
