Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15DAC25B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYtNNhUi5srqzV14c/WgcfeSA7un6ZapD01fGNEKT2M=; b=qzrbcmQUqXj6qpUyrd6ojhMJ+U
	aYmsaQhAVC0n+f60ZUJ6rsVUe371a/wMpju3u0yxFiddjBbXmcrzTCjLpXvfBoZ0vjWXQR0wes588
	HZZ6A1515fApOiJl/Iyj25oosl0j57dgX6Cmy2S4o+Kb/9pX1nC0pJusKBKkdZeWCQJS712fAUjH1
	JKqoMvJr3xQcS1QpfDSGoB3CWbfg8/AOmLquIuqcFg2EK+9h7HrUQdN8/a5bbuoj3jBvFffAWLd+f
	JXKUce/Ap9v8LNXIzb8qvyjf7dJAFo9+UWz5cMfrYoMH8KokIDZuNwshTbccB0n88bRupkWRBx+nM
	JLaTZfyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOvM-00000001ZQn-1NTC;
	Tue, 04 Jun 2024 07:49:40 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOvK-00000001ZQG-12qk
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 07:49:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VtjLh75PVzwRT6;
	Tue,  4 Jun 2024 15:45:32 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 26B4C18007A;
	Tue,  4 Jun 2024 15:49:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 15:49:27 +0800
Subject: Re: [PATCH 0/2] ubifs: Fix two problems for checking lpt space
 statistics
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>
References: <20240529111219.3964764-1-chengzhihao1@huawei.com>
Message-ID: <2437b486-50ec-68e0-7c90-9a768796b513@huawei.com>
Date: Tue, 4 Jun 2024 15:49:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240529111219.3964764-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_004938_481097_F8B930D9 
X-CRM114-Status: UNSURE (   6.62  )
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

1NogMjAyNC81LzI5IDE5OjEyLCBaaGloYW8gQ2hlbmcg0LS1wDoKPiAKPiBaaGloYW8gQ2hlbmcg
KDIpOgo+ICAgIHViaWZzOiBkYmdfY2hlY2tfbHRhYjogRml4IHdyb25nIGxwcm9wcyB0YWJsZSBp
bmZvcm1hdGlvbiBjYXVzZWQgYnkKPiAgICAgIG1pc3Npbmcgbm5vZGUgbG9hZGluZwo+ICAgIHVi
aWZzOiBkYmdfY2hlY2tfbHRhYjogRml4IHdyb25nIGxwcm9wcyB0YWJsZSBpbmZvcm1hdGlvbiBj
YXVzZWQgYnkKPiAgICAgIG1pc3NpbmcgcG5vZGUgY2hlY2tpbmcKPiAKPiAgIGZzL3ViaWZzL2xw
dF9jb21taXQuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkK
PiAKCk5BQ0sKUGxlYXNlIGlnbm9yZSB0aGVzZSAyIHBhdGNoZXMsIHRoZSBwcm9ibGVtIHdvbid0
IGhhcHBlbiBvbiBjdXJyZW50IAppbXBsZW1lbnRhdGlvbnMgb3IgbWtmcyB0b29scywgbXkgbWlz
dGFrZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
