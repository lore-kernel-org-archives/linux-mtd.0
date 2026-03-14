Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7657A107BCF1
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2026 02:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9p8sp6YPauY7BhxJRZ4kD9hYzJ83jEdLYIU23gVCuJ8=; b=hldTOVM6wCAUx4cz7yRLWO5U3l
	NmqHMPCHSmeAnEoG2FxB5mxIwUoSKrsgo2L5lldzr8A3kiWHSFV7xi5fxtVBGoAQlu98VGD/2gDPA
	dzAj7nEnLoyphekOPyQrbiWsFd55l3OdQnxmmt1SxqjWa8EXRw0aOxPuQ0U5LUepxwoo9XRR1Rk4w
	76HdPLvaO1R0AX6aAxlFlald9xkMXdTfTB6fIb4GG3Qo3u+LJ0bdjBrHHg049E4JEuiGl4KhCTj7t
	HRCnGobSP1hcjiqt9UPg5Pma9Onp6WT2McCmxvNUOXykIMQabYbrJXUYKTn50ftcEfegbZNhPxxkB
	DFsozhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1EZv-00000001QKh-4AVk;
	Sat, 14 Mar 2026 02:18:11 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1EZr-00000001Q7T-1FMy
	for linux-mtd@lists.infradead.org;
	Sat, 14 Mar 2026 02:18:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PFvBnUxXOLVZUgxkiR9jrfuv1bLjj2dAxgvpamu4nvo=;
	b=algOlhXBbjWZ6WuA3YreKuwW9sIojwA7KxyCo2RgZ/m36h6fCUqhTtzzra1vyrfvaENaEyrT7
	sfcMmqF8KqDVl4baKTAGHFVhsWVYBrhuYVKxqu1AC1V9e6nwWWUboyt/lU1GvhLb2A0FXJZDPou
	D6E8lMeftwUMq93xHW4v5is=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fXlFQ6Dt3zLlT8;
	Sat, 14 Mar 2026 10:10:50 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B3A3540565;
	Sat, 14 Mar 2026 10:15:47 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Mar 2026 10:15:47 +0800
Subject: Re: [PATCH] ubifs: fix out-of-bounds write in LPT commit padding
To: Jenny Guanni Qu <qguanni@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <klaudia@vidocsecurity.com>,
	<dawid@vidocsecurity.com>
References: <20260313222213.2181408-1-qguanni@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3fa4d791-4520-0e6d-d657-89d6fc4ba5cb@huawei.com>
Date: Sat, 14 Mar 2026 10:15:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260313222213.2181408-1-qguanni@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_191808_007300_39A920A5 
X-CRM114-Status: GOOD (  20.15  )
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

5ZyoIDIwMjYvMy8xNCA2OjIyLCBKZW5ueSBHdWFubmkgUXUg5YaZ6YGTOgo+IEluIHdyaXRlX2Nu
b2RlcygpLCB3aGVuIHdyaXRpbmcgTFBUIGRhdGEgdG8gYSBMRUIsIHRoZSBjb2RlIHBhZHMgdGhl
Cj4gd3JpdGUgYnVmZmVyIHRvIG1pbl9pb19zaXplIGFsaWdubWVudCB1c2luZzoKPiAKPiAgICAg
IG1lbXNldChidWYgKyBvZmZzLCAweGZmLCBhbGVuIC0gd2xlbikKPiAKPiB3aGVyZSB3bGVuID0g
b2ZmcyAtIGZyb20gYW5kIGFsZW4gPSBBTElHTih3bGVuLCBtaW5faW9fc2l6ZSkuIFRoZQo+IGJ1
ZmZlciAoYy0+bHB0X2J1ZikgaXMgYWxsb2NhdGVkIHdpdGggc2l6ZSBjLT5sZWJfc2l6ZS4gV2hl
biBvZmZzIGlzCj4gbmVhciBsZWJfc2l6ZSBhbmQgZnJvbSBpcyBub24temVybywgdGhlIGFsaWdu
bWVudCBwYWRkaW5nIGNhbiBwdXNoCj4gdGhlIG1lbXNldCBwYXN0IHRoZSBlbmQgb2YgdGhlIGJ1
ZmZlci4KPiAKPiBGb3IgZXhhbXBsZSwgd2l0aCBsZWJfc2l6ZT00MDk2LCBvZmZzPTQwMDAsIGZy
b209MzU4NCwgbWluX2lvX3NpemU9MTAyNDoKPiAgICB3bGVuPTQxNiwgYWxlbj0xMDI0LCBwYWRk
aW5nPTYwOCBieXRlcyBhdCBvZmZzZXQgNDAwMAo+ICAgIHdyaXRlcyB0byBvZmZzZXRzIDQwMDAu
LjQ2MDcsIDUxMiBieXRlcyBwYXN0IHRoZSA0MDk2LWJ5dGUgYnVmZmVyCkhpLCBHdWFubmkKSG93
IGRvZXMgJ2Zyb20nIGJlY29tZSAnMzU4NCcod2hpY2ggaXMgbm90IGFsaWduZWQgd2l0aCBtaW5f
aW9fc2l6ZVsxMDI0XSk/CkFzIGZhciBhcyBJIGtub3csIHRoZSAnZnJvbScgY29tZXMgZnJvbSAn
Yy0+bmhlYWRfb2ZmcycsIHdoaWNoIGlzIGFsd2F5cyAKYWxpZ25lZCB3aXRoIG1pbl9pb19zaXpl
Lgo+IAo+IENsYW1wIHRoZSBwYWRkaW5nIHNpemUgdG8gbm90IGV4Y2VlZCB0aGUgYnVmZmVyIGJv
dW5kYXJ5IGluIGFsbCA0Cj4gaW5zdGFuY2VzIG9mIHRoaXMgcGF0dGVybi4KPiAKPiBUaGUgT09C
IHdyaXRlIHdhcyBjb25maXJtZWQgd2l0aCBLQVNBTiB1c2luZyBhIHRlc3QgbW9kdWxlIHRoYXQK
PiByZXByb2R1Y2VzIHRoZSBhcml0aG1ldGljIHdpdGggbWF0Y2hpbmcgYnVmZmVyIGFuZCBhbGln
bm1lbnQgdmFsdWVzLgo+IAo+IEZpeGVzOiAxZTUxNzY0YTNjMmEgKCJVQklGUzogYWRkIG5ldyBm
bGFzaCBmaWxlIHN5c3RlbSIpCj4gUmVwb3J0ZWQtYnk6IEtsYXVkaWEgS2xvYyA8a2xhdWRpYUB2
aWRvY3NlY3VyaXR5LmNvbT4KPiBSZXBvcnRlZC1ieTogRGF3aWQgTW9jemFkxYJvIDxkYXdpZEB2
aWRvY3NlY3VyaXR5LmNvbT4KPiBUZXN0ZWQtYnk6IEplbm55IEd1YW5uaSBRdSA8cWd1YW5uaUBn
bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmVubnkgR3Vhbm5pIFF1IDxxZ3Vhbm5pQGdtYWls
LmNvbT4KPiAtLS0KPiAgIGZzL3ViaWZzL2xwdF9jb21taXQuYyB8IDggKysrKy0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2ZzL3ViaWZzL2xwdF9jb21taXQuYyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+IGlu
ZGV4IDA3MzUxZmRjZTcyMi4uNzdhN2EyY2Q0MThmIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2xw
dF9jb21taXQuYwo+ICsrKyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+IEBAIC00MDIsNyArNDAy
LDcgQEAgc3RhdGljIGludCB3cml0ZV9jbm9kZXMoc3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAJ
CQl3bGVuID0gb2ZmcyAtIGZyb207Cj4gICAJCQlpZiAod2xlbikgewo+ICAgCQkJCWFsZW4gPSBB
TElHTih3bGVuLCBjLT5taW5faW9fc2l6ZSk7Cj4gLQkJCQltZW1zZXQoYnVmICsgb2ZmcywgMHhm
ZiwgYWxlbiAtIHdsZW4pOwo+ICsJCQkJbWVtc2V0KGJ1ZiArIG9mZnMsIDB4ZmYsIG1pbl90KGlu
dCwgYWxlbiAtIHdsZW4sIGMtPmxlYl9zaXplIC0gb2ZmcykpOwo+ICAgCQkJCWVyciA9IHViaWZz
X2xlYl93cml0ZShjLCBsbnVtLCBidWYgKyBmcm9tLCBmcm9tLAo+ICAgCQkJCQkJICAgICAgIGFs
ZW4pOwo+ICAgCQkJCWlmIChlcnIpCj4gQEAgLTQ2MSw3ICs0NjEsNyBAQCBzdGF0aWMgaW50IHdy
aXRlX2Nub2RlcyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIAkJaWYgKG9mZnMgKyBjLT5sc2F2
ZV9zeiA+IGMtPmxlYl9zaXplKSB7Cj4gICAJCQl3bGVuID0gb2ZmcyAtIGZyb207Cj4gICAJCQlh
bGVuID0gQUxJR04od2xlbiwgYy0+bWluX2lvX3NpemUpOwo+IC0JCQltZW1zZXQoYnVmICsgb2Zm
cywgMHhmZiwgYWxlbiAtIHdsZW4pOwo+ICsJCQltZW1zZXQoYnVmICsgb2ZmcywgMHhmZiwgbWlu
X3QoaW50LCBhbGVuIC0gd2xlbiwgYy0+bGViX3NpemUgLSBvZmZzKSk7Cj4gICAJCQllcnIgPSB1
Ymlmc19sZWJfd3JpdGUoYywgbG51bSwgYnVmICsgZnJvbSwgZnJvbSwgYWxlbik7Cj4gICAJCQlp
ZiAoZXJyKQo+ICAgCQkJCXJldHVybiBlcnI7Cj4gQEAgLTQ4Nyw3ICs0ODcsNyBAQCBzdGF0aWMg
aW50IHdyaXRlX2Nub2RlcyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIAkJaWYgKG9mZnMgKyBj
LT5sdGFiX3N6ID4gYy0+bGViX3NpemUpIHsKPiAgIAkJCXdsZW4gPSBvZmZzIC0gZnJvbTsKPiAg
IAkJCWFsZW4gPSBBTElHTih3bGVuLCBjLT5taW5faW9fc2l6ZSk7Cj4gLQkJCW1lbXNldChidWYg
KyBvZmZzLCAweGZmLCBhbGVuIC0gd2xlbik7Cj4gKwkJCW1lbXNldChidWYgKyBvZmZzLCAweGZm
LCBtaW5fdChpbnQsIGFsZW4gLSB3bGVuLCBjLT5sZWJfc2l6ZSAtIG9mZnMpKTsKPiAgIAkJCWVy
ciA9IHViaWZzX2xlYl93cml0ZShjLCBsbnVtLCBidWYgKyBmcm9tLCBmcm9tLCBhbGVuKTsKPiAg
IAkJCWlmIChlcnIpCj4gICAJCQkJcmV0dXJuIGVycjsKPiBAQCAtNTEwLDcgKzUxMCw3IEBAIHN0
YXRpYyBpbnQgd3JpdGVfY25vZGVzKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+ICAgCS8qIFdyaXRl
IHJlbWFpbmluZyBkYXRhIGluIGJ1ZmZlciAqLwo+ICAgCXdsZW4gPSBvZmZzIC0gZnJvbTsKPiAg
IAlhbGVuID0gQUxJR04od2xlbiwgYy0+bWluX2lvX3NpemUpOwo+IC0JbWVtc2V0KGJ1ZiArIG9m
ZnMsIDB4ZmYsIGFsZW4gLSB3bGVuKTsKPiArCW1lbXNldChidWYgKyBvZmZzLCAweGZmLCBtaW5f
dChpbnQsIGFsZW4gLSB3bGVuLCBjLT5sZWJfc2l6ZSAtIG9mZnMpKTsKPiAgIAllcnIgPSB1Ymlm
c19sZWJfd3JpdGUoYywgbG51bSwgYnVmICsgZnJvbSwgZnJvbSwgYWxlbik7Cj4gICAJaWYgKGVy
cikKPiAgIAkJcmV0dXJuIGVycjsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
