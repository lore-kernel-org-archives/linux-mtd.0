Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA1C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BP3AyRXIqRpOAKCG3gpTssij2mryVQS1Vr20N+YUCLI=; b=vTi
	XybpK4xuwelCvVY+RYdI+4DXFHOpghGp8GxW3cEjhpayCH9rXZNjujyRuqzHQ/eM0O11k/an2yDrF
	S5xOvWBmnc8JEYFMXPXGNfsrIQIjz2UqcQp8bk4WrwQIzwNbpA/p8w+08qa/XW1OsaWXsKVvrxN/Y
	pxtWTj01nAbn5RbypI4tLug8XrFFf5/2pc8Xj42of6hcSdKPr+i2+rlkuuPaAhvhXc4atdU0ROmIj
	pX1ZqMID8fJCp2+KI7eVr2Jb85J2j80+58DBPTWQyNu07LKJ3Cd4uQjiv+KemNimsSJTcXGmtrWDx
	apztlZCyvzOq/rUzsjLqIrSjoy0+ejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeXy-00Ax1F-5Q; Wed, 26 Jan 2022 09:24:58 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeUm-00AvqQ-4Y
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 09:21:41 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 2-20020a251302000000b006118f867dadso46986707ybt.12
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2022 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=llHbn1bCthF6Z52ZLAXsC7nxbrzb3NZCqXe+nafQFPI=;
 b=YJarqyabni/dIxOZIIiuXNkf7B/nbShnT5gY+P+KdkJK/Ekvtb9L+9Ps3N09OqLi6N
 6oLEwUJ4RQvI/LrknnY/YhTFLfKGDQoBZPdr7nB2PokX5yLAGtzS7IpPqPSJvwwefHtx
 8a5vBngTOLzCuaXe3QRU0vqiTx2mXFU5SafhIyOzmfBza+2BOFUbZ8WJYZ85DmP5PL9D
 Xf/vZMwwRnEkzK1lqF7ClbTZEVgchSYSgBL23OQVwsmucOvEeVMYqis2vDc+Qtc6nnjI
 6bwjYTiLxj+5JQ1TGz31W7mgcDN4hxpK0f2HqsX5teKZ44u3TQtjeS49vvUKW16egfDK
 SGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=llHbn1bCthF6Z52ZLAXsC7nxbrzb3NZCqXe+nafQFPI=;
 b=aZWoQOGd0+THpkYCpOsU++mat5pFsOhD+U7lo6pch9IqtZK2mTTBbKU+qlwgbvrOl9
 hedPyDXeHQkSxYeI1CSDm4oU4wuIHcWfNDrvVEoYlbz0WNKMUPCFGAGdX32vXtywY391
 C0YuzqMDILxIu+diPOb+7DHDRkPvzlCy4YDu0GKG77XomApGUg/+mD3nhiYtdDlVK9sZ
 198GSQNsrnWHz8aUZPgad2+vWJzz63VSUyi2JeQLxyinV4iFDkjKkeUymCoKsUif/Nhm
 kt+kIv08J2nrO31mZjuj/0aC8mg9KL43TMRtpJNu5DINf2lGfQW1nxYStg/b1BF2Uz8q
 XWYw==
X-Gm-Message-State: AOAM533XggDDsFri4aCSiskCPiF4SQf8qiFY669tE5OmYDL1XRb57/Kd
 IfN0oc0t7rANtPQORcEjT0inn6i7zw==
X-Google-Smtp-Source: ABdhPJy5cIj9gJub06TRdlfStLRikThiyANu4V65E/fRxgKo173xbsOf+6RQbuMp5juKe6s2C2lhmawYvw==
X-Received: from decot.svl.corp.google.com
 ([2620:15c:2c5:11:bb79:635d:80b2:3c02])
 (user=decot job=sendgmr) by 2002:a25:6152:: with SMTP id
 v79mr32538034ybb.685.1643188898430; 
 Wed, 26 Jan 2022 01:21:38 -0800 (PST)
Date: Wed, 26 Jan 2022 01:21:34 -0800
Message-Id: <20220126092134.579618-1-decot+git@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH RFC v2 1/1] mtd_blkdevs: avoid soft lockups with some mtd/spi
 devices
From: David Decotigny <decot+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 David Decotigny <ddecotig@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_012140_228306_E18EF5C4 
X-CRM114-Status: GOOD (  10.83  )
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

From: David Decotigny <ddecotig@google.com>

With some spi devices, the heavy cpu usage due to polling the spi
registers may lead to netdev timeouts, RCU complaints, etc. This can
be acute in the absence of CONFIG_PREEMPT. This patch allows to give
enough breathing room to avoid those false positives.

Example splat on 5.10.92:
[  828.399306] rcu: INFO: rcu_sched self-detected stall on CPU
...
[  828.419245] Task dump for CPU 1:
[  828.422465] task:kworker/1:1H    state:R  running task on cpu   1   stack:    0 pid:   76 ppid:     2 flags:0x0000002a
[  828.433132] Workqueue: kblockd blk_mq_run_work_fn
[  828.437820] Call trace:
...
[  828.512267]  spi_mem_exec_op+0x4d0/0xde0
[  828.516184]  spi_mem_dirmap_read+0x180/0x39c
[  828.520443]  spi_nor_read_data+0x428/0x7e8
[  828.524523]  spi_nor_read+0x154/0x214
[  828.528172]  mtd_read_oob+0x440/0x714
[  828.531815]  mtd_read+0xac/0x120
[  828.535030]  mtdblock_readsect+0x178/0x230
[  828.539102]  mtd_blktrans_work+0x9fc/0xf28
[  828.543177]  mtd_queue_rq+0x1ac/0x2e4
[  828.546827]  blk_mq_dispatch_rq_list+0x2cc/0xa44
[  828.551419]  blk_mq_do_dispatch_sched+0xb0/0x7cc
[  828.556010]  __blk_mq_sched_dispatch_requests+0x350/0x494
[  828.561372]  blk_mq_sched_dispatch_requests+0xac/0xe4
[  828.566387]  __blk_mq_run_hw_queue+0x130/0x254
[  828.570806]  blk_mq_run_work_fn+0x50/0x60
[  828.574814]  process_one_work+0x578/0xf1c
[  828.578814]  worker_thread+0x5dc/0xea0
[  828.582547]  kthread+0x270/0x2d4
[  828.585765]  ret_from_fork+0x10/0x30


Signed-off-by: David Decotigny <ddecotig@google.com>
---
 drivers/mtd/mtd_blkdevs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 243f28a3206b4..64d2b093f114b 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -158,6 +158,7 @@ static void mtd_blktrans_work(struct mtd_blktrans_dev *dev)
 		}
 
 		background_done = 0;
+		cond_resched();
 		spin_lock_irq(&dev->queue_lock);
 	}
 }
-- 
2.35.0.rc0.227.g00780c9af4-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
