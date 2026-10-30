Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62345606A320
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dQfwXnKr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBz8u1oN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ma0WVVF4WMxLRsCaPsYuQs5INELhoi5GlWiKKRVxJNY=; b=dQfwXnKr2yMNcw7F24XbtDwiRs
	obrNCrj/RCcvu0L7JIJW0Nrz0pITSKBODaRJ/rpc4qcj5o5LjFSHnpJwoHbd8DuW31NTFoKH9s1JA
	tu+riuyJEbmoBYKZvj+s3gUE5qHOv3fVSvHPnEotriiTIIpYaFu1SaQe9yAHTqzuXjpHEXUyO1wh0
	SOFOAoIrIxgsxB8vga4pSQGfc7upMXALA66qyxV55bUnf2iRFEuoW8+oubd7tnadbu8pk4FbjV6qX
	z/iF5lhyd/SS1btFw+q2DresHjo0dfKUGfIxi2iMpEj510D1yeERSzwJD2CEh7hfCFvfn0nLMvbpL
	HxflUvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqlZ-0000000CJb2-1GPW;
	Fri, 30 Oct 2026 17:51:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqlX-0000000CJZb-1icB
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:51:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBCEA4170B;
	Fri, 30 Oct 2026 17:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FE61F000C1;
	Fri, 30 Oct 2026 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793382706;
	bh=sgw+dFnAKIy4Z3N4ren7Na+8jDhU5+QIZm0zBZP7148=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBz8u1oNY4sgfTj1ZJxLN6HSv31scRax7UqZX3xoT+TRSjzdBrX6nbuzvQuAiCski
	 B/+EwidYjSCFtWRBKrephJpz3EKVjGBBI4yCAUBm+nFycpL7ZLOP7xFo5JsdryiY6s
	 89Obd2DOJ2Sws00ehbbAoihQ0HIrHDi98ANxSOqF7ktA2WC63V2vJHsUJsnsswqmTa
	 +ZEPP03/6o9j9JyF/MLfy/fwVhA8i7t1eXHhkRp0XRcvPbLcFJOpXHfJj7PB2uVNtW
	 V3bgEFpse0JBZQ9tKF24BD91iya2CgTVD9K8Q3y/hGfcRJOMuvajL5yQPI0XLiATLi
	 JLfawcLra2V5g==
Message-ID: <sashiko-outbox-191361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/13] mtd: spinand: winbond: Generalize the KV OOB
 layout
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Daisuke Mizobuchi" <mizo@atmark-techno.com>, "Dominique
 Martinet" <dominique.martinet@atmark-techno.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin" <stlin2@winbond.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
 <20261030-winbond-master-w25nxxlvw-v1-2-91f67407dc8b@bootlin.com>
Date: Fri, 30 Oct 2026 17:51:45 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpbmFuZDog
d2luYm9uZDogYWNjaWRlbnRhbCByZXZlcnQgb2YgVzI1TjA0TFcgT09CIGxheW91dAotLQoKY29t
bWl0IGM3YmMzNjY2MmM3NWE1ZGVlZWRiNWU1ZWNjNDRkNmJjMzk0N2Q3ZmQKQXV0aG9yOiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKbXRkOiBzcGluYW5kOiB3aW5i
b25kOiBHZW5lcmFsaXplIHRoZSBLViBPT0IgbGF5b3V0CgpUaGlzIGNvbW1pdCBnZW5lcmFsaXpl
cyBhbmQgcmVuYW1lcyB0aGUgVzI1TjAyS1YgT09CIGxheW91dCBoZWxwZXJzIGFuZApzdHJ1Y3R1
cmVzIHRvIHcyNW54eGt2X2t3X29vYmxheW91dCBzbyBpdCBpcyBjbGVhcmVyIHRoYXQgYWxsIFcy
NU54eEtWIGFuZApXMjVOeHhLVyBjaGlwcyBzaGFyZSB0aGUgc2FtZSBPT0IgbGF5b3V0LgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9zcGkvd2luYm9uZC5jCj4gaW5kZXggNDlmYTU0NWE0MTEzZS4uNGVmMzBmMWE0YWE4ZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKClsgLi4uIF0KCj4gQEAgLTgyNyw3ICs4MTksNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyB3aW5ib25kX3NwaW5hbmRfdGFibGVb
XSA9IHsKPiAgCQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gIAkJCQkJICAgICAg
JnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCj4gIAkJICAgICAwLAo+IC0JCSAgICAgU1BJTkFORF9F
Q0NJTkZPKCZ3MjVuMDJrdl9vb2JsYXlvdXQsIHcyNW4wMmt2X2VjY19nZXRfc3RhdHVzKSksCj4g
KwkJICAgICBTUElOQU5EX0VDQ0lORk8oJncyNW54eGt2X2t3X29vYmxheW91dCwgdzI1bjAya3Zf
ZWNjX2dldF9zdGF0dXMpKSwKPiAgCVNQSU5BTkRfSU5GTygiVzI1TjA0TFciLCAvKiAxLjhWICov
Cj4gIAkJICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVks
IDB4YjIsIDB4MjMpLAo+ICAJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0
OCwgNDAsIDEsIDEsIDEpLAo+IEBAIC04MzYsNyArODI4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzcGluYW5kX2luZm8gd2luYm9uZF9zcGluYW5kX3RhYmxlW10gPSB7Cj4gIAkJCQkJICAgICAg
JndyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+ICAJCQkJCSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFu
dHMpLAo+ICAJCSAgICAgMCwKPiAtCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmdzI1bjA4bHdfb29i
bGF5b3V0LCB3MjVuMDJrdl9lY2NfZ2V0X3N0YXR1cykpLAo+ICsJCSAgICAgU1BJTkFORF9FQ0NJ
TkZPKCZ3MjVueHhrdl9rd19vb2JsYXlvdXQsIHcyNW4wMmt2X2VjY19nZXRfc3RhdHVzKSksCgpb
U2V2ZXJpdHk6IEhpZ2hdCkRvZXMgY2hhbmdpbmcgdGhlIFcyNU4wNExXIGVudHJ5IGluIHdpbmJv
bmRfc3BpbmFuZF90YWJsZSBmcm9tCncyNW4wOGx3X29vYmxheW91dCB0byB3MjVueHhrdl9rd19v
b2JsYXlvdXQgYWNjaWRlbnRhbGx5IHJldmVydCB0aGUKcHJlY2VkaW5nIGNvbW1pdCA0YzM3ZjRj
YjM3MDQgKCJtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEZpeCBhbiBPT0IgbGF5b3V0CmluY29uc2lz
dGVuY3kgd2l0aCBXMjVOeHhMVyBjaGlwcyIpPwoKVGhhdCBjb21taXQgc3BlY2lmaWNhbGx5IHN3
aXRjaGVkIFcyNU4wNExXIHRvIHcyNW4wOGx3X29vYmxheW91dCBzbyB0aGF0CncyNW4wOGx3X29v
YmxheW91dF9mcmVlKCkgZXhwb3NlcyBvbmx5IHRoZSAxMiBFQ0MtcHJvdGVjdGVkIFVzZXIgRGF0
YSBJCmJ5dGVzIGF0IG9mZnNldCAoMTYgKiBzZWN0aW9uKSArIDQgYW5kIHcyNW4wOGx3X29vYmxh
eW91dF9lY2MoKSByZXR1cm5zCi1FUkFOR0U6Cgpkcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25k
LmM6dzI1bjA4bHdfb29ibGF5b3V0X2ZyZWUoKSB7CglpZiAoc2VjdGlvbiA+IDcpCgkJcmV0dXJu
IC1FUkFOR0U7CgoJcmVnaW9uLT5vZmZzZXQgPSAoMTYgKiBzZWN0aW9uKSArIDQ7CglyZWdpb24t
Pmxlbmd0aCA9IDEyOwoKCXJldHVybiAwOwp9CgpXaXRoIHcyNW54eGt2X2t3X29vYmxheW91dCBh
c3NpZ25lZCBoZXJlIGluc3RlYWQsIHByb2JpbmcgYSBXMjVOMDRMVyBjaGlwCnZpYSBzcGluYW5k
X2luaXQoKSByZWdpc3RlcnMgdzI1bnh4a3Zfa3dfb29ibGF5b3V0X2ZyZWUoKSBhbmQKdzI1bnh4
a3Zfa3dfb29ibGF5b3V0X2VjYygpLCBleHBvc2luZyAxNCBmcmVlIE9PQiBieXRlcyBzdGFydGlu
ZyBhdCBvZmZzZXQKKDE2ICogc2VjdGlvbikgKyAyIChpbmNsdWRpbmcgdW5wcm90ZWN0ZWQgVXNl
ciBEYXRhIElJIGJ5dGVzKSBhbmQgcmVwb3J0aW5nCmluYWNjZXNzaWJsZSBFQ0MgcGFyaXR5IHJl
Z2lvbnMgaW5zdGVhZCBvZiBrZWVwaW5nIHcyNW4wOGx3X29vYmxheW91dC4KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMzAtd2lu
Ym9uZC1tYXN0ZXItdzI1bnh4bHZ3LXYxLTAtOTFmNjc0MDdkYzhiQGJvb3RsaW4uY29tP3BhcnQ9
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
