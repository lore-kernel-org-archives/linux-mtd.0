Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597EEC3DA7A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SehvsqOfK9Tgs9EUWaWvc12hCXtAJOkZO6ljsi/O5kM=; b=kWgtLHsCSjsw/T
	8JduBlkhj6/FUu28Wj1Ynjsr18cugiuBmurVR4Kl1tXSC1K9yEhE/0MXWIiHwRwBDevu+m2C+53u7
	9SN37utKDtdlCmrLIBnCBwSBKqQKdKruobZeiXpmRiOJYgEGVpDTJk2wxke1rOWQp/V4zVKMJGcj4
	ohmQyWjdjm4UeH2ScFp1VoglRfKfJBJ63eAjoQt11Ncdmliw3KL54pZmbLmNMg27mlwRBmUyelIhB
	k/pguuv+566kg87HgSvC6EAzM59smzvmeas2mbHfSDux7QYml6VHbqhzJMUdSNdfkVxQBha4lKDmP
	1N5PzFjeBSoSdo2PLgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXNF-00Erm1-IH; Thu, 05 Jan 2023 21:02:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUld-00DRJF-KY; Thu, 05 Jan 2023 18:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v/xznkGPQwTeG4bHpL4r891nCd3yrThL8ZKY9wDZ2Gg=; b=Dw+o2cYfn5XTGTpzviNC1bZJk9
	+QtTzqHf/0dYTVwGyiSoYVwd+QTx6PmTV8PTDn61alRXDXuCmCjs4bOn+iXDU2+nFUYH8UXK3Bltt
	W8mJOiunkDn9APMNcHSBmP76VH/3jKc46mlRG6b+6XNATdrzt5x9SaZhbYc/X5iTiZzWW7CraUbHR
	IeElh+yavz9dVg46AH+85j8Krm88QFXXoLE3h3O5HQ7tSQHaskO4Ys+Aes1Awa1rkaI1Oyqr3+/Ml
	vCsA1wvekg7wDv9bJGxWuZAxAmy1xxU7OMDZe9aVqoADiYO3vsuf2ujMgRH7+bfj+MVMN+HQqHdeg
	GwA03XFA==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDRlt-001PSe-2n;
	Thu, 05 Jan 2023 15:03:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7D41FC000E;
	Thu,  5 Jan 2023 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672930989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/xznkGPQwTeG4bHpL4r891nCd3yrThL8ZKY9wDZ2Gg=;
	b=jm8r0jcpx9x34cK+o7W8v2T7DRCCDzjb5jqDjKb8cUdEuGXvxPCM2fjJ/QGGmXbrstl0t6
	mIzIxPlje+6fAQ87uUcwvjLlwIEegJ3Wc8mY2yPkEDz9mEnO3xf14Cc47ewoGKpp/p/WJd
	JlrCIN3+y1UYHo87o0gYBpBV1TLXuKcohTuZW1s1V4gJpC3fCilyT0BBZfxz/fF0rvAU8Z
	6UU7OUeq2UIb2SOi/z78UKCeeL7Tyel+QZnds+ZqLGr/EKGujWz8aW1plyRbuZUiu1rtgl
	u0VDRwAGexIMfJjrsp35JLs6RU0JtFyhvc8JQQg+hENz+1/PIISx4adctv1zPg==
Date: Thu, 5 Jan 2023 16:03:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20230105160305.5b08f3e1@xps-13>
In-Reply-To: <f689c22c-dd93-8143-c730-2af4d472bd0f@denx.de>
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
	<6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
	<20221216120155.4b78e5cf@xps-13>
	<Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
	<20221216143720.3c8923d8@xps-13>
	<fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
	<20221216163501.1c2ace21@xps-13>
	<Y5ydGhn/qYUalamm@francesco-nb.int.toradex.com>
	<20230102104004.6abae6da@xps-13>
	<20230105123334.7f90c289@xps-13>
	<Y7bG7GFDMS6bmQ4d@francesco-nb.int.toradex.com>
	<f689c22c-dd93-8143-c730-2af4d472bd0f@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_150310_186277_A2638416 
X-CRM114-Status: GOOD (  26.78  )
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

Cm1hcmV4QGRlbnguZGUgd3JvdGUgb24gVGh1LCA1IEphbiAyMDIzIDE1OjUxOjEwICswMTAwOgoK
PiBPbiAxLzUvMjMgMTM6NDcsIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOgo+ID4gSGVsbG8gTWlx
dWVsLCAgCj4gCj4gSGksCj4gCj4gWy4uLl0KPiAKPiA+PiBMZXQncyBtb3ZlIGZvcndhcmQgd2l0
aCB0aGlzLiBMZXQncyBhc3N1bWUgbXkgZmVhcnMgYXJlIGJhc2VsZXNzLiBXZQo+ID4+IG1pZ2h0
IGNvbnNpZGVyIHRoZSBzaXR1YXRpb24gd2hlcmUgc29tZW9uZSB0cmllcyB0byBoaWRlIHRoZSBw
YXJ0aXRpb25zCj4gPj4gYnkgc2V0dGluZyAjc2l6ZS1jZWxsIHRvIDAgZXZlbiB3cm9uZ2VyIGFu
ZCB0b28gdW5saWtlbHkuIEhvcGVmdWxseSB3ZQo+ID4+IHdpbGwgbm90IGJyZWFrIGFueSBvdGhl
ciBleGlzdGluZyBzZXR1cHMgYnkgYXBwbHlpbmcgYW4gYWx3YXlzLW9uIGZpeC4gIAo+ID4gCj4g
PiBOaWNlLCBnb29kISAgCj4gCj4gSW5kZWVkCj4gCj4gPj4gSSB3b3VsZCBzdGlsbCBsaWtlIHRv
IHNlZSBVLUJvb3QgcGFydGl0aW9ucyBoYW5kbGluZyBldm9sdmUsIGF0IGxlYXN0Ogo+ID4+IC0g
Zml4ICNzaXplLWNlbGxzIGluIGZkdF9maXh1cF9tdGQoKQo+ID4+IC0gYXZvaWQgdGhlIGZkdF9m
aXh1cF9tdGQoKSBjYWxsIGZyb20gQ29sbGlicmkgYm9hcmRzIChpZS4gYW4gZXhhbXBsZQo+ID4+
ICAgIHRoYXQgY2FuIGJlIGZvbGxvd2VkIGJ5IHRoZSBvdGhlciB1c2VycykgIAo+ID4gCj4gPiBG
aW5lLCBJIGNhbiBkbyBpdC4KPiA+IAo+ID4gSG93ZXZlciBJIGFtIGp1c3Qgbm90IDEwMCUgc3Vy
ZSBhYm91dCB5b3VyIHByb3Bvc2FsLCBJIHdvbmRlciBpZiB3ZQo+ID4gc2hvdWxkIGp1c3QgZGVw
cmVjYXRlIHRoaXMgZnVuY3Rpb24gb3Igd2Ugc2hvdWxkIGZpeCBpdC4gIAo+IAo+IEkgd291bGQg
c2F5IGZpeCBpdC4KCldlbGwsIEkgdGhpbmsgdGhlc2UgYXJlIHR3byBvcnRob2dvbmFsIGNoYW5n
ZXMuIFRoZSBmdW5jdGlvbiBzaG91bGQgYmUKZGVwcmVjYXRlZCAqYW5kKiBmaXhlZCBmb3IgdGhl
IGV4aXN0aW5nIHVzZXJzPwoKPiA+IFRoZSBleGFjdCBlbmQgcmVzdWx0IHdpbGwgZGVwZW5kIG9u
IHRoZSBkaXNjdXNzaW9uIHdpdGggdGhlIFUtQm9vdAo+ID4gZm9sa3MsIGJ1dCBJIGFic29sdXRl
bHkgYWdyZWUgdGhhdCB0aGUgY3VycmVudCBzaXR1YXRpb24gbmVlZHMgdG8KPiA+IGNoYW5nZS4g
SSdsbCBrZWVwIHlvdSBpbiBDQyBvbiB0aG9zZSBwYXRjaGVzLgo+ID4gICAKPiA+PiBPbiBMaW51
eCBzaWRlIGxldCdzIGZpeCAjc2l6ZS1jZWxscyBsaWtlIHlvdSBwcm9wb3NlZCB3aXRob3V0IGZp
bHRlcmluZwo+ID4+IGFnYWluc3QgYSBsaXN0IG9mIGNvbXBhdGlibGVzLiBXZSBob3dldmVyIG5l
ZWQgdG8gaW1wcm92ZSB0aGUKPiA+PiBoZXVyaXN0aWNzOgo+ID4+IC0gRG8gaXQgb25seSB3aGVu
IHRoZXJlIGFyZSBwYXJ0aXRpb25zIGRlY2xhcmVkIHdpdGhpbiBhIE5BTkQKPiA+PiAgICBjb250
cm9sbGVyIG5vZGUuCj4gPj4gLSBDaGFuZ2UgdGhlIHdhcm5pbmcgdG8gYXZvaWQgbWVudGlvbmlu
ZyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCBqdXN0Cj4gPj4gICAgbWVudGlvbiB0aGlzIGlzIHV0
dGVybHkgd3JvbmcgYW5kIHRodXMgdGhlIHZhbHVlIHdpbGwgYmUgc2V0IHRvIDEKPiA+PiAgICBp
bnN0ZWFkIG9mIDAuCj4gPj4gLSBNZW50aW9uIGluIHRoZSBjb21tZW50IGFib3ZlIHRoaXMgb25s
eSB3b3JrcyBvbiBzeXN0ZW1zIHdpdGggPDRHaUIKPiA+PiAgICBjaGlwcy4KPiA+PiBJZiB5b3Ug
dGhpbmsgYWJvdXQgb3RoZXIgY29uZGl0aW9ucyBwbGVhc2UgZmVlbCBmcmVlIHRvIGFkZCB0aGVt
Lgo+ID4+Cj4gPj4gRG8geW91IGNvbmN1cj8gIAo+ID4gWWVzLCBJIGRvIGFncmVlLiAgCj4gCj4g
U2FtZSBoZXJlLCBhZ3JlZWQsIHRoYW5rcy4KPiAKPiBbLi4uXQoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
