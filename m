Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697C2C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvYFbP5mMioengRMOkOI+3On5VXakmG7Nqgke6BdDUo=; b=XF0/OGfKHXcOXY
	RaM9uK5l+1gEJr/m9GeOW+Pt+544tFogXiUi/6RLqdI84kxgZuvvR/fSE+uY0s7m+MzBqOe8bVVOS
	rHAGwazgy0U2x1TK2ZNrJcd4io2ZL7wW47UIxe7jOMtrNBpV84huL0DYIfxLxmpo26zsJmhXZimN2
	lSNyY1XELusrvjpyzPJJFQ7D4u17m1YQ/LaBDkJ2/Ap4osP5PxKLqCEZ3oJeFZpGvwJOuyEtIscYp
	y+meO+ZwUsuIniNhNx9OdCCE42cMhlH0nHuHTQqOngatad7SzYNPCuPRtn/XHmBxUuLO1eBMa+sTu
	IX0fcAMMv6Bet4eGdLDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19U9-000EJh-Ut; Fri, 02 Dec 2022 17:06:02 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19Tm-000E8k-Dv; Fri, 02 Dec 2022 17:05:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5889C2000B;
	Fri,  2 Dec 2022 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670000732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1543kr1BA4zVd3F4HG1WX2ZdFskLZROQv8ZbH894QY=;
	b=bJtZ3brfsuLZSQYMU4sy32nmifcHeTf/6v1x+/CYbuJJI2X7aPsIPm/19mV2M9HZQP4D65
	fu44hQSe+aSJYv3KaBvqKrxW25O9O62XyAf/BQWc7laFGOuTHdR6zkWRAAMj+TvTOiDNhn
	ySYzOnSxKfYHMm3tqARzEaDKXkYF55u4qTk8W9drYoFqf+Mvf1xurkFCm3SkQGE2kCLXOL
	toa1diIN7oYoGXHGAQM/r1K3bYsS8kSvsRFdK52KCuKV0/dhdhOulj2L2jgt1DFjjGRd0K
	RRbw5pYhLDOp2dnSHiQDIKeZ1MKWeEa8Win6fzNtbdt/7ZVQWkLTu+T2BV6OAg==
Date: Fri, 2 Dec 2022 18:05:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221202180528.173ee343@xps-13>
In-Reply-To: <Y4orsUIp3Ffz8m+r@francesco-nb.int.toradex.com>
References: <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
	<Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
	<20221202115327.4475d3a2@xps-13>
	<Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
	<20221202150556.14c5ae43@xps-13>
	<2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
	<20221202160030.1b8d0b8a@xps-13>
	<223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
	<20221202164904.08d750df@xps-13>
	<0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
	<Y4orsUIp3Ffz8m+r@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_090538_828570_12F4DF4A 
X-CRM114-Status: GOOD (  29.61  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gRnJpLCAyIERlYyAy
MDIyIDE3OjQ1OjM3ICswMTAwOgoKPiBPbiBGcmksIERlYyAwMiwgMjAyMiBhdCAwNToxNzo1OVBN
ICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiA+IE9uIDEyLzIvMjIgMTY6NDksIE1pcXVlbCBS
YXluYWwgd3JvdGU6ICAKPiA+ID4gLCBub3QgdGhlIE5BTkQgY29udHJvbGxlciBub2RlLiBJIGhv
cGUgdGhpcwo+ID4gPiBpcyBjb3JyZWN0bHkgc3VwcG9ydGVkIGluIFUtQm9vdCB0aG91Z2guIFNv
IGlmIHRoZXJlIGlzIGEgTkFORCBjaGlwCj4gPiA+IHN1Ym5vZGUsIEkgc3VwcG9zZSBVLUJvb3Qg
d291bGQgdHJ5IHRvIGNyZWF0ZSB0aGUgcGFydGl0aW9ucyB0aGF0IGFyZQo+ID4gPiBpbnNpZGUs
IG9yIGV2ZW4gaW4gdGhlIHN1YiAicGFydGl0aW9ucyIgY29udGFpbmVyLiAgCj4gPiAKPiA+IE15
IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBVLUJvb3QgY2hlY2tzIHRoZSBuYW5kLWNvbnRyb2xsZXIg
bm9kZSBzaXplLWNlbGxzLAo+ID4gbm90IHRoZSBuYW5kLWNoaXB7fSBvciBwYXJ0aXRpb25ze30g
c3Vibm9kZSBzaXplLWNlbGxzIC4gIAo+IE5vdCAxMDAlIGNvcnJlY3QuCj4gCj4gIC0gVS1Cb290
IGJlZm9yZSB2MjAyMi4wNCB1cGRhdGVzIHRoZSBuYW5kLWNvbnRyb2xsZXJ7fSBub2RlLCBubyBt
YXR0ZXIgd2hhdC4KPiAgLSBVLUJvb3Qgc3RhcnRpbmcgZnJvbSB2MjAyMi4wNCBsb29rcyBmb3Ig
YHBhcnRpdGlvbnN7fWAgaW50byB0aGUKPiAgICBuYW5kLWNvbnRyb2xsZXJ7fSBub2RlLCBhbmQg
Y3JlYXRlcyB0aGUgcGFydGl0aW9uIGludG8gaXQgaWYgZm91bmQuCj4gICAgSWYgbm90IGZvdW5k
IGl0IGJlaGF2ZXMgdGhlIHNhbWUgd2F5IGFzIHRoZSBwcmV2aW91cyB2ZXJzaW9ucy4KPiAgICBT
ZWUgY29tbWl0IDM2ZmVlMmY3NjIxZSAoImNvbW1vbjogZmR0X3N1cHBvcnQ6IGFkZCBzdXBwb3J0
IGZvciAicGFydGl0aW9ucyIgc3Vibm9kZSB0byBmZHRfZml4dXBfbXRkcGFydHMoKSIpCj4gCj4g
SSdkIGxpa2UgdG8gc3RyZXNzIG9uY2UgbW9yZSB0aGUgZmFjdCB0aGF0IHdlIGNhbm5vdCBleHBl
Y3Qgb2xkIFUtQm9vdAo+IHRvIGJlIHVwZGF0ZWQgaW4gdGhlIGZpZWxkLCBhbmQgdGhleSB3aWxs
IGtlZXAgZ2VuZXJhdGluZyB0aGUgcGFydGl0aW9ucwo+IGFzIGNoaWxkIG9mIHRoZSBuYW5kLWNv
bnRyb2xsZXIgbm9kZSB3aGF0ZXZlciB3ZSBkbyB3aXRoIHRoZSBkdHMgZmlsZS4KPiAKPiBJIHRo
aW5rIHRoYXQgdGhpcyBzaG91bGQgYmUgdHJlYXRlZCB0aGUgc2FtZSB3YXkgYXMgYW55IG90aGVy
IGZpeHVwIHdlCj4gbWlnaHQgaGF2ZSBmb3IgYnJva2VuIGZpcm13YXJlLCBlc3BlY2lhbGx5IGNv
bnNpZGVyaW5nIHRoYXQgdGhpcyB1c2VkIHRvCj4gIndvcmsiICh5ZXMsIEkgY2FuIGFncmVlIHRo
YXQgaXQgaG9ycmlibGUsIGJ1dCBJIGNhbm5vdCBjaGFuZ2UgdGhlIHBhc3QpCj4gd2l0aG91dCBl
dmVuIGEgd2FybmluZyBzaW5jZSB0aGUgaW14NyBzdXBwb3J0IHdhcyBmaXJzdCBpbnRyb2R1Y2Vk
IGluCj4gdGhlIGxpbnV4IGtlcm5lbCB5ZWFycyBhZ28uCj4gCj4gPiBGcmFuY2VzY28sIGNhbiB5
b3UgcGxlYXNlIHNoYXJlIHRoZSBEVCwgaW5jbHVkaW5nIHRoZSBVLUJvb3QgZ2VuZXJhdGVkCj4g
PiBwYXJ0aXRpb25zLCB3aGljaCBpcyBwYXNzZWQgdG8gTGludXggb24gQ29saWJyaSBNWDcgPyBJ
IHRoaW5rIHRoYXQgc2hvdWxkCj4gPiBtYWtlIGFsbCBjb25mdXNpb24gZ28gYXdheS4gIAo+IAo+
IFRoZSBkZXZpY2UgdHJlZSBwYXJ0IGlzIGVhc3ksIGp1c3QKPiBhcmNoL2FybS9ib290L2R0cy9p
bXg3ZC1jb2xpYnJpLWV2YWwtdjMuZHRzLgo+IAo+IGFuZCB0aGUgbmFuZC1jb250cm9sbGVyIG5v
ZGUgaXMgY29taW5nIGZyb20KPiAKPiAjaW5jbHVkZSAiaW14N2QuZHRzaSIKPiAKPiBwbHVzCj4g
Cj4gJmdwbWkgewo+IAlmc2wsdXNlLW1pbmltdW0tZWNjOwo+IAluYW5kLWVjYy1tb2RlID0gImh3
IjsKPiAJbmFuZC1vbi1mbGFzaC1iYnQ7Cj4gCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4g
CXBpbmN0cmwtMCA9IDwmcGluY3RybF9ncG1pX25hbmQ+Owo+IH07Cj4gCj4gVGhlIHBhcnRpdGlv
bnMgbm9kZXMgYXJlIGdlbmVyYXRlZCAxMDAlIGJ5IFUtQm9vdCwgbm90aGluZyBpcyBwcmVzZW50
IGluCj4gdGhlIGR0cyBzb3VyY2UgZmlsZXMuCgpJIGhvcGUgaWYgeW91IHByb3ZpZGUgYSBOQU5E
IGNoaXAgY2hpbGQgbm9kZSwgdGhlIHBhcnRpdGlvbnMgYXJlIGNyZWF0ZWQKYXQgdGhlIHJpZ2h0
IGxvY2F0aW9uLCBvdGhlcndpc2UgdGhpcyBpcyBzbywgc28gd3JvbmcuLi4KCj4gCj4gV2l0aCB0
aGlzIERUUyBmaWxlIGFzIGlucHV0LCB3aGF0ZXZlciBVLUJvb3QgdmVyc2lvbiBpcyB1c2VkIEkg
aGF2ZSB0aGUKPiBmb2xsb3dpbmcgZ2VuZXJhdGVkOgo+IAo+IHJvb3RAY29saWJyaS1pbXg3LTAy
ODQ0MjMzOi8jIGxzIC9wcm9jL2RldmljZS10cmVlL3NvYy9uYW5kLWNvbnRyb2xsZXJAMzMwMDIw
MDAvCj4gI2FkZHJlc3MtY2VsbHMgICAgICAgICAgZG1hLW5hbWVzICAgICAgICAgICAgICAgbmFu
ZC1vbi1mbGFzaC1iYnQgICAgICAgcGluY3RybC0wCj4gI3NpemUtY2VsbHMgICAgICAgICAgICAg
ZG1hcyAgICAgICAgICAgICAgICAgICAgcGFydGl0aW9uQDAgICAgICAgICAgICAgcGluY3RybC1u
YW1lcwo+IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgIGZzbCx1c2UtbWluaW11bS1lY2MgICAgIHBh
cnRpdGlvbkAyMDAwMDAgICAgICAgIHJlZwo+IGFzc2lnbmVkLWNsb2NrcyAgICAgICAgIGludGVy
cnVwdC1uYW1lcyAgICAgICAgIHBhcnRpdGlvbkAzODAwMDAgICAgICAgIHJlZy1uYW1lcwo+IGNs
b2NrLW5hbWVzICAgICAgICAgICAgIGludGVycnVwdHMgICAgICAgICAgICAgIHBhcnRpdGlvbkA0
MDAwMDAgICAgICAgIHN0YXR1cwo+IGNsb2NrcyAgICAgICAgICAgICAgICAgIG5hbWUgICAgICAg
ICAgICAgICAgICAgIHBhcnRpdGlvbkA4MDAwMAo+IGNvbXBhdGlibGUgICAgICAgICAgICAgIG5h
bmQtZWNjLW1vZGUgICAgICAgICAgIHBoYW5kbGUKPiAKPiByb290QGNvbGlicmktaW14Ny0wMjg0
NDIzMzovIyBscyAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbmFuZC1jb250cm9sbGVyQDMzMDAyMDAw
L3BhcnRpdGlvbkAqCj4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL25hbmQtY29udHJvbGxlckAzMzAw
MjAwMC9wYXJ0aXRpb25AMDoKPiBsYWJlbCAgbmFtZSAgIHJlZwo+IAo+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9uYW5kLWNvbnRyb2xsZXJAMzMwMDIwMDAvcGFydGl0aW9uQDIwMDAwMDoKPiBsYWJl
bCAgICAgIG5hbWUgICAgICAgcmVhZF9vbmx5ICByZWcKPiAKPiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvbmFuZC1jb250cm9sbGVyQDMzMDAyMDAwL3BhcnRpdGlvbkAzODAwMDA6Cj4gbGFiZWwgIG5h
bWUgICByZWcKPiAKPiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbmFuZC1jb250cm9sbGVyQDMzMDAy
MDAwL3BhcnRpdGlvbkA0MDAwMDA6Cj4gbGFiZWwgIG5hbWUgICByZWcKPiAKPiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvbmFuZC1jb250cm9sbGVyQDMzMDAyMDAwL3BhcnRpdGlvbkA4MDAwMDoKPiBs
YWJlbCAgICAgIG5hbWUgICAgICAgcmVhZF9vbmx5ICByZWcKPiAKPiAKCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
