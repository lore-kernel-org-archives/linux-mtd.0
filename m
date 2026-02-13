Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F596EF48CC
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ep6mPQOGCMzUzwhcS855kYpQUnd6PFKZ2nEFrDa8sl8=; b=bNxLZUjFo0q9yl
	8wFPRUmdZQ9H7jFDVQVBosj0z2oGX4IZLwZ6vh3yRjdvI1oLCo+a+nkJDY/AG18fKQ5TZltYQ4uD3
	htC1kVis4vwEDTmmFg+8ELnMrKJFj3dt8vHqHkkISSymGBs+C7rGctfj2Bxy0FWo31X4q0mVefavL
	r/ewmxQQCxO+OXWh/WqFB9+NxwbNsw+ZYlUrMdzBsNWQzmB1vgLOm9dK6rLA39iT4bOyyoNdw0aXI
	Uj7cViDT++5yv0SwH9quDAf2xt35+HhvOmjpTcTsJJWtZ53aKJons9vE5eiNcnYbld4ajDzj62xIW
	s/smjEeARl26tPawNpbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoQT-00000003B1k-05rK;
	Fri, 13 Feb 2026 08:21:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoQP-00000003B14-2UM7
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 08:21:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 26C811A0E8E;
	Fri, 13 Feb 2026 08:21:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA7FA606CC;
	Fri, 13 Feb 2026 08:21:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8D0D10368DA6;
	Fri, 13 Feb 2026 09:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770970874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2Syg4XtkVjAlgOYhpuM1HSgS7vTX5OxBQsvPxk928Fs=;
	b=PjY2ZIDhEBVK0E85C+U9cRH+OvmQJGP0B+KnH1LHllT4Lngr5Wl27NJxYSiSTQ5nN+SoYf
	GcTxOfHZSsPKN3eJGc/v8tD6Ke1ROsZT10nL4111oGYSAg1TcVy1tMKILtazu1I5iB7EYi
	l8uIxz+lDLJRiZoRVl28pcR6QBkQ+nBKCa5L+oLjHFQqlAx5bgn1CUz/ecx1VU8Q2sUHHM
	G4jtLcO0lIhmoLdQKksb7us3tT+4fcceECMSI3LyWrKR2MIbn9xu7K8G3p9jx8hYd/g6b/
	AxEPe6pvJjNc6Ddh0oNleYecvMupvW0Ed7X/BKIdPKMF/vj1CnukoMS+YMLtNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 11/12] spi: cadence-quadspi: restrict PHY
 frequency to tuned operations
In-Reply-To: <fdcb19ff-c949-4538-8819-88720e514f04@ti.com> (Santhosh Kumar
	K.'s message of "Sat, 7 Feb 2026 00:57:04 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-12-s-k6@ti.com> <87zf5nf5g1.fsf@bootlin.com>
	<fdcb19ff-c949-4538-8819-88720e514f04@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 13 Feb 2026 09:21:11 +0100
Message-ID: <874inlxde0.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_002118_629134_BCE6FD5E 
X-CRM114-Status: GOOD (  16.69  )
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

T24gMDcvMDIvMjAyNiBhdCAwMDo1NzowNCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBPbiAwNS8wMi8yNiAyMzoxNywgTWlxdWVsIFJheW5hbCB3cm90ZToK
Pj4gSGkgU2FudGhvc2gsCj4+IAo+Pj4gKwkvKgo+Pj4gKwkgKiBQSFkgdHVuaW5nIGFsbG93cyBo
aWdoLWZyZXF1ZW5jeSBvcGVyYXRpb24gb25seSBmb3IgY2FsaWJyYXRlZAo+Pj4gKwkgKiBjb21t
YW5kcy4gVW5jYWxpYnJhdGVkIG9wZXJhdGlvbnMgdXNlIHNhZmUgbm9uLVBIWSBmcmVxdWVuY3kg
dG8KPj4+ICsJICogYXZvaWQgdGltaW5nIHZpb2xhdGlvbnMuCj4+PiArCSAqLwo+Pj4gKwlpZiAo
Y3FzcGktPmRkYXRhLT5leGVjdXRlX3R1bmluZyAmJiBmX3BkYXRhLT51c2VfcGh5ICYmCj4+PiAr
CSAgICAoY3FzcGlfb3BfbWF0Y2hlc190dW5lZChvcCwgJmZfcGRhdGEtPnBoeV9yZWFkX29wKSB8
fAo+Pj4gKwkgICAgIGNxc3BpX29wX21hdGNoZXNfdHVuZWQob3AsICZmX3BkYXRhLT5waHlfd3Jp
dGVfb3ApKSkgewo+Pj4gKwkJY3FzcGlfY29uZmlndXJlKGZfcGRhdGEsIG9wLT5tYXhfZnJlcSk7
Cj4+PiArCX0gZWxzZSBpZiAoY3FzcGktPmRkYXRhLT5leGVjdXRlX3R1bmluZykgewo+Pj4gKwkJ
LyogVXNlIHNhZmUgZnJlcXVlbmN5IGZvciB1bnR1bmVkIG9wZXJhdGlvbnMgKi8KPj4+ICsJCWNx
c3BpX2NvbmZpZ3VyZShmX3BkYXRhLCBmX3BkYXRhLT5ub25fcGh5X2Nsa19yYXRlKTsKPj4+ICsJ
fSBlbHNlIHsKPj4+ICsJCS8qIE5vIHR1bmluZyBzdXBwb3J0LCBhbHdheXMgdXNlIHJlcXVlc3Rl
ZCBmcmVxdWVuY3kgKi8KPj4+ICsJCWNxc3BpX2NvbmZpZ3VyZShmX3BkYXRhLCBvcC0+bWF4X2Zy
ZXEpOwo+Pj4gKwl9Cj4+IFNob3VsZG4ndCB3ZSBoYW5kbGUgdGhpcyBhdCB0aGUgY29yZSBsZXZl
bD8gV2Uga25vdyB3aGF0IGtpbmQgb2YKPj4gb3BlcmF0aW9uIHBhdHRlcm4gd2UgcHJvdmlkZWQs
IHNvIGl0IGlzIGVhc3kgdG8gc2V0IHRoZSBjb3JyZWN0Cj4+IGZyZXF1ZW5jeSBpbiB0aGUgb3Bl
cmF0aW9uIHN0cnVjdHVyZS4KPj4gQ2FuIHlvdSBwbGVhc2UgbWFrZSB0aGlzIGhhcHBlbj8gUGVy
aGFwcyB5b3UgY2FuIHJldHVybiB0aGUgb3BlcmF0aW9uCj4+IGZyZXF1ZW5jeSBvbmNlIHRoZSBj
YWxpYnJhdGlvbiBpcyBzdWNjZXNzZnVsIChpbiB0aGUgcmVhZCBhbmQgd3JpdGUgb3AKPj4gdGVt
cGxhdGVzIG1heWJlPykgc28gdGhpcyBjYW4gYmUgcGlja2VkIHVwIGJ5IHRoZSBjb3JlIGFuZCB1
c2VkIGZvciB0aGUKPj4gZm9sbG93aW5nIG9wZXJhdGlvbnMuIFRoaXMgd2F5IHRoZSBjb250cm9s
bGVyIGRyaXZlciBubyBsb25nZXIgbmVlZHMgdG8KPj4gY2hlY2sgaWYgdGhlIG9wZXJhdGlvbiBo
YXMgYmVlbiB0dW5lZCBvciBub3QsIGl0IGNhbiBqdXN0IGxvb2sgYXQgdGhlCj4+IGZyZXF1ZW5j
eS4gV2hlbiB1c2luZyB0aGUgaGlnaGVzdCBmcmVxdWVuY3ksIFBIWSB0dW5pbmcgbXVzdCBiZQo+
PiB1c2VkL2VuYWJsZWQsIG90aGVyd2lzZSBub3QuCj4KPiBObywgTWlxdWVsLCB0aGlzIG1heSBu
b3QgYmUgY29ycmVjdC4gVGhlcmUgY2FuIGJlIGNhc2VzIHdoZXJlIGFuCj4gb3BlcmF0aW9uIGRv
ZXMgbm90IHJlcXVpcmUgdHVuaW5nIGJ1dCBzdGlsbCBjYW4gcnVuIGF0IG1heGltdW0KPiBmcmVx
dWVuY3kgKDE2NiBNSHosIGZvciBpbnN0YW5jZSkuCgpUaGlzIGlzIGN1cnJlbnRseSBub3QgdGhl
IGNhc2UuIEN1cnJlbnRseSB5b3UgdHVuZSBmb3Igb25lIG9yIHR3byBvcHMKKHJlYWQvd3JpdGUp
IGFuZCB5b3UgZW5hYmxlIFBIWSB0dW5pbmcgb25seSBvbiB0aGVzZS4gRG8geW91IHBsYW4gb24K
YWRkaW5nIHN1Y2ggYSBmZWF0dXJlPyBJZiBub3QsIEkgd291bGQgbm90IGJvdGhlciB3aXRoIHRo
aXMgbm93LgoKPiBJbiBzdWNoIHNjZW5hcmlvcywgc2ltcGx5IHNldHRpbmcKPiBvcC0+bWF4X2Zy
ZXEgdG8gdGhlIG1heGltdW0gZnJlcXVlbmN5IHZhbHVlIGFuZCBkZWNpZGluZyB3aGV0aGVyIHRv
Cj4gZW5hYmxlIHR1bmluZyBiYXNlZCBvbiBhbiBvcC0+bWF4X2ZyZXEgY29tcGFyaXNvbiB3b3Vs
ZCBub3QgYmUKPiBzdWZmaWNpZW50LgoKSWYgdGhlcmUgYXJlIHN1Y2ggY2FzZXMsIGNhbiB0aGV5
IGJlIGxpc3RlZD8gSSBhbSBzb3JyeSBidXQgSSBmYWlsIHRvCnNlZSB3aGVyZSB0aGlzIHdvdWxk
IG5vdCB3b3JrLiBBbnkgZXhhbXBsZXMgdG8gc2hhcmU/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
