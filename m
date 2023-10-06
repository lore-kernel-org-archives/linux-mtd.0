Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EED9E92FF9
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDGMRPImOXo65r2Id0226u3mzPt48zRRi63pIIwVdc8=; b=Bysmy8o6c5FHNhOVI40UiwQpd+
	Y+34TY9FKVK1VwD/CXBSIkHoQR/cCtGURGQrUp9j4l4JCABK6bZEz85sWSjjjHbEEAwKZrkaE1Y1X
	vVbeoAWqpirVhjOUsDDDpCq8QChBlnAaGPEa+mf8FAHJA//JQZfkkzAtmr2fhCijXkDyzFKbL9Hvf
	W8G425xCv1uIp5WkGsuO32JfohpPkobmg6rGtY5xBzafdN8N8984cCEpv0xxqBXpo1IaH93REE6Og
	3SCjUQKH3SlRWVIDaoKNmRQzpB+BIMS1omtapDf4MsbGVH0PNqksmfz2VNdNFqU6zvsorUxbXwEXd
	0uF7yHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog6n-005H5y-17;
	Fri, 06 Oct 2023 08:22:53 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qog6k-005H5B-0b
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 08:22:51 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EE632EA6;
	Fri,  6 Oct 2023 10:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1696580563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74nEU/BR4JOpTfIgyfTVQ7oWmNWJMMYbufLmD+Vt8oA=;
	b=ZC2HT6tdo2S/sXgimL8q9fEEZrRSzCd6vUwu1iB3eUJIaK8hkPhGiV0zWeExJaymHkMHgF
	IcHisNxsHTZCAIRbk8mm4Hh/RDAGQceBXxartD548uvTEJN2/EdNcDvk07PCsWW5EgJDQd
	OLDmhomqj95cfjKTRoybiYjHXsbks45VQyVhhhpc1grEr+kdHQnDWbcGYt2Kd08+b6STfW
	dv3wdiFoO00l0zNHoDLQBv6y4dEyk6KmBhYQPgww25o8Jsgk/av8rCSWkTA9OF0OABkHCG
	oFUzaZMljU6kgL4jPFFjgB0Z4bCuR1pygJmRmqvcOjta5cDhxxDoC+4JzJDyuA==
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 10:22:42 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jaime Liao
 <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
In-Reply-To: <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com>
 <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org>
 <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org>
Message-ID: <cdd8fb4d9261892345588388a5de262f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_012250_379305_F8C0AA25 
X-CRM114-Status: GOOD (  19.95  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgo+Pj4+Pj4gSSBzZWUgdGhpcyBmbGFzaCBzdXBwb3J0cyAxLTEtMSwgOC04LTgsIGFuZCA4
ZC04ZC04ZCwgdGhlcmUgYXJlIG5vCj4+Pj4+PiBtaXhlZAo+Pj4+Pj4gbW9kZXMgc3VwcG9ydGVk
LCB0aHVzIGEgOGQtOGQtOHMgbW9kZSBzZWVtcyBqdXN0IGxpa2UgYSBoYXJkd2FyZQo+Pj4+Pj4g
YnVnIHRvCj4+Pj4+PiBtZS4gU28gbXkgcHJvcG9zYWwgaXMgdG8gbGVhdmUgdGhlIGNvcmUgYXdh
eSBhbmQgdG8gaGFuZGxlIHRoZSAKPj4+Pj4+IHJlYWQgaWQKPj4+Pj4+IGhhY2sganVzdCBpbiB0
aGUgbWFjcm9uaXggZHJpdmVyLgo+Pj4+PiAKPj4+Pj4gKzEKPj4+PiAKPj4+PiBJJ3ZlIGxvb2tl
ZCBhdCB0aGUgeHNwaSBzcGVjLiBUaGVyZSBpcyBubyBSRElEIHNwZWNpZmllZC4gU28gSSdkIAo+
Pj4+IGFyZ3VlLAo+Pj4+IHRoZSBvbmx5IHBzZXVkbyBzdGFuZGFyZCBpcyB0aGF0IFJESUQgd2Fz
IG9ubHkgZXZlciB1c2VkIHdpdGggCj4+Pj4gMXMxczFzLgo+Pj4+IEJ1dAo+Pj4+IHdlIGFkZGVk
IHNwaV9ub3JfcmVhZF9pZCgpIHdpdGggcGFyYW1ldGVycyBzdWl0ZWQgZm9yIHRoZSAidW51c3Vh
bCIKPj4+PiA4ZDhkOGQKPj4+PiBjYXNlIHdpdGggYWRkaXRpb25hbCBhZGRyZXNzIGFuZCBkdW1t
eSBjeWNsZXMuIEp1c3QgZm9yIGNoZWNraW5nIAo+Pj4+IHdoZXRoZXIKPj4+PiB0aGUKPj4+PiBv
Y3RhbC1kdHIgc3dpdGNoIHdhcyBzdWNjZXNzZnVsLiBUaGVyZWZvcmUsIHdlJ3ZlIGFscmVhZHkg
YWRkZWQKPj4+PiBwYXJhbWV0ZXJzIHRvCj4+Pj4gc3BpX25vcl9yZWFkX2lkKCkgd2hpY2ggYXJl
IG5vdCBzdGFuZGFyZC4gVGhlbiB3ZSBjYW4ganVzdCBhZGQgb25lIAo+Pj4+IG1vcmUuCj4+Pj4g
SXQncwo+Pj4+IGp1c3QgaG93IG1hY3Jvbml4IGlzIGRvaW5nIGl0LiBBZ2FpbiB0aGVyZSBpcyBu
byBzdGFuZGFyZC4KPj4+PiBJZiB3ZSdkIG9ubHkgcHV0IHN0YW5kYXJkIChvciBmb3IgdGhlIDlG
IHBzZXVkbyBzdGFuZGFyZCkgdGhpbmdzIGluIAo+Pj4+IHRoZQo+Pj4+IGNvcmUsCj4+Pj4gdGhl
biBzcGlfbm9yX3JlYWRfaWQoKSB3b3VsZCBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGZsYXNo
IGlzIGluCj4+Pj4gMXMxczFzCj4+Pj4gbW9kZS4gQW5kIG5vIEkgd291bGRuJ3QgcHJlZmVyIHRo
YXQgOykKPj4+PiAKPj4+IAo+Pj4gSWYgd2UgcmVhbGx5IHdhbnQgdG8gYmUgY2F0aG9saWMsIHdl
IHNob3VsZCBzd2l0Y2ggdG8gOGQtOGQtOHMgbW9kZSAKPj4+IGFuZAo+Pj4gdGhlbiBpc3N1ZSB0
aGUgcmVhZCBpZCBhbmQgdGhlIGNvcmUgd2lsbCBoYW5kbGUgdGhlIHJlYWRpZCBjb3JyZWN0bHku
Cj4+PiBCdXQgdGhlcmUgaXMgbm8gc3VjaCBhIHRoaW5nLCBiZWNhdXNlIG1hY3Jvbml4IGNvbnNp
ZGVycyB0aGF0IGl0IGlzIAo+Pj4gaW4KPj4+IDhkLThkLThkIG1vZGUgYXQgdGhlIHRpbWUgb2Yg
aXNzdWluZyA4ZC04ZC04cyByZWFkIGlkLiBUaGF0J3Mgd2h5IEkgCj4+PiBzYXkKPj4+IGl0J3Mg
YSBidWcgb24gdGhlaXIgc2lkZS4gVGhlIGNvcmUgaXMgbWVhbnQgdG8gYmUgZ2VuZXJpYywgSSBk
b24ndCAKPj4+IHdhbnQKPj4+IHRvIHBvbGx1dGUgdGhlIGNvcmUgd2l0aCBtYW51ZmFjdHVyZXIg
c3BlY2lmaWMgZml4ZXMuCj4+IAo+PiBUaGVuIHdoeSBkb2VzIHNwaV9ub3JfcmVhZF9pZCgpIGhh
dmUgdGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzOgo+PiAKPj4gwqAqIEBuYWRkcjrCoMKgwqDCoMKg
IG51bWJlciBvZiBhZGRyZXNzIGJ5dGVzIHRvIHNlbmQuIENhbiBiZSB6ZXJvIGlmIHRoZQo+PiBv
cGVyYXRpb24KPj4gwqAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9lcyBub3QgbmVlZCB0
byBzZW5kIGFuIGFkZHJlc3MuCj4+IMKgKiBAbmR1bW15OsKgwqDCoMKgIG51bWJlciBvZiBkdW1t
eSBieXRlcyB0byBzZW5kIGFmdGVyIGFuIG9wY29kZSBvcgo+PiBhZGRyZXNzLiBDYW4KPj4gwqAq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmUgemVybyBpZiB0aGUgb3BlcmF0aW9uIGRvZXMg
bm90IHJlcXVpcmUgZHVtbXkgYnl0ZXMuCj4+IMKgKiBAcHJvdG86wqDCoMKgwqDCoCB0aGUgU1BJ
IHByb3RvY29sIGZvciByZWdpc3RlciBvcGVyYXRpb24uCj4+IAo+PiBUaGV5IGFyZW4ndCBzdGFu
ZGFyZCBlaXRoZXIuIEl0J3MganVzdCB0aGUgd2F5IHNwYW5zaW9uIGFuZCBtaWNyb24KPj4gdHJh
bnNmZXJzCj4+IHRoZSBJRCB2aWEgUkRJRCBpbiBvY3RhbCBEVFIgbW9kZS4gQW5kIG5vdyB0aGVy
ZSdzIG1hY3Jvbml4IHdobyBkb2VzIAo+PiBpdAo+PiBzbGlnaHRseQo+PiBkaWZmZXJlbnQuIEJ1
dCAqbmVpdGhlciogb2YgdGhlbSBhcmUgc3RhbmRhcmQuIFdoeSBzaG91bGQgb25lIGJlIGluIAo+
PiB0aGUKPj4gY29yZSBhbmQKPj4gb25lIHNob3VsZG4ndC4KPj4gCj4+IHNwaV9ub3JfcmVhZF9p
ZCgpIHNob3VsZCBqdXN0IGhhbmRsZSBwcm90byA9PSBTTk9SX1BST1RPXzhEXzhEXzhTLgo+IAo+
IFllcywgaXQgc2hvdWxkLCBidXQgbXggaXMgaW4gOGQtOGQtOGQgYXQgdGhlIHRpbWUgaXQgaXNz
dWVzIHRoZSByZWFkIAo+IGlkLAo+IHRodXMgaXQgcGFzc2VzIHRoZSBjb3JlIHByb3RvID09IFNO
T1JfUFJPVE9fOERfOERfOEQsIGlzbid0IGl0PwoKVGhlIGZsYXNoIGRldmljZSBpcyBpbiBvY3Rh
bCBkdHIgbW9kZSwgd2hpY2ggbWVhbnMgaXQgd2lsbCBleHBlY3QgdGhlCm9wY29kZSBpbiBvY3Rh
bCBkdHIgbW9kZS4gQnV0IHRoZSBkYXRhIHBoYXNlIG1vZGUgZGVwZW5kcyBvbiB0aGUgb3Bjb2Rl
CihhbmQgdGhlb3JldGljYWxseSwgdGhlIGFkZHJlc3MgcGhhc2UsIHRvbykuIElmIHlvdSB1c2Ug
dGhlCihub24tc3RhbmRhcmQpIFJESUQgb24gdGhpcyBmbGFzaCBjb21tYW5kIGhhcyB0byBiZSBl
eGVjdXRlZCBhcyA4ZDhkOHMuCgo+IElmIHlvdQo+IGNhcmUgYWJvdXQgdGhpcywgcGxlYXNlIHNl
bmQgYSBwYXRjaCBhZGRyZXNzaW5nIGl0LCBpdCdzIGJldHRlciB0byB0YWxrCj4gb24gY29kZS4g
SSBkb24ndCBzZWUgeWV0IGhvdyB5b3Ugd2lsbCBoYW5kbGUgaXQsIGJ1dCBJJ20gb3BlbiB0byBy
ZXZpZXcKPiBzb21lIGNvZGUuCgpJIHJlYWxseSBkb24ndCBoYXZlIHRpbWUgcmlnaHQgbm93LiBC
dXQgc29tZXRoaW5nIGFsb25nOgoKc3BpX25vcl9yZWFkX2lkKC4uLCBwcm90bykgewogICBib29s
IGVtdWxhdGVkXzhkOGQ4czsKCiAgIG9wID0gYXNzZW1ibGVfb3AoLi4sIHByb3RvKTsKCiAgIC8q
IEVtdWxhdGUgOGQ4ZDhzIGlmIHRoZSBjb250cm9sbGVyIGRvZXNuJ3Qgc3VwcG9ydCBpdCAqLwog
ICBpZiAoIXNwaV9tZW1fc3VwcG9ydHNfb3Aob3ApICYmIHByb3RvID09IDhkOGQ4cykgewogICAg
ICBvcCA9IGFzc2VtYmxlX29wKC4uLCA4ZDhkOGQpOwogICAgICBlbXVsYXRlZF84ZDhkOHMgPSB0
cnVlOwogICB9CiAgIGV4ZWN1dGVfb3AoKQogICBpZiAoZW11bGF0ZWRfOGQ4ZDhzKSB7CiAgICAg
IC8qIGRpc2NhcmQgZXZlcnkgb3RoZXIgYnl0ZSBvZiB0aGUgcmVzcG9uc2UgKi8KICAgfQp9CgpM
YXRlciAob3IgZXZlbiBub3cpLCB0aGF0IGNvdWxkIGJlIG1vdmVkIGRvd24gdGhlIGNhbGxzdGFj
ayBpbnRvCnRoZSBzcGltZW0gY29yZS4KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
