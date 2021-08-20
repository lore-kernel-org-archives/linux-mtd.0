Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722B8C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:45:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 318D16109D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 318D16109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdWx4DBmCjqu1T62gwTdjpI0G1OVhSwJ9JQLDn5YJrM=; b=sxgRbRkE7F4iU5G8eHEmkPXqZq
	0YKq+KXLb8C1NhZirF2/hAmcufsJgOe/Thw3PaXorT/LYED33h06OSYc/8+NONoZOTdQxuMWsPtfg
	a+dUSA1smaLWZ8gc9XgG9nlp9rrGcK4Nb7dXFvZCjqu0HV/S4kekPPkQgWZAbjuFWTKdTCLRE1ooc
	uDD1qAOUqHCav/bjpWuORiFcyTg/e5YR2O8T9mCebP2mWF3NiruEWksS8FQ99fObS83OLsWBJLtEM
	0CS/2JHHU23Xc/1ul8qU1bzUIoK9fSUBz1eIUpcziG1mTpz5pz/ESlzy58sXN+BP+qXoRL5Y1ns3w
	BS0kLF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2xK-00AxQm-I3; Fri, 20 Aug 2021 11:45:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2rn-00AvRt-FF
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 11:39:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KBdCPq124127;
 Fri, 20 Aug 2021 06:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629459552;
 bh=m/r679Qxo83wv7NROTahTRMLa/GxSpkBSVD1uby0TpU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=t+l0HARobLqU2525dAIPdN+gzwqLXKhIHETSGIX6qMHiTzM3F5OtdFA7i5ryrwUii
 MF6irva1ZMvwkEqJUs0ghu550R/T4M5ORRfz03KU7g+azOhMWQllrRxuK4CmGIc3yV
 7ZZSzUa/zgZbxfvI7wG5CxGDT0EWPPNV+VUEM+rU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KBdCHN082957
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 06:39:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 06:39:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 06:39:12 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KBd7Za061904;
 Fri, 20 Aug 2021 06:39:08 -0500
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
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <403a2b26-fd95-31ab-8992-a6e6862249e6@ti.com>
Date: Fri, 20 Aug 2021 17:09:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806210840.65c06b67@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_043919_638016_9516FAB2 
X-CRM114-Status: GOOD (  20.80  )
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

SGkgTWlxdcOobCwKCk9uIDA3LzA4LzIxIDEyOjM4IGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEFwdXJ2YSwKPiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9u
IFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6MzYKPiArMDAwMDoKPiAKPj4gTWFudWZhY3R1cmVycyBs
aWtlIEdpZ2FkZXZpY2UgYW5kIFdpbmJvbmQgYXJlIGFkZGluZyBQb3dlci1vbi1SZXNldAo+PiBm
dW5jdGlvbmFsaXR5IGluIHRoZWlyIFNQSSBOQU5EIGZsYXNoIGNoaXBzLiBQb1IgaW5zdHJ1Y3Rp
b24gY29uc2lzdHMKPj4gb2YgYSA2NmggY29tbWFuZCBmb2xsb3dlZCBieSA5OWggY29tbWFuZCwg
YW5kIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBGRmgKPj4gcmVzZXQuIFRoZSByZXNldCBjb21tYW5k
IEZGaCBqdXN0IGNsZWFycyB0aGUgc3RhdHVzIG9ubHkgcmVnaXN0ZXJzLAo+PiB3aGlsZSB0aGUg
UG9SIGNvbW1hbmQgZXJhc2VzIGFsbCB0aGUgY29uZmlndXJhdGlvbnMgd3JpdHRlbiB0byB0aGUK
Pj4gZmxhc2ggYW5kIGlzIGVxdWl2YWxlbnQgdG8gYSBwb3dlci1kb3duIC0+IHBvd2VyLXVwIGN5
Y2xlLgo+Pgo+PiBBZGQgc3VwcG9ydCBmb3IgdGhlIFBvd2VyLW9uLVJlc2V0IGNvbW1hbmQgZm9y
IGFueSBmbGFzaCB0aGF0IHByb3ZpZGVzCj4+IHRoaXMgZmVhdHVyZS4KPj4KPj4gRGF0YXNoZWV0
OiBodHRwczovL3d3dy53aW5ib25kLmNvbS9leHBvcnQvc2l0ZXMvd2luYm9uZC9kYXRhc2hlZXQv
VzM1TjAxSldfRGF0YXNoZWV0X0JyaWVmLnBkZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEg
TmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+Cj4+IC0tLQo+IAo+IFsuLi5dCj4gCQkJCVwKPj4gQEAg
LTIxOCw2ICsyMzAsOCBAQCBzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2U7Cj4+ICAgICogcmVhZGluZy9w
cm9ncmFtbWluZy9lcmFzaW5nIHdoZW4gdGhlIFJFU0VUIG9jY3Vycy4gU2luY2Ugd2UgYWx3YXlz
Cj4+ICAgICogaXNzdWUgYSBSRVNFVCB3aGVuIHRoZSBkZXZpY2UgaXMgSURMRSwgNXVzIGlzIHNl
bGVjdGVkIGZvciBib3RoIGluaXRpYWwKPj4gICAgKiBhbmQgcG9sbCBkZWxheS4KPj4gKyAqIFBv
d2VyIG9uIFJlc2V0IGNhbiB0YWtlIG1heCB1cHRvIDUwMCB1cyB0byBjb21wbGV0ZSwgc28gc2xl
ZXAgZm9yIDEwMDAgdXMKPiAKPiBzL21heCB1cHRvL3VwIHRvLwo+IAoKT2theSEKCj4+ICsgKiB0
byAxMjAwIHVzIHNhZmVseS4KPiAKPiBJIGRvbid0IHJlYWxseSBnZXQgd2h5LCBpZiB0aGUgbWF4
aW11bSBpcyA1MDAsIHRoZW4gbGV0J3Mgd2FpdCBmb3IKPiA1MDB1cy4KPiAKCkdlbmVyYWxseSB3
ZSBrZWVwIHNvbWUgbWFyZ2luIGZyb20gdGhlIG1heGltdW0gdGltZSwgbm8/Cgo+PiAgICAqLwo+
PiAgICNkZWZpbmUgU1BJTkFORF9SRUFEX0lOSVRJQUxfREVMQVlfVVMJNgo+PiAgICNkZWZpbmUg
U1BJTkFORF9SRUFEX1BPTExfREVMQVlfVVMJNQo+PiBAQCAtMjI3LDYgKzI0MSw4IEBAIHN0cnVj
dCBzcGluYW5kX2RldmljZTsKPj4gICAjZGVmaW5lIFNQSU5BTkRfV1JJVEVfUE9MTF9ERUxBWV9V
UwkxNQo+PiAgICNkZWZpbmUgU1BJTkFORF9FUkFTRV9JTklUSUFMX0RFTEFZX1VTCTI1MAo+PiAg
ICNkZWZpbmUgU1BJTkFORF9FUkFTRV9QT0xMX0RFTEFZX1VTCTUwCj4+ICsjZGVmaW5lIFNQSU5B
TkRfUE9SX01JTl9ERUxBWV9VUwkxMDAwCj4+ICsjZGVmaW5lIFNQSU5BTkRfUE9SX01BWF9ERUxB
WV9VUwkxMjAwCj4+ICAgCj4+ICAgI2RlZmluZSBTUElOQU5EX1dBSVRSRFlfVElNRU9VVF9NUwk0
MDAKPj4gICAKPj4gQEAgLTM1MSw2ICszNjcsNyBAQCBzdHJ1Y3Qgc3BpbmFuZF9lY2NfaW5mbyB7
Cj4+ICAgI2RlZmluZSBTUElOQU5EX0hBU19RRV9CSVQJCUJJVCgwKQo+PiAgICNkZWZpbmUgU1BJ
TkFORF9IQVNfQ1JfRkVBVF9CSVQJCUJJVCgxKQo+PiAgICNkZWZpbmUgU1BJTkFORF9IQVNfT0NU
QUxfRFRSX0JJVAlCSVQoMikKPj4gKyNkZWZpbmUgU1BJTkFORF9IQVNfUE9SX0NNRF9CSVQJCUJJ
VCgzKQo+PiAgIAo+PiAgIC8qKgo+PiAgICAqIHN0cnVjdCBzcGluYW5kX29uZGllX2VjY19jb25m
IC0gcHJpdmF0ZSBTUEktTkFORCBvbi1kaWUgRUNDIGVuZ2luZSBzdHJ1Y3R1cmUKPiAKPiAKPiAK
PiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo+IAoKVGhhbmtzLApBcHVydmEgTmFuZGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
