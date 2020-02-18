Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19702C34031
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 04:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E140620722
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 04:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVT5nH/d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YS2E3Y89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E140620722
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vbVaCioHg8yboll/F81shfRILCqme51DzvT4MbFXUg=; b=WVT5nH/dRrgJvL
	RsrmW+n8Ad/4xPjchevfbRyOkBEe3ru+ss7Okj0/KVcNg1I4OJ983awfNc0YT8BeMf8xlA7t+dsrc
	2ccmudsq2TOposH84rhRmjbJ9zzXtubyK5FOQoY26ZUEPQq0ICxEOEsLkaK44IyHH0UJgTp+czbtf
	/cPlo+rI3GWLu8RyZf4ENRqbmdK/PHp9FGgXvM/iPXhBrteIQfW7yIWqfDQfM7H1bIIdaS1N4ECdg
	EJtSdHaykUUIYX07Dsx5uogEUaVPVerxV2Wk4ALqkR2PJF2Bax1LJ8NpCUZ+f+KyCHYPZlOguNVN7
	CwdLtgunr2xvmqDU39XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3usk-0006oC-IW; Tue, 18 Feb 2020 04:53:14 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3ush-0006no-EA
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 04:53:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01I4qW3l124315;
 Mon, 17 Feb 2020 22:52:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582001552;
 bh=OFRxooe9h3KsikOUaCvlPYQYVXr5H+31/6ElIndnyoI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YS2E3Y89G52EGyFiL9+PnCHXJi98uWAt9EZ6zZzPAgg6n6K6DxRRcn0KILASxpf7g
 yPg5lQ0w8XUUqRXWCMteje3J0zCt8xl5KMZz4HsWeBPG306ETZM0SMk7wfs8yv5jys
 fudNJjloM9bCvKih4N9BVyPhWWZ8h4dhUXuP8kj0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01I4qW3Z000661;
 Mon, 17 Feb 2020 22:52:32 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 22:52:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 22:52:32 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01I4qS3m027141;
 Mon, 17 Feb 2020 22:52:28 -0600
Subject: Re: [PATCH v2] mtd: spi-nor: Fixup page size for S25FS-S
To: John Garry <john.garry@huawei.com>, Alexander A Sverdlin
 <alexander.sverdlin@nokia.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <20200205165736.4964-1-alexander.sverdlin@nokia.com>
 <62a35797-4e78-f6b0-de86-50004bc636ca@huawei.com>
 <385c743e-0d8d-bcdc-7dd8-a1a619380b0a@ti.com>
 <0c894f19-6e19-c90a-afe7-e7f2a086b436@huawei.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0b5af315-5e1b-31ef-6cb9-eefefc86b425@ti.com>
Date: Tue, 18 Feb 2020 10:23:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0c894f19-6e19-c90a-afe7-e7f2a086b436@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_205311_562285_AE4ED4BF 
X-CRM114-Status: GOOD (  19.41  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, chenxiang <chenxiang66@hisilicon.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi8wMi8yMCAxMTozMCBwbSwgSm9obiBHYXJyeSB3cm90ZToKPiBPbiAwNy8wMi8yMDIw
IDA1OjAzLCBWaWduZXNoIFJhZ2hhdmVuZHJhIHdyb3RlOgo+PiBIaSBBbGV4YW5kZXIsCj4+Cj4+
IE9uIDA2LzAyLzIwIDU6MDggcG0sIEpvaG4gR2Fycnkgd3JvdGU6Cj4+PiBPbiAwNS8wMi8yMDIw
IDE2OjU3LCBBbGV4YW5kZXIgQSBTdmVyZGxpbiB3cm90ZToKPj4+PiBGcm9tOiBBbGV4YW5kZXIg
U3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBub2tpYS5jb20+Cj4+Pj4KPj4gWy4uLl0KWy4u
Ll0KPiAKPiBJIGRvbid0IG1lYW4gdG8gaGlqYWNrIHRoaXMgdGhyZWFkLCBidXQgSSBoYXZlIHRy
aWVkIHRvIGVuYWJsZSBRVUFEIG1vZGUKPiBmb3IgcGFydCBzMjVmbDEyOXAxLCBhbmQgaXQgZmFp
bHMgaW4gc3BpX25vcl93cml0ZV8xNmJpdF9jcl9hbmRfY2hlY2soKToKPiAKPiBbIDQ3LjI2MzM2
NV0gc3BpLW5vciBzcGktUFJQMDAwMTowMDogQ1I6IHJlYWQgYmFjayB0ZXN0IGZhaWxlZAo+IFsg
NDcuMzA2NTY3XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBxdWFkIG1vZGUgbm90IHN1cHBvcnRl
ZAo+IFsgNDcuMzIyNDEzXSBzcGktbm9yOiBwcm9iZSBvZiBzcGktUFJQMDAwMTowMCBmYWlsZWQg
d2l0aCBlcnJvciAtNQo+IAo+IEhhY2tpbmcgdGhlIGZsYWdzIHRvIHNldCBTTk9SX0ZfTk9fUkVB
RF9DUiwgYW5kIGF0IGxlYXN0IEkgY2FuCj4gc3VjY2Vzc2Z1bGx5IHByb2JlIHRoZSBkcml2ZXIu
Cj4gCj4gRG9lcyBhbnlvbmUga25vdyBpZiB0aGlzIHBhcnQgZG9lcyBub3Qgc3VwcG9ydCByZWFk
aW5nIHRoZSBjb25maWcKPiByZWdpc3Rlci4gVGhlIGxpbWl0ZWQgZGF0YXNoZWV0IGhlcmUgZG9l
c24ndCBtZW50aW9uIGl0LCBBRkFJQ1Q6Cj4gCj4gaHR0cHM6Ly93d3cuY3lwcmVzcy5jb20vZmls
ZS8xOTY4NTEvZG93bmxvYWQKCkFib3ZlIGRhdGFzaGVldCBpcyBmb3IgczI1ZmwxMjhwLgoKUGVy
LCBzMjVmbDEyOXAgZGF0YXNoZWV0WzFdLCBwYXJ0IGRvZXMgc3VwcG9ydCAweDM1IChTUElOT1Jf
T1BfUkRDUikKY29tbWFuZCBhbmQgc3VwcG9ydCAxNmJpdCB3cml0ZSBzdGF0dXMgcmVnaXN0ZXIg
Y29tbWFuZCAoMHgxKQoKQ291bGQgeW91IGRlYnVnIGZ1cnRoZXIgYW5kIHNlZSB3aGF0IGV4YWN0
bHkgZmFpbHMgdG8gbWF0Y2ggd2hlbgpyZWFkIGJhY2sgZmFpbHM/CgpbMV1odHRwczovL3d3dy5j
eXByZXNzLmNvbS9maWxlLzE5NzEyMS9kb3dubG9hZAoKClJlZ2FyZHMKVmlnbmVzaAoKPiAKPiBU
aGFua3MsCj4gSm9obgo+IAo+Pgo+Pj4KPj4+PiArwqDCoMKgIGlmICghcmV0ICYmIChidWYgJiBD
UjNWXzAySF9WKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcGFyYW1zLT5wYWdlX3NpemUgPSA1MTI7
Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgbm9yLT5yZWFkX29wY29kZSA9IHJlYWRfb3Bjb2RlOwo+Pj4+
ICsKPj4+PiArwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgczI1ZnNfc19maXh1cHMgPSB7Cj4+Pj4gK8KgwqDC
oCAucG9zdF9iZnB0ID0gczI1ZnNfc19wb3N0X2JmcHRfZml4dXBzLAo+Pj4+ICt9Owo+Pj4+ICsK
Pj4+PiDCoMKgIC8qIE5PVEU6IGRvdWJsZSBjaGVjayBjb21tYW5kIHNldHMgYW5kIG1lbW9yeSBv
cmdhbml6YXRpb24gd2hlbgo+Pj4+IHlvdSBhZGQKPj4+PiDCoMKgwqAgKiBtb3JlIG5vciBjaGlw
cy7CoCBUaGlzIGN1cnJlbnQgbGlzdCBmb2N1c3NlcyBvbiBuZXdlciBjaGlwcywgd2hpY2gKPj4+
PiDCoMKgwqAgKiBoYXZlIGJlZW4gY29udmVyZ2luZyBvbiBjb21tYW5kIHNldHMgd2hpY2ggaW5j
bHVkaW5nIEpFREVDIElELgo+Pj4+IEBAIC0yNTM2LDcgKzI1NjksOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9IHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfCBVU0Vf
Q0xTUikgfSwKPj4+PiDCoMKgwqDCoMKgwqAgeyAiczI1ZmwxMjhzMSIsIElORk82KDB4MDEyMDE4
LCAweDRkMDE4MCwgNjQgKiAxMDI0LCAyNTYsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0s
Cj4+Pj4gLcKgwqDCoCB7ICJzMjVmbDI1NnMwIiwgSU5GTygweDAxMDIxOSwgMHg0ZDAwLCAyNTYg
KiAxMDI0LCAxMjgsCj4+Pj4gVVNFX0NMU1IpIH0sCj4+Pj4gK8KgwqDCoCB7ICJzMjVmbDI1NnMw
IiwgSU5GTygweDAxMDIxOSwgMHg0ZDAwLCAyNTYgKiAxMDI0LCAxMjgsIFVTRV9DTFNSKQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmczI1ZnNfc19maXh1cHMsIH0sCj4+
Pj4gwqDCoMKgwqDCoMKgIHsgInMyNWZsMjU2czEiLCBJTkZPKDB4MDEwMjE5LCAweDRkMDEswqAg
NjQgKiAxMDI0LCA1MTIsCj4+Pj4gU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVB
RCB8IFVTRV9DTFNSKSB9LAo+Pj4+IMKgwqDCoMKgwqDCoCB7ICJzMjVmbDUxMnMiLMKgIElORk82
KDB4MDEwMjIwLCAweDRkMDA4MCwgMjU2ICogMTAyNCwgMjU2LAo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8Cj4+
Pj4gQEAgLTI1NDYsNyArMjU4MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBz
cGlfbm9yX2lkc1tdID0gewo+Pj4+IMKgwqDCoMKgwqDCoCB7ICJzMjVzbDEyODAwIiwgSU5GTygw
eDAxMjAxOCwgMHgwMzAwLCAyNTYgKiAxMDI0LMKgIDY0LCAwKSB9LAo+Pj4+IMKgwqDCoMKgwqDC
oCB7ICJzMjVzbDEyODAxIiwgSU5GTygweDAxMjAxOCwgMHgwMzAxLMKgIDY0ICogMTAyNCwgMjU2
LCAwKSB9LAo+Pj4+IMKgwqDCoMKgwqDCoCB7ICJzMjVmbDEyOXAwIiwgSU5GTygweDAxMjAxOCwg
MHg0ZDAwLCAyNTYgKiAxMDI0LMKgIDY0LAo+Pj4+IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05P
Ul9RVUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwKPj4+PiAtwqDCoMKgIHsgInMyNWZsMTI5cDEiLCBJ
TkZPKDB4MDEyMDE4LCAweDRkMDEswqAgNjQgKiAxMDI0LCAyNTYsCj4+Pj4gU1BJX05PUl9EVUFM
X1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+Pj4+ICvCoMKgwqAgeyAi
czI1ZmwxMjlwMSIsIElORk8oMHgwMTIwMTgsIDB4NGQwMSzCoCA2NCAqIDEwMjQsIDI1NiwKPj4+
PiBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZpeHVwcyA9ICZzMjVmc19zX2ZpeHVwcywgfSwKPj4+
PiDCoMKgwqDCoMKgwqAgeyAiczI1c2wwMDRhIizCoCBJTkZPKDB4MDEwMjEyLMKgwqDCoMKgwqAg
MCzCoCA2NCAqIDEwMjQswqDCoCA4LCAwKSB9LAo+Pj4+IMKgwqDCoMKgwqDCoCB7ICJzMjVzbDAw
OGEiLMKgIElORk8oMHgwMTAyMTMswqDCoMKgwqDCoCAwLMKgIDY0ICogMTAyNCzCoCAxNiwgMCkg
fSwKPj4+PiDCoMKgwqDCoMKgwqAgeyAiczI1c2wwMTZhIizCoCBJTkZPKDB4MDEwMjE0LMKgwqDC
oMKgwqAgMCzCoCA2NCAqIDEwMjQswqAgMzIsIDApIH0sCj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbXRkL3NwaS1ub3IuaCBiL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaAo+Pj4+
IGluZGV4IDVhYmQ5MWMuLjdjZTNlNzkgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9t
dGQvc3BpLW5vci5oCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCj4+Pj4g
QEAgLTExNiw2ICsxMTYsNyBAQAo+Pj4+IMKgwqAgLyogVXNlZCBmb3IgU3BhbnNpb24gZmxhc2hl
cyBvbmx5LiAqLwo+Pj4+IMKgwqAgI2RlZmluZSBTUElOT1JfT1BfQlJXUsKgwqDCoMKgwqDCoMKg
IDB4MTfCoMKgwqAgLyogQmFuayByZWdpc3RlciB3cml0ZSAqLwo+Pj4+IMKgwqAgI2RlZmluZSBT
UElOT1JfT1BfQ0xTUsKgwqDCoMKgwqDCoMKgIDB4MzDCoMKgwqAgLyogQ2xlYXIgc3RhdHVzIHJl
Z2lzdGVyIDEgKi8KPj4+PiArI2RlZmluZSBTUElOT1JfT1BfUkRBUsKgwqDCoMKgwqDCoMKgIDB4
NjXCoMKgwqAgLyogUmVhZCBBbnkgUmVnaXN0ZXIgKi8KPj4+PiDCoMKgIMKgIC8qIFVzZWQgZm9y
IE1pY3JvbiBmbGFzaGVzIG9ubHkuICovCj4+Pj4gwqDCoCAjZGVmaW5lIFNQSU5PUl9PUF9SRF9F
VkNSwqDCoMKgwqDCoCAweDY1wqDCoMKgIC8qIFJlYWQgRVZDUiByZWdpc3RlciAqLwo+Pj4+IEBA
IC0xNTAsNiArMTUxLDEwIEBACj4+Pj4gwqDCoCAjZGVmaW5lIFNSMl9RVUFEX0VOX0JJVDHCoMKg
wqAgQklUKDEpCj4+Pj4gwqDCoCAjZGVmaW5lIFNSMl9RVUFEX0VOX0JJVDfCoMKgwqAgQklUKDcp
Cj4+Pj4gwqDCoCArLyogVXNlZCBmb3IgU3BhbnNpb24gZmxhc2hlcyBSREFSIGNvbW1hbmQgb25s
eS4gKi8KPj4+PiArI2RlZmluZSBTUElOT1JfUkVHX0NSM1bCoMKgwqDCoMKgwqDCoCAweDgwMDAw
NAo+Pj4+ICsjZGVmaW5lIENSM1ZfMDJIX1bCoMKgwqDCoMKgwqDCoCBCSVQoNCnCoMKgwqAgLyog
UGFnZSBCdWZmZXIgV3JhcCAqLwo+Pj4+ICsKPj4+PiDCoMKgIC8qIFN1cHBvcnRlZCBTUEkgcHJv
dG9jb2xzICovCj4+Pj4gwqDCoCAjZGVmaW5lIFNOT1JfUFJPVE9fSU5TVF9NQVNLwqDCoMKgIEdF
Tk1BU0soMjMsIDE2KQo+Pj4+IMKgwqAgI2RlZmluZSBTTk9SX1BST1RPX0lOU1RfU0hJRlTCoMKg
wqAgMTYKPj4+Pgo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dAo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCj4+Cj4gCgotLSAKUmVnYXJkcwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
