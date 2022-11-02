Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C42C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEuujpUwylM1BN7KeNVbbDp+EqxcDM8ej04f6/eWsW4=; b=aTvIV0FZPypssh
	9oSycXcVDB7/JhsZCDfto+4rtH/Wht5nx/f4tow7fmJsbydYkHriHZWVu5GucLA+M+ruawCbARjJx
	5y4prcajdbYF8oLSnyPtrWIx5gvgQ5BxtURwfN09S72puEkFHxwNGRc/Ub2VFaJUsPGOBB4nVDkow
	UWgQiD8A+yH3PPukMivmhQwzBSPZg9KhELef9Jkd0Y3941qlBZWYMWEjJ5bua1sL7/+6Rh+UI5Mxl
	9OrDDYXQMAmKRFOypwJYCtDicN6BN9vd90SHij8P6Q6TscUs+Ri7SHPA+t3mOYilHYv/etHx2wWeQ
	7K5WNW5+vcI7bUR5hW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMY5-00EmCu-8d; Wed, 02 Nov 2022 22:49:29 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXv-00Em5f-0Q
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:21 +0000
Received: from pps.filterd (m0083135.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2MfDMq048511;
	Wed, 2 Nov 2022 22:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=EzkJtTjVu6f6G9fw3qNNIpWyeehnlZM+/RJOYKtOcMY=;
 b=OKfSQMqysruWJ8Q90haatTktnUOJg+OeaVMi2cN06ohmrCa42MxFlpIUHpvUQNlCRugE
 gNGECodRm78eIZDNkbRI3VHTW7ypffHYrYoUfLOcJCHi6Fyg9yLShkXxyE2clfyNcG4g
 xZXaOfoxTGU1hoqCqAAwXn7IyfC4glrXFMF2r4SVyNCD8b22nfXusyldn0j6F7lEzo57
 G8+XEhWPyUU5aOsdtaxsZh/sYqwqc5v3WHdptrh8ICcbv/HMqLKk0+g6jpVXM7ouqZDD
 wybfZ6ODRX7mPiK0mnkCVs/fr4CPy102a5q+tns8zovpWcmOzqttx6LrInF/ZexEGzIq XQ== 
Received: from xnwpv37.utc.com ([167.17.239.17])
	by mx0a-00105401.pphosted.com with ESMTP id 3kktubcvs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
	by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnEGH181930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:14 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnDmC025227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:13 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 7A5C72009F;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 2/7] misc-utils: flashcp: check for lseek errors
Date: Wed,  2 Nov 2022 17:47:52 -0500
Message-Id: <20221102224757.58012-3-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
References: <20221102224757.58012-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 5dc14_ZU3Fh2HElkn0cAzvsEVax1SOYR
X-Proofpoint-GUID: 5dc14_ZU3Fh2HElkn0cAzvsEVax1SOYR
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154919_076047_054A8F0F 
X-CRM114-Status: GOOD (  18.28  )
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

Add a safe_lseek wrapper to check for lseek errors.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/flashcp.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 59389db..43a497f 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -170,13 +170,23 @@ static void safe_write (int fd,const void *buf,size_t count,size_t written,unsig
 	}
 }
 
-static void safe_rewind (int fd,const char *filename)
+static off_t safe_lseek (int fd,off_t offset,int whence,const char *filename)
 {
-	if (lseek (fd,0L,SEEK_SET) < 0)
+	off_t off;
+
+	off = lseek (fd,offset,whence);
+	if (off < 0)
 	{
-		log_printf (LOG_ERROR,"While seeking to start of %s: %m\n",filename);
+		log_printf (LOG_ERROR,"While seeking on %s: %m\n",filename);
 		exit (EXIT_FAILURE);
 	}
+
+	return off;
+}
+
+static void safe_rewind (int fd,const char *filename)
+{
+	safe_lseek(fd,0L,SEEK_SET,filename);
 }
 
 /******************************************************************************/
@@ -456,7 +466,7 @@ DIFF_BLOCKS:
 		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
 
 		/* read from device */
-		current_dev_block = lseek(dev_fd, 0, SEEK_CUR);
+		current_dev_block = safe_lseek(dev_fd, 0, SEEK_CUR, device);
 		safe_read (dev_fd,device,dest,i,flags & FLAG_VERBOSE);
 
 		/* compare buffers, if not the same, erase and write the block */
@@ -464,7 +474,7 @@ DIFF_BLOCKS:
 		{
 			diffBlock++;
 			/* erase block */
-			lseek(dev_fd, current_dev_block, SEEK_SET);
+			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
 			if (ioctl (dev_fd,MEMERASE,&erase) < 0)
 			{
 				log_printf (LOG_NORMAL,"\n");
@@ -475,7 +485,7 @@ DIFF_BLOCKS:
 			}
 
 			/* write to device */
-			lseek(dev_fd, current_dev_block, SEEK_SET);
+			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
 			safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device,flags & FLAG_VERBOSE);
 		}
 
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
