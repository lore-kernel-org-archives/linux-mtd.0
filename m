Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1818FC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11E6610C8
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D11E6610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR659Ux2ppkOwgK3yWccpzFV4LO5Vnvey8glGZu9hwA=; b=H3nIqtYnDzeqq4DOQ9KN3cuMxp
	j4ykmxq5Yvb5WXGcP/mU7P2JuRuZYPUwZ43KEEv44O6yzywoP+65HCXNKNnJs5e+Oa+XxzntDN54A
	dC03780kkg7olfJMxsCaz930S3b3HdjUKD8PdNkuMbJkigE9XWfp4kiDA7Ezxkj0szSIk17bu2HiH
	JzvQfEnhan1aQ0PG641zJw+VYs2h/chOEEXuvOPJ7OwpDY78hxdax/4vouOjypAm/EclQUi757esm
	NNnz19epaqf2kK7d2moQM/ncGh0n84oIPSV+GzeUi2b/TmdkG7CNkAmqBnHgusSqC9xKDxZGCJDq9
	PqcFmHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3AD-00B1N8-JA; Fri, 20 Aug 2021 11:58:22 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2y8-00Axfe-J1
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 11:45:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KBjio6048179;
 Fri, 20 Aug 2021 06:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629459944;
 bh=MpYon/18OVO6FRdF3uL/WYr8dvUTShbFfyCbaQQ5h6o=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nBeucUyBDfI2f0UWfwHaKB9y+Yn9kmyaNUYW8q/UajkI5kWk0I4PMtu4PBrdX2veK
 nVFrMGJ5nLPRlVPwPjH/4VH6ZSBU2VCJkZNZcsNrftERalTBxXgoiGWhQiojR6tiDc
 SFOR1Yl2kYKGhI7JFmpJ7yqjhjDY4pXxxM3seqvs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KBjiFO122562
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 06:45:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 06:45:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 06:45:44 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KBjdEM071957;
 Fri, 20 Aug 2021 06:45:40 -0500
Subject: Re: [PATCH 12/13] mtd: spinand: Perform Power-on-Reset when
 runtime_pm suspend is issued
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-13-a-nandan@ti.com> <20210806211231.5c569939@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <2437d7b9-2a01-28c7-9a81-f38c35f37964@ti.com>
Date: Fri, 20 Aug 2021 17:15:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211231.5c569939@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_044552_764833_F445AE82 
X-CRM114-Status: GOOD (  28.60  )
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

CgpPbiAwNy8wOC8yMSAxMjo0MiBhbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBBcHVydmEs
Cj4gCj4gQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUsIDEzIEp1
bCAyMDIxIDEzOjA1OjM3Cj4gKzAwMDA6Cj4gCj4+IEEgc29mdCByZXNldCB1c2luZyBGRmggY29t
bWFuZCBkb2Vzbid0IGVyYXNlIHRoZSBmbGFzaCdzIGNvbmZpZ3VyYXRpb24KPj4gYW5kIGRvZXNu
J3QgcmVzZXQgdGhlIFNQSSBJTyBtb2RlIGFsc28uIFRoaXMgY2FuIHJlc3VsdCBpbiB0aGUgZmxh
c2gKPj4gYmVpbmcgaW4gYSBkaWZmZXJlbnQgU1BJIElPIG1vZGUsIGUuZy4gT2N0YWwgRFRSLCB3
aGVuIHJlc3VtaW5nIGZyb20KPj4gc2xlZXAuIFRoaXMgd291bGQgcmVuZGVyIHRoZSBmbGFzaCBp
biBhbiB1bnVzYWJsZSBzdGF0ZS4KPiAKPiAgICAgICAgICAgICAgICBjb3VsZCBwdXQgdGhlIGZh
bHNoIGluPwo+IAoKT2theSwgd2lsbCBtYWtlIGl0IGNsZWFyZXIuCkJhc2ljYWxseSwgd2UgZG9u
J3Qgd2FudCB0aGUgZmxhc2ggdG8gYmUgaW4gYW4gYW1iaWd1b3VzIHN0YXRlLiBJdCBtaWdodCAK
b3IgbWlnaHQgbm90IGhhdmUgdW5kZXJnb25lIGEgcG93ZXIgb2ZmIGR1cmluZyB0aGUgc3VzcGVu
ZCBzdGF0ZS4gU28sIAp0aGUgc3BpbmFuZCBjb3JlIHdvdWxkbid0IGtub3cgaWYgdGhlIGZsYXNo
IGlzIHN0aWxsIGluIE9jdGFsIERUUiBtb2RlIApvciBub3QuIElmIGl0IGlzIHN0aWxsIGluIE9j
dGFsIERUUiBtb2RlLCB0aGVuIG5vbmUgb2YgdGhlIFNQSSAKaW5zdHJ1Y3Rpb24gZHVyaW5nIG10
ZF9yZXN1bWUoKSB3b3VsZCB3b3JrLiBTbyB0aGlzIGlzIGFuIGFtYmlndW91cyAKc2l0dWF0aW9u
IGZvciBkcml2ZXIuIFRvIGF2b2lkIHRoaXMsIHBlcmZvcm0gYSBQb1IgcmVzZXQgYmVmb3JlIHN1
c3BlbmRpbmcuCgo+PiBQZXJmb3JtIGEgUG93ZXItb24tUmVzZXQgKFBvUiksIGlmIGF2YWlsYWJs
ZSBpbiB0aGUgZmxhc2gsIHdoZW4KPj4gc3VzcGVuZGluZyB0aGUgZGV2aWNlIGJ5IHJ1bnRpbWVf
cG0uIFRoaXMgd291bGQgc2V0IHRoZSBmbGFzaCB0byBjbGVhbgo+IAo+IEkgdGhpbmsgcnVudGlt
ZV9wbSBpcyBzb21ldGhpbmcgZWxzZS4KPiAKClllYWgsIHdpbGwgbWFrZSBpdCBjbGVhcmVyLgoK
Pj4gc3RhdGUgZm9yIHJlaW5pdGlhbGl6YXRpb24gZHVyaW5nIHJlc3VtZSBhbmQgd291bGQgYWxz
byBlbnN1cmUgdGhhdCBpdAo+PiBpcyBpbiBzdGFuZGFyZCBTUEkgSU8gbW9kZSAoMVMtMVMtMVMp
IGJlZm9yZSB0aGUgcmVzdW1lIGJlZ2lucy4KPiAKPiBQbGVhc2UgYWRkIGEgY29tbWVudCBhYm91
dCB0aGlzIHRvIGV4cGxhaW4gd2h5IHdlIGRvbid0IGRvIHRoaXMgcmVzZXQKPiBhdCByZXN1bWUg
dGltZS4KPiAKClllcyBzdXJlIQoKPj4KPj4gU2lnbmVkLW9mZi1ieTogQXB1cnZhIE5hbmRhbiA8
YS1uYW5kYW5AdGkuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMg
fCAxNiArKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBpbmRleCA2MDhmNGViODViMGEuLjZmYjNhYTZhZjU0
MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBAQCAtMTMyOSw2ICsxMzI5LDIxIEBAIHN0YXRp
YyB2b2lkIHNwaW5hbmRfbXRkX3Jlc3VtZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPj4gICAJc3Bp
bmFuZF9lY2NfZW5hYmxlKHNwaW5hbmQsIGZhbHNlKTsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMg
aW50IHNwaW5hbmRfbXRkX3N1c3BlbmQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4+ICt7Cj4+ICsJ
c3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0gbXRkX3RvX3NwaW5hbmQobXRkKTsKPj4g
KwlpbnQgcmV0Owo+PiArCj4+ICsJaWYgKCEoc3BpbmFuZC0+ZmxhZ3MgJiBTUElOQU5EX0hBU19Q
T1JfQ01EX0JJVCkpCj4+ICsJCXJldHVybiAwOwo+PiArCj4+ICsJcmV0ID0gc3BpbmFuZF9wb3dl
cl9vbl9yc3Rfb3Aoc3BpbmFuZCk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJZGV2X2Vycigmc3BpbmFu
ZC0+c3BpbWVtLT5zcGktPmRldiwgInN1c3BlbmQoKSBmYWlsZWRcbiIpOwo+PiArCj4+ICsJcmV0
dXJuIHJldDsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0KHN0cnVjdCBz
cGluYW5kX2RldmljZSAqc3BpbmFuZCkKPj4gICB7Cj4+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+PiBAQCAtMTQwMSw2ICsxNDE2LDcgQEAgc3Rh
dGljIGludCBzcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+PiAg
IAltdGQtPl9lcmFzZSA9IHNwaW5hbmRfbXRkX2VyYXNlOwo+PiAgIAltdGQtPl9tYXhfYmFkX2Js
b2NrcyA9IG5hbmRkZXZfbXRkX21heF9iYWRfYmxvY2tzOwo+PiAgIAltdGQtPl9yZXN1bWUgPSBz
cGluYW5kX210ZF9yZXN1bWU7Cj4+ICsJbXRkLT5fc3VzcGVuZCA9IHNwaW5hbmRfbXRkX3N1c3Bl
bmQ7Cj4+ICAgCj4+ICAgCWlmIChuYW5kLT5lY2MuZW5naW5lKSB7Cj4+ICAgCQlyZXQgPSBtdGRf
b29ibGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOwo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hs
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4gCgpUaGFua3MsCkFwdXJ2
YSBOYW5kYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
