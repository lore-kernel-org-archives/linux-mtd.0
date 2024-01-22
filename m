Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A3C47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tg/u0ntuOZpFUQn+MpAp+ULLZWxyd8Yl63uHyA1cQXI=; b=K2/R+TepoJPkbduA/bjCSdMuHZ
	n4rqoTOYQYZmdhOqRn9d8JuaoQJouQ+MKzCD7gqZeXfSyEo2uw5xurem2Q9uIMNhD8vaTfmEINFyQ
	rPX2naB97Efo8qGJ5dE4V1JRXVVCzyRQDGW0/jYverIOTb4o7BfSvMky6qm1votgwWzR1RAAh6EPN
	vIVYjIJ4CARsUTFvih3I3vsYAJxnnZXmdis5nXsaZjxHwSm1UP+iRf+zcNxD+A6dp+PiFmBst6R3O
	ZUAKZ7dMvLLz+19TUQ/hgwQMMRzTHW3Ev1y5IBlQJj9tloIRDuvxQzEywKmvQJdukGr2ycAE3Ikoj
	X0Re/sLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsqg-00BuDQ-0z;
	Mon, 22 Jan 2024 11:52:18 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsqd-00Bu9m-0i
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 11:52:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TJT705LM5z29kcJ;
	Mon, 22 Jan 2024 19:50:20 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 507281400CC;
	Mon, 22 Jan 2024 19:52:03 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 19:52:02 +0800
Subject: Re: [PATCH 11/15] ubifs: Convert allocate_budget() to work on a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-12-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1d6092d5-a7e1-64f9-5185-a93df044f35e@huawei.com>
Date: Mon, 22 Jan 2024 19:52:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-12-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_035215_440317_1B466C75 
X-CRM114-Status: GOOD (  21.68  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gVGhlIG9u
ZSBjYWxsZXIgaGFzIGEgZm9saW8sIHNvIHBhc3MgaXQgaW4gaW5zdGVhZCBvZiB0aGUgcGFnZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4KPiAtLS0KPiAgIGZzL3ViaWZzL2ZpbGUuYyB8IDE0ICsrKysrKystLS0tLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAoKUmV2
aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cgo+IGRpZmYg
LS1naXQgYS9mcy91Ymlmcy9maWxlLmMgYi9mcy91Ymlmcy9maWxlLmMKPiBpbmRleCBjYzQ1MGFm
ZGNjNDcuLjZiYzc5NjVjZTkxOCAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9maWxlLmMKPiArKysg
Yi9mcy91Ymlmcy9maWxlLmMKPiBAQCAtMzA3LDcgKzMwNyw3IEBAIHN0YXRpYyBpbnQgd3JpdGVf
YmVnaW5fc2xvdyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIC8qKgo+ICAgICog
YWxsb2NhdGVfYnVkZ2V0IC0gYWxsb2NhdGUgYnVkZ2V0IGZvciAndWJpZnNfd3JpdGVfYmVnaW4o
KScuCj4gICAgKiBAYzogVUJJRlMgZmlsZS1zeXN0ZW0gZGVzY3JpcHRpb24gb2JqZWN0Cj4gLSAq
IEBwYWdlOiBwYWdlIHRvIGFsbG9jYXRlIGJ1ZGdldCBmb3IKPiArICogQGZvbGlvOiBmb2xpbyB0
byBhbGxvY2F0ZSBidWRnZXQgZm9yCj4gICAgKiBAdWk6IFVCSUZTIGlub2RlIG9iamVjdCB0aGUg
cGFnZSBiZWxvbmdzIHRvCj4gICAgKiBAYXBwZW5kaW5nOiBub24temVybyBpZiB0aGUgcGFnZSBp
cyBhcHBlbmRlZAo+ICAgICoKPiBAQCAtMzE4LDE1ICszMTgsMTUgQEAgc3RhdGljIGludCB3cml0
ZV9iZWdpbl9zbG93KHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgICoKPiAgICAq
IFJldHVybnM6ICUwIGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgJS1FTk9TUEMgaW4gY2FzZSBvZiBm
YWlsdXJlLgo+ICAgICovCj4gLXN0YXRpYyBpbnQgYWxsb2NhdGVfYnVkZ2V0KHN0cnVjdCB1Ymlm
c19pbmZvICpjLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiArc3RhdGljIGludCBhbGxvY2F0ZV9idWRn
ZXQoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCBmb2xpbyAqZm9saW8sCj4gICAJCQkgICBz
dHJ1Y3QgdWJpZnNfaW5vZGUgKnVpLCBpbnQgYXBwZW5kaW5nKQo+ICAgewo+ICAgCXN0cnVjdCB1
Ymlmc19idWRnZXRfcmVxIHJlcSA9IHsgLmZhc3QgPSAxIH07Cj4gICAKPiAtCWlmIChQYWdlUHJp
dmF0ZShwYWdlKSkgewo+ICsJaWYgKGZvbGlvLT5wcml2YXRlKSB7Cj4gICAJCWlmICghYXBwZW5k
aW5nKQo+ICAgCQkJLyoKPiAtCQkJICogVGhlIHBhZ2UgaXMgZGlydHkgYW5kIHdlIGFyZSBub3Qg
YXBwZW5kaW5nLCB3aGljaAo+ICsJCQkgKiBUaGUgZm9saW8gaXMgZGlydHkgYW5kIHdlIGFyZSBu
b3QgYXBwZW5kaW5nLCB3aGljaAo+ICAgCQkJICogbWVhbnMgbm8gYnVkZ2V0IGlzIG5lZWRlZCBh
dCBhbGwuCj4gICAJCQkgKi8KPiAgIAkJCXJldHVybiAwOwo+IEBAIC0zNTAsMTEgKzM1MCwxMSBA
QCBzdGF0aWMgaW50IGFsbG9jYXRlX2J1ZGdldChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0
IHBhZ2UgKnBhZ2UsCj4gICAJCSAqLwo+ICAgCQlyZXEuZGlydGllZF9pbm8gPSAxOwo+ICAgCX0g
ZWxzZSB7Cj4gLQkJaWYgKFBhZ2VDaGVja2VkKHBhZ2UpKQo+ICsJCWlmIChmb2xpb190ZXN0X2No
ZWNrZWQoZm9saW8pKQo+ICAgCQkJLyoKPiAgIAkJCSAqIFRoZSBwYWdlIGNvcnJlc3BvbmRzIHRv
IGEgaG9sZSBhbmQgZG9lcyBub3QKPiAgIAkJCSAqIGV4aXN0IG9uIHRoZSBtZWRpYS4gU28gY2hh
bmdpbmcgaXQgbWFrZXMKPiAtCQkJICogbWFrZSB0aGUgYW1vdW50IG9mIGluZGV4aW5nIGluZm9y
bWF0aW9uCj4gKwkJCSAqIHRoZSBhbW91bnQgb2YgaW5kZXhpbmcgaW5mb3JtYXRpb24KPiAgIAkJ
CSAqIGxhcmdlciwgYW5kIHdlIGhhdmUgdG8gYnVkZ2V0IGZvciBhIG5ldwo+ICAgCQkJICogcGFn
ZS4KPiAgIAkJCSAqLwo+IEBAIC00NjIsNyArNDYyLDcgQEAgc3RhdGljIGludCB1Ymlmc193cml0
ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcs
Cj4gICAJCX0KPiAgIAl9Cj4gICAKPiAtCWVyciA9IGFsbG9jYXRlX2J1ZGdldChjLCAmZm9saW8t
PnBhZ2UsIHVpLCBhcHBlbmRpbmcpOwo+ICsJZXJyID0gYWxsb2NhdGVfYnVkZ2V0KGMsIGZvbGlv
LCB1aSwgYXBwZW5kaW5nKTsKPiAgIAlpZiAodW5saWtlbHkoZXJyKSkgewo+ICAgCQl1Ymlmc19h
c3NlcnQoYywgZXJyID09IC1FTk9TUEMpOwo+ICAgCQkvKgo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
