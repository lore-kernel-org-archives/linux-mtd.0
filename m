Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D62C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zY3cbBjjcXzx7NUVs0rFmwyT9Yav+RSLRPRx/VVZUHo=; b=ODV
	/Qs9kuZIIpsCKR2KSCC0tdPLXbprSssKiCuNS6kfrLdiebvyuh3hsvBXZw9jDzMagb+NzoUzbWtvB
	oPvfioYUIBhQ3TSCqf4fIZvWQDJW6kzIfboPesM5FRWjKFJrgUtRWUl2NT13MCRW6Wngq92UpmKQM
	dyiz/zSdEZ4OuckcF99ofpGPRFD8FRPwnIHPS2f1RdfeOHACJb+L0vNfuXQjkc4dMYZRj1nApwiSi
	pSK6JrvxrbBaHR74uMHfOuR5bmsoVUBaN9Hwl0nL862EohYPda1FnUWVDBi2lk5QQPRycpVhhJp9b
	po4uThjvqoDnUfnNafptt7p2W/q1HOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfGz-00B9Zv-Qv; Wed, 26 Jan 2022 10:11:29 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfGx-00B9YK-1m
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:11:28 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 c76-20020a25c04f000000b00613e2c514e2so43121732ybf.21
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2022 02:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=3ao5SEtR1nv4TevYgqWzJAQJIpCFZnovOjTeqxptCiI=;
 b=nKL1RLKrnPjz1hKxYNDPT4GEvheUHYDOMS4Ahn8hJr/RRulI2CLOl4pQHpxk9QJbuV
 pz9Wtp/FOvzRMoSp/gToPLGg8/HMaV2EwtALymbQtn+pSfknLohXS1rMMHqof84eLR6I
 47dlK5Cqhgf0MxMtAgMyPc5XV4R9ubV7JI4LVK1+xCK9lNMX6FBK+BC7sP43ARSvl4Os
 cvDCrwvm2XHB/rkRNsvCh/xvCe1Xr0bg7nTyIcXU65u6iLeKH0b86u9kMge2VMkd6tPf
 lVmbeer4PtbjbY4qYDa3TvHjw71uSHDh96d3W4Iq5sKqKFeI2dRe8c8qjh5s+WPQSdAu
 Op3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=3ao5SEtR1nv4TevYgqWzJAQJIpCFZnovOjTeqxptCiI=;
 b=e7wGqge/vjxFrt6X3I63HXMH1Exiev2vp62Dxa59e8zqk16ILl4PaAA+2bCl0y+s7J
 B8TFgzbKJfAcZ/KG7gzVJXSAfqmDw/ZCV2MPTJjSDk/HAXbcG0K6MkM/wGZu2dECYNLt
 PLqxUpAXTYLk8OvFtXN6tllyIcGDBh4KhiN2/AXI4YWfQ+2AltmojpgIzxfCprm3eQ6D
 gHN3B54pNfUu/nVXiadgN/d54A8eydc0B3/oDyZTsWWUPNE1V9bIS+GvD4cdOXMkFkKt
 J5K0nVFbVMawdSFPc6cNQLFSy9K86iyN0lv9ZtC719jvyk+L74W9l64d57+PnbCdaY7N
 D69g==
X-Gm-Message-State: AOAM530b1lgaF+MtWhHZsPBWDKqgXKvKzCU6txDWKOQ0d5pvjjuCWNoq
 R5AZwy5FQyIEz1ErKi6ZcuknyyVr3g==
X-Google-Smtp-Source: ABdhPJx/OhZsWBnrnLmzhxFoSP4v+P1+pbJI5xfhrlpcyaNLSw3ysYxS8h2sCo6IFHReSSR/gpDE5pToEw==
X-Received: from decot.svl.corp.google.com
 ([2620:15c:2c5:11:bb79:635d:80b2:3c02])
 (user=decot job=sendgmr) by 2002:a81:db08:0:b0:2ca:287c:6c28 with SMTP id
 00721157ae682-2ca287c6e78mr6888267b3.205.1643191884223; Wed, 26 Jan 2022
 02:11:24 -0800 (PST)
Date: Wed, 26 Jan 2022 02:11:20 -0800
Message-Id: <20220126101120.676021-1-decot+git@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH RFC v3 1/1] mtd_blkdevs: avoid soft lockups with some mtd/spi
 devices
From: David Decotigny <decot+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 David Decotigny <ddecotig@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_021127_135793_0CCE34C6 
X-CRM114-Status: GOOD (  10.88  )
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
enough breathing room to avoid those incorrectly detected netdev
timeouts for example.

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
