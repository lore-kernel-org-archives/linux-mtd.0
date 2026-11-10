Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150A8606A321
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwfr2d6V;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2Ip7YF8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bopK+y01VaLPzR5NN/lFYog01a2H3shO4qU3rOCr804=; b=rwfr2d6V1P9PEuUtDAy2XHxErS
	FuLDsPrCLIUdGXKGPgCrN/vEa+I59mxtF59wO5CrKeZ4TBvKQxDxd3OMspwxiMmiDro3Yj4BhUKi8
	ETjYurGOAobaN973lVmUw9LHIaU9K1BmUrf6IIoZBzL1CaVc0VfaGs16nwMR5W8/yUlEHYnUdjbAO
	xqH0wx5NWG9drJcQyJw5QO1zB6fA2Fl3u6zvjDtQxEQpohAHjeOpcumUPvjJP8cOtK2MncjyXzcHe
	hRmWWwY6j99O+VSGpmhfF8U/KozCq7zAHcEn/nCHhwxY5A05cOweEJXvB+YaB8yjNcXqglEfMxwdy
	clk4Y2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv8U-00000005ELd-0I9W;
	Tue, 10 Nov 2026 23:20:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv8S-00000005ELU-3Nae
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 23:20:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2548D469E2;
	Tue, 10 Nov 2026 23:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65B61F00A03;
	Tue, 10 Nov 2026 23:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794352816;
	bh=x1i5IKaXrn0qbpHDjZ8o8P0+JA5B3Lf0Fem9h/aIDd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N2Ip7YF8xu2Ih6zd+1cA5SHauzvuc6ZuqZDUlxadBO16f8+ZXVxkMU1Pu9jdSdc3o
	 +i0+vFHIJeszApfgTnJtpoGHFu00lQssLqcSuljYhQ03Tn9qCcqaLj1Nmq/16b7EQu
	 pmpAq4xg5P2DDrYJJeVuZ7JKyyFXbuQRcSPVd0o8WIKgisnxnHEbe3a/SHjzeYo5xk
	 cuZtbqz3HDwc2EVV3CkYjnpXaBLVhR0zzxG17bM4/+h9cHz84QLpiyKpx9ig7RmjYN
	 6d1d68VCSMpa3X9huwjexnL/DymNfQLXD41de3e+ssL1cBD/z7HIVsyWOK9sldVgGr
	 WWPly6kC1+cAA==
Message-ID: <sashiko-outbox-207882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_page_read() function
To: "Gabor Juhos" <j4g8y7@gmail.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Md Sadre Alam" <md.alam@oss.qualcomm.com>, "Sricharan Ramabadhran" <quic_srichara@quicinc.com>, "Varadarajan
 Narayanan" <varadarajan.narayanan@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-2-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
 <20261109-qpic-snand-use-common-functions-v1-2-1e8601e2db84@gmail.com>
Date: Tue, 10 Nov 2026 23:20:15 +0000
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIHNwaTogc3Bp
LXFwaWM6IHVuaGFuZGxlZCBETUEgZGVzY3JpcHRvciBwcmVwYXJhdGlvbgogIGZhaWx1cmVzIFsx
XQotLQoKY29tbWl0IDA1ZDk1NGZkOGZhZjQ5Nzk2NGM5Mjc3OGZjOTUxZWQzYTFkODg2MmMKQXV0
aG9yOiBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KCnNwaTogc3BpLXFwaWMtc25hbmQ6
IHVzZSB0aGUgY29tbW9uIHFjb21fbmFuZGNfY29uZmlnX3BhZ2VfcmVhZCgpIGZ1bmN0aW9uCgpU
aGlzIGNvbW1pdCByZW1vdmVzIHRoZSBsb2NhbCBxY29tX3NwaV9jb25maWdfcGFnZV9yZWFkKCkg
aGVscGVyIGFuZCByZXBsYWNlcwppdHMgY2FsbGVycyB3aXRoIHRoZSBjb21tb24gcWNvbV9uYW5k
Y19jb25maWdfcGFnZV9yZWFkKCkgZnVuY3Rpb24gZnJvbQpxcGljX2NvbW1vbi4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgYi9kcml2ZXJzL3NwaS9zcGktcXBp
Yy1zbmFuZC5jCj4gaW5kZXggOTgxZTE2MjIxYjU5ZS4uY2Y3NWMxNDIzMDNmOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3Bp
LXFwaWMtc25hbmQuYwoKWyAuLi4gXQoKPiBAQCAtNTg4LDcgKzU3Nyw3IEBAIHN0YXRpYyBpbnQg
cWNvbV9zcGlfYmxvY2tfZXJhc2Uoc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpzbmFuZGMp
Cj4gIHN0YXRpYyB2b2lkIHFjb21fc3BpX2NvbmZpZ19zaW5nbGVfY3dfcGFnZV9yZWFkKHN0cnVj
dCBxY29tX25hbmRfY29udHJvbGxlciAqc25hbmRjLAo+ICAJCQkJCQlib29sIHVzZV9lY2MsIGlu
dCBjdykKPiAgewo+IC0JcWNvbV9zcGlfY29uZmlnX3BhZ2VfcmVhZChzbmFuZGMpOwo+ICsJcWNv
bV9uYW5kY19jb25maWdfcGFnZV9yZWFkKHNuYW5kYyk7Cj4gIAlxY29tX3NwaV9jb25maWdfY3df
cmVhZChzbmFuZGMsIHVzZV9lY2MsIGN3KTsKPiAgfQoKW1NldmVyaXR5OiBDcml0aWNhbF0KVGhp
cyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4KcWNvbV9z
cGlfY29uZmlnX3NpbmdsZV9jd19wYWdlX3JlYWQoKSBhbmQgcWNvbV9uYW5kY19jb25maWdfcGFn
ZV9yZWFkKCkKc2lsZW50bHkgZHJvcCBETUEgZGVzY3JpcHRvciBwcmVwYXJhdGlvbiBlcnJvcnMg
WzFdIGFuZCBzdWJtaXQgYQp0cnVuY2F0ZWQgQkFNIGNvbW1hbmQgc2VxdWVuY2U/CgpCb3RoIGhl
bHBlcnMgYXJlIHZvaWQgYW5kIGlnbm9yZSB0aGUgcmV0dXJuIHZhbHVlIG9mIHFjb21fd3JpdGVf
cmVnX2RtYSgpIC0+CnFjb21fcHJlcF9iYW1fZG1hX2Rlc2NfY21kKCksIHdoaWNoIGNhbiBmYWls
IHdpdGggLUVOT01FTSB1bmRlciBtZW1vcnkKcHJlc3N1cmUgb3IgLUVJTlZBTCBpZiB0aGUgQkFN
IGNvbW1hbmQgZWxlbWVudCBhcnJheSBpcyBmdWxsLiAgVGhlIGNhbGxlcgp0aGVuIHJ1bnMgcWNv
bV9zdWJtaXRfZGVzY3MoKSBvbiB0aGUgcGFydGlhbGx5IGNvbnN0cnVjdGVkIGRlc2NyaXB0b3Ig
bGlzdCwKd2hpY2ggY2FuIGxlYXZlIHRoZSBRUElDIFNQSSBOQU5EIGNvbnRyb2xsZXIgaW4gYW4g
dW5kZWZpbmVkIHN0YXRlIG9yIGNvcnJ1cHQKZmxhc2ggSS9PLgoKWzFdIGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9idWcvbGludXgtMjhkMDA3ZTItNjU4NS00NGNjLWFlODItYjNkYTI0OTViOWFiCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYxMTA5LXFwaWMtc25hbmQtdXNlLWNvbW1vbi1mdW5jdGlvbnMtdjEtMC0xZTg2MDFlMmRiODRA
Z21haWwuY29tP3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
