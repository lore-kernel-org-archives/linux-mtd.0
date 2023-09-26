Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964DFE7D240
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 07:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NYl/PUtR1XF44S+sJDkZuWsrRWWMc7ALl1fbECn/Uko=; b=vXNMo41D0nvxxD
	jE/sjzvb/pU4DKLDO/ObKYqtsUylQsU475C3b4kmyY7FZfkyT5KSoCII2BEGoP+/0DjlbXj+K/oiy
	UDtQzq2PPCNBkJuT2Vm4msf/lCEFc36GjVLomAzyDPe1/t2E4oUMQj6x+roXRJyxiqXuOppDB72r4
	CqAvsxigLlGZgQ8KNhJQzZWXbk5uf1vt2vfYI978WvTswp9ow168fPr7qZm96kH1AKFST60mzgRXv
	ec4QlhuSZgPqggL0GsZ4pmVuUUh3nAYPynCRIMsTWYHHRwbMqNx3GKzWw4Li1v4Br5XIkUc+lqeXT
	ZUtf2EdBbGpKFayZS+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql25F-00FlOK-1Z;
	Tue, 26 Sep 2023 07:02:13 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql25C-00FlN9-0c
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 07:02:12 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RvrG92Rf7z15NQ9;
	Tue, 26 Sep 2023 14:59:45 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 26 Sep
 2023 15:01:58 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH -next] mtd: Add WARN_ON_ONCE() to mtd_read() to check the return value
Date: Tue, 26 Sep 2023 14:57:33 +0800
Message-ID: <20230926065733.3240322-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_000210_412461_CF111D5E 
X-CRM114-Status: UNSURE (   9.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If the driver cannot read all the requested data, -EBADMSG or
-EUCLEAN should never be returned.

Add a WARN_ON_ONCE() to help driver developers detect this error.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/mtdcore.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9bd661be3ae9..848ca4ae058d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1505,6 +1505,8 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	ret = mtd_read_oob(mtd, from, &ops);
 	*retlen = ops.retlen;
 
+	WARN_ON_ONCE(*retlen != len && mtd_is_bitflip_or_eccerr(ret));
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_read);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
