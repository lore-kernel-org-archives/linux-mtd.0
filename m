Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C44C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzSzjYC7tW7ufgzTYa6d9s3z7bXWy4XxlH+xyv9ocGw=; b=XU4XwRBGU7HqqE
	2H+DSEdQpSKWHklEJmrdd65ThG3x/K5KACb9Qfj8P4xBrwKyrfw9s4Q9mXzGy57anu5pOd/Q4dLik
	qGLJNwnRqTzxX/jWmUTyWzXwXIgzU+0K5TT7oGW/n5YPpDykbkvyvgWSgNyXR4OSSrp9JfjgFfBnT
	Tp0JaQ2pFhSth1IQ9aLGp+Nu8o7ZWksYiKWphnLFary8T9/buiN7TLV1580uYmpgMSlQ/ld0Zb6qb
	3vRaYldytfVFEL6AMhqfDUZvdmCB3g+N5NU4xHXQ+abvdqgczUkMtJbzE/rQUHrdVoJp4zym+Gk8N
	V4tKFa2gxOVHix9j5Ryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7DSM-009478-17;
	Thu, 08 Jun 2023 11:05:30 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q7DQj-0092O2-23;
	Thu, 08 Jun 2023 11:03:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Coly Li <colyli@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-btrfs@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 18/30] scsi: replace the fmode_t argument to scsi_cmd_allowed with a simple bool
Date: Thu,  8 Jun 2023 13:02:46 +0200
Message-Id: <20230608110258.189493-19-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
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

Instead of passing a fmode_t and only checking it for FMODE_WRITE, pass
a bool open_for_write to prepare for callers that won't have the fmode_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Christian Brauner <brauner@kernel.org>
---
 drivers/scsi/scsi_bsg.c   | 2 +-
 drivers/scsi/scsi_ioctl.c | 8 ++++----
 drivers/scsi/sg.c         | 2 +-
 include/scsi/scsi_ioctl.h | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/scsi_bsg.c b/drivers/scsi/scsi_bsg.c
index 96ee35256a168f..12431f35f861e1 100644
--- a/drivers/scsi/scsi_bsg.c
+++ b/drivers/scsi/scsi_bsg.c
@@ -42,7 +42,7 @@ static int scsi_bsg_sg_io_fn(struct request_queue *q, struct sg_io_v4 *hdr,
 	if (copy_from_user(scmd->cmnd, uptr64(hdr->request), scmd->cmd_len))
 		goto out_put_request;
 	ret = -EPERM;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode))
+	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
 		goto out_put_request;
 
 	ret = 0;
diff --git a/drivers/scsi/scsi_ioctl.c b/drivers/scsi/scsi_ioctl.c
index e3b31d32b6a92e..dda5468ca97f90 100644
--- a/drivers/scsi/scsi_ioctl.c
+++ b/drivers/scsi/scsi_ioctl.c
@@ -248,7 +248,7 @@ static int scsi_send_start_stop(struct scsi_device *sdev, int data)
  * Only a subset of commands are allowed for unprivileged users. Commands used
  * to format the media, update the firmware, etc. are not permitted.
  */
-bool scsi_cmd_allowed(unsigned char *cmd, fmode_t mode)
+bool scsi_cmd_allowed(unsigned char *cmd, bool open_for_write)
 {
 	/* root can do any command. */
 	if (capable(CAP_SYS_RAWIO))
@@ -338,7 +338,7 @@ bool scsi_cmd_allowed(unsigned char *cmd, fmode_t mode)
 	case GPCMD_SET_READ_AHEAD:
 	/* ZBC */
 	case ZBC_OUT:
-		return (mode & FMODE_WRITE);
+		return open_for_write;
 	default:
 		return false;
 	}
@@ -354,7 +354,7 @@ static int scsi_fill_sghdr_rq(struct scsi_device *sdev, struct request *rq,
 		return -EMSGSIZE;
 	if (copy_from_user(scmd->cmnd, hdr->cmdp, hdr->cmd_len))
 		return -EFAULT;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode))
+	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
 		return -EPERM;
 	scmd->cmd_len = hdr->cmd_len;
 
@@ -554,7 +554,7 @@ static int sg_scsi_ioctl(struct request_queue *q, fmode_t mode,
 		goto error;
 
 	err = -EPERM;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode))
+	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
 		goto error;
 
 	/* default.  possible overridden later */
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 037f8c98a6d364..e49ea693d0b656 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -237,7 +237,7 @@ static int sg_allow_access(struct file *filp, unsigned char *cmd)
 
 	if (sfp->parentdp->device->type == TYPE_SCANNER)
 		return 0;
-	if (!scsi_cmd_allowed(cmd, filp->f_mode))
+	if (!scsi_cmd_allowed(cmd, filp->f_mode & FMODE_WRITE))
 		return -EPERM;
 	return 0;
 }
diff --git a/include/scsi/scsi_ioctl.h b/include/scsi/scsi_ioctl.h
index beac64e38b8746..914201a8cb947c 100644
--- a/include/scsi/scsi_ioctl.h
+++ b/include/scsi/scsi_ioctl.h
@@ -49,7 +49,7 @@ int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
 		void __user *arg);
 int get_sg_io_hdr(struct sg_io_hdr *hdr, const void __user *argp);
 int put_sg_io_hdr(const struct sg_io_hdr *hdr, void __user *argp);
-bool scsi_cmd_allowed(unsigned char *cmd, fmode_t mode);
+bool scsi_cmd_allowed(unsigned char *cmd, bool open_for_write);
 
 #endif /* __KERNEL__ */
 #endif /* _SCSI_IOCTL_H */
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
