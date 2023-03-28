Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D79C761A6
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaheFjQNVUk70RT1ESfjIfs2yWXjaH4E08ex8o9Jg6Y=; b=X5re7oV2QvPOTz
	ZUct0OEu4kryM8SJtQfIGKcYJM+8MoKRqcN9aN/NDpsqHJrGNI6LXKJjNRsW6v3sVQXwxayOcpgFx
	Wybts+7YE7AGSkuIjHyKWMGAkYGoM/W9PPiIjBQXO96Lq0uT5O7qc2HJGz1dpo6qzWnr34SYgBLSk
	43xqf/7mJP80G9/7pDbu+bRlqSuMxguYuP2NWem+2R2jE2ASDSm/in/oJiCApOaBsUfK/kX0o5W86
	oSUqnwAGiFuvaPN88kjQecdY88LGPMLryEep1dMmSBd2XtkF4nYN61TzoViJtVqyl5auG6w7WoUjP
	L5pEfHCyv8677WySgkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5nE-00DmN1-2j;
	Tue, 28 Mar 2023 09:39:04 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5nC-00DmM3-08
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 09:39:03 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S8TEUN024888;
	Tue, 28 Mar 2023 11:38:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OYiJ//G5VBRLV8o+Mq0MH5geZvdUpWk4yWOPx1fr6wY=;
 b=FViwJHg88F706F2Xm2584pc0apTKG8Lwk7DEyTKg0t+GCkBBZC1q1byehgjuhDB3kWNy
 BRamH0hv0rw3pKM8FgUMWp+E8HvXTqrdbFg7/3Oc1RZqnDw2/XKifLQURRCrzlY7YI7L
 V+ZPuYOkS4hQ2lnUOTB2+hlM9XIq16yKXWAAmBRv0OdUF7IrEolqL2AjPoJH427jPpCo
 HuUeXZzoicYb1t+u9LC7wMzU7wMOvFMFLZqa+0wpzvcsrz0xPBAvklnn+bG38H8anPkW
 YkCG3LYbeXj5/pgx9vaHRSdIKg3/BhnyRauGpGBxQI0XNLjhNqszZvJlA0w8i4fwVqTp Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkvs4rhgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:38:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1855310002A;
	Tue, 28 Mar 2023 11:38:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 112BE21160E;
	Tue, 28 Mar 2023 11:38:55 +0200 (CEST)
Received: from [10.48.0.175] (10.48.0.175) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 11:38:54 +0200
Message-ID: <4fa90fd4-c8c3-6621-4aed-51f916fbddc8@foss.st.com>
Date: Tue, 28 Mar 2023 11:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use timings.mode instead
 of checking tRC_min
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
 <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
 <20230327124313.1ccd3d66@xps-13>
 <70d0a8b6-62c2-fa3e-df5c-f86ba75484d0@linaro.org>
 <6759a843-409b-d9fe-8a00-ed6d69144aaf@foss.st.com>
 <20230328095633.188aff27@xps-13>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20230328095633.188aff27@xps-13>
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_023902_373033_9FD23296 
X-CRM114-Status: GOOD (  25.19  )
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

SGkgTWlxdWVsLAoKT24gMy8yOC8yMyAwOTo1NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBD
aHJpc3RvcGhlLAo+IAo+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBU
dWUsIDI4IE1hciAyMDIzIDA5OjI3OjU1ICswMjAwOgo+IAo+PiBIZWxsbyBNaXF1ZWwsCj4+Cj4+
IE9uIDMvMjcvMjMgMTM6MDYsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDMv
MjcvMjMgMTE6NDMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4gSGkgVHVkb3IsCj4+Pj4KPj4+
PiB0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBNYXIgMjAyMyAxMToz
MDo1MSArMDEwMDoKPj4+PiAgIAo+Pj4+PiBPbiAzLzI3LzIzIDEwOjQ3LCBDaHJpc3RvcGhlIEtl
cmVsbG8gd3JvdGU6Cj4+Pj4+PiBUaGlzIHBhdGNoIGlzIHVzaW5nIHRpbWluZ3MubW9kZSB2YWx1
ZSBpbnN0ZWFkIG9mIGNoZWNraW5nIHRSQ19taW4gdGltaW5nCj4+Pj4+PiBmb3IgRURPIG1vZGUg
c3VwcG9ydC4KPj4+Pj4+ICAgICA+Pj4KPj4+Pj4gRml4ZXMgYW5kIENjIHRvIHN0YWJsZSBoZXJl
IHRvbywgYXMgeW91J2QgbGlrZSB0byBoYXZlIHRoaXMgYmFja3BvcnRlZAo+Pj4+PiBhcyB3ZWxs
LCBkb24ndCB5b3U/Cj4+Pj4KPj4+PiBBY3R1YWxseSB0aGUgcmVhc29uIHdoeSBDaHJpc3RvcGhl
IHNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcyBpcwo+Pj4+IGJlY2F1c2UgdGltaW5ncy5tb2Rl
IHdhcyBpbnRyb2R1Y2VkIHJhdGhlciBsYXRlbHksIGhlIHdhbnRlZCB0aGUgc2FtZQo+Pj4+IHBh
dGNoIHRvIGFwcGx5IG9uIGFsbCBzdGFibGUga2VybmVscywgaGUgYWN0dWFsbHkgYXNrZWQgZm9y
IHRoYXQgc3BsaXQKPj4+PiBhbmQgSSBhZ3JlZWQgKGFub3RoZXIgc29sdXRpb24gd291bGQgaGF2
ZSBiZWVuIHRvIHNlbmQgdGhpcyBjdXJyZW50Cj4+Pj4gcGF0Y2ggdG8gTGludXMgYW5kIGhhdmUg
dGhlIG90aGVyIHZlcnNpb24gc2VudCB0byBzdGFibGUsIGJ1dCBpdAo+Pj4+IHJlcXVpcmVzIGEg
Yml0IG9mIHNjaGVkdWxpbmcgb24gYm90aCBlbmRzKS4KPj4+Pgo+Pj4+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDMyNzEwMTE1Ni4wZWMyODE2YUB4cHMtMTMv
VC8jdAo+Pj4KPj4+IFJpZ2h0LCBJIHVuZGVyc3Rvb2QgdGhhdCBmcm9tIHRoZSBiZWdpbm5pbmcu
IElmIGl0IHdlcmUgdG8gbWUsIEkgd291bGQKPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
ICN2NS40KyBmb3IgdGhlIGZpcnN0IHBhdGNoIGFuZAo+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcgI3Y1LjEwKyBmb3IgdGhlIHNlY29uZC4KPj4+Cj4+PiBTbyBmaXJzdCB3b3VsZCBiZSBh
bG9uZSBqdXN0IGluIHY1LjQsIGFuZCBzdGFydGluZyB3aXRoIHY1LjEwIHdlJ2xsIGhhdmUKPj4+
IGJvdGggYW5kIHdlJ2xsIG1pbWljIHdoYXQgd2UgY3VycmVudGx5IGhhdmUgaW4gdXBzdHJlYW0g
bWFpbmxpbmUuCj4+PiAgICAKPj4KPj4gSSBjYW4gc2VuZCBhIFYzIHdpdGggY2MgdGFnIGFkZGVk
IGFzIHBlciBUdWRvcidzIHN1Z2dlc3Rpb24uCj4+IE9yIGNjIHRhZyB3aWxsIGJlIGFkZGVkIHdo
ZW4gdGhlIHBhdGNoZXMgd2lsbCBiZSBhcHBsaWVkPwo+IAo+IEknbGwgaGFuZGxlIGl0LCBubyBw
cm9ibGVtLiBJcyBpdCBmaW5lIGlmIEkgc2VuZCB0aGlzIGFzIHBhcnQgb2YgdGhlCj4gbmV4dCBt
ZXJnZSB3aW5kb3cgb3IgZG8geW91IGV4cGVjdCB0aGlzIGZpeCB0byBiZSBhcHBsaWVkIGVhcmxp
ZXI/IEkKPiBqdXN0IHNlbnQgbXkgZml4ZXMgUFIgb24gTW9uZGF5IG1vcm5pbmcuCj4gCgpZZXMs
IGl0IGlzIGZpbmUuIFRoaXMgcGF0Y2ggc2V0IGNhbiBiZSBhcHBsaWVkIG9uIG5leHQgbWVyZ2Ug
d2luZG93LgoKUmVnYXJkcywKQ2hyaXN0b3BoZSBLZXJlbGxvLgoKPj4KPj4gUmVnYXJkcywKPj4g
Q2hyaXN0b3BoZSBLZXJlbGxvLgo+Pgo+Pj4+ICAgCj4+Pj4+ICAgCj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4K
Pj4+Pj4KPj4+Pj4gUmV2aWV3ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGlu
YXJvLm9yZz4KPj4+Pj4gICAKPj4+Pj4+IC0tLQo+Pj4+Pj4gICAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAyICstCj4+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4+Pj4gaW5kZXggM2FiYjYzZDAwYTBiLi45ZTc0YmNkOTBh
YWEgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25h
bmQuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMK
Pj4+Pj4+IEBAIC0xNTMxLDcgKzE1MzEsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3Nl
dHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+Pj4+Pj4g
ICAgCWlmIChJU19FUlIoc2RydCkpCj4+Pj4+PiAgICAJCXJldHVybiBQVFJfRVJSKHNkcnQpOwo+
Pj4+Pj4gICAgPj4+PiAtCWlmIChzZHJ0LT50UkNfbWluIDwgMzAwMDApCj4+Pj4+PiArCWlmIChj
b25mLT50aW1pbmdzLm1vZGUgPiAzKQo+Pj4+Pj4gICAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+
Pj4+PiAgICA+Pj4+ICAgCWlmIChjaGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkp
Cj4+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBNaXF1w6hsCj4gCj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
