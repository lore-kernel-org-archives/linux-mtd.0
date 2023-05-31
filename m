Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D92C7EE31
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLL+CH4NvqYEt82z44niJ6CL7uAjtcHbILIIBfrmO2E=; b=OVfFTNouS51WXm
	PMYqKHP37OnbCeXqiDuq59x6tbt7uGOgpfVj7rwP4ZgPGa9c46c7umqTXE/dnFVz7Mm1IBOdmofpy
	UxFwns1G9JUk+gQZGCc8065Q2tidLpSEhUJzin3uaW2tUI75vOWypLXAMJB+bRHnvpGMi4yBPlfEN
	71FIG8td5pA00FhswHsBnXdQhEx7F1j+dU7pENOFxSDnbgUvKDQGyx+nETLbHong06jmeTb0MhTfP
	q//932ObhgsRgWog6DItZCupDTf9ieH2kEbO0BNVe/XoMXVlUgPgDgl1BUQB4vKPj6h2FScu5Z2tW
	dEzHuvUKskoDYH4TtAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LMm-00HQxy-2B;
	Wed, 31 May 2023 12:55:52 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LMk-00HQwo-2V;
	Wed, 31 May 2023 12:55:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 02/24] PM: hibernate: factor out a helper to find the resume device
Date: Wed, 31 May 2023 14:55:13 +0200
Message-Id: <20230531125535.676098-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531125535.676098-1-hch@lst.de>
References: <20230531125535.676098-1-hch@lst.de>
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

Split the logic to find the resume device out software_resume and into
a separate helper to start unwindig the convoluted goto logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
 kernel/power/hibernate.c | 72 +++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 30d1274f03f625..07279506366255 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -910,6 +910,41 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data)
 }
 EXPORT_SYMBOL_GPL(hibernate_quiet_exec);
 
+static int find_resume_device(void)
+{
+	if (!strlen(resume_file))
+		return -ENOENT;
+
+	pm_pr_dbg("Checking hibernation image partition %s\n", resume_file);
+
+	if (resume_delay) {
+		pr_info("Waiting %dsec before reading resume device ...\n",
+			resume_delay);
+		ssleep(resume_delay);
+	}
+
+	/* Check if the device is there */
+	swsusp_resume_device = name_to_dev_t(resume_file);
+	if (swsusp_resume_device)
+		return 0;
+
+	/*
+	 * Some device discovery might still be in progress; we need to wait for
+	 * this to finish.
+	 */
+	wait_for_device_probe();
+	if (resume_wait) {
+		while (!(swsusp_resume_device = name_to_dev_t(resume_file)))
+			msleep(10);
+		async_synchronize_full();
+	}
+
+	swsusp_resume_device = name_to_dev_t(resume_file);
+	if (!swsusp_resume_device)
+		return -ENODEV;
+	return 0;
+}
+
 /**
  * software_resume - Resume from a saved hibernation image.
  *
@@ -949,45 +984,12 @@ static int software_resume(void)
 
 	snapshot_test = false;
 
-	if (swsusp_resume_device)
-		goto Check_image;
-
-	if (!strlen(resume_file)) {
-		error = -ENOENT;
-		goto Unlock;
-	}
-
-	pm_pr_dbg("Checking hibernation image partition %s\n", resume_file);
-
-	if (resume_delay) {
-		pr_info("Waiting %dsec before reading resume device ...\n",
-			resume_delay);
-		ssleep(resume_delay);
-	}
-
-	/* Check if the device is there */
-	swsusp_resume_device = name_to_dev_t(resume_file);
 	if (!swsusp_resume_device) {
-		/*
-		 * Some device discovery might still be in progress; we need
-		 * to wait for this to finish.
-		 */
-		wait_for_device_probe();
-
-		if (resume_wait) {
-			while ((swsusp_resume_device = name_to_dev_t(resume_file)) == 0)
-				msleep(10);
-			async_synchronize_full();
-		}
-
-		swsusp_resume_device = name_to_dev_t(resume_file);
-		if (!swsusp_resume_device) {
-			error = -ENODEV;
+		error = find_resume_device();
+		if (error)
 			goto Unlock;
-		}
 	}
 
- Check_image:
 	pm_pr_dbg("Hibernation image partition %d:%d present\n",
 		MAJOR(swsusp_resume_device), MINOR(swsusp_resume_device));
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
