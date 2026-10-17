Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4922ECCF2C7
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:To:Subject:From:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADGPZ9v8OlQVu03XWpV2qrSaq3ua/v8+hpxwV/MC5s4=; b=dYXYFh8tbP1mBq
	Q8D8bST6aXGw//4Y1AYXbWbG2Z2E5pjQl7mZEeeNxx3RhTQSOwInAqPz9OWcbWryya6/8Fsp5riaN
	+0swWlU8w1K76Ep8DlNZlyNeLNBY2fWqe9rEP3WGTl4lrAkZpaI1jRqkEp6wj8g54bLG6dF8BA4xL
	3dGaZcVdsZXD7GXhiwAYNEvu1FnvzF+hEluLNeN5b5/baery5cxIPlHJWs40kRGZp9KusLgUXizr4
	ZAwNYFQ/GbQA7orkyLCUNaoyclByrIQs+SrJJVWGUwN3YNnag8HcK8oIL2Mchai6PRyBnwYk2lQ5u
	6R3zt2G/nIbS4xq1MjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1q2-00000004g0v-0zZM;
	Sat, 17 Oct 2026 10:40:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1pz-00000004g03-1FHh
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 10:40:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FE9243E84;
	Sat, 17 Oct 2026 10:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CE41F000C4;
	Sat, 17 Oct 2026 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233626;
	bh=1QZjwI+cDcElcbu9/ejo3/YhyXEdaDVUkWYGSGtY240=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=O0gfthU26dDEALI+Y1XdlznaG/WDKAPcW3vy2hBPPfDv9YpsL4TjYy3QzdsI7Jsbl
	 5n/Q3Ny5GwWwvDGFWBYWwvqc4RZ+2FxprOy1m2ikGU3JoWzwIeypTE7iV7wIWu0WBh
	 i3ce4sAkuXA9nMhHA9aew7fy7Tv+xaDYWr8pkZLdX8r3oPchSTDYbDwkShteDNXKAi
	 +RFM6XIp9kHLRp1Qh08y+XGBb/6ZyocNte8TOO6ZI9UCmYQQgtmjsiZ5YTmCeXwGML
	 ZCtfSTCtGNjfRq+iSqvimhPs5XfQ2VgkgJIXelVl5Nu5c9eGORdxpRi6X/pZSFTNgB
	 rZWgN2QKI8sjQ==
Message-ID: <sashiko-outbox-175473@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/8] ARM: dts: microchip: sama5d27_wlsom1: read MAC
 address from QSPI SFDP
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, pengpeng@iscas.ac.cn, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <e756cb8a61a93caed4b68ff8e7c69c184ebfd47e.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <e756cb8a61a93caed4b68ff8e7c69c184ebfd47e.1792145382.git.manikandan.m@microchip.com>
Date: Sat, 17 Oct 2026 10:40:25 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG52bWVtOiBzc3QyNnZm
LXNmZHAtZXVpOiBpbmZpbml0ZSBwcm9iZSBkZWZlcnJhbCBvbiBtaXNzaW5nIEVVSS00OAotLQoK
Y29tbWl0IDIyMzNhMzQ1MmI0NjE1NDgxMzQwNzY4Y2JkNDZkOWI0YmZhZjEyYWMKQXV0aG9yOiBN
YW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+CgpBUk06
IGR0czogbWljcm9jaGlwOiBzYW1hNWQyN193bHNvbTE6IHJlYWQgTUFDIGFkZHJlc3MgZnJvbSBR
U1BJIFNGRFAKClRoaXMgY29tbWl0IGNvbmZpZ3VyZXMgdGhlIFFTUEkgZmxhc2ggU0ZEUCBhcyBh
biBOVk1FTSBwcm92aWRlciBvbiB0aGUKc2FtYTVkMjdfd2xzb20xX2VrIGJvYXJkIHRvIHJlYWQg
dGhlIGZhY3RvcnktcHJvZ3JhbW1lZCBNQUMgYWRkcmVzcy4gSXQKYWRkcyB0aGUgbnZtZW0tY2Vs
bHMgcHJvcGVydHkgdG8gdGhlIG1hY2IwIG5vZGUgc28gaXQgY2FuIHJldHJpZXZlIHRoZQpFVUkt
NDggaWRlbnRpZmllci4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hp
cC9hdDkxLXNhbWE1ZDI3X3dsc29tMV9lay5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9taWNyb2No
aXAvYXQ5MS1zYW1hNWQyN193bHNvbTFfZWsuZHRzCj4gaW5kZXggMzVhOTMzZWVjNTczOC4uNWU4
N2JmMDRiYzQ3YyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5
MS1zYW1hNWQyN193bHNvbTFfZWsuZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9j
aGlwL2F0OTEtc2FtYTVkMjdfd2xzb20xX2VrLmR0cwo+IEBAIC05Nyw2ICs5Nyw4IEBAIHVhcnQ2
OiBzZXJpYWxAMjAwIHsKPiAgCj4gICZtYWNiMCB7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4gKwlu
dm1lbS1jZWxscyA9IDwmbWFjX2FkZHJlc3NfZXVpNDg+Owo+ICsJbnZtZW0tY2VsbC1uYW1lcyA9
ICJtYWMtYWRkcmVzcyI7Cj4gIH07CgpbU2V2ZXJpdHk6IEhpZ2hdCldpbGwgdGhpcyBsZWFkIHRv
IGFuIGluZmluaXRlIHByb2JlIGRlZmVycmFsIGxvb3AgaWYgdGhlIFFTUEkgZmxhc2ggRVVJLTQ4
Cm1hcmtlciBpcyB1bnByb2dyYW1tZWQsIG1pc3NpbmcsIG9yIGNvcnJ1cHRlZD8KClRoZSBjb21t
aXQgbWVzc2FnZSBub3RlcyB0aGF0IGJvYXJkcyB3aXRob3V0IGFuIEVVSS1wcm9ncmFtbWVkIHBh
cnQgc2ltcGx5CmRvIG5vdCByZWZlcmVuY2UgdGhlIGNlbGwuIEhvd2V2ZXIsIGlmIHRoZSBmbGFz
aCBwYXJ0IGlzIHByZXNlbnQgYnV0IHRoZQptYXJrZXIgaXMgbWlzc2luZyBvciBjb3JydXB0ZWQs
IGl0IGFwcGVhcnMgdGhlIG1hY2IwIGludGVyZmFjZSB3aWxsIGZhaWwgdG8KaW5pdGlhbGl6ZSBl
bnRpcmVseSBpbnN0ZWFkIG9mIGZhbGxpbmcgYmFjayB0byBhIHJhbmRvbSBNQUMgYWRkcmVzcy4K
Ckxvb2tpbmcgYXQgdGhlIG52bWVtIGxheW91dCBkcml2ZXI6Cgpkcml2ZXJzL252bWVtL2xheW91
dHMvc3N0MjZ2Zi1zZmRwLWV1aS5jOnNmZHBfZXVpX2FkZF9jZWxscygpIHsKICAgICAgICBpZiAo
bWFya2VyICE9IFNGRFBfTUNIUF9FVUk0OF9NQVJLRVIpIHsKICAgICAgICAgICAgICAgIGRldl9k
YmcoZGV2LCAiRVVJLTQ4IG5vdCBwcm9ncmFtbWVkIChtYXJrZXIgMHglMDJ4KVxuIiwgbWFya2Vy
KTsKICAgICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgIH0KfQoKVGhpcyBzaWxlbnRseSBy
ZXR1cm5zIDAgd2l0aG91dCBhZGRpbmcgdGhlIGNlbGwsIHdoaWNoIGxlYXZlcyB0aGUgbGF5b3V0
CmJvdW5kLgoKV2hlbiBtYWNiX3Byb2JlKCkgcmVxdWVzdHMgdGhlIGNlbGwsIHRoZSBudm1lbSBj
b3JlIHNlZXMgdGhlIGJvdW5kIGxheW91dApidXQgbWlzc2luZyBjZWxsOgoKZHJpdmVycy9udm1l
bS9jb3JlLmM6b2ZfbnZtZW1fY2VsbF9nZXQoKSB7CiAgICAgICAgcmV0ID0gbnZtZW0tPmxheW91
dCA/IC1FUFJPQkVfREVGRVIgOiAtRU5PRU5UOwp9CgpUaGlzIGNhdXNlcyBvZl9udm1lbV9jZWxs
X2dldCgpIHRvIHJldHVybiAtRVBST0JFX0RFRkVSIGluZGVmaW5pdGVseS4KClRoZW4gaW4gdGhl
IGV0aGVybmV0IGRyaXZlcjoKCmRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWlu
LmM6bWFjYl9wcm9iZSgpIHsKICAgICAgICBlcnIgPSBvZl9nZXRfZXRoZGV2X2FkZHJlc3MobnAs
IGJwLT5uZXRkZXYpOwogICAgICAgIGlmIChlcnIgPT0gLUVQUk9CRV9ERUZFUikKICAgICAgICAg
ICAgICAgIGdvdG8gZXJyX291dF9mcmVlX25ldGRldjsKfQoKQmVjYXVzZSBtYWNiX3Byb2JlKCkg
dHJlYXRzIC1FUFJPQkVfREVGRVIgYXMgYSBmYXRhbCBlcnJvciB0aGF0IHJlcXVpcmVzCmRlZmVy
cmluZywgaXQgc2tpcHMgdGhlIGZhbGxiYWNrIHBhdGggYW5kIG5ldmVyIGJyaW5ncyB1cCBtYWNi
MC4KCkNvdWxkIHRoZSBsYXlvdXQgZHJpdmVyIHJldHVybiAtRU5PRU5UIGluc3RlYWQgd2hlbiB0
aGUgbWFya2VyIGlzIG1pc3NpbmcsCm9yIGlzIHRoZXJlIGFub3RoZXIgd2F5IHRvIGVuc3VyZSB0
aGUgZXRoZXJuZXQgaW50ZXJmYWNlIGNhbiBmYWxsIGJhY2sgdG8gYQpyYW5kb20gTUFDIGFkZHJl
c3MgaW4gdGhpcyBzY2VuYXJpbz8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc5MjE0NTM4Mi5naXQubWFuaWthbmRhbi5tQG1p
Y3JvY2hpcC5jb20/cGFydD03CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
