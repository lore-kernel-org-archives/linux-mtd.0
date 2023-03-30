Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A6DC761A6
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 11:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABJw7N6XIli2WaW1KH/NUEOjKI4oX7jI7lpIswy6SKM=; b=i4iYrULoNMvJIIhGv84QMtvn9W
	y21b63ADhroqtq174ByIw04LbrO5v0k2DdEVa8MF8fmgLxIkb0j/2N0C8G72CWm+79eNjkNbJQnHo
	mRsDI8fKzHnslcZY35NFqgJabOC0UqiOQuMqYC8V3UaSxVGVyhiqKWRy75dCpnnkKt5xRMhzxTtPu
	3UUIfHKknBvOtYF7HyiytoVfXfAlIP4hJvwtwk1jZ8KBYWM5o5P3f0E1tggW96muh7G58QQB8JVXn
	d7i7ZonMMwSPPpaLTg/O96W6lryOVbUq0PoiCwhzE7hmd8vcKDsYNpjGtiW9NIouYvPiEpmvw+Hq3
	JQU5pZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phq6Z-003ZMj-2r;
	Thu, 30 Mar 2023 11:06:07 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phq6V-003ZKj-14
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 11:06:06 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PnL9X1c9lz17Lbs;
	Thu, 30 Mar 2023 19:02:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 19:05:56 +0800
Subject: Re: [PATCH v2] ubifs: Free memory for tmpfile name
To: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>, Richard
 Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
References: <20230329-memleak-fix-v2-1-cb8d9394300b@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <72ffd9c6-e203-be55-6663-768262fb611e@huawei.com>
Date: Thu, 30 Mar 2023 19:05:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230329-memleak-fix-v2-1-cb8d9394300b@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_040603_540337_851D6EF4 
X-CRM114-Status: GOOD (  16.50  )
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

PiBXaGVuIG9wZW5pbmcgYSB1YmlmcyB0bXBmaWxlIG9uIGFuIGVuY3J5cHRlZCBkaXJlY3Rvcnks
IGZ1bmN0aW9uCj4gZnNjcnlwdF9zZXR1cF9maWxlbmFtZSBhbGxvY2F0ZXMgbWVtb3J5IGZvciB0
aGUgbmFtZSB0aGF0IGlzIHRvIGJlCj4gc3RvcmVkIGluIHRoZSBkaXJlY3RvcnkgZW50cnksIGJ1
dCBhZnRlciB0aGUgbmFtZSBoYXMgYmVlbiBjb3BpZWQgdG8gdGhlCj4gZGlyZWN0b3J5IGVudHJ5
IGlub2RlLCB0aGUgbWVtb3J5IGlzIG5vdCBmcmVlZC4KPiAKPiBXaGVuIHJ1bm5pbmcga21lbWxl
YWsgb24gaXQgd2Ugc2VlIHRoYXQgaXQgaXMgcmVnaXN0ZXJlZCBhcyBhIGxlYWsuIFRoZQo+IHJl
cG9ydCBiZWxvdyBpcyB0cmlnZ2VyZWQgYnkgYSBzaW1wbGUgcHJvZ3JhbSAndG1wZmlsZScganVz
dCBvcGVuaW5nIGEKPiB0bXBmaWxlOgo+IAo+ICAgIHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZm
ODg4MTAxNzhmMzgwIChzaXplIDMyKToKPiAgICAgIGNvbW0gInRtcGZpbGUiLCBwaWQgNTA5LCBq
aWZmaWVzIDQyOTQ5MzQ3NDQgKGFnZSAxNTI0Ljc0MnMpCj4gICAgICBiYWNrdHJhY2U6Cj4gICAg
ICAgIF9fa21lbV9jYWNoZV9hbGxvY19ub2RlCj4gICAgICAgIF9fa21hbGxvYwo+ICAgICAgICBm
c2NyeXB0X3NldHVwX2ZpbGVuYW1lCj4gICAgICAgIHViaWZzX3RtcGZpbGUKPiAgICAgICAgdmZz
X3RtcGZpbGUKPiAgICAgICAgcGF0aF9vcGVuYXQKPiAKPiBGcmVlIHRoaXMgbWVtb3J5IGFmdGVy
IGl0IGhhcyBiZWVuIGNvcGllZCB0byB0aGUgaW5vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTcOl
cnRlbiBMaW5kYWhsIDxtYXJ0ZW4ubGluZGFobEBheGlzLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gQ2FsbCBmc2NyeXB0X2ZyZWVfZmlsZW5hbWUgYWZ0ZXIgdWJpZnNfcmVsZWFzZV9i
dWRnZXQKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzAzMjkt
bWVtbGVhay1maXgtdjEtMS03MTMzZGE1NmVhOGZAYXhpcy5jb20KPiAtLS0KPiAgIGZzL3ViaWZz
L2Rpci5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKClJldmlld2Vk
LWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiAKPiBkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+IGluZGV4IDBmMjljZjIwMTEz
Ni4uN2RkNmRkMzRiODRjIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2Rpci5jCj4gKysrIGIvZnMv
dWJpZnMvZGlyLmMKPiBAQCAtNDkyLDYgKzQ5Miw3IEBAIHN0YXRpYyBpbnQgdWJpZnNfdG1wZmls
ZShzdHJ1Y3QgdXNlcl9uYW1lc3BhY2UgKm1udF91c2VybnMsIHN0cnVjdCBpbm9kZSAqZGlyLAo+
ICAgCXVubG9ja18yX2lub2RlcyhkaXIsIGlub2RlKTsKPiAgIAo+ICAgCXViaWZzX3JlbGVhc2Vf
YnVkZ2V0KGMsICZyZXEpOwo+ICsJZnNjcnlwdF9mcmVlX2ZpbGVuYW1lKCZubSk7Cj4gICAKPiAg
IAlyZXR1cm4gZmluaXNoX29wZW5fc2ltcGxlKGZpbGUsIDApOwo+ICAgCj4gCj4gLS0tCj4gYmFz
ZS1jb21taXQ6IGM5YzMzOTVkNWUzZGNjNmRhZWU2NmM2OTA4MzU0ZDQ3YmY5OGNiMGMKPiBjaGFu
Z2UtaWQ6IDIwMjMwMzI5LW1lbWxlYWstZml4LTg3YTAxZGFmNDY5ZQo+IAo+IEJlc3QgcmVnYXJk
cywKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
