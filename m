Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E76AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jun 2022 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxCVQo5dULIs75+wxJ3bqnkyXRHb7erb5xjItNwsoxQ=; b=qf791rjBP6gVDK
	xd08HTu7eONyDzNHfdvnfaQ3hT+K4M/l1V3pmJEZYowRf9hv24EBS8QXpUUEhtTGDszzN2B03io4M
	oK4atd+oqKBWcq+JoZmoVUOtXGdgg1p9n/ReBlFFUnUCqpKLGcYUgZuJ4OxA6D/Vsp7glZTaGglFz
	5SmUe7PMjm1jPzccaZIKrYc2+eBnS8BEDYZ97ExiHUnwOzQ3uBBOtvdWUDRiQ+Le3PU2U5BHdEpHB
	7Wod00xwvqmKu+K8641N8c0i501phCJrxWzbBvCiRVmEHh5K+s5bW4QattxdxO4n8psv2lvd9LURY
	QnkRu8Gax5xWcrF3u7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1DZw-00BHC7-D5; Tue, 14 Jun 2022 20:56:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1DZt-00BHAE-71
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2022 20:55:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E9EB6164B;
	Tue, 14 Jun 2022 20:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6449AC3411B;
	Tue, 14 Jun 2022 20:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655240151;
	bh=XzEAK2y5Iei2R8rsITjcjNvlSr4PiUjEUS7DNftkwGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+477iWvi8LLsQiEZY2hhhQ40qc7phf5EbKKe1GuDHgRJXxTt+MG2/rD8GTYsOqBl
	 CasgghvFA/MX721GElqHLUbboFEUU0y/kgk6k5wzD7+RD3Tc+rsXH+AocbYtU4BZJG
	 ezxk4R1JY8hSnTtTLoheIaI/EoQvvBLajGpcce/Lzilh+3lnUONfUJRJGjEvqatiqD
	 v8ZAVP2JJ8JiohhAmQo10X1wGXF5UjICvydhJnBg7SJ/U1WwaVUo46gLXOC/qYjDiu
	 oXZ/waiR/Is4B/W7vcOgNNVd5DfMzisbrhLptJpzEZ8nR1vluxOKojCE46Q4dR3grm
	 g/qVgaaQ1ojqw==
Date: Wed, 15 Jun 2022 02:25:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
Message-ID: <20220614205550.GA5596@thinkpad>
References: <20220609132344.17548-1-ansuelsmth@gmail.com>
 <20220609132344.17548-2-ansuelsmth@gmail.com>
 <20220609170722.GA5081@thinkpad>
 <62a2298c.1c69fb81.bc909.d2d0@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62a2298c.1c69fb81.bc909.d2d0@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_135557_369168_A2B76BE1 
X-CRM114-Status: GOOD (  25.95  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMDc6MTA6MzNQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IE9uIFRodSwgSnVuIDA5LCAyMDIyIGF0IDEwOjM3OjIyUE0gKzA1MzAsIE1hbml2YW5u
YW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDA5LCAyMDIyIGF0IDAzOjIzOjQy
UE0gKzAyMDAsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+ID4gUmVvcmRlciBxY29tX25hbmRfaG9z
dCB0byBzYXZlIGhvbGVzIGluIHRoZSBzdHJ1Y3QuCj4gPiAKPiA+IFlvdSBmb3Jnb3QgdG8gcmVv
cmRlciBvdGhlciBzdHJ1Y3RzIGFsc28gYXMgSSByZXF1ZXN0ZWQgOi8KPiA+IAo+ID4gVGhhbmtz
LAo+ID4gTWFuaQo+ID4KPiAKPiBNaGhoIEkgZGlkbid0IGZpbmQgb2J2aXVzIGhvbGUgaW4gb3Ro
ZXIgc3RydWN0Lgo+IFRoaW5rIEkgd2lsbCBwYXNzIHRoaXMgd2l0aCBkd2FyZiB0byBiZXR0ZXIg
Y2hlY2sgdGhlbS4gU29ycnkhCj4gRmVlbCBmcmVlIHRvIHBvaW50IHRoZW0gaWYgeW91IG5vdGlj
ZSBvYnZpdXMgaG9sZSB0aGF0IEkgZGlkbid0IG5vdGljZS4KPiAKClNvcnJ5LCBJIHNob3VsZCBi
ZSBleHBsaWNpdC4gUGxlYXNlIHJlYXJyYW5nZSB0aGUgbWVtYmVycyBpbiBvdGhlciBzdHJ1Y3Rz
IHN1Y2gKdGhhdCB3ZSBjb3VsZCBhdm9pZCBob2xlcyAoaW4gZnV0dXJlIGFsc28pLiBGb3IgaW5z
dGFuY2UsIGluCiJzdHJ1Y3QgYmFtX3RyYW5zYWN0aW9uIiB1MzIncyBhbmQgYm9vbCBhcmUgbWl4
ZWQgaW4gdGhlIG1pZGRsZS4gWW91IGNvdWxkCm9yZ2FuaXplIHRoZW0gbGlrZSwKCnN0cnVjdCBw
b2ludGVyCnN0cnVjdAp1MzIKYm9vbAoKQW5kIHRoaXMgZ29lcyBzYW1lIGZvciBhbGwgb3RoZXIg
c3RydWN0cyBhcyB3ZWxsLgoKVGhhbmtzLApNYW5pCgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1i
eTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAxMCArKysrKystLS0tCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gPiBpbmRleCAxYTc3NTQyYzZkNjcuLjdm
YmJkM2U3Nzg0YyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9u
YW5kYy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4g
PiBAQCAtNDMxLDExICs0MzEsMTIgQEAgc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyIHsKPiA+
ID4gICAqCQkJCWFuZCByZXNlcnZlZCBieXRlcwo+ID4gPiAgICogQGN3X2RhdGE6CQkJdGhlIG51
bWJlciBvZiBieXRlcyB3aXRoaW4gYSBjb2Rld29yZCBwcm90ZWN0ZWQKPiA+ID4gICAqCQkJCWJ5
IEVDQwo+ID4gPiArICogQGVjY19ieXRlc19odzoJCUVDQyBieXRlcyB1c2VkIGJ5IGNvbnRyb2xs
ZXIgaGFyZHdhcmUgZm9yIHRoaXMKPiA+ID4gKyAqCQkJCWNoaXAKPiA+ID4gKyAqCj4gPiA+ICAg
KiBAdXNlX2VjYzoJCQlyZXF1ZXN0IHRoZSBjb250cm9sbGVyIHRvIHVzZSBFQ0MgZm9yIHRoZQo+
ID4gPiAgICoJCQkJdXBjb21pbmcgcmVhZC93cml0ZQo+ID4gPiAgICogQGJjaF9lbmFibGVkOgkJ
ZmxhZyB0byB0ZWxsIHdoZXRoZXIgQkNIIEVDQyBtb2RlIGlzIHVzZWQKPiA+ID4gLSAqIEBlY2Nf
Ynl0ZXNfaHc6CQlFQ0MgYnl0ZXMgdXNlZCBieSBjb250cm9sbGVyIGhhcmR3YXJlIGZvciB0aGlz
Cj4gPiA+IC0gKgkJCQljaGlwCj4gPiA+ICAgKiBAc3RhdHVzOgkJCXZhbHVlIHRvIGJlIHJldHVy
bmVkIGlmIE5BTkRfQ01EX1NUQVRVUyBjb21tYW5kCj4gPiA+ICAgKgkJCQlpcyBleGVjdXRlZAo+
ID4gPiAgICogQGxhc3RfY29tbWFuZDoJCWtlZXBzIHRyYWNrIG9mIGxhc3QgY29tbWFuZCBvbiB0
aGlzIGNoaXAuIHVzZWQKPiA+ID4gQEAgLTQ1MiwxMSArNDUzLDEyIEBAIHN0cnVjdCBxY29tX25h
bmRfaG9zdCB7Cj4gPiA+ICAJaW50IGNzOwo+ID4gPiAgCWludCBjd19zaXplOwo+ID4gPiAgCWlu
dCBjd19kYXRhOwo+ID4gPiAtCWJvb2wgdXNlX2VjYzsKPiA+ID4gLQlib29sIGJjaF9lbmFibGVk
Owo+ID4gPiAgCWludCBlY2NfYnl0ZXNfaHc7Cj4gPiA+ICAJaW50IHNwYXJlX2J5dGVzOwo+ID4g
PiAgCWludCBiYm1fc2l6ZTsKPiA+ID4gKwo+ID4gPiArCWJvb2wgdXNlX2VjYzsKPiA+ID4gKwli
b29sIGJjaF9lbmFibGVkOwo+ID4gPiAgCXU4IHN0YXR1czsKPiA+ID4gIAlpbnQgbGFzdF9jb21t
YW5kOwo+ID4gPiAgCj4gPiA+IC0tIAo+ID4gPiAyLjM2LjEKPiA+ID4gCj4gPiAKPiA+IC0tIAo+
ID4g4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQo+
IAo+IC0tIAo+IAlBbnN1ZWwKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k
4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
