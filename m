Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A865C2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 18:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F65620661
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 18:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6Y5AuFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F65620661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O/bR3IUtCPHfKKu4u1/FIHrYv+CgzAprVTx2j9o1f74=; b=h6Y5AuFozs+7iZWEmmg48A1NO
	VigIn0Lw4sHDpF+9UG+aJVgwWuQ1DiXC2Emg1nx7TlIjP0n4BTALqDeXKjFpH/iYxpnKKiJ1/3uZg
	Pyx8tkP1YZlvMh+6Bs2814na3GdMrlIwtEgvuh9GBK/ux6SsFuamRXwE+n4l9A4iDCLQVW9tu29DB
	8v9dhuRAGPGhuBKbiqvrh/jdw6R+Y66KjwLu6X8ChfVOply+cnXeA58feuecPVvP7Q7hm9B2cXLmU
	ZyWWt/T/OjKqZi/wh3zlSL8yA2xe+/hjfpHDdkLPBmBePDUfEq60SWCEQPUW2FBrAq47cnxNkTHBt
	4wD5VYH7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1wJK-000722-9m; Wed, 12 Feb 2020 18:00:30 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1wJF-0006zd-IW
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 18:00:28 +0000
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id C0F5658CB99D5FE7F742;
 Wed, 12 Feb 2020 18:00:20 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 12 Feb 2020 18:00:20 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 12 Feb
 2020 18:00:20 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Fixup page size for S25FS-S
To: Vignesh Raghavendra <vigneshr@ti.com>, Alexander A Sverdlin
 <alexander.sverdlin@nokia.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <20200205165736.4964-1-alexander.sverdlin@nokia.com>
 <62a35797-4e78-f6b0-de86-50004bc636ca@huawei.com>
 <385c743e-0d8d-bcdc-7dd8-a1a619380b0a@ti.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <0c894f19-6e19-c90a-afe7-e7f2a086b436@huawei.com>
Date: Wed, 12 Feb 2020 18:00:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <385c743e-0d8d-bcdc-7dd8-a1a619380b0a@ti.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml720-chm.china.huawei.com (10.201.108.71) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_100025_764258_7E4FFDC2 
X-CRM114-Status: GOOD (  17.91  )
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
 Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDcvMDIvMjAyMCAwNTowMywgVmlnbmVzaCBSYWdoYXZlbmRyYSB3cm90ZToKPiBIaSBBbGV4
YW5kZXIsCj4gCj4gT24gMDYvMDIvMjAgNTowOCBwbSwgSm9obiBHYXJyeSB3cm90ZToKPj4gT24g
MDUvMDIvMjAyMCAxNjo1NywgQWxleGFuZGVyIEEgU3ZlcmRsaW4gd3JvdGU6Cj4+PiBGcm9tOiBB
bGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBub2tpYS5jb20+Cj4+Pgo+IFsu
Li5dCj4+PiArc3RhdGljIGludCBzMjVmc19zX3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9u
b3IgKm5vciwKPj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IHNmZHBfcGFyYW1ldGVyX2hlYWRlciAq
YmZwdF9oZWFkZXIsCj4+PiArwqDCoMKgIGNvbnN0IHN0cnVjdCBzZmRwX2JmcHQgKmJmcHQsCj4+
PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciAqcGFyYW1zKQo+Pj4gK3sK
Pj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gKmluZm8gPSBub3ItPmluZm87Cj4+
PiArwqDCoMKgIHU4IHJlYWRfb3Bjb2RlLCBidWY7Cj4+PiArwqDCoMKgIGludCByZXQ7Cj4+PiAr
Cj4+PiArwqDCoMKgIC8qIERlZmF1bHQgaXMgc2FmZSAqLwo+Pj4gK8KgwqDCoCBwYXJhbXMtPnBh
Z2Vfc2l6ZSA9IGluZm8tPnBhZ2Vfc2l6ZTsKPj4+ICsKPj4+ICvCoMKgwqAgLyoKPj4+ICvCoMKg
wqDCoCAqIEJ1dCBpcyB0aGUgY2hpcCBjb25maWd1cmVkIGZvciBtb3JlIHBlcmZvcm1hbnQgNTEy
IGJ5dGVzIHdyaXRlCj4+PiBwYWdlCj4+PiArwqDCoMKgwqAgKiBzaXplPwo+Pj4gK8KgwqDCoMKg
ICovCj4+PiArwqDCoMKgIHJlYWRfb3Bjb2RlID0gbm9yLT5yZWFkX29wY29kZTsKPj4+ICsKPj4+
ICvCoMKgwqAgbm9yLT5yZWFkX29wY29kZSA9IFNQSU5PUl9PUF9SREFSOwo+Pj4gK8KgwqDCoCBy
ZXQgPSBub3ItPnJlYWQobm9yLCBTUElOT1JfUkVHX0NSM1YsIDEsICZidWYpOwo+Pgo+PiBUaGUg
cmVhZCBtZXRob2QgaXMgbm93IGdvbmUgZnJvbSBzdHJ1Y3Qgc3BpX25vciwgbW92ZWQgaW50bwo+
PiBzcGlfbm9yLmNvbnRyb2xsZXJfb3BzLiBBbmQgd2UgYWxzbyBzdXBwb3J0IHNwaV9tZW0gb3Bz
IG5vdy4KPj4KPiAKPiBZZXMsIHBsZWFzZSByZWJhc2UgcGF0Y2ggb24gdG9wIG9mIGxhdGVzdCBz
cGktbm9yL25leHQgb3IgbGludXgtbmV4dCB0cmVlIGF0Ogo+IAo+IGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHNwaS1ub3IvbmV4dAo+
IAo+IFJlZ2FyZHMKPiBWaWduZXNoCj4gCgpJIGRvbid0IG1lYW4gdG8gaGlqYWNrIHRoaXMgdGhy
ZWFkLCBidXQgSSBoYXZlIHRyaWVkIHRvIGVuYWJsZSBRVUFEIG1vZGUgCmZvciBwYXJ0IHMyNWZs
MTI5cDEsIGFuZCBpdCBmYWlscyBpbiBzcGlfbm9yX3dyaXRlXzE2Yml0X2NyX2FuZF9jaGVjaygp
OgoKWyA0Ny4yNjMzNjVdIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IENSOiByZWFkIGJhY2sgdGVz
dCBmYWlsZWQKWyA0Ny4zMDY1NjddIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IHF1YWQgbW9kZSBu
b3Qgc3VwcG9ydGVkClsgNDcuMzIyNDEzXSBzcGktbm9yOiBwcm9iZSBvZiBzcGktUFJQMDAwMTow
MCBmYWlsZWQgd2l0aCBlcnJvciAtNQoKSGFja2luZyB0aGUgZmxhZ3MgdG8gc2V0IFNOT1JfRl9O
T19SRUFEX0NSLCBhbmQgYXQgbGVhc3QgSSBjYW4gCnN1Y2Nlc3NmdWxseSBwcm9iZSB0aGUgZHJp
dmVyLgoKRG9lcyBhbnlvbmUga25vdyBpZiB0aGlzIHBhcnQgZG9lcyBub3Qgc3VwcG9ydCByZWFk
aW5nIHRoZSBjb25maWcgCnJlZ2lzdGVyLiBUaGUgbGltaXRlZCBkYXRhc2hlZXQgaGVyZSBkb2Vz
bid0IG1lbnRpb24gaXQsIEFGQUlDVDoKCmh0dHBzOi8vd3d3LmN5cHJlc3MuY29tL2ZpbGUvMTk2
ODUxL2Rvd25sb2FkCgpUaGFua3MsCkpvaG4KCj4gCj4+Cj4+PiArwqDCoMKgIGlmICghcmV0ICYm
IChidWYgJiBDUjNWXzAySF9WKSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBwYXJhbXMtPnBhZ2Vfc2l6
ZSA9IDUxMjsKPj4+ICsKPj4+ICvCoMKgwqAgbm9yLT5yZWFkX29wY29kZSA9IHJlYWRfb3Bjb2Rl
Owo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIHMyNWZzX3NfZml4dXBzID0gewo+Pj4gK8KgwqDC
oCAucG9zdF9iZnB0ID0gczI1ZnNfc19wb3N0X2JmcHRfZml4dXBzLAo+Pj4gK307Cj4+PiArCj4+
PiAgwqAgLyogTk9URTogZG91YmxlIGNoZWNrIGNvbW1hbmQgc2V0cyBhbmQgbWVtb3J5IG9yZ2Fu
aXphdGlvbiB3aGVuIHlvdSBhZGQKPj4+ICDCoMKgICogbW9yZSBub3IgY2hpcHMuwqAgVGhpcyBj
dXJyZW50IGxpc3QgZm9jdXNzZXMgb24gbmV3ZXIgY2hpcHMsIHdoaWNoCj4+PiAgwqDCoCAqIGhh
dmUgYmVlbiBjb252ZXJnaW5nIG9uIGNvbW1hbmQgc2V0cyB3aGljaCBpbmNsdWRpbmcgSkVERUMg
SUQuCj4+PiBAQCAtMjUzNiw3ICsyNTY5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9p
bmZvIHNwaV9ub3JfaWRzW10gPSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJ
X05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+Pj4gIMKg
wqDCoMKgwqAgeyAiczI1ZmwxMjhzMSIsIElORk82KDB4MDEyMDE4LCAweDRkMDE4MCwgNjQgKiAx
MDI0LCAyNTYsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJX05PUl9EVUFMX1JF
QUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+Pj4gLcKgwqDCoCB7ICJzMjVm
bDI1NnMwIiwgSU5GTygweDAxMDIxOSwgMHg0ZDAwLCAyNTYgKiAxMDI0LCAxMjgsIFVTRV9DTFNS
KSB9LAo+Pj4gK8KgwqDCoCB7ICJzMjVmbDI1NnMwIiwgSU5GTygweDAxMDIxOSwgMHg0ZDAwLCAy
NTYgKiAxMDI0LCAxMjgsIFVTRV9DTFNSKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZp
eHVwcyA9ICZzMjVmc19zX2ZpeHVwcywgfSwKPj4+ICDCoMKgwqDCoMKgIHsgInMyNWZsMjU2czEi
LCBJTkZPKDB4MDEwMjE5LCAweDRkMDEswqAgNjQgKiAxMDI0LCA1MTIsCj4+PiBTUElfTk9SX0RV
QUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sCj4+PiAgwqDCoMKgwqDC
oCB7ICJzMjVmbDUxMnMiLMKgIElORk82KDB4MDEwMjIwLCAweDRkMDA4MCwgMjU2ICogMTAyNCwg
MjU2LAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQSV9OT1JfRFVBTF9SRUFEIHwg
U1BJX05PUl9RVUFEX1JFQUQgfAo+Pj4gQEAgLTI1NDYsNyArMjU4MCw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lkc1tdID0gewo+Pj4gIMKgwqDCoMKgwqAgeyAi
czI1c2wxMjgwMCIsIElORk8oMHgwMTIwMTgsIDB4MDMwMCwgMjU2ICogMTAyNCzCoCA2NCwgMCkg
fSwKPj4+ICDCoMKgwqDCoMKgIHsgInMyNXNsMTI4MDEiLCBJTkZPKDB4MDEyMDE4LCAweDAzMDEs
wqAgNjQgKiAxMDI0LCAyNTYsIDApIH0sCj4+PiAgwqDCoMKgwqDCoCB7ICJzMjVmbDEyOXAwIiwg
SU5GTygweDAxMjAxOCwgMHg0ZDAwLCAyNTYgKiAxMDI0LMKgIDY0LAo+Pj4gU1BJX05PUl9EVUFM
X1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+Pj4gLcKgwqDCoCB7ICJz
MjVmbDEyOXAxIiwgSU5GTygweDAxMjAxOCwgMHg0ZDAxLMKgIDY0ICogMTAyNCwgMjU2LAo+Pj4g
U1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+Pj4g
K8KgwqDCoCB7ICJzMjVmbDEyOXAxIiwgSU5GTygweDAxMjAxOCwgMHg0ZDAxLMKgIDY0ICogMTAy
NCwgMjU2LAo+Pj4gU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9D
TFNSKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZpeHVwcyA9ICZzMjVmc19zX2ZpeHVw
cywgfSwKPj4+ICDCoMKgwqDCoMKgIHsgInMyNXNsMDA0YSIswqAgSU5GTygweDAxMDIxMizCoMKg
wqDCoMKgIDAswqAgNjQgKiAxMDI0LMKgwqAgOCwgMCkgfSwKPj4+ICDCoMKgwqDCoMKgIHsgInMy
NXNsMDA4YSIswqAgSU5GTygweDAxMDIxMyzCoMKgwqDCoMKgIDAswqAgNjQgKiAxMDI0LMKgIDE2
LCAwKSB9LAo+Pj4gIMKgwqDCoMKgwqAgeyAiczI1c2wwMTZhIizCoCBJTkZPKDB4MDEwMjE0LMKg
wqDCoMKgwqAgMCzCoCA2NCAqIDEwMjQswqAgMzIsIDApIH0sCj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9tdGQvc3BpLW5vci5oIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCj4+
PiBpbmRleCA1YWJkOTFjLi43Y2UzZTc5IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9t
dGQvc3BpLW5vci5oCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmgKPj4+IEBA
IC0xMTYsNiArMTE2LDcgQEAKPj4+ICDCoCAvKiBVc2VkIGZvciBTcGFuc2lvbiBmbGFzaGVzIG9u
bHkuICovCj4+PiAgwqAgI2RlZmluZSBTUElOT1JfT1BfQlJXUsKgwqDCoMKgwqDCoMKgIDB4MTfC
oMKgwqAgLyogQmFuayByZWdpc3RlciB3cml0ZSAqLwo+Pj4gIMKgICNkZWZpbmUgU1BJTk9SX09Q
X0NMU1LCoMKgwqDCoMKgwqDCoCAweDMwwqDCoMKgIC8qIENsZWFyIHN0YXR1cyByZWdpc3RlciAx
ICovCj4+PiArI2RlZmluZSBTUElOT1JfT1BfUkRBUsKgwqDCoMKgwqDCoMKgIDB4NjXCoMKgwqAg
LyogUmVhZCBBbnkgUmVnaXN0ZXIgKi8KPj4+ICDCoCDCoCAvKiBVc2VkIGZvciBNaWNyb24gZmxh
c2hlcyBvbmx5LiAqLwo+Pj4gIMKgICNkZWZpbmUgU1BJTk9SX09QX1JEX0VWQ1LCoMKgwqDCoMKg
IDB4NjXCoMKgwqAgLyogUmVhZCBFVkNSIHJlZ2lzdGVyICovCj4+PiBAQCAtMTUwLDYgKzE1MSwx
MCBAQAo+Pj4gIMKgICNkZWZpbmUgU1IyX1FVQURfRU5fQklUMcKgwqDCoCBCSVQoMSkKPj4+ICDC
oCAjZGVmaW5lIFNSMl9RVUFEX0VOX0JJVDfCoMKgwqAgQklUKDcpCj4+PiAgwqAgKy8qIFVzZWQg
Zm9yIFNwYW5zaW9uIGZsYXNoZXMgUkRBUiBjb21tYW5kIG9ubHkuICovCj4+PiArI2RlZmluZSBT
UElOT1JfUkVHX0NSM1bCoMKgwqDCoMKgwqDCoCAweDgwMDAwNAo+Pj4gKyNkZWZpbmUgQ1IzVl8w
MkhfVsKgwqDCoMKgwqDCoMKgIEJJVCg0KcKgwqDCoCAvKiBQYWdlIEJ1ZmZlciBXcmFwICovCj4+
PiArCj4+PiAgwqAgLyogU3VwcG9ydGVkIFNQSSBwcm90b2NvbHMgKi8KPj4+ICDCoCAjZGVmaW5l
IFNOT1JfUFJPVE9fSU5TVF9NQVNLwqDCoMKgIEdFTk1BU0soMjMsIDE2KQo+Pj4gIMKgICNkZWZp
bmUgU05PUl9QUk9UT19JTlNUX1NISUZUwqDCoMKgIDE2Cj4+Pgo+Pgo+Pgo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
