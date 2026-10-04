Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45535CA5FEC
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJ54OB5j2e8VmVDJayw0nSOr1s9KBZgAjnxgDUPjWLU=; b=4fbwOAXPHjj1sW
	T8NePelU3N4IiBDRI24l5rJAANtFqHhdF3+4SzO6lpFMyIewQwzg/Te9gd2rNAusVR5sVKl2fCzBf
	T93uE8f9qQ8DdJCQ+P6AR3rPVXLWK946qxw40QLfk8OYSLA18r0Ko9szz4HQmuAx6ve82WabX2gKL
	BF5H8WwPOnJKlPkv71S6FG4C+jUhjEj7C9FywjA4lxbcNWBJebIBzRQ05KVelIxwrlx6mZKaUXdrH
	Bn7V93q6mIhzWUZ6BRaAlh4eKY4lFac4YAaI/dcBoNSWby7nGw2b1d5PYmrx/LSHT1Oip0DedAIto
	k88+qU/7eQUsoU/MDKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJt4-0000000EgWi-30WJ;
	Sun, 04 Oct 2026 10:56:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJt3-0000000EgWc-3i2E
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 10:56:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EF8E40B74;
	Sun,  4 Oct 2026 10:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4231F000FF;
	Sun,  4 Oct 2026 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111369;
	bh=LfT/k0ScXAOXisjeEQ/qvWwYfgZMAcMZgWNtcWyAqJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LY233FBEbWEq/nMece1XDsMtBC7SM0a+FlBaEEuYxHT85glvPLEp1JzkbSPAPExvX
	 S96U+21kTurFblm1Q+ogkM2MaQtydJlRjzwiRnEtUcVnY7U2QC4CdDK5Xs4wWZZqY1
	 QMKBS+sCV7/TG8L9zG2Oo1MPTSYA96qMamIyVcnWwXb4mH2NbfI9DvPqdi/C60lgYn
	 dJVHHU3qXVFjYqsgV0QlmoUgeYhSu2TgycP+LNQe+t4Azyd5Q64bEFjd2eSgDgnUnI
	 cBoQZ5sWrPR16sIAgG+odA8Un7uuq82xkQ6SHIRBySEUwQCtqRWe++sBzLXmJtmJqy
	 AlMf2Dkt8TVDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mtd: spi-nor: take the flash lock in
 spi_nor_restore()
To: pratyush@kernel.org, mwalle@kernel.org, "Itai Handler" <itai.handler@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, stable@vger.kernel.org, richard@nod.at, tudor.ambarus@linaro.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, vigneshr@ti.com
In-Reply-To: <20261004104311.2196527-1-itai.handler@gmail.com>
References: <20261004104311.2196527-1-itai.handler@gmail.com>
Date: Sun, 04 Oct 2026 10:56:08 +0000
Message-Id: <20261004105608.7F4231F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
aGFyZHdhcmUgcmVzdG9yZSBza2lwcGVkIG9uIGZhdGFsIHNpZ25hbCBkdXJpbmcgdGVhcmRvd24K
LSBbSGlnaF0gbXRkOiBzcGktbm9yOiBzaHV0ZG93biBhbmQgdW5iaW5kIGhhbmcgd2FpdGluZyBm
b3IgbXVsdGktc2VjdG9yIGVyYXNlCi0tCgpjb21taXQgNDcwYWYzZjFmNWYxOWFiMTQyNmJhMWYz
OGE0YzQ0MjBlMDI3NGUyYgpBdXRob3I6IEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVyQGdtYWls
LmNvbT4KCm10ZDogc3BpLW5vcjogdGFrZSB0aGUgZmxhc2ggbG9jayBpbiBzcGlfbm9yX3Jlc3Rv
cmUoKQoKVGhpcyBjb21taXQgdGFrZXMgdGhlIGZsYXNoIGxvY2sgZHVyaW5nIHRlYXJkb3duIHRv
IGF2b2lkIHJhY2luZyB3aXRoCmluLWZsaWdodCBvcGVyYXRpb25zLiBJdCB3YWl0cyBmb3IgYWN0
aXZlIG9wZXJhdGlvbnMgdG8gY29tcGxldGUgc28gdGhhdApleGl0aW5nIDQtYnl0ZSBhZGRyZXNz
IG1vZGUgYW5kIHNvZnQgcmVzZXRzIGFyZSBub3QgaWdub3JlZCBvciBkbyBub3QKYWJvcnQgYW4g
b25nb2luZyBlcmFzZS4gSWYgdGhlIGxvY2sgY2Fubm90IGJlIGFjcXVpcmVkLCB0aGUgaGFyZHdh
cmUKcmVzdG9yZSBpcyBza2lwcGVkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IGluZGV4IDhiYzExN2I0NmUw
MjguLjk0ZGJmMWJlNzc2ZjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC0zNDU1LDYgKzM0NTUs
MjEgQEAgc3RhdGljIHZvaWQgc3BpX25vcl9yZXN0b3JlKHN0cnVjdCBzcGlfbm9yICpub3IpCj4g
IHsKPiAgCWludCByZXQ7Cj4gIAo+ICsJLyoKPiArCSAqIFRoZSBNVEQgZGV2aWNlIGlzIHN0aWxs
IHJlZ2lzdGVyZWQgaGVyZSwgc28gYW5vdGhlciB0aHJlYWQgbWF5Cj4gKwkgKiBoYXZlIGFuIG9w
ZXJhdGlvbiBpbiBmbGlnaHQuIFdhaXQgZm9yIGl0IHJhdGhlciB0aGFuIGN1dCBpbjoKPiArCSAq
IHdoaWxlIHRoZSBjaGlwIGlzIGJ1c3kgdGhlIGFkZHJlc3MgbW9kZSBleGl0IGJlbG93IGlzIHR5
cGljYWxseQo+ICsJICogaWdub3JlZCwgd2hpY2ggc2lsZW50bHkgbG9zZXMgdGhlIHJlc3RvcmUs
IGFuZCB0aGUgc29mdCByZXNldCBpcwo+ICsJICogdHlwaWNhbGx5IGFjY2VwdGVkLCB3aGljaCBh
Ym9ydHMgYW4gZXJhc2UgcGFydCB3YXkgdGhyb3VnaC4KPiArCSAqLwo+ICsJcmV0ID0gc3BpX25v
cl9wcmVwX2FuZF9sb2NrKG5vcik7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBpbnRyb2R1
Y2UgYSBwb3RlbnRpYWwgZGVhZGxvY2sgZHVyaW5nIHNodXRkb3duIG9yIGRyaXZlciB1bmJpbmQ/
CgpUaGUgY29tbWl0IG1lc3NhZ2Ugbm90ZXMgdGhhdCB0aGUgd2FpdCBpcyBib3VuZGVkIGJ5IHRo
ZSBvbmUgb3BlcmF0aW9uCmFscmVhZHkgaW4gZmxpZ2h0LiBIb3dldmVyLCBsb29raW5nIGF0IHNw
aV9ub3JfZXJhc2UoKSwgdGhlIGV4Y2x1c2l2ZSBsb2NrCmlzIGFjcXVpcmVkIGJlZm9yZSBsb29w
aW5nIG92ZXIgYWxsIHNlY3RvcnMgYW5kIGlzIGhlbGQgY29udGludW91c2x5IGFjcm9zcwp0aGUg
ZW50aXJlIG11bHRpLXNlY3RvciBvcGVyYXRpb246CgpzcGlfbm9yX2VyYXNlKCkKICAgIHNwaV9u
b3JfcHJlcF9hbmRfbG9ja19wZShub3IsIGluc3RyLT5hZGRyLCBpbnN0ci0+bGVuKTsKICAgIC4u
LgogICAgd2hpbGUgKGxlbikgewogICAgICAgIHNwaV9ub3JfbG9ja19kZXZpY2Uobm9yKTsKICAg
ICAgICBzcGlfbm9yX2VyYXNlX3NlY3Rvcihub3IsIGFkZHIpOwogICAgICAgIHNwaV9ub3JfdW5s
b2NrX2RldmljZShub3IpOwogICAgICAgIC4uLgogICAgfQoKU2luY2Ugc3BpX25vcl9wcmVwX2Fu
ZF9sb2NrKCkgY2FsbHMgc3BpX25vcl9yd3dfc3RhcnRfZXhjbHVzaXZlKCkgdG8gd2FpdApmb3Ig
dGhlIG9uZ29pbmcgZXJhc2UgdG8gZmluaXNoLCBpdCBhcHBlYXJzIHRoaXMgd2lsbCBibG9jayB0
aGUgdGVhcmRvd24KdGhyZWFkIHVudGlsIHRoZSBlbnRpcmUgYmF0Y2ggb3BlcmF0aW9uIGNvbXBs
ZXRlcy4gRm9yIGEgZnVsbC1jaGlwIGVyYXNlLApjb3VsZCB0aGlzIHN0YWxsIHN5c3RlbSBzaHV0
ZG93biBvciBkcml2ZXIgdW5iaW5kIGZvciBzZXZlcmFsIG1pbnV0ZXM/Cgo+ICsJaWYgKHJldCkg
ewo+ICsJCWRldl93YXJuKG5vci0+ZGV2LAo+ICsJCQkgIkZhaWxlZCB0byBsb2NrIGZsYXNoLCBz
a2lwcGluZyByZXN0b3JlLCBlcnIgPSAlZFxuIiwKPiArCQkJIHJldCk7Cj4gKwkJcmV0dXJuOwo+
ICsJfQoKW1NldmVyaXR5OiBIaWdoXQpDYW4gYSBmYXRhbCBzaWduYWwgY2F1c2UgdGhlIGRldmlj
ZSB0byBiZSBsZWZ0IGluIGFuIGluY29tcGF0aWJsZSBzdGF0ZT8KCklmIGEgbG9uZy1ydW5uaW5n
IGVyYXNlIGlzIHRha2luZyBwbGFjZSBkdXJpbmcgdW5iaW5kLCBhbmQgYSB1c2VyIHNlbmRzClNJ
R0tJTEwgdG8gYWJvcnQgdGhlIGhhbmcsIHdhaXRfZXZlbnRfa2lsbGFibGUoKSBpbnNpZGUKc3Bp
X25vcl9wcmVwX2FuZF9sb2NrKCkgd2lsbCByZXR1cm4gLUVSRVNUQVJUU1lTLgoKQmVjYXVzZSB0
aGlzIGVycm9yIHBhdGggc2tpcHMgdGhlIHJlc3RvcmUgZW50aXJlbHksIHRoZSBkcml2ZXIgY29y
ZSB3aWxsCmNvbnRpbnVlIHdpdGggZGV2aWNlIHVucmVnaXN0cmF0aW9uIHdoaWxlIHRoZSBoYXJk
d2FyZSBpcyBsZWZ0IHN0dWNrIGluCjQtYnl0ZSBhZGRyZXNzIG1vZGUuIFdpbGwgdGhpcyBicmVh
ayBzdWJzZXF1ZW50IGRyaXZlciByZWJpbmRzIG9yIGtleGVjCmtlcm5lbHMgdGhhdCBleHBlY3Qg
dGhlIGRlZmF1bHQgMy1ieXRlIG1vZGU/Cgo+ICsKPiAgCS8qIHJlc3RvcmUgdGhlIGFkZHJlc3Np
bmcgbW9kZSAqLwo+ICAJaWYgKG5vci0+YWRkcl9uYnl0ZXMgPT0gNCAmJiAhKG5vci0+ZmxhZ3Mg
JiBTTk9SX0ZfNEJfT1BDT0RFUykgJiYKPiAgCSAgICBub3ItPmZsYWdzICYgU05PUl9GX0JST0tF
Tl9SRVNFVCkgewoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MTAwNDEwNDMxMS4yMTk2NTI3LTEtaXRhaS5oYW5kbGVyQGdtYWlsLmNv
bT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
