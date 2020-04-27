Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AB2C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCAC206B8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USgumIeB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DCAC206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNB9cSghVF248eC0npJhKFn5G6xahLxWoMUp24k7zAU=; b=USgumIeBPPiGKt
	VK+6OXDGyE/vQLWng+ZkaAY3wapoGc0Do5SfPtkx2KIU/kLz3CPbRCXBSE0g8BOUeMROFGJ49vzd1
	VICmtPywttVaxqft1US1878yWJnaKpqrLSIocjULLjJ3oLx0wBkSLZkkVWGA3cpvRVz6CtC+uIWYr
	uo4gaZOHmhfY2ewT08DDcxFnxYGaeaDjwmm+E8qgmXItuVgWZL6nDbh4/OEGmITbGUcNg+QInEeAZ
	dZFB0zGohWZPAZOQdd4EkYcQJueySmi8AddgpP5iEHnAKU1fUl4xqzZojpDPgrelsoEKjnZXbMtR1
	PYRnqvtwwLamQcBmT6RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9ho-0000L8-Ju; Mon, 27 Apr 2020 19:46:16 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9hD-0008AQ-5R
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:45:44 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 58E9A200002;
 Mon, 27 Apr 2020 19:45:36 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:45:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 06/17] mtd: rawnand: cafe: Factor out the controller
 initialization logic
Message-ID: <20200427214535.7d424c8f@xps13>
In-Reply-To: <20200427082028.394719-7-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-7-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_124539_484348_13BF6265 
X-CRM114-Status: GOOD (  12.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDEwOjIwOjE2ICswMjAwOgoKPiBUaGUgc2FtZSBj
b2RlIGlzIHByZXNlbnQgaW4gdGhlIHByb2JlIGFuZCByZXN1bWUgcGF0aC4gTGV0J3MgY3JlYXRl
Cj4gYW4gaW5pdCBoZWxwZXIgdG8gZmFjdG9yIHRoYXQgb3V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+CgpOaWNlIGNh
dGNoISBBIG5pdHBpY2sgYmVsb3cuCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZl
X25hbmQuYyB8IDE4OSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAxMjIgZGVsZXRpb25zKC0pCj4gCgpbLi4uXQoKPiBA
QCAtOTgwLDc0ICs5ODgsMTEgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIGNhZmVfbmFuZF90
YmwpOwo+ICAKPiAgc3RhdGljIGludCBjYWZlX25hbmRfcmVzdW1lKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQo+ICB7Cj4gLQl1aW50MzJfdCBjdHJsOwo+ICAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBw
Y2lfZ2V0X2RydmRhdGEocGRldik7Cj4gIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gbXRkX3Rv
X25hbmQobXRkKTsKPiAgCXN0cnVjdCBjYWZlX3ByaXYgKmNhZmUgPSBuYW5kX2dldF9jb250cm9s
bGVyX2RhdGEoY2hpcCk7Cj4gIAo+IC0gICAgICAgLyogU3RhcnQgb2ZmIGJ5IHJlc2V0dGluZyB0
aGUgTkFORCBjb250cm9sbGVyIGNvbXBsZXRlbHkgKi8KPiAtCWNhZmVfd3JpdGVsKGNhZmUsIENB
RkVfR0xPQkFMX1JFU0VUX05BTkQsIEdMT0JBTF9SRVNFVCk7Cj4gLQljYWZlX3dyaXRlbChjYWZl
LCAwLCBHTE9CQUxfUkVTRVQpOwo+IC0JY2FmZV93cml0ZWwoY2FmZSwgMHhmZmZmZmZmZiwgTkFO
RF9JUlFfTUFTSyk7Cj4gLQo+IC0JLyogUmVzdG9yZSB0aW1pbmcgY29uZmlndXJhdGlvbiAqLwo+
IC0JY2FmZV93cml0ZWwoY2FmZSwgdGltaW5nWzBdLCBOQU5EX1RJTUlORzEpOwo+IC0JY2FmZV93
cml0ZWwoY2FmZSwgdGltaW5nWzFdLCBOQU5EX1RJTUlORzIpOwo+IC0JY2FmZV93cml0ZWwoY2Fm
ZSwgdGltaW5nWzJdLCBOQU5EX1RJTUlORzMpOwo+IC0KPiAtICAgICAgICAvKiBEaXNhYmxlIG1h
c3RlciByZXNldCwgZW5hYmxlIE5BTkQgY2xvY2sgKi8KPiAtCWN0cmwgPSBjYWZlX3JlYWRsKGNh
ZmUsIEdMT0JBTF9DVFJMKTsKPiAtCWN0cmwgJj0gfihDQUZFX0dMT0JBTF9TV19SRVNFVF9TRVQg
fAo+IC0JCSAgQ0FGRV9HTE9CQUxfU1dfUkVTRVRfQ0xFQVIgfAo+IC0JCSAgQ0FGRV9HTE9CQUxf
TUFTVEVSX1JFU0VUX1NFVCB8Cj4gLQkJICBDQUZFX0dMT0JBTF9NQVNURVJfUkVTRVRfQ0xFQVIg
fAo+IC0JCSAgQ0FGRV9HTE9CQUxfTkFORF9DTEtfRU5BQkxFKTsKPiAtCWN0cmwgfD0gQ0FGRV9H
TE9CQUxfTkFORF9DTEtfRU5BQkxFIHwKPiAtCQlDQUZFX0dMT0JBTF9TREhfQ0xLX0VOQUJMRSB8
Cj4gLQkJQ0FGRV9HTE9CQUxfQ0NJQ19DTEtfRU5BQkxFOwo+IC0JY2FmZV93cml0ZWwoY2FmZSwK
PiAtCQkgICAgY3RybCB8Cj4gLQkJICAgIENBRkVfR0xPQkFMX01BU1RFUl9SRVNFVF9TRVQgfAo+
IC0JCSAgICBDQUZFX0dMT0JBTF9TV19SRVNFVF9TRVQsCj4gLQkJICAgIEdMT0JBTF9DVFJMKTsK
PiAtCWNhZmVfd3JpdGVsKGNhZmUsCj4gLQkJICAgIGN0cmwgfAo+IC0JCSAgICBDQUZFX0dMT0JB
TF9NQVNURVJfUkVTRVRfQ0xFQVIgfAo+IC0JCSAgICBDQUZFX0dMT0JBTF9TV19SRVNFVF9DTEVB
UiwKPiAtCQkgICAgR0xPQkFMX0NUUkwpOwo+IC0KPiAtCWNhZmVfd3JpdGVsKGNhZmUsIDAsIE5B
TkRfRE1BX0NUUkwpOwo+IC0KPiAtCWNhZmVfd3JpdGVsKGNhZmUsCj4gLQkJICAgIENBRkVfR0xP
QkFMX05BTkRfQ0xLX0VOQUJMRSB8Cj4gLQkJICAgIENBRkVfR0xPQkFMX1NESF9DTEtfRU5BQkxF
IHwKPiAtCQkgICAgQ0FGRV9HTE9CQUxfQ0NJQ19DTEtfRU5BQkxFIHwKPiAtCQkgICAgQ0FGRV9H
TE9CQUxfTUFTVEVSX1JFU0VUX1NFVCB8Cj4gLQkJICAgIENBRkVfR0xPQkFMX1NXX1JFU0VUX0NM
RUFSLAo+IC0JCSAgICBHTE9CQUxfQ1RSTCk7Cj4gLQljYWZlX3dyaXRlbChjYWZlLAo+IC0JCSAg
ICBDQUZFX0dMT0JBTF9OQU5EX0NMS19FTkFCTEUgfAo+IC0JCSAgICBDQUZFX0dMT0JBTF9TREhf
Q0xLX0VOQUJMRSB8Cj4gLQkJICAgIENBRkVfR0xPQkFMX0NDSUNfQ0xLX0VOQUJMRSB8Cj4gLQkJ
ICAgIENBRkVfR0xPQkFMX01BU1RFUl9SRVNFVF9DTEVBUiB8Cj4gLQkJICAgIENBRkVfR0xPQkFM
X1NXX1JFU0VUX0NMRUFSLAo+IC0JCSAgICBHTE9CQUxfQ1RSTCk7Cj4gLQo+IC0JLyogU2V0IHVw
IERNQSBhZGRyZXNzICovCj4gLQljYWZlX3dyaXRlbChjYWZlLCBjYWZlLT5kbWFhZGRyICYgMHhm
ZmZmZmZmZiwgTkFORF9ETUFfQUREUjApOwo+IC0JaWYgKHNpemVvZihjYWZlLT5kbWFhZGRyKSA+
IDQpCj4gLQkvKiBTaGlmdCBpbiB0d28gcGFydHMgdG8gc2h1dCB0aGUgY29tcGlsZXIgdXAgKi8K
PiAtCQljYWZlX3dyaXRlbChjYWZlLCAoY2FmZS0+ZG1hYWRkciA+PiAxNikgPj4gMTYsIE5BTkRf
RE1BX0FERFIxKTsKPiAtCWVsc2UKPiAtCQljYWZlX3dyaXRlbChjYWZlLCAwLCBOQU5EX0RNQV9B
RERSMSk7Cj4gLQo+IC0JLyogRW5hYmxlIE5BTkQgSVJRIGluIGdsb2JhbCBJUlEgbWFzayByZWdp
c3RlciAqLwo+IC0JY2FmZV93cml0ZWwoY2FmZSwKPiAtCQkgICAgQ0FGRV9HTE9CQUxfSVJRX1BD
SV9FUlJPUiB8Cj4gLQkJICAgIENBRkVfR0xPQkFMX0lSUV9DQ0lDIHwKPiAtCQkgICAgQ0FGRV9H
TE9CQUxfSVJRX1NESCB8Cj4gLQkJICAgIENBRkVfR0xPQkFMX0lSUV9OQU5ELAo+IC0JCSAgICBH
TE9CQUxfSVJRX01BU0spOwo+ICsJY2FmZV9uYW5kX2luaXQoY2FmZSk7CgpBIG5ldyBsaW5lIHdv
dWxkIGJlIG5pY2UgaGVyZSA6cAoKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
