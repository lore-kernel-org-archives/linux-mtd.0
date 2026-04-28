Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59D3FF885D
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2026 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH9LBoL9lHVude9abQmk+tIoPAPsx3av/iTNQJ7TBIc=; b=QXMW/fVaq/sluQ
	8t3IXyuJXfxIANZdSEzbaZmceFkgW+/5zPTWHoN04n07SCzDerqv1dCv6kTKa0UEQhX0ksPxVtc51
	pO1vR3T+PYyG15efp+gvDjBbbptssoJ4sOxdmuyssMHgghbkHwnyReZgIdmTWUexCv8iObdj+/wnH
	Q0Ee5AutLOmRI0Ia60GIz7S8ntj++GUFqXn/IU7XMAlReaTudABfKSfWfmUPajNSRcji12XetSKgH
	WCTjzk3L3VuOXS7DYbTpvZqwgYmVbj484G06s/8efVC2heO5DVuFQKtADRyFkyG0m/VOZtmSTxiZI
	YWdL5jIQyzZF/5x36iRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhsN-00000001SvD-3wvp;
	Tue, 28 Apr 2026 12:49:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhsK-00000001Sut-2paQ
	for linux-mtd@lists.infradead.org;
	Tue, 28 Apr 2026 12:49:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B65394E40CD7;
	Tue, 28 Apr 2026 12:49:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 873AA601D0;
	Tue, 28 Apr 2026 12:49:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF50910728B37;
	Tue, 28 Apr 2026 14:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777380553; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=532MLBDCbnndBAIaErrkgKirNydKSHsihOL9UW9nCJ4=;
	b=cYcbr1ND0whWLj3zVzBWCIug7yqiXzeivf5pRXHgRP4JAbVBWFF9kh+LV+LBnMl5I+FdDe
	VwQcSlXbvsZuvcCHJiRQN7zpZ49CCh7ziBcT/HOy1lgM9p07RcVzUPTBjxT0c1pArqjbNp
	h9yph/jKsZBQpJqQpEsPO2+CeAFYmQCZIoD9Ip2bnlI7AAFdX1tjj3KjppaqmgN2DKE65y
	23JRvpo4955zN/0aVubps3/jtxaWLCJ24qX6U7Lc1niIP0fcff9ji6WrJSt7Bn2zu+Sids
	mr0fpQqlE37hqN5ppWSz79Oj6NmPnEn4svoYX0cnsHIMsLOgSF9DpcvmsYHGXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: richard@nod.at,  vigneshr@ti.com,  cnsztl@gmail.com,
  csharper2005@gmail.com,  mikhail.kshevetskiy@iopsys.eu,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spinand: fmsh: add support for FM25G{01,02}B
In-Reply-To: <SEYPR01MB5882D37365BB442818AEC143C9222@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
	(Ziyang Huang's message of "Wed, 15 Apr 2026 23:31:41 +0800")
References: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
	<SEYPR01MB5882D37365BB442818AEC143C9222@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Apr 2026 14:49:13 +0200
Message-ID: <87340fdzcm.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_054916_867428_CE81CDC9 
X-CRM114-Status: GOOD (  14.16  )
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

SGVsbG8gWml5YW5nLAoKT24gMTUvMDQvMjAyNiBhdCAyMzozMTo0MSArMDgsIFppeWFuZyBIdWFu
ZyA8aHp5aXRjQG91dGxvb2suY29tPiB3cm90ZToKCj4gRk0yNUcwMUI6IGh0dHBzOi8vd3d3LmZt
c2guY29tL252bS9GTTI1RzAxQl9kc19lbmcucGRmCj4gRk0yNUcwMkI6IGh0dHBzOi8vd3d3LmZt
c2guY29tL252bS9GTTI1RzAyQl9kc19lbmcucGRmCgpCZWZvcmUgZ2l2aW5nIHRoZSBsaW5rcywg
dGhlIGNvbW1pdCBjb3VsZCBiZSBzbGlnaHRseSBtb3JlIHZlcmJvc2UsIHN1Y2gKYXMgIkFkZCBz
dXBwb3J0IGZvci4uLiIuCgo+IFNpZ25lZC1vZmYtYnk6IFppeWFuZyBIdWFuZyA8aHp5aXRjQG91
dGxvb2suY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gICBGaXggY29weS1wYXN0ZSBp
c3N1ZS4gKENvcnJlY3QgRk0yNUcwMUIgc2l6ZS4pCj4KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkv
Zm1zaC5jIHwgMTAxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3NwaS9mbXNoLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9mbXNoLmMKPiBpbmRleCBm
NDE3OTU1ZjdkMWMuLmE5YjIxOWFlNmMyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3NwaS9mbXNoLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9mbXNoLmMKPiBAQCAtOSw2
ICs5LDE2IEBACj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L210ZC9zcGluYW5kLmg+Cj4gIAo+ICsjZGVmaW5lIEZNMjVHMDFCX1NUQVRVU19FQ0NfTUFTSwkJ
KDcgPDwgNCkKPiArCSNkZWZpbmUgRk0yNUcwMUJfU1RBVFVTX0VDQ19OT19CSVRGTElQUwkJKDAg
PDwgNCkKPiArCSNkZWZpbmUgRk0yNUcwMUJfU1RBVFVTX0VDQ18xXzNfQklURkxJUFMJKDEgPDwg
NCkKPiArCSNkZWZpbmUgRk0yNUcwMUJfU1RBVFVTX0VDQ180X0JJVEZMSVBTCQkoMiA8PCA0KQo+
ICsJI2RlZmluZSBGTTI1RzAxQl9TVEFUVVNfRUNDXzVfQklURkxJUFMJCSgzIDw8IDQpCj4gKwkj
ZGVmaW5lIEZNMjVHMDFCX1NUQVRVU19FQ0NfNl9CSVRGTElQUwkJKDQgPDwgNCkKPiArCSNkZWZp
bmUgRk0yNUcwMUJfU1RBVFVTX0VDQ183X0JJVEZMSVBTCQkoNSA8PCA0KQo+ICsJI2RlZmluZSBG
TTI1RzAxQl9TVEFUVVNfRUNDXzhfQklURkxJUFMJCSg2IDw8IDQpCj4gKwkjZGVmaW5lIEZNMjVH
MDFCX1NUQVRVU19FQ0NfVU5DT1JfRVJST1IJCSg3IDw8IDQpCj4gKwo+ICAjZGVmaW5lIEZNMjVT
MDFCSTNfU1RBVFVTX0VDQ19NQVNLCQkoNyA8PCA0KQo+ICAJI2RlZmluZSBGTTI1UzAxQkkzX1NU
QVRVU19FQ0NfTk9fQklURkxJUFMJKDAgPDwgNCkKPiAgCSNkZWZpbmUgRk0yNVMwMUJJM19TVEFU
VVNfRUNDXzFfM19CSVRGTElQUwkoMSA8PCA0KQo+IEBAIC0zNCw2ICs0NCw3MiBAQCBzdGF0aWMg
U1BJTkFORF9PUF9WQVJJQU5UUyh1cGRhdGVfY2FjaGVfdmFyaWFudHMsCj4gIAkJU1BJTkFORF9Q
Uk9HX0xPQURfMVNfMVNfNFNfT1AoZmFsc2UsIDAsIE5VTEwsIDApLAo+ICAJCVNQSU5BTkRfUFJP
R19MT0FEXzFTXzFTXzFTX09QKGZhbHNlLCAwLCBOVUxMLCAwKSk7Cj4gIAo+ICsKPiArc3RhdGlj
IGludCBmbTI1ZzAxYl9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2Vj
dGlvbiwKPiArCQkJCSAgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCj4gK3sKPiArCWlm
IChzZWN0aW9uKQo+ICsJCXJldHVybiAtRVJBTkdFOwo+ICsKPiArCXJlZ2lvbi0+b2Zmc2V0ID0g
NjQ7Cj4gKwlyZWdpb24tPmxlbmd0aCA9IDY0Owo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgaW50IGZtMjVnMDFiX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LCBpbnQgc2VjdGlvbiwKPiArCQkJCSAgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+
ICt7Cj4gKwlpZiAoc2VjdGlvbiA+IDMpCj4gKwkJcmV0dXJuIC1FUkFOR0U7Cj4gKwo+ICsJaWYg
KHNlY3Rpb24gPT0gMCkgewo+ICsJCS8qIHJlc2VydmUgMiBieXRlcyBmb3IgdGhlIEJCTSAqLwo+
ICsJCXJlZ2lvbi0+b2Zmc2V0ID0gMjsKPiArCQlyZWdpb24tPmxlbmd0aCA9IDE0Owo+ICsJfSBl
bHNlIHsKPiArCQlyZWdpb24tPm9mZnNldCA9IHNlY3Rpb24gKiAxNjsKPiArCQlyZWdpb24tPmxl
bmd0aCA9IDE2Owo+ICsJfQoKSXNuJ3QgdGhhdCBqdXN0IG9uZSBiaWcgNjIgYnl0ZXMgc2VjdGlv
biBzdGFydGluZyBhdCAyPwoKPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKUmVzdCBsZ3RtLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
