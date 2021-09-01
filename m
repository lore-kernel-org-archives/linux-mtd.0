Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1620BC432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 21:01:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC441603E9
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 21:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC441603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgOl+InTqHm1mKDaS3UqVsWi7P4yoZrt8TY0j7EHmNc=; b=34PVMZu7Pn0jDW
	8X+p1D5qYASjvVdHPoBzV226AnWSv5ZVkEcFRLC5fArO21ehfjqgKI2NU4bvjXwTI4ocHH3joaCX/
	LlauF/ZGpH5r6LyQ0FSzxnxXPkHce4g412+Dhn6qQ6P8+XOQ+9EULTWCJ3eb1vmfa7exwG4cJrghw
	/3lkjYBY+EBh7ElogrYFdxh3+WM7KCDN2TzKtysM8Pz3iJ6+yo7DBs7dxSwndEm4sKZADBZZ5FK8Y
	ueZRI7ZPnZgrqdUhZL8tbN59WxNYaDhc80OzIE7L94FpHkV/PpiYUNiJsaRZBHhFDxyGZKxGbkKM8
	6NBx95lY1BfpWjlsOsdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLXLv-007Lcj-TJ; Wed, 01 Sep 2021 21:00:59 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mLXLR-007LWJ-LJ; Wed, 01 Sep 2021 21:00:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 08/10] block/sx8: add error handling support for add_disk()
Date: Wed,  1 Sep 2021 14:00:26 -0700
Message-Id: <20210901210028.1750956-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901210028.1750956-1-mcgrof@kernel.org>
References: <20210901210028.1750956-1-mcgrof@kernel.org>
MIME-Version: 1.0
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

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

A completion is used to notify the initial probe what is
happening and so we must defer error handling on completion.
Do this by remembering the error and using the shared cleanup
function.

The tags are shared and so are hanlded later for the
driver already.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/sx8.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index 420cd952ddc4..1c79248c4826 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -297,6 +297,7 @@ struct carm_host {
 
 	struct work_struct		fsm_task;
 
+	int probe_err;
 	struct completion		probe_comp;
 };
 
@@ -1181,8 +1182,11 @@ static void carm_fsm_task (struct work_struct *work)
 				struct gendisk *disk = port->disk;
 
 				set_capacity(disk, port->capacity);
-				add_disk(disk);
-				activated++;
+				host->probe_err = add_disk(disk);
+				if (!host->probe_err)
+					activated++;
+				else
+					break;
 			}
 
 		printk(KERN_INFO DRV_NAME "(%s): %d ports activated\n",
@@ -1192,11 +1196,9 @@ static void carm_fsm_task (struct work_struct *work)
 		reschedule = 1;
 		break;
 	}
-
 	case HST_PROBE_FINISHED:
 		complete(&host->probe_comp);
 		break;
-
 	case HST_ERROR:
 		/* FIXME: TODO */
 		break;
@@ -1507,7 +1509,10 @@ static int carm_init_one (struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_out_free_irq;
 
 	DPRINTK("waiting for probe_comp\n");
+	host->probe_err = -ENODEV;
 	wait_for_completion(&host->probe_comp);
+	if (host->probe_err)
+		goto err_out_free_irq;
 
 	printk(KERN_INFO "%s: pci %s, ports %d, io %llx, irq %u, major %d\n",
 	       host->name, pci_name(pdev), (int) CARM_MAX_PORTS,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
