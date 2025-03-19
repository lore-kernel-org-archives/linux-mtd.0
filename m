Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA938C35FF3
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 03:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4c1vnOEQvvXEbvGPTGQk8YlsBmWiPa1fGS05z3aeeo=; b=kPI0pMWRCWBf7bLmaWYxE6sues
	Lf9+gX84x994n9NQVtrQwLxwF1vSA6f+5Zsk2+lPa5wvwgvhNhjqquGMYRp5i9gg1sKyiqvWBXlYT
	T02LyCRcg6E3v3EJY1P3TZ8oDCIFQhYnaYsv8KHgdPZXe/uui7dHFO3Zy0El9e8gh8kJ0gmskFmRH
	z1dY2RmyLNRyDoGU7/a861FlJlm4SuWtk33jizcwthDbW8PKv9q4jrkEa73ax2JOZ/y3LVUBwRtb8
	l90oYUsWtXfL+tF0zyH70Qlf+ooTvm7hMoUe80kfwq+gsjDdF6xs3pwsSX1pLLIXkTJX/gahE5AOQ
	cgOeHObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukGw-00000007uu6-0BSv;
	Wed, 19 Mar 2025 03:39:14 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tukGr-00000007ut2-11K2
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 03:39:12 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZHZ815GR5z1g2PT;
	Wed, 19 Mar 2025 11:34:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A9591180044;
	Wed, 19 Mar 2025 11:38:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Mar 2025 11:38:55 +0800
Subject: Re: [PATCH] ubifs: Fix grammar in error message
To: Thorsten Blum <thorsten.blum@linux.dev>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250318162558.100462-2-thorsten.blum@linux.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ae124d6b-6b15-88a9-9f67-be0d17024d94@huawei.com>
Date: Wed, 19 Mar 2025 11:38:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250318162558.100462-2-thorsten.blum@linux.dev>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_203910_846390_B53ADB4E 
X-CRM114-Status: GOOD (  11.90  )
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

1NogMjAyNS8zLzE5IDA6MjUsIFRob3JzdGVuIEJsdW0g0LS1wDoKPiBzL211Y2gvbWFueS8KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBUaG9yc3RlbiBCbHVtIDx0aG9yc3Rlbi5ibHVtQGxpbnV4LmRldj4K
PiAtLS0KPiAgIGZzL3ViaWZzL2pvdXJuYWwuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKV2VsbCwgdGhlIGNvbW1pdCBtZXNzYWdlIGlz
IHRvbyBzaW1wbGUuCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvam91cm5hbC5jIGIvZnMvdWJpZnMv
am91cm5hbC5jCj4gaW5kZXggMzZiYTc5ZmJkMmZmLi45MjNjMGJiZmYzMDMgMTAwNjQ0Cj4gLS0t
IGEvZnMvdWJpZnMvam91cm5hbC5jCj4gKysrIGIvZnMvdWJpZnMvam91cm5hbC5jCj4gQEAgLTk4
Miw3ICs5ODIsNyBAQCBpbnQgdWJpZnNfam5sX3dyaXRlX2lub2RlKHN0cnVjdCB1Ymlmc19pbmZv
ICpjLCBjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ICAgCWRiZ19qbmwoImlubyAlbHUsIG5s
aW5rICV1IiwgaW5vZGUtPmlfaW5vLCBpbm9kZS0+aV9ubGluayk7Cj4gICAKPiAgIAlpZiAoa2ls
bF94YXR0cnMgJiYgdWktPnhhdHRyX2NudCA+IHViaWZzX3hhdHRyX21heF9jbnQoYykpIHsKPiAt
CQl1Ymlmc19lcnIoYywgIkNhbm5vdCBkZWxldGUgaW5vZGUsIGl0IGhhcyB0b28gbXVjaCB4YXR0
cnMhIik7Cj4gKwkJdWJpZnNfZXJyKGMsICJDYW5ub3QgZGVsZXRlIGlub2RlLCBpdCBoYXMgdG9v
IG1hbnkgeGF0dHJzISIpOwo+ICAgCQllcnIgPSAtRVBFUk07Cj4gICAJCXViaWZzX3JvX21vZGUo
YywgZXJyKTsKPiAgIAkJcmV0dXJuIGVycjsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
