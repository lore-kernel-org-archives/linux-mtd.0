Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C656AC433E1
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 06:32:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F646206F6
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 06:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SR4b/8mO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F646206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FFrSRf9AWgKy9y/MRt0nzXbjXYg/CSyq0R9niDLWzZE=; b=SR4b/8mOl5mmgKChpWIvp1e4VB
	gF8advLdB2iQnKg6kf2WFoe4PPQXPcHk3/nxj3UJgEF9qXyfWGeBVHK0PU91z6QF2gOy0MKk5cOMj
	bpT1hBFoH416q6qsJ8TIjMD2Zm1gPEsuyOuuLZqos8JnlnztmB4xBiuhUr/YqIzjgVeE/8aV+5/dZ
	cok8hd8sRem4oMVQ+zIZNBQWyR8erKkjD7KeznTW6OyIY4vPLlBIV/+3KHTMrlOrDzYLnuon9SWVZ
	LItTEomwSEJ+Gk/B7EFMB3gIM0ZR3O1Zw0eaeMUz0yltLrOXrrbr11Oqj4srL7K0m1ouh4pOQJVw/
	OozhL30w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzDiC-0001NZ-8l; Sat, 25 Jul 2020 06:31:12 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzDi9-0001MX-NK
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 06:31:10 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5450C3B4E21CE1DB4F4D;
 Sat, 25 Jul 2020 14:30:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Sat, 25 Jul 2020 14:30:45 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH -next] mtd: fix missing unlock on error in
 mtdchar_compat_ioctl()
Date: Sat, 25 Jul 2020 06:34:16 +0000
Message-ID: <20200725063416.172037-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_023110_047845_F066F8FB 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the missing unlock before return from function mtdchar_compat_ioctl()
in the error handling case.

Fixes: 210bec567936 ("mtd: properly check all write ioctls for permissions")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/mtdchar.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 52c120f9fb0d..b40f46a43fc6 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1064,8 +1064,10 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 		struct mtd_oob_buf32 buf;
 		struct mtd_oob_buf32 __user *buf_user = argp;
 
-		if (!(file->f_mode & FMODE_WRITE))
-			return -EPERM;
+		if (!(file->f_mode & FMODE_WRITE)) {
+			ret = -EPERM;
+			break;
+		}
 
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
