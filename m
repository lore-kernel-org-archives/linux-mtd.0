Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93233C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 22:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF7260FA0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 22:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BF7260FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AGl/GDxOJRCFe27/CWnc0nbiK/IQ5vhfHc5r9kViDw=; b=Emuyymgy5FNQnA
	9NtOEeyJvmcSVHZeAnJPLPFj9051r9TdHbiJa9OazZuJKFhrq+qc+bxUjtGqAehxmdsgxAKyc2qOw
	jdfPrmAzjo3vdxplnY6PEaTgAF+alNIbjmaNs368E5D8BPzlmuounFu7nAMHXa6HwvYfdiJMx5PYS
	zWZ7oFKMKIu/q1t/QQBLwNva8blE4MgKivTXfAar9irN1ucDe+zzYLi3bO6l1xYQeRGLNXzmB1rz+
	zSZXeK6+YavTAdkq1lci63p1ZfwT1pvw0aRlgHDbLEb5GZlIdJhfBE85P0D3wJZgKdizkawfO3NoA
	H0UJOkEsLU+I8TIiTL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLuvD-00Ab1R-Rx; Thu, 02 Sep 2021 22:10:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLuv9-00AazW-QR
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 22:10:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7C300C0003;
 Thu,  2 Sep 2021 22:10:51 +0000 (UTC)
Date: Fri, 3 Sep 2021 00:10:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.15
Message-ID: <20210903001050.5cc0c9be@xps13>
In-Reply-To: <20210903000310.6cd0fbff@xps13>
References: <20210903000310.6cd0fbff@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_151056_173969_A378A914 
X-CRM114-Status: GOOD (  14.08  )
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

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIEZyaSwg
MyBTZXAgMjAyMQowMDowMzoxMCArMDIwMDoKCj4gSGVsbG8sCj4gCj4gVGhpcyBpcyB0aGUgTkFO
RCBQUiBmb3IgNS4xNS4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgZTczZjBmMGVlNzU0MTE3MWQ4OWYyZTI0OTExMzBjNzc3MWJh
NThkMzoKPiAKPiAgIExpbnV4IDUuMTQtcmMxICgyMDIxLTA3LTExIDE1OjA3OjQwIC0wNzAwKQo+
IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFn
cy9uYW5kL2Zvci01LjE1Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDZiNDMw
Yzc1OTVlNGViOTVmYWU4ZmI1NGFkYzNjM2NlMDAyZTc1YWU6Cj4gCj4gICBtdGQ6IHJhd25hbmQ6
IGNhZmU6IEZpeCBhIHJlc291cmNlIGxlYWsgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggb2Yg
J2NhZmVfbmFuZF9wcm9iZSgpJyAoMjAyMS0wOC0yMyAxMDo1ODoxNCArMDIwMCkKPiAKPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gTkFORCBjb3JlIGNoYW5nZXM6Cj4gKiBSZXBhaXIgTWlxdWVsIFJheW5hbCdzIGVtYWls
IGFkZHJlc3MgaW4gTUFJTlRBSU5FUlMKPiAqIEZpeCBhIGNvdXBsZSBvZiBzcGVsbGluZyBtaXN0
YWtlcyBpbiBLY29uZmlnCj4gKiBiYnQ6IFNraXAgYmFkIGJsb2NrcyB3aGVuIHNlYXJjaGluZyBm
b3IgdGhlIEJCVCBpbiBOQU5ECj4gKiBSZW1vdmUgbmV2ZXIgY2hhbmdlZCByZXQgdmFyaWFibGUK
PiAKPiBSYXcgTkFORCBjaGFuZ2VzOgo+ICogY2FmZTogRml4IGEgcmVzb3VyY2UgbGVhayBpbiB0
aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBvZiAnY2FmZV9uYW5kX3Byb2JlKCknCj4gKiBpbnRlbDog
Rml4IGVycm9yIGhhbmRsaW5nIGluIHByb2JlCj4gKiBvbWFwOiBGaXgga2VybmVsIGRvYyB3YXJu
aW5nIG9uICdjYWxjdWF0ZScgdHlwbwo+ICogZ3BtYzogRml4IHRoZSBFQ0MgYnl0ZXMgdnMuIE9P
QiBieXRlcyBlcXVhdGlvbgo+IAo+IFNQSS1OQU5EIGNvcmUgY2hhbmdlczoKPiAqIFByb3Blcmx5
IGZpbGwgdGhlIE9PQiBhcmVhLgo+ICogRml4IGNvbW1lbnQKPiAKPiBTUEktTkFORCBkcml2ZXJz
IGNoYW5nZXM6Cj4gKiBtYWNyb25peDogQWRkIFF1YWQgc3VwcG9ydCBmb3Igc2VyaWFsIE5BTkQg
Zmxhc2gKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gQ2hyaXN0b3BoZSBKQUlMTEVUICgxKToKPiAgICAgICBtdGQ6
IHJhd25hbmQ6IGNhZmU6IEZpeCBhIHJlc291cmNlIGxlYWsgaW4gdGhlIGVycm9yIGhhbmRsaW5n
IHBhdGggb2YgJ2NhZmVfbmFuZF9wcm9iZSgpJwo+IAo+IENvbGluIElhbiBLaW5nICgxKToKPiAg
ICAgICBtdGQ6IHJhd25hbmQ6IEZpeCBhIGNvdXBsZSBvZiBzcGVsbGluZyBtaXN0YWtlcyBpbiBL
Y29uZmlnCj4gCj4gRGFuaWVsIFBhbG1lciAoMSk6Cj4gICAgICAgbXRkOiBzcGluYW5kOiBjb3Jl
OiBQcm9wZXJseSBmaWxsIHRoZSBPT0IgYXJlYS4KPiAKPiBFdmdlbnkgTm92aWtvdiAoMSk6Cj4g
ICAgICAgbXRkOiByYXduYW5kOiBpbnRlbDogRml4IGVycm9yIGhhbmRsaW5nIGluIHByb2JlCj4g
Cj4gSmFpbWUgTGlhbyAoMSk6Cj4gICAgICAgbXRkOiBzcGluYW5kOiBtYWNyb25peDogQWRkIFF1
YWQgc3VwcG9ydCBmb3Igc2VyaWFsIE5BTkQgZmxhc2gKPiAKPiBKYXNvbiBXYW5nICgxKToKPiAg
ICAgICBtdGQ6IHJhd25hbmQ6IHJlbW92ZSBuZXZlciBjaGFuZ2VkIHJldCB2YXJpYWJsZQo+IAo+
IEx1a2FzIEJ1bHdhaG4gKDEpOgo+ICAgICAgIE1BSU5UQUlORVJTOiByZXBhaXIgTWlxdWVsIFJh
eW5hbCdzIGVtYWlsIGFkZHJlc3MKPiAKPiBNaXF1ZWwgUmF5bmFsICgyKToKPiAgICAgICBkdC1i
aW5kaW5nczogbXRkOiBncG1jOiBGaXggdGhlIEVDQyBieXRlcyB2cy4gT09CIGJ5dGVzIGVxdWF0
aW9uCj4gICAgICAgbXRkOiBzcGluYW5kOiBGaXggY29tbWVudAo+IAo+IFN0ZWZhbiBSaWVkbXVl
bGxlciAoMSk6Cj4gICAgICAgbXRkOiByYXduYW5kOiBuYW5kX2JidDogU2tpcCBiYWQgYmxvY2tz
IHdoZW4gc2VhcmNoaW5nIGZvciB0aGUgQkJUIGluIE5BTkQKPiAKPiBWbGFkaW1pciBNb2xva292
ICgxKToKPiAgICAgICBtdGQ6IHJhd25hbmQ6IG9tYXA6IEZpeCBrZXJuZWwgZG9jIHdhcm5pbmcg
b24gJ2NhbGN1YXRlJyB0eXBvCj4gCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvZ3BtYy1uYW5kLnR4dCB8ICAyICstCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArKystCj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jICAgICAgICB8IDI3ICsr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9u
YW5kLmMgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfYmJ0LmMgICAgICAgICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNCArKystCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jv
bml4LmMgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAgMTAgZmls
ZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpQdWxsZWQgaW50
byBtdGQvbmV4dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
