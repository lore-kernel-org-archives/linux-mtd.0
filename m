Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC89EE77184
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 03:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ka824qt6SR9ffDjGjPVgRLZWVxBzXPDlGIlUt2EYJs=; b=QSHZj5LcMiz6n28WAKzzGbNoG8
	dgjP3dX+kKsjX8ZFcQk4vLtmfv3wPeIoGKktlhQQyMx1m5vnQFA+pryVPXJUrOl7LV2g1vj410U+W
	aDSbCtOadVm79vJf1GzUBSRlrwKfKu8aOsamKGg7ZHq5b5T40mYvp9ZvQv2PDaD7PDvxAE0Rj/ggB
	r8a14BzCLALzmloGuRvwlc1pgXyrT7b08sE0QO89G9ZJnGf7oN3D+0h+KGFAMqSFUu18imNvuEDOC
	mlOBo8S7rQpJjdh2imLy7fsBCLpdPJFeDbCnVNWcByjEUrwrape/FjOWRonPLRWQ0k54FvF8kVCJp
	42rpkbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkIW-0000000FRhO-3Tmy;
	Wed, 18 Dec 2024 03:00:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkIU-0000000FRgd-3hWl
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 03:00:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YCddl1bTGzhZXQ
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 10:57:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F2B61800D9
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 11:00:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Dec 2024 11:00:18 +0800
Subject: Re: [PATCH mtd-utils] ffsX-utils: Fix integer overflow in
 jffs2reader.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241217204317.383644-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <251e989f-c629-910d-ab6c-b8565d04fefd@huawei.com>
Date: Wed, 18 Dec 2024 11:00:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241217204317.383644-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_190027_101721_168CE290 
X-CRM114-Status: GOOD (  14.91  )
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

1NogMjAyNC8xMi8xOCA0OjQzLCBBbnRvbiBNb3J5YWtvdiDQtLXAOgo+IFJlcG9ydCBvZiB0aGUg
c3RhdGljIGFuYWx5emVyOgo+IFBvaW50ZXIgJ3BhdGgnLCByZXR1cm5lZCBmcm9tIGZ1bmN0aW9u
ICd4c3RyZHVwJyBhdCBqZmZzMnJlYWRlci5jOjY5MCwgbWF5IGJlIE5VTEwgYW5kIGlzIGRlcmVm
ZXJlbmNlZCBhdCBqZmZzMnJlYWRlci5jOjY5Mi4KPiAKPiBDb3JyZWN0aW9ucyBleHBsYWluZWQ6
Cj4gQWZ0ZXIgY2FsbGluZyB4c3RyZHVwKHApLCBhIHBhdGggPT0gTlVMTCBjaGVjayBoYXMgYmVl
biBhZGRlZC4gVGhpcyBwcmV2ZW50cyBhIHBvc3NpYmxlIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5j
ZSBpbiB0aGUgZXZlbnQgb2YgYSBtZW1vcnkgYWxsb2NhdGlvbiBlcnJvci4KPiAKPiBUcmlnZ2Vy
cyBmb3VuZCBieSBzdGF0aWMgYW5hbHl6ZXIgU3ZhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50
b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdtYWlsLmNvbT4KPiAKPiAtLS0KPiAgIGpmZnNY
LXV0aWxzL2pmZnMycmVhZGVyLmMgfCA1ICsrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2pmZnNYLXV0aWxzL2pmZnMycmVhZGVyLmMgYi9q
ZmZzWC11dGlscy9qZmZzMnJlYWRlci5jCj4gaW5kZXggODdhMjE2Ny4uZjc3NjQ2NiAxMDA2NDQK
PiAtLS0gYS9qZmZzWC11dGlscy9qZmZzMnJlYWRlci5jCj4gKysrIGIvamZmc1gtdXRpbHMvamZm
czJyZWFkZXIuYwo+IEBAIC02OTQsNiArNjk0LDExIEBAIHN0YXRpYyBzdHJ1Y3QgamZmczJfcmF3
X2RpcmVudCAqcmVzb2x2ZXBhdGgwKGNoYXIgKm8sIHNpemVfdCBzaXplLCB1aW50MzJfdCBpbm8s
Cj4gICAKPiAgIAlwcCA9IHBhdGggPSB4c3RyZHVwKHApOwoKQWxsIGNhbGxlcnMgZm9yIHJlc29s
dmVwYXRoMCgpIG1ha2Ugc3VyZSB0aGF0IGFyZ3VtZW50ICdwJyBpcyBub3QgTlVMTCwgCnNvIEkg
dGhpbmsgd2UgY2FuIGtlZXAgbm90IHRvIGNoYW5nZSBpdC4KPiAgIAo+ICsJaWYocGF0aCA9PSBO
VUxMKXsKPiArCQkqaW5vcyA9IDA7Cj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwl9Cj4gKwo+ICAgCWlm
ICgqcGF0aCA9PSAnLycpIHsKPiAgIAkJcGF0aCsrOwo+ICAgCQlpbm8gPSAxOwo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
