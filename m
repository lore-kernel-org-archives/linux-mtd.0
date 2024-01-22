Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C22BC4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nY7HgUfJvMf+3tpyUkA9KhBcBMmncgz4SOtBhJ+MbQY=; b=ZfZSBZDWeaWRH44Y7nJ844mRao
	xNk70v/e8hFNS591cyKt2SPxaeEwUUEqkvGrd4MxUxonZ/MZkJp34KuVX037aJusvCcrfdaNDye2B
	zg1DVsF1fumWdtnxULeCM/apvO5J/0oOAl24v77FpM7Nn99HRb6ox+GLOLwUrpRP2231ncbKWJDaD
	sKJKec+iGdsMVFCRBHKuBbwM7IwJSXk7AvgVgP8V8TlVSBmWM0eaab6rC9eXgd0h0vXxTcylnFPE9
	1YnwD3fzZEMul9MF5+hQxkhQalGLocAmd42nhGzduG5mtz47FALZp2Z9Da4prhXG0dAwqfDjjSnQo
	3tNwBjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsXG-00BmS9-2W;
	Mon, 22 Jan 2024 11:32:14 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsXD-00BmPI-2p
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 11:32:13 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TJShl1xjnzsWHD;
	Mon, 22 Jan 2024 19:31:03 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 842EB180080;
	Mon, 22 Jan 2024 19:31:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 19:31:47 +0800
Subject: Re: [PATCH 02/15] ubifs: Convert from writepage to writepages
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-3-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9ad65b31-ff50-ffaa-9968-b6ece13fbf44@huawei.com>
Date: Mon, 22 Jan 2024 19:31:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-3-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_033212_075584_19385764 
X-CRM114-Status: GOOD (  16.40  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gVGhpcyBp
cyBhIHNpbXBsaXN0aWMgY29udmVyc2lvbiB0byBzZXBhcmF0ZSBvdXQgYW55IGVmZmVjdHMgb2YK
PiBubyBsb25nZXIgaGF2aW5nIGEgd3JpdGVwYWdlIG1ldGhvZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiAtLS0KPiAg
IGZzL3ViaWZzL2ZpbGUuYyB8IDEyICsrKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENo
ZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2Zp
bGUuYyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IGluZGV4IDQwYTliMDNlZjgyMS4uMDA3YTczMDUyNTYx
IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2ZpbGUuYwo+
IEBAIC0xMDA2LDggKzEwMDYsMTAgQEAgc3RhdGljIGludCBkb193cml0ZXBhZ2Uoc3RydWN0IHBh
Z2UgKnBhZ2UsIGludCBsZW4pCj4gICAgKiBvbiB0aGUgcGFnZSBsb2NrIGFuZCBpdCB3b3VsZCBu
b3Qgd3JpdGUgdGhlIHRydW5jYXRlZCBpbm9kZSBub2RlIHRvIHRoZQo+ICAgICogam91cm5hbCBi
ZWZvcmUgd2UgaGF2ZSBmaW5pc2hlZC4KPiAgICAqLwo+IC1zdGF0aWMgaW50IHViaWZzX3dyaXRl
cGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMpCj4g
K3N0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCB3
cml0ZWJhY2tfY29udHJvbCAqd2JjLAo+ICsJCXZvaWQgKmRhdGEpCj4gICB7Cj4gKwlzdHJ1Y3Qg
cGFnZSAqcGFnZSA9ICZmb2xpby0+cGFnZTsKPiAgIAlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gcGFn
ZS0+bWFwcGluZy0+aG9zdDsKPiAgIAlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGlub2RlLT5pX3Ni
LT5zX2ZzX2luZm87Cj4gICAJc3RydWN0IHViaWZzX2lub2RlICp1aSA9IHViaWZzX2lub2RlKGlu
b2RlKTsKPiBAQCAtMTA3OSw2ICsxMDgxLDEyIEBAIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdl
KHN0cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYykKPiAgIAly
ZXR1cm4gZXJyOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdlcyhzdHJ1
Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiArCQlzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wg
KndiYykKPiArewo+ICsJcmV0dXJuIHdyaXRlX2NhY2hlX3BhZ2VzKG1hcHBpbmcsIHdiYywgdWJp
ZnNfd3JpdGVwYWdlLCBOVUxMKTsKPiArfQo+ICsKPiAgIC8qKgo+ICAgICogZG9fYXR0cl9jaGFu
Z2VzIC0gY2hhbmdlIGlub2RlIGF0dHJpYnV0ZXMuCj4gICAgKiBAaW5vZGU6IGlub2RlIHRvIGNo
YW5nZSBhdHRyaWJ1dGVzIGZvcgo+IEBAIC0xNjQ4LDcgKzE2NTYsNyBAQCBzdGF0aWMgaW50IHVi
aWZzX3N5bWxpbmtfZ2V0YXR0cihzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwKPiAgIAo+ICAgY29u
c3Qgc3RydWN0IGFkZHJlc3Nfc3BhY2Vfb3BlcmF0aW9ucyB1Ymlmc19maWxlX2FkZHJlc3Nfb3Bl
cmF0aW9ucyA9IHsKPiAgIAkucmVhZF9mb2xpbyAgICAgPSB1Ymlmc19yZWFkX2ZvbGlvLAo+IC0J
LndyaXRlcGFnZSAgICAgID0gdWJpZnNfd3JpdGVwYWdlLAo+ICsJLndyaXRlcGFnZXMgICAgID0g
dWJpZnNfd3JpdGVwYWdlcywKPiAgIAkud3JpdGVfYmVnaW4gICAgPSB1Ymlmc193cml0ZV9iZWdp
biwKPiAgIAkud3JpdGVfZW5kICAgICAgPSB1Ymlmc193cml0ZV9lbmQsCj4gICAJLmludmFsaWRh
dGVfZm9saW8gPSB1Ymlmc19pbnZhbGlkYXRlX2ZvbGlvLAo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
