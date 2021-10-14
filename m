Return-Path: <SRS0=DRVm=PC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF873C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 20:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685C061151
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 20:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 685C061151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mpv5B3B/+LkY1X85onm8KsQf0yK1vr+jj7xYUKlJWyk=; b=fp78khGPdkJcyF
	ZI9Hv5GNlqZ/DLqiKH3ausrWsWVRxD1uqCEUNGQmfQgvzHr5bbG3iDzvow58DtIOppgWkFpIwQ3bQ
	LeQ/8HdSagj13FkLNKa73zNQc54vLfcaB0PD2m73yvscO2u3Jk1OmId68Cq9lfc6/aKYOVUk8toUw
	ilDNARqGV1HLSoy4L+hEWjCIpti3zozk0TovORoI+G3Vomz6w0ds1CUIskddqopUUTIlHWWeVUh87
	DQC7Hqn+acieDxBcKD2JvMncGkuzfQQOVjr5UqTdjLgQDX0+mzwf1TNe/WUyJEIBn5/nXzHVHNCUH
	xkDLoaEPNVhAU034AUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb7WM-004MtQ-AH; Thu, 14 Oct 2021 20:40:10 +0000
Received: from thorn.bewilderbeest.net ([2605:2700:0:5::4713:9cab])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb7WJ-004Msh-QB
 for linux-mtd@lists.infradead.org; Thu, 14 Oct 2021 20:40:09 +0000
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 2C74656;
 Thu, 14 Oct 2021 13:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634244004;
 bh=4iQHDwm01Ka+yRVl8YzQ6q3/Kv6R+IAV1avi97RanDU=;
 h=From:To:Cc:Subject:Date:From;
 b=WI5LvAuDp5iyE+NOq0cm48NL+KnfRIP4Sv+l6LOhjevq5e9w0xzYx5/Uq1ilsXQlk
 Nka2LYG+Lcj6hO8vKpuWdLJizvAma5LAUP+tyL8KIau7oGYIJT1Qum9PzIAXhshHUn
 LbkHHoTmfBeYL/rxQXrn023fKz7DlXG0Hu/cVBCg=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-mtd@lists.infradead.org
Cc: Zev Weiss <zev@bewilderbeest.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>, Zhen Lei <thunder.leizhen@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Jon Hunter <jonathanh@nvidia.com>, Petr Malat <oss@malat.biz>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Mario Rugiero <mrugiero@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: core: don't remove debugfs directory if device is in use
Date: Thu, 14 Oct 2021 13:39:52 -0700
Message-Id: <20211014203953.5424-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_134007_871857_C1E11820 
X-CRM114-Status: GOOD (  12.01  )
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

Previously, if del_mtd_device() failed with -EBUSY due to a non-zero
usecount, a subsequent call to attempt the deletion again would try to
remove a debugfs directory that had already been removed and panic.
With this change the second call can instead proceed safely.

Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")
Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/mtdcore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e22266f63ae9..0a0fca737d43 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -724,8 +724,6 @@ int del_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	debugfs_remove_recursive(mtd->dbg.dfs_dir);
-
 	if (idr_find(&mtd_idr, mtd->index) != mtd) {
 		ret = -ENODEV;
 		goto out_error;
@@ -741,6 +739,8 @@ int del_mtd_device(struct mtd_info *mtd)
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
+		debugfs_remove_recursive(mtd->dbg.dfs_dir);
+
 		/* Try to remove the NVMEM provider */
 		if (mtd->nvmem)
 			nvmem_unregister(mtd->nvmem);
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
