Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2B606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/iC9vkz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBNgaAtv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G4hQ56nLMEBgP8a4JaCw2ppXU3vKvL8kabP0VlKPYPk=; b=t/iC9vkzDKXhrMUoyfAayKpwfV
	tckXRjWWhByvIAsmM+vQZCxLVYQMVOKUb1GZ2xHHFWFLQmPUrIUa1sJuRc5G+ks3FzADg80NRix/s
	b3zKXwqnav+TZIh/VMO7P6SCVduwFY27NKKjrPrplFruqDCX8ia7RkZKs+QU5NOw+sjISeYO0mQg2
	NV/E+zAMwZhxZbl0fFK73WnMH2ZmDLwJd/+dLTCKBs7P4pyImSWf/9ArmFnVmTnJqOQiuHhE88vWy
	T2+p7R4+PbOorvxZcAHDuHvKS8FGsl8qiDjfgdmcR4K25kY7Doc8czBux7pXfWwGeA4r74upsNQA2
	5A3MtmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHdZ-0000000AzQQ-42a6;
	Wed, 25 Nov 2026 18:22:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHdY-0000000AzQI-3J5l
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:22:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EE4343CB3;
	Wed, 25 Nov 2026 18:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D32E1F000C6;
	Wed, 25 Nov 2026 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630951;
	bh=9eBxIDFcCiTC0PYnSL68+EYSfmNMB+w2DfGz9jhW8CU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBNgaAtvoXNnKPoIpxaSXHshRHAo+sLBq84GqtkEjB8ho7q9zwJRkFWZROKQxB3vF
	 04qCWeY0eKCEaSpf6aZNWyn9PUKdFzRZ39n1Ndj2532EvxKobYUgTY+iv+whSZp+LM
	 qsFyacbIY8RI0s1r0SsHoSEuC6lXb88ZG7QW8WKmEVWv5h97KIT2PqonHoO86V4dbO
	 fakRwsb1BxLSHb+U7YYyLoyxF4qZy/sOrhatVBhqdo5rYe2nEnvXURD3bZmbdYqr43
	 9rCBQ+xcYeF2Is0Cl/GvxsjFjqAxuS0UBFBRFcyLQIKgUufFZ0wDmNhrS1LIVBGTD7
	 tyhG73a8Jn+5Q==
Message-ID: <sashiko-outbox-233974@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nor: macronix: Clear the RDCR opcode on
 MX25L3255E
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org
In-Reply-To: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
 <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
Date: Wed, 25 Nov 2026 18:22:30 +0000
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIG10ZDogc3BpLW5vcjog
bWFjcm9uaXg6IG14MjVsMzI1NWVfbGF0ZV9pbml0X2ZpeHVwcygpIGxlYXZlcwogIDItYnl0ZSBX
UlNSIHNldAotIFtMb3ddIG10ZDogc3BpLW5vcjogbWFjcm9uaXg6IG1pc3NpbmcgRml4ZXMgdHJh
aWxlciBmb3IgY29tbWl0CiAgNjM0ODkwMDJkMzk3Ci0tCgpjb21taXQgNDhlMzNjYWYwZjU5NDVj
OGM1MGQyODJhZTdmMDgzNzE0YmMyOTA4ZgpBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cgo+IG10ZDogc3BpLW5vcjogbWFjcm9uaXg6IENsZWFyIHRoZSBS
RENSIG9wY29kZSBvbiBNWDI1TDMyNTVFCj4KPiBUaGUgTVgyNUwzMjU1RSBCRlBUIHRhYmxlIGlz
IGluY29ycmVjdCB3aGljaCBsZWFkcyB0byB0aGUgUkRDUiBvcGNvZGUgdG8KPiBiZSByZXNldC4g
TWFrZSBzdXJlIHRoZSBjb25maWd1cmF0aW9uIGZvciB0aGlzIGNoaXAgcmVtYWlucyBjb3JyZWN0
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KCltTZXZlcml0eTogTG93XQpUaGlzIGZpeGVzIGEgcmVncmVzc2lvbiBvbiBNWDI1TDMy
NTVFIHdoZXJlIFJEQ1IgcmVtYWluZWQgc2V0IGFmdGVyIEJGUFQKcGFyc2luZy4gIFNob3VsZCB0
aGUgY29tbWl0IG1lc3NhZ2UgaW5jbHVkZToKCiAgRml4ZXM6IDYzNDg5MDAyZDM5NyAoIm10ZDog
c3BpLW5vcjogUmVmYWN0b3IgUmVhZCBTdGF0dXMvV3JpdGUgU3RhdHVzIHN1cHBvcnQiKQoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9tYWNyb25peC5jCj4gaW5kZXggMmM2ZjUwN2EyZGRlNy4uMDMzMWY5ZjNmODUzYyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiBAQCAtNjQsMTMgKzY0LDE0IEBAIG14MjVsMzI1
NWVfbGF0ZV9pbml0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICAJc3RydWN0IHNwaV9u
b3JfZmxhc2hfcGFyYW1ldGVyICpwYXJhbXMgPSBub3ItPnBhcmFtczsKPiAgCj4gIAkvKgo+IC0J
ICogU0ZEUCBvZiBNWDI1TDMyNTVFIGlzIEpFU0QyMTYsIHdoaWNoIGRvZXMgbm90IGluY2x1ZGUg
dGhlIFF1YWQKPiAtCSAqIEVuYWJsZSBiaXQgUmVxdWlyZW1lbnQgaW4gQkZQVC4gQXMgYSByZXN1
bHQsIGR1cmluZyBCRlBUIHBhcnNpbmcKPiAtCSAqIHRoZSBxdWFkX2VuYWJsZSBtYXNrIGlzIHJl
c2V0LiBUaGVyZWZvcmUsIGl0IGlzIG5lY2Vzc2FyeSB0bwo+IC0JICogY29ycmVjdCB0aGlzIHNl
dHRpbmcgYnkgbGF0ZV9pbml0Lgo+ICsJICogU0ZEUCBvZiBNWDI1TDMyNTVFIGRvZXMgbm90IGlu
Y2x1ZGUgdGhlIFF1YWQgRW5hYmxlIGJpdAo+ICsJICogUmVxdWlyZW1lbnQgaW4gQkZQVC4gQXMg
YSByZXN1bHQsIGR1cmluZyBCRlBUIHBhcnNpbmcgdGhlCj4gKwkgKiBxdWFkX2VuYWJsZSBtYXNr
IGFuZCBSRENSIG9wY29kZSBhcmUgcmVzZXQuIEVuc3VyZSB0aGVzZQo+ICsJICogdmFsdWVzIHJl
bWFpbiB2YWxpZC4KPiAgCSAqLwo+ICAJcGFyYW1zLT5xZV9tYXNrWzBdID0gQklUKDYpOwo+ICAJ
cGFyYW1zLT5xZV9tYXNrWzFdID0gMDsKPiArCXBhcmFtcy0+b3Bjb2Rlcy5yZWFkX3NyMiA9IDA7
CgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIHRoaXMgYWxzbyBjbGVhciBwYXJhbXMtPm9wY29k
ZXMud3JpdGVfc3IxX2FuZF9zcjI/CgpzcGlfbm9yX3BhcnNlX2JmcHQoKSBpbml0aWFsaXplcyB3
cml0ZV9zcjFfYW5kX3NyMiB0byBTUElOT1JfT1BfV1JTUiBiZWZvcmUKY2hlY2tpbmcgdGhlIFFF
UiBmaWVsZCBhbmQgb25seSBjbGVhcnMgaXQgaW4gdGhlIEJGUFRfRFdPUkQxNV9RRVJfU1IxX0JJ
VDYKY2FzZToKCmRyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jOnNwaV9ub3JfcGFyc2VfYmZwdCgp
IHsKICAgIC4uLgoJY2FzZSBCRlBUX0RXT1JEMTVfUUVSX1NSMV9CSVQ2OgoJCXBhcmFtcy0+b3Bj
b2Rlcy5yZWFkX3NyMiA9IDA7CgkJcGFyYW1zLT5vcGNvZGVzLndyaXRlX3NyMV9hbmRfc3IyID0g
MDsKCQlwYXJhbXMtPnFlX21hc2tbMF0gPSBCSVQoNik7CgkJYnJlYWs7CiAgICAuLi4KfQoKQmVj
YXVzZSBNWDI1TDMyNTVFIGhhcyBubyBRRVIgZW50cnkgaW4gaXRzIEJGUFQsIHdyaXRlX3NyMV9h
bmRfc3IyIHJlbWFpbnMKU1BJTk9SX09QX1dSU1IsIGNhdXNpbmcgc3BpX25vcl9nZW5lcmljX3F1
YWRfZW5hYmxlKCkgLT4Kc3BpX25vcl93cml0ZV9zcjFfYW5kX3NyMigpIHRvIGlzc3VlIGEgMi1i
eXRlIFdSU1IgY29tbWFuZCBpbnN0ZWFkIG9mIGEKMS1ieXRlIFNSMSB3cml0ZSB3aGVuIGVuYWJs
aW5nIFF1YWQgbW9kZS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjUtbWFjcm9uaXgtdXBzdHJlYW1pbmctc3BpLW5vci1jbGVh
bnVwLXYxLTAtMGQxYWI3ODNmZDhiQGJvb3RsaW4uY29tP3BhcnQ9MgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
