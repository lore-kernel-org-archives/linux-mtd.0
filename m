Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE16606A319
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rPpPWre4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EUEGdVPF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QrDJyRTQpF/vIs3RXJMYmsRreWoU7pW6jx+XDmJAXNA=; b=rPpPWre4uIe+fjnEpevupgPuOV
	uHTqWros5z61LalAQ687RaT8A2IXP9EmcRZmGNSEb3Pa05T455WhVdqGMlOR7vaYWf59qHIMXe1B3
	8Sfztix9KWi45pP8HgJSnV3a7n2dcyHTpzn0hiv8PloWV2sFXeibnQCRdYV2cj6hGijAWZurh+uV7
	XOLPT6VRDLhP1+u2RmSz0f8xawX2OLiW9/DDc7nHFQVj0grTochjibftjWKJ2b8nQUfpFjb2k1p2x
	+eYCd63HYY2VBJ6nL7uMVu0pp39GAYTGax++Rpidv2lDqoZWf70fgPBi4gpUAQTOB40Khr752So/B
	iJurwW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqFO-0000000Dx21-04Z6;
	Thu, 22 Oct 2026 10:42:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqFK-0000000Dx1d-1a4Z
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:42:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 900814E412B2;
	Thu, 22 Oct 2026 10:42:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 53B3260360;
	Thu, 22 Oct 2026 10:42:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5AE010328E44;
	Thu, 22 Oct 2026 12:41:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792665721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9bhyu6Fq5WX64gBWqODlDauOfgdVOt8rSIb/Nnq5zxI=;
	b=EUEGdVPFTYk5khJc1VK6CVPUbxP0IK7ec4fVAcfzk1qv3UL5Pq3Ssb43xTFvHVsY4zxh8W
	I46jppsRM6ZjRQ9lAKjWgwKOBgfRPqgrWqFwyvwuPtctpexgbwu5T7hQ2WhfDeGp6HXn2+
	GpouL93ityupT0o9RI0zU9g/ys/9BxS+PXEFKxQjjbWfK3xvDA6HzVK8kPOpiKYqrxKgrN
	zM5Ws+G9N4d0gnVH90MCRn1rrsEseq8Zil4OeIbiMQUM6Sf5hFV7Uv7/7prKnLljr8GobO
	aIM7BjP1AFtCIocKOExsQzUuxuzdbvbJw7/JNq+RrTrPp8vAs7qiXCHQ+Byydw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 1/4] spi: dw: Add DDR (Dual Data-Rate) support for
 enhanced SPI mode
In-Reply-To: <20261022102614.75696-2-changhuang.liang@starfivetech.com>
	(Changhuang Liang's message of "Thu, 22 Oct 2026 03:26:11 -0700")
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
	<20261022102614.75696-2-changhuang.liang@starfivetech.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 12:41:52 +0200
Message-ID: <87bj8mqaof.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_034206_565605_4BCF8F59 
X-CRM114-Status: GOOD (  17.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjIvMTAvMjAyNiBhdCAwMzoyNjoxMSAtMDcsIENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVh
bmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciBERFIg
KER1YWwgRGF0YS1SYXRlKSB0cmFuc2ZlcnMgaW4gdGhlIGVuaGFuY2VkIFNQSQo+IG1vZGUgb2Yg
dGhlIERXIFNQSSBjb250cm9sbGVyLgo+Cj4gVGhlIGVuaGFuY2VkIFNQSSBjb250cm9sIHJlZ2lz
dGVyIChTUElfQ1RSTFIwKSBoYXMgZGVkaWNhdGVkIGZpZWxkcyB0bwo+IGVuYWJsZSBERFIgbW9k
ZSBmb3IgdGhlIGluc3RydWN0aW9uIHBoYXNlIChJTlNUX0REUl9FTikgYW5kIGZvciB0aGUKPiBh
ZGRyZXNzL2R1bW15L2RhdGEgcGhhc2VzIChTUElfRERSX0VOKS4gUG9wdWxhdGUgdGhlc2UgZnJv
bSB0aGUKPiBjb3JyZXNwb25kaW5nIGR0ciBmbGFncyBvZiB0aGUgc3BpX21lbV9vcC4KPgo+IEZv
ciBERFIgdHJhbnNmZXJzLCB0aGUgZHVtbXkgcGhhc2UgY29uc3VtZXMgdHdvIGJpdHMgcGVyIGNs
b2NrIHBlcgo+IGxpbmUsIHNvIHRoZSBjb21wdXRlZCB3YWl0IGN5Y2xlcyBtdXN0IGJlIGhhbHZl
ZC4gRmFjdG9yIHRoZSB3YWl0IGN5Y2xlCj4gY2FsY3VsYXRpb24gaW50byBhIGhlbHBlciwgZHdf
c3BpX2VuaF93YWl0X2N5Y2xlcygpLCBzbyB0aGF0IGJvdGggdGhlCj4gc3VwcG9ydHMgY2hlY2sg
YW5kIHRoZSBleGVjIHBhdGggdXNlIHRoZSBzYW1lIHZhbHVlLgo+Cj4gV2hlbiBTUEkgRERSIGlz
IGVuYWJsZWQsIHByb2dyYW0gdGhlIEREUl9EUklWRV9FREdFIHJlZ2lzdGVyLiBUaGUKPiByZWNv
bW1lbmRlZCBUREUgdmFsdWUgaXMgY2xrX2RpdiAvIDQsIGNsYW1wZWQgdG8gY2xrX2RpdiAvIDIg
LSAxIGFuZCB0bwo+IHRoZSBmaWVsZCB3aWR0aC4KPgo+IEZpbmFsbHksIGFkdmVydGlzZSBEVFIg
c3VwcG9ydCB0byB0aGUgU1BJIG1lbW9yeSBsYXllciB0aHJvdWdoIGEKPiBkZWRpY2F0ZWQgZHdf
c3BpX2VuaF9tZW1fY2Fwcywgc2VsZWN0ZWQgd2hlbiB0aGUgY29udHJvbGxlciBoYXMKPiBEV19T
UElfQ0FQX0VNT0RFLCBzbyB0aGF0IHNwaS1tZW0gbWF5IGlzc3VlIEREUiBvcGVyYXRpb25zLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFy
Zml2ZXRlY2guY29tPgo+IC0tLQo+ICBkcml2ZXJzL3NwaS9zcGktZHctY29yZS5jIHwgNTIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1k
dy5oICAgICAgfCAgNiArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUu
YyBiL2RyaXZlcnMvc3BpL3NwaS1kdy1jb3JlLmMKPiBpbmRleCA0NzQzNGZhNzhlNGIuLjZmZjE0
MmM4YTZiZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktZHctY29yZS5jCj4gKysrIGIv
ZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUuYwo+IEBAIC00Niw2ICs0Niw4IEBAIHN0cnVjdCBkd19z
cGlfZW5oX2NmZyB7Cj4gIAl1OCBpbnN0X2w7Cj4gIAl1OCBhZGRyX2w7Cj4gIAl1OCB0cmFuc190
Owo+ICsJYm9vbCBpbnN0X2RkcjsKPiArCWJvb2wgc3BpX2RkcjsKCklmIEkgdW5kZXJzdGFuZCB0
aGlzIGNvcnJlY3RseSwgc3BpX2RkciBpcyBxdWl0ZSBhIGJhZCBuYW1lIGJlY2F1c2UgaXQKbWVh
bnMgYWRkcmVzcyBhbmQgZHVtbXkgYW5kIGRhdGEgZGRyIChidXQgbm90IGluc3RyKS4gQ2FuIHlv
dSB0cnkgdG8KY29tZSB1cCB3aXRoIGEgYmV0dGVyIG5hbWUgZm9yIHRoaXMgdmFyaWFibGU/CgpB
bHNvLCBpZiBteSBhYm92ZSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHlvdSBtdXN0IHByb3Zp
ZGUgYQpzdXBwb3J0c19vcCgpIGNhbGxiYWNrIHdoaWNoIHdvdWxkIHJlZnVzZSBhbnkgeFMteFMt
eEQgYnV0IGFsbG93CnhELXhELXhEIGFuZCB4Uy14RC1EIG1vZGVzLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
