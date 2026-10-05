Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250EFCA5FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nm+f7zdKlybfGPEw+vfmDVSALihjb1dRYX5C5bkeN1c=; b=yPoB/mNW1aQ0VJ
	zJFQOba8sxua+mA8k4uZR6GCKOnoLiBXF6izD4c7+00tgIrpMm1X3LJxXym9vQqfTN1SbD9ExyGwY
	8kt4Oj8vxh702u3MMhZ/hicureXCurPij3wdNQqQ7eHrAitOJUwqOlDeQyhox8q7wR41+8NXqhfHQ
	GhwlG5eisLqgGNj6zsLw73tngx2DBqHwF2x47QRKSQ1fzOGsOjcAZOl+P7FRZ56Rzsc+RZrYh1Z0R
	+IDvyeQMmSd2epvRkLIBNw5Q/O6ae5Hz5dIatMqVtBuudsEA6CTJb6nOwunLdKs0FA1mJ2lk6RGlA
	Kb/zyPuifoRGIlK7ARyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdza-0000000FsQb-2pvb;
	Mon, 05 Oct 2026 08:24:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdzZ-0000000FsQ4-1t8h
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 08:24:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ADED402BB;
	Mon,  5 Oct 2026 08:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262381F000FF;
	Mon,  5 Oct 2026 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188652;
	bh=Ir06SkW2fBmZ6iTU9J+gZxFmECKR9OLomFBtlF9+75g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JXI5hjXW7zk4XGtV1VNQJ7mFCNkHrQPKAdvP7Y78uOnoExbpFahvFBxsJ1UiGRTJB
	 IEwmLCDgMc/ZKDCwP2OMpthPXoBywhxDyFCJ8EwuCDj6dQYgKf6acVBGUPq4fC6Sgb
	 QfvbNA4eeHz3UpQtBLRxPj64HwCC/U4+k58yMYidb0kfQzEvGzoX0B4xUsyPEZ+jVN
	 RO5t5C38T7EDhJbyPyYEr6VkFW+6KzNdQWSV4FyzjlfiVUR0oL4hzdmzo8VC4A1/sz
	 CyfNCsn48fTpERD+x41/kbx8mjPJdfuhSGIRNr7h/+q1KTMQTxUNHE4GqUv/d9QiIO
	 1/F6KBy1hHEew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] spi: spi-mem: Add support for panic mem writes
To: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Paul Cercueil" <paul.cercueil@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Mark
 Brown" <broonie@kernel.org>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
Cc: "Tanmay Jagdale" <tanmay@marvell.com>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, "Kees Cook" <kees@kernel.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <20261005081141.33688-2-paul.cercueil@bootlin.com>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-2-paul.cercueil@bootlin.com>
Date: Mon, 05 Oct 2026 08:24:11 +0000
Message-Id: <20261005082412.262381F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogc3BpLW1lbTog
cGFuaWMgd3JpdGUgZGVhZGxvY2tzIHN5c3RlbSBieSBjYWxsaW5nIHNwaV9tZW1fYWNjZXNzX3N0
YXJ0Ci0tCgpjb21taXQgYmU5YWM1NDJmZWE1MDhhMWZhMDU2NjYxZTVkZGI4ZTIzY2Y0YTdjNApB
dXRob3I6IFRhbm1heSBKYWdkYWxlIDx0YW5tYXlAbWFydmVsbC5jb20+CgpzcGk6IHNwaS1tZW06
IEFkZCBzdXBwb3J0IGZvciBwYW5pYyBtZW0gd3JpdGVzCgpBZGQgYSBwYW5pY193cml0ZSBmbGFn
IHRvIHRoZSBjb250cm9sbGVyIGNhcGFiaWxpdGllcy4gV2hlbiBzZXQsIHRoaXMKaW5kaWNhdGVz
IHRoZSBTUEkgY29udHJvbGxlciBjYW4gc2VuZCBjb21tYW5kcyB0byBhIGNvbm5lY3RlZCBOT1Ig
b3IgTkFORAptZW1vcnkgaW4gdGhlIGNvbnRleHQgb2YgYSBrZXJuZWwgcGFuaWMsIHdpdGhvdXQg
c2xlZXBpbmcgb3IgcmVseWluZyBvbiBJUlFzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkv
c3BpLW1lbS5jIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gaW5kZXggYjk0NjgwYjYwYWY5NS4u
ODk3MTBmOWY1NTVlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiArKysg
Yi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiBAQCAtMzk4LDYgKzM5OCwzMSBAQCBpbnQgc3BpX21l
bV9leGVjX29wKHN0cnVjdCBzcGlfbWVtICptZW0sIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpv
cCkKPiAgCXU4ICp0bXBidWY7Cj4gIAlpbnQgcmV0Owo+ICAKPiArCWlmIChvcC0+cGFuaWNfd3Jp
dGUpIHsKPiArCQlpZiAoIXNwaV9tZW1fY29udHJvbGxlcl9pc19jYXBhYmxlKGN0bHIsIHBhbmlj
X3dyaXRlKSkKPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiArCQkvKgo+ICsJCSAqIE9u
bHkgc3VwcG9ydCBwYW5pYyB3cml0ZXMgaWYgd2UnbGwgZ28gdGhyb3VnaCAuZXhlY19vcCgpLgo+
ICsJCSAqIFRoZSByZWd1bGFyIFNQSSBwYXRoIChzcGlfc3luYygpLCBldGMuKSBleHBsaWNpdGx5
IG1lbnRpb25zCj4gKwkJICogdGhhdCBpdCBjYW4gb25seSBiZSB1c2VkIGZyb20gYSBjb250ZXh0
IHRoYXQgbWF5IHNsZWVwLCB3aGljaAo+ICsJCSAqIGlzIG5vdCB0aGUgY2FzZSBvbiBhIGtlcm5l
bCBwYW5pYy4KPiArCQkgKiBJZiB0aGlzIGNoYW5nZXMgaW4gdGhlIGZ1dHVyZSwgdGhpcyBjb3Vs
ZCBiZSByZXdvcmtlZCwgYnV0Cj4gKwkJICogZm9yIG5vdyB0aGlzIHdpbGwgaGF2ZSB0byBkby4K
PiArCQkgKi8KPiArCQlpZiAoV0FSTl9PTl9PTkNFKCFjdGxyLT5tZW1fb3BzIHx8ICFjdGxyLT5t
ZW1fb3BzLT5leGVjX29wKSkKPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiArCQlpZiAo
c3BpX2dldF9jc2dwaW9kKG1lbS0+c3BpLCAwKSkKPiArCQkJcmV0dXJuIC1FUEVSTTsKPiArCj4g
KwkJLyogT24gcGFuaWMgSVJRcyBhcmUgZGlzYWJsZWQgc28gd2UgY2Fubm90IHdhaXQgb24gbG9j
a3MgKi8KPiArCQlpZiAobXV0ZXhfaXNfbG9ja2VkKCZjdGxyLT5idXNfbG9ja19tdXRleCkgfHwK
PiArCQkgICAgbXV0ZXhfaXNfbG9ja2VkKCZjdGxyLT5pb19tdXRleCkpIHsKPiArCQkJcmV0dXJu
IC1FUEVSTTsKPiArCQl9Cj4gKwl9CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyB1bmNvbmRp
dGlvbmFsbHkgaW52b2tlIHNsZWVwYWJsZSBvcGVyYXRpb25zIGR1cmluZyBhIHBhbmljIHdyaXRl
PwoKSWYgdGhlIG11dGV4ZXMgYXJlIGN1cnJlbnRseSB1bmxvY2tlZCB3aGVuIG9wLT5wYW5pY193
cml0ZSBpcyB0cnVlLApzcGlfbWVtX2V4ZWNfb3AoKSBwcm9jZWVkcyBhbmQgY2FsbHMgc3BpX21l
bV9hY2Nlc3Nfc3RhcnQoKToKCmRyaXZlcnMvc3BpL3NwaS1tZW0uYzpzcGlfbWVtX2V4ZWNfb3Ao
KSB7CiAgICAuLi4KICAgIGlmIChjdGxyLT5tZW1fb3BzICYmIGN0bHItPm1lbV9vcHMtPmV4ZWNf
b3AgJiYgIXNwaV9nZXRfY3NncGlvZChtZW0tPnNwaSwgMCkpIHsKICAgICAgICByZXQgPSBzcGlf
bWVtX2FjY2Vzc19zdGFydChtZW0pOwogICAgLi4uCn0KCnNwaV9tZW1fYWNjZXNzX3N0YXJ0KCkg
ZXhwbGljaXRseSBjYWxscyBtdXRleF9sb2NrKCksIHdoaWNoIHZpb2xhdGVzIGF0b21pYwpjb25z
dHJhaW50cyBhbmQgdHJpZ2dlcnMgbWlnaHRfc2xlZXAoKSB3YXJuaW5ncywgYW5kIGNhbGxzCnBt
X3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSwgd2hpY2ggbWF5IHNsZWVwLgoKQWRkaXRpb25hbGx5
LCBzcGlfbWVtX2FjY2Vzc19zdGFydCgpIHVuY29uZGl0aW9uYWxseSBjYWxscyBzcGlfZmx1c2hf
cXVldWUoKS4KSWYgdGhlIFNQSSBtZXNzYWdlIHF1ZXVlIGlzIG5vdCBlbXB0eSAoZm9yIGV4YW1w
bGUsIGZyb20gYW4gYXN5bmMgdHJhbnNmZXIKcXVldWVkIHZpYSBzcGlfYXN5bmMoKSByaWdodCBi
ZWZvcmUgdGhlIHBhbmljKSwgc3BpX2ZsdXNoX3F1ZXVlKCkgZGVxdWV1ZXMKYW5kIGV4ZWN1dGVz
IHBlbmRpbmcgcmVndWxhciBTUEkgdHJhbnNmZXJzIHVzaW5nIHRoZSBkcml2ZXIgc3RhbmRhcmQK
Y2FsbGJhY2s6CgpzcGlfbWVtX2FjY2Vzc19zdGFydCgpIC0+CiAgICBzcGlfZmx1c2hfcXVldWUo
KSAtPgogICAgICAgIF9fc3BpX3B1bXBfbWVzc2FnZXMoKSAtPgogICAgICAgICAgICAudHJhbnNm
ZXJfb25lX21lc3NhZ2UoKQoKRm9yIGNhZGVuY2UteHNwaSAodGhlIGRyaXZlciBzdXBwb3J0aW5n
IHBhbmljIHdyaXRlcyBoZXJlKSwgdGhlIGNhbGxiYWNrCmludm9rZXMgdXNsZWVwX3JhbmdlKCkg
Zm9yIHBvbGxpbmcgZGVsYXlzLgoKRXhlY3V0aW5nIHVzbGVlcF9yYW5nZSgpIG9yIG90aGVyIHNs
ZWVwYWJsZSB3YWl0IG1lY2hhbmlzbXMgaW4gYSBwYW5pYwpjb250ZXh0IHdoZXJlIGludGVycnVw
dHMgYW5kIHByZWVtcHRpb24gYXJlIGRpc2FibGVkIHdpbGwgcmVzdWx0IGluIGEKc3lzdGVtIGRl
YWRsb2NrLCBwcmV2ZW50aW5nIHRoZSBjcmFzaCBkdW1wIG9yIHBhbmljIGxvZ2dpbmcgZnJvbQpj
b21wbGV0aW5nLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MTAwNTA4MTE0MS4zMzY4OC0xLXBhdWwuY2VyY3VlaWxAYm9vdGxpbi5j
b20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
