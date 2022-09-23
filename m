Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBABC54EE9
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 03:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Tqx/VJIgQvEyB8AlwnXrSkdBV8Uq2U3D4DEhQhk9VU=; b=YHrVG+Z32JAzpQ
	qIUksQWHjjogkk2yYgjvF1DtYW/2ImLpQZ5oYlZSjDTVBfZnpsbnmtyKPWZoO6ZQ371pIqTtOKqAy
	t9ej/P5rivYqgaDgYt6ZD2yynGML+AUIbL0Dgrxk0GLhhhYDUZsE25XeZtdFxIMM+JkscmXjEpKKU
	G8hJVnGwoIFCvNrz+0q/PKelrc3rBVGSgUu68WXdw55cwV4OLnTtj7Q6oqNO59SFF0TaOTo4grcJo
	OeiLfXw72SvTiEOKvZiuwClqmhQIcmArLPv4nL1Nk2qoRkXqUuEn+Rm1tVKTa1ndMkcmYd0sge08F
	xT0OwD6QD2LVoOMXnwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obZ38-001gaQ-OP; Fri, 23 Sep 2022 03:08:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obZ35-001gYz-H0
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2022 03:08:21 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYcRz5Qc5zlXQd;
	Fri, 23 Sep 2022 11:03:59 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 11:08:08 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <liwei391@huawei.com>,
	<zengheng4@huawei.com>
Subject: [PATCH -next] mtd: spi-nor: core: fix implicit declaration warning
Date: Fri, 23 Sep 2022 11:14:57 +0800
Message-ID: <20220923031457.56103-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_200819_755055_0327D9CC 
X-CRM114-Status: UNSURE (   6.70  )
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

c3BpLW5vci9jb3JlLmMgbmVlZHMgdG8gaW5jbHVkZSBsaW51eC9kZWxheS5oLApvciBpdCB3b3Vs
ZCByYWlzZSBiZWxvdyBjb21waWxlIHdhcm5pbmc6Cgpkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
YzogSW4gZnVuY3Rpb24g4oCYc3BpX25vcl9zb2Z0X3Jlc2V04oCZOgpkcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYzoyNzc5OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biDigJh1c2xlZXBfcmFuZ2XigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCiAyNzc5IHwgIHVzbGVlcF9yYW5nZShTUElfTk9SX1NSU1RfU0xFRVBfTUlOLCBTUElfTk9S
X1NSU1RfU0xFRVBfTUFYKTsKICAgICAgfCAgXn5+fn5+fn5+fn5+CgpGaXhlczogZDczZWU3NTM0
Y2M1ICgibXRkOiBzcGktbm9yOiBjb3JlOiBwZXJmb3JtIGEgU29mdCBSZXNldCBvbiBzaHV0ZG93
biIpClNpZ25lZC1vZmYtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmc0QGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmMKaW5kZXggZjJjNjQwMDZmOGQ3Li43YjM2NTI5NGEyZjAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgvbWF0aDY0Lmg+
CiAjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisjaW5j
bHVkZSA8bGludXgvZGVsYXkuaD4KIAogI2luY2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KICNpbmNs
dWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
