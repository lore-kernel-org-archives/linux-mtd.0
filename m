Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464B5C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2024 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii0duc/SkHqm2G09uQIunL64BJ1hmJVAYUqB+SQ9gro=; b=qqN7ecCyiSkjHKM47i2zVv0/5N
	vg9jJEAdzg3UUgoShRaaE8vunfGrGAHD5tXd/CJ4MCjM0HAt7/v3Tp5Z15wkdFDw8OCxW3P4aJN7n
	hGI/gf+2+O0O0YTXL9YdD1XOV084JLTJUi2FDTv8SeDXwcmD4ViiCDxLwdEAbZVA/uxACR5YDeNNb
	1QOqfldwWWHOkSYMlts/aJXIxGXvZFHp95tT9Sl15LS/ARWpN5x5D9QDj9clW+DWlSt+cDNL3a/x8
	BUqFvvBcg7KiXQMoYL48r0683BBW/Xwu2yLMcWmzyne5KuqleMuLURGZwbS9CHFXMd+/hBZmqHCWp
	scJIuZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewYm-0000000CyrE-34ey;
	Fri, 16 Aug 2024 13:00:05 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewYY-0000000Cyny-1hWZ
	for linux-mtd@lists.infradead.org;
	Fri, 16 Aug 2024 13:00:02 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wlhm84KPJz20lvL;
	Fri, 16 Aug 2024 20:55:04 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id D6A7E14010C;
	Fri, 16 Aug 2024 20:59:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 20:59:40 +0800
Subject: Re: [PATCH 1/2] jffs2: Convert jffs2_do_readpage_nolock to take a
 folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, David Woodhouse
	<dwmw2@infradead.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-fsdevel@vger.kernel.org>, Christian Brauner <brauner@kernel.org>
References: <20240814195915.249871-1-willy@infradead.org>
 <20240814195915.249871-2-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f5eda589-c706-ea18-17e5-ab4a7ecdae9e@huawei.com>
Date: Fri, 16 Aug 2024 20:59:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240814195915.249871-2-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_055950_864220_CD897C07 
X-CRM114-Status: GOOD (  16.53  )
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

1NogMjAyNC84LzE1IDM6NTksIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gQm90aCBj
YWxsZXJzIG5vdyBoYXZlIGEgZm9saW8sIHNvIHBhc3MgaXQgaW4uICBObyBlZmZvcnQgaXMgbWFk
ZQo+IGhlcmUgdG8gc3VwcG9ydCBsYXJnZSBmb2xpb3MuICBSZW1vdmVzIHNldmVyYWwgaGlkZGVu
IGNhbGxzIHRvCj4gY29tcG91bmRfaGVhZCgpLCB0d28gcmVmZXJlbmNlcyB0byBwYWdlLT5pbmRl
eCBhbmQgYSB1c2Ugb2Yga21hcC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAo
T3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiAtLS0KPiAgIGZzL2pmZnMyL2ZpbGUuYyB8
IDI0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8
Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL2ZpbGUuYyBi
L2ZzL2pmZnMyL2ZpbGUuYwo+IGluZGV4IGFkYTU3MmM0NjZmOC4uMTNjMThjY2MxM2IwIDEwMDY0
NAo+IC0tLSBhL2ZzL2pmZnMyL2ZpbGUuYwo+ICsrKyBiL2ZzL2pmZnMyL2ZpbGUuYwo+IEBAIC03
NywyOSArNzcsMjcgQEAgY29uc3Qgc3RydWN0IGFkZHJlc3Nfc3BhY2Vfb3BlcmF0aW9ucyBqZmZz
Ml9maWxlX2FkZHJlc3Nfb3BlcmF0aW9ucyA9Cj4gICAJLndyaXRlX2VuZCA9CWpmZnMyX3dyaXRl
X2VuZCwKPiAgIH07Cj4gICAKPiAtc3RhdGljIGludCBqZmZzMl9kb19yZWFkcGFnZV9ub2xvY2sg
KHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpwZykKPiArc3RhdGljIGludCBqZmZz
Ml9kb19yZWFkcGFnZV9ub2xvY2soc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZvbGlvICpm
b2xpbykKPiAgIHsKPiAgIAlzdHJ1Y3QgamZmczJfaW5vZGVfaW5mbyAqZiA9IEpGRlMyX0lOT0RF
X0lORk8oaW5vZGUpOwo+ICAgCXN0cnVjdCBqZmZzMl9zYl9pbmZvICpjID0gSkZGUzJfU0JfSU5G
Tyhpbm9kZS0+aV9zYik7Cj4gLQl1bnNpZ25lZCBjaGFyICpwZ19idWY7Cj4gKwl1bnNpZ25lZCBj
aGFyICprYWRkcjsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gICAJamZmczJfZGJnKDIsICIlcygpOiBp
bm8gIyVsdSwgcGFnZSBhdCBvZmZzZXQgMHglbHhcbiIsCj4gLQkJICBfX2Z1bmNfXywgaW5vZGUt
PmlfaW5vLCBwZy0+aW5kZXggPDwgUEFHRV9TSElGVCk7Cj4gKwkJICBfX2Z1bmNfXywgaW5vZGUt
PmlfaW5vLCBmb2xpby0+aW5kZXggPDwgUEFHRV9TSElGVCk7Cj4gICAKPiAtCUJVR19PTighUGFn
ZUxvY2tlZChwZykpOwo+ICsJQlVHX09OKCFmb2xpb190ZXN0X2xvY2tlZChmb2xpbykpOwo+ICAg
Cj4gLQlwZ19idWYgPSBrbWFwKHBnKTsKPiAtCS8qIEZJWE1FOiBDYW4ga21hcCBmYWlsPyAqLwo+
IC0KPiAtCXJldCA9IGpmZnMyX3JlYWRfaW5vZGVfcmFuZ2UoYywgZiwgcGdfYnVmLCBwZy0+aW5k
ZXggPDwgUEFHRV9TSElGVCwKPiArCWthZGRyID0ga21hcF9sb2NhbF9mb2xpbyhmb2xpbywgMCk7
Cj4gKwlyZXQgPSBqZmZzMl9yZWFkX2lub2RlX3JhbmdlKGMsIGYsIGthZGRyLCBmb2xpby0+aW5k
ZXggPDwgUEFHRV9TSElGVCwKPiAgIAkJCQkgICAgIFBBR0VfU0laRSk7Cj4gKwlrdW5tYXBfbG9j
YWwoa2FkZHIpOwo+ICAgCj4gICAJaWYgKCFyZXQpCj4gLQkJU2V0UGFnZVVwdG9kYXRlKHBnKTsK
PiArCQlmb2xpb19tYXJrX3VwdG9kYXRlKGZvbGlvKTsKPiAgIAo+IC0JZmx1c2hfZGNhY2hlX3Bh
Z2UocGcpOwo+IC0Ja3VubWFwKHBnKTsKPiArCWZsdXNoX2RjYWNoZV9mb2xpbyhmb2xpbyk7Cj4g
ICAKPiAgIAlqZmZzMl9kYmcoMiwgInJlYWRwYWdlIGZpbmlzaGVkXG4iKTsKPiAgIAlyZXR1cm4g
cmV0Owo+IEBAIC0xMDcsNyArMTA1LDcgQEAgc3RhdGljIGludCBqZmZzMl9kb19yZWFkcGFnZV9u
b2xvY2sgKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpwZykKPiAgIAo+ICAgaW50
IF9famZmczJfcmVhZF9mb2xpbyhzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGZvbGlvICpmb2xp
bykKPiAgIHsKPiAtCWludCByZXQgPSBqZmZzMl9kb19yZWFkcGFnZV9ub2xvY2soZm9saW8tPm1h
cHBpbmctPmhvc3QsICZmb2xpby0+cGFnZSk7Cj4gKwlpbnQgcmV0ID0gamZmczJfZG9fcmVhZHBh
Z2Vfbm9sb2NrKGZvbGlvLT5tYXBwaW5nLT5ob3N0LCBmb2xpbyk7Cj4gICAJZm9saW9fdW5sb2Nr
KGZvbGlvKTsKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+IEBAIC0yMjEsNyArMjE5LDcgQEAgc3Rh
dGljIGludCBqZmZzMl93cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IGFkZHJl
c3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJICovCj4gICAJaWYgKCFmb2xpb190ZXN0X3VwdG9kYXRl
KGZvbGlvKSkgewo+ICAgCQltdXRleF9sb2NrKCZmLT5zZW0pOwo+IC0JCXJldCA9IGpmZnMyX2Rv
X3JlYWRwYWdlX25vbG9jayhpbm9kZSwgJmZvbGlvLT5wYWdlKTsKPiArCQlyZXQgPSBqZmZzMl9k
b19yZWFkcGFnZV9ub2xvY2soaW5vZGUsIGZvbGlvKTsKPiAgIAkJbXV0ZXhfdW5sb2NrKCZmLT5z
ZW0pOwo+ICAgCQlpZiAocmV0KSB7Cj4gICAJCQlmb2xpb191bmxvY2soZm9saW8pOwo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
