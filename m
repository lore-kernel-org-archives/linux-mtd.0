Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C8AC4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 15:29:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B211F2082E
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 15:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZXdRLRu+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/fopCLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B211F2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=H8/bquIjEvTrQq0jXArA8dcQ3CS3wtxDccoz6cPh89g=; b=ZXd
	RLRu+6KtZvNE58YZ/zN25r6wSGm1MnAXZCmUxu4D2dx5jKhN1OvnfJ9SUn+s3XbEWEFzGy7FVdNdS
	47Js4djO4+rK85Z5CpPmuO+AcF6Rink2r6D08XlbHZlsqFMx0ksoBkueK1G6i9kf3J9aLjopXmgp/
	0MR+91xpuljN4a9eXEbe446oCPn1GiPHNVHHrt7+3W0L7VWoqH2gUMXZV+8L749Mzslji1Lo1kVqw
	4IbEHREvRDlzgN1yMTCYKgdkkGkuvtqr6s3xlp/5liPBJqHnsyGkaQW3dYQxHAUHQ2X52aL6vuc9D
	luBXETiRS7YTEbNdLbcoshswD85C0uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC4JG-0004Bf-FB; Thu, 04 Apr 2019 15:29:46 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC4JD-0004B4-6Y
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 15:29:44 +0000
Received: by mail-qt1-x841.google.com with SMTP id s15so3733607qtn.3
 for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2019 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hfqm1+CpqUNUVt9XQAcAVAzX6iPv2FM9q6ijwYDMLvM=;
 b=n/fopCLYxpdiVZLfWGzGsuJoj/huKyafDFot2vmt13L9R2+JTtrzt4y0MFF66n8LOs
 RO+TzVOeEtSNJajJWoB8TEck3FlXjTeURdbuAxdCxCdzwMHQDYt2Um3wa8vG1eIuZ2k0
 r35Ze+oyXowIUf5LpEkpV7uoMtcHuXQIS4f0Hd675BBreUhF0l+RtYEIlokjmN+++P62
 uSgDhKtpVqWpGPPgiRmPKnEEazlLay0d6HvztAtmH4RCudRo0OBr+SKmvcpKmKi/7uN3
 J8BVDLd5AFr20kqQ+nPLfjrLCp8sVrsw8sU3LJ7E8yDMsGOLa05WK2OdWhI8hVtnMXAY
 36yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hfqm1+CpqUNUVt9XQAcAVAzX6iPv2FM9q6ijwYDMLvM=;
 b=n/1TGpKteCrnqXggfpB0hKU1XNsT6OiTyWXMGTbQfDzoHtZY0qsLYgXgCKPpWtlLcX
 6G0Z3/zUWk6FSDYSy8Q7WMKs8Cwd6SsrgHmKCErD2iclrf7Yx8e8m8LUVmaiOznGyLy5
 tZq4lXUo7wOUxJXuMupb8BUjTvnZVtsQtBZ8FJOYQPuNCQT+/d6WhpV73d87CmqYR0qg
 u6DkrNzj4U1+1jzZM155kYqnD6fAqYGw6wkOQZGimBnqaX9YjJr8jl4wcXlfwd13tYaC
 PuaH3WECdIzC8gSk75GDfx/k0WMAUgwfHbvKuSaJ7FBbliJElHfmUGchjdXXo+Vb7IoF
 Om5w==
X-Gm-Message-State: APjAAAXZ3T5iNeAtxsHMUMdcz0TMXQAo0UQ/pb34/IYpo6oEDLgd0gr0
 YEHUmm4s9Hrq+y6Mx7t3mYGmz0CHDnZYMAY9AKg=
X-Google-Smtp-Source: APXvYqwVssYMJnOlZdCpKAdpWw/hJhkKfVJ1DkQIlX0o6mjCkLR+qASvElnkYFaaUHeW41Y9aC08HqLYYp14JXKMKLM=
X-Received: by 2002:ac8:21c7:: with SMTP id 7mr6158304qtz.66.1554391782319;
 Thu, 04 Apr 2019 08:29:42 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Doyle <wpdster@gmail.com>
Date: Thu, 4 Apr 2019 11:29:16 -0400
Message-ID: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
Subject: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by volume
 name instead of volume ID.
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_082943_263039_3F8BECDE 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Add support for CONFIG_MTD_UBI_BLOCK_BY_NAME, which enables ubi block
devices to be named by their volume name: /dev/ubiblock%d_%s rather than
their volume ID /dev/ubiblock%d_%d, so that one can mount e.g. a root
filesystem by UBI name instead of volume ID.  UBI volumes can be renamed
on-the-fly in user space. This allows the root file system to be swapped
from an "A" volume to a "B" volume without having to change the mount
options.

Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
---
 drivers/mtd/ubi/Kconfig | 12 ++++++++++++
 drivers/mtd/ubi/block.c |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 43d131f..d9320f0 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -103,4 +103,16 @@ config MTD_UBI_BLOCK

        If in doubt, say "N".

+config MTD_UBI_BLOCK_BY_NAME
+       bool "Create ubi block device nodes by name instead of volume ID"
+       default n
+       depends on MTD_UBI_BLOCK
+       help
+         This option enables ubi block devices to be named by their volume name
+     /dev/ubiblock%d_%s rather than their volume ID /dev/ubiblock%d_%d, so that
+     one can mount e.g. a root filesystem by UBI name instead of volume ID.
+     UBI volumes can be renamed on-the-fly in user space. This allows the root
+     file system to be swapped from an "A" volume to a "B" volume
without having to
+     change the mount options.
+
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index d0b63bbf..ac2d480 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -399,7 +399,11 @@ int ubiblock_create(struct ubi_volume_info *vi)
         goto out_put_disk;
     }
     gd->private_data = dev;
+#ifdef CONFIG_MTD_UBI_BLOCK_BY_NAME
+    sprintf(gd->disk_name, "ubiblock%d_%s", dev->ubi_num, vi->name);
+#else
     sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
+#endif
     set_capacity(gd, disk_capacity);
     dev->gd = gd;

-- 
2.7.4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
