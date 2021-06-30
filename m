Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C606C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 11:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472AB6135D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 11:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472AB6135D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpRGsTGgkuh8TPFFFDSejcIKcjYvQnR/HQf9S4LWMcU=; b=egSTt0HUDYrx3u
	n8BZTVogFf+WihqHpqx6wnZqxqfX6BQE2oYUNbsYzAVWniTq7FnT48+1OWr76QVVuzoo99cUZX7mH
	PRhMXn73mlraIlktwXiy32VsD/gYmEO5uzlUXD9XYFb7KZIrsT4q8+Wf1YUCb1uirQMdXr2hJHHEv
	IwEaaQKz0VzIxp1iW+Zx4RRAnU/JxA8LZ4hd04FHU2GkO6RDfGamnEMhCZs3oIsefRuE9SGzbmkBF
	pHzktCQPNBkA7fH8LhSLjNuwZppgqSg4tqBC316mCV9eF7BSp1yDZUrOpOeq8pbUY5bGsFtGPOPCb
	JnzsdXpzocd2d48xFirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyY4X-00DgJa-MX; Wed, 30 Jun 2021 11:08:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyY4U-00DgI4-6U
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 11:08:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F20A9C0006;
 Wed, 30 Jun 2021 11:07:54 +0000 (UTC)
Date: Wed, 30 Jun 2021 13:07:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "Yadav, Pratyush" <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>
Subject: Re: mtd: spi-nor: Changes for v5.14
Message-ID: <20210630130754.608b3564@xps13>
In-Reply-To: <56e24b3e-57a2-50a0-8dee-c6b7ec62193f@ti.com>
References: <56e24b3e-57a2-50a0-8dee-c6b7ec62193f@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_040758_558689_C16D2F36 
X-CRM114-Status: GOOD (  15.82  )
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

SGkgVmlnbmVzaCwKClZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4gd3JvdGUg
b24gRnJpLCAyNSBKdW4gMjAyMQoxMjoxNzozNiArMDUzMDoKCj4gSGkgUmljaGFyZCwKPiAKPiBU
aGlzIGlzIHRoZSBTUEkgTk9SIFBSIGZvciB2NS4xNC4KPiAKPiBSZWdhcmRzCj4gVmlnbmVzaAo+
IAo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYzQ2ODE1NDdiY2NlNzc3
ZGFmNTc2OTI1YTk2NmZmYTgyNGVkZDA5ZDoKPiAKPiAgIExpbnV4IDUuMTMtcmMzICgyMDIxLTA1
LTIzIDExOjQyOjQ4IC0xMDAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L210ZC9saW51eC5naXQgdGFncy9zcGktbm9yL2Zvci01LjE0Cj4gCj4gZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIGMxN2U1Yzg1YjMyZjg4MDkxMzVmMzIxMWJhMjUyNWZiOThiNWMw
OWY6Cj4gCj4gICBtdGQ6IHNwaS1ub3I6IHJlbW92ZSByZWR1bmRhbnQgY29udGludWUgc3RhdGVt
ZW50ICgyMDIxLTA2LTIxIDExOjE3OjEwICswNTMwKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBTUEkgTk9SIGNv
cmUgY2hhbmdlczoKPiAtIEFiaWxpdHkgdG8gZHVtcCBTRkRQIHRhYmxlcyB2aWEgc3lzZnMKPiAt
IFN1cHBvcnQgZm9yIGVyYXNpbmcgT1RQIHJlZ2lvbnMgb24gV2luYm9uZCBhbmQgc2ltaWxhciBm
bGFzaGVzCj4gLSBGZXcgQVBJIGRvYyB1cGRhdGVzIGFuZCBmaXhlcwo+IC0gTG9ja2luZyBzdXBw
b3J0IGZvciBNWDI1TDEyODA1RAo+IAo+IFNQSSBOT1IgY29udHJvbGxlciBkcml2ZXJzIGNoYW5n
ZXM6Cj4gLSBVc2UgU1BJX01PREVfWF9NQVNLIGluIG54cC1zcGlmaQo+IC0gSW50ZWwgQWxkZXIg
TGFrZS1NIFNQSSBzZXJpYWwgZmxhc2ggc3VwcG9ydAo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbmR5IFNoZXZj
aGVua28gKDEpOgo+ICAgICAgIG10ZDogc3BpLW5vcjogbnhwLXNwaWZpOiBVc2UgU1BJX01PREVf
WF9NQVNLCj4gCj4gQ29saW4gSWFuIEtpbmcgKDEpOgo+ICAgICAgIG10ZDogc3BpLW5vcjogcmVt
b3ZlIHJlZHVuZGFudCBjb250aW51ZSBzdGF0ZW1lbnQKPiAKPiBEYXZpZCBCYXVlciAoMSk6Cj4g
ICAgICAgbXRkOiBzcGktbm9yOiBlbmFibGUgbG9ja2luZyBzdXBwb3J0IGZvciBNWDI1TDEyODA1
RAo+IAo+IE1pY2hhZWwgV2FsbGUgKDcpOgo+ICAgICAgIG10ZDogc3BpLW5vcjogb3RwOiBmaXgg
a2VybmVsZG9jIHR5cG9zCj4gICAgICAgbXRkOiBzcGktbm9yOiBvdHA6IGZpeCBhY2Nlc3MgdG8g
c2VjdXJpdHkgcmVnaXN0ZXJzIGluIDQgYnl0ZSBtb2RlCj4gICAgICAgbXRkOiBzcGktbm9yOiBv
dHA6IHVzZSBtb3JlIGNvbnNpc3RlbnQgd29yZGluZwo+ICAgICAgIG10ZDogc3BpLW5vcjogb3Rw
OiByZXR1cm4gLUVST0ZTIGlmIHJlZ2lvbiBpcyByZWFkLW9ubHkKPiAgICAgICBtdGQ6IHNwaS1u
b3I6IG90cDogaW1wbGVtZW50IGVyYXNlIGZvciBXaW5ib25kIGFuZCBzaW1pbGFyIGZsYXNoZXMK
PiAgICAgICBtdGQ6IHNwaS1ub3I6IHNmZHA6IHNhdmUgYSBjb3B5IG9mIHRoZSBTRkRQIGRhdGEK
PiAgICAgICBtdGQ6IHNwaS1ub3I6IGFkZCBpbml0aWFsIHN5c2ZzIHN1cHBvcnQKPiAKPiBNaWth
IFdlc3RlcmJlcmcgKDEpOgo+ICAgICAgIG10ZDogc3BpLW5vcjogaW50ZWwtc3BpOiBBZGQgc3Vw
cG9ydCBmb3IgSW50ZWwgQWxkZXIgTGFrZS1NIFNQSSBzZXJpYWwgZmxhc2gKPiAKPiBQcmF0eXVz
aCBZYWRhdiAoMSk6Cj4gICAgICAgbXRkOiBzcGktbm9yOiBBZGQgZG9jdW1lbnRhdGlvbiBmb3Ig
c3BpX25vcl9zb2Z0X3Jlc2V0KCkKPiAKPiBUdWRvciBBbWJhcnVzICgxKToKPiAgICAgICBtdGQ6
IHNwaS1ub3I6IG1hY3Jvbml4OiBGaXggbmFtZSBmb3IgbXg2Nmw1MTIzNWYKPiAKPiAgRG9jdW1l
bnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtc3BpLWRldmljZXMtc3BpLW5vciB8ICAzMSAr
Kwo+ICBkcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAyICstCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaW50ZWwtc3Bp
LXBjaS5jICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJz
L254cC1zcGlmaS5jICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjIgKy0KPiAgZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNiArCj4g
IGRyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDE2MCArKysrKysrKystCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTggKysrKwo+ICBkcml2ZXJzL210ZC9z
cGktbm9yL3N5c2ZzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkzICsrKysrKwo+
ICBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKPiAgaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArCj4gIDEyIGZpbGVzIGNoYW5nZWQsIDM3MCBpbnNlcnRpb25zKCsp
LCAyMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vQUJJ
L3Rlc3Rpbmcvc3lzZnMtYnVzLXNwaS1kZXZpY2VzLXNwaS1ub3IKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3lzZnMuYwoKUHVsbGVkIGludG8gbXRkL25leHQsIHRo
YW5rcyEKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
