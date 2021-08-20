Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97C1C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 13:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C79D610FF
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 13:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C79D610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtlMGE/GEzsOjuVBnqJbRFJPN26/tlaZ1DbzOWdYOKc=; b=XEyuObyyzEBcUvEjGi/vRsX4A7
	nokPKOdCCsrkpaBo3s52KrBmfmXQw++9PtitgxctBjhyE7t5NWrfEZToIrEd9CSWZp9hN+RFKwsZ8
	P6WmUV+irKcCDIo3g2cKxqmRdOpPuX4e1qvGpPJ/B1px5sI5iVPMZ3uDGBadV5JsaVCHlItYixj6o
	UgmIpBWI+ABknj5PO/83mLnX//ctvr1cdEOWUCx3C3KA75wkNfV1vMJazLUbOFt9q8u8g+RRsofmF
	qIUOVqS0U3K/LO7SKjOZuhM5idlbA+ffil0z9De3IXURz9qX9L+REcMsvDpI2sn1aMAV/sbHK23s3
	0J8Can/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH4mp-00BJfG-0P; Fri, 20 Aug 2021 13:42:19 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH4mj-00BJde-O4
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 13:42:18 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KDg3iJ037556;
 Fri, 20 Aug 2021 08:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629466923;
 bh=l6lfOIIzUGkJ1AiwUMjQziIUZErEf/aO/EeX73Fg1/U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=a517rtmjB9n/uhgSEd89trKRErN9NV/CIVoV4CiZRqgi57Rmj5t94VX5CWjvdCLgf
 YtUoz99UlTgyF76h+dl4bZnaN67hqf8yymqmPCQmW8Lq7KH97ssSoVETiynqdwm3sO
 0Aae5A4FAd2McMtWPCchuNMVSA+phL1+UDZWHL6E=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KDg2KI047132
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 08:42:03 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 08:42:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 08:42:03 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KDfwM4100508;
 Fri, 20 Aug 2021 08:41:59 -0500
Subject: Re: [PATCH 11/13] mtd: spinand: Add support for Power-on-Reset (PoR)
 instruction
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-12-a-nandan@ti.com> <20210806210840.65c06b67@xps13>
 <403a2b26-fd95-31ab-8992-a6e6862249e6@ti.com> <20210820141822.03d658b8@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <c4a1eae9-7c0b-62c8-f10a-000e65c94f1b@ti.com>
Date: Fri, 20 Aug 2021 19:11:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820141822.03d658b8@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_064213_912205_27F923C2 
X-CRM114-Status: GOOD (  23.90  )
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

SGkgTWlxdcOobCwKCk9uIDIwLzA4LzIxIDU6NDggcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgQXB1cnZhLAo+IAo+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24g
RnJpLCAyMCBBdWcgMjAyMSAxNzowOTowNwo+ICswNTMwOgo+IAo+PiBIaSBNaXF1w6hsLAo+Pgo+
PiBPbiAwNy8wOC8yMSAxMjozOCBhbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIEFwdXJ2
YSwKPj4+Cj4+PiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9uIFR1ZSwg
MTMgSnVsIDIwMjEgMTM6MDU6MzYKPj4+ICswMDAwOgo+Pj4gICAgCj4+Pj4gTWFudWZhY3R1cmVy
cyBsaWtlIEdpZ2FkZXZpY2UgYW5kIFdpbmJvbmQgYXJlIGFkZGluZyBQb3dlci1vbi1SZXNldAo+
Pj4+IGZ1bmN0aW9uYWxpdHkgaW4gdGhlaXIgU1BJIE5BTkQgZmxhc2ggY2hpcHMuIFBvUiBpbnN0
cnVjdGlvbiBjb25zaXN0cwo+Pj4+IG9mIGEgNjZoIGNvbW1hbmQgZm9sbG93ZWQgYnkgOTloIGNv
bW1hbmQsIGFuZCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgRkZoCj4+Pj4gcmVzZXQuIFRoZSByZXNl
dCBjb21tYW5kIEZGaCBqdXN0IGNsZWFycyB0aGUgc3RhdHVzIG9ubHkgcmVnaXN0ZXJzLAo+Pj4+
IHdoaWxlIHRoZSBQb1IgY29tbWFuZCBlcmFzZXMgYWxsIHRoZSBjb25maWd1cmF0aW9ucyB3cml0
dGVuIHRvIHRoZQo+Pj4+IGZsYXNoIGFuZCBpcyBlcXVpdmFsZW50IHRvIGEgcG93ZXItZG93biAt
PiBwb3dlci11cCBjeWNsZS4KPj4+Pgo+Pj4+IEFkZCBzdXBwb3J0IGZvciB0aGUgUG93ZXItb24t
UmVzZXQgY29tbWFuZCBmb3IgYW55IGZsYXNoIHRoYXQgcHJvdmlkZXMKPj4+PiB0aGlzIGZlYXR1
cmUuCj4+Pj4KPj4+PiBEYXRhc2hlZXQ6IGh0dHBzOi8vd3d3LndpbmJvbmQuY29tL2V4cG9ydC9z
aXRlcy93aW5ib25kL2RhdGFzaGVldC9XMzVOMDFKV19EYXRhc2hlZXRfQnJpZWYucGRmCj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+Cj4+Pj4g
LS0tCj4+Pgo+Pj4gWy4uLl0KPj4+IAkJCQlcCj4+Pj4gQEAgLTIxOCw2ICsyMzAsOCBAQCBzdHJ1
Y3Qgc3BpbmFuZF9kZXZpY2U7Cj4+Pj4gICAgICogcmVhZGluZy9wcm9ncmFtbWluZy9lcmFzaW5n
IHdoZW4gdGhlIFJFU0VUIG9jY3Vycy4gU2luY2Ugd2UgYWx3YXlzCj4+Pj4gICAgICogaXNzdWUg
YSBSRVNFVCB3aGVuIHRoZSBkZXZpY2UgaXMgSURMRSwgNXVzIGlzIHNlbGVjdGVkIGZvciBib3Ro
IGluaXRpYWwKPj4+PiAgICAgKiBhbmQgcG9sbCBkZWxheS4KPj4+PiArICogUG93ZXIgb24gUmVz
ZXQgY2FuIHRha2UgbWF4IHVwdG8gNTAwIHVzIHRvIGNvbXBsZXRlLCBzbyBzbGVlcCBmb3IgMTAw
MCB1cwo+Pj4KPj4+IHMvbWF4IHVwdG8vdXAgdG8vCj4+PiAgICAKPj4KPj4gT2theSEKPj4KPj4+
PiArICogdG8gMTIwMCB1cyBzYWZlbHkuCj4+Pgo+Pj4gSSBkb24ndCByZWFsbHkgZ2V0IHdoeSwg
aWYgdGhlIG1heGltdW0gaXMgNTAwLCB0aGVuIGxldCdzIHdhaXQgZm9yCj4+PiA1MDB1cy4KPj4+
ICAgIAo+Pgo+PiBHZW5lcmFsbHkgd2Uga2VlcCBzb21lIG1hcmdpbiBmcm9tIHRoZSBtYXhpbXVt
IHRpbWUsIG5vPwo+IAo+IFdlbGwsIHllcyBhbmQgbm8uCj4gCj4gSWYgeW91IGtub3cgdGhhdCBh
biBvcGVyYXRpb24gd2lsbCBsYXN0IFhtcyBhbmQgaGF2ZSBub3RoaW5nIGVsc2UgdG8KPiBkbywg
dGhlbiB5b3UgY2FuIHRha2Ugc29tZSBtYXJnaW4gaWYgeW91IGFyZSBpbiBhIHByb2JlIChjYWxs
ZWQgb25jZSkKPiBidXQgZGVmaW5pdGVseSBub3QgaWYgeW91IGFyZSBpbiBhIGZhc3QgcGF0aC4K
PiAKCkkgdGhpbmsgYXMgUG9SIHJlc2V0IHdvdWxkIGJlIGNhbGxlZCBhdCBldmVyeSBtdGRfc3Vz
cGVuZCgpIGNhbGwsIHNvIHdlIApjYW4gcmVkdWNlIHRoZSBkZWxheS4gQW5kIHdlIHdvdWxkIGJl
IGV4cGVjdGluZyBzb21lIHRpbWUgZ2FwIGJlZm9yZSB0aGUgCm5leHQgbXRkX3Jlc3VtZSgpIGNh
bGwuCgo+IE90aGVyd2lzZSB0aGUgYmVzdCBpcyB0byBoYXZlIHNvbWUga2luZCBvZiBzaWduYWxp
bmcgYnV0IEknbSBub3Qgc3VyZQo+IHlvdSdsbCBoYXZlIG9uZSBmb3IgdGhlIHJlc2V0IG9wLi4u
Cj4gCgpBY2NvcmRpbmcgdG8gcHVibGljIGRhdGFzaGVldCwgaXQgZG9lc24ndCBzZXQgdGhlIGJ1
c3kgYml0IGR1cmluZyByZXNldC4KClNvIGRvIHlvdSBzdWdnZXN0IGluIHRoZSBmYXZvciBvZiBy
ZW1vdmluZyB0aGUgZGVsYXkgbWFyZ2luPwoKPj4KPj4+PiAgICAgKi8KPj4+PiAgICAjZGVmaW5l
IFNQSU5BTkRfUkVBRF9JTklUSUFMX0RFTEFZX1VTCTYKPj4+PiAgICAjZGVmaW5lIFNQSU5BTkRf
UkVBRF9QT0xMX0RFTEFZX1VTCTUKPj4+PiBAQCAtMjI3LDYgKzI0MSw4IEBAIHN0cnVjdCBzcGlu
YW5kX2RldmljZTsKPj4+PiAgICAjZGVmaW5lIFNQSU5BTkRfV1JJVEVfUE9MTF9ERUxBWV9VUwkx
NQo+Pj4+ICAgICNkZWZpbmUgU1BJTkFORF9FUkFTRV9JTklUSUFMX0RFTEFZX1VTCTI1MAo+Pj4+
ICAgICNkZWZpbmUgU1BJTkFORF9FUkFTRV9QT0xMX0RFTEFZX1VTCTUwCj4+Pj4gKyNkZWZpbmUg
U1BJTkFORF9QT1JfTUlOX0RFTEFZX1VTCTEwMDAKPj4+PiArI2RlZmluZSBTUElOQU5EX1BPUl9N
QVhfREVMQVlfVVMJMTIwMAo+Pj4+ICAgID4+ICAgI2RlZmluZSBTUElOQU5EX1dBSVRSRFlfVElN
RU9VVF9NUwk0MDAKPj4+PiAgICA+PiBAQCAtMzUxLDYgKzM2Nyw3IEBAIHN0cnVjdCBzcGluYW5k
X2VjY19pbmZvIHsKPj4+PiAgICAjZGVmaW5lIFNQSU5BTkRfSEFTX1FFX0JJVAkJQklUKDApCj4+
Pj4gICAgI2RlZmluZSBTUElOQU5EX0hBU19DUl9GRUFUX0JJVAkJQklUKDEpCj4+Pj4gICAgI2Rl
ZmluZSBTUElOQU5EX0hBU19PQ1RBTF9EVFJfQklUCUJJVCgyKQo+Pj4+ICsjZGVmaW5lIFNQSU5B
TkRfSEFTX1BPUl9DTURfQklUCQlCSVQoMykKPj4+PiAgICA+PiAgIC8qKgo+Pj4+ICAgICAqIHN0
cnVjdCBzcGluYW5kX29uZGllX2VjY19jb25mIC0gcHJpdmF0ZSBTUEktTkFORCBvbi1kaWUgRUND
IGVuZ2luZSBzdHJ1Y3R1cmUKPj4+Cj4+Pgo+Pj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBNaXF1w6hs
Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+PiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPj4+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+Pj4gICAgCj4+
Cj4+IFRoYW5rcywKPj4gQXB1cnZhIE5hbmRhbgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpU
aGFua3MsCkFwdXJ2YSBOYW5kYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
