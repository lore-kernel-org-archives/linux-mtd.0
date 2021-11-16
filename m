Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B65C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 15:38:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4392630EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 15:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4392630EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FHbT8EHBAYAqugE52sdOAb0b34EI9XRiMnkX4b3AMJM=; b=gP1ZndCHUh3emB
	ctXGvX6XWgtbdMxzy9k7W5S63lHKciUg5C2mtP5bfdCCfF4niwiDIlmP3BMufiKCrEHVwVAM8OaKm
	sB2yTY+D8VfEEx4CW5YUuGQczgRZfkbM8Zc3+lK9zRFRURwMrWs5yOXGkF5wIIzUFP8n0IsP6zljH
	smNNChfXuNCPy7x7thvczooJNtAFTjAFa7dxytENL9KLLGYQawNDVQ4kWe8YVLJfR3MDc/xut8J39
	9eqwepqFPwRU9Ms0MRM4EbXdKGroavKRp5UFU5xofxEdAL4Q2ybGk+KcL1sOtHYkUSxusfHyQsXEl
	VVUUffEE8ejs3SNvDg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn0WY-0029b8-4Z; Tue, 16 Nov 2021 15:37:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn0WT-0029Zh-Vw
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 15:37:28 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Htqn72LC7zcbLW;
 Tue, 16 Nov 2021 23:32:27 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 23:37:21 +0800
Received: from use12-sp2.huawei.com (10.67.189.20) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 23:37:21 +0800
From: Jubin Zhong <zhongjubin@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <wangfangpeng1@huawei.com>, <zhongjubin@huawei.com>,
 <kechengsong@huawei.com>, <chenzefeng2@huawei.com>
Subject: [PATCH] jffs2: Fix truncate never update m/ctime
Date: Tue, 16 Nov 2021 23:37:16 +0800
Message-ID: <1637077036-67090-1-git-send-email-zhongjubin@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
X-Originating-IP: [10.67.189.20]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_073726_456559_7A4411DC 
X-CRM114-Status: GOOD (  12.28  )
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

From: zhongjubin <zhongjubin@huawei.com>

Syscall truncate() never updates m/ctime in jffs2 even if the file
size is changed. This is incorrect according to man file:

  truncate (2):
  If  the  size  changed, then the st_ctime and st_mtime fields
  (respectively, time of last status change and time of last
  modification; see stat(2)) for the file are updated, and the
  set-user-ID and set-group-ID mode bits may be cleared.

This is because truncate() will not set ATTR_CTIME and ATTR_MTIME even
when file size is changed. Fix this special case just like what other
filesystems do.

Test Steps:
  1. cd /path/to/mnt/point
  2. dd if=/dev/zero of=test bs=1M count=1
  3. stat test
  4. /bin/my_truncate -s 1024 test
  5. stat test
  6. compare m/ctime of step 5 with step 3

Program source:
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <unistd.h>
  #include <sys/types.h>
  int main(int argc, char **argv)
  {
  	int ret;
	char file_name[128] = {0};

	if (argc < 4 || argv == NULL || argv[1] == NULL ||
argv[2] == NULL || argv[3] == NULL) {
		return -1;
	}

	if (strcmp(argv[1], "-s")) {
		return -1;
	}

	if (realpath(argv[3], file_name) == NULL) {
		printf("truncate: input file name %s err.\n", argv[3]);
			return -1;
		}

		off_t size = (off_t)strtol(argv[2], 0, 0);
		ret = truncate(file_name, size);
		if (ret) {
			printf("truncate return err %d\n", ret);
		}
		return ret;
	}

Signed-off-by: zhongjubin <zhongjubin@huawei.com>

----
v1:
  https://lore.kernel.org/all/1636974018-31285-1-git-send-email-zhongjubin@huawei.com/
  I considered fixing this problem in vfs_truncate(), but it is
  suggested to implement the proper semantics in jffs's ->setattr.
---
 fs/jffs2/fs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 2ac410477c4f..181f053d072b 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -114,8 +114,18 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
 
 	ri->isize = cpu_to_je32((ivalid & ATTR_SIZE)?iattr->ia_size:inode->i_size);
 	ri->atime = cpu_to_je32(I_SEC((ivalid & ATTR_ATIME)?iattr->ia_atime:inode->i_atime));
-	ri->mtime = cpu_to_je32(I_SEC((ivalid & ATTR_MTIME)?iattr->ia_mtime:inode->i_mtime));
-	ri->ctime = cpu_to_je32(I_SEC((ivalid & ATTR_CTIME)?iattr->ia_ctime:inode->i_ctime));
+	/*
+	 * Special case for truncate() where we should update the times despite not having
+	 * ATTR_CTIME and ATTR_MTIME set.
+	 */
+	if ((ivalid & ATTR_SIZE) && (iattr->ia_size != inode->i_size) &&
+			!(ivalid & (ATTR_CTIME | ATTR_MTIME))) {
+		ri->mtime = cpu_to_je32(I_SEC(iattr->ia_mtime));
+		ri->ctime = cpu_to_je32(I_SEC(iattr->ia_ctime));
+	} else {
+		ri->mtime = cpu_to_je32(I_SEC((ivalid & ATTR_MTIME)?iattr->ia_mtime:inode->i_mtime));
+		ri->ctime = cpu_to_je32(I_SEC((ivalid & ATTR_CTIME)?iattr->ia_ctime:inode->i_ctime));
+	}
 
 	ri->offset = cpu_to_je32(0);
 	ri->csize = ri->dsize = cpu_to_je32(mdatalen);
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
