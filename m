Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ABFC761A6
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flSMbK7+CC604UFS7uc4y8JsJNYp/oW/T1pL7tnYPSg=; b=S/9WSxKupzZyP+qFNSQf4aJlSo
	zqxJKNld2YLWWrspMiZ/2C1RlNgp8zI90Z14gG+Qj4GrtJ7xo7lh71XvY2iVIhhP5z+ywA+Q+7ghx
	zOSb3TqR5oii97DTM6ClllT7XAQatdYQDpFhyHagPQ0vixMurOauKrIByCPDAgQhJL+pTy2jm2XqG
	DCzwTfcA03NIW+sLwGg/mV+UqKLFUhzFI9I7ZqDpx9/iVVG4dzmRqd5+fLqCZoRLwOU6hgMb1I5n/
	CgRTMVuhHxN7kGFrgAjh8JbB89L/X3x8D1H//YYpzK8e3EPgj3elaSuYrtG2+mj/3kPpCWF+Um/g0
	raa8tuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pht6r-00416G-1O;
	Thu, 30 Mar 2023 14:18:37 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pht6F-0040fO-27
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 14:18:02 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PnQS067PMzKxNw;
	Thu, 30 Mar 2023 22:15:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 22:17:52 +0800
Subject: Re: [PATCH] ubifs: Fix memory leak in do_rename
To: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>, Richard
 Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
References: <20230330-memleak_rename-fix-v1-1-99789e908fdf@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bc8aaf0a-0b21-99a8-4c50-92edeff8edd7@huawei.com>
Date: Thu, 30 Mar 2023 22:17:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230330-memleak_rename-fix-v1-1-99789e908fdf@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_071759_917899_55009BA8 
X-CRM114-Status: GOOD (  20.22  )
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

PiBJZiByZW5hbWluZyBhIGZpbGUgaW4gYW4gZW5jcnlwdGVkIGRpcmVjdG9yeSwgZnVuY3Rpb24K
PiBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lIGFsbG9jYXRlcyBtZW1vcnkgZm9yIGEgZmlsZSBuYW1l
LiBUaGlzIG5hbWUgaXMKPiBuZXZlciB1c2VkLCBhbmQgYmVmb3JlIHJldHVybmluZyB0byB0aGUg
Y2FsbGVyIHRoZSBtZW1vcnkgZm9yIGl0IGlzIG5vdAo+IGZyZWVkLgo+IAo+IFdoZW4gcnVubmlu
ZyBrbWVtbGVhayBvbiBpdCB3ZSBzZWUgdGhhdCBpdCBpcyByZWdpc3RlcmVkIGFzIGEgbGVhay4g
VGhlCj4gcmVwb3J0IGJlbG93IGlzIHRyaWdnZXJlZCBieSBhIHNpbXBsZSBwcm9ncmFtICdyZW5h
bWUnIHRoYXQgcmVuYW1lcyBhCj4gZmlsZSBpbiBhbiBlbmNyeXB0ZWQgZGlyZWN0b3J5Ogo+IAo+
ICAgIHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTAxNTAyODQwIChzaXplIDMyKToKPiAg
ICAgIGNvbW0gInJlbmFtZSIsIHBpZCA5NDA0LCBqaWZmaWVzIDQzMDI1ODI0NzUgKGFnZSA0MzUu
NzM1cykKPiAgICAgIGJhY2t0cmFjZToKPiAgICAgICAgX19rbWVtX2NhY2hlX2FsbG9jX25vZGUK
PiAgICAgICAgX19rbWFsbG9jCj4gICAgICAgIGZzY3J5cHRfc2V0dXBfZmlsZW5hbWUKPiAgICAg
ICAgZG9fcmVuYW1lCj4gICAgICAgIHViaWZzX3JlbmFtZQo+ICAgICAgICB2ZnNfcmVuYW1lCj4g
ICAgICAgIGRvX3JlbmFtZWF0Mgo+IAo+IFRvIGZpeCB0aGlzIHdlIGNhbiByZW1vdmUgdGhlIGNh
bGwgdG8gZnNjcnlwdF9zZXR1cF9maWxlbmFtZSBhcyBpdCdzIG5vdAo+IG5lZWRlZC4KPiAKPiBS
ZXBvcnRlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNw6VydGVuIExpbmRhaGwgPG1hcnRlbi5saW5kYWhsQGF4aXMuY29tPgo+IC0t
LQo+ICAgZnMvdWJpZnMvZGlyLmMgfCA2IC0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVs
ZXRpb25zKC0pCj4gCgpJJ20gb2theSB3aXRoIHRoaXMgbW9kaWZpY2F0aW9uLiBJdCB3b3VsZCBi
ZSBiZXR0ZXIgdG8gYWRkIGEgZml4IHRhZy4gCihGaXhlczogMjc4ZDlhMjQzNjM1ZjI2ICgidWJp
ZnM6IFJlbmFtZSB3aGl0ZW91dCBhdG9taWNhbGx5IikpCgoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBD
aGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cgo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9k
aXIuYyBiL2ZzL3ViaWZzL2Rpci5jCj4gaW5kZXggMGYyOWNmMjAxMTM2Li40YzJkZGExMzQ2ZTcg
MTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZGlyLmMKPiArKysgYi9mcy91Ymlmcy9kaXIuYwo+IEBA
IC0zNTgsNyArMzU4LDYgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqY3JlYXRlX3doaXRlb3V0KHN0
cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCj4gICAJdW1vZGVfdCBtb2Rl
ID0gU19JRkNIUiB8IFdISVRFT1VUX01PREU7Cj4gICAJc3RydWN0IGlub2RlICppbm9kZTsKPiAg
IAlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGRpci0+aV9zYi0+c19mc19pbmZvOwo+IC0Jc3RydWN0
IGZzY3J5cHRfbmFtZSBubTsKPiAgIAo+ICAgCS8qCj4gICAJICogQ3JlYXRlIGFuIGlub2RlKCdu
bGluayA9IDEnKSBmb3Igd2hpdGVvdXQgd2l0aG91dCB1cGRhdGluZyBqb3VybmFsLAo+IEBAIC0z
NjksMTAgKzM2OCw2IEBAIHN0YXRpYyBzdHJ1Y3QgaW5vZGUgKmNyZWF0ZV93aGl0ZW91dChzdHJ1
Y3QgaW5vZGUgKmRpciwgc3RydWN0IGRlbnRyeSAqZGVudHJ5KQo+ICAgCWRiZ19nZW4oImRlbnQg
JyVwZCcsIG1vZGUgJSNoeCBpbiBkaXIgaW5vICVsdSIsCj4gICAJCWRlbnRyeSwgbW9kZSwgZGly
LT5pX2lubyk7Cj4gICAKPiAtCWVyciA9IGZzY3J5cHRfc2V0dXBfZmlsZW5hbWUoZGlyLCAmZGVu
dHJ5LT5kX25hbWUsIDAsICZubSk7Cj4gLQlpZiAoZXJyKQo+IC0JCXJldHVybiBFUlJfUFRSKGVy
cik7Cj4gLQo+ICAgCWlub2RlID0gdWJpZnNfbmV3X2lub2RlKGMsIGRpciwgbW9kZSwgZmFsc2Up
Owo+ICAgCWlmIChJU19FUlIoaW5vZGUpKSB7Cj4gICAJCWVyciA9IFBUUl9FUlIoaW5vZGUpOwo+
IEBAIC0zOTUsNyArMzkwLDYgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqY3JlYXRlX3doaXRlb3V0
KHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCj4gICAJbWFrZV9iYWRf
aW5vZGUoaW5vZGUpOwo+ICAgCWlwdXQoaW5vZGUpOwo+ICAgb3V0X2ZyZWU6Cj4gLQlmc2NyeXB0
X2ZyZWVfZmlsZW5hbWUoJm5tKTsKPiAgIAl1Ymlmc19lcnIoYywgImNhbm5vdCBjcmVhdGUgd2hp
dGVvdXQgZmlsZSwgZXJyb3IgJWQiLCBlcnIpOwo+ICAgCXJldHVybiBFUlJfUFRSKGVycik7Cj4g
ICB9Cj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGM5YzMzOTVkNWUzZGNjNmRhZWU2NmM2OTA4MzU0
ZDQ3YmY5OGNiMGMKPiBjaGFuZ2UtaWQ6IDIwMjMwMzMwLW1lbWxlYWtfcmVuYW1lLWZpeC02Zjk0
YTZmOTkzNTAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
