Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A585C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2r5AZYrTU0Kh0agB1+LoBZ4FfyaDi4SvqPEcXbsXnQQ=; b=kSZSvpqjP3CiD3
	my0mxDynneLaLfGoMspVcVVm/DUQGm5ug7QSfUHHXPiU+f3ap9i1fU4i9RrlD4rQv1rRiBh9hE16G
	QRJVY+Bt6K70/GrGm0APGOcUbp2dMOKc9RQNcmtF0UGZbTCjtZUiQIuHFZkrvgq4eVoLrU6IjUt88
	H5SVRcsVzYw8ygrRdOcn/9g/j/h8jWsvCQny1xVjb1H++F/yKZb7EIdKPFyoZmsSNOjIdyc8isXEF
	4SUZYriCsR+YBORcG8wwwquZVEAclVgHQgKDSm5mCyq1IXEPhhb0GDNnimxXCjhthUhzUQkmc204b
	GYjYTyEW5Ya2DSJ60AMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DP9-004mDl-2O; Mon, 05 Dec 2022 15:29:15 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DOk-004lmK-V8; Mon, 05 Dec 2022 15:28:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3246EE000D;
	Mon,  5 Dec 2022 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670254128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sP26xDjMNjXwN9L7mGsr9oYGyxwn1e1sH95nLFtr/6U=;
	b=NFwxKSWb+bCfZmD3rIdek9EVGn6gVCmbl53Rfox4SRaUt8DTVzdE/7NtOstE6+B3SN6Wk7
	ut75j/yWfvol1ezJrspcvTWXsKkt4opVBSRwFhysjS0xFqZgR+K8GiE+PFQ2mw0sTZUVEv
	kJpuY1HYEf93asulKEQXy5miw9vxHcntW5g7y4jo9KHahSco8pR+1Na5QlS43Ni1CTAAWl
	ytcF1bRzBH1nJcxhdse38vK/4AVZafQ2irWVOkUHRvCpj8LMNeOBHtTlcS6Dx0+ITx3dX5
	FI5GbyXhABGajLmk0B4W2EKzNcoG8W50SQaBjNpSi6otfyW2Q4d/elgurGiXrQ==
Date: Mon, 5 Dec 2022 16:28:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221205162844.5dc28b8b@xps-13>
In-Reply-To: <Y43WSCsvfnfbcMPQ@francesco-nb.int.toradex.com>
References: <20221202115327.4475d3a2@xps-13>
	<Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
	<20221202150556.14c5ae43@xps-13>
	<2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
	<20221202160030.1b8d0b8a@xps-13>
	<223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
	<20221202164904.08d750df@xps-13>
	<0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
	<20221202174255.2c1cb2ff@xps-13>
	<Y4ozwovVIVhQHHkn@francesco-nb.int.toradex.com>
	<Y43WSCsvfnfbcMPQ@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_072851_345118_68B2D95F 
X-CRM114-Status: GOOD (  24.12  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gTW9uLCA1IERlYyAy
MDIyIDEyOjMwOjE2ICswMTAwOgoKPiBIZWxsbyBNaXF1ZWwKPiAKPiBPbiBGcmksIERlYyAwMiwg
MjAyMiBhdCAwNjoyMDowMlBNICswMTAwLCBGcmFuY2VzY28gRG9sY2luaSB3cm90ZToKPiA+IE9u
IEZyaSwgRGVjIDAyLCAyMDIyIGF0IDA1OjQyOjU1UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6ICAKPiA+ID4gUGxlYXNlIGFsc28gZG8gaXQgd2l0aCB0aGUgTkFORCBjaGlwIGRlc2NyaWJl
ZC4gSWYsIHdoZW4gdGhlIE5BTkQgY2hpcAo+ID4gPiBpcyBkZXNjcmliZWQgVS1Cb290IHRyaWVz
IHRvIGNyZWF0ZSBwYXJ0aXRpb25zIGluIHRoZSBjb250cm9sbGVyIG5vZGUsCj4gPiA+IHRoZW4g
dGhlIHNpdHVhdGlvbiBpcyBldmVuIHdvcnNlIHRoYW4gSSB0aG91Z2h0LiBCdXQgSSBiZWxpZXZl
ICAKPiA+IAo+ID4gSXQncyBsaWtlIHRoYXQgZm9yIFUtQm9vdCBvbGRlciB0aGFuIHYyMDIyLjA0
IC4uLiBhbmQgSU1PIHdlIGNhbm5vdAo+ID4gaWdub3JlIGl0Lgo+ID4gCj4gPiBTYWlkIHRoYXQg
ZnJvbSB0aGUgY29kZSBVLUJvb3QgbG9va3MgaW50byBhIGBwYXJ0aXRpb257fWAgbm9kZSBvbmx5
IGFzIGEKPiA+IGRpcmVjdCBjaGlsZCBvZiB0aGUgbmFuZC1jb250cm9sbGVyLCBpZiB0aGVyZSBp
cyBhIG5hbmQtY2hpcCBpbiBiZXR3ZWVuCj4gPiB0aGUgbmFuZC1jb250cm9sbGVye30gYW5kIHRo
ZSBwYXJ0aXRpb25ze30gaXQgd2lsbCBqdXN0IGlnbm9yZSBpdC4KPiA+IAo+ID4gSSBjb3VsZCB0
cnkgdG8gc2VlIHdoYXQgaXQgaXMgZG9pbmcgZXhhY3RseSwgYnV0IEkgd291bGQgbmVlZCBhIGxp
dHRsZQo+ID4gYml0IG1vcmUgdGltZSwgSSBqdXN0IHRyaWVkIGNoYW5naW5nIHRoZSBEVFMgYXMg
d3JvdGUgSSBnb3QgYSBub24KPiA+IGJvb3RhYmxlIHN5c3RlbS4gIAo+IAo+IElmIEkgaGF2ZSBh
IG5hbmQtY2hpcCB7IHBhcnRpdGlvbnMge30gfSBkZXNjcmliZWQgaW4gdGhlIGR0cyBVLUJvb3QK
PiAoZXZlbiB0aGUgbGF0ZXN0IG9uZSkgaWdub3JlcyBpdCBhbmQgZ2VuZXJhdGVzIHRoZSBwYXJ0
aXRpb24gYXMgY2hpbGQgb2YKPiB0aGUgbmFuZCBjb250cm9sbGVyLCB0aGUgbGludXggcGFyc2Vy
IGhvd2V2ZXIgc2VlIHRoYXQgcGFydGl0aW9uc3t9Cj4gZXhpc3RzLCBldmVuIGlmIGVtcHR5LCBh
bmQgaWdub3JlIHRoZSBwYXJ0aXRpb24gZGlyZWN0bHkgZGVmaW5lZCBhcwo+IGNoaWxkIG9mIHRo
ZSBuYW5kIGNvbnRyb2xsZXIuCj4gCj4gVEw7RFI6IHBhcnNlciBmYWlscyBhbmQgYm9vdCBmYWls
cyBhY2NvcmRpbmcgdG8gdGhhdC4KClllYWggSSBnZXQgdGhhdC4gRm9yIG1lIHRoZSBsb25ndGVy
bSBnb2FsIHNob3VsZCBiZSB0byBqdXN0IGtpbGwgdGhhdApmdW5jdGlvbi4gV2UgaGF2ZSBwcm9w
ZXIgRFQgc3VwcG9ydCB0b2RheSwgTGludXgga25vd3MgaG93IHRvIHJlYWQgdGhlCm10ZHBhcnRz
IGNtZGxpbmUgdmFyaWFibGUsIHNvIHRoZXJlIGlzIG5vIG5lZWQgZm9yIGFueXRoaW5nIGVsc2Uu
IEkKZ3Vlc3MgaW4gVS1Cb290IHdlIHNob3VsZCBqdXN0OgotIHdhcm4gdXNlcnMgb2YgdGhpcyBm
dW5jdGlvbiB0aGF0IHRoZSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGFuZCB0aGV5CiAgc2hvdWxk
IHVwZGF0ZSB0aGVpciBtYWNoaW5lIHN1cHBvcnQKLSBqdXN0IG1pZ3JhdGUgdG8gYW5vdGhlciBz
b2x1dGlvbiBvbiB0aGUgY29saWJyaSBib2FyZAoKV2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
