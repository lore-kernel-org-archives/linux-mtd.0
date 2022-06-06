Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2DFC43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmpJ9iBP1nyMHAmDEXasNWEcN9rb1EdFF7Ecl/ldFsY=; b=Ayhd7zpKpL99tF
	tA+BMpKKh1l0wpbK6tHTrSTP5Mt2ynvVqVPhdS5gyuXIahp41jj1sd/9HfW/CaIM38q+b3AQwWgtS
	uheqASuKS8Q/MWpwtAibRQFa/VMMYYiJDzqcfHE/NerkStBruxHppkeqykX1emV1bUt/VPI4Z5Nw6
	KeKvXxqRvqI7EEmdGtCTTPa9XVIjhDFW+QkMK+TxijQ+Csoc1OZycgi2Qd7FqMikzja1IjultNDVt
	sORsT+kdehd05GP+smkJFCQwAX8MsRoqRv7DyfH9f1GSYB6/JpGDLzYmFlw3K7BJaYroiyWhIES5u
	eDevpDzVDCqBhSqkT9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCdO-001KWB-8x; Mon, 06 Jun 2022 13:19:06 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCdC-001KRT-6U; Mon, 06 Jun 2022 13:18:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 43D8924000A;
	Mon,  6 Jun 2022 13:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654521528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQMnz3kE25tuaHePTw9IIcU1s7DFhes1/13W4tlWP0g=;
	b=Q5TqKuS6rm5fKUbW/to2iIks63dYveytMItZN2hQSGiABR1yQZaWIH2Wv3feBM+l71PDhZ
	7hym5Z3FW0h+npJn81HTjHLseNMoNrZ0oZ/kspCkbk5Ka7N0ZwnLqP4EYcgXTtQ3/L9X4N
	zdw6nHv4EtsheM4g0P3UtTdddQD0ITB2W3HM+r4MZNQ/1tuLq5GIG8pvs8TMps7AAAWvDq
	KWEheiUzVKJwXJ40gpKBdibyxlFHBpB7P1POSyqkmc9F4g26Gm1ZcN7V/ikAnPNjpsZEC8
	r6WqDp2Hd1vqY4u3kJfrLvtgLCgxjfK9U+wbX7n6tDiG5WHcgk0IWvmrDbijNA==
Date: Mon, 6 Jun 2022 15:18:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Joel Stanley <joel@jms.id.au>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach
 <dev@lynxeye.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Liang Yang <liang.yang@amlogic.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 kernel@pengutronix.de, linux-mtd@lists.infradead.org, Michael Walle
 <michael@walle.cc>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 00/14] mtd: Fix platform remove callbacks to always
 return 0
Message-ID: <20220606151841.682a5939@xps-13>
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_061854_543202_18AA869A 
X-CRM114-Status: GOOD (  14.69  )
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

SGkgRm9sa3MsCgp1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUgd3JvdGUgb24gRnJpLCAg
MyBKdW4gMjAyMiAyMzowNzo0NCArMDIwMDoKCj4gSGVsbG8sCj4gCj4gdGhpcyBzZXJpZXMgcHJl
cGFyZXMgdG8gbWFrZSBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2tzIHJldHVybiB2b2lkLgo+IFRo
ZXJlZm9yIGZpcnN0IHVwZGF0ZSB0aGVtIHRvIGFsd2F5cyByZXR1cm4gMC4gVGhlIHJhdGlvbmFs
ZSBpcyB0aGF0IHRoZQo+IExpbnV4IGRldmljZSBtb2RlbCBkb2Vzbid0IGhhbmRsZSBmYWlsdXJl
cyBvbiByZW1vdmUgYW5kIGlmIGEgcmVtb3ZlCj4gY2FsbGJhY2sgcmV0dXJucyBhbiBlcnJvciwg
aXQganVzdCBlbWl0cyBhIHF1aXRlIGdlbmVyaWMgZXJyb3IgbWVzc2FnZQo+IGFuZCBzdGlsbCBy
ZW1vdmVzIHRoZSBkZXZpY2UuCgpUdWRvciwgUHJhdHl1c2gsIFJpY2hhcmQsIFZpZ25lc2gsCgpU
aGUgc2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUgKGJlc2lkZXMgdGhlIGF0bWVsIHBhdGNoKSwgSSB0
aGluayBpdCdzCmJlc3QgdG8gdGFrZSBpdCBkaXJlY3RseSB0aHJvdWdoIG10ZC9uZXh0IGluc3Rl
YWQgb2YgZ29pbmcgdGhyb3VnaCBhbGwKdGhlIGRpZmZlcmVudCBpbnRlcm5hbCBicmFuY2hlcywg
cGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBkaXNhZ3JlZQp3aXRoIHRoZSBpZGVhLgoKQ2hlZXJz
LApNaXF1w6hsCgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+IFV3ZSBLbGVpbmUtS8O2bmln
ICgxNCk6Cj4gICBtdGQ6IGh5cGVyYnVzOiBNYWtlIGh5cGVyYnVzX3VucmVnaXN0ZXJfZGV2aWNl
KCkgcmV0dXJuIHZvaWQKPiAgIG10ZDogc3BpLW5vcjogYXNwZWVkLXNtYzogTWFrZSBhc3BlZWRf
c21jX3VucmVnaXN0ZXIoKSByZXR1cm4gdm9pZAo+ICAgbXRkOiBwb3dlcm52X2ZsYXNoOiBXYXJu
IGFib3V0IGZhaWx1cmUgdG8gdW5yZWdpc3RlciBtdGQgZGV2aWNlCj4gICBtdGQ6IHN0LXNwaV9m
c206IFdhcm4gYWJvdXQgZmFpbHVyZSB0byB1bnJlZ2lzdGVyIG10ZCBkZXZpY2UKPiAgIG10ZDog
bHBkZHIyX252bTogV2FybiBhYm91dCBmYWlsdXJlIHRvIHVucmVnaXN0ZXIgbXRkIGRldmljZQo+
ICAgbXRkOiBzcGVhcl9zbWk6IERvbid0IHNraXAgY2xlYW51cCBhZnRlciBtdGRfZGV2aWNlX3Vu
cmVnaXN0ZXIoKQo+ICAgICBmYWlsZWQKPiAgIG10ZDogc3BlYXJfc21pOiBEcm9wIGlmIHdpdGgg
YW4gYWx3YXlzIGZhbHNlIGNvbmRpdGlvbgo+ICAgbXRkOiByYXduYW5kOiBhdG1lbDogV2FybiBh
Ym91dCBmYWlsdXJlIHRvIHVucmVnaXN0ZXIgbXRkIGRldmljZQo+ICAgbXRkOiByYXduYW5kOiBv
bWFwMjogU3VwcHJlc3MgZXJyb3IgbWVzc2FnZSBhZnRlciBXQVJOIGluIC5yZW1vdmUoKQo+ICAg
bXRkOiByYXduYW5kOiB0ZWdyYTogRG9uJ3Qgc2tpcCBjbGVhbnVwIGFmdGVyIG10ZF9kZXZpY2Vf
dW5yZWdpc3RlcigpCj4gICAgIGZhaWxlZAo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjogRG9uJ3Qg
c2tpcCBjbGVhbnVwIGFmdGVyIG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpCj4gICAgIGZhaWxlZAo+
ICAgbXRkOiByYXduYW5kOiBtZXNvbjogRHJvcCBjbGVhbmluZyBwbGF0Zm9ybSBkYXRhIGluIC5y
ZW1vdmUoKQo+ICAgbXRkOiBwaHlzbWFwOiBEb24ndCBza2lwIGNsZWFudXAgYWZ0ZXIgbXRkX2Rl
dmljZV91bnJlZ2lzdGVyKCkgZmFpbGVkCj4gICBtdGQ6IHBoeXNtYXA6IERyb3AgaWYgd2l0aCBh
biBhbHdheXMgZmFsc2UgY29uZGl0aW9uCj4gCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJu
dl9mbGFzaC5jICAgICAgICAgIHwgIDQgKysrLQo+ICBkcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFy
X3NtaS5jICAgICAgICAgICAgICB8IDEwICsrLS0tLS0tLS0KPiAgZHJpdmVycy9tdGQvZGV2aWNl
cy9zdF9zcGlfZnNtLmMgICAgICAgICAgICAgfCAgNCArKystCj4gIGRyaXZlcnMvbXRkL2h5cGVy
YnVzL2hibWMtYW02NTQuYyAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbXRkL2h5
cGVyYnVzL2h5cGVyYnVzLWNvcmUuYyAgICAgICAgIHwgIDggKystLS0tLS0KPiAgZHJpdmVycy9t
dGQvaHlwZXJidXMvcnBjLWlmLmMgICAgICAgICAgICAgICAgfCAgNSArKystLQo+ICBkcml2ZXJz
L210ZC9scGRkci9scGRkcjJfbnZtLmMgICAgICAgICAgICAgICB8ICA0ICsrKy0KPiAgZHJpdmVy
cy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYyAgICAgICAgICAgICAgfCAxMyArKystLS0tLS0tLS0t
Cj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIHwgIDUgKysr
Ky0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jICAgICAgICAgICAgfCAxNiAr
KystLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMgICAgICAgICAg
ICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYyAg
ICAgICAgICAgIHwgIDUgKy0tLS0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9h
c3BlZWQtc21jLmMgfCAgOCArKysrLS0tLQo+ICBpbmNsdWRlL2xpbnV4L210ZC9oeXBlcmJ1cy5o
ICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgMTQgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0
aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCj4gCj4gYmFzZS1jb21taXQ6IDRiMDk4NmEzNjEzYzky
ZjRlYzFiZGM3ZjYwZWM2NmZlYTEzNTk5MWYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
