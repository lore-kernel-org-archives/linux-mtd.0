Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434D1C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 10:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E46C60FE8
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 10:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E46C60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ptu9eufytpjh5Y/R3x8qvy28yzrAqNrZjoQW8wKVhII=; b=GdQiW9g5i32eiVREqpmkaYuKqV
	mHxPypA7JKyoPxkyiWCz84cmevwUsW4SfUuDlIbCIo+9jl/IfeOiDk9F/cRSx0Sii+SBozS978LWK
	YuuzaiaZIuLrQ5iYXc3UktL3AcGs+fAAiTWqLLhYEP7JJaQDarylwWE6ZDWqlFclTvev1g1+xPsVh
	pxN5tRAdlc3JWPGBpwTynaLf1STvsT7hZOj1wF5ZJs682xE60H9WaYwlOWgT+GWQbgI1mHs1MUQ65
	1ASpxe4xI3mZi/Dc6rLFIN+BC60EbGOZpK3iemjb+0Dv8voTCWrSv3WkFBkGsypoV/VBLaiCg950j
	SN43gdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH1xr-00AiX5-JA; Fri, 20 Aug 2021 10:41:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH1xg-00AiUR-7y
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 10:41:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KAfCEr105704;
 Fri, 20 Aug 2021 05:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629456072;
 bh=7MXaO4GKe/fPH6zc16itUHi0h/KHPxryWe1gFsakmI8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XfnMLdRCROtMcwxUefpXWNewRQIbwey1QekMuLbZH9zOoa3fcl7OgpB6+lzUK+l96
 OiEUx+jgi2nu5tbr/NXTnycRc5bYASkeJrCdr0xDMFAyKVt+aHKz3d3b9lN0Jdhu6y
 E+JJ/9mtoWvsvZtr1g4IaTVqghhJoskSFKC6W1gQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KAfCt8055052
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 05:41:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 05:41:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 05:41:11 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KAf6Th096048;
 Fri, 20 Aug 2021 05:41:07 -0500
Subject: Re: [PATCH 07/13] mtd: spinand: Allow enabling Octal DTR mode in the
 core
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-8-a-nandan@ti.com> <20210806205845.03dd97c9@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <c3e52b84-7ffc-8e48-d0c7-f17fa0b71f6b@ti.com>
Date: Fri, 20 Aug 2021 16:11:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806205845.03dd97c9@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_034120_407976_9ABFC087 
X-CRM114-Status: GOOD (  30.09  )
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

SGkgTWlxdcOobCwKCk9uIDA3LzA4LzIxIDEyOjI4IGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEFwdXJ2YSwKPiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9u
IFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6MzIKPiArMDAwMDoKPiAKPj4gRW5hYmxlIE9jdGFsIERU
UiBTUEkgbW9kZSwgaS5lLiA4RC04RC04RCBtb2RlLCBpZiB0aGUgU1BJIE5BTkQgZmxhc2gKPj4g
ZGV2aWNlIHN1cHBvcnRzIGl0LiBNaXhlZCBPU1BJICgxUy0xUy04UyAmIDFTLThTLThTKSwgbWl4
ZWQgRFRSIG1vZGVzCj4+ICgxUy0xRC04RCksIGV0Yy4gYXJlbid0IHN1cHBvcnRlZCB5ZXQuCj4+
Cj4+IFRoZSBtZXRob2QgdG8gc3dpdGNoIHRvIE9jdGFsIERUUiBTUEkgbW9kZSBtYXkgdmFyeSBh
Y3Jvc3MKPj4gbWFudWZhY3R1cmVycy4gRm9yIGV4YW1wbGUsIGZvciBXaW5ib25kLCBpdCBpcyBl
bmFibGVkIGJ5IHdyaXRpbmcKPj4gdmFsdWVzIHRvIHRoZSB2b2xhdGlsZSBjb25maWd1cmF0aW9u
IHJlZ2lzdGVyLiBTbywgbGV0IHRoZQo+PiBtYW51ZmFjdHVyZXIncyBjb2RlIGhhdmUgdGhlaXIg
b3duIGltcGxlbWVudGF0aW9uIGZvciBzd2l0Y2hpbmcgdG8KPj4gT2N0YWwgRFRSIFNQSSBtb2Rl
LiBNaXhlZCBPU1BJICgxUy0xUy04UyAmIDFTLThTLThTKSwgbWl4ZWQgRFRSIG1vZGVzCj4+ICgx
Uy0xRC04RCksIGV0Yy4gYXJlbid0IHN1cHBvcnRlZCB5ZXQuCj4gCj4gWW91IGNhbiBkcm9wIHRo
ZSBmaW5hbCBzZW50ZW5jZSB3aGljaCBpcyBhIHJlcGV0aXRpb24gb2YgdGhlIHByZXZpb3VzCj4g
cGFyYWdyYXBoLgo+IAoKWWVzIHJpZ2h0IQoKPj4gQ2hlY2sgZm9yIHRoZSBTUEkgTkFORCBkZXZp
Y2UncyBzdXBwb3J0IGZvciBPY3RhbCBEVFIgbW9kZSB1c2luZwo+PiBzcGluYW5kIGZsYWdzLCBh
bmQgaWYgdGhlIG9wX3RlbXBsYXRlcyBhbGxvdyA4RC04RC04RCwgY2FsbAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsbG93cwo+IAo+PiBvY3RhbF9kdHJfZW5h
YmxlKCkgbWFudWZhY3R1cmVyIG9wLiBJZiB0aGUgU1BJIGNvbnRyb2xsZXIgZG9lc24ndAo+PiBz
dXBwb3J0cyB0aGVzZSBtb2RlcywgdGhlIHNlbGVjdGVkIG9wX3RlbXBsYXRlcyB3b3VsZCBwcmV2
ZW50IHN3aXRjaGluZwo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHdpbGwKPiAKPj4gdG8gdGhlIE9jdGFsIERUUiBtb2RlLiBBbmQgZmluYWxs
eSB1cGRhdGUgdGhlIHNwaW5hbmQgcmVnX3Byb3RvCj4+IGlmIHN1Y2Nlc3MuCj4gCj4gICAgb24K
PiAKCk9rYXksIHdpbGwgY29ycmVjdCBhbGwhCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEg
TmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICBp
bmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggfCAgMyArKysKPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDQ5IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBpbmRleCAxZTYxOWI2ZDc3
N2YuLjE5ZDhhZmZhYzA1OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29y
ZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBAQCAtMjU2LDYgKzI1
Niw0OCBAQCBzdGF0aWMgaW50IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZShzdHJ1Y3Qgc3BpbmFu
ZF9kZXZpY2UgKnNwaW5hbmQpCj4+ICAgCQkJICAgICAgIGVuYWJsZSA/IENGR19RVUFEX0VOQUJM
RSA6IDApOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyBib29sIHNwaW5hbmRfb3BfaXNfb2N0YWxf
ZHRyKGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCkKPj4gK3sKPj4gKwlyZXR1cm4gIG9wLT5j
bWQuYnVzd2lkdGggPT0gOCAmJiBvcC0+Y21kLmR0ciAmJgo+PiArCQlvcC0+YWRkci5idXN3aWR0
aCA9PSA4ICYmIG9wLT5hZGRyLmR0ciAmJgo+PiArCQlvcC0+ZGF0YS5idXN3aWR0aCA9PSA4ICYm
IG9wLT5kYXRhLmR0cjsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBzcGluYW5kX2luaXRfb2N0
YWxfZHRyX2VuYWJsZShzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4+ICt7Cj4+ICsJ
c3RydWN0IGRldmljZSAqZGV2ID0gJnNwaW5hbmQtPnNwaW1lbS0+c3BpLT5kZXY7Cj4+ICsJaW50
IHJldDsKPj4gKwo+PiArCWlmICghKHNwaW5hbmQtPmZsYWdzICYgU1BJTkFORF9IQVNfT0NUQUxf
RFRSX0JJVCkpCj4+ICsJCXJldHVybiAwOwo+PiArCj4+ICsJaWYgKCEoc3BpbmFuZF9vcF9pc19v
Y3RhbF9kdHIoc3BpbmFuZC0+b3BfdGVtcGxhdGVzLnJlYWRfY2FjaGUpICYmCj4+ICsJICAgICAg
c3BpbmFuZF9vcF9pc19vY3RhbF9kdHIoc3BpbmFuZC0+b3BfdGVtcGxhdGVzLndyaXRlX2NhY2hl
KSAmJgo+PiArCSAgICAgIHNwaW5hbmRfb3BfaXNfb2N0YWxfZHRyKHNwaW5hbmQtPm9wX3RlbXBs
YXRlcy51cGRhdGVfY2FjaGUpKSkKPj4gKwkJcmV0dXJuIDA7Cj4+ICsKPj4gKwlpZiAoIXNwaW5h
bmQtPm1hbnVmYWN0dXJlci0+b3BzLT5vY3RhbF9kdHJfZW5hYmxlKSB7Cj4+ICsJCWRldl9lcnIo
ZGV2LAo+PiArCQkJIk1pc3NpbmcgLT5vY3RhbF9kdHJfZW5hYmxlKCksIHVuYWJsZSB0byBzd2l0
Y2ggbW9kZVxuIik7Cj4gCj4gSSBkb24ndCB0aGluayB3ZSB3YW50IGFuIGVycm9yIGhlcmUuIFBl
cmhhcHMgYSBkZWJ1ZyBvciBpbmZvIGNhbGwsIGJ1dAo+IG5vIG1vcmUuCj4gCgpBZ3JlZSEKCj4+
ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCX0KPj4gKwo+PiArCXJldCA9IHNwaW5hbmQtPm1hbnVm
YWN0dXJlci0+b3BzLT5vY3RhbF9kdHJfZW5hYmxlKHNwaW5hbmQpOwo+PiArCWlmIChyZXQpIHsK
Pj4gKwkJZGV2X2VycihkZXYsCj4+ICsJCQkiRmFpbGVkIHRvIGVuYWJsZSBPY3RhbCBEVFIgU1BJ
IG1vZGUgKGVyciA9ICVkKVxuIiwKPj4gKwkJCXJldCk7Cj4+ICsJCXJldHVybiByZXQ7Cj4+ICsJ
fQo+PiArCj4+ICsJc3BpbmFuZC0+cmVnX3Byb3RvID0gU1BJTkFORF9PQ1RBTF9EVFI7Cj4+ICsK
Pj4gKwlkZXZfZGJnKGRldiwKPj4gKwkJIiVzIFNQSSBOQU5EIHN3aXRjaGVkIHRvIE9jdGFsIERU
UiBTUEkgKDhELThELThEKSBtb2RlXG4iLAo+PiArCQlzcGluYW5kLT5tYW51ZmFjdHVyZXItPm5h
bWUpOwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+ICAgc3RhdGljIGludCBzcGluYW5kX2Vj
Y19lbmFibGUoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+PiAgIAkJCSAgICAgIGJv
b2wgZW5hYmxlKQo+PiAgIHsKPj4gQEAgLTExODksNiArMTIzMSwxMCBAQCBzdGF0aWMgaW50IHNw
aW5hbmRfaW5pdF9mbGFzaChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4+ICAgCWlm
IChyZXQpCj4+ICAgCQlyZXR1cm4gcmV0Owo+PiAgIAo+PiArCXJldCA9IHNwaW5hbmRfaW5pdF9v
Y3RhbF9kdHJfZW5hYmxlKHNwaW5hbmQpOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybiByZXQ7
Cj4+ICsKPj4gICAJcmV0ID0gc3BpbmFuZF91cGRfY2ZnKHNwaW5hbmQsIENGR19PVFBfRU5BQkxF
LCAwKTsKPj4gICAJaWYgKHJldCkKPj4gICAJCXJldHVybiByZXQ7Cj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgK
Pj4gaW5kZXggMzU4MTZiOGNmZTgxLi5kYWEyYWM1YzMxMTAgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1
ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5k
LmgKPj4gQEAgLTI3MSw2ICsyNzEsNyBAQCBzdHJ1Y3Qgc3BpbmFuZF9kZXZpZCB7Cj4+ICAgICog
QGluaXQ6IGluaXRpYWxpemUgYSBTUEkgTkFORCBkZXZpY2UKPj4gICAgKiBAYWRqdXN0X29wOiBt
b2RpZnkgdGhlIG9wcyBmb3IgYW55IHZhcmlhdGlvbiBpbiB0aGVpciBjbWQsIGFkZHJlc3MsIGR1
bW15IG9yCj4+ICAgICoJICAgICAgIGRhdGEgcGhhc2UgYnkgdGhlIG1hbnVmYWN0dXJlcgo+PiAr
ICogQG9jdGFsX2R0cl9lbmFibGU6IHN3aXRjaCB0aGUgU1BJIE5BTkQgZmxhc2ggaW50byBPY3Rh
bCBEVFIgU1BJIG1vZGUKPj4gICAgKiBAY2xlYW51cDogY2xlYW51cCBhIFNQSSBOQU5EIGRldmlj
ZQo+PiAgICAqCj4+ICAgICogRWFjaCBTUEkgTkFORCBtYW51ZmFjdHVyZXIgZHJpdmVyIHNob3Vs
ZCBpbXBsZW1lbnQgdGhpcyBpbnRlcmZhY2Ugc28gdGhhdAo+PiBAQCAtMjgwLDYgKzI4MSw3IEBA
IHN0cnVjdCBzcGluYW5kX21hbnVmYWN0dXJlcl9vcHMgewo+PiAgIAlpbnQgKCppbml0KShzdHJ1
Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpOwo+PiAgIAl2b2lkICgqYWRqdXN0X29wKShzdHJ1
Y3Qgc3BpX21lbV9vcCAqb3AsCj4+ICAgCQkJICBjb25zdCBlbnVtIHNwaW5hbmRfcHJvdG8gcmVn
X3Byb3RvKTsKPj4gKwlpbnQgKCpvY3RhbF9kdHJfZW5hYmxlKShzdHJ1Y3Qgc3BpbmFuZF9kZXZp
Y2UgKnNwaW5hbmQpOwo+PiAgIAl2b2lkICgqY2xlYW51cCkoc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kKTsKPj4gICB9Owo+PiAgIAo+PiBAQCAtMzQ4LDYgKzM1MCw3IEBAIHN0cnVjdCBz
cGluYW5kX2VjY19pbmZvIHsKPj4gICAKPj4gICAjZGVmaW5lIFNQSU5BTkRfSEFTX1FFX0JJVAkJ
QklUKDApCj4+ICAgI2RlZmluZSBTUElOQU5EX0hBU19DUl9GRUFUX0JJVAkJQklUKDEpCj4+ICsj
ZGVmaW5lIFNQSU5BTkRfSEFTX09DVEFMX0RUUl9CSVQJQklUKDIpCj4+ICAgCj4+ICAgLyoqCj4+
ICAgICogc3RydWN0IHNwaW5hbmRfb25kaWVfZWNjX2NvbmYgLSBwcml2YXRlIFNQSS1OQU5EIG9u
LWRpZSBFQ0MgZW5naW5lIHN0cnVjdHVyZQo+IAo+IAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hs
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4gCgpUaGFua3MsCkFwdXJ2
YSBOYW5kYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
