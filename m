Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69687CA1007
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajUGoA35rZGLVbnGOBzoX0b9Y83PnvkcrlUDK8HtKMA=; b=0fVpkdii28hHCW
	39QhhyV42hW6q1e5z/Sb0e3ciGU1mbd+DrBuqTKefpnV0WMLqTD7Jb1r30uySa82PVrh/NCyJki3T
	Ha/Am4OBaM3K9klmtb/3uWfD0ce2FndTE+P6k9BSb/SlRPVv7E7WfCmC+mOT+M2pMjvsdQ3Qb8rPp
	jI4PV5s057jqjz461FpVm646dxbDKxZYEHQ57nbDwRjyPu13RTMhlX81l8UH6X8hvRmqZNsVOEZ0a
	Ori00wqpIh++LHN8BDdYb5F0O0yKo8vxWrX1nZE/Uc8mo1OG4fxrwU8yWwOmx68tSjJzXnPTgYa9t
	uQeJLELQMYb1ld3kKZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VK-0000000DGt1-3cDo;
	Mon, 01 Sep 2025 16:35:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3pI-0000000CYQl-1AWJ
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:40:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD41F1A0A08;
	Mon,  1 Sep 2025 12:39:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6DCB60699;
	Mon,  1 Sep 2025 12:39:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2582A1C22C8BB;
	Mon,  1 Sep 2025 14:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756730398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hjSaWwNhUdo85L2FwvDbHX0Dn1OV+iWxON47HA30DAg=;
	b=qW3KDGAwEBP+3rUrRyGUnSkw+Shiu1ezwLwgDAGu7hIapG7oUje42O0AEYYZehBKhjyzH8
	+A80Ho75wc7DHUsJ+Cqs3/EQsRlKyB4gsZETw2LGyH1hfbbGPdhClvd0iZSBGAI9Oojilj
	3sOhVdRRBG3141TlNwp7jC8WfxD9o9aD1ESTo/wY/N6c0yH9GQ8++a5qIuFzOcLAGyv7C1
	cUB9K2A2TdEnbjufdbOwX9g/X85bP/9IhVR6k/1fyipwoScCsfc9fuy7IKejQ5XlfJjMAI
	LnG63rs/MNym10s6Dqk15//zJofIcImQOndalGKOyAd8uo78uwtt5WWejx9OCQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: core: always verify OOB offset in mtd_check_oob_ops()
In-Reply-To: <20250831-mtd-validate-ooboffs-v1-1-d3fdce7a8698@gmail.com>
	(Gabor Juhos's message of "Sun, 31 Aug 2025 16:40:10 +0200")
References: <20250831-mtd-validate-ooboffs-v1-1-d3fdce7a8698@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 01 Sep 2025 14:39:51 +0200
Message-ID: <874itmpcrs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054000_472500_1658BF85 
X-CRM114-Status: GOOD (  25.91  )
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

SGkgR2Fib3IsCgpPbiAzMS8wOC8yMDI1IGF0IDE2OjQwOjEwICswMiwgR2Fib3IgSnVob3MgPGo0
Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgoKPiBVc2luZyBhbiBPT0Igb2Zmc2V0IHBhc3QgZW5kIG9m
IHRoZSBhdmFpbGFibGUgT09CIGRhdGEgaXMgaW52YWxpZCwKPiBpcnJlZ2FyZGxlc3Mgb2Ygd2hl
dGhlciB0aGUgJ29vYmxlbicgaXMgc2V0IGluIHRoZSBvcHMgb3Igbm90LiBNb3ZlCj4gdGhlIHJl
bGV2YW50IGNoZWNrIG91dCBmcm9tIHRoZSBpZiBzdGF0ZW1lbnQgdG8gYWx3YXlzIHZlcmlmeSB0
aGF0Lgo+Cj4gVGhlICdvb2J0ZXN0JyBtb2R1bGUgZXhlY3V0ZXMgZm91ciB0ZXN0cyB0byB2ZXJp
ZnkgaG93IHJlYWRpbmcvd3JpdGluZwo+IE9PQiBkYXRhIHBhc3QgZW5kIG9mIHRoZSBkZXZpY2Vz
IGlzIGhhbmRsZWQuIEl0IGV4cGVjdHMgZXJyb3JzIGluIGNhc2UKPiBvZiB0aGVzZSB0ZXN0cywg
YnV0IHRoaXMgZXhwZWN0YXRpb24gZmFpbHMgaW4gdGhlIGxhc3QgdHdvIHRlc3RzIG9uCj4gTVRE
IGRldmljZXMsIHdoaWNoIGhhdmUgbm8gT09CIGJ5dGVzIGF2YWlsYWJsZS4KPgo+IFRoaXMgaXMg
aW5kaWNhdGVkIGluIHRoZSB0ZXN0IG91dHB1dCBsaWtlIHRoZSBmb2xsb3dpbmc6Cj4KPiAgICAg
WyAgMjEyLjA1OTQxNl0gbXRkX29vYnRlc3Q6IGF0dGVtcHRpbmcgdG8gd3JpdGUgcGFzdCBlbmQg
b2YgZGV2aWNlCj4gICAgIFsgIDIxMi4wNjAzNzldIG10ZF9vb2J0ZXN0OiBhbiBlcnJvciBpcyBl
eHBlY3RlZC4uLgo+ICAgICBbICAyMTIuMDY2MzUzXSBtdGRfb29idGVzdDogZXJyb3I6IHdyb3Rl
IHBhc3QgZW5kIG9mIGRldmljZQo+ICAgICBbICAyMTIuMDcxMTQyXSBtdGRfb29idGVzdDogYXR0
ZW1wdGluZyB0byByZWFkIHBhc3QgZW5kIG9mIGRldmljZQo+ICAgICBbICAyMTIuMDc2NTA3XSBt
dGRfb29idGVzdDogYW4gZXJyb3IgaXMgZXhwZWN0ZWQuLi4KPiAgICAgWyAgMjEyLjA4MjA4MF0g
bXRkX29vYnRlc3Q6IGVycm9yOiByZWFkIHBhc3QgZW5kIG9mIGRldmljZQo+ICAgICAuLi4KPiAg
ICAgWyAgMjEyLjMzMDUwOF0gbXRkX29vYnRlc3Q6IGZpbmlzaGVkIHdpdGggMiBlcnJvcnMKPgo+
IEZvciByZWZlcmVuY2UsIGhlcmUgaXMgdGhlIGNvcnJlc3BvbmRpbmcgY29kZSBmcm9tIHRoZSBv
b2J0ZXN0IG1vZHVsZToKPgo+ICAgICAvKiBBdHRlbXB0IHRvIHdyaXRlIG9mZiBlbmQgb2YgZGV2
aWNlICovCj4gICAgIG9wcy5tb2RlICAgICAgPSBNVERfT1BTX0FVVE9fT09COwo+ICAgICBvcHMu
bGVuICAgICAgID0gMDsKPiAgICAgb3BzLnJldGxlbiAgICA9IDA7Cj4gICAgIG9wcy5vb2JsZW4g
ICAgPSBtdGQtPm9vYmF2YWlsOwo+ICAgICBvcHMub29icmV0bGVuID0gMDsKPiAgICAgb3BzLm9v
Ym9mZnMgICA9IDE7Cj4gICAgIG9wcy5kYXRidWYgICAgPSBOVUxMOwo+ICAgICBvcHMub29iYnVm
ICAgID0gd3JpdGVidWY7Cj4gICAgIHByX2luZm8oImF0dGVtcHRpbmcgdG8gd3JpdGUgcGFzdCBl
bmQgb2YgZGV2aWNlXG4iKTsKPiAgICAgcHJfaW5mbygiYW4gZXJyb3IgaXMgZXhwZWN0ZWQuLi5c
biIpOwo+ICAgICBlcnIgPSBtdGRfd3JpdGVfb29iKG10ZCwgbXRkLT5zaXplIC0gbXRkLT53cml0
ZXNpemUsICZvcHMpOwo+ICAgICBpZiAoZXJyKSB7Cj4gICAgICAgICAgICAgcHJfaW5mbygiZXJy
b3Igb2NjdXJyZWQgYXMgZXhwZWN0ZWRcbiIpOwo+ICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAg
IHByX2VycigiZXJyb3I6IHdyb3RlIHBhc3QgZW5kIG9mIGRldmljZVxuIik7Cj4gICAgICAgICAg
ICAgZXJyY250ICs9IDE7Cj4gICAgIH0KPgo+IEFzIGl0IGNhbiBiZSBzZWVuLCB0aGUgY29kZSBz
ZXRzICdvb2JvZmZzJyB0byAxLCBhbmQgJ29vYmxlbicgdG8KPiBtdGQtPm9vYmF2YWlsIHdoaWNo
IGlzIHplcm8gaW4gb3VyIGNhc2UuCj4KPiBTaW5jZSB0aGUgbXRkX2NoZWNrX29vYl9vcHMoKSBm
dW5jdGlvbiBvbmx5IHZlcmlmaWVzICdvb2JvZmZzJyBpZiAnb29ibGVuJwo+IGlzIG5vdCB6ZXJv
LCB0aGUgJ29vYm9mZnMnIHZhbHVlIGRvZXMgbm90IGdldHMgdmFsaWRhdGVkIGFuZCB0aGUgZnVu
Y3Rpb24KPiByZXR1cm5zIHN1Y2Nlc3Mgd2hlcmVhcyBpdCBzaG91bGQgZmFpbC4KPgo+IEFmdGVy
IHRoZSBjaGFuZ2UsIHRoZSBvb2J0ZXN0IG1vZHVsZSB3aWxsIGJhaWwgb3V0IGVhcmx5IHdpdGgg
YW4gZXJyb3IgaWYKPiB0aGVyZSBhcmUgbm8gT09CIGJ5dGVzIGF2YWlsYWJsZSBvbiB0aGUgTURU
IGRldmljZSB1bmRlciB0ZXN0Ogo+Cj4gICAgICMgY2F0IC9zeXMvY2xhc3MvbXRkL210ZDAvb29i
YXZhaWwKPiAgICAgMAo+ICAgICAjIGluc21vZCBtdGRfdGVzdDsgaW5zbW9kIG10ZF9vb2J0ZXN0
IGRldj0wCj4gICAgIFsgIDk0My42MDYyMjhdCj4gICAgIFsgIDk0My42MDYyNTldID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgICAgWyAgOTQzLjYw
Njc4NF0gbXRkX29vYnRlc3Q6IE1URCBkZXZpY2U6IDAKPiAgICAgWyAgOTQzLjYxMjY2MF0gbXRk
X29vYnRlc3Q6IE1URCBkZXZpY2Ugc2l6ZSA1MjQyODgsIGVyYXNlYmxvY2sgc2l6ZSAxMzEwNzIs
IHBhZ2Ugc2l6ZSAyMDQ4LCBjb3VudCBvZiBlcmFzZWJsb2NrcyA0LCBwYWdlcyBwZXIgZXJhc2Vi
bG9jayA2NCwgT09CIHNpemUgMTI4Cj4gICAgIFsgIDk0My42MTYwOTFdIG10ZF90ZXN0OiBzY2Fu
bmluZyBmb3IgYmFkIGVyYXNlYmxvY2tzCj4gICAgIFsgIDk0My42Mjk1NzFdIG10ZF90ZXN0OiBz
Y2FubmVkIDQgZXJhc2VibG9ja3MsIDAgYXJlIGJhZAo+ICAgICBbICA5NDMuNjM0MzEzXSBtdGRf
b29idGVzdDogdGVzdCAxIG9mIDUKPiAgICAgWyAgOTQzLjY1MzQwMl0gbXRkX29vYnRlc3Q6IHdy
aXRpbmcgT09CcyBvZiB3aG9sZSBkZXZpY2UKPiAgICAgWyAgOTQzLjY1MzQyNF0gbXRkX29vYnRl
c3Q6IGVycm9yOiB3cml0ZW9vYiBmYWlsZWQgYXQgMHgwCj4gICAgIFsgIDk0My42NTc0MTldIG10
ZF9vb2J0ZXN0OiBlcnJvcjogdXNlX2xlbiAwLCB1c2Vfb2Zmc2V0IDAKPiAgICAgWyAgOTQzLjY2
MjQ5M10gbXRkX29vYnRlc3Q6IGVycm9yIC0yMiBvY2N1cnJlZAo+ICAgICBbICA5NDMuNjY3NTc0
XSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBU
aGlzIGJlaGF2aW91ciBpcyBtb3JlIGFjY3VyYXRlIHRoYW4gdGhlIGN1cnJlbnQgb25lIHdoZXJl
IG1vc3QgdGVzdHMKPiBhcmUgaW5kaWNhdGluZyBzdWNjZXNzZnVsIHdyaXRpbmcgb2YgT09CIGRh
dGEgZXZlbiB0aGF0IGluIGZhY3Qgbm90aGluZwo+IGdldHMgd3JpdHRlbiBpbnRvIHRoZSBkZXZp
Y2UsIHdoaWNoIGlzIHF1aXRlIG1pc2xlYWRpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHYWJvciBK
dWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KClRoYW5rcyBhIGxvdCBmb3IgdGhpcyBjb250cmlidXRp
b24sIEknbSByZWFkeSB0byB0YWtlIGl0LiBKdXN0IG9uZQpxdWVzdGlvbiwgZG8geW91IGNvbnNp
ZGVyIGl0IHNob3VsZCBiZSBiYWNrcG9ydGVkPyBJIHdvdWxkIHRlbmQgdG8KYW5zd2VyIHllcyB0
byB0aGlzIHF1ZXN0aW9uLCB3aGljaCB3b3VsZCBpbnZvbHZlIHlvdSBzZW5kaW5nIGEgdjIgd2l0
aDoKCiAgICAgICBGaXhlczoKICAgICAgIENjOiBzdGFibGUuLi4KCk90aGVyd2lzZSBJIGNhbiB0
YWtlIGl0IGFzLWlzIGlmIHlvdSBjb252aW5jZSBtZSBpdCBpcyBub3Qgc28gcmVsZXZhbnQKOi0p
CgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
