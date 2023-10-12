Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E1DCDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZyhmQZJZ21+HeE8YN1+lgEmmjcTVpu5L5+C8Pwlczk=; b=O9nLP5o2l6jhkF
	iLBPbopuFAW0zZEmZR486DlbfuZvq6hbTyP/8U9YizxoPQLieyQKxXk1czpM2YnifQcWvUcPO8SPT
	mVZt9MFttYm5D7C19yOUHemer/43ZiIXHJUU8Y2EKOEmjYKait41XCQJmgnF5EDQEFtjdUQ8sb4nP
	7ZRxQlZ62+qKfV8/icUTarH/SB9AouCOqJp8U/3dVYyQR6I+2ucneiBgdOOFlbp6jL9LJ17gkFI9c
	8EF9vfsaQfXxTKYjByK0+d2jWj7CyO+u3KGLpuT1CJsrIXjzK52tqO8fnTsn9WO34Ixc9Fs3uDfEf
	t0duwekRGmeYGJcC+QTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtuc-000mSm-0d;
	Thu, 12 Oct 2023 11:31:30 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtuZ-000mRc-2M
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 11:31:29 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S5nRZ1c26z9tJ9;
	Thu, 12 Oct 2023 19:27:22 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 19:31:18 +0800
Message-ID: <e1e25755-432d-fd8d-c3f6-7752f68e037e@huawei.com>
Date: Thu, 12 Oct 2023 19:31:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231010142925.545238-1-wangzhaolong1@huawei.com>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <20231010142925.545238-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_043128_015607_D0238698 
X-CRM114-Status: UNSURE (   3.92  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJpZW5kbHkgcGluZyAuLi4KCj4gSWYgYm90aCBmbHQua28gYW5kIGdsdWViaS5rbyBhcmUgbG9h
ZGVkLCB0aGUgbm90aWllciBvZiBmdGwKPiB0cmlnZ2VycyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2Ugd2hlbiB0cnlpbmcgdG8gdmlzaXQKPiDigJhnbHVlYmktPmRlc2PigJkgaW4gZ2x1ZWJpX3Jl
YWQoKS4KPiAKPiB1YmlfZ2x1ZWJpX2luaXQKPiAgICB1YmlfcmVnaXN0ZXJfdm9sdW1lX25vdGlm
aWVyCj4gICAgICB1YmlfZW51bWVyYXRlX3ZvbHVtZXMKPiAgICAgICAgdWJpX25vdGlmeV9hbGwK
PiAgICAgICAgICBnbHVlYmlfbm90aWZ5ICAgIG5iLT5ub3RpZmllcl9jYWxsKCkKPiAgICAgICAg
ICAgIGdsdWViaV9jcmVhdGUKPiAgICAgICAgICAgICAgbXRkX2RldmljZV9yZWdpc3Rlcgo+ICAg
ICAgICAgICAgICAgIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIKPiAgICAgICAgICAgICAgICAg
IGFkZF9tdGRfZGV2aWNlCj4gICAgICAgICAgICAgICAgICAgIGJsa3RyYW5zX25vdGlmeV9hZGQg
ICBub3QtPmFkZCgpCj4gICAgICAgICAgICAgICAgICAgICAgZnRsX2FkZF9tdGQgICAgICAgICB0
ci0+YWRkX210ZCgpCj4gICAgICAgICAgICAgICAgICAgICAgICBzY2FuX2hlYWRlcgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG10ZF9yZWFkCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZF9vb2IKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2x1ZWJpX3JlYWQgICBtdGQtPnJlYWQoKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdsdWViaS0+ZGVzYyAtIE5VTEwKPiAK
PiBEZXRhaWxlZCByZXByb2R1Y3Rpb24gaW5mb3JtYXRpb24gYXZhaWxhYmxlIGF0IHRoZSBsaW5r
WzFdLAo+IAo+IEluIHRoZSBub3JtYWwgY2FzZSwgb2J0YWluIGdsdWViaS0+ZGVzYyBpbiB0aGUg
Z2x1ZWJpX2dldF9kZXZpY2UoKSwKPiBhbmQgYWNjZXNzZXMgZ2x1ZWJpLT5kZXNjIGluIHRoZSBn
bHVlYmlfcmVhZCgpLiBIb3dldmVyLAo+IGdsdWViaV9nZXRfZGV2aWNlKCkgaXMgbm90IGV4ZWN1
dGVkIGluIGFkdmFuY2UgaW4gdGhlCj4gZnRsX2FkZF9tdGQoKSBwcm9jZXNzLCB3aGljaCBsZWFk
cyB0byBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
