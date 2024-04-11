Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87B5CD1292
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 03:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKqfMlV9u5iC3rNpOU0jDog793jTqgAhVH4nezPdh7k=; b=U2cZkq9Ce/bhmlrYtf5sNWbBSV
	xvIEE0qvlxKF/sIypirWr/vnd6RkNg0oXeOch3vvniAUKlJF10yfQ5UNeBzkvhNKbIdOr6qD2DeUt
	aiHguKJVMOllD9ffzkkgqrgA+IIqpL5F6c7nOU4qQSgs1RCa1z5rq4MH7PknmQ2xGsqgaJ2tMSUqL
	+3wrgE0w1qR88QD3KynSgG+FF1hNnXmUwovW+G4Qlz+7SVh/geVrZIqEqvSZdaJIk7Qhp7xZiE0C5
	kcJNUbT+lVbv7XisN5XFE8yhg5qwXz4gdABDd8YFUZPCkiraxpgxMJylvT+lbKk3ciJqS7s4WI+pI
	amdoJ4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul9N-0000000AA98-3QkW;
	Thu, 11 Apr 2024 03:30:57 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul9K-0000000AA82-1I4K
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 03:30:56 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VFQBG4w46z29lfj;
	Thu, 11 Apr 2024 11:27:50 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 33F711400D9;
	Thu, 11 Apr 2024 11:30:43 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 11:30:42 +0800
Subject: Re: [PATCH 0/2] mtd: ubi: Fix some initialisation failure cases
To: Ben Hutchings <ben.hutchings@mind.be>, <linux-mtd@lists.infradead.org>
References: <cover.1712788087.git.ben.hutchings@mind.be>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f6191bef-9adb-9517-762d-ac95ebd3a4d1@huawei.com>
Date: Thu, 11 Apr 2024 11:30:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1712788087.git.ben.hutchings@mind.be>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_203054_666700_55E5AF69 
X-CRM114-Status: GOOD (  14.23  )
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

1NogMjAyNC80LzExIDY6NDIsIEJlbiBIdXRjaGluZ3Mg0LS1wDoKPiB1YmkgY3VycmVudGx5IGZh
aWxzIHRvIGluaXRpYWxpc2UgaWYgZGVidWdmcyBpcyBlbmFibGVkIGF0IGJ1aWxkIHRpbWUKPiBi
dXQgZGlzYWJsZWQgYXQgYm9vdCB0aW1lIChDT05GSUdfREVCVUdfRlMgaXMgZW5hYmxlZCBhbmQg
ZGVidWdmcz1vZmYKPiBpcyBzZXQgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUpLiAgRXJyb3Jz
IGZyb20gZGVidWdmcyBzaG91bGQgYWx3YXlzCj4gYmUgaWdub3JlZCBidXQgdGhpcyB3YXNuJ3Qg
ZG9uZSBldmVyeXdoZXJlLgo+IAo+IFdoaWxlIGZpeGluZyB0aGlzIEkgYWxzbyBub3RpY2VkIHRo
YXQgYSByZWNlbnQgY2hhbmdlIHRvIHViaSByZW1vdmVkCj4gc29tZSBjbGVhbnVwIGZyb20gdGhl
IHViaV9pbml0KCkgZmFpbHVyZSBwYXRoIHRoYXQgSSB0aGluayBpcyBzdGlsbAo+IG5lZWRlZC4K
PiAKPiBUaGlzIHNlcmllcyBzaG91bGQgZml4IGJvdGggcHJvYmxlbXMuCj4gCj4gQmVuLgoKSGks
IEJlbi4gSSBoYXZlIGEgc2FtZSBwYXRjaCB3aXRoIHlvdXIgZmlyc3Qgb25lLCBJIGhhdmUgbWVy
Z2Ugb3VyIApwYXRjaHNldCBpbnRvIGEgbmV3IHNlcmllcyBbMV0KWzFdIApodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDA0MTEwMzE5MDMuMzA1MDI3OC0xLWNoZW5nemhpaGFv
MUBodWF3ZWkuY29tLwo+IAo+IEJlbiBIdXRjaGluZ3MgKDIpOgo+ICAgIG10ZDogdWJpOiBSZXN0
b3JlIG1pc3NpbmcgY2xlYW51cCBvbiB1YmlfaW5pdCgpIGZhaWx1cmUgcGF0aAo+ICAgIG10ZDog
dWJpOiBJZ25vcmUgYWxsIGRlYnVnZnMgaW5pdGlhbGlzYXRpb24gZmFpbHVyZXMKPiAKPiAgIGRy
aXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgMTUgKysrKysrLS0tLS0tLS0tCj4gICBkcml2ZXJzL210
ZC91YmkvZGVidWcuYyB8IDMzICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAg
ZHJpdmVycy9tdGQvdWJpL2RlYnVnLmggfCAgNCArKy0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
