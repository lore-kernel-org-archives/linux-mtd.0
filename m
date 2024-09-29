Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D85ACF6495
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 02:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhqgHv8AUSfzW1SEzmRG2uhZK+JBkg/dIHuXUOMZ7XE=; b=uHp4eFfdnSv/mdpvYuGWaBns79
	PEmmjMIT7ks2Ix8JahFuVwnqCWA3ctlKzs0exs2JGQrB/OsXW/ixAlszjlFVll3bLcB+LrVIhmGzW
	LKF8DURZW0r3IWZcJfpcQhH5d6K1yd1gdT04LFpjkeBfDA6CXrJp+mT29tPj4kS4Uq0kO6XaD2j9j
	2Q+xdyVJ4AI7mhnb+guJdTdkxpIV29kfcMY4Cx1NalDyybRX27/kDas9BdxVqIWHpDXgvx6NE4TG7
	hoMps8rhScucBLQQR6dR+Z8MdOH4zI2WB69oCj5Mcz1II//GYhnhlFXlbOyLxUmxLapZG8Iv9xmdL
	csqR/RfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sujQq-0000000DxXN-0D9M;
	Sun, 29 Sep 2024 02:13:08 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sujQm-0000000DxWq-3pNR
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 02:13:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XGSQz6YTYz1ymWn
	for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2024 10:12:59 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 8624B1A0188
	for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2024 10:12:57 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 10:12:57 +0800
Subject: Re: [PATCH] mkfs.jffs2: fix segfault when parsing dev table
To: Rosen Penev <rosenp@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20240927211409.874433-1-rosenp@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <18f3834a-6d36-3baf-5a9a-1cde442b5f0e@huawei.com>
Date: Sun, 29 Sep 2024 10:12:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240927211409.874433-1-rosenp@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_191305_260632_ABF790CB 
X-CRM114-Status: GOOD (  14.32  )
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

1NogMjAyNC85LzI4IDU6MTQsIFJvc2VuIFBlbmV2INC0tcA6Cj4gTWFrZSBzdXJlIHRoYXQgYWxs
IDEwIGl0ZW1zIGFyZSBwYXJzZWQgY29ycmVjdGx5LiBPbmUgaXNzdWUgb3RoZXJ3aXNlIGlzCj4g
YSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2hlbiB0aGUgZmlyc3QgaXRlbSBpcyBub3QgZm91
bmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9zZW4gUGVuZXYgPHJvc2VucEBnbWFpbC5jb20+Cj4g
LS0tCj4gICBqZmZzWC11dGlscy9ta2ZzLmpmZnMyLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvamZmc1gt
dXRpbHMvbWtmcy5qZmZzMi5jIGIvamZmc1gtdXRpbHMvbWtmcy5qZmZzMi5jCj4gaW5kZXggYjlk
ZDk2Yi4uNjNkYWMxYyAxMDA2NDQKPiAtLS0gYS9qZmZzWC11dGlscy9ta2ZzLmpmZnMyLmMKPiAr
KysgYi9qZmZzWC11dGlscy9ta2ZzLmpmZnMyLmMKPiBAQCAtNDI4LDcgKzQyOCw3IEBAIHN0YXRp
YyBpbnQgaW50ZXJwcmV0X3RhYmxlX2VudHJ5KHN0cnVjdCBmaWxlc3lzdGVtX2VudHJ5ICpyb290
LCBjaGFyICpsaW5lKQo+ICAgCj4gICAJaWYgKHNzY2FuZiAobGluZSwgIiUiIFNDQU5GX1BSRUZJ
WCAicyAlYyAlbG8gJWx1ICVsdSAlbHUgJWx1ICVsdSAlbHUgJWx1IiwKPiAgIAkJCQlTQ0FORl9T
VFJJTkcobmFtZSksICZ0eXBlLCAmbW9kZSwgJnVpZCwgJmdpZCwgJm1ham9yLCAmbWlub3IsCj4g
LQkJCQkmc3RhcnQsICZpbmNyZW1lbnQsICZjb3VudCkgPCAwKQo+ICsJCQkJJnN0YXJ0LCAmaW5j
cmVtZW50LCAmY291bnQpIDwgMTApCgoKVGhlIGxhc3QgOCB2YXJpYWJsZXMgYXJlIGluaXRpYWxp
emVkIGVhcmxpZXIsIGhvdyBhYm91dCBjaGFuZ2luZyBsaWtlIApmb2xsb3dpbmc/CgkJCQkmc3Rh
cnQsICZpbmNyZW1lbnQsICZjb3VudCkgPCAyKQo+ICAgCXsKPiAgIAkJcmV0dXJuIDE7Cj4gICAJ
fQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
