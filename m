Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B29C27C40
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QULkV3fR5sQqMJpH0avvE41WWVz+aE8TdTN59FutudA=; b=uo3kdlBFNzY6tY
	jS4OJxmqz9j/YyxSpUaHxOp+2/sZSGSVN7MXDkYAZ978QQjN28ggkM6JwGCd2oxmeBeGCszj2B/rV
	iDHUsicwpds/XQLglKIimZuO1M/U6nKgoq8lXT14Iki2zlqGWg9e+ouVtX3v3+1Hj1QH36k+/ldxr
	rghQYqVwC+dZk5k5KqtFVAu446qCEYXfJDDUPXYQyyHSF0FMtL1RBvKZZNiqvb/TISU2mvL9qGvQB
	hIHhmM9jHPaz7GFDEQVMqUGf1HutI4BRldZgKpm7ripAgCGz2nWO6UJfz6EUYohETsGBIxsEt/4mS
	OZ75RxK+glyQNrxdp5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6kz-002iHG-1Y;
	Thu, 24 Aug 2023 09:36:01 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6ku-002iGH-1T
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 09:35:59 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4CE60120003;
	Thu, 24 Aug 2023 12:35:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4CE60120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692869747;
	bh=NHDNbRQIlPTKyaRRc+wW6R4gs+0+yGK7A4phKQJ1MWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=VZDiEolif31ql1D4sRsRyUHIACUkUpeoABHCWHVEbcPhk+0oMrydGfJlNthwcTaa0
	 OrVMhNKDpbN27dEWxHdDqPgvXuP2SSdQqTfMxavLm0Co/IJ2SflVQMl2oYlpO3SwGS
	 UqcNpTPu0xaNIp9y5l+qK3VwUw3CUUUewAt8fHA4Y0jpzSqUV/W73c+D5361Q/oxWU
	 enAEsK2tafLwGMcZaRysKoEo3X0MdxUy+O5THNrny8A9i2ldrgraE64fuHVfWi3OGH
	 juwx9EUfSb0bPkLua5WuVQiJhnvhekKHyACprfy1Z5ksvZl8ntJn2d8oJTc0VRA4oK
	 v9RUU3BDw7uSg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 24 Aug 2023 12:35:47 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 24 Aug 2023 12:35:39 +0300
Message-ID: <ccf3099f-0e10-a87c-be83-4a414f01dca7@sberdevices.ru>
Date: Thu, 24 Aug 2023 12:35:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
 <20230822122534.872646-3-mmkurbanov@sberdevices.ru>
 <20230822153556.630e65b9@xps-13>
 <01925ff8-1d19-a729-429a-89866fad319f@sberdevices.ru>
 <20230823104143.760cc5bc@xps-13>
 <f873d775-cda9-302d-a651-0113c7c7dc84@sberdevices.ru>
 <20230823133956.0a505a20@xps-13>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <20230823133956.0a505a20@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179420 [Aug 24 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/24 05:32:00 #21694618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_023557_215388_9B240496 
X-CRM114-Status: GOOD (  16.16  )
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

CgpPbiAyMy4wOC4yMDIzIDE0OjM5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIE1hcnRpbiwK
PiAKPiBtbWt1cmJhbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMjMgQXVnIDIwMjMg
MTQ6MzM6NTcgKzAzMDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gT24gMjMuMDguMjAyMyAxMTo0
MSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIE1hcnRpbiwKPj4+Cj4+PiBJIGRvbid0IHRo
aW5rIHRoZSBmb3VyIGJ5dGVzIGhhdmUgYW55ICJiYWQgYmxvY2sgc3BlY2lmaWMiIG1lYW5pbmcu
IEluCj4+PiBwcmFjdGljZSwgdGhlIGRhdGFzaGVldCBzdGF0ZXM6Cj4+Pgo+Pj4gCVZhbHVlIHBy
b2dyYW1tZWQgZm9yIGJhZCBibG9jayBhdCB0aGUgZmlyc3QgYnl0ZSBvZiBzcGFyZQo+Pj4gCWFy
ZWE6IDAwaAo+Pj4KPj4+IFNvIG9ubHkgdGhlIGZpcnN0IGJ5dGUgaXMgdXNlZCB0byBtYXJrIHRo
ZSBibG9jayBiYWQsIHRoZSByZXN0IGlzCj4+PiBwcm9iYWJseSBtYXJrZWQgInJlc2VydmVkIiBm
b3Igc2ltcGxpY2l0eS4gSSBiZWxpZXZlIHdlIHNob3VsZCBrZWVwIHRoZQo+Pj4gY3VycmVudCBs
YXlvdXQgYmVjYXVzZSBpdCB3b3VsZCBvdGhlcndpc2UgYnJlYWsgdXNlcnMgZm9yIG5vIHJlYWwK
Pj4+IHJlYXNvbi4gIAo+Pgo+PiBJIGFncmVlIHdpdGggeW91IHRoYXQgdGhpcyBjYW4gYnJlYWsg
dGhlIHdvcmsgb2YgdXNlcnMgd2hvIHVzZSBPT0IuCj4+IEhvd2V2ZXIsIEkgYmVsaWV2ZSBpdCB3
b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlIHRvIHVzZSBhbiBvZmZzZXQgb2YgNCwKPj4gYXMgdGhl
IG1pY3JvbiBjaGlwIGNhbiB1c2UgYWxsIDQgYnl0ZXMgZm9yIGFkZGl0aW9uYWwgZGF0YSBhYm91
dCB0aGUKPj4gYmFkIGJsb2NrLiBTbywgdGhlcmUgaXMgYSBub24temVybyBwcm9iYWJpbGl0eSBv
ZiBsb3NpbmcgT09CIGRhdGEgaW4KPj4gdGhlIHJlc2VydmVkIGFyZWEgKDIgYnl0ZXMpIHdoZW4g
dGhlIGhhcmR3YXJlIGNoaXAgYXR0ZW1wdHMgdG8gbWFyawo+PiB0aGUgYmxvY2sgYXMgYmFkLgo+
IAo+IElzIHRoaXMgcmVhbGx5IGEgcHJvY2VzcyB0aGUgY2hpcCBjYW4gZG8/IEFyZW4ndCBiYWQg
YmxvY2tzIGZhY3RvcnkKPiBtYXJrZWQgb25seT8KCkFjdHVhbGx5LCB0aGVyZSBpcyBteSB1bmRl
cnN0YW5kaW5nLCBJ4oCZbSBub3Qgc3VyZSBleGFjdGx5LgoKLS0gCkJlc3QgUmVnYXJkcywKTWFy
dGluIEt1cmJhbm92CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
