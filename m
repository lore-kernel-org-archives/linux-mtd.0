Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B71EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ng2qRmf0Q2frlSkTWpOziN/us974NN2cu8wtR5ZNB/E=; b=q0cgKZQ5h6Xrlm
	DEFfJ5w43sCjyts9+/yMfL6iqLra8iqEyNxIvZaQQrxZRusAp7003jm+IswUMcedFKIlfd13hmP6S
	vI8rhfWAkTUxlS8tzuMC9kRfGBfz4CZnQZXm6yHlmYTHUJZhx+nC/7WhupsEjc5aJgwk/aTaQR96m
	+3yhvfSihbnQ6kS2GmtKlnWArhLjl8cpnO2V5w8oRNXn+M8rPOHNW3oWvkneaIyDW1ZoLXXtskLlP
	PmgFLvdISr+orjF2RjoIKaePvmOMdkxWY6cnQbXwDMgCS9xDYHhHtGFzP5Hjd6W1fiifnEF+nT5HH
	p1mG3c6HNkX1OCr1wizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Rj-006JTa-0D;
	Wed, 19 Jul 2023 08:22:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Rg-006JQQ-0v
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 08:22:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B0DFF80C;
	Wed, 19 Jul 2023 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689754918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dO+vQrrCceEFDyEQtm8OXxg1Cq6dk1JQ7jljD73KA3s=;
	b=PqvPEnllHTq2GNV0ZfkVQrnSLO/1w8f7QcsuoUkWdBGt1yj0xqU3pYhn2tcsBVDZG+DBhZ
	NU6PaC2C8rxy2RF0R2WHAQMPLXYCS7IDYCGmzUMWKBT04TE9Wc/Dpy1xKGbYjX7lTWxIAL
	c+qBGMXEIX6iXsZvdJ94z33vtKkR+9uSUILq6l1BEDIjJRT2iY/iSTw5IBBkKNnqhBzBxm
	UD8FAKCI5vL3niWvwyOxOUmoef/yX+6OWCdEUqOZUqPxdU7mKHRJMY9NWz0rB+92SEawQ9
	iVwuDNZHYnOoAuyFZjknlkY0/SHGtE6EGQCPQri5n2nLdsHYN4sDermvaH4NXA==
Date: Wed, 19 Jul 2023 10:21:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Message-ID: <20230719102153.2ef93cfe@xps-13>
In-Reply-To: <yw1xy1jdxqot.fsf@mansr.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>
	<20230716174917.3a9ca7a7@xps-13>
	<yw1x7cqzzr4d.fsf@mansr.com>
	<20230717091900.52ed815a@xps-13>
	<yw1x351mznr0.fsf@mansr.com>
	<20230717183645.32ef90b0@xps-13>
	<yw1xy1jdxqot.fsf@mansr.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_012204_589489_2C357DE5 
X-CRM114-Status: GOOD (  25.00  )
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

SGkgTcOlbnMsCgptYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBUdWUsIDE4IEp1bCAyMDIzIDE1OjAz
OjE0ICswMTAwOgoKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cml0ZXM6Cj4gCj4gPiBIaSBNw6VucywKPiA+Cj4gPiBtYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBN
b24sIDE3IEp1bCAyMDIzIDE0OjExOjMxICswMTAwOgo+ID4gIAo+ID4+IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoKPiA+PiAgIAo+ID4+ID4gU28sIEkg
c2hvdWxkIGhhdmUgZG9uZSB0aGF0IGVhcmxpZXIgYnV0LCBjb3VsZCB5b3UgcGxlYXNlIHNsb3cg
dGhlCj4gPj4gPiB3aG9sZSBvcGVyYXRpb24gZG93biwganVzdCB0byBzZWUgaWYgdGhlcmUgaXMg
c29tZXRoaW5nIHdyb25nIHdpdGggdGhlCj4gPj4gPiB0aW1pbmdzIG9yIGlmIHdlIHNob3VsZCBs
b29rIGluIGFub3RoZXIgZGlyZWN0aW9uLgo+ID4+ID4KPiA+PiA+IE1heWJlIHlvdSBjb3VsZCBh
ZGQgYSBib29sZWFuIHRvIGZsYWcgaWYgdGhlIGxhc3QgQ01EIHdhcyBhCj4gPj4gPiBSRUFEQ0FD
SEVTRVEsIFJFQURDQUNIRVNUQVJUIG9yIFJFQURDQUNIRUVORCwgYW5kIGlmIHRoZSBmbGFnIGlz
Cj4gPj4gPiB0cnVlLCBwbGVhc2UgZ2V0IHRoZSBqaWZmaWVzIGJlZm9yZSBhbmQgYWZ0ZXIgZWFj
aCB3YWl0cmR5IGFuZAo+ID4+ID4gZGVsYXlfbnMuIEZpbmFsbHksIHBsZWFzZSBwcmludCB0aGUg
ZXhwZWN0ZWQgZGVsYXkgYW5kIHRoZSBhY3R1YWwgb25lCj4gPj4gPiBhbmQgY29tcGFyZSB0byBz
ZWUgaWYgc29tZXRoaW5nIHdhcyB0b28gZmFzdCBjb21wYXJlZCB0byB3aGF0IHdlCj4gPj4gPiBl
eHBlY3RlZC4gICAgCj4gPj4gCj4gPj4gQmV0d2VlbiB3aGljaCBwb2ludHMgZXhhY3RseSBzaG91
bGQgdGhlIGRlbGF5IGJlIG1lYXN1cmVkPyAgQWxzbywgdGhlcmUKPiA+PiBpcyBubyBjb21tYW5k
IGNhbGxlZCBSRUFEQ0FDSEVTVEFSVC4gIERpZCB5b3UgbWVhbiBSRUFEU1RBUlQgb3IKPiA+PiBz
b21ldGhpbmcgZWxzZT8gIAo+ID4KPiA+IFllYWgsIHdoYXRldmVyIGNvbW1hbmQgaXMgc3BlY2lm
aWMgdG8gc2VxdWVudGlhbCBjYWNoZSByZWFkczoKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMj
TDEyMTgKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2Uv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMjTDEyMjggIAo+IAo+IEknbSBzdGlsbCBu
b3Qgc3VyZSB3aGF0IGV4YWN0bHkgeW91IHdhbnQgdG8gbWUgbWVhc3VyZS4gIFRoZSB3YWl0cmR5
IGFuZAo+IG5kZWxheSBjb21iaW5lZCwgZWFjaCBzZXBhcmF0ZWx5LCBvciBzb21ldGhpbmcgZWxz
ZT8KPiAKCkkgd291bGQgbGlrZSB0byBrbm93LCBob3cgbXVjaCB0aW1lIHdlIHNwZW5kIHdhaXRp
bmcgaW4gYm90aCBjYXNlcy4gSXMKdGhlcmUgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlICJ3YWl0
IHJlYWR5Ij8gQXMgd2UgY2Fubm90IG9ic2VydmUgdGhlCnRpbWluZ3Mgd2l0aCBhIHNjb3BlLCBi
ZWNhdXNlIHdlIGFyZSB1c2luZyBhICJzb2Z0IiBjb250cm9sbGVyCmltcGxlbWVudGF0aW9uIHNv
bWVob3csIHdlIGNhbiBlYXNpbHkgbWVhc3VyZSBob3cgbXVjaCB0aW1lIHdlCnNwZW5kIGluIGVh
Y2ggb3BlcmF0aW9uIGJ5IG1lYXN1cmluZyB0aGUgdGltZSBiZWZvcmUgYW5kIGFmdGVyLgoKVGhl
c2UgaW5mb3JtYXRpb24gYXJlIG9ubHkgdXNlZnVsIHdoZW4gd2UgYXJlIGRvaW5nIG9wZXJhdGlv
bnMgcmVsYXRlZAp0byBzZXF1ZW50aWFsIHJlYWRzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
