Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB32CA5FA1
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W31i9MWJQo8u/lRLsmIifbXCeRSiDh/NtUzHopBfbeE=; b=rfOeSw3fhk7u9k
	cJwAVU+3A5b6vJ+44XDwbXna363B4hkrIGxDxvKXnsgiaANchXmiV6njyUjdJiclLeTYLsWHPtpLN
	JB5P/EV2JF3aNAbxQ3iQVVE+kXAlcnxzf80lHOOoiAgEQYzB20TW8n+6i5N6YlGxx4HEyNhj0H6E9
	MvyWEFHCXZlkey69L2MB0XATLtHBufGWDSPLKV/0Q+Rk00Q4U+tKce5oxaVKsnqsTq5tKFtA6U/Q+
	a5Bk0PJJTkkrrEFY/TU31/oGCCSsgRHPmzYIB2AJuoAQeJcXk5p9bgrBI8fo8eAp0F+I+wZQPerHZ
	u2C4blaPVdUCw1shFIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRoF-00000002Xjt-2vin;
	Tue, 29 Sep 2026 06:59:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRoE-00000002XjD-0Mmt
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 06:59:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 755CF43FF8;
	Tue, 29 Sep 2026 06:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12141F00898;
	Tue, 29 Sep 2026 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790665165;
	bh=eKuk0w82YoMCX6pJY2sLtmFN2U7gIqxLXRIr1iEF87U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b2ywsVgYRSOJM0BCnkvTWGkcgq0LvLfCOCpSuFCGFS9jIsRRCwQJXj9VB0s3ZbldP
	 6We4z+1kj8HMboNM/kwstBFpqsM7PBzpcYEbQCZ7yjGJjsypIaahg/b74n20u/bWDD
	 dEWG/VfF1Z9ed8uAAKL16Gs//+VUrZ57LoWVC7KclLxjOclUTiMuk4FZobkIP0bvFO
	 ZTaO6scHYQxgi8Om75hgdD3RVoAL/YceKzh0cYd4SfJZNpWvYMYa+/Se2NqhvCm4x/
	 DGyhXtXbsvkGlI5dV7Fdef4jZzY6GrQgMlVyGwuRwEhXMDEGEpe4TdZo7+1TfD/JfO
	 +REaTuljsqIAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
To: "Michael Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Richard Weinberger" <richard@nod.at>, haibo.chen@oss.nxp.com
Cc: linux-mtd@lists.infradead.org, michael@walle.cc, linux-kernel@vger.kernel.org, "Haibo
 Chen" <haibo.chen@nxp.com>
In-Reply-To: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
Date: Tue, 29 Sep 2026 06:59:24 +0000
Message-Id: <20260929065924.C12141F00898@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
Y29tcGlsYXRpb24gZXJyb3IgYWNjZXNzaW5nIG5vbi1leGlzdGVudCBvcGNvZGVzLnJlYWRfc3Iy
Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjogbW9kaWZ5aW5nIGhhbGx1Y2luYXRlZCBvcGNvZGUgZG9l
cyBub3Qgc2tpcCBTUjIgcmVhZHMKLSBbTWVkaXVtXSBtdGQ6IHNwaS1ub3I6IHBlcm1hbmVudCBi
cmVha2FnZSBvZiBTUjIgcmVhZHMgZHVlIHRvIG1pc3Npbmcgc3RhdGUgcmVzdG9yZQotLQoKY29t
bWl0IGIzZWJjYjEyNjRjNWVhYWI4MjhjYWJhMTNiNWE2ZWU1NmFmODBhYTUKQXV0aG9yOiBIYWli
byBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+CgptdGQ6IHNwaS1ub3I6IGNsZWFyIHRoZSBkZWZh
dWx0IFJEQ1Igb3Bjb2RlIHdoZW4gZW50ZXJpbmcgT2N0YWwgRFRSCgpUaGlzIGNvbW1pdCBhdHRl
bXB0cyB0byBza2lwIGludmFsaWQgU1IyIHJlYWRzIHdoZW4gc3dpdGNoaW5nIHRvIE9jdGFsIERU
Ugptb2RlIGJ5IGNsZWFyaW5nIGEgZGVmYXVsdCBSRENSIG9wY29kZS4gSXQgdXBkYXRlcyBzcGlf
bm9yX3NldF9vY3RhbF9kdHIoKQp0byBjbGVhciByZWFkX3NyMiBvbiBzdWNjZXNzLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9y
L2NvcmUuYwo+IGluZGV4IDhiYzExN2I0NmUwMjguLjBmNDdkODY5Y2JiNDggMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9y
L2NvcmUuYwo+IEBAIC0zMjM4LDEwICszMjM4LDE2IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9zZXRf
b2N0YWxfZHRyKHN0cnVjdCBzcGlfbm9yICpub3IsIGJvb2wgZW5hYmxlKQo+ICAJaWYgKHJldCkK
PiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCWlmIChlbmFibGUpCj4gKwlpZiAoZW5hYmxlKSB7Cj4g
IAkJbm9yLT5yZWdfcHJvdG8gPSBTTk9SX1BST1RPXzhfOF84X0RUUjsKPiAtCWVsc2UKPiArCQkv
Kgo+ICsJCSAqIFRoZSBkZWZhdWx0IFJEQ1IgaXMgbm90IGEgdmFsaWQgU1IyIHJlYWQgaW4gT2N0
YWwgRFRSIG1vZGU7Cj4gKwkJICogY2xlYXIgaXQgc28gU1IyIHJlYWRzIGFyZSBza2lwcGVkIGlu
c3RlYWQgb2YgYmVpbmcgaXNzdWVkLgo+ICsJCSAqLwo+ICsJCW5vci0+cGFyYW1zLT5vcGNvZGVz
LnJlYWRfc3IyID0gMDsKCltTZXZlcml0eTogSGlnaF0KQ2FuIHRoaXMgY29kZSBjb21waWxlIHN1
Y2Nlc3NmdWxseT8gc3RydWN0IHNwaV9ub3JfZmxhc2hfcGFyYW1ldGVyICh3aGljaApub3ItPnBh
cmFtcyBwb2ludHMgdG8pIGRvZXMgbm90IGFwcGVhciB0byBjb250YWluIGFuIG9wY29kZXMgZmll
bGQsIHdoaWNoCndvdWxkIGNhdXNlIGEgYnVpbGQgZmFpbHVyZSBoZXJlLgoKW1NldmVyaXR5OiBI
aWdoXQpJZiB0aGlzIGR5bmFtaWMgb3Bjb2RlIGZpZWxkIGRpZCBleGlzdCwgd291bGQgbW9kaWZ5
aW5nIGl0IGFjdHVhbGx5IHByZXZlbnQKdGhlIFNSMiByZWFkcz8KCkxvb2tpbmcgYXQgc3BpX25v
cl9yZWFkX3NyMigpLCBpdCBzZWVtcyB0aGUgcmVhZHMgcmVseSBlbnRpcmVseSBvbiBzdGF0aWNh
bGx5CmhhcmRjb2RlZCBtYWNyb3MgcmF0aGVyIHRoYW4gZHluYW1pYyBjb25maWd1cmF0aW9uIGZp
ZWxkczoKCmRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jOnNwaV9ub3JfcmVhZF9zcjIoKSB7CiAg
ICAuLi4KCWlmIChub3ItPnNwaW1lbSkgewoJCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gU1BJX05P
Ul9SRFNSMl9PUChzcjIpOwogICAgLi4uCgl9IGVsc2UgewoJCXJldCA9IHNwaV9ub3JfY29udHJv
bGxlcl9vcHNfcmVhZF9yZWcobm9yLCBTUElOT1JfT1BfUkRTUjIsIHNyMiwKCQkJCQkJICAgICAg
MSk7Cgl9CiAgICAuLi4KfQoKU2luY2UgU1BJX05PUl9SRFNSMl9PUCBhbmQgU1BJTk9SX09QX1JE
U1IyIGFyZSBzdGF0aWMgY29uc3RhbnRzLCB3b3VsZG4ndAp0aGUgcmVhZHMgc3RpbGwgYmUgaXNz
dWVkIHJlZ2FyZGxlc3Mgb2YgdGhpcyB2YXJpYWJsZSdzIHN0YXRlPwoKPiArCX0gZWxzZSB7Cj4g
IAkJbm9yLT5yZWdfcHJvdG8gPSBTTk9SX1BST1RPXzFfMV8xOwo+ICsJfQoKW1NldmVyaXR5OiBN
ZWRpdW1dCldoZW4gZGlzYWJsaW5nIE9jdGFsIERUUiwgZG9lcyB0aGlzIHBhdGggYWxzbyBuZWVk
IHRvIHJlc3RvcmUgdGhlIGNsZWFyZWQKb3Bjb2RlIHN0YXRlPwoKSWYgdGhlIG9wY29kZSB3YXMg
emVyb2VkIHdoZW4gZW5hYmxpbmcgdGhlIG1vZGUsIGRyb3BwaW5nIGJhY2sgdG8KU05PUl9QUk9U
T18xXzFfMSB3aXRob3V0IHJlc3RvcmluZyBpdCBtaWdodCBsZWF2ZSBTUjIgcmVhZHMgcGVybWFu
ZW50bHkKZGlzYWJsZWQgZm9yIHRoZSByZW1haW5pbmcgbGlmZXRpbWUgb2YgdGhlIGRldmljZS4K
Cj4gIAlyZXR1cm4gMDsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyOS1zcGktbm9yLWZpeC12Mi0xLTc1NDQwY2ZlNGU3
NkBueHAuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
