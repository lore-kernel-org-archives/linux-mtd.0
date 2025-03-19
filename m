Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E578EC35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uifDtBSRLarjvm8AUL9Kb5eC11LOfxpX1C1gnqQ5cxw=; b=alijUBdhlbZLta
	mp35eEcOIFGiPLwKdudh4EeSavqDxzkJhzVHgCd0mSurJi7qkGDbV8+H9T2NGvVGruOnOmMODm7Bw
	4zCJ/k/14lWc4CmUyS8a5m72pt3cGwWTZUCRo9/pZt3RFgFxcYE780r2MnZs6/M2mUSUumR8PkXnc
	GGAFYDprbbj7qaTurC1Crbe9fEVgdfCjxaV/Z4dxAS7qrbh/KrUb+pUuPE+EXjD+17XNG3N6xMkOE
	gPffm/L8TDqoEH8DaRqdYASyOQCba2aOQQRr6kbgOyZQWKTAl2U3d1/tPfIZ2zZbtk56pRAcjCmYa
	LNZ6ZWVKM5N1VIYEH/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwrC-00000009dNF-0dZS;
	Wed, 19 Mar 2025 17:05:30 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwiY-00000009c3E-3PJc
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 16:56:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B0CA442B9;
	Wed, 19 Mar 2025 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742403390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/tBHTPJtc4q7iOUGo1uSOWAgMdyAPJbAfPsRX0QpsnQ=;
	b=ScccwaH0hlQaINLb2+vRKeyDPlCwM1mcSdAmHf5YeDIMKCB8/p9tCh3qlVGooOe5zH7dZG
	4iJQrX1rjPdy1WGe2OHwJiwAx1yUFhVmRuDi2iRSTQEo+OUMpZqSuLeHdbTf/NtokPtGzi
	26h1TBfZh/TdS+NzgOGYDNpM8vu2/tH0elmYNYgkWdnJfF30tnPpD7ifarPw4BNkDf87Wf
	Lx/6fbWIpEKrtc+exT3QQqWUqxpyMDCKyldtWNgoFq7Ny6JKzWDjtZKf2VoqE5Dsj1ZrRN
	U0bT75MFntQ6YwrfLvMta5MMqHWdS4gWclpjva9U4gEZZHvzUmMdT4fa3/obMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  linux-spi@vger.kernel.org,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] spi: spi-mem: Introduce a default ->exec_op() debug log
In-Reply-To: <ce648080-2964-40d2-a2a7-cafcb6592cd1@sirena.org.uk> (Mark
	Brown's message of "Thu, 13 Mar 2025 22:27:54 +0000")
References: <20250305201140.2513431-1-miquel.raynal@bootlin.com>
	<a073191e-afab-484e-9659-66b957301db1@linaro.org>
	<ce648080-2964-40d2-a2a7-cafcb6592cd1@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Mar 2025 17:56:28 +0100
Message-ID: <87h63p2c3n.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepphhrrghthihus
 hhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_095635_004144_B919586B 
X-CRM114-Status: GOOD (  16.78  )
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

SGVsbG8gTWFyayAmIFR1ZG9yLAoKT24gMTMvMDMvMjAyNSBhdCAyMjoyNzo1NCBHTVQsIE1hcmsg
QnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgTWFyIDA2LCAyMDI1
IGF0IDA5OjA1OjM5QU0gKzAwMDAsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IE9uIDMvNS8yNSA4
OjExIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Cj4+ID4gLS0tIGEvZHJpdmVycy9zcGkvc3Bp
LW1lbS5jCj4+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4+ID4gQEAgLTM3Nyw2ICsz
NzcsMTcgQEAgaW50IHNwaV9tZW1fZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBz
dHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4+ID4gIAkvKiBNYWtlIHN1cmUgdGhlIG9wZXJhdGlvbiBm
cmVxdWVuY3kgaXMgY29ycmVjdCBiZWZvcmUgZ29pbmcgZnV0aGVyICovCj4+ID4gIAlzcGlfbWVt
X2FkanVzdF9vcF9mcmVxKG1lbSwgKHN0cnVjdCBzcGlfbWVtX29wICopb3ApOwo+PiA+ICAKPj4g
PiArIGRldl9kYmcoJm1lbS0+c3BpLT5kZXYsICJbY21kOiAweCUwMnhdWyVkQiBhZGRyOiAlIzhs
bHhdWyVkQgo+PiA+IGR1bW15XVslNGRCIGRhdGEgJXNdICVkJWMtJWQlYy0lZCVjLSVkJWMgQCAl
dUh6XG4iLAo+Cj4+IElzbid0IHRoaXMgdG9vICJjaGF0dHkiLCBlc3BlY2lhbGx5IG9uIHBhZ2Ug
cHJvZ3JhbSBvcHM/IEkgd291bGRuJ3QgYmUKPj4gc3VycHJpc2VkIGlmIHRoZSBwcmludHMgaW50
cm9kdWNlIHRpbWluZ3MgdGhhdCBjaGFuZ2UgY29udHJvbGxlcidzCj4+IGJlaGF2aW9yLiBIb3cg
YWJvdXQgdXNpbmcgZGV2X3ZkYmc/Cj4KPiBUaGF0LCBvciBjb3ZlcnQgdG8gdHJhY2VfcHJpbnRr
KCkgb3IgZXZlbiBiZXR0ZXIgYSB0cmFjZSBldmVudCAtIHdpdGggYQo+IHRyYWNlIGV2ZW50IHlv
dSBnZXQgcmVhbGx5IGZpbmUgZ3JhaW5lZCBjb250cm9sIGFuZCBleHRyZW1lbHkgbG93Cj4gb3Zl
cmhlYWQuCgpJIGRvIG5vdCB0aGluayBpdCBpcyB0b28gY2hhdHR5LCB0aGlzIGlzIHR5cGljYWxs
eSBhIHRyYWNlIHRoYXQgaXMgdXNlZAp3aGVuIHdyaXRpbmcgdGhlIGJhc2ljIHBhcnRzIG9mIGEg
c3BpLW1lbSBjb250cm9sbGVyLiBNeXNlbGYgSSBhbHJlYWR5Cndyb3RlIHNvbWV0aGluZyBsaWtl
IHRoYXQgdHdpY2UsIGp1c3QgYmVjYXVzZSBkdXJpbmcgdGhlIGluaXRpYWwKd3JpdGluZywgcGVy
Zm9ybWFuY2Ugc2ltcGx5IGRvZXMgbm90IG1hdHRlci4KClJlZ2FyZGluZyB0aGUgZmVhciB0aGF0
IHRoZSBjaGF0dHkgbG9nIGNvdWxkIGhhdmUgYW4gaW1wYWN0OiBpZiBpdCBkb2VzLAppdCBpcyBs
aWtlbHkgYSBidWcgb2YgdGhlIGRyaXZlciBvciBhIHNldmVyZSBjb250cm9sbGVyIGxpbWl0YXRp
b24KSU1PLiBBbnl3YXksIHRoZSBwb2ludCBvZiBoYXZpbmcgYSBfZGJnIGNhbGwgaXMgdG8gYWxs
b3cKZW5hYmxpbmcvZGlzYWJsaW5nIHRoZSBsb2cgaWYgaXQgaXMgdG9vIHRpbWUgY29uc3VtaW5n
LgoKSSdkIHNheSB0aGF0IGZvciB0aGlzIHBhcnRpY3VsYXIgcHVycG9zZSBJIGRvIG5vdCB0aGlu
ZyB0aGF0IHRyYWNlCnByaW50a3Mgb3IgZXZlbnRzIHdvdWxkIHJlYWxseSBmaXQuIEFzIGEgZGV2
ZWxvcGVyLCBJJ2QgZGVmaW5pdGVseQphbHdheXMgY2hhbmdlIHRoZSBmdW5jdGlvbiBjYWxscyB0
byBzb21lIGRpcmVjdCBwcmludGsgY2FsbHMgaW4gdGhpcwpjYXNlLiBUaGUgdmVyYm9zZSBkZWJ1
ZyBhbHRlcm5hdGl2ZSBzZWR1Y2VkIG1lIHRob3VnaCwgc28gaWYgdGhhdCdzIG9rYXkKZm9yIHlv
dSwgSSdsbCBzd2l0Y2ggdG8gZGV2X3ZkZ2IoKSBhcyBzdWdnZXN0ZWQgYnkgVHVkb3IsIHdoaWNo
IGhvbmVzdGx5CmZlZWxzIGxpa2UgYSBzZWR1Y2luZyBhbHRlcm5hdGl2ZS4KCkNoZWVycywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
