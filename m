Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7483C7619A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RX0J2q6owvlbHTiLcJ4Lc4wtoltZbAQnuO0Rt4M/p5g=; b=YIt0EQ+YWZHpaW
	OLGabscY9wzGoI12G5Ep4AopmgL2EUiDMxgX3Q3D6Oa9gPU6A5+Ui9qtLLCCI7SCPacJFMLKmG9ad
	4GFu/J9KzAZYzAHyFh+IIwv/fs1Igg9iNMVg17TnV7sSFYNSjZ/viZdLRLMnLO/AtP45D2NWuKtMh
	KNyEj5mSHPELQ5M6ru+aaL69PXOx1waMJ65amWA3kQPbMRXCvCZMjYRmGHxOhji0BmLt/q2OGUDGm
	/zDiDWqM7lXy4WrQqf2lmr+Lj7D52S63082Lg/v1ido4VE6SiEMkeL7F/5v4FDog+zE07edw/eMla
	3Z1uv50rms96C5xVeQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pghoM-00A9oW-1I;
	Mon, 27 Mar 2023 08:02:38 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pghoJ-00A9mJ-0a
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 08:02:36 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R6sWV4013750;
	Mon, 27 Mar 2023 10:02:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8SOh+0CZP8Ph/v0q/dPQLROo4mWgelJIRrYo46gyeXw=;
 b=Whce/u/tZ96+3XJoc3pFU2ncJhNj2fofHNy3trM2ByPAayNltmwndj5UbiTugaO5KhCU
 Z9odsqiDCDgqLUiKufHNu/ThRwb00J4RLZu/nC8+KsE9uav3mv8evTPKsJTaE0F5aZVx
 58mvTYN/7EeE/hL+Saf9d2Af2Q2qmuHmM5lQA3D83F427VXh9HHfsVSCp7kuhuXV8qO3
 WGTyQKsX0PprWLllH4+srQmDtL7kz102ElDknqTQizpM9K6lVyFayrg/MKlLKQ9Janv0
 +lZL+Ttz4g5sLcIHKXJOclnXFQpbdA+5/66TTr87sz+vV4VzBYSYDY3ojAoDxHqaVdu1 fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsqw911s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 10:02:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C992510003A;
	Mon, 27 Mar 2023 10:02:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A50352115E2;
	Mon, 27 Mar 2023 10:02:14 +0200 (CEST)
Received: from [10.48.0.175] (10.48.0.175) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 10:02:14 +0200
Message-ID: <fcb600af-88dc-55a7-917e-4cf4673c2973@foss.st.com>
Date: Mon, 27 Mar 2023 10:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: do not support EDO mode
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20230324160918.826452-1-christophe.kerello@foss.st.com>
 <20230324172528.4d3ccd4b@xps-13>
 <f4c32aa5-e5b1-6465-7708-ef0281baf0af@foss.st.com>
Content-Language: en-US
In-Reply-To: <f4c32aa5-e5b1-6465-7708-ef0281baf0af@foss.st.com>
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_010235_507298_15FC7EF0 
X-CRM114-Status: GOOD (  18.37  )
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

SGVsbG8gTWlxdWVsLAoKT24gMy8yNC8yMyAxNzozNCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3Rl
Ogo+IEhlbGxvIE1pcXVlbCwKPiAKPiBPbiAzLzI0LzIzIDE3OjI1LCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+PiBIaSBDaHJpc3RvcGhlLAo+Pgo+PiBjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5j
b20gd3JvdGUgb24gRnJpLCAyNCBNYXIgMjAyMyAxNzowOToxOCArMDEwMDoKPj4KPj4+IEZNQzIg
Y29udHJvbGxlciBkb2VzIG5vdCBzdXBwb3J0IEVETyBtb2RlICh0aW1pbmdzIG1vZGUgNCBhbmQg
NSkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhl
LmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4+PiBGaXhlczogMmNkNDU3ZjMyOGMxICgibXRkOiByYXdu
YW5kOiBzdG0zMl9mbWMyOiBhZGQgU1RNMzIgRk1DMiBOQU5EIAo+Pj4gZmxhc2ggY29udHJvbGxl
ciBkcml2ZXIiKQo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMy
X25hbmQuYyB8IDMgKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5j
IAo+Pj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4gaW5kZXgg
NWQ2MjcwNDhjNDIwLi4zYWJiNjNkMDBhMGIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMKPj4+IEBAIC0xNTMxLDYgKzE1MzEsOSBAQCBzdGF0aWMgaW50IAo+
Pj4gc3RtMzJfZm1jMl9uZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
IGludCBjaGlwbnIsCj4+PiDCoMKgwqDCoMKgIGlmIChJU19FUlIoc2RydCkpCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoc2RydCk7Cj4+PiArwqDCoMKgIGlmIChzZHJ0LT50
UkNfbWluIDwgMzAwMDApCj4+Cj4+IFdoZW4gaW50cm9kdWNpbmcgTlYtRERSIHN1cHBvcnQgd2Ug
YXMgd2VsbCBhZGRlZCBhIHRpbWluZ3MubW9kZSBmaWVsZCwKPj4gcGVyaGFwcyB5b3UgY291bGQg
dXNlIGl0Pwo+IAo+IFllcywgSSBjYW4gdXNlIGl0LiBJdCB3aWxsIGJlIGRvbmUgaW4gVjIuCj4g
Cj4gUmVnYXJkcywKPiBDaHJpc3RvcGhlIEtlcmVsbG8uCj4gCgpJIGhhZCBhIGxvb2sgYXQgS2Vy
bmVsIExUUywgYW5kIHRpbWluZ3MubW9kZSB3YXMgaW50cm9kdWNlZCBvbiBLZXJuZWwgCkxUUyA1
LjEwLiBBcyB0aGlzIHBhdGNoIGhhcyBhbHNvIHRvIGJlIGFwcGxpZWQgb24gS2VybmVsIExUUyA1
LjQsIG15IApwcm9wb3NhbCBpcyB0byBzZW5kIGEgbmV3IHBhdGNoIHNldC4gVGhlIGZpcnN0IHBh
dGNoIHdpbGwgYmUgdGhlIGN1cnJlbnQgCnBhdGNoIChmaXggZm9yIGFsbCBLZXJuZWwgTFRTKSBh
bmQgdGhlIHNlY29uZCBwYXRjaCB3aWxsIHVzZSAKdGltaW5ncy5tb2RlIGluc3RlYWQgb2YgY2hl
Y2tpbmcgdFJDX21pbiB0aW1pbmdzIGZvciBuZXh0IEtlcm5lbCAKZGVsaXZlcnkuIElzIHRoaXMg
cHJvcG9zYWwgYWNjZXB0YWJsZT8KClJlZ2FyZHMsCkNocmlzdG9waGUgS2VyZWxsby4KCj4+Cj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+Pj4gKwo+Pj4gwqDCoMKgwqDC
oCBpZiAoY2hpcG5yID09IE5BTkRfREFUQV9JRkFDRV9DSEVDS19PTkxZKQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAwOwo+Pgo+Pgo+PiBUaGFua3MsCj4+IE1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
