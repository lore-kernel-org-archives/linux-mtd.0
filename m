Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586F6C63798
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 13:08:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5C421D7A
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 13:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jj9ydcnP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5C421D7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qCrs1/Mrfg+o1+KPsGsakkhqT5OIABW/v3e5ktFXxwI=; b=Jj9ydcnPCBTKA5XoFWrfuRKepQ
	P9HBfcnmXq7kUMb4KnIMrkbsxBFqrIA1QJpLFreMtSjh1SBLtIXipFwGj7yYzxgjqq/EsXqfKKjzQ
	sOqcpKWOpj6T9gLs8LQAdd0cWVJdy2N0Gk0lFgzM3MN1wbZFhaA8PPG1p0r1qRnukIIxUQr94yrLa
	lu7n4Kzte6c9J4Cb1ln5wHqFGaH0av0RyYvrt6zXFyfXDyzIqX+kWhz1G9XNbHZcSs9EbgqjQ8FWo
	du6EXtXBywTLK8XgahT7ut3YazAZ5A89V2Ofdf8Qg/MXjA/+619NXMwOq1LPAqqM/BpUU4RDlQKay
	wCAS4pOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kidU3-0007dD-IV; Fri, 27 Nov 2020 13:08:19 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kidTz-0007al-O6
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 13:08:18 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CjFK15ZP9zLtjd;
 Fri, 27 Nov 2020 21:07:17 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Nov 2020 21:07:36 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@microchip.com>, <tpoynor@mvista.com>, <tglx@linutronix.de>,
 <vwool@ru.mvista.com>
Subject: [PATCH] mtd:cfi_cmdset_0002: fix atomic sleep bug when
 CONFIG_MTD_XIP=y
Date: Fri, 27 Nov 2020 21:07:31 +0800
Message-ID: <20201127130731.99270-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_080817_180429_887A31CE 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: wangle6@huawei.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, nixiaoming@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When CONFIG_MTD_XIP=y, local_irq_disable() is called in xip_disable().
To avoid sleep in interrupt context, we need to call local_irq_enable()
before schedule().

The problem call stack is as follows:
bug1:
	do_write_oneword_retry()
		xip_disable()
			local_irq_disable()
		do_write_oneword_once()
			schedule()
bug2:
	do_write_buffer()
		xip_disable()
			local_irq_disable()
		do_write_buffer_wait()
			schedule()
bug3:
	do_erase_chip()
		xip_disable()
			local_irq_disable()
		schedule()
bug4:
	do_erase_oneblock()
		xip_disable()
			local_irq_disable()
		schedule()

Fixes: 02b15e343aee ("[MTD] XIP for AMD CFI flash.")
Cc: stable@vger.kernel.org # v2.6.13
Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a1f3e1031c3d..12c3776f093a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1682,7 +1682,11 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			mutex_unlock(&chip->mutex);
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_enable();
 			schedule();
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_disable();
 			remove_wait_queue(&chip->wq, &wait);
 			timeo = jiffies + (HZ / 2); /* FIXME */
 			mutex_lock(&chip->mutex);
@@ -1962,7 +1966,11 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			mutex_unlock(&chip->mutex);
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_enable();
 			schedule();
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_disable();
 			remove_wait_queue(&chip->wq, &wait);
 			timeo = jiffies + (HZ / 2); /* FIXME */
 			mutex_lock(&chip->mutex);
@@ -2461,7 +2469,11 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			mutex_unlock(&chip->mutex);
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_enable();
 			schedule();
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_disable();
 			remove_wait_queue(&chip->wq, &wait);
 			mutex_lock(&chip->mutex);
 			continue;
@@ -2560,7 +2572,11 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			mutex_unlock(&chip->mutex);
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_enable();
 			schedule();
+			if (IS_ENABLED(CONFIG_MTD_XIP))
+				local_irq_disable();
 			remove_wait_queue(&chip->wq, &wait);
 			mutex_lock(&chip->mutex);
 			continue;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
