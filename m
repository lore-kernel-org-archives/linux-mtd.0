Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD49C282D9
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSbf1mUI9stwd+csAdAYktDSGuou9+PMGe+054M2pCU=; b=jqCSeXCx/e2D0R
	XgDX1LIbC4yMUYGTXTqgMfdw4mMe4kQA8kYTQLUpt1euwm4mJcDuU12CQG3Zdw05RhxojzokC5uJ+
	CLzECynSjP++Jiq28fBRNWwYsfeqF0lK6md00TEhUdj6PIRcET4nCCVdfj/CzErDtQnios3LggfTc
	ujgTpawMpvGfAmOlfdZ/hYPXmaEyf2rUYeYYsZKm4QbgZXB3poE5bT+haSXV+pKm1eJ982iQYGt0Z
	MJci4bICKzuBic3GcrOwBI7WfZf2zAIN2tQPoikfbYTcuOxGNRxWjttuOWMxBM6P+i+ADxiY8geIz
	5OSUfY6vslip2N6I/WNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmPX-00000007lU3-2lQ3;
	Wed, 05 Mar 2025 10:55:35 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpltG-00000007fEg-35x2;
	Wed, 05 Mar 2025 10:22:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25A8A204D0;
	Wed,  5 Mar 2025 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741170131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/i/ZYSpCCcaalSAZPE6RIBpR+1kehNr94nOWqgWFQo=;
	b=ED6gCxt9+D+E+Xnlpd76DBNkUVjEG/t0SiS3K1jmWMHm21BlSSePusLZ5xQ4KYtIwjO3ri
	DraOId/ugKydAwHutaD3tO1JHenfvXHELPfZf5SKRF2hlcsBQw7FyKXPx23ScoIiwWEUx7
	0VpJ7uy4rnxiZ5yzdqkK0EPiFdG9q1B4SIKPJFmmSiMenCuTx3npfnjW42+R2loxzYYFsa
	lPmRZfJwBnP93F1ciH/UKXT9p1i/kBV8+sqHj9F8BAQJt64Y1CAiuLEh31UIOnr4K4kPOc
	xj/plfY/t8/RqTB/zA5G1f9ruQjYBksXuu/3/1nz/JhuS+8J1OQI9tW5whqkhQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <nicolas.ferre@microchip.com>,  <alexandre.belloni@bootlin.com>,
  <claudiu.beznea@tuxon.dev>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <devicetree@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  Varshini Rajendran
 <varshini.rajendran@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
In-Reply-To: <20250305100134.1171124-1-manikandan.m@microchip.com> (Manikandan
	Muralidharan's message of "Wed, 5 Mar 2025 15:31:33 +0530")
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 11:22:09 +0100
Message-ID: <87ikonydym.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdegheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrleeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmrghnihhkrghnuggrnhdrmhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpt
 hhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_022215_232425_1E3AA0BF 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

T24gMDUvMDMvMjAyNSBhdCAxNTozMTozMyArMDUzMCwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4g
PG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPiB3cm90ZToKCj4gRnJvbTogVmFyc2hpbmkgUmFq
ZW5kcmFuIDx2YXJzaGluaS5yYWplbmRyYW5AbWljcm9jaGlwLmNvbT4KPgo+IEVVSSBpZGVudGlm
aWVyIGFuZCB0aGUgTUFDIEFkZHJlc3Mgb2YgdGhlIEV0aGVybmV0IEludGVyZmFjZSBpcyBzdG9y
ZWQKPiBhZnRlciB0aGUgU0ZEUCB0YWJsZSBvZiBjb250ZW50cyBzdGFydGluZyBhdCBhZGRyZXNz
IDB4MjYwIGluIHRoZQo+IFFTUEkgbWVtb3J5Lgo+IFJlZ2lzdGVyIHRoZSBlbnRpcmUgU0ZEUCBy
ZWdpb24gcmVhZCBieSB0aGUgc3BpLW5vciAobm9yLT5zZmRwKSBpbnRvIHRoZQo+IE5WTUVNIGZy
YW1ld29yayBhbmQgcmVhZCB0aGUgTUFDIEFkZHJlc3Mgd2hlbiByZXF1ZXN0ZWQgdXNpbmcgdGhl
IG52bWVtCj4gcHJvcGVydGllcyBpbiB0aGUgRFQgYnkgdGhlIG5ldCBkcml2ZXJzLgo+Cj4gSW4g
a2VybmVsIHRoZSBFdGhlcm5ldCBNQUMgYWRkcmVzcyByZWxpZWQgb24gVS1Cb290IGVudiB2YXJp
YWJsZXMgb3IKPiBnZW5lcmF0ZWQgYSByYW5kb20gYWRkcmVzcywgd2hpY2ggcG9zZWQgY2hhbGxl
bmdlcyBmb3IgYm9hcmRzIHdpdGhvdXQKPiBvbi1ib2FyZCBFRVBST01zIG9yIHdpdGggbXVsdGlw
bGUgRXRoZXJuZXQgcG9ydHMuCj4gVGhpcyBjaGFuZ2UgZW5zdXJlcyBjb25zaXN0ZW50IGFuZCBy
ZWxpYWJsZSBNQUMgYWRkcmVzcyByZXRyaWV2YWwgZnJvbSBRU1BJLAo+IGJlbmVmaXRpbmcgYm9h
cmRzIGxpa2UgdGhlIHNhbWE1ZDI5IGN1cmlvc2l0eSBhbmQgc2FtOXg3NSBjdXJpb3NpdHkuCgpE
byB5b3UgbWVhbiBzcGktbm9yIGhhdmUgYSBwcm9ncmFtbWFibGUgYXJlYSBpbiB0aGVpciBTRkRQ
IHRhYmxlPyBJc24ndAp0aGlzIHN1cHBvc2VkIHRvIGJlIGEgcmVhZC1vbmx5IGFyZWEgd3JpdHRl
biBvbmNlIGluIGZhY3Rvcnk/CgpJIGFtIG5vdCBhIGJpZyBmYW4gb2YgZXhwb3NpbmcgdGhlIHdo
b2xlIFNGRFAgYXJlYS4gSSB3b3VsZCBzdWdnZXN0IHRvCmV4cG9zZSBqdXN0IHRoZSBNQUMgYWRk
cmVzcy4gWW91IGNhbiBtYWtlIHVzZSBvZiBudm1lbSBsYXlvdXQgZHJpdmVycyBpZgp0aGF0IGlz
IG5lZWRlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
