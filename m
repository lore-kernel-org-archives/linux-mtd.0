Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1E0C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mh0GeOp5vZZLiPH6BK0cANi87kfAP/G4AO8cPxKbb+s=; b=G2bBN4CZ3aL9KZnpNq5gaB7Ce9
	I8+7+UnDycBeNLQbd475nxee75vGwKNasFohM094+8ccPWRNrKHbL4remF+bYCPyipyEdUqbA2fwl
	foG7bhdkuTx7U5u2OGGG+OZKiH7bXKeUPVqsjdV5qruQFr+1DT0NqSmjwf8/8z7bJUMaPe3LrgSnO
	XaovlxzP0pxAJb6Q8WVa77x6O9VML4kI0z1fhvUPSnzJ7WU5U5gpOxzge17NrGFjzSikBQ7n4tIrn
	YvriIZCNmMdVj/uLTFreGPtqcX7fASoA792sNku1O1cqVox3Y/EX0zIozDKaUNrQEzEYiFJhAmufv
	SgIjRXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lwe-003MCJ-MM; Fri, 08 Jul 2022 11:14:48 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lwb-003MBi-2V
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2022 11:14:47 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LfVwp4ZBlz1L9Fg;
	Fri,  8 Jul 2022 19:12:10 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 19:14:38 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 19:14:37 +0800
Subject: Re: [PATCH -next] ubifs: Fix some kernel-doc comments
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Yang Li <yang.lee@linux.alibaba.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Abaci
 Robot" <abaci@linux.alibaba.com>
References: <20220602055233.26161-1-yang.lee@linux.alibaba.com>
 <2df4d326-c59a-52d2-c5aa-02954ddca97a@huawei.com>
Message-ID: <7f4a0b5d-373f-0cb4-f1ea-5712d08a6bdb@huawei.com>
Date: Fri, 8 Jul 2022 19:14:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2df4d326-c59a-52d2-c5aa-02954ddca97a@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_041445_474190_E0E3D6AD 
X-CRM114-Status: GOOD (  10.71  )
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

5ZyoIDIwMjIvNy84IDE3OjE3LCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+IOWcqCAyMDIyLzYvMiAx
Mzo1MiwgWWFuZyBMaSDlhpnpgZM6Cj4+IFJlbW92ZSB3YXJuaW5ncyBmb3VuZCBieSBydW5uaW5n
IHNjcmlwdHMva2VybmVsLWRvYywKPj4gd2hpY2ggaXMgY2F1c2VkIGJ5IHVzaW5nICdtYWtlIFc9
MScuCj4+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyCj4+ICdvbGRfaW5vZGUnIG5vdCBkZXNjcmliZWQgaW4gJ3ViaWZzX2pubF9y
ZW5hbWUnCj4+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdvbGRfbm0nCj4+IG5vdCBkZXNjcmliZWQgaW4gJ3ViaWZzX2pubF9y
ZW5hbWUnCj4+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyCj4+ICduZXdfaW5vZGUnIG5vdCBkZXNjcmliZWQgaW4gJ3ViaWZzX2pu
bF9yZW5hbWUnCj4+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICduZXdfbm0nCj4+IG5vdCBkZXNjcmliZWQgaW4gJ3ViaWZzX2pu
bF9yZW5hbWUnCj4+IGZzL3ViaWZzL2pvdXJuYWwuYzoxMjIxOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyCj4+ICd3aGl0ZW91dCcgbm90IGRlc2NyaWJlZCBpbiAndWJpZnNf
am5sX3JlbmFtZScKPj4gZnMvdWJpZnMvam91cm5hbC5jOjEyMjE6IHdhcm5pbmc6IEV4Y2VzcyBm
dW5jdGlvbiBwYXJhbWV0ZXIgJ29sZF9kZW50cnknCj4+IGRlc2NyaXB0aW9uIGluICd1Ymlmc19q
bmxfcmVuYW1lJwo+PiBmcy91Ymlmcy9qb3VybmFsLmM6MTIyMTogd2FybmluZzogRXhjZXNzIGZ1
bmN0aW9uIHBhcmFtZXRlciAnbmV3X2RlbnRyeScKPj4gZGVzY3JpcHRpb24gaW4gJ3ViaWZzX2pu
bF9yZW5hbWUnCj4+Cj4+IFJlcG9ydGVkLWJ5OiBBYmFjaSBSb2JvdCA8YWJhY2lAbGludXguYWxp
YmFiYS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbmcgTGkgPHlhbmcubGVlQGxpbnV4LmFsaWJh
YmEuY29tPgo+PiAtLS0KPj4gwqAgZnMvdWJpZnMvam91cm5hbC5jIHwgNyArKysrKy0tCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9mcy91Ymlmcy9qb3VybmFsLmMgYi9mcy91Ymlmcy9qb3VybmFsLmMKPj4gaW5k
ZXggNzVkYWIwYWUzOTM5Li4xNjg1N2Q0ZTlhYTggMTAwNjQ0Cj4+IC0tLSBhL2ZzL3ViaWZzL2pv
dXJuYWwuYwo+PiArKysgYi9mcy91Ymlmcy9qb3VybmFsLmMKPj4gQEAgLTEyMDEsOSArMTIwMSwx
MiBAQCBpbnQgdWJpZnNfam5sX3hyZW5hbWUoc3RydWN0IHViaWZzX2luZm8gKmMsIAo+PiBjb25z
dCBzdHJ1Y3QgaW5vZGUgKmZzdF9kaXIsCj4+IMKgwqAgKiB1Ymlmc19qbmxfcmVuYW1lIC0gcmVu
YW1lIGEgZGlyZWN0b3J5IGVudHJ5Lgo+PiDCoMKgICogQGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRl
c2NyaXB0aW9uIG9iamVjdAo+PiDCoMKgICogQG9sZF9kaXI6IHBhcmVudCBpbm9kZSBvZiBkaXJl
Y3RvcnkgZW50cnkgdG8gcmVuYW1lCj4+IC0gKiBAb2xkX2RlbnRyeTogZGlyZWN0b3J5IGVudHJ5
IHRvIHJlbmFtZQo+PiArICogQG9sZF9pbm9kZTogcGFyZW50IGlub2RlIHRvIHJlbmFtZQo+PiAr
ICogQG9sZF9ubTogbmFtZSBvZiBvbGQgaW5vZGUgdG8gcmVuYW1lCj4+IMKgwqAgKiBAbmV3X2Rp
cjogcGFyZW50IGlub2RlIG9mIGRpcmVjdG9yeSBlbnRyeSB0byByZW5hbWUKPj4gLSAqIEBuZXdf
ZGVudHJ5OiBuZXcgZGlyZWN0b3J5IGVudHJ5IChvciBkaXJlY3RvcnkgZW50cnkgdG8gcmVwbGFj
ZSkKPj4gKyAqIEBuZXdfaW5vZGU6IG5ldyBpbm9kZSB0byByZW5hbWUKPj4gKyAqIEBuZXdfbm06
IG5hbWUgb2YgbmV3IGlub2RlIHRvIHJlbmFtZQo+PiArICogQHdoaXRlb3V0OiB3aGl0ZW91dCBp
bm9kZQo+PiDCoMKgICogQHN5bmM6IG5vbi16ZXJvIGlmIHRoZSB3cml0ZS1idWZmZXIgaGFzIHRv
IGJlIHN5bmNocm9uaXplZAo+PiDCoMKgICoKPj4gwqDCoCAqIFRoaXMgZnVuY3Rpb24gaW1wbGVt
ZW50cyB0aGUgcmUtbmFtZSBvcGVyYXRpb24gd2hpY2ggbWF5IGludm9sdmUgCj4+IHdyaXRpbmcg
dXAKPj4KPiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4KUGxlYXNlIGlnbm9yZSB0aGlzIHJldmlldyB0YWcsIHNvcnJ5IGZvciB0aGlzIG1pc3Rha2Vu
IHJlcGx5LCB0aGUgcmV2aWV3IAp0YWcgaXMgZm9yIHYyLgo+IAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
