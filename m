Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0E3EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 02:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXKdZTdhmzsJkTXM7k/Fo/HHqfAyVs8BWhNYTOK7sZQ=; b=shBELDgqJ6JP2b
	QcugSIHLfL8lt7+Fl5cgkDov+N2tzzq8roAXxW1FmyDSItlvzXn+BAMMLTXDbHHaUEHGQgYsX8KJw
	Q604Oit+F4JOc2jYKbcGag9cI8VwbTt/gP5rWY/95uLupeDcUYl84iS2VItb4uwQw3y/lMnycbKBI
	yzEBdzyfibgVFM7VpOjm1fOQFBRt4AV5VVjEFUT8Fv+Fa6H93M2YAhKPu4R8lcqVm+2S7GyXKedrf
	cpX283zmatukLRunPObG+UYBUyjQrsFbne4mu4KV5gReYAFI41je6MlSJtFGY52rzsmAcIxio7ETM
	GkVo+QCmJ71ToMH42mlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDxB-000p0b-1X;
	Mon, 17 Jul 2023 02:27:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDx7-000ox2-0X;
	Mon, 17 Jul 2023 02:27:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B8F460EFA;
	Mon, 17 Jul 2023 02:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423B7C433C7;
	Mon, 17 Jul 2023 02:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689560827;
	bh=pgljk7o+6xZU67GgmI2Tm4OBqh+u8Sce3XovZfZQkbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIDFhHbpm3VsOVNgIKZINmZbnxbK5EVUg7+veVAehbPnlGvr/DDnBZQae3Uxy8eep
	 E4Zc9m7l7xkdHrytpu62sIPdI910Z28bNTLZBR2BJd9jp3z/wCF3x6QaZFLXJw0Mf+
	 IK2iBK5gan1fINKzKOzz8STvlkEdB0aXgF0wxOWeAmg68OzlGJMgH2bL3eiHAY/n8q
	 1yeCf/9pqel7hbMmpNr5/bbWEmNNHY5UG2y5mNG9uWNio8/g2ftfqY7UqhIT9QNtOO
	 2j4GChhzv1Fd5RsrklURn39ejVocZj/nzNEGQ8ypYupqXuhARUZCdzHYfm1z0b6uTD
	 tLOThDz92jHlA==
Date: Mon, 17 Jul 2023 07:56:54 +0530
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
Subject: Re: [PATCH 2/8] mtd: rawnand: qcom: Use u8 instead of uint8_t
Message-ID: <20230717022654.GB5996@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_192709_493171_40521ED1 
X-CRM114-Status: GOOD (  16.23  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MDZQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBGaXggdGhlIGZvbGxvd2luZyBjaGVja3BhdGNoIHdhcm5pbmc6Cj4gICAgICJDSEVD
SzogUHJlZmVyIGtlcm5lbCB0eXBlICd1OCcgb3ZlciAndWludDhfdCciCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCkFja2VkLWJ5
OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4KCi0gTWFuaQoKPiAtLS0K
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgMTAgKysrKystLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCAwMjNjOGIzNjQyNmIuLjAxMzZkZjAxNzM4ZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjEyLDcgKzIxMiw3IEBAIG5h
bmRjX3NldF9yZWcoY2hpcCwgcmVnLAkJCVwKPiAgLyogUmV0dXJucyB0aGUgZG1hIGFkZHJlc3Mg
Zm9yIHJlZyByZWFkIGJ1ZmZlciAqLwo+ICAjZGVmaW5lIHJlZ19idWZfZG1hX2FkZHIoY2hpcCwg
dmFkZHIpIFwKPiAgCSgoY2hpcCktPnJlZ19yZWFkX2RtYSArIFwKPiAtCSgodWludDhfdCAqKSh2
YWRkcikgLSAodWludDhfdCAqKShjaGlwKS0+cmVnX3JlYWRfYnVmKSkKPiArCSgodTggKikodmFk
ZHIpIC0gKHU4ICopKGNoaXApLT5yZWdfcmVhZF9idWYpKQo+ICAKPiAgI2RlZmluZSBRUElDX1BF
Ul9DV19DTURfRUxFTUVOVFMJMzIKPiAgI2RlZmluZSBRUElDX1BFUl9DV19DTURfU0dMCQkzMgo+
IEBAIC0xODg0LDcgKzE4ODQsNyBAQCBzdGF0aWMgdm9pZCBxY29tX25hbmRjX2NvZGV3b3JkX2Zp
eHVwKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50IHBhZ2UpCj4gIH0KPiAgCj4gIC8q
IGltcGxlbWVudHMgZWNjLT5yZWFkX3BhZ2UoKSAqLwo+IC1zdGF0aWMgaW50IHFjb21fbmFuZGNf
cmVhZF9wYWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVpbnQ4X3QgKmJ1ZiwKPiArc3RhdGlj
IGludCBxY29tX25hbmRjX3JlYWRfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1OCAqYnVm
LAo+ICAJCQkJaW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCj4gIHsKPiAgCXN0cnVjdCBxY29t
X25hbmRfaG9zdCAqaG9zdCA9IHRvX3Fjb21fbmFuZF9ob3N0KGNoaXApOwo+IEBAIC0xOTEyLDcg
KzE5MTIsNyBAQCBzdGF0aWMgaW50IHFjb21fbmFuZGNfcmVhZF9wYWdlKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsIHVpbnQ4X3QgKmJ1ZiwKPiAgfQo+ICAKPiAgLyogaW1wbGVtZW50cyBlY2MtPnJl
YWRfcGFnZV9yYXcoKSAqLwo+IC1zdGF0aWMgaW50IHFjb21fbmFuZGNfcmVhZF9wYWdlX3Jhdyhz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50OF90ICpidWYsCj4gK3N0YXRpYyBpbnQgcWNvbV9u
YW5kY19yZWFkX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHU4ICpidWYsCj4gIAkJ
CQkgICAgaW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCj4gIHsKPiAgCXN0cnVjdCBtdGRfaW5m
byAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7Cj4gQEAgLTE5NTgsNyArMTk1OCw3IEBAIHN0YXRp
YyBpbnQgcWNvbV9uYW5kY19yZWFkX29vYihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgcGFn
ZSkKPiAgfQo+ICAKPiAgLyogaW1wbGVtZW50cyBlY2MtPndyaXRlX3BhZ2UoKSAqLwo+IC1zdGF0
aWMgaW50IHFjb21fbmFuZGNfd3JpdGVfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25z
dCB1aW50OF90ICpidWYsCj4gK3N0YXRpYyBpbnQgcWNvbV9uYW5kY193cml0ZV9wYWdlKHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpidWYsCj4gIAkJCQkgaW50IG9vYl9yZXF1aXJl
ZCwgaW50IHBhZ2UpCj4gIHsKPiAgCXN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCA9IHRvX3Fj
b21fbmFuZF9ob3N0KGNoaXApOwo+IEBAIC0yMDM1LDcgKzIwMzUsNyBAQCBzdGF0aWMgaW50IHFj
b21fbmFuZGNfd3JpdGVfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1aW50OF90
ICpidWYsCj4gIAo+ICAvKiBpbXBsZW1lbnRzIGVjYy0+d3JpdGVfcGFnZV9yYXcoKSAqLwo+ICBz
dGF0aWMgaW50IHFjb21fbmFuZGNfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwKPiAtCQkJCSAgICAgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgb29iX3JlcXVpcmVkLAo+ICsJ
CQkJICAgICBjb25zdCB1OCAqYnVmLCBpbnQgb29iX3JlcXVpcmVkLAo+ICAJCQkJICAgICBpbnQg
cGFnZSkKPiAgewo+ICAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsK
PiAtLSAKPiAyLjM0LjEKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k
4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
