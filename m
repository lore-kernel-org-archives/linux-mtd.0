Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB60C432BE
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 09:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F552610CA
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 09:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F552610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg1WNJs+IUvp29W8Ms0R5RPCzdpGhgG+v1R7egRKo74=; b=iYMVExs+ApeKBVncTUCObKIH/I
	ne9oZwFbXlyTnj/GMrk5k1Cm6Qaq6ALl5lkFUocfVETsXghfLMr0+Kyjr5tBNDXbwBY1GH5eqM+tn
	qJuCeyOh7NSwNlH4ksz6Q33wFsULIYUhBUTgdgM9UyI2S87DFAHeNFKwlrkreMcgroH0dzR77ezSu
	Cgcko02leQgBrJgq+qaJndcxp1Var47u3+5N1yeB+p93IpoAghMhvTtsRCk9mAELAhBJq01dh/aFL
	tCAxF80pKHS0STGLJ7y9XD/gOVKT2RG9b/MftrpkNE1ssdU/B2V9s6yOo2MZK07WVSUbMoqcAsANq
	ai+PG2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH1D9-00AZIt-UV; Fri, 20 Aug 2021 09:53:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH1D4-00AZEo-7C
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 09:53:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17K9qx58090059;
 Fri, 20 Aug 2021 04:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629453179;
 bh=wJ0e2oEhVCKsqJHZmlmWTW4gw5Qh/Xv+9BHvHBV1zoA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tQff+56rUKJe7Jzi2bKfQQYp3DuNj4FSCk+y1qlhH2N+gh2P4B93ADNE58yoJNSKn
 4VEk+ywekYTmGH3G+/QatAAKoRxdYOhjfD3q+ACR+A9w1SFPZ3fA3qVrQfkk7vyyUQ
 BJyBtw2VNgOWlIjDLQT/Lk5Briue+k8dh2ddbjRc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17K9qxY4121358
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 04:52:59 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 04:52:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 04:52:59 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17K9qtGI014630;
 Fri, 20 Aug 2021 04:52:56 -0500
Subject: Re: [PATCH 03/13] mtd: spinand: Setup spi_mem_op for the SPI IO
 protocol using reg_proto
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-4-a-nandan@ti.com> <20210806203013.30a41fd5@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <3de32033-2a6e-bc46-a65a-4027ce78c6d6@ti.com>
Date: Fri, 20 Aug 2021 15:22:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806203013.30a41fd5@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_025310_451177_53D76E05 
X-CRM114-Status: GOOD (  19.14  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDA3LzA4LzIxIDEyOjAwIGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEFwdXJ2YSwKPiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9u
IFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6MjgKPiArMDAwMDoKPiAKPj4gQ3VycmVudGx5LCB0aGUg
b3AgbWFjcm9zIGluIHNwaW5hbmQuaCBkb24ndCBnaXZlIHRoZSBvcHRpb24gdG8gc2V0dXAKPj4g
YW55IG5vbi1hcnJheSBhY2Nlc3MgaW5zdHJ1Y3Rpb25zIGZvciBEdWFsL1F1YWQvT2N0YWwgRFRS
IFNQSSBidXMuCj4+IEhhdmluZyBhIGZ1bmN0aW9uIHRoYXQgc2V0dXBzIHRoZSBvcCBiYXNlZCBv
biByZWdfcHJvdG8gd291bGQgYmUKPj4gYmV0dGVyIHRoYW4gdHJ5aW5nIHRvIHdyaXRlIGFsbCB0
aGUgc2V0dXAgbG9naWMgaW4gb3AgbWFjcm9zLgo+Pgo+PiBDcmVhdGUgYSBzcGltZW1fc2V0dXBf
b3AoKSB0aGF0IHdvdWxkIHNldHVwIGNtZCwgYWRkciwgZHVtbXkgYW5kIGRhdGEKPj4gcGhhc2Ug
b2YgdGhlIHNwaV9tZW0gb3AsIGZvciB0aGUgZ2l2ZW4gc3BpbmFuZC0+cmVnX3Byb3RvLiBBbmQg
aGVuY2UsCj4+IGNhbGwgdGhlIHNwaW1lbV9zZXR1cF9vcCgpIGJlZm9yZSBleGVjdXRpbmcgYW55
IHNwaV9tZW0gb3AuCj4+Cj4+IE5vdGU6IEluIHRoaXMgY29tbWl0LCBzcGltZW1fc2V0dXBfb3Ao
KSBpc24ndCBjYWxsZWQgaW4gdGhlCj4+IHJlYWRfcmVnX29wKCksIHdyaXRlX3JlZ19vcCgpIGFu
ZCB3YWl0KCkgZnVuY3Rpb25zLCBhcyB0aGV5IG5lZWQKPj4gbW9kaWZpY2F0aW9ucyBpbiBhZGRy
ZXNzIHZhbHVlIGFuZCBkYXRhIG5ieXRlcyB3aGVuIGluIE9jdGFsIERUUiBtb2RlLgo+PiBUaGlz
IHdpbGwgYmUgZml4ZWQgaW4gYSBsYXRlciBjb21taXQuCj4gCj4gVGhhbmtzIGZvciB0aGlzIHNl
cmllcyEKPiAKPiBTbyBmYXIgSSBhbSBmaW5lIHdpdGggeW91ciBjaGFuZ2VzLCBidXQgSSBkb24n
dCBsaWtlIHRoZSBzZXR1cF9vcCgpCj4gbmFtaW5nIG11Y2guIEkgZG9uJ3QgeWV0IGhhdmUgYSBi
ZXR0ZXIgaWRlYSwgY291bGQgeW91IHByb3Bvc2UKPiBzb21ldGhpbmcgbW9yZSBtZWFuaW5nZnVs
Pwo+IAoKSSBtYWRlIHRoaXMgc2ltaWxhciB0byB0aGUgc3BpX25vcl9zcGltZW1fc2V0dXBfb3Ao
KSwgd2hpY2ggZXNzZW50aWFsbHkgCmRvZXMgdGhlIHNhbWUgdGFzayBhcyB0aGlzIGluIHRoZSBz
cGktbm9yIGNvcmUuCgpPdGhlciBuYW1lcyB0aGF0IEkgY2FuIHRoaW5rIG9mIGFyZToKCi0gY29u
ZmlnX29wKCksIGFkanVzdF9vcCgpLCBhbWVuZF9vcCgpLCBwYXRjaF9vcCgpCgpvcgoKLSBoYW5k
bGVfb3BfdmFyaWF0aW9ucygpLCBhcHBseV9vcF92YXJpYXRpb25zKCkKCldoYXQgZG8geW91IHN1
Z2dlc3Q/Cgo+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+
Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8KPiAKVGhhbmtzLApBcHVydmEgTmFuZGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
