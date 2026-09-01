Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B110CC624D4
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qb8IW6Ow+AwSZzdyWz+ZqBsUMWJg3pN3igeypqbRGvs=; b=dJnGKIIzrj1nTq
	umYGohEWXQ96e+MB5n1dyJBcFJSulLWclKGe8OyBtrhQvv3e0sbgdEPu0+j64gqAZyjhf8j5IzO3o
	Mra9hgl2SAa8lnTX4Gy5cv7qJN25JvZzJ6Cv6uRzgYpKp7SCxPGiDBQ6b0cNMJoxl/VlwrxxEAj4x
	PE6UY9IUFF6yPG4brhgqQKl/qJiM4geMhoJj1i2yUfhG+rY841nX9nlDgqVTpI3VOQNrZElYbfY28
	tWrNahBDncSQfOPDQKE27bJMiiEv62hdPBVnomsd1ZaABeXyTGi+67rlKBqtfdpkhZzV+eOEpNtg6
	ei2bxtMcKIAClQ6yGPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OIT-0000000CAYY-3IYc;
	Tue, 01 Sep 2026 13:13:05 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OIQ-0000000CAU0-00Y1;
	Tue, 01 Sep 2026 13:13:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uoYKoPZ7YKPmsCHG/kXIjc+wB00oulf3PAI6t9L7dXc=;
	b=AjShkyBICAQG93Xx24uO5WkxiKPbiNgccEYEo+cH2GjESgyKEM//MZ278+F6XzwOlEUJ34IXR
	gGLmLMCdZY+TwaKIQcratPL0uQrHHNhh3oTLFnFNjRlq5slRg6HK0rXoLect9UvacjQfXAPOIG/
	AW3dbypsROzmFphzCRweR1I=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hZ5bw237xzLlXZ;
	Tue,  1 Sep 2026 21:02:04 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id C14E04057C;
	Tue,  1 Sep 2026 21:12:53 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 21:12:52 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v3 2/8] jffs2: wbuf: fix space accounting in recovery secondary write failure
Date: Tue, 1 Sep 2026 21:05:43 +0800
Message-ID: <20260901130549.1761342-3-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
References: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_061302_352858_18A8EBD9 
X-CRM114-Status: GOOD (  12.10  )
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

In jffs2_wbuf_recover(), when the recovery write to the new erase block
also fails, the code marks the already-written portion as REF_OBSOLETE
via jffs2_add_physical_node_ref(). However, the length passed is
ref_totlen(c, jeb, first_raw), which is the length of a single node on
the old block, not retlen which is the actual number of bytes written to
the new block.

When the recovery buffer contains multiple nodes, ref_totlen only
accounts for the first node's length, which can be much smaller than
retlen. This under-deducts free_size, causing subsequent allocations to
land on already-programmed NAND pages and silently corrupt data. When
first_raw is the only node in the recovery range, ref_totlen equals the
full unaligned data size and exceeds the page-aligned retlen,
over-deducting free_size and wasting space.

Use retlen so the new block's free_size accurately reflects which NAND
pages have been programmed.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 61e3dbd4cd7b..360a291d9fd5 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -437,7 +437,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 			kfree(buf);
 
 			if (retlen)
-				jffs2_add_physical_node_ref(c, ofs | REF_OBSOLETE, ref_totlen(c, jeb, first_raw), NULL);
+				jffs2_add_physical_node_ref(c, ofs | REF_OBSOLETE, retlen, NULL);
 
 			c->wbuf_len = 0;
 			return;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
