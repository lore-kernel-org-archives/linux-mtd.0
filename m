Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EFDC4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 07:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F388E610A0
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 07:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F388E610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bjGoe3uJVbN9iO0cpxZ0azHHhIrYeDWp64/5E+ChSvg=; b=4nLiXvq0BAPnS3
	yVyQ/W/tKNhlpVa7KXpf6r2RbJbw8Vs72C+1WuOgJmGHG4DqkD91JBdgd5p8QhvhGlcHqr2mcMBzb
	nK+m6tmYGSlFRqVQP/FkltW5OtMV4pPJESvAw2O2DLaQ7ik5fURmUJcBBlgHV8Jpg0UYN7cuLKHb8
	mvixfA39aiUfEgUW94jhSKE+GOqEjnnJaFXc/58dfX5vM/keZ//lneWRjcgsW5DJ7esUrFaxtFlgw
	+OIV5F746kHe33LNdYOeXlu5ByRMh+jNKezjbr4e3ZVdaoJhDqwTTGJPcIIdkVbaiij6gxvtVeR2Y
	JJa4T4lNrtBeHs5SmHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnywY-00FAR6-FX; Tue, 01 Jun 2021 07:36:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnywU-00FAQO-HO
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 07:36:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id x10so5486380plg.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Jun 2021 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PlEp80zz59Htslj8ZEa/0YU3v6/zPl7KR0xZI0weEsM=;
 b=FrHRsHFYFMlZMFGwKCyYacgJzHZoHYbYt21qesl2w2GcmvRbUNGi5QK1HucfZPVoeh
 0oXJRtVJyO8AgI7rTsUQ8AjYJyK9HzB67vGWUoLCsXjG5BsElP+VyNCNMsVDY6MM6sQS
 OFH5MoGXen02mgcQwbPB3swL3+szLDNl8q8FbNVIPOW13fh4TFkJ8Q5nJ6G2zi/7igSK
 YiFKneGdFkvmnqfMOOcvMD4qE1Q3gx6/cnDi7mBQopvfQpcP7T44nLuhS/KByVpwuIni
 kxtEdW8yV/vUUOUdO9UWVs+GkXWCGThOitdhBLEzvNx7VOTaSh2G3S91tGTZfueNIj5B
 +axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PlEp80zz59Htslj8ZEa/0YU3v6/zPl7KR0xZI0weEsM=;
 b=afG8iph+THrd65hBO6UxuEyO9Rx7DHPHOv9Y2pUMoHEYtIYAGBi1P6Ze5nbWpWRYKs
 bhMUL28u9QsJ/Pth7vSY5I2UTWrEwX1sJ7KtFDOQFhlJavtMNdGk0A0aUSe2EonkyuHG
 r5oTiKJIBF9lDL2GnjxlGVzTyAtblT4xmJL2tmb8PDMiKXI4tIRSRrL2J6nteT4iopBV
 inJe8qRmTKzva0RUr2eBeh/3cA0ejM8gcm74D1CMHahJ8kf2QE3gTS4WwYtKkt3yncno
 5Uh9sAlB9EeafzHoevbgjyYYjj5/y1wMC0oe5BainQkKRQ5GAE4icrPTsBi+HxcnRPbb
 6tNg==
X-Gm-Message-State: AOAM530lw9coM/zmcg36+dXdGP9AxLMVZaKLnhoZBTxcXj/hvZxGf5yG
 fpq2UYglRYVWiaD+I/l9cmdDONmUnDdLNA==
X-Google-Smtp-Source: ABdhPJxT6miczoWt6q4P1jLBK2UtCvc+2kfr8UsOI/bQORHIwG0mOeKQ7K25nSI8BGuWmyxJb717Xw==
X-Received: by 2002:a17:90a:ad8e:: with SMTP id
 s14mr12182712pjq.198.1622532960848; 
 Tue, 01 Jun 2021 00:36:00 -0700 (PDT)
Received: from harvey-System-Product-Name.dhcpserver.local
 (220-135-135-179.HINET-IP.hinet.net. [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id b23sm12424970pfi.34.2021.06.01.00.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 00:36:00 -0700 (PDT)
From: Harvey Wu <harveywu95@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Harvey.Wu@quantatw.com
Subject: [PATCH] misc-utils: flashcp: Add new function that copy only
 different blocks
Date: Tue,  1 Jun 2021 15:34:53 +0800
Message-Id: <20210601073453.28252-1-harveywu95@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_003602_617746_E3FEADCE 
X-CRM114-Status: GOOD (  19.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

- The original flashcp process is erase, write and verify all blocks
  in one time from file to device.
  This patch will add a function that only copy different block data
  from file to device. The function will compare blocks by block
  between file and device, then erase and write block data from file
  to device if found different block.

Signed-off-by: Harvey Wu <harveywu95@gmail.com>
---
 misc-utils/flashcp.c | 93 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index d7b0a59..341c210 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -67,6 +67,7 @@
 #define FLAG_FILENAME	0x04
 #define FLAG_DEVICE		0x08
 #define FLAG_ERASE_ALL	0x10
+#define FLAG_PARTITION	0x20
 
 /* error levels */
 #define LOG_NORMAL	1
@@ -96,6 +97,7 @@ static NORETURN void showusage(bool error)
 			"\n"
 			"   -h | --help      Show this help message\n"
 			"   -v | --verbose   Show progress reports\n"
+			"   -p | --partition Only copy different block from file to device\n"
 			"   -A | --erase-all Erases the whole device regardless of the image size\n"
 			"   -V | --version   Show version information and exit\n"
 			"   <filename>       File which you want to copy to flash\n"
@@ -181,10 +183,11 @@ int main (int argc,char *argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "hvAV";
+		static const char *short_options = "hvpAV";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 'h'},
 			{"verbose", no_argument, 0, 'v'},
+			{"partition", no_argument, 0, 'p'},
 			{"erase-all", no_argument, 0, 'A'},
 			{"version", no_argument, 0, 'V'},
 			{0, 0, 0, 0},
@@ -205,6 +208,10 @@ int main (int argc,char *argv[])
 				flags |= FLAG_VERBOSE;
 				DEBUG("Got FLAG_VERBOSE\n");
 				break;
+			case 'p':
+				flags |= FLAG_PARTITION;
+				DEBUG("Got FLAG_PARTITION");
+				break;
 			case 'A':
 				flags |= FLAG_ERASE_ALL;
 				DEBUG("Got FLAG_ERASE_ALL\n");
@@ -257,6 +264,12 @@ int main (int argc,char *argv[])
 		exit (EXIT_FAILURE);
 	}
 
+	/* diff block flashcp */
+	if (flags & FLAG_PARTITION)
+	{
+		goto DIFF_BLOCKS;
+	}
+
 	/*****************************************************
 	 * erase enough blocks so that we can write the file *
 	 *****************************************************/
@@ -403,4 +416,82 @@ int main (int argc,char *argv[])
 	DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long long)filestat.st_size);
 
 	exit (EXIT_SUCCESS);
+
+	/*********************************************
+	 * Copy different blocks from file to device *
+	 ********************************************/
+DIFF_BLOCKS:
+	safe_rewind (fil_fd,filename);
+	safe_rewind (dev_fd,device);
+	size = filestat.st_size;
+	i = mtd.erasesize;
+	erase.start = 0;
+	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
+	erase.length *= mtd.erasesize;
+	written = 0;
+	unsigned long current_dev_block = 0;
+	int diffBlock = 0;
+	int blocks = erase.length / mtd.erasesize;
+	erase.length = mtd.erasesize;
+
+	if (flags & FLAG_VERBOSE)
+		log_printf (LOG_NORMAL,
+				"\rProcessing blocks: 0/%d (%d%%)", blocks, PERCENTAGE (0,blocks));
+	for (int s = 1; s <= blocks; s++)
+	{
+		if (size < mtd.erasesize) i = size;
+		if (flags & FLAG_VERBOSE)
+			log_printf (LOG_NORMAL,
+					"\rProcessing blocks: %d/%d (%d%%)", s, blocks, PERCENTAGE (s,blocks));
+
+		/* read from filename */
+		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
+
+		/* read from device */
+		current_dev_block = lseek(dev_fd, 0, SEEK_CUR);
+		safe_read (dev_fd,device,dest,i,flags & FLAG_VERBOSE);
+
+		/* compare buffers, if not the same, erase and write the block */
+		if (memcmp (src,dest,i))
+		{
+			diffBlock++;
+			/* erase block */
+			lseek(dev_fd, current_dev_block, SEEK_SET);
+			if (ioctl (dev_fd,MEMERASE,&erase) < 0)
+			{
+				log_printf (LOG_NORMAL,"\n");
+				log_printf (LOG_ERROR,
+						"While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
+						(unsigned int) erase.start,(unsigned int) (erase.start + erase.length),device);
+				exit (EXIT_FAILURE);
+			}
+
+			/* write to device */
+			lseek(dev_fd, current_dev_block, SEEK_SET);
+			result = write (dev_fd,src,i);
+			if (i != result)
+			{
+				if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"\n");
+				if (result < 0)
+				{
+					log_printf (LOG_ERROR,
+							"While writing data to 0x%.8lx-0x%.8lx on %s: %m\n",
+							written,written + i,device);
+					exit (EXIT_FAILURE);
+				}
+				log_printf (LOG_ERROR,
+						"Short write count returned while writing to x%.8zx-0x%.8zx on %s: %zu/%llu bytes written to flash\n",
+						written,written + i,device,written + result,(unsigned long long)filestat.st_size);
+				exit (EXIT_FAILURE);
+			}
+		}
+
+		erase.start += i;
+		written += i;
+		size -= i;
+	}
+
+	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL, "\ndiff blocks: %d\n", diffBlock);
+
+	exit (EXIT_SUCCESS);
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
