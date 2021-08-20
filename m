Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A604C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 300C56109D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 300C56109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYgy0yotb2z4JxOPK5tKk2PDNebXIO00Ez09QNF3nEk=; b=E1cMfVonNhGV0V+llkQkCM8m+t
	pQn15CEF52XkijheYSTkS3U/7Adro2BxxAXjftjtNKSw98wPpboIuY6j1sUPpVJJvrDXmY83Wbl7o
	nlOizkbyK8NOVV69+HlFUssjn2SX+tQC/y2i8xg0rP7h1pddhVsiUqZSSIUDMYDH4SbADGJjeXiP9
	mYs3dZkKLAgvt3sQjLCkTcHhtD2R1r9APBCmZ0L/qC+5bpAhQQC8o3BH+uZfwWW6v8/BXlYBDf1ia
	mRiUa1xj3/LI/C6YamJ3KU9Ty+zvoDto8YI7Amb4LkQIJEuj6XFsMu2bpva69x3YynnJrZlIQan6v
	5ODC/9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2ti-00AwFv-0y; Fri, 20 Aug 2021 11:41:18 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2ke-00AsSY-U4
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 11:32:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KBVjgw121818;
 Fri, 20 Aug 2021 06:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629459105;
 bh=a7YO7oyWJKBUCpjHnpZI87hRZO+GNlybTn6+5XPpY5E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XG7FurTILwIMFJ5BcQ29RiBlhpZJ6C0rWtZDz5EHgDK1cHliCt8O3nCqccYGScJ9p
 8t5sTiamcuGSbSvDLD3WaMS16rWgKzYm0uiuv0GiQP1kwxGamUMUprsER1C6mp7diU
 1vSL0QtJW//rCn/1sCeDkV+z5KcmyZ92dnYiR64s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KBVjxo105323
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 06:31:45 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 06:31:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 06:31:45 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KBVeI7049293;
 Fri, 20 Aug 2021 06:31:41 -0500
Subject: Re: [PATCH 10/13] mtd: spinand: Add octal_dtr_enable() for Winbond
 manufacturer_ops
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-11-a-nandan@ti.com> <20210806210609.0fd94b9e@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <0ac67f14-b25c-2e3b-fdd9-f5f101d9caad@ti.com>
Date: Fri, 20 Aug 2021 17:01:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806210609.0fd94b9e@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_043157_129277_CA6AF2DD 
X-CRM114-Status: GOOD (  22.29  )
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

SGkgTWlxdcOobCwKCk9uIDA3LzA4LzIxIDEyOjM2IGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEFwdXJ2YSwKPiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9u
IFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6MzUKPiArMDAwMDoKPiAKPj4gQWRkIGltcGxlbWVudGF0
aW9uIG9mIG9jdGFsX2R0cl9lbmFibGUoKSBtYW51ZmFjdHVyZXJfb3BzIGZvciBXaW5ib25kLgo+
PiBUbyBzd2l0Y2ggdG8gT2NhdGwgRFRSIG1vZGUsIHNldHRpbmcgcHJvZ3JhbW1hYmxlIGR1bW15
IGN5Y2xlcyBhbmQKPj4gU1BJIElPIG1vZGUgdXNpbmcgdGhlIHZvbGF0aWxlIGNvbmZpZ3VyYXRp
b24gcmVnaXN0ZXIgaXMgcmVxdWlyZWQuIFRvCj4+IGZ1bmN0aW9uIGF0IG1heCAxMjBNSHogU1BJ
IGNsb2NrIGluIE9jdGFsIERUUiBtb2RlLCAxMiBwcm9ncmFtbWFibGUKPj4gZHVtbXkgY2xvY2sg
Y3ljbGUgc2V0dGluZyBpcyByZXF1aXJlZC4gKERlZmF1bHQgbnVtYmVyIG9mIGR1bW15IGN5Y2xl
Cj4+IGFyZSA4IGNsb2NrcykKPj4KPj4gU2V0IHRoZSBwcm9ncmFtbWFibGUgZHVtbXkgY3ljbGUg
dG8gMTIgY2xvY2tzLCBhbmQgU1BJIElPIG1vZGUgdG8KPj4gT2N0YWwgRFRSIHdpdGggRGF0YSBT
dHJvYmUgaW4gdGhlIFZDUi4gQWxzbywgcGVyZm9ybSBhIFJFQUQgSUQKPj4gb3BlcmF0aW9uIGlu
IE9jdGFsIERUUiBTUEkgbW9kZSB0byBlbnN1cmUgdGhlIHN3aXRjaCB3YXMgc3VjY2Vzc2Z1bC4K
PiAKPiBDb21taXQgdGl0bGUgc2hvdWxkIGNvbnRhaW4gIndpbmJvbmQ6IiAoc2FtZSBmb3IgdGhl
IHByZXZpb3VzIHBhdGNoIGFuZAo+IHBvc3NpYmx5IG5leHQgb25lcyBhcyB3ZWxsKS4KPiAKCk9r
YXksIGdvdCBpdCEKCj4+IERhdGFzaGVldDogaHR0cHM6Ly93d3cud2luYm9uZC5jb20vZXhwb3J0
L3NpdGVzL3dpbmJvbmQvZGF0YXNoZWV0L1czNU4wMUpXX0RhdGFzaGVldF9CcmllZi5wZGYKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPgo+PiAtLS0K
Pj4gICBkcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgfCA0MiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwo+PiBpbmRleCBhNzA1MmE5Y2ExNzEuLjU4Y2RhMDdj
MTVhMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCj4+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwo+PiBAQCAtMTYsNiArMTYsMTQgQEAK
Pj4gICAKPj4gICAjZGVmaW5lIFdJTkJPTkRfQ0ZHX0JVRl9SRUFECQlCSVQoMykKPj4gICAKPj4g
Ky8qIE9jdGFsIERUUiBTUEkgbW9kZSAoOEQtOEQtOEQpIHdpdGggRGF0YSBTdHJvYmUgb3V0cHV0
Ki8KPj4gKyNkZWZpbmUgV0lOQk9ORF9JT19NT0RFX1ZDUl9PQ1RBTF9EVFIJMHhFNwo+PiArI2Rl
ZmluZSBXSU5CT05EX0lPX01PREVfVkNSX0FERFIJMHgwMAo+PiArCj4+ICsvKiBVc2UgMTIgZHVt
bXkgY2xrIGN5Y2xlcyBmb3IgdXNpbmcgT2N0YWwgRFRSIFNQSSBhdCBtYXggMTIwTUhaICovCj4+
ICsjZGVmaW5lIFdJTkJPTkRfRFVNTVlfQ0xLX0NPVU5UCQkxMgo+PiArI2RlZmluZSBXSU5CT05E
X0RVTU1ZX0NMS19WQ1JfQUREUgkweDAxCj4+ICsKPj4gICBzdGF0aWMgU1BJTkFORF9PUF9WQVJJ
QU5UUyhyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+PiAgIAkJU1BJTkFORF9QQUdFX1JFQURfRlJPTV9D
QUNIRV9RVUFESU9fT1AoMCwgMiwgTlVMTCwgMCksCj4+ICAgCQlTUElOQU5EX1BBR0VfUkVBRF9G
Uk9NX0NBQ0hFX1g0X09QKDAsIDEsIE5VTEwsIDApLAo+PiBAQCAtMTQyLDggKzE1MCw0MiBAQCBz
dGF0aWMgaW50IHdpbmJvbmRfd3JpdGVfdmNyX29wKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3Bp
bmFuZCwgdTggcmVnLCB1OCB2YWwpCj4+ICAgCXJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gK3N0
YXRpYyBpbnQgd2luYm9uZF9zcGluYW5kX29jdGFsX2R0cl9lbmFibGUoc3RydWN0IHNwaW5hbmRf
ZGV2aWNlICpzcGluYW5kKQo+PiArewo+PiArCWludCByZXQ7Cj4+ICsJc3RydWN0IHNwaV9tZW1f
b3Agb3A7Cj4+ICsKPj4gKwlyZXQgPSB3aW5ib25kX3dyaXRlX3Zjcl9vcChzcGluYW5kLCBXSU5C
T05EX0RVTU1ZX0NMS19WQ1JfQUREUiwKPj4gKwkJCQkgICBXSU5CT05EX0RVTU1ZX0NMS19DT1VO
VCk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJcmV0dXJuIHJldDsKPj4gKwo+PiArCXJldCA9IHdpbmJv
bmRfd3JpdGVfdmNyX29wKHNwaW5hbmQsIFdJTkJPTkRfSU9fTU9ERV9WQ1JfQUREUiwKPj4gKwkJ
CQkgICBXSU5CT05EX0lPX01PREVfVkNSX09DVEFMX0RUUik7Cj4+ICsJaWYgKHJldCkKPj4gKwkJ
cmV0dXJuIHJldDsKPj4gKwo+PiArCS8qIFJlYWQgZmxhc2ggSUQgdG8gbWFrZSBzdXJlIHRoZSBz
d2l0Y2ggd2FzIHN1Y2Nlc3NmdWwuICovCj4+ICsJb3AgPSAoc3RydWN0IHNwaV9tZW1fb3ApCj4+
ICsJCVNQSV9NRU1fT1AoU1BJX01FTV9PUF9DTURfRFRSKDIsIDB4OWY5ZiwgOCksCj4+ICsJCQkg
ICBTUElfTUVNX09QX05PX0FERFIsCj4+ICsJCQkgICBTUElfTUVNX09QX0RVTU1ZX0RUUigxNiwg
OCksCj4+ICsJCQkgICBTUElfTUVNX09QX0RBVEFfSU5fRFRSKFNQSU5BTkRfTUFYX0lEX0xFTiwK
Pj4gKwkJCQkJCSAgc3BpbmFuZC0+c2NyYXRjaGJ1ZiwgOCkpOwo+PiArCj4+ICsJcmV0ID0gc3Bp
X21lbV9leGVjX29wKHNwaW5hbmQtPnNwaW1lbSwgJm9wKTsKPj4gKwlpZiAocmV0KQo+PiArCQly
ZXR1cm4gcmV0Owo+PiArCj4+ICsJaWYgKG1lbWNtcChzcGluYW5kLT5zY3JhdGNoYnVmLCBzcGlu
YW5kLT5pZC5kYXRhLCBTUElOQU5EX01BWF9JRF9MRU4pKQo+PiArCQlyZXR1cm4gLUVJTlZBTDsK
Pj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
cGluYW5kX21hbnVmYWN0dXJlcl9vcHMgd2luYm9uZF9zcGluYW5kX21hbnVmX29wcyA9IHsKPj4g
ICAJLmluaXQgPSB3aW5ib25kX3NwaW5hbmRfaW5pdCwKPj4gKwkub2N0YWxfZHRyX2VuYWJsZSA9
IHdpbmJvbmRfc3BpbmFuZF9vY3RhbF9kdHJfZW5hYmxlLAo+PiAgIH07Cj4+ICAgCj4+ICAgY29u
c3Qgc3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyIHdpbmJvbmRfc3BpbmFuZF9tYW51ZmFjdHVy
ZXIgPSB7Cj4gCj4gCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAKClRoYW5rcywKQXB1cnZhIE5hbmRhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
