Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB94C47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 05:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B6261208
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 05:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8B6261208
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nss/qQX4mizv1SMBMN9dJVaRVQ2w27EJ6ELgmvkMWVc=; b=c8zzI5nA0p+Dz9Lg2UDj91LE2H
	vRTHE8o+dy5G2uWnix+HCvykTV5sfp0JBcbJz//I//qplovkR/5QYT2G5loHXYeYNV4TNHPPgIJ03
	CYsUhcvCgwNenLbzJH6gSSRPGzaA008VNty6UOafHrt8SZ9CsDChHzQAZguf5pMS8VV8338fidGuL
	HqlwI+JhxQMfzvnmEgJNQS6O+YI7Q7jRFZUh4AylhUfXfseUUSiG3IEqpyMc5TSnFmW7Fj8Nne0YI
	6RJ5TyZa8vJvTpTaBCXr3QrOFsyIaO80jQgrChEkm/bIfX/pr6kuANrl6j0Mi3kjLLfn/nqab8x8g
	NhGeFvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq85d-001biv-Gf; Mon, 07 Jun 2021 05:46:21 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq85a-001biO-3i
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 05:46:20 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1575kBLg005472;
 Mon, 7 Jun 2021 00:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623044771;
 bh=b3YribPsLsUNBcVX/uBU0uUtAjN0H/Dr6M1HW8UYZKg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Rmu6KxldSL3T4RDaoN0NsYS+xvbdRRySK3B9EF9dwUXuFSLe7Wao3hpmkudAxDvXj
 QIj8bhXEUlL4q6ELOVBbrrGxsMOedRR/kGI60ALuLsqfqKD3KUUmGctEipKKN4UK2N
 q1QIJoKWuy56VwePeBFtsXY+0lIvl3U8TGepuEOA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1575kB1H106501
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Jun 2021 00:46:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 00:46:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 00:46:11 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1575k8o2089338;
 Mon, 7 Jun 2021 00:46:09 -0500
Subject: Re: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
To: Michael Walle <michael@walle.cc>, <Tudor.Ambarus@microchip.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-4-michael@walle.cc>
 <c2b58dcc-5a60-792c-30ac-a3db327a85ed@microchip.com>
 <e117bc50b9f9e10549c25602b66cfe26@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1549db61-500a-e5df-9303-823b41457861@ti.com>
Date: Mon, 7 Jun 2021 11:16:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e117bc50b9f9e10549c25602b66cfe26@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_224618_281085_CE4AC3DB 
X-CRM114-Status: GOOD (  18.48  )
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

CgpPbiA2LzQvMjEgNjo0NSBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBBbSAyMDIxLTA2LTA0
IDE1OjA3LCBzY2hyaWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4gT24gNi80LzIx
IDE6MDIgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQo+Pj4ga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlCj4+Pgo+Pj4gU1BJIE5PUiBmbGFzaGVzIHdpbGwganVzdCBpZ25vcmUg
cHJvZ3JhbSBjb21tYW5kcyBpZiB0aGUgT1RQIHJlZ2lvbiBpcwo+Pj4gbG9ja2VkLiBUaHVzLCBh
IHVzZXIgbWlnaHQgbm90IG5vdGljZSB0aGF0IHRoZSBpbnRlbmRlZCB3cml0ZSBkaWRuJ3QgZW5k
Cj4+PiB1cCBpbiB0aGUgZmxhc2guIFJldHVybiAtRVJPRlMgdG8gdGhlIHVzZXIgaW4gdGhpcyBj
YXNlLiBGcm9tIHdoYXQgSSBjYW4KPj4+IHRlbGwsIGNoaXBzL2NmaV9jbWRzZXRfMDAwMS5jIGFs
c28gcmV0dXJuIHRoaXMgZXJyb3IgY29kZS4KPj4+Cj4+PiBPbmUgY291bGQgb3B0aW1pemUgc3Bp
X25vcl9tdGRfb3RwX3JhbmdlX2lzX2xvY2tlZCgpIHRvIHJlYWQgdGhlIHN0YXR1cwo+Pj4gcmVn
aXN0ZXIgb25seSBvbmNlIGFuZCBub3QgZm9yIGV2ZXJ5IE9UUCByZWdpb24sIGJ1dCBmb3IgdGhh
dCB3ZSB3b3VsZAo+Pj4gbmVlZCBzb21lIG1vcmUgaW52YXNpdmUgY2hhbmdlcy4gR2l2ZW4gdGhh
dCB0aGlzIGlzCj4+PiBvbmUtdGltZS1wcm9ncmFtbWFibGUgbWVtb3J5IGFuZCB0aGUgbm9ybWFs
IGFjY2VzcyBtb2RlIGlzIHJlYWRpbmcsIHdlCj4+PiBqdXN0IGxpdmUgd2l0aCB0aGUgc21hbGwg
b3ZlcmhlYWQuCj4+Pgo+Pj4gRml4ZXM6IDA2OTA4OWFjZjg4YiAoIm10ZDogc3BpLW5vcjogYWRk
IE9UUCBzdXBwb3J0IikKPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxA
d2FsbGUuY2M+Cj4+PiBSZXZpZXdlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29t
Pgo+Pj4gLS0tCj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMgfCAzNiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMKPj4+IGluZGV4IDM4OThlZDY3YmExYy4uMDYzZjhm
YjY4NjQ5IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYwo+Pj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYwo+Pj4gQEAgLTI0OSw2ICsyNDksMzIgQEAgc3Rh
dGljIGludCBzcGlfbm9yX210ZF9vdHBfaW5mbyhzdHJ1Y3QgbXRkX2luZm8KPj4+ICptdGQsIHNp
emVfdCBsZW4sCj4+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gwqB9Cj4+Pgo+Pj4g
K3N0YXRpYyBpbnQgc3BpX25vcl9tdGRfb3RwX3JhbmdlX2lzX2xvY2tlZChzdHJ1Y3Qgc3BpX25v
ciAqbm9yLAo+Pj4gbG9mZl90IG9mcywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNp
emVfdCBsZW4pCj4+PiArewo+Pj4gK8KgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9v
dHBfb3BzICpvcHMgPSBub3ItPnBhcmFtcy0+b3RwLm9wczsKPj4+ICvCoMKgwqDCoMKgwqAgdW5z
aWduZWQgaW50IHJlZ2lvbjsKPj4+ICvCoMKgwqDCoMKgwqAgaW50IGxvY2tlZDsKPj4+ICsKPj4+
ICvCoMKgwqDCoMKgwqAgaWYgKCFsZW4pCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4+ICsKPj4KPj4gWW91IHdvbid0IG5lZWQgdGhpcyBpZiB5b3UgcHV0IHBh
dGNoIDQvNSBiZWZvcmUgdGhpcyBvbmUuIFdpdGggdGhpczoKPiAKPiBUaGlzIHBhdGNoIHdpbGwg
Z2V0IGJhY2twb3J0ZWQgdG8gdGhlIHN0YWJsZSBrZXJuZWxzLiBQYXRjaCA0IG9uIHRoZQo+IG90
aGVyIGhhbmQgZG9lcyBub3QuCj4gCgpJIGRvbid0IHNlZSB3aHkgNC81IGNhbm5vdCBiZSBtYXJr
ZWQgZm9yIGJhY2twb3J0IHRvbyBhcyBpdCBtYWtlcyAzLzUKbXVjaCBjbGVhbmVyPwoKUmVnYXJk
cwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
