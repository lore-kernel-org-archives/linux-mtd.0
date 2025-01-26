Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C28C02191
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=onHlxyEmpkHzV4GDr1AwUFwVQaoTS4Mev7C138jJHWM=; b=W8JDumcvPxzukO
	TvVDRT7sDZUnOwPoQ+O7qVYZua2ZWQah+SeX5V22x+D+SYzLdDwIcNVce6CfkiSvz8djVwtFP+LB7
	BUDcFByT5lt45kEJep0xPBSF4x3Ie8nxKxNfYHHOBhK2PDvr98uX8OtH5k1d0NF0AzVqPB2Vr8tk5
	ZLms0HEcHclduzx5k0aWRJIiJx7tfwsSFb6l0jM4H1uwnHamJzriDYTFw/L0riFp0mlYTRqZfN/55
	PspHO8VXPKHu1dSNyhFoZY5WUejSFAXwfhLZx9YXzZdBeasrc7QZ0LYWZNM8v+bG3872u/ZtDyJy0
	c0KG9Jr/S9JtjrZNxGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQq-0000000HALM-27V9;
	Sun, 26 Jan 2025 06:47:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQm-0000000HAIu-28OW
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yghps21XDz1kygl;
	Sun, 26 Jan 2025 14:44:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E81C1402C1;
	Sun, 26 Jan 2025 14:47:29 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:28 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 0/7] Fix some compiling warnings and update source files from latest linux kernel
Date: Sun, 26 Jan 2025 14:41:56 +0800
Message-ID: <20250126064203.3348494-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224740_737921_4787719C 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

WmhpaGFvIENoZW5nICg3KToKICB1YmktdXRpbHM6IG10ZGluZm86IEZpeCB0eXBlIHRydW5jYXRp
b24gY29tcGlsaW5nIHdhcm5pbmcgZm9yICdzdGFydCcKICAgIHZhcmlhYmxlCiAgbmFuZC11dGls
czogbmFuZGR1bXA6IEZpeCB1bmV4cGVjdGVkIHR5cGUgY29tcGlsaW5nIHdhcm5pbmcgZm9yCiAg
ICBhcmd1bWVudCAnZHVtcGZpbGUnCiAgbWlzYy11dGlsczogZmxhc2hjcDogRml4IHVuaW5pdGlh
bGl6ZWQgdmFyaWFibGUg4oCYd3JsYXN0X2J1ZuKAmSBjb21waWxpbmcKICAgIHdhcm5pbmcKICBq
ZmZzWC11dGlsczogamZmczJyZWFkZXI6IEZpeCBwb3RlbnRpYWwgbnVsbCBwb2ludGVyIGRlcmVm
ZXJlbmNlCiAgICBjb21waWxpbmcgd2FybmluZyBmb3IgJ3BhdGgnCiAgdGVzdHM6IGNoZWNrZnM6
IEFkZCBwcmV2aW91cyBwcm90b3R5cGUgZm9yIGRvX3B3cl9kbigpCiAgdWJpZnMtdXRpbHM6IGNv
bW1vbjogQWRkIGRlc2NyaXRwaW9ucyBmb3IgbGludXgga2VybmVsIHJlc291cmNlIGZpbGVzCiAg
dWJpZnMtdXRpbHM6IGxpYnViaWZzOiBVcGRhdGUgc291cmNlIGZpbGVzIGZyb20gbGludXgga2Vy
bmVsIDYuMTMtcmM3CgogamZmc1gtdXRpbHMvamZmczJyZWFkZXIuYyAgICAgICAgIHwgIDMgKysr
CiBtaXNjLXV0aWxzL2ZsYXNoY3AuYyAgICAgICAgICAgICAgfCAgMiArLQogbmFuZC11dGlscy9u
YW5kZHVtcC5jICAgICAgICAgICAgIHwgIDUgKysrLS0KIHRlc3RzL2NoZWNrZnMvY29tbS5jICAg
ICAgICAgICAgICB8ICAyICsrCiB1YmktdXRpbHMvbXRkaW5mby5jICAgICAgICAgICAgICAgfCAg
MiArLQogdWJpZnMtdXRpbHMvY29tbW9uL1JFQURNRSAgICAgICAgIHwgMTcgKysrKysrKystLS0t
LS0tLS0KIHViaWZzLXV0aWxzL2xpYnViaWZzL1JFQURNRSAgICAgICB8ICAyICstCiB1Ymlmcy11
dGlscy9saWJ1Ymlmcy9maW5kLmMgICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIHViaWZzLXV0aWxzL2xpYnViaWZzL2xwdC5jICAgICAgICB8ICAxICsK
IHViaWZzLXV0aWxzL2xpYnViaWZzL2xwdF9jb21taXQuYyB8ICA0ICsrLS0KIHViaWZzLXV0aWxz
L2xpYnViaWZzL3JlcGxheS5jICAgICB8ICAxICsKIHViaWZzLXV0aWxzL2xpYnViaWZzL3RuY19j
b21taXQuYyB8ICAyICsrCiAxMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAzNiBk
ZWxldGlvbnMoLSkKCi0tIAoyLjEzLjYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
