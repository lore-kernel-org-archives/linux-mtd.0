Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E5DC3A59D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4KqQBOCTUid9eDRBWRQdRkgxHXQG0B5lsnboF23X3o=; b=CJLiaildQM07+2
	K2h9xTqacg2ylGIOHEF94lpnRTVWZs8afqiyFIjzwjafyKoXyIY9cMPzkQkibMw05jSLpA4ITjqtp
	R3n/AxlzggS4d1rghtWxcuhVqtTvxgzq68vl48AVppWF7QttMj+ad3p60WIK7kF1B5FAVFLjtRHWf
	UQeHqH9Md5GuvXLgTmUqM0vErmB/92KEKZGjAbKIVvRoDlnfMVpHZ+fJl9XBsKdxhiGx8OWZZcaR/
	3aA/7UHZcIhrL1UuMuPAIKix+jDx0mntccN5WZWnOiOIbdD7ChxF+E3MXHU5uzd7j/e2p5Yl206b7
	RKFY3Fgn2hdJFxblB9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsgY-0003Zn-Fs; Mon, 24 Oct 2022 08:19:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsgL-0003Um-39; Mon, 24 Oct 2022 08:19:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0A1CC0015;
	Mon, 24 Oct 2022 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666599572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RsqEFobdfsJRtGDvtqy+4TRi3reZeX3cMLi8uvmdLcY=;
	b=d0h7bSc2nXVRxjESjkDhnIoofW1xbyU1vXmWSVCrL/QG1B337LcN4oi1FQjU+V6RayoOW/
	GKwTh6RXECnaUN+1WqnYuTNXCXG7xKYe0OPL+ZiCyzig3uXoPbIr+yddHR+VsOgr4IwfPp
	BT+BdBqh3sq1dxhsb3om3KmrzpgR3W4uPEoRvDLFTHqsM81GID55zsIyNyYgm5gc3Dmxs8
	krZHxZsVtH5i4ODKchcu2PDTQiDNraysieaDDlSQz8Xg80RIxCw0b+CwN5if3j/M8coJmg
	KYM+TtKooSH80iHhlCz+jnLYAMFVtEp4mfjfHARe3u2c87f71ZnhYDpqXM9jZQ==
Date: Mon, 24 Oct 2022 10:19:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vadym Kochan <vadym.kochan@plvision.eu>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Elad Nachman <enachman@marvell.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Message-ID: <20221024101928.351ae15f@xps-13>
In-Reply-To: <a46c6a18-903d-2120-4876-509ce8ad19d5@linaro.org>
References: <20221021194552.683-1-vadym.kochan@plvision.eu>
	<20221021194552.683-2-vadym.kochan@plvision.eu>
	<a46c6a18-903d-2120-4876-509ce8ad19d5@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_011937_299907_54942062 
X-CRM114-Status: GOOD (  14.09  )
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

SGVsbG8sCgprcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmcgd3JvdGUgb24gU2F0LCAyMiBP
Y3QgMjAyMiAxMjoxODo0OSAtMDQwMDoKCj4gT24gMjEvMTAvMjAyMiAxNTo0NSwgVmFkeW0gS29j
aGFuIHdyb3RlOgo+ID4gU3dpdGNoIHRoZSBEVCBiaW5kaW5nIHRvIGEgWUFNTCBzY2hlbWEgdG8g
ZW5hYmxlIHRoZSBEVCB2YWxpZGF0aW9uLgo+ID4gCj4gPiBEcm9wcGVkIGRlcHJlY2F0ZWQgY29t
cGF0aWJsZXMgYW5kIHByb3BlcnRpZXMgZGVzY3JpYmVkIGluIHR4dCBmaWxlLgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBWYWR5bSBLb2NoYW4gPHZhZHltLmtvY2hhbkBwbHZpc2lvbi5ldT4KPiA+
IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9tdGQvbWFydmVsbCxuYW5kLWNvbnRyb2xsZXIueWFtbCB8
IDE5OSArKysrKysrKysrKysrKysrKysKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
bWFydmVsbC1uYW5kLnR4dCAgfCAxMjYgLS0tLS0tLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDE5OSBpbnNlcnRpb25zKCspLCAxMjYgZGVsZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbCxuYW5kLWNv
bnRyb2xsZXIueWFtbAo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwtbmFuZC50eHQKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbCxuYW5kLWNvbnRy
b2xsZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFydmVs
bCxuYW5kLWNvbnRyb2xsZXIueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uNTM1YjdmODkwM2M4Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwsbmFuZC1jb250cm9s
bGVyLnlhbWwKPiA+IEBAIC0wLDAgKzEsMTk5IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiAr
LS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbWFydmVsbCxu
YW5kLWNvbnRyb2xsZXIueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogTWFydmVsbCBOQU5EIEZs
YXNoIENvbnRyb2xsZXIgKE5GQykKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+IAo+IFRoaXMgc2hvdWxk
IGJlIHNvbWVvbmUgcmVzcG9uc2libGUgZm9yIGhhcmR3YXJlLCBub3Qgc3Vic3lzdGVtCj4gbWFp
bnRhaW5lci4gVW5sZXNzIGJ5IGNvaW5jaWRlbmNlIE1pcXVlbCBtYXRjaGVzIGJvdGguIDopCgpI
YWhhLCBhY3R1YWxseSBJIGRvIGJlY2F1c2UgSSByZXdyb3RlIHRoaXMgZHJpdmVyIGVudGlyZWx5
IGZldyB5ZWFycwphZ28uIEkgZG9uJ3QgYWN0aXZlbHkgbWFpbnRhaW4gdGhlc2UgcGxhdGZvcm1z
IGFueW1vcmUgYnV0IEkgZG9uJ3QgbWluZApiZWluZyBhc3NpZ25lZCBoZXJlIGlmIG5vYm9keSBl
bHNlIGNhcmVzLiBPdGhlcndpc2UgaW5kZWVkLCBWYWR5bQpvciBzb21lb25lIGVsc2UgZnJvbSBN
YXJ2ZWxsIGNhbiB0YWtlIG92ZXIsIEkgZG9uJ3QgbWluZC4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
