Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133CBC25B6B
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 01:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dl8zkieqnhT4pV5kA88VwYmj6HbcBgfAMExDZNoYKKw=; b=N2Na6pET88KU4y
	/uyF5PHquAfvwjSD/Pwq/eTYLexZWhrUKh2DtU5+xKuIKS848RllX9TnkUsvcff4vDotyvkhKkmdx
	6YBJWfTKaHsAtdva2OuFYEcHiLmfUlE+ASiIa1Xabuh/2Sx+N6ibPq12WbPKOrjT1AHae4oC3neds
	WN7RYiCYhXdG2TjQJcXy4bok0U2mvsESsu9N3p93ehr9oY+95uL1v3GSEL4jkQWZcEZkqYDbZkyuG
	Qut6QIU5g7bHYvBLQE5ig3kUx7fTDfbaEJNHHdj7m5aTyKew9nPVzETDDh9E2kk2aexDSNNq7uHZl
	LiQo3nZBoevjVcpCFtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwBSU-00FORI-2S;
	Fri, 27 Oct 2023 01:16:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwBSQ-00FOQI-2b
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 01:16:17 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SGl5q4bdPzrTlN;
	Fri, 27 Oct 2023 09:13:03 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 27 Oct
 2023 09:15:58 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Artem.Bityutskiy@nokia.com>, <dpervushin@embeddedalley.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
Date: Fri, 27 Oct 2023 09:20:33 +0800
Message-ID: <20231027012033.50280-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_181615_044548_8CEF0F7D 
X-CRM114-Status: GOOD (  10.84  )
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

SWYgYm90aCBmbHQua28gYW5kIGdsdWViaS5rbyBhcmUgbG9hZGVkLCB0aGUgbm90aWllciBvZiBm
dGwKdHJpZ2dlcnMgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gdHJ5aW5nIHRvIGFjY2Vz
cwrigJhnbHVlYmktPmRlc2PigJkgaW4gZ2x1ZWJpX3JlYWQoKS4KCnViaV9nbHVlYmlfaW5pdAog
IHViaV9yZWdpc3Rlcl92b2x1bWVfbm90aWZpZXIKICAgIHViaV9lbnVtZXJhdGVfdm9sdW1lcwog
ICAgICB1Ymlfbm90aWZ5X2FsbAogICAgICAgIGdsdWViaV9ub3RpZnkgICAgbmItPm5vdGlmaWVy
X2NhbGwoKQogICAgICAgICAgZ2x1ZWJpX2NyZWF0ZQogICAgICAgICAgICBtdGRfZGV2aWNlX3Jl
Z2lzdGVyCiAgICAgICAgICAgICAgbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcgogICAgICAgICAg
ICAgICAgYWRkX210ZF9kZXZpY2UKICAgICAgICAgICAgICAgICAgYmxrdHJhbnNfbm90aWZ5X2Fk
ZCAgIG5vdC0+YWRkKCkKICAgICAgICAgICAgICAgICAgICBmdGxfYWRkX210ZCAgICAgICAgIHRy
LT5hZGRfbXRkKCkKICAgICAgICAgICAgICAgICAgICAgIHNjYW5faGVhZGVyCiAgICAgICAgICAg
ICAgICAgICAgICAgIG10ZF9yZWFkCiAgICAgICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWRf
b29iCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZF9vb2Jfc3RkCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGdsdWViaV9yZWFkICAgbXRkLT5yZWFkKCkKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnbHVlYmktPmRlc2MgLSBOVUxMCgpEZXRhaWxlZCByZXBy
b2R1Y3Rpb24gaW5mb3JtYXRpb24gYXZhaWxhYmxlIGF0IHRoZSBsaW5rWzFdLAoKVGhlIHNvbHV0
aW9uIGZvciB0aGUgZ2x1ZWJpIG1vZHVsZSBpcyB0byBydW4gamZmczIgb24gdGhlIFVCSQp2b2x1
bWUgd2l0aG91dCBjb25zaWRlcmluZyB3b3JraW5nIHdpdGggZnRsIG9yIG10ZGJsb2NrLlsyXS4K
VGhlcmVmb3JlLCB0aGlzIHByb2JsZW0gY2FuIGJlIGF2b2lkZWQgYnkgcHJldmVudGluZyBnbHVl
YmkKZnJvbSBjcmVhdGluZyBtdGRibG9jayBkZXZpY2VzLgoKRml4ZXM6IDJiYTNkNzZhMWUyOSAo
IlVCSTogbWFrZSBnbHVlYmkgYSBzZXBhcmF0ZSBtb2R1bGUiKQpMaW5rOiBodHRwczovL2J1Z3pp
bGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzk5MiBbMV0KTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC80NDExMDcxMDAuMjM3MzQuMTY5NzkwNDU4MDI1Mi5KYXZhTWFp
bC56aW1icmFAbm9kLmF0LyBbMl0KU2lnbmVkLW9mZi1ieTogWmhhb0xvbmcgV2FuZyA8d2FuZ3po
YW9sb25nMUBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyBiL2RyaXZlcnMvbXRkL210ZF9ibGtk
ZXZzLmMKaW5kZXggZmYxODYzNmUwODg5Li41YmMzMjEwOGNhMDMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL210ZF9ibGtkZXZzLmMKKysrIGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwpAQCAt
NDYzLDcgKzQ2Myw3IEBAIHN0YXRpYyB2b2lkIGJsa3RyYW5zX25vdGlmeV9hZGQoc3RydWN0IG10
ZF9pbmZvICptdGQpCiB7CiAJc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRyOwogCi0JaWYgKG10
ZC0+dHlwZSA9PSBNVERfQUJTRU5UKQorCWlmIChtdGQtPnR5cGUgPT0gTVREX0FCU0VOVCB8fCBt
dGQtPnR5cGUgPT0gTVREX1VCSVZPTFVNRSkKIAkJcmV0dXJuOwogCiAJbGlzdF9mb3JfZWFjaF9l
bnRyeSh0ciwgJmJsa3RyYW5zX21ham9ycywgbGlzdCkKQEAgLTUwMyw3ICs1MDMsNyBAQCBpbnQg
cmVnaXN0ZXJfbXRkX2Jsa3RyYW5zKHN0cnVjdCBtdGRfYmxrdHJhbnNfb3BzICp0cikKIAltdXRl
eF9sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwogCWxpc3RfYWRkKCZ0ci0+bGlzdCwgJmJsa3RyYW5z
X21ham9ycyk7CiAJbXRkX2Zvcl9lYWNoX2RldmljZShtdGQpCi0JCWlmIChtdGQtPnR5cGUgIT0g
TVREX0FCU0VOVCkKKwkJaWYgKG10ZC0+dHlwZSAhPSBNVERfQUJTRU5UICYmIG10ZC0+dHlwZSAh
PSBNVERfVUJJVk9MVU1FKQogCQkJdHItPmFkZF9tdGQodHIsIG10ZCk7CiAJbXV0ZXhfdW5sb2Nr
KCZtdGRfdGFibGVfbXV0ZXgpOwogCXJldHVybiAwOwotLSAKMi4zMS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
