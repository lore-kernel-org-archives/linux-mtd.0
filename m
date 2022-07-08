Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D20C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJXftgbFZ9m5/6bf6L9qSrUGqa3/YHXNMmAX+sjdunE=; b=b2sj2n8W5NQkKt7IKq/1HQxqnd
	dYEjhm0qYcQ2ybWSMqEV5Kn624m457/N+cEh6/CMYJ9Tp4Q1VuJPSYJmInr2sAZfRpUqFWhRK8ANT
	SMjZZq4py+dOfRcaozOjPhSVXZ9MU8+3IkZE6q45ZPElBnQMNdBKNM+DPSEumIZbLs+4KYUb41mqI
	pRiG0uYZmQxNJo2eDPDhB8Ql3tf3suUEFVOE2k8noGzndY3dEyrt8Hz0uDJ3TMczdTqL1Ji7pFayV
	pOMLjpI3xdJaXhIlXT3jcZXfneKEraDattLS4LMMrDVUkS/PEwpV6CuPUG2MJaIu6rRq2Rfyc2MJw
	KwwavNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lvX-003M4g-Vz; Fri, 08 Jul 2022 11:13:40 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lvU-003M3J-B3
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2022 11:13:38 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LfVxJ50MKzpWDD;
	Fri,  8 Jul 2022 19:12:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 19:13:10 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 19:13:10 +0800
Subject: Re: [PATCH -next v2] ubifs: Fix some kernel-doc comments
To: Yang Li <yang.lee@linux.alibaba.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Abaci
 Robot" <abaci@linux.alibaba.com>
References: <20220602065556.104006-1-yang.lee@linux.alibaba.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d2dd33fb-8a7c-a883-0175-4d2d531c397d@huawei.com>
Date: Fri, 8 Jul 2022 19:13:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220602065556.104006-1-yang.lee@linux.alibaba.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_041336_594013_82398912 
X-CRM114-Status: GOOD (  13.03  )
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

1NogMjAyMi82LzIgMTQ6NTUsIFlhbmcgTGkg0LS1wDoKPiBSZW1vdmUgd2FybmluZ3MgZm91bmQg
YnkgcnVubmluZyBzY3JpcHRzL2tlcm5lbC1kb2MsCj4gd2hpY2ggaXMgY2F1c2VkIGJ5IHVzaW5n
ICdtYWtlIFc9MScuCj4gZnMvdWJpZnMvam91cm5hbC5jOjEyMjE6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIKPiAnb2xkX2lub2RlJyBub3QgZGVzY3JpYmVkIGluICd1Ymlm
c19qbmxfcmVuYW1lJwo+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdvbGRfbm0nCj4gbm90IGRlc2NyaWJlZCBpbiAndWJpZnNf
am5sX3JlbmFtZScKPiBmcy91Ymlmcy9qb3VybmFsLmM6MTIyMTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlcgo+ICduZXdfaW5vZGUnIG5vdCBkZXNjcmliZWQgaW4gJ3ViaWZz
X2pubF9yZW5hbWUnCj4gZnMvdWJpZnMvam91cm5hbC5jOjEyMjE6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ25ld19ubScKPiBub3QgZGVzY3JpYmVkIGluICd1Ymlmc19q
bmxfcmVuYW1lJwo+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyCj4gJ3doaXRlb3V0JyBub3QgZGVzY3JpYmVkIGluICd1Ymlmc19q
bmxfcmVuYW1lJwo+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24gcGFyYW1ldGVyICdvbGRfZGVudHJ5Jwo+IGRlc2NyaXB0aW9uIGluICd1Ymlmc19qbmxf
cmVuYW1lJwo+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rp
b24gcGFyYW1ldGVyICduZXdfZGVudHJ5Jwo+IGRlc2NyaXB0aW9uIGluICd1Ymlmc19qbmxfcmVu
YW1lJwo+IAo+IFJlcG9ydGVkLWJ5OiBBYmFjaSBSb2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBMaSA8eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+
Cj4gLS0tClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
Pgo+ICAgZnMvdWJpZnMvam91cm5hbC5jIHwgOCArKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJp
ZnMvam91cm5hbC5jIGIvZnMvdWJpZnMvam91cm5hbC5jCj4gaW5kZXggNzVkYWIwYWUzOTM5Li42
MWY3MmE1NTc2NTUgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvam91cm5hbC5jCj4gKysrIGIvZnMv
dWJpZnMvam91cm5hbC5jCj4gQEAgLTEyMDEsOSArMTIwMSwxMyBAQCBpbnQgdWJpZnNfam5sX3hy
ZW5hbWUoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAqZnN0X2RpciwK
PiAgICAqIHViaWZzX2pubF9yZW5hbWUgLSByZW5hbWUgYSBkaXJlY3RvcnkgZW50cnkuCj4gICAg
KiBAYzogVUJJRlMgZmlsZS1zeXN0ZW0gZGVzY3JpcHRpb24gb2JqZWN0Cj4gICAgKiBAb2xkX2Rp
cjogcGFyZW50IGlub2RlIG9mIGRpcmVjdG9yeSBlbnRyeSB0byByZW5hbWUKPiAtICogQG9sZF9k
ZW50cnk6IGRpcmVjdG9yeSBlbnRyeSB0byByZW5hbWUKPiArICogQG9sZF9pbm9kZTogZGlyZWN0
b3J5IGVudHJ5J3MgaW5vZGUgdG8gcmVuYW1lCj4gKyAqIEBvbGRfbm06IG5hbWUgb2YgdGhlIG9s
ZCBkaXJlY3RvcnkgZW50cnkgdG8gcmVuYW1lCj4gICAgKiBAbmV3X2RpcjogcGFyZW50IGlub2Rl
IG9mIGRpcmVjdG9yeSBlbnRyeSB0byByZW5hbWUKPiAtICogQG5ld19kZW50cnk6IG5ldyBkaXJl
Y3RvcnkgZW50cnkgKG9yIGRpcmVjdG9yeSBlbnRyeSB0byByZXBsYWNlKQo+ICsgKiBAbmV3X2lu
b2RlOiBuZXcgZGlyZWN0b3J5IGVudHJ5J3MgaW5vZGUgKG9yIGRpcmVjdG9yeSBlbnRyeSdzIGlu
b2RlIHRvCj4gKyAqCQlyZXBsYWNlKQo+ICsgKiBAbmV3X25tOiBuZXcgbmFtZSBvZiB0aGUgbmV3
IGRpcmVjdG9yeSBlbnRyeQo+ICsgKiBAd2hpdGVvdXQ6IHdoaXRlb3V0IGlub2RlCj4gICAgKiBA
c3luYzogbm9uLXplcm8gaWYgdGhlIHdyaXRlLWJ1ZmZlciBoYXMgdG8gYmUgc3luY2hyb25pemVk
Cj4gICAgKgo+ICAgICogVGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRzIHRoZSByZS1uYW1lIG9wZXJh
dGlvbiB3aGljaCBtYXkgaW52b2x2ZSB3cml0aW5nIHVwCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
