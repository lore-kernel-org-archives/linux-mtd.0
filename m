Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCD1C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 15:57:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C8860ED5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 15:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51C8860ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v3CkFVtKRgal/VAnj6sFFwNz3HX6LcmX+C4aUIjf/8=; b=KN3efqFALeEcJEQzKv5OLniJWR
	fOndQz3opgbnNqgaQiNFVUzKKWdAIbqGG2JBYc7q197dQ2qPNECfnTi53d67EMZKAVxENLpykLwTd
	m/J28VYoz5shDuxIxfb/Czje0WUQJPE0j8nUBGw9Fi+lbZ7Krqy2G2I2oHThmyDC/Eia/76bDDwDN
	qlriONuasWDnyyX73ZBqrCuBGipw96MLpwBRjDSFZAa2xbnTiz1hAutm6scUXZVlz1n4QpV+Oez45
	7zyg0K0zAWjac44d2YP2IpnrL34MtywDLyORK+eFJv52CjekBL8+6q9/PRZyhKHMP/u7OsQWXs5fo
	48kSxl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH6si-00BZVQ-LM; Fri, 20 Aug 2021 15:56:32 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH6sc-00BZUH-Nm
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 15:56:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KFuJPN094234;
 Fri, 20 Aug 2021 10:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629474979;
 bh=lAyyVBpfElD6cu6xrM/uJCISbQOywOKtDruM38jJLB8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=RUpQdG961E5zH+t7IjdUw5YnEQbuXn+z/MtkEjymx2F7PIZZPpktSTRQ4mzglUxWe
 DjnvjxyYcQURkfcYAlGSyN+z1BlhoN8SDHVlLCYItZ8KWE7L0AlUdYrx4DClfwXs4d
 CXb5KPCw4yHwFiAVpM/1hhKGqby0WMot+UM498Os=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KFuJwr080577
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 10:56:19 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 10:56:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 10:56:18 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KFuElV051653;
 Fri, 20 Aug 2021 10:56:15 -0500
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
 <c4a1eae9-7c0b-62c8-f10a-000e65c94f1b@ti.com> <20210820161744.148b3003@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <a8fb82f1-e671-aed1-a2d1-39b974d53fee@ti.com>
Date: Fri, 20 Aug 2021 21:26:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820161744.148b3003@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_085626_908409_2972A833 
X-CRM114-Status: GOOD (  22.77  )
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

SGkgTWlxdcOobCwKCk9uIDIwLzA4LzIxIDc6NDcgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgQXB1cnZhLAo+IAo+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24g
RnJpLCAyMCBBdWcgMjAyMSAxOToxMTo1OAo+ICswNTMwOgo+IAo+PiBIaSBNaXF1w6hsLAo+Pgo+
PiBPbiAyMC8wOC8yMSA1OjQ4IHBtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gSGkgQXB1cnZh
LAo+Pj4KPj4+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24gRnJpLCAy
MCBBdWcgMjAyMSAxNzowOTowNwo+Pj4gKzA1MzA6Cj4+PiAgICAKPj4+PiBIaSBNaXF1w6hsLAo+
Pj4+Cj4+Pj4gT24gMDcvMDgvMjEgMTI6MzggYW0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4+
IEhpIEFwdXJ2YSwKPj4+Pj4KPj4+Pj4gQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3
cm90ZSBvbiBUdWUsIDEzIEp1bCAyMDIxIDEzOjA1OjM2Cj4+Pj4+ICswMDAwOgo+Pj4+PiAgICAg
Pj4+PiBNYW51ZmFjdHVyZXJzIGxpa2UgR2lnYWRldmljZSBhbmQgV2luYm9uZCBhcmUgYWRkaW5n
IFBvd2VyLW9uLVJlc2V0Cj4+Pj4+PiBmdW5jdGlvbmFsaXR5IGluIHRoZWlyIFNQSSBOQU5EIGZs
YXNoIGNoaXBzLiBQb1IgaW5zdHJ1Y3Rpb24gY29uc2lzdHMKPj4+Pj4+IG9mIGEgNjZoIGNvbW1h
bmQgZm9sbG93ZWQgYnkgOTloIGNvbW1hbmQsIGFuZCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgRkZo
Cj4+Pj4+PiByZXNldC4gVGhlIHJlc2V0IGNvbW1hbmQgRkZoIGp1c3QgY2xlYXJzIHRoZSBzdGF0
dXMgb25seSByZWdpc3RlcnMsCj4+Pj4+PiB3aGlsZSB0aGUgUG9SIGNvbW1hbmQgZXJhc2VzIGFs
bCB0aGUgY29uZmlndXJhdGlvbnMgd3JpdHRlbiB0byB0aGUKPj4+Pj4+IGZsYXNoIGFuZCBpcyBl
cXVpdmFsZW50IHRvIGEgcG93ZXItZG93biAtPiBwb3dlci11cCBjeWNsZS4KPj4+Pj4+Cj4+Pj4+
PiBBZGQgc3VwcG9ydCBmb3IgdGhlIFBvd2VyLW9uLVJlc2V0IGNvbW1hbmQgZm9yIGFueSBmbGFz
aCB0aGF0IHByb3ZpZGVzCj4+Pj4+PiB0aGlzIGZlYXR1cmUuCj4+Pj4+Pgo+Pj4+Pj4gRGF0YXNo
ZWV0OiBodHRwczovL3d3dy53aW5ib25kLmNvbS9leHBvcnQvc2l0ZXMvd2luYm9uZC9kYXRhc2hl
ZXQvVzM1TjAxSldfRGF0YXNoZWV0X0JyaWVmLnBkZgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pgo+Pj4+
PiBbLi4uXQo+Pj4+PiAJCQkJXAo+Pj4+Pj4gQEAgLTIxOCw2ICsyMzAsOCBAQCBzdHJ1Y3Qgc3Bp
bmFuZF9kZXZpY2U7Cj4+Pj4+PiAgICAgICogcmVhZGluZy9wcm9ncmFtbWluZy9lcmFzaW5nIHdo
ZW4gdGhlIFJFU0VUIG9jY3Vycy4gU2luY2Ugd2UgYWx3YXlzCj4+Pj4+PiAgICAgICogaXNzdWUg
YSBSRVNFVCB3aGVuIHRoZSBkZXZpY2UgaXMgSURMRSwgNXVzIGlzIHNlbGVjdGVkIGZvciBib3Ro
IGluaXRpYWwKPj4+Pj4+ICAgICAgKiBhbmQgcG9sbCBkZWxheS4KPj4+Pj4+ICsgKiBQb3dlciBv
biBSZXNldCBjYW4gdGFrZSBtYXggdXB0byA1MDAgdXMgdG8gY29tcGxldGUsIHNvIHNsZWVwIGZv
ciAxMDAwIHVzCj4+Pj4+Cj4+Pj4+IHMvbWF4IHVwdG8vdXAgdG8vCj4+Pj4+ICAgICA+Pgo+Pj4+
IE9rYXkhCj4+Pj4gICAKPj4+Pj4+ICsgKiB0byAxMjAwIHVzIHNhZmVseS4KPj4+Pj4KPj4+Pj4g
SSBkb24ndCByZWFsbHkgZ2V0IHdoeSwgaWYgdGhlIG1heGltdW0gaXMgNTAwLCB0aGVuIGxldCdz
IHdhaXQgZm9yCj4+Pj4+IDUwMHVzLgo+Pj4+PiAgICAgPj4KPj4+PiBHZW5lcmFsbHkgd2Uga2Vl
cCBzb21lIG1hcmdpbiBmcm9tIHRoZSBtYXhpbXVtIHRpbWUsIG5vPwo+Pj4KPj4+IFdlbGwsIHll
cyBhbmQgbm8uCj4+Pgo+Pj4gSWYgeW91IGtub3cgdGhhdCBhbiBvcGVyYXRpb24gd2lsbCBsYXN0
IFhtcyBhbmQgaGF2ZSBub3RoaW5nIGVsc2UgdG8KPj4+IGRvLCB0aGVuIHlvdSBjYW4gdGFrZSBz
b21lIG1hcmdpbiBpZiB5b3UgYXJlIGluIGEgcHJvYmUgKGNhbGxlZCBvbmNlKQo+Pj4gYnV0IGRl
ZmluaXRlbHkgbm90IGlmIHlvdSBhcmUgaW4gYSBmYXN0IHBhdGguCj4+PiAgICAKPj4KPj4gSSB0
aGluayBhcyBQb1IgcmVzZXQgd291bGQgYmUgY2FsbGVkIGF0IGV2ZXJ5IG10ZF9zdXNwZW5kKCkg
Y2FsbCwgc28gd2UgY2FuIHJlZHVjZSB0aGUgZGVsYXkuIEFuZCB3ZSB3b3VsZCBiZSBleHBlY3Rp
bmcgc29tZSB0aW1lIGdhcCBiZWZvcmUgdGhlIG5leHQgbXRkX3Jlc3VtZSgpIGNhbGwuCj4+Cj4+
PiBPdGhlcndpc2UgdGhlIGJlc3QgaXMgdG8gaGF2ZSBzb21lIGtpbmQgb2Ygc2lnbmFsaW5nIGJ1
dCBJJ20gbm90IHN1cmUKPj4+IHlvdSdsbCBoYXZlIG9uZSBmb3IgdGhlIHJlc2V0IG9wLi4uCj4+
PiAgICAKPj4KPj4gQWNjb3JkaW5nIHRvIHB1YmxpYyBkYXRhc2hlZXQsIGl0IGRvZXNuJ3Qgc2V0
IHRoZSBidXN5IGJpdCBkdXJpbmcgcmVzZXQuCj4+Cj4+IFNvIGRvIHlvdSBzdWdnZXN0IGluIHRo
ZSBmYXZvciBvZiByZW1vdmluZyB0aGUgZGVsYXkgbWFyZ2luPwo+IAo+IFdlbGwsIGl0J3MgbWlj
cm9zZWNvbmRzLCBtYXliZSB5b3UgY2FuIHJlZHVjZSBpdCBhIGxpdHRsZSBiaXQgYnV0IHRoYXQK
PiB3aWxsIGJlIG9rLgo+IAoKWWVzLCBJIGdvdCBpdC4gV2lsbCBpbXByb3ZlIHRoaXMgaW4gdjIu
IFRoYW5rcyEKCj4+Cj4+Pj4gICAKPj4+Pj4+ICAgICAgKi8KPj4+Pj4+ICAgICAjZGVmaW5lIFNQ
SU5BTkRfUkVBRF9JTklUSUFMX0RFTEFZX1VTCTYKPj4+Pj4+ICAgICAjZGVmaW5lIFNQSU5BTkRf
UkVBRF9QT0xMX0RFTEFZX1VTCTUKPj4+Pj4+IEBAIC0yMjcsNiArMjQxLDggQEAgc3RydWN0IHNw
aW5hbmRfZGV2aWNlOwo+Pj4+Pj4gICAgICNkZWZpbmUgU1BJTkFORF9XUklURV9QT0xMX0RFTEFZ
X1VTCTE1Cj4+Pj4+PiAgICAgI2RlZmluZSBTUElOQU5EX0VSQVNFX0lOSVRJQUxfREVMQVlfVVMJ
MjUwCj4+Pj4+PiAgICAgI2RlZmluZSBTUElOQU5EX0VSQVNFX1BPTExfREVMQVlfVVMJNTAKPj4+
Pj4+ICsjZGVmaW5lIFNQSU5BTkRfUE9SX01JTl9ERUxBWV9VUwkxMDAwCj4+Pj4+PiArI2RlZmlu
ZSBTUElOQU5EX1BPUl9NQVhfREVMQVlfVVMJMTIwMAo+Pj4+Pj4gICAgID4+ICAgI2RlZmluZSBT
UElOQU5EX1dBSVRSRFlfVElNRU9VVF9NUwk0MDAKPj4+Pj4+ICAgICA+PiBAQCAtMzUxLDYgKzM2
Nyw3IEBAIHN0cnVjdCBzcGluYW5kX2VjY19pbmZvIHsKPj4+Pj4+ICAgICAjZGVmaW5lIFNQSU5B
TkRfSEFTX1FFX0JJVAkJQklUKDApCj4+Pj4+PiAgICAgI2RlZmluZSBTUElOQU5EX0hBU19DUl9G
RUFUX0JJVAkJQklUKDEpCj4+Pj4+PiAgICAgI2RlZmluZSBTUElOQU5EX0hBU19PQ1RBTF9EVFJf
QklUCUJJVCgyKQo+Pj4+Pj4gKyNkZWZpbmUgU1BJTkFORF9IQVNfUE9SX0NNRF9CSVQJCUJJVCgz
KQo+Pj4+Pj4gICAgID4+ICAgLyoqCj4+Pj4+PiAgICAgICogc3RydWN0IHNwaW5hbmRfb25kaWVf
ZWNjX2NvbmYgLSBwcml2YXRlIFNQSS1OQU5EIG9uLWRpZSBFQ0MgZW5naW5lIHN0cnVjdHVyZQo+
Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+IE1pcXXDqGwKPj4+Pj4K
Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+Pj4+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+Pj4+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPj4+Pj4gICAg
ID4+Cj4+Pj4gVGhhbmtzLAo+Pj4+IEFwdXJ2YSBOYW5kYW4KPj4+Cj4+PiBUaGFua3MsCj4+PiBN
aXF1w6hsCj4+PiAgICAKPj4KPj4gVGhhbmtzLAo+PiBBcHVydmEgTmFuZGFuCj4gCj4gVGhhbmtz
LAo+IE1pcXXDqGwKPiAKClRoYW5rcywKQXB1cnZhIE5hbmRhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
