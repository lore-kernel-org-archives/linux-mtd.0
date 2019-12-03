Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BITCOIN_SPAM_02,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C323DC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 13:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BBE7206DF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 13:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eLsQnc0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BBE7206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7lZSZDrrw0Ub0ZMwjOuaBrOISds9gj+vwkR+zhi5ji8=; b=eLsQnc0vTfiw1x2seIpeTXQud
	3rArmNfDsfsPRpYDTtJImUPdvzgFDJFVn2sNnVvpV0yTuNZrKofmtsGTm4ckywu/6xs/pp/NhoiVX
	AKZNGhoKTaPmEB4R8LxO0BTbibGxr/ZXWZ7qyaHGuMEKZ85a3L5Rej1PpHqjYKGG9jTfR3aaR3UIM
	ss4+qOuSm9WEfw2LJp49e8ZtIAq6NIpJ3sZjgFhpGHoOmyuNM4z5OuC5F2QguLvhoILA+8cEVyDye
	vHPaIx7FAhMgU0/ZTY1aYGSlZb9EbOn3Iev31YlycEkiBJsk5uFggnCCAhXaM8VqrEWYAExe7ernS
	qdvUOrtFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic8gT-0005LR-3Z; Tue, 03 Dec 2019 13:57:45 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic8gP-0005KT-Ku
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 13:57:43 +0000
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 8BB0B2AC705B7CFA866B;
 Tue,  3 Dec 2019 13:57:36 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Dec 2019 13:57:36 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 13:57:36 +0000
Subject: Re: flash_lock issue for n25q 128mb spi nor part
From: John Garry <john.garry@huawei.com>
To: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
 <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
 <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
Message-ID: <b73c8a25-a58d-a1f1-f68c-0ba35a5c7c51@huawei.com>
Date: Tue, 3 Dec 2019 13:57:35 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_055741_840147_B36BF931 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: broonie@kernel.org, fengsheng5@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDMvMTIvMjAxOSAxMjozNSwgSm9obiBHYXJyeSB3cm90ZToKPiBPbiAwMy8xMi8yMDE5IDEy
OjI3LCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEyLzMv
MTkgMjowNSBQTSwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIAo+Pj4gYi9kcml2ZXJzL210ZC9z
cGktbm9yL3NwaS1ub3IuYwo+Pj4gaW5kZXggZjRhZmUxMjNlOWRjLi5mMTQ5MGM3YjVjYjkgMTAw
NjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+Pj4gKysrIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPj4+IEBAIC0xMDMzLDEwICsxMDMzLDE5IEBAIHN0
YXRpYyBpbnQgCj4+PiBzcGlfbm9yX3dyaXRlXzE2Yml0X3NyX2FuZF9jaGVjayhzdHJ1Y3Qgc3Bp
X25vciAqbm9yLCB1OCBzcjEpCj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBzcl9jclswXSA9IHNy
MTsKPj4+Cj4+PiArwqDCoMKgwqDCoMKgIGRldl9lcnIobm9yLT5kZXYsICJiZWZvcmUgd3JpdGU6
IHNyX2NyWzBdID0gJTAyeCwgc3JfY3JbMV0gPSAKPj4+ICUwMnhcbiIsCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzcl9jclswXSwgc3JfY3JbMV0pOwo+Pj4gKwo+Pj4gwqDCoMKg
wqDCoMKgwqDCoCByZXQgPSBzcGlfbm9yX3dyaXRlX3NyKG5vciwgc3JfY3IsIDIpOwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJldDsKPj4+Cj4+PiArwqDCoMKgwqDCoMKgIHJldCA9IHNwaV9ub3JfcmVhZF9z
cihub3IsICZzcl9jclswXSk7Cj4+PiArwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDC
oCBkZXZfZXJyKG5vci0+ZGV2LCAicmVhZCBiYWNrIHNyMTogc3JfY3JbMF0gPSAlMDJ4XG4iLCBz
cl9jclswXSk7Cj4+PiArCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChub3ItPmZsYWdzICYgU05P
Ul9GX05PX1JFQURfQ1IpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gMDsKPj4+Cj4+PiBAQCAtMTA0Niw2ICsxMDU1LDggQEAgc3RhdGljIGludCAKPj4+IHNwaV9u
b3Jfd3JpdGVfMTZiaXRfc3JfYW5kX2NoZWNrKHN0cnVjdCBzcGlfbm9yICpub3IsIHU4IHNyMSkK
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pgo+Pj4gK8KgwqDCoMKgwqDCoCBkZXZfZXJyKG5vci0+
ZGV2LCAicmVhZCBiYWNrIHNyMjogc3JfY3JbMV0gPSAlMDJ4XG4iLCBzcl9jclsxXSk7Cj4+PiAr
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChjcl93cml0dGVuICE9IHNyX2NyWzFdKSB7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKG5vci0+ZGV2LCAiQ1I6IHJl
YWQgYmFjayB0ZXN0IGZhaWxlZFwKPj4KPj4gT24gbjI1cTI1NmEgSSBvYnRhaW46Cj4+Cj4+IHJv
b3RAc2FtYTVkMi14cGxhaW5lZC1zZDp+IyBmbGFzaF9sb2NrIC1sIC9kZXYvbXRkMQo+PiBzcGkt
bm9yIHNwaTEuMDogYmVmb3JlIHdyaXRlOiBzcl9jclswXSA9IDllLCBzcl9jclsxXSA9IGZmCj4+
IHNwaS1ub3Igc3BpMS4wOiByZWFkIGJhY2sgc3IxOiBzcl9jclswXSA9IDAyCj4+IHNwaS1ub3Ig
c3BpMS4wOiByZWFkIGJhY2sgc3IyOiBzcl9jclsxXSA9IGZmCj4+Cj4gCj4gU28gaGVyZSBpcyB3
aGF0IEkgZ2V0Ogo+IAo+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIGZsYXNoX2xvY2sgLWwgL2Rl
di9tdGQwCj4gW8KgIDEwOS4wMzc0OTJdIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGJlZm9yZSB3
cml0ZTogc3JfY3JbMF0gPSA5ZSwgCj4gc3JfY3JbMV0gPSAwMAo+IFvCoCAxMDkuMDQ0NzY5XSBz
cGktbm9yIHNwaS1QUlAwMDAxOjAwOiByZWFkIGJhY2sgc3IxOiBzcl9jclswXSA9IDAyCj4gW8Kg
IDEwOS4wNTA3OTBdIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IHJlYWQgYmFjayBzcjI6IHNyX2Ny
WzFdID0gMDAKPiAKPiAKPj4gdGhlIDE2IGJpdCB3cml0ZSBTUiBkb2VzIG5vdCBleGVjdXRlIGNv
cnJlY3RseSBhbmQgdGhlIFdFIHJlbWFpbnMgc2V0LiBJZgo+PiBuZWl0aGVyIG9mIHRoZSBtaWNy
b24gZmxhc2hlcyBkbyBub3Qgc3VwcG9ydCB0aGUgMTYgYml0IHdyaXRlIFNSLCB3ZSAKPj4gY2Fu
IGFkZCBhCj4+IGNvbmRpdGlvbiBiYXNlZCBvbiBNRlIuIExldCBtZSBjaGVjayBmZXcgZGF0YXNo
ZWV0cy4KPj4KPiAKPiBPSywgdGhhbmtzLgoKSGkgVHVkb3IsCgpTb21ldGhpbmcgZWxzZSB3aGlj
aCBJIHdhbnRlZCB0byBhc2sgaXMgd2h5IHdlIGRvbid0IGNoZWNrIHRoZSBGU1IgYWZ0ZXIgCmEg
d3JpdGUgY29tbWFuZCBmb3IgdGhhdCBwYXJ0PwoKV2l0aG91dCBpdCwgaWYgdGhlIGZsYXNoIGlz
IGxvY2tlZCwgYSBmbGFzaCB3cml0ZSByZXBvcnRzIG5vIGVycm9yLCAKd2hpY2ggY291bGQgYmUg
bWF5YmUgbWlzbGVhZGluZy4KCkEgbW9yZSByZWFsIHByb2JsZW0gaXMgdGhhdCBJIGZpbmQgdGhh
dCBTUi5XRUwgaXMgbm90IGNsZWFyZWQgd2hlbiB3ZSAKYXR0ZW1wdCB0byB3cml0ZSB3aGVuIHRo
ZSBmbGFzaCBpcyBsb2NrZWQsIGFuZCB0aGlzIGNhdXNlcyBpc3N1ZXMgd2hlbiAKd2UgYXR0ZW1w
dCB0byByZXNldCB0aGUgU1IuCgpIZXJlJ3MgYW4gZXhhbXBsZSBmbG93ICh3aXRoIG15IGhhY2sg
dG8gc3RvcCB1c2luZyAxNmIgU1IgbWV0aG9kKToKCnJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIGZs
YXNoX2xvY2sgLWwgL2Rldi9tdGQwCnJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyBl
cmFzZSAvZGV2L210ZDAgMHhlMDAwMDAgNDA5NgpbICAgNjkuNjUwNjQyXSBzcGktbm9yIHNwaS1Q
UlAwMDAxOjAwOiBhdCAweGUwMDAwMCwgbGVuIDQwOTYKRXJhc2VkIDQwOTYgYnl0ZXMgZnJvbSBh
ZGRyZXNzIDB4MDBlMDAwMDAgaW4gZmxhc2gKcm9vdEB1YnVudHU6L2hvbWUvam9obiMgbXRkX2Rl
YnVnIHdyaXRlIC9kZXYvbXRkMCAweGUwMDAwMCA0MDk2IGR1bXA0MDk2ClsgICA3Ny4wOTM3NTVd
IHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IHRvIDB4MDBlMDAwMDAsIGxlbiA0MDk2CkNvcGllZCA0
MDk2IGJ5dGVzIGZyb20gZHVtcDQwOTYgdG8gYWRkcmVzcyAweDAwZTAwMDAwIGluIGZsYXNoCnJv
b3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyByZWFkIC9kZXYvbXRkMCAweGUwMDAwMCA0
MDk2IHRlbXAKWyAgIDgyLjE2MjQ0NV0gc3BpLW5vciBzcGktUFJQMDAwMTowMDogZnJvbSAweDAw
ZTAwMDAwLCBsZW4gNDA5NgpDb3BpZWQgNDA5NiBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMGUwMDAw
MCBpbiBmbGFzaCB0byB0ZW1wCnJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIGZsYXNoX2xvY2sgLXUg
L2Rldi9tdGQwClsgICA4Ny41NTg0MzVdIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IFNSMTogcmVh
ZCBiYWNrIHRlc3QgZmFpbGVkCmZsYXNoX2xvY2s6IGVycm9yITogY291bGQgbm90IHVubG9jayBk
ZXZpY2U6IC9kZXYvbXRkMAoKICAgICAgICAgICAgIGVycm9yIDUgKElucHV0L291dHB1dCBlcnJv
cikKcm9vdEB1YnVudHU6L2hvbWUvam9obiMKClVubG9jayByZXBvcnRzIGFuIGVycm9yIGFzIHRo
ZSB0aGUgcmVhZCBiYWNrIHRlc3QgaW4gCnNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9jaGVjaygpIGZh
aWxzIGFzIHRoZSBTUi5XRUwgaGFzIG5ldmVyIGJlZW4gY2xlYXJlZC4KCkknbSBqdXN0IHNheWlu
ZyB0aGlzIHdoaWxlIGl0J3MgZnJlc2ggaW4gbXkgaGVhZCAtIEkgZG9uJ3Qgd2FudCB0byBzZWVt
IApwdXNoeSA6KQoKVGhhbmtzLApKb2huCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
