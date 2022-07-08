Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50B5C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+IJ4dnyPkdg7JW60Gx68Xw34t+rMRyTvgzmauQqpq8=; b=nacW/XCD0YGleZAoxHck2uBcK9
	HvHWkcOsteHLSlMIgrnfC7rjhfzLz+2Ut/yWrCzpBKOZfOgPZV1SrTgNM4DjOHuCSNXngrNV+bCyQ
	HAP9LRxydr8U12w4GQyHrUVpW289muh8vPXFHC5gIUfimeVSHA13H6lMODMIxZuqPoAj62H49jepd
	Vmsdv2833quaL9LmPqKxF/oeJbvRRd5adQIZLox5MQj0hoZBIyvp3oIOD0B+IPl/0qeoZMsWjGa5m
	JzVAJrlMVre1ODE6XxiFNK3i1cQW5LnpE2FZP4DbOHimxqnGiwjtThF42A0o9C3YdZc8jFYb+s0fo
	ugDLlrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9k76-002q6f-OD; Fri, 08 Jul 2022 09:17:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9k72-002q4M-Tx
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2022 09:17:27 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LfSKS3djjzhZbX;
	Fri,  8 Jul 2022 17:14:52 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:17:19 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:17:18 +0800
Subject: Re: [PATCH -next] ubifs: Fix some kernel-doc comments
To: Yang Li <yang.lee@linux.alibaba.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Abaci
 Robot" <abaci@linux.alibaba.com>
References: <20220602055233.26161-1-yang.lee@linux.alibaba.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2df4d326-c59a-52d2-c5aa-02954ddca97a@huawei.com>
Date: Fri, 8 Jul 2022 17:17:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220602055233.26161-1-yang.lee@linux.alibaba.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_021725_177205_3AE6D4FE 
X-CRM114-Status: GOOD (  13.19  )
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

1NogMjAyMi82LzIgMTM6NTIsIFlhbmcgTGkg0LS1wDoKPiBSZW1vdmUgd2FybmluZ3MgZm91bmQg
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
Cj4gLS0tCj4gICBmcy91Ymlmcy9qb3VybmFsLmMgfCA3ICsrKysrLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Zz
L3ViaWZzL2pvdXJuYWwuYyBiL2ZzL3ViaWZzL2pvdXJuYWwuYwo+IGluZGV4IDc1ZGFiMGFlMzkz
OS4uMTY4NTdkNGU5YWE4IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2pvdXJuYWwuYwo+ICsrKyBi
L2ZzL3ViaWZzL2pvdXJuYWwuYwo+IEBAIC0xMjAxLDkgKzEyMDEsMTIgQEAgaW50IHViaWZzX2pu
bF94cmVuYW1lKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1Y3QgaW5vZGUgKmZzdF9k
aXIsCj4gICAgKiB1Ymlmc19qbmxfcmVuYW1lIC0gcmVuYW1lIGEgZGlyZWN0b3J5IGVudHJ5Lgo+
ICAgICogQGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAo+ICAgICogQG9s
ZF9kaXI6IHBhcmVudCBpbm9kZSBvZiBkaXJlY3RvcnkgZW50cnkgdG8gcmVuYW1lCj4gLSAqIEBv
bGRfZGVudHJ5OiBkaXJlY3RvcnkgZW50cnkgdG8gcmVuYW1lCj4gKyAqIEBvbGRfaW5vZGU6IHBh
cmVudCBpbm9kZSB0byByZW5hbWUKPiArICogQG9sZF9ubTogbmFtZSBvZiBvbGQgaW5vZGUgdG8g
cmVuYW1lCj4gICAgKiBAbmV3X2RpcjogcGFyZW50IGlub2RlIG9mIGRpcmVjdG9yeSBlbnRyeSB0
byByZW5hbWUKPiAtICogQG5ld19kZW50cnk6IG5ldyBkaXJlY3RvcnkgZW50cnkgKG9yIGRpcmVj
dG9yeSBlbnRyeSB0byByZXBsYWNlKQo+ICsgKiBAbmV3X2lub2RlOiBuZXcgaW5vZGUgdG8gcmVu
YW1lCj4gKyAqIEBuZXdfbm06IG5hbWUgb2YgbmV3IGlub2RlIHRvIHJlbmFtZQo+ICsgKiBAd2hp
dGVvdXQ6IHdoaXRlb3V0IGlub2RlCj4gICAgKiBAc3luYzogbm9uLXplcm8gaWYgdGhlIHdyaXRl
LWJ1ZmZlciBoYXMgdG8gYmUgc3luY2hyb25pemVkCj4gICAgKgo+ICAgICogVGhpcyBmdW5jdGlv
biBpbXBsZW1lbnRzIHRoZSByZS1uYW1lIG9wZXJhdGlvbiB3aGljaCBtYXkgaW52b2x2ZSB3cml0
aW5nIHVwCj4gClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWku
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
