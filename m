Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E9CD64086
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Nov 2024 02:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lk9NQK6Jv0fvzvodFY/BPAx0c3+svx3H0amRN+oyGE=; b=ni14l5rjPIEAkRQcZZRwNeZOUG
	72R+fCNcGMcmEyM2MiL2oamMkLT6Gv726ggnDUDX94SoVW25xHWMnvvwbaM0uJO1k9oZLQhAOPY/5
	nS/oLHmPitokNsaBi3hNwGFrH3LAx7iH8OEkXJN/HEUDB2PgbGRdkOHUdTN+EZfz8pR5y9DPsvWqV
	0mcWQLXM+y1zZ24vC8MB75aCJWglnIp6sRRRHx7KqUOqcNqShX4WtF72GZ8BxXmEAXDVrw7ao+oN+
	OjnESymB7i4poQZBO783wCHSdZrYqvct61sfMIyfRNS7PMbHSrR9j9sub1yhCE7+CAvUzmReoTGGl
	26IJZPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bKY-0000000CWdC-454n;
	Sat, 09 Nov 2024 02:36:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bJ9-0000000CWTx-3f97
	for linux-mtd@lists.infradead.org;
	Sat, 09 Nov 2024 02:34:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xlfvn0klgzkWnS;
	Sat,  9 Nov 2024 10:31:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 32A40180064;
	Sat,  9 Nov 2024 10:34:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 9 Nov 2024 10:34:26 +0800
Subject: Re: [PATCH v2] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Waqar Hameed <waqar.hameed@axis.com>, Richard Weinberger <richard@nod.at>,
	Sascha Hauer <s.hauer@pengutronix.de>
CC: <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <e7b5151bb1186e2342ed677cce0ef77592923084.1731088341.git.waqar.hameed@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3c46013e-809e-cdcf-8648-2ffe2ab6c32b@huawei.com>
Date: Sat, 9 Nov 2024 10:34:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e7b5151bb1186e2342ed677cce0ef77592923084.1731088341.git.waqar.hameed@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_183440_089894_1379B9CD 
X-CRM114-Status: GOOD (  12.97  )
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

1NogMjAyNC8xMC85IDIyOjQ2LCBXYXFhciBIYW1lZWQg0LS1wDoKMyBuaXRzIGJlbG93LgoKMS4g
TWFrZSB0aGUgdGl0bGUgYXMgJ3ViaWZzOiBhdXRoZW50aWNhdGlvbjogRml4IHVzZS1hZnRlci1m
cmVlIGluIAp1Ymlmc190bmNfZW5kX2NvbW1pdCcKCjIuIEF0IHRoZSBiZWdpbmluZyBvZiB0aGUg
Y29tbWl0IG1zZywgZGVzY3JpYmUgdGhlIHByb2JsZW06CkFmdGVyIFROQyB0cmVlIGluc2VydGlu
Zyh3aGljaCBtYXkgdHJpZ2dlciBhIHpub2RlIHNwbGl0IGFuZCBjaGFuZ2UgdGhlIAp6bm9kZS0+
cGFyZW50KSBhbmQgZGVsZXRpbmcod2hpY2ggbWF5IHRyaWdnZXIgem5vZGUgZnJlZWluZyksIHRo
ZSAKem5vZGUtPmNwYXJlbnQod2hpY2ggc3RpbGwgcG9pbnRzIHRvIGEgZnJlZWQgem5vZGUpIG1h
eSBub3QgYmUgdXBkYXRlZCAKYXQgdGhlIGJlZ2luaW5nIG9mIGNvbW1pdCwgd2hpY2ggY291bGQg
dHJpZ2dlciBhbiBVQUYgcHJvYmxlbSB3aGlsZSAKYWNjZXNzaW5nIHpub2RlLT5jcGFyZW50IGlu
IHdyaXRlX2luZGV4KCkuCgo+IFJ1bm5pbmcKPiAKPiAgICBybSAtZiAvZXRjL3Rlc3QtZmlsZS5i
aW4KPiAgICBkZCBpZj0vZGV2L3VyYW5kb20gb2Y9L2V0Yy90ZXN0LWZpbGUuYmluIGJzPTFNIGNv
dW50PTYwIGNvbnY9ZnN5bmMKPiAKPiBpbiBhIGxvb3AsIHdpdGggYENPTkZJR19VQklGU19GU19B
VVRIRU5USUNBVElPTmAsIEtBU0FOIHJlcG9ydHM6Cj4gCj4gICAgQlVHOiBLQVNBTjogdXNlLWFm
dGVyLWZyZWUgaW4gdWJpZnNfdG5jX2VuZF9jb21taXQrMHhhNWMvMHgxOTUwCj4gICAgV3JpdGUg
b2Ygc2l6ZSAzMiBhdCBhZGRyIGZmZmZmZjgwMGEzYWY4NmMgYnkgdGFzayB1Ymlmc19iZ3QwXzIw
LzE1Mwo+IAo+ICAgIENhbGwgdHJhY2U6CgpbLi4uXQo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy90
bmNfY29tbWl0LmMgYi9mcy91Ymlmcy90bmNfY29tbWl0LmMKPiBpbmRleCBhNTVlMDQ4MjJkMTYu
LmE0NjRlYjU1NzU4NSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy90bmNfY29tbWl0LmMKPiArKysg
Yi9mcy91Ymlmcy90bmNfY29tbWl0LmMKPiBAQCAtNjU3LDYgKzY1Nyw3IEBAIHN0YXRpYyBpbnQg
Z2V0X3pub2Rlc190b19jb21taXQoc3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAJCXpub2RlLT5h
bHQgPSAwOwo+ICAgCQljbmV4dCA9IGZpbmRfbmV4dF9kaXJ0eSh6bm9kZSk7Cj4gICAJCWlmICgh
Y25leHQpIHsKCjMuIEknZCBsaWtlIHRvIGFkZCB0aGUgdGhlIGFzc2VydGlvbiAndWJpZnNfYXNz
ZXJ0KGMsICF6bm9kZS0+cGFyZW50KTsnCj4gKwkJCXpub2RlLT5jcGFyZW50ID0gTlVMTDsKPiAg
IAkJCXpub2RlLT5jbmV4dCA9IGMtPmNuZXh0Owo+ICAgCQkJYnJlYWs7Cj4gICAJCX0KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
