Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7C9C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9480A2070B
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hkjJnJ4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9480A2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7XA89m/H0Ro+2tQMEhMUJN4XbCDldMVlHGn4VSTEPU=; b=hkjJnJ4aMmcEkd
	avBijKeMzME1A54jjL+1bCRExHr6PLYbF7Fr56iAGjRWrv4ZqUFCsgLkLdUUIX34zWdTJrz8GxHvU
	ru5TuHsf3Cvq0l/5bqb4OXF/SLVDJyxQbpCybL6KoaM8Wq9y9twAwlqBFo/lX+P/2fOnJtTS3IqPT
	CzC+o6Ihzxk+vqUErhL9A6ff6M3hTcbGOkF5jf3jWxWN2DZQpYnlI7Q1SyvBLsLAgzjOuHquyUiWy
	W/+JtBUCK5GLD26oHlz2hdpBK1Po4qiyGeA32FrZGi4pu+KdWGyIUxxpc1e/Ry78BJ7GfRW3jHskf
	VkHNSSnE4+OGnvFhguyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYoDO-00017s-IU; Thu, 06 Jun 2019 08:57:42 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYoDG-000112-Ps; Thu, 06 Jun 2019 08:57:36 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id C37FA628550;
 Thu,  6 Jun 2019 10:57:32 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Jun 2019
 10:57:32 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 6 Jun 2019 10:57:32 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 01/15] mtd: nand: Add max_bad_eraseblocks_per_lun info
 to memorg
Thread-Topic: [PATCH v2 01/15] mtd: nand: Add max_bad_eraseblocks_per_lun info
 to memorg
Thread-Index: AQHU0scN55ZCxKZqF0m+9YUbyTEVtKaLkFoAgAMr1oCAAAOKgIAAA36AgAABcoA=
Date: Thu, 6 Jun 2019 08:57:32 +0000
Message-ID: <e8131767-fce8-0041-5c23-7b8ed71857c3@kontron.de>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
 <20190304201522.11323-2-miquel.raynal@bootlin.com>
 <CAO1O6se5=FDf2YTEEzmFJ4K6HQp_2ayU=WubxGAQJdMA4V4m-Q@mail.gmail.com>
 <5e5d473b-2f08-4230-0920-247c2c463c55@kontron.de>
 <20190606103951.1d774b9a@collabora.com>
 <0e04c73d-13cd-4416-569b-ee9e7c19ea4d@kontron.de>
In-Reply-To: <0e04c73d-13cd-4416-569b-ee9e7c19ea4d@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <8BA79DEF2D3462419E0C3481AECE33BB@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: C37FA628550.A0699
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, boris.brezillon@collabora.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 emil.lenngren@gmail.com, juliensu@mxic.com.tw,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, masonccyang@mxic.com.tw,
 miquel.raynal@bootlin.com, richard@nod.at,
 thomas.petazzoni@bootlin.com, tudor.ambarus@microchip.com,
 vigneshr@ti.com, yamada.masahiro@socionext.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_015735_155772_701FEACB 
X-CRM114-Status: GOOD (  13.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Emil Lenngren <emil.lenngren@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDYuMDYuMTkgMTA6NTIsIEZyaWVkZXIgU2NocmVtcGYgd3JvdGU6DQo+IE9uIDA2LjA2LjE5
IDEwOjM5LCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+PiBPbiBUaHUsIDYgSnVuIDIwMTkgMDg6
Mjc6MTEgKzAwMDANCj4+IFNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJv
bi5kZT4gd3JvdGU6DQo+Pg0KPj4+IEhpIEVtaWwsDQo+Pj4NCj4+PiBPbiAwNC4wNi4xOSAxMDow
MSwgRW1pbCBMZW5uZ3JlbiB3cm90ZToNCj4+Pj4gSGkgTWlxdWVsLA0KPj4+Pj4gwqDCoCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyBtYWNyb25peF9zcGluYW5kX3RhYmxlW10gPSB7
DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJTkFORF9JTkZPKCJNWDM1TEYxR0U0QUIiLCAw
eDEyLA0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5BTkRf
TUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMTAyNCwgMSwgMSwgMSksDQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTkFORF9NRU1PUkcoMSwgMjA0OCwgNjQsIDY0
LCAxMDI0LCA0MCwgMSwgMSwgMSksDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBOQU5EX0VDQ1JFUSg0LCA1MTIpLA0KPj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRT
KCZyZWFkX2NhY2hlX3ZhcmlhbnRzLA0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmd3JpdGVfY2FjaGVfdmFyaWFudHMsDQo+Pj4+PiBAQCAtMTAzLDcgKzEwMyw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIA0KPj4+Pj4gbWFjcm9uaXhfc3Bp
bmFuZF90YWJsZVtdID0gew0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5b3V0LA0KPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBteDM1bGYxZ2U0YWJfZWNjX2dldF9zdGF0dXMpKSwNCj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBTUElOQU5EX0lORk8oIk1YMzVMRjJHRTRBQiIsIDB4MjIs
DQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTkFORF9NRU1P
UkcoMSwgMjA0OCwgNjQsIDY0LCAyMDQ4LCAyLCAxLCAxKSwNCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOQU5EX01FTU9SRygxLCAyMDQ4LCA2NCwgNjQsIDIw
NDgsIDIwLCAyLCAxLCAxKSwNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIE5BTkRfRUNDUkVRKDQsIDUxMiksDQo+Pj4+DQo+Pj4+IE1heWJlIGEgYml0
IGxhdGUgdG8gdGhlIGRpc2N1c3Npb24sIGJ1dCBzaG91bGRuJ3QgMjAgYW5kIDQwIGJlIHN3YXBw
ZWQNCj4+Pj4gaGVyZSwgaS5lLiBpc24ndCBpdCB0aGUgbGFyZ2VyIGZsYXNoIHRoYXQgaGFzIG1v
cmUgbWF4IGJhZCBibG9ja3MgdGhhbg0KPj4+PiB0aGUgc21hbGxlciBvbmU/DQo+Pj4NCj4+PiBJ
IHRoaW5rIE1pcXVlbCBpcyBvdXQgb2Ygb2ZmaWNlIGZvciBzb21lIGRheXMsIHNvIEkganVzdCBj
aGVja2VkIGFuZCB5b3UNCj4+PiBhcmUgcmlnaHQsIHRoZSBtYXhpbXVtIG51bWJlciBvZiBiYWQg
YmxvY2tzIHNob3VsZCBiZSBzd2FwcGVkLg0KPj4+DQo+Pj4gQWN0dWFsbHkgdGhlcmUgaXMgYWxz
byBhIHdyb25nIHZhbHVlIGluIHRoZSBHaWdhRGV2aWNlIGRyaXZlcjogRm9yIHRoZQ0KPj4+IEdE
NUY0R1E0eEEgaXQgc2hvdWxkIGJlIDgwIGluc3RlYWQgb2YgNDAuDQo+Pg0KPj4gSGF2ZW4ndCBj
aGVja2VkIHRoZSBkYXRhc2hlZXQsIGJ1dCBrZWVwIGluIG1pbmQgdGhhdCB0aGlzIGlzIHRoZSBt
YXgNCj4+IG51bWJlciBvZiBlcmFzZWJsb2NrIHBlciBMVU4uDQo+IA0KPiBUaGUgZGF0YXNoZWV0
IGdpdmVzIDIwIGZvciB0aGUgMUcgdHlwZSBhbmQgNDAgZm9yIHRoZSAyRyB0eXBlLiBCb3RoIA0K
PiB0eXBlcyBoYXZlIG9ubHkgb25lIExVTi4gT25seSB0aGUgMkcgdHlwZSBoYXMgMiBwbGFuZXMs
IGJ1dCB0aGF0IA0KPiBzaG91bGRuJ3QgbWFrZSBhIGRpZmZlcmVuY2UsIHJpZ2h0Pw0KDQpTb3Jy
eSwgSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBNYWNyb25peCBjaGlwcy4gWW91IHdlcmUgcHJvYmFi
bHkgdGFsa2luZyANCmFib3V0IHRoZSBHaWdhRGV2aWNlLiBCdXQgdGhleSBhbGwgaGF2ZSBvbmx5
IG9uZSBMVU4sIHRvby4gU28gSSB0aGluayBJIA0KZ290IGl0IHJpZ2h0LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
