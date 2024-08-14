Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F239C3DA4A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nohw8asx4eBMm8sYML6c6rA8JD34nU6gUOT0oyHQY1E=; b=XUlTgwJWiyU9LK
	yacdWOF/KX31a8Av5peZoHmOF8zpJaC5v7yP1/bsnrZaxfoOJrEbtMgIZrnQ3KhnOzGAjHy+TBtba
	M49FeDRfL4yy1yeTaa8X3VZsWTDbkZkGMGGTrwYL/kVxYXjvyddcM1Z+l0f8vlA44EKpiONtEgpFg
	2QF/biOouddMeTzpYxr+r32IbL1X3hLCOQrS5L2O4WfBcoO864OF9HutDO8D0lbPy6jYns/MhYYUf
	ISRLs3C1Ow5DBugAmkB/xjGYeMqHxt/nViSuFhheb5InrhVRoUapy3FCAvQ2+q0us/Mdka5zIPEbS
	lHzNHbqUI2XBWakS+cVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se8BZ-000000060li-30ku;
	Wed, 14 Aug 2024 07:12:45 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se8BU-000000060lD-26Uv
	for linux-mtd@lists.infradead.org;
	Wed, 14 Aug 2024 07:12:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02A6C20004;
	Wed, 14 Aug 2024 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723619555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16gfSaJyvSElILzmaEHedrernnbdYU+elxoghkD0Kvo=;
	b=WLDyz8AVmcmRVLH4/IFsyuHIwRxU+xykoppb2BwV7B7lBpBhCDg6niv6GEEBULDECJeRnn
	+Lq4gnSdHq9W0+CmCfedfQeJ67NQaQDMCd5GB2Adce4o/MOSiHdFVJB8DjPaWz/0VVHCRM
	Q3lq3I4s7wGcu4ckj1cjdz5MgiHqNpQYJoRkqsRZPkd4K5rvEfNJxJLykx+VOYQy45Z6mc
	Vh4eBxUDrINY7YOH+IaMfku6iStV3DhFIQVv5c/1Uam1ldukxmeOaIgo99AxLCc41usAva
	gGE2OuYkynLz96PJpm+mZmp2Ezrqrf/vDV284Ktlz4Xr8ELtNZOJCh2SgbYkEA==
Date: Wed, 14 Aug 2024 09:12:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240814091231.1d9525be@xps-13>
In-Reply-To: <20240809-smuggler-patrol-067003f0ba9b@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
	<20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
	<20240808-backyard-unglue-3cf429ad8da5@spud>
	<CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
	<20240809-smuggler-patrol-067003f0ba9b@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_001241_162644_C5BC0A27 
X-CRM114-Status: GOOD (  17.36  )
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

SGksCgo+ID4gPiBXaGVuIEkgZmlyc3QgcmVhZCAibmZjIiBoZXJlIEkgdGhvdWdodCBpdCB3YXMg
YSBjb3B5LXBhc3RlIG1pc3Rha2UsIGFzCj4gPiA+ICJuZmMiIGlzIGEgdGVjaG5vbG9neSBvZiBp
dCdzIG93bi4gSSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHJlbmFtZQo+ID4gPiB0byAi
bG9vbmdzb24sbHMxYi1uYW5kLWNvbnRyb2xsZXIiIGV0YyB0byByZW1vdmUgdGhhdCBzb3J0IG9m
IGNvbmZ1c2lvbi4KPiA+ID4gVGhlc2UgZGV2aWNlcyBtaWdodCBub3QgaW1wbGVtZW50IE5GQywg
YnV0IHdoYXQncyB0byBzYXkgdGhhdCBhIGZ1dHVyZQo+ID4gPiBkZXZpY2Ugd2lsbCBub3Q/CgpJ
IGJlbGlldmUgdGhlIG5mYyAoYWxzbywgbmMpIGFiYnJldmlhdGlvbiBwcmUtZGF0ZXMgdGhlIE5G
QyBzcGVjLiBCdXQgSQphZ3JlZSwgaXQgbWF5IGJlIG1pc2xlYWRpbmcuIEV2ZW4gdGhvdWdoIEkg
ZG9uJ3QgZm9yZXNlZSBhbnkgTkFORApjb250cm9sbGVyIHdpdGggTkZDIGNvbWluZywgaXQncyBw
cm9iYWJseSBiYWQgZm9yIG5ld2NvbWVycy9wZW9wbGUgd2hvCmFyZSBub3QgYWxyZWFkeSBkZWVw
bHkgaW50byB0aGUgbXRkIGRldGFpbHMgdG8gdXNlIHRoZXNlIGNvbmZ1c2luZwpsZXR0ZXJzLCBl
c3BlY2lhbGx5IGluIGEgYmluZGluZy4KClNvLCBBY2suCgo+ID4gU29ycnkgZm9yIHRoZSBjb25m
dXNpb24uCj4gPiBUaGUgc3RyaW5nICJsb29uZ3NvbixsczFiLW5hbmQtY29udHJvbGxlciIgbWln
aHQgYmUgdG9vIGxvbmcuICAKPiAKPiBJdCAibWlnaHQiPyBXaHkgZG8geW91IHRoaW5rIGl0IGlz
IHRvbyBsb25nPwoKWWVhaCwgd2h5IHdvdWxkIGl0IGJlIHRvbyBsb25nPyBMZXQncyBjYWxsIGEg
Y2F0IGEgY2F0LiBUaGlzIGlzIGEKY29tcGF0aWJsZSBmb3IgYSBOQU5EIGNvbnRyb2xsZXIuIFNv
IEkgZXhwZWN0IHRoZSBzdHJpbmcgdG8gbWVudGlvbgppdCdzIGEgTkFORCBjb250cm9sbGVyIGJl
Y2F1c2UgaXQncyBjbGVhcmVyLiBGb3IgcXVpdGUgc29tZSB0aW1lIHRoZXJlCmhhcyBiZWVuIGEg
Y29uZnVzaW9uIGJldHdlZW4gdGhlIE5BTkQgY29udHJvbGxlciBhbmQgdGhlIE5BTkQKZmxhc2gv
Y2hpcCwgYnV0IHRoZXNlIGFyZSB0d28gZGlmZmVyZW50IGhhcmR3YXJlIGNvbXBvbmVudHMuCgo+
ID4gTWF5IEkgcmVuYW1lIGl0IHRvICJsb29uZ3NvbixsczFiLW5hbmQiPyAgCgpGb3IgdGhlIGFi
b3ZlIHJlYXNvbiwgbm8gOikKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
