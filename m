Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF3AC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ua21K6pvX8yHvGsDF26FWFKQ4D4GSjNlYiIm4S3GSgE=; b=o4ACy6kjyPHUiqO1XUxj0ynQLh
	v1GdPCV4VUxdp622CQ0QFIjFmhE8BiOkCGKFjV3J67ALEF6yKKywIwX4zojhPaZ5vZvyRWw2DkNn+
	e61kpUZfvxsCOefCCh7ZWsEBHsG+6e6gFw+adG+URHuTgLCVr6osusMpgQXXuCCX1BLuaf7Euidae
	eUHbxG20AFoXJiKxRIasNdm/JqoKOyDIoC9x1flIHSAQEz27PjgiuhM+5To+tx9kh2zrkZ1tA06Al
	bP+JopdmmO1pxMyk/KRKORRd8yYlvQ+BQS8vttU9bkGrqeCDi/A8orou+nVgahYoQ0HwWGHvkBf9X
	IdMFPm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysTo-00BLDu-2r;
	Fri, 03 Nov 2023 11:36:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysTm-00BLDI-0y
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 11:36:47 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SMJXc0k0rzrV35;
	Fri,  3 Nov 2023 19:33:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 3 Nov 2023 19:36:40 +0800
Subject: Re: [PATCH v4 3/5] ubi: Add six fault injection type for testing
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231103065536.3778940-1-wangzhaolong1@huawei.com>
 <20231103065536.3778940-4-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f4f9fd14-23a6-0ce1-fedc-7428123a63f3@huawei.com>
Date: Fri, 3 Nov 2023 19:36:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231103065536.3778940-4-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_043646_506726_B2895D71 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

1NogMjAyMy8xMS8zIDE0OjU1LCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gVGhpcyBjb21taXQgYWRk
cyBzaXggZmF1bHQgaW5qZWN0aW9uIHR5cGUgZm9yIHRlc3RpbmcgdG8gY292ZXIgdGhlCj4gYWJu
b3JtYWwgcGF0aCBvZiB0aGUgVUJJIGRyaXZlci4KPgo+IEluamVjdCB0aGUgZm9sbG93aW5nIGZh
dWx0cyB3aGVuIHRoZSBVQkkgcmVhZHMgdGhlIExFQjoKPiAgICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgfCAgICBJ
bnRlcmZhY2UgbmFtZSAgICAgICAgICB8ICAgICAgIGVtdWxhdGUgYmVoYXZpb3IgICAgICAgICAg
ICB8Cj4gICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsKPiAgIHwgIGVtdWxhdGVfZWNjZXJyICAgICAgICAgICAgfCBFQ0Mg
ZXJyb3IgICAgICAgICAgICAgICAgICAgICAgICAgfAo+ICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gICB8ICBlbXVs
YXRlX3JlYWRfZmFpbHVyZSAgICAgIHwgcmVhZCBmYWlsdXJlICAgICAgICAgICAgICAgICAgICAg
IHwKPiAgIHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKwo+ICAgfCAgZW11bGF0ZV9pb19mZiAgICAgICAgICAgICB8IHJlYWQg
Y29udGVudCBhcyBhbGwgRkYgICAgICAgICAgICB8Cj4gICB8LS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiAgIHwgIGVtdWxh
dGVfaW9fZmZfYml0ZmxpcHMgICAgfCBjb250ZW50IEZGIHdpdGggTVREIGVyciByZXBvcnRlZCAg
fAo+ICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0rCj4gICB8ICBlbXVsYXRlX2JhZF9oZHIgICAgICAgICAgIHwgYmFkIGxl
YiBoZWFkZXIgICAgICAgICAgICAgICAgICAgIHwKPiAgIHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgfCAgZW11bGF0
ZV9iYWRfaGRyX2ViYWRtc2cgICB8IGJhZCBoZWFkZXIgd2l0aCBFQ0MgZXJyICAgICAgICAgICB8
Cj4gICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsKPgo+IFNpZ25lZC1vZmYtYnk6IFpoYW9Mb25nIFdhbmcgPHdhbmd6aGFv
bG9uZzFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5jIHwgIDMw
ICsrKysrKysKPiAgIGRyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5oIHwgMTcyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9pby5jICAgIHwg
IDc2ICsrKysrKysrKysrKysrKysrLQo+ICAgZHJpdmVycy9tdGQvdWJpL3ViaS5oICAgfCAgMzAg
KysrKy0tLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyODcgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
