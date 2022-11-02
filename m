Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E003C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0DVGqcyAV34+4aOxYVSwVRC68YAND9OzegXNpEENKA=; b=pyH3joNdtUOEND
	cfAoWdWj+DtYMkSqeTTP5tm5PLlU0Zhxj/4y1uKRgS9r/nwoRYoe/MtlVMyVHe8Vgr/gZo8psf8lj
	2M/6KJON7duvTEvkNX5PaF76371C8wlC+4mpPZJWmaGTDRz3zCr7cfVDHoOwF8rCICDv35oAmfy9P
	hZqWScWXfRfkpiWuedAG5HWNsn/afUXRZFd21runI2aEQ2hCmVCqs1RSVeiNsLaTGZSWtDwuzpfmJ
	qINtayAuydlGWQCBhKi5o8LgxDsAXdtD/km31+gTsbA57wZoRz5E39T4bF2TLZeZ3LfXxVkQ6vwUu
	qk0qCViVKzBtlgiFHGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXz-00EmAj-HK; Wed, 02 Nov 2022 22:49:23 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXu-00Em5t-9b
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:19 +0000
Received: from pps.filterd (m0075556.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2Me1Kg009354;
	Wed, 2 Nov 2022 22:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=pY0lqSbRLl6R/DqaFH5v7OowubGLpMcjIXm0O9M6vnw=;
 b=ht5FLdWFhikz6rDtwFWQ47T46c0wII4ll1cKtDct6gvGNqThe5YtkXq53qZuRW8yaSzZ
 GN+AGSCbNNtIZmNyJHCyj+T4xl7YDCMbP+qwziMyv+pZEufJZ0fg/2LE0NnN+WIwRahI
 h9khQUMbRB2IJDt+dxHO7fGeUdZmkYKOB3eeAJtMOU6zJXw6+Qhgh1OE9CsbZux0X3ty
 x418aBO4WMj4aHI1KyW4QsCYpYgK+lo9jE6T6Fzs2KVf7Dtm0BVDIc0XeJEgwBZ1hxG6
 4SDs0Bgfqu9XX9qStcrq9ALMOCS0RlhHBtarbWkxeovVMo615c5p/TlsFInhmHq5Yjai yw== 
Received: from xmnpv39.utc.com ([167.17.239.13])
	by mx0a-00105401.pphosted.com with ESMTP id 3kkq6fqur2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwady.utcapp.com (QUSNWADY.utcapp.com [10.161.48.89])
	by xmnpv39.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnEam054722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:14 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwady.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnDAu030959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 8AD29200A3;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 3/7] misc-utils: flashcp: add safe_memerase
Date: Wed,  2 Nov 2022 17:47:53 -0500
Message-Id: <20221102224757.58012-4-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
References: <20221102224757.58012-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-GUID: wtX91M0PdkAhJDi_YkrZoM8vGwgi1LQD
X-Proofpoint-ORIG-GUID: wtX91M0PdkAhJDi_YkrZoM8vGwgi1LQD
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154918_404224_E24387F7 
X-CRM114-Status: GOOD (  16.81  )
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

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/flashcp.c | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 43a497f..8cb0dbb 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -189,6 +189,18 @@ static void safe_rewind (int fd,const char *filename)
 	safe_lseek(fd,0L,SEEK_SET,filename);
 }
 
+static void safe_memerase (int fd,const char *device,struct erase_info_user *erase,bool verbose)
+{
+	if (ioctl (fd,MEMERASE,erase) < 0)
+	{
+		if (verbose) log_printf (LOG_NORMAL,"\n");
+		log_printf (LOG_ERROR,
+				"While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
+				(unsigned int) erase->start,(unsigned int) (erase->start + erase->length),device);
+		exit (EXIT_FAILURE);
+	}
+}
+
 /******************************************************************************/
 
 static int dev_fd = -1,fil_fd = -1;
@@ -330,14 +342,7 @@ int main (int argc,char *argv[])
 		for (i = 1; i <= blocks; i++)
 		{
 			log_printf (LOG_NORMAL,"\rErasing blocks: %d/%d (%d%%)",i,blocks,PERCENTAGE (i,blocks));
-			if (ioctl (dev_fd,MEMERASE,&erase) < 0)
-			{
-				log_printf (LOG_NORMAL,"\n");
-				log_printf (LOG_ERROR,
-						"While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
-						(unsigned int) erase.start,(unsigned int) (erase.start + erase.length),device);
-				exit (EXIT_FAILURE);
-			}
+			safe_memerase(dev_fd,device,&erase,flags & FLAG_VERBOSE);
 			erase.start += mtd.erasesize;
 		}
 		log_printf (LOG_NORMAL,"\rErasing blocks: %d/%d (100%%)\n",blocks,blocks);
@@ -345,13 +350,7 @@ int main (int argc,char *argv[])
 	else
 	{
 		/* if not, erase the whole chunk in one shot */
-		if (ioctl (dev_fd,MEMERASE,&erase) < 0)
-		{
-			log_printf (LOG_ERROR,
-					"While erasing blocks from 0x%.8x-0x%.8x on %s: %m\n",
-					(unsigned int) erase.start,(unsigned int) (erase.start + erase.length),device);
-			exit (EXIT_FAILURE);
-		}
+		safe_memerase(dev_fd,device,&erase,flags & FLAG_VERBOSE);
 	}
 	DEBUG("Erased %u / %luk bytes\n",erase.length,filestat.st_size);
 
@@ -475,14 +474,7 @@ DIFF_BLOCKS:
 			diffBlock++;
 			/* erase block */
 			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
-			if (ioctl (dev_fd,MEMERASE,&erase) < 0)
-			{
-				log_printf (LOG_NORMAL,"\n");
-				log_printf (LOG_ERROR,
-						"While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
-						(unsigned int) erase.start,(unsigned int) (erase.start + erase.length),device);
-				exit (EXIT_FAILURE);
-			}
+			safe_memerase(dev_fd,device,&erase,flags & FLAG_VERBOSE);
 
 			/* write to device */
 			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
