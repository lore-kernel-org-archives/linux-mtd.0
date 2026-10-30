Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27ED606A324
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=drTWrDgL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPsv2H6k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NKKLE6YDQ8CwpZAMDVKMyuSWkdmmBWQ6/aUa5sYZkNQ=; b=drTWrDgLErCJgiP8ymzH+JyJsV
	0jtAxcuW7qpIYNXcV5pmtCbMX1IuDD6rbYhDxmk8dmsxPHY1vTYIr5bJxGzGAV2478FCIJn3cVM2N
	ZwLDOjwNm+VtWRpjh76OaTgwLmQZ6mnlm9gaWX8syaJUzJqNhp9UiZW7D7fBiymdJgHUNZPE4v7Ka
	nlct9DcCF2y+142sWpoaVoAS8/YJkxLpwE96Q/0lZy7cH5wkX6da8oL+rk3fMkyoqeBXA3gmRxST4
	7REDEz9IuIlHA9wodURd0RutZBE9ypFwfCmNs1Fy0+5K9PHeZaPZQ4VVrSYhJ18fPS1vDrVSXOxyW
	QJhtkJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpcs-0000000C9V2-1oN2;
	Fri, 30 Oct 2026 16:38:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpcr-0000000C9Ue-04sB
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:38:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C779F605CB;
	Fri, 30 Oct 2026 16:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2E21F000C1;
	Fri, 30 Oct 2026 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793378323;
	bh=G1z1qQ5j5lNTnrgJ1ozy8sWJ5465FP7J1myCkn91g50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPsv2H6k/k0SjrpXNvo8RttcSeHUgD6Ch28sWhL+hgzoujcDQJzK5QnlcyJgSQ0NP
	 T3UF5basCThZiV3vwrx79uNOv4YJY70PD5BECbCgy43m+j/i41+mte7jqBprHXC62d
	 pacnB2+4v2nKZp1hmcUkti1SJNScnz3TLYDqzNg/TRhB4H7PWyVhb+mr0+QWWOThlE
	 sF6Pbj6SaAvPm6WMx5cIYYBmhd5ADrML6Ou3nUD62Cx0VGYQaEEmVf5+qNHGa0Kbqq
	 uvucZOnV2N6KzeiqOh6GvP4LVe01PvETkSE/UHjfgyX41VadOd+Ycf6CzC9+HSG9H4
	 o/s8o/2Rtcy+w==
Message-ID: <sashiko-outbox-191272@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping
 on timeout
To: "Samarth Narang" <samarth.colleges@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Han Xu" <han.xu@nxp.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
Cc: "Richard Weinberger" <richard@nod.at>, linux-mtd@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, Frank.Li@kernel.org
In-Reply-To: <20261030162041.2998170-6-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
 <20261030162041.2998170-6-samarth.colleges@gmail.com>
Date: Fri, 30 Oct 2026 16:38:42 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5k
OiBtYXJ2ZWxsOiBzbGVlcCBpbiBhdG9taWMgY29udGV4dCBpbiBtYXJ2ZWxsX25mY194ZmVyX2Rh
dGFfZG1hKCkKLS0KCmNvbW1pdCBjYmJlNmVhZThkZjRhMzRiMDJlNjI1ZTY0Njc2YTY1MDI0MzMx
Zjc2CkF1dGhvcjogU2FtYXJ0aCBOYXJhbmcgPHNhbWFydGguY29sbGVnZXNAZ21haWwuY29tPgoK
bXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBzdG9wIERNQSBiZWZvcmUgdW5tYXBwaW5nIG9uIHRpbWVv
dXQKClRoaXMgY29tbWl0IHJlcGxhY2VzIGRtYWVuZ2luZV90ZXJtaW5hdGVfYWxsKCkgd2l0aApk
bWFlbmdpbmVfdGVybWluYXRlX3N5bmMoKSBhbmQgbW92ZXMgaXQgYmVmb3JlIGRtYV91bm1hcF9z
ZygpIG9uIHRoZQp0aW1lb3V0IHBhdGggaW4gbWFydmVsbF9uZmNfeGZlcl9kYXRhX2RtYSgpIHNv
IHRoZSBETUEgdHJhbnNmZXIgaXMKc3RvcHBlZCBiZWZvcmUgdW5tYXBwaW5nIHRoZSBidWZmZXIu
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gaW5kZXggMzhiN2ViNWI5OTJjOC4u
YTM0MmE0OGUyYTA4YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxs
X25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gQEAg
LTkwMCwxNCArOTAwLDE1IEBAIHN0YXRpYyBpbnQgbWFydmVsbF9uZmNfeGZlcl9kYXRhX2RtYShz
dHJ1Y3QgbWFydmVsbF9uZmMgKm5mYywKPiAgCj4gIAlkbWFfYXN5bmNfaXNzdWVfcGVuZGluZyhu
ZmMtPmRtYV9jaGFuKTsKPiAgCXJldCA9IG1hcnZlbGxfbmZjX3dhaXRfY21kZChuZmMtPnNlbGVj
dGVkX2NoaXApOwo+IC0JZG1hX3VubWFwX3NnKG5mYy0+ZG1hX2NoYW4tPmRldmljZS0+ZGV2LCAm
c2csIDEsIGRpcmVjdGlvbik7Cj4gLQltYXJ2ZWxsX25mY19kaXNhYmxlX2RtYShuZmMpOwo+ICAJ
aWYgKHJldCkgewo+ICAJCWRldl9lcnIobmZjLT5kZXYsICJUaW1lb3V0IHdhaXRpbmcgZm9yIERN
QSAoc3RhdHVzOiAlZClcbiIsCj4gIAkJCWRtYWVuZ2luZV90eF9zdGF0dXMobmZjLT5kbWFfY2hh
biwgY29va2llLCBOVUxMKSk7Cj4gLQkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9hbGwobmZjLT5kbWFf
Y2hhbik7Cj4gLQkJcmV0dXJuIC1FVElNRURPVVQ7Cj4gKwkJZG1hZW5naW5lX3Rlcm1pbmF0ZV9z
eW5jKG5mYy0+ZG1hX2NoYW4pOwoKW1NldmVyaXR5OiBNZWRpdW1dCkNhbiBjYWxsaW5nIGRtYWVu
Z2luZV90ZXJtaW5hdGVfc3luYygpIGhlcmUgc2xlZXAgaW4gYXRvbWljIGNvbnRleHQgZHVyaW5n
CmEgcGFuaWMgd3JpdGU/CgpUaGlzIGRyaXZlciBzdXBwb3J0cyBtdGQtPm9vcHNfcGFuaWNfd3Jp
dGUgYnkgcG9sbGluZyBpbgptYXJ2ZWxsX25mY193YWl0X29wKCkgaW5zdGVhZCBvZiBzbGVlcGlu
ZzoKCmRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jOm1hcnZlbGxfbmZjX3dhaXRf
b3AoKSB7CglpZiAobXRkLT5vb3BzX3BhbmljX3dyaXRlKSB7CgkJcmV0ID0gbWFydmVsbF9uZmNf
cG9sbF9zdGF0dXMobmZjLCBORFNSX1JEWSgwKSwKCQkJCQkgICAgICBORFNSX1JEWSgwKSwKCQkJ
CQkgICAgICB0aW1lb3V0X21zKTsKCX0gZWxzZSB7CgkJaW5pdF9jb21wbGV0aW9uKCZuZmMtPmNv
bXBsZXRlKTsKCQkuLi4KfQoKV2hlbiBuZmMtPnVzZV9kbWEgaXMgZW5hYmxlZCBvbiBORkN2MSwg
cGFuaWMgd3JpdGVzIHN0aWxsIGdvIHRocm91Z2gKbWFydmVsbF9uZmNfeGZlcl9kYXRhX2RtYSgp
OgoKbXRkX3BhbmljX3dyaXRlKCkKICAtPiBwYW5pY19uYW5kX3dyaXRlKCkKICAgIC0+IG5hbmRf
ZG9fd3JpdGVfb3BzKCkKICAgICAgLT4gbmFuZF93cml0ZV9wYWdlKCkKICAgICAgICAtPiBtYXJ2
ZWxsX25mY19od19lY2NfaG1nX3dyaXRlX3BhZ2UoKQogICAgICAgICAgLT4gbWFydmVsbF9uZmNf
aHdfZWNjX2htZ19kb193cml0ZV9wYWdlKCkKICAgICAgICAgICAgLT4gbWFydmVsbF9uZmNfeGZl
cl9kYXRhX2RtYSgpCgpCZWNhdXNlIG10ZF9wYW5pY193cml0ZSgpIGNhbiBiZSBpbnZva2VkIHdp
dGggaW50ZXJydXB0cyBkaXNhYmxlZCBvciB1bmRlcgphIHJhdyBzcGlubG9jayAoc3VjaCBhcyBw
c3RvcmVfZHVtcCgpKSwgYW5kIGRtYWVuZ2luZV90ZXJtaW5hdGVfc3luYygpCmNhbGxzIGRtYWVu
Z2luZV9zeW5jaHJvbml6ZSgpICh3aGljaCBjYWxscyBtaWdodF9zbGVlcCgpLCB3YWl0X2V2ZW50
KCkgaW4KcHhhZF9zeW5jaHJvbml6ZSgpLCBhbmQgdGFza2xldF9raWxsKCkgaW4gdmNoYW5fc3lu
Y2hyb25pemUoKSksIHdvdWxkbid0IGEKRE1BIHRpbWVvdXQgZHVyaW5nIGEgcGFuaWMgd3JpdGUg
dHJpZ2dlciBhIHNsZWVwLWluLWF0b21pYyBidWcgb3IgaGFuZwp3YWl0aW5nIGZvciB0aGUgRE1B
IHRhc2tsZXQgd2hpbGUgc29mdGlycXMgYXJlIGRpc2FibGVkPwoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAzMDE2MjA0MS4yOTk4
MTcwLTEtc2FtYXJ0aC5jb2xsZWdlc0BnbWFpbC5jb20/cGFydD01CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
