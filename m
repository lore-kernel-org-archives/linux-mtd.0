Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0190EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 02:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoa+1wmTP/jNtpDG3TYJB3V1z/b8AQf4gd71qAAPj5Y=; b=07npezp4ombt+C
	ff4bT6b/hup4c8UlW+4GtWjEhn12gISCoo61M8diFabNS2OTIV+VPxkmjNio6L3SLbOkGZMFIYLta
	TKIpWpdbjqRBe7IgwsG+BWMmskxoabtM2oguFIs3FWnoiGeKfWqk/lD4P4k4P+edpFsRNXaNuozjo
	fWVxSfYXQi9rL8D1Byw4SAv7LHxbtcKFkct0bkncvB50E/wiPd/aT8/r9VT1ccA4/Sr3gU5GESwSI
	lCRewWKb9lbix6JHWc/wTqGl2UxLH4rIEED7bAKJAtAJBp17HeqK7lJLwGsDUYC66pPc1/2NQfGb/
	jX9wCpMjZKe13vWW3xmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLE26-000sXq-0K;
	Mon, 17 Jul 2023 02:32:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLE1t-000sNu-12;
	Mon, 17 Jul 2023 02:32:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D4A560EFA;
	Mon, 17 Jul 2023 02:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C07BC433C7;
	Mon, 17 Jul 2023 02:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689561124;
	bh=TygDDThuAGFPASYXknOPwr8iDO2uUMGggFDRJAfrZF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnRW9g113g2a5Z/zbmYkRi7EjulhbW7DhnJmRdzDBKgZtOU2L5yu2VniEXZ5/1lnS
	 kpXZHxAHflpDLSP7AgmcCZRYKQwzXliMdg9AKvyTh2VZGt6SqhkFEBHrm3votBr+am
	 07R5wy9gj19sbxp0BGJats7WAoJSGBnOvvkl3zneYDK2syl2ncp+a6p2HGpTgLA+Ik
	 fmdioH0EdHtTlLxWQ+4qTM4WE6yVdaap2aceYNdcRY3SfcOFQakAiep5sLTy++1Ba6
	 FbXPpjLLtHkgVhlKKOI++yGcKP3dg2Hk4wtl89Nujd81yN7o/A3d44ZkPV66OShKxP
	 QonNMk5YpUGzw==
Date: Mon, 17 Jul 2023 08:01:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] mtd: rawnand: qcom: Early structure initialization
Message-ID: <20230717023150.GG5996@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_193205_615999_56B231A5 
X-CRM114-Status: GOOD (  18.42  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MTFQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBJbnN0ZWFkIG9mIGFsbG9jYXRpbmcgYSBzdHJ1Y3R1cmUgb24gdGhlIHN0YWNrIHdp
dGggcmFuZG9tIGRhdGEgYW5kIHRoZW4KPiBleHBlY3QgdGhlIGNhbGxlZSB0byBwZXJmb3JtIHRo
ZSBpbml0aWFsaXphdGlvbiAod2hpY2ggaXMsIGluIGdlbmVyYWwsCj4gZXJyb3IgcHJvbmUpLCBw
cmVmZXIgemVyb2luZyB0aGUgc3RydWN0dXJlIGV4cGxpY2l0bHkgYXQgYWxsb2NhdGlvbiBhbmQK
PiBwcm92aWRlIHRoZSBhbHJlYWR5IHplcm9lZCBhcmVhLCBzbyBubyBleHBsaWNpdCBtZW1zZXQg
b3BlcmF0aW9uIGlzCj4gbmVlZGVkLiBJdCBpcyBwcm9iYWJseSBzYWZlciB0byBkbyBzbywgc28g
d2UgbGltaXQgdGhlIHRpbWVmcmFtZSB3aGVuCj4gZGlydHkgZGF0YSBjb3VsZCBhY3R1YWxseSBi
ZSBhY2Nlc3NlZCBieSBtaXN0YWtlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpBY2tlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDxtYW5pQGtlcm5lbC5vcmc+CgotIE1hbmkKCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYyB8IDEyICsrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMKPiBpbmRleCBjYjZjY2FhMTkyMjQuLjRmYzhkYWZhOGYwMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMKPiBAQCAtMjYwMCw4ICsyNjAwLDYgQEAgc3RhdGljIHZvaWQgcWNvbV9w
YXJzZV9pbnN0cnVjdGlvbnMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCXVuc2lnbmVkIGlu
dCBvcF9pZDsKPiAgCWludCBpOwo+ICAKPiAtCW1lbXNldChxX29wLCAwLCBzaXplb2YoKnFfb3Ap
KTsKPiAtCj4gIAlmb3IgKG9wX2lkID0gMDsgb3BfaWQgPCBzdWJvcC0+bmluc3Ryczsgb3BfaWQr
Kykgewo+ICAJCXVuc2lnbmVkIGludCBvZmZzZXQsIG5hZGRyczsKPiAgCQljb25zdCB1OCAqYWRk
cnM7Cj4gQEAgLTI2ODEsNyArMjY3OSw3IEBAIHN0YXRpYyBpbnQgcWNvbV9yZWFkX3N0YXR1c19l
eGVjKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAlzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhv
c3QgPSB0b19xY29tX25hbmRfaG9zdChjaGlwKTsKPiAgCXN0cnVjdCBxY29tX25hbmRfY29udHJv
bGxlciAqbmFuZGMgPSBnZXRfcWNvbV9uYW5kX2NvbnRyb2xsZXIoY2hpcCk7Cj4gIAlzdHJ1Y3Qg
bmFuZF9lY2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKPiAtCXN0cnVjdCBxY29tX29wIHFfb3A7
Cj4gKwlzdHJ1Y3QgcWNvbV9vcCBxX29wID0ge307Cj4gIAljb25zdCBzdHJ1Y3QgbmFuZF9vcF9p
bnN0ciAqaW5zdHIgPSBOVUxMOwo+ICAJdW5zaWduZWQgaW50IG9wX2lkID0gMDsKPiAgCXVuc2ln
bmVkIGludCBsZW4gPSAwOwo+IEBAIC0yNzQ0LDcgKzI3NDIsNyBAQCBzdGF0aWMgaW50IHFjb21f
cmVhZF9pZF90eXBlX2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qgc3RydWN0IG5h
bmRfc3Vibwo+ICB7Cj4gIAlzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjID0gZ2V0
X3Fjb21fbmFuZF9jb250cm9sbGVyKGNoaXApOwo+ICAJc3RydWN0IHFjb21fbmFuZF9ob3N0ICpo
b3N0ID0gdG9fcWNvbV9uYW5kX2hvc3QoY2hpcCk7Cj4gLQlzdHJ1Y3QgcWNvbV9vcCBxX29wOwo+
ICsJc3RydWN0IHFjb21fb3AgcV9vcCA9IHt9Owo+ICAJY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5z
dHIgKmluc3RyID0gTlVMTDsKPiAgCXVuc2lnbmVkIGludCBvcF9pZCA9IDA7Cj4gIAl1bnNpZ25l
ZCBpbnQgbGVuID0gMDsKPiBAQCAtMjc5NSw3ICsyNzkzLDcgQEAgc3RhdGljIGludCBxY29tX21p
c2NfY21kX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBzdHJ1Y3QgbmFu
ZF9zdWIKPiAgewo+ICAJc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYyA9IGdldF9x
Y29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPiAgCXN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9z
dCA9IHRvX3Fjb21fbmFuZF9ob3N0KGNoaXApOwo+IC0Jc3RydWN0IHFjb21fb3AgcV9vcDsKPiAr
CXN0cnVjdCBxY29tX29wIHFfb3AgPSB7fTsKPiAgCWludCByZXQgPSAwOwo+ICAKPiAgCXFjb21f
cGFyc2VfaW5zdHJ1Y3Rpb25zKGNoaXAsIHN1Ym9wLCAmcV9vcCk7Cj4gQEAgLTI4MzgsNyArMjgz
Niw3IEBAIHN0YXRpYyBpbnQgcWNvbV9wYXJhbV9wYWdlX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCAgY29uc3Qgc3RydWN0IG5hbmRfCj4gIHsKPiAgCXN0cnVjdCBxY29tX25hbmRf
aG9zdCAqaG9zdCA9IHRvX3Fjb21fbmFuZF9ob3N0KGNoaXApOwo+ICAJc3RydWN0IHFjb21fbmFu
ZF9jb250cm9sbGVyICpuYW5kYyA9IGdldF9xY29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPiAt
CXN0cnVjdCBxY29tX29wIHFfb3A7Cj4gKwlzdHJ1Y3QgcWNvbV9vcCBxX29wID0ge307Cj4gIAlj
b25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIgPSBOVUxMOwo+ICAJdW5zaWduZWQgaW50
IG9wX2lkID0gMDsKPiAgCXVuc2lnbmVkIGludCBsZW4gPSAwOwo+IEBAIC0yOTM1LDcgKzI5MzMs
NyBAQCBzdGF0aWMgaW50IHFjb21fZXJhc2VfY21kX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBjb25zdCBzdHJ1Y3QgbmFuZF9zdQo+ICB7Cj4gIAlzdHJ1Y3QgcWNvbV9uYW5kX2hv
c3QgKmhvc3QgPSB0b19xY29tX25hbmRfaG9zdChjaGlwKTsKPiAgCXN0cnVjdCBxY29tX25hbmRf
Y29udHJvbGxlciAqbmFuZGMgPSBnZXRfcWNvbV9uYW5kX2NvbnRyb2xsZXIoY2hpcCk7Cj4gLQlz
dHJ1Y3QgcWNvbV9vcCBxX29wOwo+ICsJc3RydWN0IHFjb21fb3AgcV9vcCA9IHt9Owo+ICAJaW50
IHJldCA9IDA7Cj4gIAo+ICAJcWNvbV9wYXJzZV9pbnN0cnVjdGlvbnMoY2hpcCwgc3Vib3AsICZx
X29wKTsKPiAtLSAKPiAyLjM0LjEKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g
4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
