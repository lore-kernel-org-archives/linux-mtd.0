Return-Path: <SRS0=2QCa=5T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC50C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 08:17:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6212C20721
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 08:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L238ExDI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6212C20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UQDrh5BNaXoQtVzSgoXs5BjdwR3xcaAIHidrY4F38gw=; b=L238ExDICNCxGD
	syEO9t5clZsqplO2oleKSWuVE13VPQPgktOCcJ+/L9YKZlEGFcEB718vxVVHpK/8+pUvsCN/6bUWp
	uyg3E3LMdGLnV1wJ3NS4dtQEsG95hh4DgzBCKp/WqO+8Gl6PXEjpiVU3IMsAwIl4BSb1ZbYws5oYo
	aYqkzKSNCwMJMfLRSTAOYG2U0pMaKR6V8f75Pergoj1Kp+qdZhJgQ5L7xYGRdsafHzxWZ/f//u0dn
	4gqidq1QA5eHdjkpoCV9XT9OT1GoekgJOZAdUCSTinQR2/i7aTlIDqri/e1um1RNCOLyHWEujwbof
	UKU7GnR79gvGqaBn1EXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKHWJ-0005Ex-Aa; Fri, 03 Apr 2020 08:17:43 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKHWF-0005Dk-H8
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2020 08:17:41 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4AD20B7E3AB06AF86A43;
 Fri,  3 Apr 2020 16:17:15 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 16:17:08 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <tglx@linutronix.de>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: physmap_of_gemini: remove defined but not used symbol
 'syscon_match'
Date: Fri, 3 Apr 2020 16:15:44 +0800
Message-ID: <20200403081544.37061-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_011739_746607_1A5F84D2 
X-CRM114-Status: UNSURE (   6.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SXQncyBub3QgdXNlZCBieSBhbnlvbmUgbm93LCByZW1vdmUgaXQuIEZpeCB0aGUgZm9sbG93aW5n
IGdjYyB3YXJuaW5nOgoKZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWdlbWluaS5jOjQ5OjM0OiB3
YXJuaW5nOiDigJhzeXNjb25fbWF0Y2jigJkgZGVmaW5lZApidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWNvbnN0LXZhcmlhYmxlPV0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN5c2Nv
bl9tYXRjaFtdID0gewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1v
ZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9t
YXBzL3BoeXNtYXAtZ2VtaW5pLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtZ2VtaW5pLmMgYi9k
cml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtZ2VtaW5pLmMKaW5kZXggYTI4OWM4YjVjYWJmLi5kNGE0
NmUxNTlkMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1nZW1pbmkuYwor
KysgYi9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtZ2VtaW5pLmMKQEAgLTQ2LDExICs0Niw2IEBA
CiAKICNkZWZpbmUgRkxBU0hfUEFSQUxMRUxfSElHSF9QSU5fQ05UCSgxIDw8IDIwKQkvKiBlbHNl
IGxvdyBwaW4gY250ICovCiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN5c2Nv
bl9tYXRjaFtdID0gewotCXsgLmNvbXBhdGlibGUgPSAiY29ydGluYSxnZW1pbmktc3lzY29uIiB9
LAotCXsgfSwKLX07Ci0KIHN0cnVjdCBnZW1pbmlfZmxhc2ggewogCXN0cnVjdCBkZXZpY2UgKmRl
djsKIAlzdHJ1Y3QgcGluY3RybCAqcDsKLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
