Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E328FC2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 16:12:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B188A613A9
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 16:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B188A613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ERD6wNoLprpekXIN5QpIZUeaTbo18CR1pEr+8rXfh8I=; b=eXz17aKWTXOGiA
	jnm3U4twKdPukMVPGYKwWzbcMadLfLUHPMu5y8/qV6HDXTqA7Gne/Zidy7YHeNFWudvTyvRX9SdGL
	PWmledXbi8pKqHdJ5ACdOkmC6BWf9i1wgk4Yz+2ghfTOE3F83x2cUrLJBFcQqFekpMGUnwM2DoJjt
	TusQT0yZWSlGs+fsZ1Tg1ULwW9PyrmbOssf+kXIM2JDuEtQO7DxwuqbYnQnExjlW2nqLSXGGFlx9Q
	GOA11V5/KJpvkIhaUU5WxalNPuy8lANyrRqcuWo/sx+VYDQ8YwsZO1bjShl8lyR8mNmO3WD1K/7Nj
	zvEHnd9fwmSVj6Nd01cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltuc5-00B3nN-QR; Thu, 17 Jun 2021 16:11:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltuc2-00B3mZ-RA
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 16:11:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c15so3109912pls.13
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jun 2021 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ax6cETdinXWixOBfa2JXuuJreyz/2EakPhTszPVNovE=;
 b=i2QXD0vhjVadbjwCmRdyNJqmCJfF+D+qzE+5On//JOZFpoHUgMErQ2ApsO0fvPgBrh
 WB0J16l5X7WlSWdjxiYJPOKw5I3EWB990vCX8td+8KS8DcuNK64Fufah0VfpTZB974ut
 F1zqdkpTJXa/XRMpt2nkaZ6DrDW5y2qblxKoNcQWrPpVx2TaFULd4vJd09aBovLSir80
 KqgIBeu9fB9/8aGrWyTYmiOjQn6oUAudcN17lDi9OXG2KyeqX9MkERC3sLhTEHeZRt+J
 p/JpjX4ALsoqTASC5bZvSmcETVpAm4voc7uT7gegQ6EJ+yvf6+F/vYtqbL7OfIl8UxtX
 DTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ax6cETdinXWixOBfa2JXuuJreyz/2EakPhTszPVNovE=;
 b=Z9u2sdoZ8MrQg/zlVJ7TOCNjSotuu5qUBjpMvDNLgqJOJ2+cuI1me7NUidoybFfWjD
 Nk58ZzY05e61YtE7OgibMIwUrEm1e+FCdD24hnqDfb0QNfFj/QVHIZC3l+dvRTLXF8GW
 ASCTgfyL/sEevH1ob9dMaAf3KiA/RcyYDqwKCvQGmtgcfdTSwoeIJKb+guDGcyG8Rb4h
 J84eJP2wYWquAy5vrbQDody2oDr3tzKNYpsr5/CEZqtEuJNXvmgpg7ZM/B53Y1c/yOIp
 6i4d+vyqmXElTizIjATc3cpnjSKfKG3adc/fdGpRoVktOLHVanBkoR4ZzKJ01lAI6aas
 SA3w==
X-Gm-Message-State: AOAM532WPkai3ppmS/943+SZuDpuAaebfh40jG3tAMyOClJXJhHfgQjy
 g/g13Cd7YpUEvSHwblLoNRc=
X-Google-Smtp-Source: ABdhPJxA7oUNbFsGjhbNIo746b9a5E8ZEjnY31bzeD1lZjEFk7hoeAfcyTpUfGXFvil2uefPLd8A/A==
X-Received: by 2002:a17:902:be10:b029:109:7460:cc41 with SMTP id
 r16-20020a170902be10b02901097460cc41mr612469pls.4.1623946286013; 
 Thu, 17 Jun 2021 09:11:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 4sm8090293pjg.30.2021.06.17.09.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 09:11:25 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
Date: Fri, 18 Jun 2021 00:09:04 +0800
Message-Id: <20210617160904.570111-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_091126_933792_F27EE3FB 
X-CRM114-Status: GOOD (  11.27  )
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

Syzbot reported a circular locking dependency:
https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb

This happens because of the following lock dependencies:

1. loop_ctl_mutex -> bdev->bd_mutex (when loop_control_ioctl calls
loop_remove, which then calls del_gendisk; this also happens in
loop_exit which eventually calls loop_remove)

2. bdev->bd_mutex -> mtd_table_mutex (when blkdev_get_by_dev calls
__blkdev_get, which then calls blktrans_open)

3. mtd_table_mutex -> major_names_lock (when register_mtd_blktrans
calls __register_blkdev)

4. major_names_lock -> loop_ctl_mutex (when blk_request_module calls
loop_probe)

Hence there's an overall dependency of:

loop_ctl_mutex   ----------> bdev->bd_mutex
      ^                            |
      |                            |
      |                            v
major_names_lock <---------  mtd_table_mutex

We can break this circular dependency by holding mtd_table_mutex only
for the required critical section in register_mtd_blktrans. This
avoids the mtd_table_mutex -> major_names_lock dependency.

Reported-and-tested-by: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com
Co-developed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

Changes in v1 -> v2:

Break the circular dependency in register_mtd_blktrans instead of blk_request_module, as suggested by Christoph Hellwig.

 drivers/mtd/mtd_blkdevs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index fb8e12d590a1..7d26cfe24d05 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -528,14 +528,10 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	if (!blktrans_notifier.list.next)
 		register_mtd_user(&blktrans_notifier);
 
-
-	mutex_lock(&mtd_table_mutex);
-
 	ret = register_blkdev(tr->major, tr->name);
 	if (ret < 0) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
-		mutex_unlock(&mtd_table_mutex);
 		return ret;
 	}
 
@@ -545,12 +541,12 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	tr->blkshift = ffs(tr->blksize) - 1;
 
 	INIT_LIST_HEAD(&tr->devs);
-	list_add(&tr->list, &blktrans_majors);
 
+	mutex_lock(&mtd_table_mutex);
+	list_add(&tr->list, &blktrans_majors);
 	mtd_for_each_device(mtd)
 		if (mtd->type != MTD_ABSENT)
 			tr->add_mtd(tr, mtd);
-
 	mutex_unlock(&mtd_table_mutex);
 	return 0;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
