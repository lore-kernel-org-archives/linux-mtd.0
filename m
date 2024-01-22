Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17857C47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYr6vLtf0X+ofkvbDlW/WyAIhrDeOmUFH7GuE9FhKiY=; b=wxTyNXkajza3UMkQ9WFKR7n03G
	xUkyqjb3hlRH7wqbdcpQw56/qI7lugswPPIQf4GY5gFjXFp1atA1vV4ovpyunr32RYq5XBVJWa2K5
	zYRetgn3cZt/TiYzPPa5quedj1sC1xcWkg5jcXh9XSaZ0+fFuM+L7h6J25h6EcriBt+KF9Ht9xvWj
	v9p0GD+Vd3L0ia6D6lhWkA1YK7appMd1cb8+ZVpdHpNKHaSrIJkbnGBu+j45sE9ohn8VAW6uxDCfR
	Ophv2/I30BsV8bI7soWT7lCIV70+k5fp9nIABNj+G+ElrDc9ixSmKp4wx/i/gS47//gAGJ3BC8g+a
	kQYwMjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtD2-00C3Dz-1h;
	Mon, 22 Jan 2024 12:15:24 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtCz-00C3Cm-2I
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 12:15:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TJTf417xHzvVFq;
	Mon, 22 Jan 2024 20:13:48 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C49D18006C;
	Mon, 22 Jan 2024 20:15:18 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 20:15:17 +0800
Subject: Re: [PATCH 13/15] ubifs: Pass a folio into ubifs_bulk_read() and
 ubifs_do_bulk_read()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-14-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <882c8aaf-cdc1-cda4-9ea5-62cea681d7d9@huawei.com>
Date: Mon, 22 Jan 2024 20:15:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-14-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_041522_081288_CA997B20 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gVGhpcyBz
YXZlcyBhIHNpbmdsZSBjYWxsIHRvIGNvbXBvdW5kX2hlYWQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiAtLS0KPiAg
IGZzL3ViaWZzL2ZpbGUuYyB8IDI4ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiAKClJldmll
d2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5kZXggZjM0MzcxNDM2
YTg0Li44Y2FkMWZlOWM1MGYgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZmlsZS5jCj4gKysrIGIv
ZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTcwNSwxNSArNzA1LDE1IEBAIHN0YXRpYyBpbnQgcG9wdWxh
dGVfcGFnZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAgKiB1
Ymlmc19kb19idWxrX3JlYWQgLSBkbyBidWxrLXJlYWQuCj4gICAgKiBAYzogVUJJRlMgZmlsZS1z
eXN0ZW0gZGVzY3JpcHRpb24gb2JqZWN0Cj4gICAgKiBAYnU6IGJ1bGstcmVhZCBpbmZvcm1hdGlv
bgo+IC0gKiBAcGFnZTE6IGZpcnN0IHBhZ2UgdG8gcmVhZAo+ICsgKiBAZm9saW8xOiBmaXJzdCBm
b2xpbyB0byByZWFkCj4gICAgKgo+ICAgICogUmV0dXJuczogJTEgaWYgdGhlIGJ1bGstcmVhZCBp
cyBkb25lLCBvdGhlcndpc2UgJTAgaXMgcmV0dXJuZWQuCj4gICAgKi8KPiAgIHN0YXRpYyBpbnQg
dWJpZnNfZG9fYnVsa19yZWFkKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgYnVfaW5mbyAq
YnUsCj4gLQkJCSAgICAgIHN0cnVjdCBwYWdlICpwYWdlMSkKPiArCQkJICAgICAgc3RydWN0IGZv
bGlvICpmb2xpbzEpCj4gICB7Cj4gLQlwZ29mZl90IG9mZnNldCA9IHBhZ2UxLT5pbmRleCwgZW5k
X2luZGV4Owo+IC0Jc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcgPSBwYWdlMS0+bWFwcGlu
ZzsKPiArCXBnb2ZmX3Qgb2Zmc2V0ID0gZm9saW8xLT5pbmRleCwgZW5kX2luZGV4Owo+ICsJc3Ry
dWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcgPSBmb2xpbzEtPm1hcHBpbmc7Cj4gICAJc3RydWN0
IGlub2RlICppbm9kZSA9IG1hcHBpbmctPmhvc3Q7Cj4gICAJc3RydWN0IHViaWZzX2lub2RlICp1
aSA9IHViaWZzX2lub2RlKGlub2RlKTsKPiAgIAlpbnQgZXJyLCBwYWdlX2lkeCwgcGFnZV9jbnQs
IHJldCA9IDAsIG4gPSAwOwo+IEBAIC03NjMsMTEgKzc2MywxMSBAQCBzdGF0aWMgaW50IHViaWZz
X2RvX2J1bGtfcmVhZChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IGJ1X2luZm8gKmJ1LAo+
ICAgCQkJZ290byBvdXRfd2FybjsKPiAgIAl9Cj4gICAKPiAtCWVyciA9IHBvcHVsYXRlX3BhZ2Uo
YywgcGFnZTEsIGJ1LCAmbik7Cj4gKwllcnIgPSBwb3B1bGF0ZV9wYWdlKGMsICZmb2xpbzEtPnBh
Z2UsIGJ1LCAmbik7Cj4gICAJaWYgKGVycikKPiAgIAkJZ290byBvdXRfd2FybjsKPiAgIAo+IC0J
dW5sb2NrX3BhZ2UocGFnZTEpOwo+ICsJZm9saW9fdW5sb2NrKGZvbGlvMSk7Cj4gICAJcmV0ID0g
MTsKPiAgIAo+ICAgCWlzaXplID0gaV9zaXplX3JlYWQoaW5vZGUpOwo+IEBAIC04MTIsNyArODEy
LDcgQEAgc3RhdGljIGludCB1Ymlmc19kb19idWxrX3JlYWQoc3RydWN0IHViaWZzX2luZm8gKmMs
IHN0cnVjdCBidV9pbmZvICpidSwKPiAgIAo+ICAgLyoqCj4gICAgKiB1Ymlmc19idWxrX3JlYWQg
LSBkZXRlcm1pbmUgd2hldGhlciB0byBidWxrLXJlYWQgYW5kLCBpZiBzbywgZG8gaXQuCj4gLSAq
IEBwYWdlOiBwYWdlIGZyb20gd2hpY2ggdG8gc3RhcnQgYnVsay1yZWFkLgo+ICsgKiBAZm9saW86
IGZvbGlvIGZyb20gd2hpY2ggdG8gc3RhcnQgYnVsay1yZWFkLgo+ICAgICoKPiAgICAqIFNvbWUg
Zmxhc2ggbWVkaWEgYXJlIGNhcGFibGUgb2YgcmVhZGluZyBzZXF1ZW50aWFsbHkgYXQgZmFzdGVy
IHJhdGVzLiBVQklGUwo+ICAgICogYnVsay1yZWFkIGZhY2lsaXR5IGlzIGRlc2lnbmVkIHRvIHRh
a2UgYWR2YW50YWdlIG9mIHRoYXQsIGJ5IHJlYWRpbmcgaW4gb25lCj4gQEAgLTgyMSwxMiArODIx
LDEyIEBAIHN0YXRpYyBpbnQgdWJpZnNfZG9fYnVsa19yZWFkKHN0cnVjdCB1Ymlmc19pbmZvICpj
LCBzdHJ1Y3QgYnVfaW5mbyAqYnUsCj4gICAgKgo+ICAgICogUmV0dXJuczogJTEgaWYgYSBidWxr
LXJlYWQgaXMgZG9uZSBhbmQgJTAgb3RoZXJ3aXNlLgo+ICAgICovCj4gLXN0YXRpYyBpbnQgdWJp
ZnNfYnVsa19yZWFkKHN0cnVjdCBwYWdlICpwYWdlKQo+ICtzdGF0aWMgaW50IHViaWZzX2J1bGtf
cmVhZChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+ICAgewo+IC0Jc3RydWN0IGlub2RlICppbm9kZSA9
IHBhZ2UtPm1hcHBpbmctPmhvc3Q7Cj4gKwlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZm9saW8tPm1h
cHBpbmctPmhvc3Q7Cj4gICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBpbm9kZS0+aV9zYi0+c19m
c19pbmZvOwo+ICAgCXN0cnVjdCB1Ymlmc19pbm9kZSAqdWkgPSB1Ymlmc19pbm9kZShpbm9kZSk7
Cj4gLQlwZ29mZl90IGluZGV4ID0gcGFnZS0+aW5kZXgsIGxhc3RfcGFnZV9yZWFkID0gdWktPmxh
c3RfcGFnZV9yZWFkOwo+ICsJcGdvZmZfdCBpbmRleCA9IGZvbGlvLT5pbmRleCwgbGFzdF9wYWdl
X3JlYWQgPSB1aS0+bGFzdF9wYWdlX3JlYWQ7Cj4gICAJc3RydWN0IGJ1X2luZm8gKmJ1Owo+ICAg
CWludCBlcnIgPSAwLCBhbGxvY2F0ZWQgPSAwOwo+ICAgCj4gQEAgLTg3NCw4ICs4NzQsOCBAQCBz
dGF0aWMgaW50IHViaWZzX2J1bGtfcmVhZChzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgIAo+ICAgCWJ1
LT5idWZfbGVuID0gYy0+bWF4X2J1X2J1Zl9sZW47Cj4gICAJZGF0YV9rZXlfaW5pdChjLCAmYnUt
PmtleSwgaW5vZGUtPmlfaW5vLAo+IC0JCSAgICAgIHBhZ2UtPmluZGV4IDw8IFVCSUZTX0JMT0NL
U19QRVJfUEFHRV9TSElGVCk7Cj4gLQllcnIgPSB1Ymlmc19kb19idWxrX3JlYWQoYywgYnUsIHBh
Z2UpOwo+ICsJCSAgICAgIGZvbGlvLT5pbmRleCA8PCBVQklGU19CTE9DS1NfUEVSX1BBR0VfU0hJ
RlQpOwo+ICsJZXJyID0gdWJpZnNfZG9fYnVsa19yZWFkKGMsIGJ1LCBmb2xpbyk7Cj4gICAKPiAg
IAlpZiAoIWFsbG9jYXRlZCkKPiAgIAkJbXV0ZXhfdW5sb2NrKCZjLT5idV9tdXRleCk7Cj4gQEAg
LTg4OSw5ICs4ODksNyBAQCBzdGF0aWMgaW50IHViaWZzX2J1bGtfcmVhZChzdHJ1Y3QgcGFnZSAq
cGFnZSkKPiAgIAo+ICAgc3RhdGljIGludCB1Ymlmc19yZWFkX2ZvbGlvKHN0cnVjdCBmaWxlICpm
aWxlLCBzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+ICAgewo+IC0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSAm
Zm9saW8tPnBhZ2U7Cj4gLQo+IC0JaWYgKHViaWZzX2J1bGtfcmVhZChwYWdlKSkKPiArCWlmICh1
Ymlmc19idWxrX3JlYWQoZm9saW8pKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAlkb19yZWFkcGFnZShm
b2xpbyk7Cj4gICAJZm9saW9fdW5sb2NrKGZvbGlvKTsKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
