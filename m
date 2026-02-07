Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD531EE6B76
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Feb 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihjPIoFLK2aji6qD3nkDKxe8f4hC51mDJymEOkkqBUU=; b=vgXxNcaC6UfizBexlIAW0tM+Hy
	pm79ruWM+3ikLwwr+yp/5a1Ex73ILDbkxZHWlbBCtUSlQoFbTwqpYYc1h5fd5lY+oXC4GDGk7ZJv7
	GPKlxSw1AeMFGdWY87AMLPWLHdCU/bgPWln3LT2cW4Nn5wBVkOIN3QnQBHpHyVQVWYDg2ozpKAKDi
	fMlwlGmQek4AKgh7gs2CiRYPxnsWJMvFi/QPsptu9m+fdo4e/rLZiZk2TJZWwh3s7LZtJrr8XhLib
	XqVeYEyC812MeF83no+kMpVYY0VGXJ6X5sYFs4dRnm7aI3jgv1CzttHhJTbPQcqZtQaO5n1nddDr6
	7PwdrZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodEy-0000000CE45-1PpI;
	Sat, 07 Feb 2026 08:00:28 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodEw-0000000CE3U-18e1
	for linux-mtd@lists.infradead.org;
	Sat, 07 Feb 2026 08:00:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UzVW/mJ4Zn0fHNipgPK6GS1YLMr7fGHlhBnpLXyevhI=;
	b=17NUL2mb1Z8XnAlj1XcOPzEwSEwzNm/nrIqi/I/KKBYBfaWA+zgSCDQvXs3RqtpqzbL8wcips
	dH6DNcKRlcC9TFQox5qX4Ksma2I3SmrqjzY1UmsL49xtHAMpoiSxvvMY5hRrH4Xu2wNzPqAuD2A
	uroXjSzXzc+KWfQLNTVFUSE=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f7NYT4sG4zmV6f;
	Sat,  7 Feb 2026 15:55:41 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B46240563;
	Sat,  7 Feb 2026 16:00:18 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Feb 2026 16:00:17 +0800
Subject: Re: [PATCH] jffs2: use fs_umode_to_dtype() for dirent type
To: Adarsh Das <adarshdas950@gmail.com>, <dwmw2@infradead.org>,
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260206115100.84852-1-adarshdas950@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <410df1a9-25f9-50c7-1af0-80ac9e5c8846@huawei.com>
Date: Sat, 7 Feb 2026 16:00:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260206115100.84852-1-adarshdas950@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_000026_509419_6B14E94C 
X-CRM114-Status: GOOD (  12.45  )
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

1NogMjAyNi8yLzYgMTk6NTEsIEFkYXJzaCBEYXMg0LS1wDoKPiBVc2UgZnNfdW1vZGVfdG9fZHR5
cGUoKSBpbnN0ZWFkIG9mIGRpcmVjdCBiaXQgc2hpZnRpbmcgd2hlbgo+IHNldHRpbmcgZGlyZWN0
b3J5IGVudHJ5IHR5cGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRhcnNoIERhcyA8YWRhcnNoZGFz
OTUwQGdtYWlsLmNvbT4KPiAtLS0KPiAgIGZzL2pmZnMyL2Rpci5jIHwgMTEgKysrLS0tLS0tLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCgpS
ZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZm
IC0tZ2l0IGEvZnMvamZmczIvZGlyLmMgYi9mcy9qZmZzMi9kaXIuYwo+IGluZGV4IGRkOTFmNzI1
ZGVkNi4uMTg1Y2Y3NmEwNjFlIDEwMDY0NAo+IC0tLSBhL2ZzL2pmZnMyL2Rpci5jCj4gKysrIGIv
ZnMvamZmczIvZGlyLmMKPiBAQCAtMjYxLDggKzI2MSw3IEBAIHN0YXRpYyBpbnQgamZmczJfbGlu
ayAoc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwgc3RydWN0IGlub2RlICpkaXJfaSwgc3RydWN0
IGRlCj4gICAJaWYgKGRfaXNfZGlyKG9sZF9kZW50cnkpKQo+ICAgCQlyZXR1cm4gLUVQRVJNOwo+
ICAgCj4gLQkvKiBYWFg6IFRoaXMgaXMgdWdseSAqLwo+IC0JdHlwZSA9IChkX2lub2RlKG9sZF9k
ZW50cnkpLT5pX21vZGUgJiBTX0lGTVQpID4+IDEyOwo+ICsJdHlwZSA9IGZzX3Vtb2RlX3RvX2R0
eXBlKGRfaW5vZGUob2xkX2RlbnRyeSktPmlfbW9kZSk7Cj4gICAJaWYgKCF0eXBlKSB0eXBlID0g
RFRfUkVHOwo+ICAgCj4gICAJbm93ID0gSkZGUzJfTk9XKCk7Cj4gQEAgLTczMCwxMCArNzI5LDcg
QEAgc3RhdGljIGludCBqZmZzMl9ta25vZCAoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHN0cnVj
dCBpbm9kZSAqZGlyX2ksCj4gICAJcmQtPmlubyA9IGNwdV90b19qZTMyKGlub2RlLT5pX2lubyk7
Cj4gICAJcmQtPm1jdGltZSA9IGNwdV90b19qZTMyKEpGRlMyX05PVygpKTsKPiAgIAlyZC0+bnNp
emUgPSBuYW1lbGVuOwo+IC0KPiAtCS8qIFhYWDogVGhpcyBpcyB1Z2x5LiAqLwo+IC0JcmQtPnR5
cGUgPSAobW9kZSAmIFNfSUZNVCkgPj4gMTI7Cj4gLQo+ICsJcmQtPnR5cGUgPSBmc191bW9kZV90
b19kdHlwZShtb2RlKTsKPiAgIAlyZC0+bm9kZV9jcmMgPSBjcHVfdG9famUzMihjcmMzMigwLCBy
ZCwgc2l6ZW9mKCpyZCktOCkpOwo+ICAgCXJkLT5uYW1lX2NyYyA9IGNwdV90b19qZTMyKGNyYzMy
KDAsIGRlbnRyeS0+ZF9uYW1lLm5hbWUsIG5hbWVsZW4pKTsKPiAgIAo+IEBAIC04MTEsOCArODA3
LDcgQEAgc3RhdGljIGludCBqZmZzMl9yZW5hbWUgKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLAo+
ICAgCj4gICAJLyogTWFrZSBhIGhhcmQgbGluayAqLwo+ICAgCj4gLQkvKiBYWFg6IFRoaXMgaXMg
dWdseSAqLwo+IC0JdHlwZSA9IChkX2lub2RlKG9sZF9kZW50cnkpLT5pX21vZGUgJiBTX0lGTVQp
ID4+IDEyOwo+ICsJdHlwZSA9IGZzX3Vtb2RlX3RvX2R0eXBlKGRfaW5vZGUob2xkX2RlbnRyeSkt
PmlfbW9kZSk7Cj4gICAJaWYgKCF0eXBlKSB0eXBlID0gRFRfUkVHOwo+ICAgCj4gICAJbm93ID0g
SkZGUzJfTk9XKCk7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
