Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A127C5321E
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2024 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HV2g1cLB6ipxSzvRRs0VfbORs9hRtNZAveaoWcXJEUs=; b=wQsXrbzqoGFPnc
	8PyuXxFcCL1MazavvQoTsK3pRbRBodWgq8/jk2ui0p/l3OBl5Ez+W078PQOc1OxClqtpdI1BZsOwi
	99dy9KENWyIMWrtaeolMopwp8NApB+uV3zHwQErZ7x8mraSa2CXOvLPX6pe5H96hY8/VFvs9Ud3UU
	pTTPH4BwqJe0PUkKGPbJBL8zfNI+GSsZxHFLDGhzDaAR8QevD8sJtrpikwY13d1DkpQHe3N5MZiES
	gPZ5rEEBeY1XFRSVJnVMcY3GVEsQ8zVimkQwPZNwWECZhX3okOjHYbWfWwXVPmVAbExewvNyvfJzF
	99naAi/Sujj2bPXcuqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si8ih-00000003ykV-3fXu;
	Sun, 25 Aug 2024 08:35:31 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si8ic-00000003yje-1n6k
	for linux-mtd@lists.infradead.org;
	Sun, 25 Aug 2024 08:35:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ws6Sk3RzCz69JS;
	Sun, 25 Aug 2024 16:30:30 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D3D2818007C;
	Sun, 25 Aug 2024 16:35:16 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 25 Aug
 2024 16:35:16 +0800
From: Wang Zhaolong <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] mtd: ubi: remove unused parameter 'pnum' from add_volume()
Date: Sun, 25 Aug 2024 16:35:15 +0800
Message-ID: <20240825083515.4074081-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg500010.china.huawei.com (7.202.181.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_013526_749635_A809ADEB 
X-CRM114-Status: GOOD (  12.33  )
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

The parameter 'pnum' in the function add_volume() is not used inside the
function body. This patch removes this unused parameter to clean up the
code and improve readability.

This change does not affect the functionality of add_volume() or any other
part of the UBI subsystem, as the removed parameter is not utilized.

Signed-off-by: Wang Zhaolong <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/attach.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index ae5abe492b52..fe9784c90ea4 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -393,8 +393,7 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
  * to the allocated "av" object in case of success and a negative error code in
  * case of failure.
  */
-static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *ai,
-					  int vol_id, int pnum,
+static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *ai, int vol_id,
 					  const struct ubi_vid_hdr *vid_hdr)
 {
 	struct ubi_ainf_volume *av;
@@ -576,7 +575,7 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 	dbg_bld("PEB %d, LEB %d:%d, EC %d, sqnum %llu, bitflips %d",
 		pnum, vol_id, lnum, ec, sqnum, bitflips);
 
-	av = add_volume(ai, vol_id, pnum, vid_hdr);
+	av = add_volume(ai, vol_id, vid_hdr);
 	if (IS_ERR(av))
 		return PTR_ERR(av);
 
-- 
2.34.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
