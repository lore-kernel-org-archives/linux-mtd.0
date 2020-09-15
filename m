Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3F4C43461
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 05:29:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F17820756
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 05:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fos0rtgM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j1ZKDYX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F17820756
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmwhkye7vyPxPG/e6BzmToZOw27WNTiY4pHxAFZxz3U=; b=Fos0rtgMQ4Suc9pm7f+0xBBsCZ
	XwL/52o6/1fSC+++dzXhdNpKfhTWljHh2SBT/L/CyMP5S6mKBg5dh2FVazLQEHsqkT4Q4TcqwePLQ
	YxzXtlLxGNC1c5yftpAYlZalnvqCs4GIB3CAY5k5Ek+OHhnkphUy8zPJEM6pgueRHx7IhdzhGjdJW
	J4kb4EZYdy5163EVekX7EY2/wTNpUptMIalY2Hi4OcE4OfBXMPeFU2iJ6oHIbbyKPIDvEVLwNaCi1
	dtxztzOAdhddZ55sWOXpppvdpefA5DYCk9d5j3JZZzzcFZJubFd8OJPw90PUgTJ2oBs+erimWdem7
	8rMhLYCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI3VV-0001nD-Sc; Tue, 15 Sep 2020 05:27:57 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI3VT-0001mb-7K
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 05:27:56 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08F5Rl0B018180;
 Tue, 15 Sep 2020 00:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600147667;
 bh=HlODw7mmWEosAPjfitAwwN8XW9139yRuMXgsPpWd+pw=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=j1ZKDYX7ejPwJ8fTpbyyXWwKdkVs+TsJdI9RYSQQR7woyepy7OOs43HX2zHfYklKH
 Oe8dIcgzBQ8ZI+Z0imKdG3FvDVYrqrpDea/L3LxbC68AGAOpW/N6pYiVSlu7hCVckO
 ajpu2WfHQ8UATRXnydB3p5nX5wyW8oz1WeLLH0ew=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08F5RlYV033184
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 00:27:47 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 00:27:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 00:27:46 -0500
Received: from [10.250.151.93] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08F5Riwl065516;
 Tue, 15 Sep 2020 00:27:45 -0500
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
 <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
 <663f56cb-d38c-1e38-8459-4306a6da88db@de.bosch.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <45a1542d-d053-a571-fe0d-79bd6c2499d7@ti.com>
Date: Tue, 15 Sep 2020 10:57:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <663f56cb-d38c-1e38-8459-4306a6da88db@de.bosch.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_012755_422725_9E50F68F 
X-CRM114-Status: GOOD (  18.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzE1LzIwIDk6MzcgQU0sIEJlaG1lIERpcmsgKENNL0VTTzIpIHdyb3RlOgo+IAo+IAo+
IE9uIDE0LjA5LjIwMjAgMTU6MDksIFZpZ25lc2ggUmFnaGF2ZW5kcmEgd3JvdGU6Cj4+IEhpIFNl
cmdlaSwKPj4KPj4gT24gNS8xNC8yMCAyOjEzIEFNLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6Cj4+
PiBBZGQgdGhlIEh5cGVyRkxhc2ggZHJpdmVyIGZvciB0aGUgUmVuZXNhcyBSUEMtSUYuwqAgSXQn
cyB0aGUgImZyb250IGVuZCIKPj4+IGRyaXZlciB1c2luZyB0aGUgImJhY2sgZW5kIiBBUElzIGlu
IHRoZSBtYWluIGRyaXZlciB0byB0YWxrIHRvIHRoZSByZWFsCj4+PiBoYXJkd2FyZS4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZWkgU2h0eWx5b3YgPHNlcmdlaS5zaHR5bHlvdkBjb2dlbnRl
bWJlZGRlZC5jb20+ClsuLi5dCj4+Pgo+Pj4KPj4gWy4uLl0KPj4+IC0tLSAvZGV2L251bGwKPj4+
ICsrKyBsaW51eC9kcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYwo+Pj4gQEAgLTAsMCArMSwx
NjUgQEAKPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+Pj4gKy8qCj4+
PiArICogTGludXggZHJpdmVyIGZvciBSUEMtSUYgSHlwZXJGbGFzaAo+Pj4gKyAqCj4+PiArICog
Q29weXJpZ2h0IChDKSAyMDE5LTIwMjAgQ29nZW50IEVtYmVkZGVkLCBJbmMuCj4+PiArICovCj4+
PiArCj4+PiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4
L210ZC9oeXBlcmJ1cy5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+Cj4+PiArI2lu
Y2x1ZGUgPGxpbnV4L211eC9jb25zdW1lci5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+
Pj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4+ICsjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4KPj4+ICsKPj4+ICsjaW5jbHVkZSA8bWVtb3J5L3JlbmVzYXMtcnBjLWlmLmg+
Cj4+PiArCj4+PiArLyogRklYTUU6IEhvdyB0byBkcm9wIHRoaXM/ICovCj4+PiArI2lmbmRlZiBD
T05GSUdfTVREX0NGSV9CRV9CWVRFX1NXQVAKPj4+ICsjZXJyb3IgRW5hYmxlIGNvbmZpZyAiRmxh
c2ggY21kL3F1ZXJ5IGRhdGEgc3dhcHBpbmcgKEJJR19FTkRJQU5fQllURSkiCj4+PiArI2VuZGlm
Cj4+Cj4+IHNlbGVjdCBNVERfQ0ZJX0JFX0JZVEVfU1dBUCBpbiBLY29uZmlnIGRvZXMgbm90IGhl
bHA/Cj4gCj4gCj4gSWYgSSByZW1lbWJlciBjb3JyZWN0bHkgJ3NlbGVjdCBNVERfQ0ZJX0JFX0JZ
VEVfU1dBUCcgaW4gS2NvbmZpZyBkb2Vzbid0Cj4gc2VlbSB0byB3b3JrLiBUaGVyZWZvcmUgdGhl
IEZJWE1FLiBJIGNhbid0IHJlbWVtYmVyIGV4YWN0bHkgdGhlIHJvb3QKPiBjYXVzZSBmb3IgdGhh
dCBhbnkgbW9yZSwgYnV0IG1heWJlIGl0IHdhcyB0aGUgJ2Jvb2wnIHR5cGUgb2YKPiBNVERfQ0ZJ
X0JFX0JZVEVfU1dBUD8KPiAKCkFoLCBzb3JyeSBNVERfQ0ZJX0JFX0JZVEVfU1dBUCBpcyBhIGNo
b2ljZSBhbmQgc2VsZWN0IGRvZXMgbm90IHdvcmsgb24KY2hvaWNlIG1lbnVzLiBob3cgYWJvdXQ6
Cgo+IElmIGFueWJvZHkgaGFzIGEgbmljZSBzb2x1dGlvbiBmb3IgdGhhdCwgaXQgd291bGQgYmUg
d2VsY29tZSA6KQoKRG9lcyB0aGlzIHdvcms6CgogY29uZmlnIFJQQ0lGX0hZUEVSQlVTCiAgICAg
ICAgdHJpc3RhdGUgIlJlbmVzYXMgUlBDLUlGIEh5cGVyQnVzIGRyaXZlciIKICAgICAgICBkZXBl
bmRzIG9uIFJFTkVTQVNfUlBDSUYKLSAgICAgICBzZWxlY3QgTVREX0NGSV9BRFZfT1BUSU9OUwor
ICAgICAgIGRlcGVuZHMgb24gTVREX0NGSV9CRV9CWVRFX1NXQVAgfHwgQ09NUElMRV9URVNUCiAg
ICAgICAgaGVscAogICAgICAgICAgVGhpcyBvcHRpb24gaW5jbHVkZXMgUmVuZXNhcyBSUEMtSUYg
SHlwZXJGbGFzaCBzdXBwb3J0LgoKClJlZ2FyZHMKVmlnbmVzaAoKWy4uLl0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
