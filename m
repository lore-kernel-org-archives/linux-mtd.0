Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D193C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 09:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F9282053B
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 09:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OdaRLJkp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F9282053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MktYg8E/W5tUdNfVRO3yGSoPl/8cGvkYHkmYZ7KbFQ8=; b=OdaRLJkpd6WonA
	SeWF0U7AVbbzlbe1Tu7AURpDpJEsFeOD5Meqa6fwX03dTKoTxUSTnZe3LqHqVGJHSEMZVNXJJf7u5
	8YzY9hfYc2GcH97Z0WHe94qMbEtH5IttKFJ9SVVrLHEKEcRKuZ8d8EEDbLMz22j21CHpOUjpTbJll
	2I4pmOtYQxHcEb9QfgLLWuPycQCLR/9PQm9FHtoRulI5ntTMTAOBZpygXBAcWSSHyWk8qb57pQH3O
	qFqDNLogqjr0GnTkAcHuzG29jYajBJgZjkiUA0krx1Vcp7ttiURKDWzWao0vlPhC5eo/oBDuQ1VIT
	jEi/p5RgnHbIIqIB1H7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNwnG-0006Tq-Cx; Tue, 07 May 2019 09:53:50 +0000
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNwnD-0006TF-2q
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 09:53:48 +0000
Received: by mail-vs1-f66.google.com with SMTP id e2so9959620vsc.13
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 02:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u4pDcu4cLmQ9pY2lZyQVJRk796bPYX93JYn15L/1wMU=;
 b=QmjoNgJ3N+ojrm3m3GEPwLrJ621IFGyXlEaDiFBOmRhhIWKCYWB9tEaT0XvTAkiCmP
 +ovzVI/Lh3F8SRohx9+lWXR5aPpTqbO1SeBBIxgbQh+Fc7IkQHqDEJHTroxVyDDPwElA
 sQZYT4yD4wx6jrqP0eKSgzrj/FoKYN590LDp7ILSbtsSZ8Fqj5aQ2xx8yFTZ7HkUFSRM
 uKtaEIZ8n7mFW4hcFnohBMx8/HvrIgHo9RpPOSb+rvuaSVjFgrh7vtTz54hYCTJx7xnU
 vEq5VXTC51+TWWPJf2+LbXmZdwx92xR8wsQFJpGzhlOW05jf+ZFew1DPKnM5hy54Rzcn
 IMOg==
X-Gm-Message-State: APjAAAV43WLEGinp04VNsC28jI5HlV6bbhAlApn5B1CW0h5IRJL8LyqW
 sQYr3FKfoeDs2XZChrq2RUR+kzFWfFTJX0jTiPWO3b8o
X-Google-Smtp-Source: APXvYqyk7xDFeHcU8hslon/yZgyHt5QxCpAEjQ6Jg5C0V1ygJJOPiavk3SekbRsJ8ocrdrf2Nm/+8ZO2/RSuiwpuTPc=
X-Received: by 2002:a05:6102:406:: with SMTP id
 d6mr9208379vsq.63.1557222825657; 
 Tue, 07 May 2019 02:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
In-Reply-To: <20190320071605.4289-3-jonas@norrbonn.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2019 11:53:34 +0200
Message-ID: <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Jonas Bonn <jonas@norrbonn.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_025347_438331_62A2B2D1 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9uYXMsCgpPbiBXZWQsIE1hciAyMCwgMjAxOSBhdCA4OjE2IEFNIEpvbmFzIEJvbm4gPGpv
bmFzQG5vcnJib25uLnNlPiB3cm90ZToKPiBCb3RoIHRoZSBCUFswLTJdIGJpdHMgYW5kIHRoZSBU
QlBST1QgYml0IGFyZSBzdXBwb3J0ZWQgb24gdGhpcyBjaGlwLgo+IFRlc3RlZCBhbmQgdmVyaWZp
ZWQgb24gYSBDeXByZXNzIHMyNWZsNTEycy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEJvbm4g
PGpvbmFzQG5vcnJib25uLnNlPgoKVGhpcyBpcyBub3cgY29tbWl0IGRjYjRiMjJlZWFmNDRmOTEg
KCJzcGktbm9yOiBzMjVmbDUxMnMgc3VwcG9ydHMgcmVnaW9uCmxvY2tpbmciKSBpbiBtdGQvbmV4
dC4KCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPiArKysgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3NwaS1ub3IuYwo+IEBAIC0xODk4LDcgKzE4OTgsOSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9IHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1Ip
IH0sCj4gICAgICAgICB7ICJzMjVmbDI1NnMwIiwgSU5GTygweDAxMDIxOSwgMHg0ZDAwLCAyNTYg
KiAxMDI0LCAxMjgsIFVTRV9DTFNSKSB9LAo+ICAgICAgICAgeyAiczI1ZmwyNTZzMSIsIElORk8o
MHgwMTAyMTksIDB4NGQwMSwgIDY0ICogMTAyNCwgNTEyLCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQ
SV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sCj4gLSAgICAgICB7ICJzMjVmbDUxMnMiLCAg
SU5GTzYoMHgwMTAyMjAsIDB4NGQwMDgwLCAyNTYgKiAxMDI0LCAyNTYsIFNQSV9OT1JfRFVBTF9S
RUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwKPiArICAgICAgIHsgInMyNWZs
NTEycyIsICBJTkZPNigweDAxMDIyMCwgMHg0ZDAwODAsIDI1NiAqIDEwMjQsIDI1NiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFE
IHwKPiArICAgICAgICAgICAgICAgICAgICAgICBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9I
QVNfVEIgfCBVU0VfQ0xTUikgfSwKClNldHRpbmcgU1BJX05PUl9IQVNfTE9DSyBjYXVzZXMgdGhl
IFFTUEkgRkxBU0ggb24gcjhhNzc5MS9rb2Vsc2NoIHRvIGZhaWwKcHJvYmluZy4KCkJlZm9yZS9h
ZnRlcjoKCiAgICAtbTI1cDgwIHNwaTAuMDogczI1Zmw1MTJzICg2NTUzNiBLYnl0ZXMpCiAgICAt
MyBmaXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBzcGkwLjAK
ICAgIC1DcmVhdGluZyAzIE1URCBwYXJ0aXRpb25zIG9uICJzcGkwLjAiOgogICAgLTB4MDAwMDAw
MDAwMDAwLTB4MDAwMDAwMDgwMDAwIDogImxvYWRlciIKICAgIC0weDAwMDAwMDA4MDAwMC0weDAw
MDAwMDYwMDAwMCA6ICJ1c2VyIgogICAgLTB4MDAwMDAwNjAwMDAwLTB4MDAwMDA0MDAwMDAwIDog
ImZsYXNoIgogICAgK20yNXA4MCBzcGkwLjA6IEVyYXNlIEVycm9yIG9jY3VycmVkCiAgICArbTI1
cDgwIHNwaTAuMDogRXJhc2UgRXJyb3Igb2NjdXJyZWQKICAgICttMjVwODAgc3BpMC4wOiB0aW1l
b3V0IHdoaWxlIHdyaXRpbmcgY29uZmlndXJhdGlvbiByZWdpc3RlcgogICAgK20yNXA4MCBzcGkw
LjA6IHF1YWQgbW9kZSBub3Qgc3VwcG9ydGVkCiAgICArbTI1cDgwOiBwcm9iZSBvZiBzcGkwLjAg
ZmFpbGVkIHdpdGggZXJyb3IgLTUKCkZMQVNIIGNoaXAgaXMgU1BBTlNJT04gRkw1MTJTQUlGRzEg
MzExUVEwNjMgQSDCqTExIFNQQU5TSU9OCkpFREVDIGlkIGJ5dGVzOiAwMSAwMiAyMCA0ZCAwMCA4
MAoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
