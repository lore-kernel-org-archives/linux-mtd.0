Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F35AC79FAB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rS/oSZ8aTVBaJSzd2eZb0dcGnNpqzzJuL2J3UYs2b0g=; b=l97i+HyVum3rxR
	XYEOxmDL9pN4R0N0oPmz8TtKKwzSALx7cjXbK1subeQ5OuD1Tu9U08z44RX8X5KhOi/0ooy4DLMH+
	mQhRSNdrlE2mwzXGJFxVCWxFpbXfRTSn0Yde7qcOcf6O/DV7Jbp/ssEVx2XbXIpbFDrM3erOr8I1D
	cnjfi/DAq449LqPx3CHix5j6fAAjlzl160XBQCo6UWxcEy1hp0dJzDICLeR5YFIAbl6GdO+69KFzi
	03vAe8ZNk1BPJ7zBLn0rY/AFN1Il3tqKL2pxWRgCEpClZi8IwR+L8y6TqKbeTLXU9bDibOeL8k3j2
	3UmZo+w/Psk48ujRzrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sGb-00000008dAN-3620;
	Tue, 08 Sep 2026 09:37:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sGY-00000008d9h-0nFB
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 09:37:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C04861A1A53;
	Tue,  8 Sep 2026 09:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94F76603C4;
	Tue,  8 Sep 2026 09:37:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31B9411C7A34F;
	Tue,  8 Sep 2026 11:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788860234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EqcRWg98mOcljlI9mTBH7+pU15MLtpwfrZFZb9Dljv0=;
	b=hrFUetqTIKCDLj4NHUxP3C7PZLgE6AEYwXZ2Z3GJXuxLsYmwjHcFrdvK5/HPkZzswMt3Be
	0hmSgZlbnUaH5Zs2ugviTlyI11jPWI2XEpfJUbBSZ5FrYHV6ZOrCleVe6wEnWJTE7IdHiQ
	NZatVDDRiU7iI053ov2Fkd3aeTY+sjpzJXnzAmrd18I3NhRoYv/0cS51uCv7GQfMzbfQEB
	+GeR4xv1TpNmJQ36gZHO4T7U70S/GnMWyrkBPdZSbfmr/aSPZy2cwlHqJaSya77W0SwZm7
	23f4OmKuYNXsmTzGheydpyCcgXMVel1zpS1/a9h9fSzDCH3LE7D9RmO5YeQXpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org
 (open list)
Subject: Re: [PATCHv2] mtd: rawnand: fsl_ifc: allocate shared ctrl with
 devm_kzalloc
In-Reply-To: <20260908060111.41244-1-rosenp@gmail.com> (Rosen Penev's message
	of "Mon, 7 Sep 2026 23:01:11 -0700")
References: <20260908060111.41244-1-rosenp@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 11:37:11 +0200
Message-ID: <87h5k0ulrs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_023722_372321_278F52CA 
X-CRM114-Status: GOOD (  16.16  )
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

T24gMDcvMDkvMjAyNiBhdCAyMzowMToxMSAtMDcsIFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21haWwu
Y29tPiB3cm90ZToKCj4gQWxsb2NhdGUgdGhlIHNoYXJlZCBmc2xfaWZjX25hbmRfY3RybCBzdHJ1
Y3R1cmUgYWdhaW5zdCB0aGUgY29udHJvbGxlcgo+IGRldmljZSwgd2hpY2ggb3V0bGl2ZXMgYWxs
IE5BTkQgY2hpbGQgZGV2aWNlcywgc28gaXQgaXMgZnJlZWQKPiBhdXRvbWF0aWNhbGx5LiAgVGhp
cyBkcm9wcyB0aGUgbWFudWFsIGtmcmVlKCkgYW5kIHRoZSBicm9rZW4gY2hpcAo+IGNvdW50ZXIg
dGhhdCB3YXMgZGVjcmVtZW50ZWQgaW4gcmVtb3ZlKCkgYnV0IG5ldmVyIGluY3JlbWVudGVkCj4g
YW55d2hlcmUsIGxlYWtpbmcgdGhlIHN0cnVjdHVyZSBhbmQgbGVhdmluZyB0aGUgZnJlZWQgcG9p
bnRlciBpbgo+IGN0cmwtPm5hbmQgb24gcmUtcHJvYmUuCj4KPiBBc3Npc3RlZC1ieTogb3BlbmNv
ZGU6YmlnLXBpY2tsZQo+IFNpZ25lZC1vZmYtYnk6IFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21haWwu
Y29tPgo+IC0tLQo+ICB2MjogcmViYXNlLgo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfaWZj
X25hbmQuYyB8IDE1ICsrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9mc2xfaWZjX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9pZmNfbmFuZC5j
Cj4gaW5kZXggYTg4YWMyY2ZhY2NkLi40YzJkOTU0NjFjMmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZnNsX2lmY19uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9mc2xfaWZjX25hbmQuYwo+IEBAIC01MCw3ICs1MCw2IEBAIHN0cnVjdCBmc2xfaWZjX25hbmRf
Y3RybCB7Cj4gIAl1bnNpZ25lZCBpbnQgaW5kZXg7CS8qIFBvaW50ZXIgdG8gbmV4dCBieXRlIHRv
ICdyZWFkJwkqLwo+ICAJdW5zaWduZWQgaW50IG9vYjsJLyogTm9uIHplcm8gaWYgb3BlcmF0aW5n
IG9uIE9PQiBkYXRhCSovCj4gIAl1bnNpZ25lZCBpbnQgZWNjcmVhZDsJLyogTm9uIHplcm8gZm9y
IGEgZnVsbC1wYWdlIEVDQyByZWFkCSovCj4gLQl1bnNpZ25lZCBpbnQgY291bnRlcjsJLyogY291
bnRlciBmb3IgdGhlIGluaXRpYWxpemF0aW9ucwkqLwo+ICAJdW5zaWduZWQgaW50IG1heF9iaXRm
bGlwczsgIC8qIFNhdmVkIGR1cmluZyBSRUFEMCBjbWQJCSovCj4gIH07Cj4gIAo+IEBAIC0xMDMz
LDE1ICsxMDMyLDEzIEBAIHN0YXRpYyBpbnQgZnNsX2lmY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKmRldikKPiAgCj4gIAltdXRleF9sb2NrKCZmc2xfaWZjX25hbmRfbXV0ZXgp
Owo+ICAJaWYgKCFmc2xfaWZjX2N0cmxfZGV2LT5uYW5kKSB7Cj4gLQkJaWZjX25hbmRfY3RybCA9
IGt6YWxsb2Nfb2JqKCppZmNfbmFuZF9jdHJsKTsKPiArCQlpZmNfbmFuZF9jdHJsID0gZGV2bV9r
emFsbG9jKGZzbF9pZmNfY3RybF9kZXYtPmRldiwgc2l6ZW9mKCppZmNfbmFuZF9jdHJsKSwKPiAr
CQkJCQkgICAgIEdGUF9LRVJORUwpOwoKVGhpcyBpcyBhIGdsb2JhbCBvYmplY3QuIEkgZG9uJ3Qg
Z2V0IHdoeSBpdCdzIGdsb2JhbC4gQnV0IGl0IHNlZW1zIG5vdApyZWxldmFudCB0byB0aWUgd2l0
aCBjdHJsX2Rldi0+ZGV2IChzZWUgU2FzaGlrbyByZXBvcnQpLiBDYW4geW91IHBsZWFzZQpnbyBv
bmUgc3RlcCBmdXJ0aGVyIGluIHRoaXMgY2xlYW51cD8KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
