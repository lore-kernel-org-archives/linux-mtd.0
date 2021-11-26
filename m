Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4929CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBH5OGud9nbZsnFOotRXSUV+xcoCIe7vmYxHvLtMlTo=; b=WbtBcBwilO+miM
	s41DG0jWAa8XruL+Xbe/EaDolRmLVeVRuZobMomT80dxRDRCb0SXJ8CyRiNI6HrDjfKFd1Od+Iuce
	f5bbPTO6VlXwLIWXgNFwa0wd7u0lGSKreopLk28u4vRhg9nbOzxWiC2v1Z0ZmTKxQiQjQlhdQsYNC
	9Yo7FVP5KXstNz4O2AIZ+y1y5MlY/sydZd+ImyHAC/3v9nEBBdsHnz5/GCsc+LpvhJyKYzdUsE+QK
	cyYM4zu1dRxE2d/4WM8yyxYfqmS+fyP6BUld54jVap/K3N+prbRlQDymPzgsGjc4213jAlIf9zmo5
	xRc3nCeyZqh/3sAwd+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaU3-00APCX-Oy; Fri, 26 Nov 2021 12:37:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB9-00AKI7-Rd
 for linux-mtd@bombadil.infradead.org; Fri, 26 Nov 2021 12:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=dcDk16FRh8VOtFJsyjzmv3494okFf6MLGQiwtkQ2Qz8=; b=l4NJ7wzkR/uzPbZta1L/4r4Q6q
 D39qzFGpQOI75IkyLUYTzO/HjSPqq/bNcswTtXFmo1NTFI67JwBCMm3S6tqNk0PqAtB8aQk8CUkNS
 of2smMJkeowXj5U8+xWf6uGL/XjXyFwd7xAi1uDaVzbf51HD1N0omcbOWZGzXO4ZF7er0eQuDzIt3
 MuWZftuQkxZZPhpGOy7wcZG7UGIdxXgLGT3ucUx5YpyEhX7/7HwbyhHur+4IFBcaaVNkNhxooPpXo
 psBYZEdJEJMNM9mtxsBIVzvG+kDDdaJHZIRIDUqXwpJwL+WFpVzCHLWiBAk4NhzJ6h+wX2gIezIcT
 w4jJfJ1A==;
Received: from [2001:4bb8:191:f9ce:bae8:5658:102a:5491] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB7-00AWHY-GR; Fri, 26 Nov 2021 12:18:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH 5/5] scsi: remove the gendisk argument to scsi_ioctl
Date: Fri, 26 Nov 2021 13:18:02 +0100
Message-Id: <20211126121802.2090656-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126121802.2090656-1-hch@lst.de>
References: <20211126121802.2090656-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Now that blk_execute_rq does not take a gendisk argument there is no need
to pass it through the scsi_ioctl callchain either.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/scsi/ch.c         |  2 +-
 drivers/scsi/scsi_ioctl.c | 39 +++++++++++++++------------------------
 drivers/scsi/sd.c         |  2 +-
 drivers/scsi/sg.c         |  4 ++--
 drivers/scsi/sr.c         |  5 ++---
 drivers/scsi/st.c         |  2 +-
 include/scsi/scsi_ioctl.h |  4 ++--
 7 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index 27012908b5861..6fa300daa31ea 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -877,7 +877,7 @@ static long ch_ioctl(struct file *file,
 	}
 
 	default:
-		return scsi_ioctl(ch->device, NULL, file->f_mode, cmd, argp);
+		return scsi_ioctl(ch->device, file->f_mode, cmd, argp);
 
 	}
 }
diff --git a/drivers/scsi/scsi_ioctl.c b/drivers/scsi/scsi_ioctl.c
index 340ba0ad6e707..e13fd380deb6f 100644
--- a/drivers/scsi/scsi_ioctl.c
+++ b/drivers/scsi/scsi_ioctl.c
@@ -408,8 +408,7 @@ static int scsi_complete_sghdr_rq(struct request *rq, struct sg_io_hdr *hdr,
 	return ret;
 }
 
-static int sg_io(struct scsi_device *sdev, struct gendisk *disk,
-		struct sg_io_hdr *hdr, fmode_t mode)
+static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
 {
 	unsigned long start_time;
 	ssize_t ret = 0;
@@ -499,19 +498,12 @@ static int sg_io(struct scsi_device *sdev, struct gendisk *disk,
 /**
  * sg_scsi_ioctl  --  handle deprecated SCSI_IOCTL_SEND_COMMAND ioctl
  * @q:		request queue to send scsi commands down
- * @disk:	gendisk to operate on (option)
  * @mode:	mode used to open the file through which the ioctl has been
  *		submitted
  * @sic:	userspace structure describing the command to perform
  *
  * Send down the scsi command described by @sic to the device below
- * the request queue @q.  If @file is non-NULL it's used to perform
- * fine-grained permission checks that allow users to send down
- * non-destructive SCSI commands.  If the caller has a struct gendisk
- * available it should be passed in as @disk to allow the low level
- * driver to use the information contained in it.  A non-NULL @disk
- * is only allowed if the caller knows that the low level driver doesn't
- * need it (e.g. in the scsi subsystem).
+ * the request queue @q.
  *
  * Notes:
  *   -  This interface is deprecated - users should use the SG_IO
@@ -530,8 +522,8 @@ static int sg_io(struct scsi_device *sdev, struct gendisk *disk,
  *      Positive numbers returned are the compacted SCSI error codes (4
  *      bytes in one int) where the lowest byte is the SCSI status.
  */
-static int sg_scsi_ioctl(struct request_queue *q, struct gendisk *disk,
-		fmode_t mode, struct scsi_ioctl_command __user *sic)
+static int sg_scsi_ioctl(struct request_queue *q, fmode_t mode,
+		struct scsi_ioctl_command __user *sic)
 {
 	enum { OMAX_SB_LEN = 16 };	/* For backward compatibility */
 	struct request *rq;
@@ -806,8 +798,8 @@ static int scsi_put_cdrom_generic_arg(const struct cdrom_generic_command *cgc,
 	return 0;
 }
 
-static int scsi_cdrom_send_packet(struct scsi_device *sdev, struct gendisk *disk,
-		fmode_t mode, void __user *arg)
+static int scsi_cdrom_send_packet(struct scsi_device *sdev, fmode_t mode,
+		void __user *arg)
 {
 	struct cdrom_generic_command cgc;
 	struct sg_io_hdr hdr;
@@ -847,7 +839,7 @@ static int scsi_cdrom_send_packet(struct scsi_device *sdev, struct gendisk *disk
 	hdr.cmdp = ((struct cdrom_generic_command __user *) arg)->cmd;
 	hdr.cmd_len = sizeof(cgc.cmd);
 
-	err = sg_io(sdev, disk, &hdr, mode);
+	err = sg_io(sdev, &hdr, mode);
 	if (err == -EFAULT)
 		return -EFAULT;
 
@@ -862,8 +854,8 @@ static int scsi_cdrom_send_packet(struct scsi_device *sdev, struct gendisk *disk
 	return err;
 }
 
-static int scsi_ioctl_sg_io(struct scsi_device *sdev, struct gendisk *disk,
-		fmode_t mode, void __user *argp)
+static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
+		void __user *argp)
 {
 	struct sg_io_hdr hdr;
 	int error;
@@ -871,7 +863,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, struct gendisk *disk,
 	error = get_sg_io_hdr(&hdr, argp);
 	if (error)
 		return error;
-	error = sg_io(sdev, disk, &hdr, mode);
+	error = sg_io(sdev, &hdr, mode);
 	if (error == -EFAULT)
 		return error;
 	if (put_sg_io_hdr(&hdr, argp))
@@ -882,7 +874,6 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, struct gendisk *disk,
 /**
  * scsi_ioctl - Dispatch ioctl to scsi device
  * @sdev: scsi device receiving ioctl
- * @disk: disk receiving the ioctl
  * @mode: mode the block/char device is opened with
  * @cmd: which ioctl is it
  * @arg: data associated with ioctl
@@ -891,8 +882,8 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, struct gendisk *disk,
  * does not take a major/minor number as the dev field.  Rather, it takes
  * a pointer to a &struct scsi_device.
  */
-int scsi_ioctl(struct scsi_device *sdev, struct gendisk *disk, fmode_t mode,
-		int cmd, void __user *arg)
+int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
+		void __user *arg)
 {
 	struct request_queue *q = sdev->request_queue;
 	struct scsi_sense_hdr sense_hdr;
@@ -927,11 +918,11 @@ int scsi_ioctl(struct scsi_device *sdev, struct gendisk *disk, fmode_t mode,
 	case SG_EMULATED_HOST:
 		return sg_emulated_host(q, arg);
 	case SG_IO:
-		return scsi_ioctl_sg_io(sdev, disk, mode, arg);
+		return scsi_ioctl_sg_io(sdev, mode, arg);
 	case SCSI_IOCTL_SEND_COMMAND:
-		return sg_scsi_ioctl(q, disk, mode, arg);
+		return sg_scsi_ioctl(q, mode, arg);
 	case CDROM_SEND_PACKET:
-		return scsi_cdrom_send_packet(sdev, disk, mode, arg);
+		return scsi_cdrom_send_packet(sdev, mode, arg);
 	case CDROMCLOSETRAY:
 		return scsi_send_start_stop(sdev, 3);
 	case CDROMEJECT:
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 8181857ddf53f..5ddb8e053a8e7 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1574,7 +1574,7 @@ static int sd_ioctl(struct block_device *bdev, fmode_t mode,
 
 	if (is_sed_ioctl(cmd))
 		return sed_ioctl(sdkp->opal_dev, cmd, p);
-	return scsi_ioctl(sdp, disk, mode, cmd, p);
+	return scsi_ioctl(sdp, mode, cmd, p);
 }
 
 static void set_media_not_present(struct scsi_disk *sdkp)
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 6c8ffad88f9e9..ad12b3261845b 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1109,7 +1109,7 @@ sg_ioctl_common(struct file *filp, Sg_device *sdp, Sg_fd *sfp,
 	case SCSI_IOCTL_SEND_COMMAND:
 		if (atomic_read(&sdp->detaching))
 			return -ENODEV;
-		return scsi_ioctl(sdp->device, NULL, filp->f_mode, cmd_in, p);
+		return scsi_ioctl(sdp->device, filp->f_mode, cmd_in, p);
 	case SG_SET_DEBUG:
 		result = get_user(val, ip);
 		if (result)
@@ -1165,7 +1165,7 @@ sg_ioctl(struct file *filp, unsigned int cmd_in, unsigned long arg)
 	ret = sg_ioctl_common(filp, sdp, sfp, cmd_in, p);
 	if (ret != -ENOIOCTLCMD)
 		return ret;
-	return scsi_ioctl(sdp->device, NULL, filp->f_mode, cmd_in, p);
+	return scsi_ioctl(sdp->device, filp->f_mode, cmd_in, p);
 }
 
 static __poll_t
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index c29589815468c..14c122839c409 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -561,8 +561,7 @@ static void sr_block_release(struct gendisk *disk, fmode_t mode)
 static int sr_block_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 			  unsigned long arg)
 {
-	struct gendisk *disk = bdev->bd_disk;
-	struct scsi_cd *cd = scsi_cd(disk);
+	struct scsi_cd *cd = scsi_cd(bdev->bd_disk);
 	struct scsi_device *sdev = cd->device;
 	void __user *argp = (void __user *)arg;
 	int ret;
@@ -584,7 +583,7 @@ static int sr_block_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 		if (ret != -ENOSYS)
 			goto put;
 	}
-	ret = scsi_ioctl(sdev, disk, mode, cmd, argp);
+	ret = scsi_ioctl(sdev, mode, cmd, argp);
 
 put:
 	scsi_autopm_put_device(sdev);
diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index 06acc7db77550..e869e90e05afe 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -3829,7 +3829,7 @@ static long st_ioctl(struct file *file, unsigned int cmd_in, unsigned long arg)
 		break;
 	}
 
-	retval = scsi_ioctl(STp->device, NULL, file->f_mode, cmd_in, p);
+	retval = scsi_ioctl(STp->device, file->f_mode, cmd_in, p);
 	if (!retval && cmd_in == SCSI_IOCTL_STOP_UNIT) {
 		/* unload */
 		STp->rew_at_close = 0;
diff --git a/include/scsi/scsi_ioctl.h b/include/scsi/scsi_ioctl.h
index d2cb9aeaf1f16..beac64e38b874 100644
--- a/include/scsi/scsi_ioctl.h
+++ b/include/scsi/scsi_ioctl.h
@@ -45,8 +45,8 @@ typedef struct scsi_fctargaddress {
 
 int scsi_ioctl_block_when_processing_errors(struct scsi_device *sdev,
 		int cmd, bool ndelay);
-int scsi_ioctl(struct scsi_device *sdev, struct gendisk *disk, fmode_t mode,
-		int cmd, void __user *arg);
+int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
+		void __user *arg);
 int get_sg_io_hdr(struct sg_io_hdr *hdr, const void __user *argp);
 int put_sg_io_hdr(const struct sg_io_hdr *hdr, void __user *argp);
 bool scsi_cmd_allowed(unsigned char *cmd, fmode_t mode);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
