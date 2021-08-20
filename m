Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E81C4320E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:40:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF0F961037
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF0F961037
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E56UB9q8DBNCf9AVB5k2K6phAwJUslMdDXyAcb08V4M=; b=3xae8ykEDOoxf2kYaLzUzBOKW9
	ATEBuIIigo/OuKGtETp+qxz8IhE+g7IY/XU6JneUgWaRZIo8wiu7Xx3Mq6BqolDI+bvHsD2gXKP4B
	/VIwjtst+HTVc1b2ei+rOTi/k13wTBzGRaRMkenMwQhv4b8+tKSNTwUA9VuR8ZGaInKcLhEk9zCZ3
	v9kIBjW6aG1fa3uEsoIAuiEQz+BexYnTi49GdytOLcOasf56eHb3Ol4kNmraBA9p4jnu938gpbEzy
	g36fE8KQurvklWqXmCPQJujzEa9Sra5ZBnpmUkkBHUANHaXAqrAYLYaDMl6Ii4Yl2ivVJFEKW8ERO
	/w0ObxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2sg-00AvqG-1e; Fri, 20 Aug 2021 11:40:14 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2j3-00Arn1-Dz
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 11:30:22 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KBUAVo121215;
 Fri, 20 Aug 2021 06:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629459010;
 bh=/eXZvOa4+OXxpc+o5CSitroN9r32lXsrnJlRUMJVfxM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=s0XUHsXilO6SHm8ke9tNWJhQN0L2K2QxxjKvAylyhUBf6aMT53/ZnRbFXo7bijMsU
 Jdb+kHfSBlDj0wcROlkEKqIkSus+cGvEDjvNgj/EyyqAe/z0WIRPev1iCsLIEEVMZt
 SCGahDqgezxMG7n05gHuCG4FWHF3NxC1zHyku4cQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KBUAjs116271
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 06:30:10 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 06:30:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 06:30:10 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KBU5B0007043;
 Fri, 20 Aug 2021 06:30:06 -0500
Subject: Re: [PATCH 09/13] mtd: spinand: Add support for write volatile
 configuration register op
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-10-a-nandan@ti.com> <20210806210500.3ead1600@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <24b79a08-96fd-34eb-13d3-f707970aae95@ti.com>
Date: Fri, 20 Aug 2021 17:00:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806210500.3ead1600@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_043017_633734_77C57CCD 
X-CRM114-Status: GOOD (  26.14  )
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

SGkgTWlxdcOobCwKCk9uIDA3LzA4LzIxIDEyOjM1IGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEFwdXJ2YSwKPiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9u
IFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6MzQKPiArMDAwMDoKPiAKPj4gVm9sYXRpbGUgY29uZmln
dXJhdGlvbiByZWdpc3RlciBhcmUgYSBkaWZmZXJlbnQgc2V0IG9mIGNvbmZpZ3VyYXRpb24KPj4g
cmVnaXN0ZXJzLCBpLmUuIHRoZXkgZGlmZmVyIGZyb20gdGhlIHN0YXR1cyByZWdpc3RlcnMuIEEg
ZGlmZmVyZW50Cj4+IFNQSSBpbnN0cnVjdGlvbiBpcyByZXF1aXJlZCB0byB3cml0ZSB0byB0aGVz
ZSByZWdpc3RlcnMuIEFueSBjaGFuZ2VzCj4+IHRvIHRoZSBWb2xhdGlsZSBDb25maWd1cmF0aW9u
IFJlZ2lzdGVyIGdldCB0cmFuc2ZlcnJlZCBkaXJlY3RseSB0bwo+PiB0aGUgSW50ZXJuYWwgQ29u
ZmlndXJhdGlvbiBSZWdpc3RlciBhbmQgaW5zdGFudGx5IHJlZmxlY3Qgb24gdGhlCj4+IGRldmlj
ZSBvcGVyYXRpb24uCj4+Cj4+IEluIFdpbmJvbmQgVzM1TjAxSlcsIHRoZXNlIHZvbGF0aWxlIGNv
bmZpZ3VyYXRpb24gcmVnaXN0ZXIgbXVzdCBiZQo+PiBjb25maWd1cmVkIGluIG9yZGVyIHRvIHN3
aXRjaCB0byBPY3RhbCBEVFIgU1BJIG1vZGUuCj4+Cj4+IEFkZCBzdXBwb3J0IGZvciB3cml0aW5n
IHRvIHZvbGF0aWxlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIHVzaW5nIGEKPj4gbmV3IFdSSVRF
X1ZDUl9PUCB0ZW1wbGF0ZS4KPj4KPj4gRGF0YXNoZWV0OiBodHRwczovL3d3dy53aW5ib25kLmNv
bS9leHBvcnQvc2l0ZXMvd2luYm9uZC9kYXRhc2hlZXQvVzM1TjAxSldfRGF0YXNoZWV0X0JyaWVm
LnBkZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+
Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgICB8ICAyICstCj4+ICAg
ZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiAgIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAgICB8ICAxICsKPj4gICAz
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYwo+PiBpbmRleCA4NzExZTg4N2I3OTUuLmY1NzdlNzJkYTJjNCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+PiBAQCAtNDQyLDcgKzQ0Miw3IEBAIHN0YXRpYyB2b2lkIHNwaW5hbmRf
b25kaWVfZWNjX3NhdmVfc3RhdHVzKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgdTggc3RhdHVz
KQo+PiAgIAkJZW5naW5lX2NvbmYtPnN0YXR1cyA9IHN0YXR1czsKPj4gICB9Cj4+ICAgCj4+IC1z
dGF0aWMgaW50IHNwaW5hbmRfd3JpdGVfZW5hYmxlX29wKHN0cnVjdCBzcGluYW5kX2RldmljZSAq
c3BpbmFuZCkKPj4gK2ludCBzcGluYW5kX3dyaXRlX2VuYWJsZV9vcChzdHJ1Y3Qgc3BpbmFuZF9k
ZXZpY2UgKnNwaW5hbmQpCj4+ICAgewo+PiAgIAlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSU5B
TkRfV1JfRU5fRElTX09QKHRydWUpOwo+PiAgIAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9zcGkvd2luYm9uZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4+IGlu
ZGV4IDc2Njg0NDI4MzU0ZS4uYTcwNTJhOWNhMTcxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3NwaS93aW5ib25kLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9u
ZC5jCj4+IEBAIC03LDYgKzcsNyBAQAo+PiAgICAqCUJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGJvb3RsaW4uY29tPgo+PiAgICAqLwo+PiAgIAo+PiArI2luY2x1ZGUgPGxpbnV4L2Rl
bGF5Lmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+PiAgICNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvbXRkL3NwaW5hbmQuaD4KPj4gQEAgLTEx
NCw2ICsxMTUsMzMgQEAgc3RhdGljIGludCB3aW5ib25kX3NwaW5hbmRfaW5pdChzdHJ1Y3Qgc3Bp
bmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4+ICAgCXJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gK3N0
YXRpYyBpbnQgd2luYm9uZF93cml0ZV92Y3Jfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kLCB1OCByZWcsIHU4IHZhbCkKPiAKPiBNYXliZSBhIGNvbW1lbnQgdG8gdGVsbCBwZW9wbGUg
d2hhdCB2Y3IgaXM/Cj4gCgpPa2F5IHN1cmUhCgo+PiArewo+PiArCWludCByZXQ7Cj4+ICsJc3Ry
dWN0IHNwaV9tZW1fb3Agb3AgPSBTUElfTUVNX09QKFNQSV9NRU1fT1BfQ01EKDB4ODEsIDEpLAo+
PiArCQkJCQkgIFNQSV9NRU1fT1BfQUREUigzLCByZWcsIDEpLAo+PiArCQkJCQkgIFNQSV9NRU1f
T1BfTk9fRFVNTVksCj4+ICsJCQkJCSAgU1BJX01FTV9PUF9EQVRBX09VVCgxLCBzcGluYW5kLT5z
Y3JhdGNoYnVmLCAxKSk7Cj4+ICsKPj4gKwkqc3BpbmFuZC0+c2NyYXRjaGJ1ZiA9IHZhbDsKPj4g
Kwo+PiArCXJldCA9IHNwaW5hbmRfd3JpdGVfZW5hYmxlX29wKHNwaW5hbmQpOwo+PiArCWlmIChy
ZXQpCj4+ICsJCXJldHVybiByZXQ7Cj4+ICsKPj4gKwlyZXQgPSBzcGlfbWVtX2V4ZWNfb3Aoc3Bp
bmFuZC0+c3BpbWVtLCAmb3ApOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybiByZXQ7Cj4+ICsK
Pj4gKwkvKgo+PiArCSAqIFdyaXRlIFZDUiBvcGVyYXRpb24gZG9lc24ndCBzZXQgdGhlIGJ1c3kg
Yml0IGluIFNSLCBzbyBjYW4ndCBwZXJmb3JtCj4+ICsJICogYSBzdGF0dXMgcG9sbC4gTWluaW11
bSB0aW1lIG9mIDUwbnMgaXMgbmVlZGVkIHRvIGNvbXBsZXRlIHRoZSB3cml0ZS4KPj4gKwkgKiBT
bywgZ2l2ZSB0aHJpY2UgdGhlIG1pbmltdW0gcmVxdWlyZWQgZGVsYXkuCj4gCj4gSXNuJ3QgdGhl
cmUgYW4gb2ZmaWNpYWwgbWF4aW11bSB0aW1lPwo+IAoKTm8sIHRoZXJlIGlzIG9ubHkgYW4gb2Zm
aWNpYWwgbWluaW11bSB0aW1lLiBObyBtYXhpbXVtIHRpbWUuLgoKPj4gKwkgKi8KPj4gKwluZGVs
YXkoMTUwKTsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc3BpbmFuZF9tYW51ZmFjdHVyZXJfb3BzIHdpbmJvbmRfc3BpbmFuZF9tYW51Zl9vcHMgPSB7
Cj4+ICAgCS5pbml0ID0gd2luYm9uZF9zcGluYW5kX2luaXQsCj4+ICAgfTsKPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL3NwaW5h
bmQuaAo+PiBpbmRleCBkYWEyYWM1YzMxMTAuLjIxYTRlNWFkY2Q1OSAxMDA2NDQKPj4gLS0tIGEv
aW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL3Nw
aW5hbmQuaAo+PiBAQCAtNTYwLDUgKzU2MCw2IEBAIGludCBzcGluYW5kX21hdGNoX2FuZF9pbml0
KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPj4gICAKPj4gICBpbnQgc3BpbmFuZF91
cGRfY2ZnKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdTggbWFzaywgdTggdmFsKTsK
Pj4gICBpbnQgc3BpbmFuZF9zZWxlY3RfdGFyZ2V0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3Bp
bmFuZCwgdW5zaWduZWQgaW50IHRhcmdldCk7Cj4+ICtpbnQgc3BpbmFuZF93cml0ZV9lbmFibGVf
b3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKTsKPj4gICAKPj4gICAjZW5kaWYgLyog
X19MSU5VWF9NVERfU1BJTkFORF9IICovCj4gCj4gCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAKClRoYW5rcywKQXB1cnZh
IE5hbmRhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
