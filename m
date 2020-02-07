Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E25C2D0B1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 05:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95EB5222C2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 05:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iEI0ruDb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I/k7PL9q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95EB5222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up9BiF3R0lnqHr5zlNyqw8JK2A1ezgCcZOETilYuUco=; b=iEI0ruDbptHVZT
	bAtRm2iwJTypKw229TO2t0SfwHK11Egppnhumg91AapNxONxqwsujJeAj9AWIHFptzTKNLKLPjofj
	71Bt/GPMtVIY87dHPhO/3X31aU7jD0u5AsOaUTmJE3RpSibtokB2ywDogG205CULja3EkVQosACOy
	H2wL/wPI2JKwSQuz0IejanEAqoaEVQ/+swDy/xpwp3kl0MTciWaFzRmbwoybmUb+ZKG00G3yoaXAa
	KiYuy08Dp9v6WnHqqDfF7K/BYTHj40AFepwaAn7vXYEiLFYLozN1DeQfWxPpe6kT8vRvo8qYhYblH
	uhCF2BETfJfozaRU91jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izvnW-00085q-5N; Fri, 07 Feb 2020 05:03:22 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izvnT-000857-0X
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 05:03:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01752q9W130484;
 Thu, 6 Feb 2020 23:02:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581051772;
 bh=erIMCRx9fjvY7yhdtjzBeMd16LGFEZD4T/l0xF/Y/BA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=I/k7PL9qrBl7x0JqPAU321lz7GAg0ubXo+g/zwu54r3pssMnWGLz2e0FZu/TkGp9w
 T/WfhJlPcnphGb0EdczgIBxu/wMjQaRWX2LVuaK7xgElfu90+GQGaYYE6JbFbgJKo3
 bLJ51ulwBFR/Wl9EZpCvF0x0b+mczgNPjLlKVgUw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01752pF4077144;
 Thu, 6 Feb 2020 23:02:52 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 6 Feb
 2020 23:02:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 6 Feb 2020 23:02:51 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01752mgu030727;
 Thu, 6 Feb 2020 23:02:48 -0600
Subject: Re: [PATCH v2] mtd: spi-nor: Fixup page size for S25FS-S
To: John Garry <john.garry@huawei.com>, Alexander A Sverdlin
 <alexander.sverdlin@nokia.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <20200205165736.4964-1-alexander.sverdlin@nokia.com>
 <62a35797-4e78-f6b0-de86-50004bc636ca@huawei.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <385c743e-0d8d-bcdc-7dd8-a1a619380b0a@ti.com>
Date: Fri, 7 Feb 2020 10:33:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <62a35797-4e78-f6b0-de86-50004bc636ca@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_210319_136915_E94239C7 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWxleGFuZGVyLAoKT24gMDYvMDIvMjAgNTowOCBwbSwgSm9obiBHYXJyeSB3cm90ZToKPiBP
biAwNS8wMi8yMDIwIDE2OjU3LCBBbGV4YW5kZXIgQSBTdmVyZGxpbiB3cm90ZToKPj4gRnJvbTog
QWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Abm9raWEuY29tPgo+PgpbLi4u
XQo+PiArc3RhdGljIGludCBzMjVmc19zX3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9ub3Ig
Km5vciwKPj4gK8KgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0
X2hlYWRlciwKPj4gK8KgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9iZnB0ICpiZnB0LAo+PiArwqDC
oMKgIHN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciAqcGFyYW1zKQo+PiArewo+PiArwqDC
oMKgIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvICppbmZvID0gbm9yLT5pbmZvOwo+PiArwqDCoMKg
IHU4IHJlYWRfb3Bjb2RlLCBidWY7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKg
IC8qIERlZmF1bHQgaXMgc2FmZSAqLwo+PiArwqDCoMKgIHBhcmFtcy0+cGFnZV9zaXplID0gaW5m
by0+cGFnZV9zaXplOwo+PiArCj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogQnV0IGlzIHRo
ZSBjaGlwIGNvbmZpZ3VyZWQgZm9yIG1vcmUgcGVyZm9ybWFudCA1MTIgYnl0ZXMgd3JpdGUKPj4g
cGFnZQo+PiArwqDCoMKgwqAgKiBzaXplPwo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCByZWFk
X29wY29kZSA9IG5vci0+cmVhZF9vcGNvZGU7Cj4+ICsKPj4gK8KgwqDCoCBub3ItPnJlYWRfb3Bj
b2RlID0gU1BJTk9SX09QX1JEQVI7Cj4+ICvCoMKgwqAgcmV0ID0gbm9yLT5yZWFkKG5vciwgU1BJ
Tk9SX1JFR19DUjNWLCAxLCAmYnVmKTsKPiAKPiBUaGUgcmVhZCBtZXRob2QgaXMgbm93IGdvbmUg
ZnJvbSBzdHJ1Y3Qgc3BpX25vciwgbW92ZWQgaW50bwo+IHNwaV9ub3IuY29udHJvbGxlcl9vcHMu
IEFuZCB3ZSBhbHNvIHN1cHBvcnQgc3BpX21lbSBvcHMgbm93Lgo+IAoKWWVzLCBwbGVhc2UgcmVi
YXNlIHBhdGNoIG9uIHRvcCBvZiBsYXRlc3Qgc3BpLW5vci9uZXh0IG9yIGxpbnV4LW5leHQgdHJl
ZSBhdDoKCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQv
bGludXguZ2l0IHNwaS1ub3IvbmV4dAoKUmVnYXJkcwpWaWduZXNoCgoKPiAKPj4gK8KgwqDCoCBp
ZiAoIXJldCAmJiAoYnVmICYgQ1IzVl8wMkhfVikpCj4+ICvCoMKgwqDCoMKgwqDCoCBwYXJhbXMt
PnBhZ2Vfc2l6ZSA9IDUxMjsKPj4gKwo+PiArwqDCoMKgIG5vci0+cmVhZF9vcGNvZGUgPSByZWFk
X29wY29kZTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgczI1ZnNfc19maXh1cHMgPSB7Cj4+ICvCoMKg
wqAgLnBvc3RfYmZwdCA9IHMyNWZzX3NfcG9zdF9iZnB0X2ZpeHVwcywKPj4gK307Cj4+ICsKPj4g
wqAgLyogTk9URTogZG91YmxlIGNoZWNrIGNvbW1hbmQgc2V0cyBhbmQgbWVtb3J5IG9yZ2FuaXph
dGlvbiB3aGVuIHlvdSBhZGQKPj4gwqDCoCAqIG1vcmUgbm9yIGNoaXBzLsKgIFRoaXMgY3VycmVu
dCBsaXN0IGZvY3Vzc2VzIG9uIG5ld2VyIGNoaXBzLCB3aGljaAo+PiDCoMKgICogaGF2ZSBiZWVu
IGNvbnZlcmdpbmcgb24gY29tbWFuZCBzZXRzIHdoaWNoIGluY2x1ZGluZyBKRURFQyBJRC4KPj4g
QEAgLTI1MzYsNyArMjU2OSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlf
bm9yX2lkc1tdID0gewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9SX0RVQUxf
UkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sCj4+IMKgwqDCoMKgwqAgeyAi
czI1ZmwxMjhzMSIsIElORk82KDB4MDEyMDE4LCAweDRkMDE4MCwgNjQgKiAxMDI0LCAyNTYsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9R
VUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwKPj4gLcKgwqDCoCB7ICJzMjVmbDI1NnMwIiwgSU5GTygw
eDAxMDIxOSwgMHg0ZDAwLCAyNTYgKiAxMDI0LCAxMjgsIFVTRV9DTFNSKSB9LAo+PiArwqDCoMKg
IHsgInMyNWZsMjU2czAiLCBJTkZPKDB4MDEwMjE5LCAweDRkMDAsIDI1NiAqIDEwMjQsIDEyOCwg
VVNFX0NMU1IpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmczI1ZnNfc19m
aXh1cHMsIH0sCj4+IMKgwqDCoMKgwqAgeyAiczI1ZmwyNTZzMSIsIElORk8oMHgwMTAyMTksIDB4
NGQwMSzCoCA2NCAqIDEwMjQsIDUxMiwKPj4gU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FV
QURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+PiDCoMKgwqDCoMKgIHsgInMyNWZsNTEycyIswqAgSU5G
TzYoMHgwMTAyMjAsIDB4NGQwMDgwLCAyNTYgKiAxMDI0LCAyNTYsCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfAo+PiBA
QCAtMjU0Niw3ICsyNTgwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHNwaV9u
b3JfaWRzW10gPSB7Cj4+IMKgwqDCoMKgwqAgeyAiczI1c2wxMjgwMCIsIElORk8oMHgwMTIwMTgs
IDB4MDMwMCwgMjU2ICogMTAyNCzCoCA2NCwgMCkgfSwKPj4gwqDCoMKgwqDCoCB7ICJzMjVzbDEy
ODAxIiwgSU5GTygweDAxMjAxOCwgMHgwMzAxLMKgIDY0ICogMTAyNCwgMjU2LCAwKSB9LAo+PiDC
oMKgwqDCoMKgIHsgInMyNWZsMTI5cDAiLCBJTkZPKDB4MDEyMDE4LCAweDRkMDAsIDI1NiAqIDEw
MjQswqAgNjQsCj4+IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfCBVU0Vf
Q0xTUikgfSwKPj4gLcKgwqDCoCB7ICJzMjVmbDEyOXAxIiwgSU5GTygweDAxMjAxOCwgMHg0ZDAx
LMKgIDY0ICogMTAyNCwgMjU2LAo+PiBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9S
RUFEIHwgVVNFX0NMU1IpIH0sCj4+ICvCoMKgwqAgeyAiczI1ZmwxMjlwMSIsIElORk8oMHgwMTIw
MTgsIDB4NGQwMSzCoCA2NCAqIDEwMjQsIDI1NiwKPj4gU1BJX05PUl9EVUFMX1JFQUQgfCBTUElf
Tk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZml4
dXBzID0gJnMyNWZzX3NfZml4dXBzLCB9LAo+PiDCoMKgwqDCoMKgIHsgInMyNXNsMDA0YSIswqAg
SU5GTygweDAxMDIxMizCoMKgwqDCoMKgIDAswqAgNjQgKiAxMDI0LMKgwqAgOCwgMCkgfSwKPj4g
wqDCoMKgwqDCoCB7ICJzMjVzbDAwOGEiLMKgIElORk8oMHgwMTAyMTMswqDCoMKgwqDCoCAwLMKg
IDY0ICogMTAyNCzCoCAxNiwgMCkgfSwKPj4gwqDCoMKgwqDCoCB7ICJzMjVzbDAxNmEiLMKgIElO
Rk8oMHgwMTAyMTQswqDCoMKgwqDCoCAwLMKgIDY0ICogMTAyNCzCoCAzMiwgMCkgfSwKPj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCBiL2luY2x1ZGUvbGludXgvbXRk
L3NwaS1ub3IuaAo+PiBpbmRleCA1YWJkOTFjLi43Y2UzZTc5IDEwMDY0NAo+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L210ZC9zcGktbm9yLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5v
ci5oCj4+IEBAIC0xMTYsNiArMTE2LDcgQEAKPj4gwqAgLyogVXNlZCBmb3IgU3BhbnNpb24gZmxh
c2hlcyBvbmx5LiAqLwo+PiDCoCAjZGVmaW5lIFNQSU5PUl9PUF9CUldSwqDCoMKgwqDCoMKgwqAg
MHgxN8KgwqDCoCAvKiBCYW5rIHJlZ2lzdGVyIHdyaXRlICovCj4+IMKgICNkZWZpbmUgU1BJTk9S
X09QX0NMU1LCoMKgwqDCoMKgwqDCoCAweDMwwqDCoMKgIC8qIENsZWFyIHN0YXR1cyByZWdpc3Rl
ciAxICovCj4+ICsjZGVmaW5lIFNQSU5PUl9PUF9SREFSwqDCoMKgwqDCoMKgwqAgMHg2NcKgwqDC
oCAvKiBSZWFkIEFueSBSZWdpc3RlciAqLwo+PiDCoCDCoCAvKiBVc2VkIGZvciBNaWNyb24gZmxh
c2hlcyBvbmx5LiAqLwo+PiDCoCAjZGVmaW5lIFNQSU5PUl9PUF9SRF9FVkNSwqDCoMKgwqDCoCAw
eDY1wqDCoMKgIC8qIFJlYWQgRVZDUiByZWdpc3RlciAqLwo+PiBAQCAtMTUwLDYgKzE1MSwxMCBA
QAo+PiDCoCAjZGVmaW5lIFNSMl9RVUFEX0VOX0JJVDHCoMKgwqAgQklUKDEpCj4+IMKgICNkZWZp
bmUgU1IyX1FVQURfRU5fQklUN8KgwqDCoCBCSVQoNykKPj4gwqAgKy8qIFVzZWQgZm9yIFNwYW5z
aW9uIGZsYXNoZXMgUkRBUiBjb21tYW5kIG9ubHkuICovCj4+ICsjZGVmaW5lIFNQSU5PUl9SRUdf
Q1IzVsKgwqDCoMKgwqDCoMKgIDB4ODAwMDA0Cj4+ICsjZGVmaW5lIENSM1ZfMDJIX1bCoMKgwqDC
oMKgwqDCoCBCSVQoNCnCoMKgwqAgLyogUGFnZSBCdWZmZXIgV3JhcCAqLwo+PiArCj4+IMKgIC8q
IFN1cHBvcnRlZCBTUEkgcHJvdG9jb2xzICovCj4+IMKgICNkZWZpbmUgU05PUl9QUk9UT19JTlNU
X01BU0vCoMKgwqAgR0VOTUFTSygyMywgMTYpCj4+IMKgICNkZWZpbmUgU05PUl9QUk9UT19JTlNU
X1NISUZUwqDCoMKgIDE2Cj4+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCgotLSAKUmVnYXJkcwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
