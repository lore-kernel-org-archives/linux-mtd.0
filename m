Return-Path: <SRS0=qv8i=A3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EEDC433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 11:54:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D8A20760
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 11:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1EwVy29y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z+Lo92f1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D8A20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J8G+auBKAoWm5cf19N+bWiM/jgD+P3OO1qwjpxk1ZjY=; b=1EwVy29yGFsXfakxd1wNm5jDq3
	jbVgmN+uR6+VYEN6dXm9jMIaFz2j22DzMshrnzzcjhomLhlP1lOvbe9cHuxdOEUVd9BSpRCihCHCm
	HxLENavsQL0uPpr54YpJCcXMCWIBCtiZTkZpWSH4VzQCAW9RsaJUaEYUpIBoATaNe3fnjBI4kwIPw
	Jw2lLvF2r9PXWsNq9fP77LlDmSxyt3PIvtOZfLBCJCWhPTdqXad2AH3pLPHkBVJNWBlBWPXMS4jfV
	X2zXrK2X3X/yElATqju8gWdhUcSXrbtDm1R6WxvleN1oWQ4eu+ymIJE3nKtp1m1ReBZU0DR1ZIxar
	gr6jLmXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw2Sc-0005s8-97; Thu, 16 Jul 2020 11:53:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw2SZ-0005r9-7f
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2020 11:53:56 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C24620739;
 Thu, 16 Jul 2020 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594900432;
 bh=snuO7Afj7MA835fjlKy97Sdl/QB5+F2KKYVi91gzJGY=;
 h=Date:From:To:Cc:Subject:From;
 b=z+Lo92f1Z3Hqd0m/IYqU2kSKtnFQPWyqMXEoQQ0N/Zzl0ctA9mVeKJ19ZxZIQLToC
 baqRXp/Yx5/pujymq4Cpv9hPfJY3aK0GWGqd7ZnS3SQnItLBpk5iPLCy/e/d5L4rpE
 WWkD99oVRhItakVJ5C/0akC+F8VNqg4R8kNLV6qc=
Date: Thu, 16 Jul 2020 13:53:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: properly check all write ioctls for permissions
Message-ID: <20200716115346.GA1667288@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_075355_348653_28F61F56 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When doing a "write" ioctl call, properly check that we have permissions
to do so before copying anything from userspace or anything else so we
can "fail fast".  This includes also covering the MEMWRITE ioctl which
previously missed checking for this.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/mtdchar.c | 54 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index c5935b2f9cd1..52c120f9fb0d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -355,9 +355,6 @@ static int mtdchar_writeoob(struct file *file, struct mtd_info *mtd,
 	uint32_t retlen;
 	int ret = 0;
 
-	if (!(file->f_mode & FMODE_WRITE))
-		return -EPERM;
-
 	if (length > 4096)
 		return -EINVAL;
 
@@ -643,6 +640,48 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 
 	pr_debug("MTD_ioctl\n");
 
+	/*
+	 * Check the file mode to require "dangerous" commands to have write
+	 * permissions.
+	 */
+	switch (cmd) {
+	/* "safe" commands */
+	case MEMGETREGIONCOUNT:
+	case MEMGETREGIONINFO:
+	case MEMGETINFO:
+	case MEMREADOOB:
+	case MEMREADOOB64:
+	case MEMLOCK:
+	case MEMUNLOCK:
+	case MEMISLOCKED:
+	case MEMGETOOBSEL:
+	case MEMGETBADBLOCK:
+	case MEMSETBADBLOCK:
+	case OTPSELECT:
+	case OTPGETREGIONCOUNT:
+	case OTPGETREGIONINFO:
+	case OTPLOCK:
+	case ECCGETLAYOUT:
+	case ECCGETSTATS:
+	case MTDFILEMODE:
+	case BLKPG:
+	case BLKRRPART:
+		break;
+
+	/* "dangerous" commands */
+	case MEMERASE:
+	case MEMERASE64:
+	case MEMWRITEOOB:
+	case MEMWRITEOOB64:
+	case MEMWRITE:
+		if (!(file->f_mode & FMODE_WRITE))
+			return -EPERM;
+		break;
+
+	default:
+		return -ENOTTY;
+	}
+
 	switch (cmd) {
 	case MEMGETREGIONCOUNT:
 		if (copy_to_user(argp, &(mtd->numeraseregions), sizeof(int)))
@@ -690,9 +729,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 	{
 		struct erase_info *erase;
 
-		if(!(file->f_mode & FMODE_WRITE))
-			return -EPERM;
-
 		erase=kzalloc(sizeof(struct erase_info),GFP_KERNEL);
 		if (!erase)
 			ret = -ENOMEM;
@@ -985,9 +1021,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		ret = 0;
 		break;
 	}
-
-	default:
-		ret = -ENOTTY;
 	}
 
 	return ret;
@@ -1031,6 +1064,9 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 		struct mtd_oob_buf32 buf;
 		struct mtd_oob_buf32 __user *buf_user = argp;
 
+		if (!(file->f_mode & FMODE_WRITE))
+			return -EPERM;
+
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
