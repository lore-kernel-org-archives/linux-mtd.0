Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8901DE94139
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Oct 2023 01:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiLr4s+++eDtpQ/WWNg4Ykm2MK9ApmjbEoV8cXugGew=; b=CmnYjJTlxo/3Phc5QLCn6NxXNd
	BmfahIaT0nBbdnqul0mnVIH/NJgIiSlMvMcQu5DmjqIGtRQeB+TuX2FtlYrkv9Srre5HVhUxWM+gb
	FGm5dTj8fwHx+NB6itwiyCDBQLi+pBXumincQ6s5QhKFgbu9be8OVqn9HhBbh9Kh7GpjWquCOB9zZ
	XeS8OZwmb50ML/W5J73nDrcdm3B9bwzoPjQu2Jv81eO12ODWz/v0egrcf4u3e3Y+AR0wzsP6BaAvP
	2k95a5/Ovffl9n+pFKO+dC4BCgpwA/voTvBR6fXB4bff8KUkUKjeZSnawYJOh/wq4eKfWOWNjk0Gm
	O+P24t2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qowIG-006lTu-1i;
	Sat, 07 Oct 2023 01:39:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qowID-006lTB-1c
	for linux-mtd@lists.infradead.org;
	Sat, 07 Oct 2023 01:39:47 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S2SYG4cvDzNp2M;
	Sat,  7 Oct 2023 09:35:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 7 Oct 2023 09:39:40 +0800
Subject: Re: [PATCH 15/29] jffs2: move jffs2_xattr_handlers to .rodata
To: Wedson Almeida Filho <wedsonaf@gmail.com>, Alexander Viro
	<viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
	<linux-fsdevel@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Wedson Almeida Filho
	<walmeida@microsoft.com>, David Woodhouse <dwmw2@infradead.org>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
 <20230930050033.41174-16-wedsonaf@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9c4d2055-de05-42d9-dace-a9ff9d28f819@huawei.com>
Date: Sat, 7 Oct 2023 09:39:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230930050033.41174-16-wedsonaf@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_183945_756886_E4A7AFF2 
X-CRM114-Status: GOOD (  14.43  )
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

1NogMjAyMy85LzMwIDEzOjAwLCBXZWRzb24gQWxtZWlkYSBGaWxobyDQtLXAOgo+IEZyb206IFdl
ZHNvbiBBbG1laWRhIEZpbGhvIDx3YWxtZWlkYUBtaWNyb3NvZnQuY29tPgo+IAo+IFRoaXMgbWFr
ZXMgaXQgaGFyZGVyIGZvciBhY2NpZGVudGFsIG9yIG1hbGljaW91cyBjaGFuZ2VzIHRvCj4gamZm
czJfeGF0dHJfaGFuZGxlcnMgYXQgcnVudGltZS4KPiAKPiBDYzogRGF2aWQgV29vZGhvdXNlIDxk
d213MkBpbmZyYWRlYWQub3JnPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9k
LmF0Pgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IFdlZHNvbiBBbG1laWRhIEZpbGhvIDx3YWxtZWlkYUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICAg
ZnMvamZmczIveGF0dHIuYyB8IDIgKy0KPiAgIGZzL2pmZnMyL3hhdHRyLmggfCAyICstCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKClJldmll
d2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0t
Z2l0IGEvZnMvamZmczIveGF0dHIuYyBiL2ZzL2pmZnMyL3hhdHRyLmMKPiBpbmRleCAzYjZiZGM5
YTQ5ZTEuLjAwMjI0ZjNhOGQ2ZSAxMDA2NDQKPiAtLS0gYS9mcy9qZmZzMi94YXR0ci5jCj4gKysr
IGIvZnMvamZmczIveGF0dHIuYwo+IEBAIC05MjAsNyArOTIwLDcgQEAgc3RydWN0IGpmZnMyX3hh
dHRyX2RhdHVtICpqZmZzMl9zZXR1cF94YXR0cl9kYXR1bShzdHJ1Y3QgamZmczJfc2JfaW5mbyAq
YywKPiAgICAqIGRvX2pmZnMyX3NldHhhdHRyKGlub2RlLCB4cHJlZml4LCB4bmFtZSwgYnVmZmVy
LCBzaXplLCBmbGFncykKPiAgICAqICAgaXMgYW4gaW1wbGVtZW50YXRpb24gb2Ygc2V0eGF0dHIg
aGFuZGxlciBvbiBqZmZzMi4KPiAgICAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tICovCj4gLWNvbnN0IHN0cnVjdCB4YXR0cl9oYW5kbGVyICpqZmZz
Ml94YXR0cl9oYW5kbGVyc1tdID0gewo+ICtjb25zdCBzdHJ1Y3QgeGF0dHJfaGFuZGxlciAqIGNv
bnN0IGpmZnMyX3hhdHRyX2hhbmRsZXJzW10gPSB7Cj4gICAJJmpmZnMyX3VzZXJfeGF0dHJfaGFu
ZGxlciwKPiAgICNpZmRlZiBDT05GSUdfSkZGUzJfRlNfU0VDVVJJVFkKPiAgIAkmamZmczJfc2Vj
dXJpdHlfeGF0dHJfaGFuZGxlciwKPiBkaWZmIC0tZ2l0IGEvZnMvamZmczIveGF0dHIuaCBiL2Zz
L2pmZnMyL3hhdHRyLmgKPiBpbmRleCAxYjUwMzBhMzM0OWQuLjdlN2RlMDkzZWMwYSAxMDA2NDQK
PiAtLS0gYS9mcy9qZmZzMi94YXR0ci5oCj4gKysrIGIvZnMvamZmczIveGF0dHIuaAo+IEBAIC05
NCw3ICs5NCw3IEBAIGV4dGVybiBpbnQgZG9famZmczJfZ2V0eGF0dHIoc3RydWN0IGlub2RlICpp
bm9kZSwgaW50IHhwcmVmaXgsIGNvbnN0IGNoYXIgKnhuYW1lCj4gICBleHRlcm4gaW50IGRvX2pm
ZnMyX3NldHhhdHRyKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCB4cHJlZml4LCBjb25zdCBjaGFy
ICp4bmFtZSwKPiAgIAkJCSAgICAgY29uc3QgY2hhciAqYnVmZmVyLCBzaXplX3Qgc2l6ZSwgaW50
IGZsYWdzKTsKPiAgIAo+IC1leHRlcm4gY29uc3Qgc3RydWN0IHhhdHRyX2hhbmRsZXIgKmpmZnMy
X3hhdHRyX2hhbmRsZXJzW107Cj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgeGF0dHJfaGFuZGxlciAq
IGNvbnN0IGpmZnMyX3hhdHRyX2hhbmRsZXJzW107Cj4gICBleHRlcm4gY29uc3Qgc3RydWN0IHhh
dHRyX2hhbmRsZXIgamZmczJfdXNlcl94YXR0cl9oYW5kbGVyOwo+ICAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCB4YXR0cl9oYW5kbGVyIGpmZnMyX3RydXN0ZWRfeGF0dHJfaGFuZGxlcjsKPiAgIAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
