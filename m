Return-Path: <SRS0=zmh0=2J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0777C2D0C1
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 05:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94983222C2
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 05:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dOXtg+a0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N3ZfoC8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94983222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q3U5ZCalxuzBQfZyVkRIKo3+gdG/54hoF6wpA8JOfw=; b=dOXtg+a00d3XDU
	8RzRXYIYz0CX+z6RWaMF7PoatpJjMdpckOh66ukd1Ms8rpbZ7OK2LgyEUEgteDw87pKfMxP+rGUb5
	jl0CWc4GB/0cM4Fv5oV99lnIt6N0TiYHlS9gcMNYx4zShrUsUI6u520wz36E7ahU/zA6foRHHQjst
	vf1ax3Tq2Bb78Wz/A7orGC9nLZ1UVPYp91coTF6jOtTckbKM9oQbuwnoIp3eTBgHPPjb8J8WrkWun
	7SXCOP+Fzfo5cPRsVP4GNrFa36oS29jXqvbTvmZaGieeWzoaV7bIxY5SdQIRLaN4g4D+oCL0LH3UL
	y102+aUL/Pfp5V4NWq9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihoRB-0000jp-Fo; Thu, 19 Dec 2019 05:33:25 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihoR7-0000jI-7k
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2019 05:33:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJ5XAMo090485;
 Wed, 18 Dec 2019 23:33:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576733590;
 bh=LOOY6W2Ku2R5ppLjFbe/RkqYjMl9lftew8PFB4joQIs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=N3ZfoC8+zHBNo+unnhOUoM5b//zS1vm0iE6RRaKDoli0tIVjMvE0s3DjrOe+SK6Yb
 ZCa1CRV7PqFore/THw7HRmM2MYNLimmu3N3IA7EEWRymae76Tb2p65xyLOhapJNacj
 XmWwX8VNPVQ227zYdY6HkPqpvWzYpbZLVO21MVvM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJ5XAu1122133
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Dec 2019 23:33:10 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 23:33:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 23:33:10 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ5X6wR055261;
 Wed, 18 Dec 2019 23:33:07 -0600
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: document new flag
To: Michael Walle <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
References: <20191214191943.3679-1-michael@walle.cc>
 <556fe468-0080-ad05-8228-5ff8f1b3dac6@ti.com>
 <af3692dba69e85fa8136ab3d170bef39@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <2dfc30a7-3261-d783-8256-f72458a0141b@ti.com>
Date: Thu, 19 Dec 2019 11:03:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <af3692dba69e85fa8136ab3d170bef39@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_213321_402310_AF383D19 
X-CRM114-Status: GOOD (  18.44  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKClsuLi5dCj4+PiArLSBuby11bmxvY2sgOiBCeSBkZWZhdWx0LCBsaW51eCB1
bmxvY2tzIHRoZSB3aG9sZSBmbGFzaCBiZWNhdXNlIHRoZXJlCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYXJlIGxlZ2FjeSBmbGFzaCBkZXZpY2VzIHdoaWNoIGFyZSBsb2NrZWQgYnkgZGVmYXVs
dAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGFmdGVyIHJlc2V0LiBTZXQgdGhpcyBmbGFnIGlm
IHlvdSBkb24ndCB3YW50IGxpbnV4IHRvCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5sb2Nr
IHRoZSB3aG9sZSBmbGFzaCBhdXRvbWF0aWNhbGx5LiBJbiB0aGlzIGNhc2UgeW91Cj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2FuIGNvbnRyb2wgdGhlIG5vbi12b2xhdGlsZSBiaXRzIGJ5IHRo
ZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYXNoX2xvY2svZmxhc2hfdW5sb2NrIHRvb2xz
Lgo+Pj4KPj4KPj4gQ3VycmVudCBTUEkgTk9SIGZyYW1ld29yayB1bmNvbmRpdGlvbmFsbHkgdW5s
b2NrcyBlbnRpcmUgZmxhc2ggd2hpY2gKPj4gSSBhZ3JlZSBpcyBub3QgdGhlIGJlc3QgdGhpbmcg
dG8gZG8sIGJ1dCBJIGRvbid0IHRoaW5rIHdlIG5lZWQKPj4gbmV3IERUIHByb3BlcnR5IGhlcmUu
IE1URCBjbWRsaW5lIHBhcnRpdGlvbnMgYW5kIERUIHBhcnRpdGlvbnMgYWxyZWFkeQo+PiBwcm92
aWRlIGEgd2F5IHRvIHNwZWNpZnkgdGhhdCBhIHBhcnRpdGlvbiBzaG91bGQgcmVtYWluIGxvY2tl
ZFsxXVsyXQo+IAo+IEkga25vdyB0aGF0IHRoZSBNVEQgbGF5ZXIgaGFzIHRoZSBzYW1lIGtpbmQg
b2YgdW5sb2NraW5nLiBCdXQgdGhhdAo+IHVubG9ja2luZyBpcyBkb25lIG9uIGEgcGVyIG10ZCBw
YXJ0aXRpb24gYmFzaXMuIEVnLiBjb25zaWRlciBzb21ldGhpbmcKPiBsaWtlIHRoZSBmb2xsb3dp
bmcKPiAKPiDCoG10ZDEgYm9vdGxvYWRlcsKgIChsb2NrZWQpCj4gwqBtdGQyIGZpcm13YXJlwqDC
oMKgIChsb2NrZWQpCj4gwqBtdGQzIGtlcm5lbAo+IMKgbXRkNCBlbnZpcm9ubWVudAo+IAo+IEZ1
cnRoZXIgYXNzdW1lLCB0aGF0IHRoZSBlbmQgb2YgbXRkMiBhbGlnbnMgd2l0aCBvbmUgb2YgdGhl
IHBvc3NpYmxlCj4gbG9ja2luZyBhcmVhcyB3aGljaCBhcmUgc3VwcG9ydGVkIGJ5IHRoZSBmbGFz
aCBjaGlwLiBFZy4gdGhlIGZpcnN0IHF1YXJ0ZXIuCj4gCj4gVGhlIG10ZCBsYXllciB3b3VsZCBk
byB0d28gKG9yIGZvdXIsIGlmICJsb2NrIiBwcm9wZXJ0eSBpcyBzZXQpIHVubG9jaygpCj4gY2Fs
bHMsIG9uZSBmb3IgbXRkMSBhbmQgb25lIGZvciBtdGQyLgo+IAoKCj4gTXkgcG9pbnQgaGVyZSBp
cywgdGhhdCB0aGUgbXRkIHBhcnRpdGlvbnMgZG9lc24ndCBhbHdheXMgbWFwIHRvIHRoZQo+IGxv
Y2tpbmcgcmVnaW9ucyBvZiB0aGUgU1BJIGZsYXNoIChhdCBsZWFzdCBpZiB0aGUgYXJlIG5vdCBt
ZXJnZWQgdG9nZXRoZXIpLgo+IAoKWW91IGFyZSByaWdodCEgVGhpcyB3aWxsIGJlIGFuIGlzc3Vl
IGlmIGV4aXN0aW5nIHBhcnRpdGlvbnMgYXJlIG5vdAphbGlnbmVkIHRvIGxvY2tpbmcgcmVnaW9u
cy4KCkkgdGFrZSBteSBjb21tZW50cyBiYWNrLi4uIEJ1dCBJIGFtIG5vdCBzdXJlIGlmIGEgbmV3
IERUIHByb3BlcnR5IGlzIHRoZQpuZWVkZWQuIFRoaXMgZG9lcyBub3QgZGVzY3JpYmUgSFcgYW5k
IGlzIHNwZWNpZmljIHRvIExpbnV4IFNQSSBOT1IKc3RhY2suIEhvdyBhYm91dCBhIG1vZHVsZSBw
YXJhbWV0ZXIgaW5zdGVhZD8KTW9kdWxlIHBhcmFtZXRlciB3b24ndCBwcm92aWRlIHBlciBmbGFz
aCBncmFudWxhcml0eSBpbiBjb250cm9sbGluZwp1bmxvY2tpbmcgYmVoYXZpb3IuIEJ1dCBJIGRv
bid0IHRoaW5rIHRoYXQgbWF0dGVycy4KClR1ZG9yLAoKWW91IGhhZCBhIHBhdGNoIGRvaW5nIHNv
bWV0aGluZyBzaW1pbGFyLiBEb2VzIG1vZHVsZSBwYXJhbSBzb3VuZCBnb29kIHRvCnlvdT8KCgot
LSAKUmVnYXJkcwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
