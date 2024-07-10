Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616D2C3DA45
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peDmG5NeH9DW/Y6Yh+PiJJVzHvgya5LUD7NUWQINDgQ=; b=iexJZGrY4EH/rKTqtxPRE3EvOh
	jBKGTj79dpNWIyXgvjo3yROlHhPHjjGUtHZQCWtj9Kv/AhVh5+KU9r730CUfG1wWz9ljBAX49mCZh
	cOQcgHpFfGfx6ObbZfcZiDJRTk2pg//rIPKaccWO3KCZz3sM4eVt/JGeJTuhS1e6Nq2y628YieNn6
	PWAjftldhvEWgACiOpeCBOJ7avjIeegXnfjIY84RpvCvx7Fv3Ygk1erbmE7LI0blGIdq0om6VFNgW
	FfYVguQX1gYmj/gmhN6f3A0bbsgq3ZrzEo7DRV3KGT0d5WKXU3+t/LvhbgQJo5N7CGs+pB+HfdEZI
	lID0Igvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVjK-0000000AOpi-457i;
	Wed, 10 Jul 2024 11:43:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVjG-0000000AOo2-3Jaq
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 11:43:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WJwqt6mMrzQlCG;
	Wed, 10 Jul 2024 19:39:22 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id C79451402CC;
	Wed, 10 Jul 2024 19:43:18 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 19:43:18 +0800
Subject: Re: [PATCH] libubi: ubi_update_start: slightly improve documentation
To: Christian Eggers <ceggers@arri.de>, <linux-mtd@lists.infradead.org>
CC: <stefano.babic@swupdate.org>
References: <20240710112904.15172-1-ceggers@arri.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b8d42355-5662-4a68-16e9-d8c7a27c750e@huawei.com>
Date: Wed, 10 Jul 2024 19:43:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240710112904.15172-1-ceggers@arri.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_044323_041749_2596919A 
X-CRM114-Status: GOOD (  17.97  )
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

1NogMjAyNC83LzEwIDE5OjI5LCBDaHJpc3RpYW4gRWdnZXJzINC0tcA6Cj4gQ2FsbGluZyB1Ymlf
dXBkYXRlX3N0YXJ0KCkgbWF5IGZhaWwgaWYgZXhjbHVzaXZlIGFjY2VzcyB0byB0aGUgVUJJCj4g
dm9sdW1lIGNhbm5vdCBiZSBlc3RhYmxpc2hlZCBieSB0aGUga2VybmVsLiBUaGlzIGlzIGxpa2Vs
eSB0byBoYXBwZW4gaWYKPiBhbiBVQkkgdm9sdW1lIGlzIHVwZGF0ZWQgZGlyZWN0bHkgYWZ0ZXIg
Y3JlYXRpb24sIGJlY2F1c2UgY3VycmVudAo+IHZlcnNpb25zIG9mIChzeXN0ZW1kLSl1ZGV2ZCBy
dW4gdGhlaXIgaW50ZXJuYWwgJ2Jsa2lkJyBhbHNvIGZvciBVQkkKPiB2b2x1bWVzIGFzIHNvb24g
YXMgdGhleSBhcHBlYXIgKHRyeWluZyB0byByZWFkIHRoZSBVQklGUyBVVUlEKS4KPiAKPiBUaGVy
ZSBhcmUgbWFpbmx5IHRvIG9wdGlvbnMgZm9yIHRoaXMgY2FzZToKPiAxLiBEb24ndCBhbGxvdyB1
ZGV2ZCB0byByZWFkIFVCSSB2b2x1bWVzIGF0IGFsbCAobWVhbnMgbG9vc2luZwo+IGZ1bmN0aW9u
YXRsaXR5KQo+IDIuIFdhaXQgdW50aWwgdWRldmQgaGFzIGZpbmlzaGVkIGFjY2Vzc2luZyBhIG5l
dyB2b2x1bWUgKHJlcXVpcmVzCj4gY29vcGVyYXRpb24gd2l0aCB1ZGV2ZCkKPiAzLiBTaW1wbHkg
cmV0cnkgYWZ0ZXIgc2hvcnQgdGltZSBpbiBjYXNlIG9mIEVCVVNZCj4gCj4gRm9yIHVzaW5nIG9w
dGlvbiAzLCB0aGUgZG9jdW1lbnRhdGlvbiBzaG91bGQgc3RhdGUgdGhhdCB0aGUgY29uY3JldGUK
PiBlcnJvciBjb2RlIGNhbiBiZSByZWFkIHZpYSBlcnJubyAodGhpcyBoYXMgYWx3YXlzIGJlZW4g
dGhlIGNhc2Ugc2luY2UKPiBsaWJ1YmkgaGFzIGJlZW4gaW50cm9kdWNlZCkuCj4gCj4gTGluazog
aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9nL3N3dXBkYXRlL2MvOE5Wb29LakQ5b28KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gRWdnZXJzIDxjZWdnZXJzQGFycmkuZGU+Cj4gLS0tCgpSZXZp
ZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCj4gICBpbmNs
dWRlL2xpYnViaS5oIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpYnViaS5oIGIvaW5j
bHVkZS9saWJ1YmkuaAo+IGluZGV4IGUxZTIzNGUxYjAxYi4uOWNiNTAzN2JiOTJhIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGlidWJpLmgKPiArKysgYi9pbmNsdWRlL2xpYnViaS5oCj4gQEAgLTQz
MSw4ICs0MzEsOCBAQCBpbnQgdWJpX3ZvbF9ibG9ja19yZW1vdmUoaW50IGZkKTsKPiAgICAqIEBi
eXRlczogaG93IG1hbnkgYnl0ZXMgd2lsbCBiZSB3cml0dGVuIHRvIHRoZSB2b2x1bWUKPiAgICAq
Cj4gICAgKiBUaGlzIGZ1bmN0aW9uIGluaXRpYXRlcyBVQkkgdm9sdW1lIHVwZGF0ZSBhbmQgcmV0
dXJucyAlMCBpbiBjYXNlIG9mIHN1Y2Nlc3MKPiAtICogYW5kICUtMSBpbiBjYXNlIG9mIGVycm9y
LiBUaGUgY2FsbGVyIGlzIGFzc3VtZWQgdG8gd3JpdGUgQGJ5dGVzIGRhdGEgdG8gdGhlCj4gLSAq
IHZvbHVtZSBAZmQgYWZ0ZXJ3YXJkLgo+ICsgKiBhbmQgJS0xIGluIGNhc2Ugb2YgZXJyb3IgKGVy
cm5vIGlzIHNldCkuIFRoZSBjYWxsZXIgaXMgYXNzdW1lZCB0byB3cml0ZQo+ICsgKiBAYnl0ZXMg
ZGF0YSB0byB0aGUgdm9sdW1lIEBmZCBhZnRlcndhcmQuCj4gICAgKi8KPiAgIGludCB1YmlfdXBk
YXRlX3N0YXJ0KGxpYnViaV90IGRlc2MsIGludCBmZCwgbG9uZyBsb25nIGJ5dGVzKTsKPiAgIAo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
