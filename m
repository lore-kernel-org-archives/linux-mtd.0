Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C23DC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu4LmkwnU5CjPDLBSoQTaMADOLMp92TaicZTjriOOOQ=; b=QL4ATCgZGDu4Ir
	AIPMcHoshAiM2k7GCGdJX1QefGDnjKhzssC2D3ETjW68CYoZVqWEu32NvJgQUOzUv3ilg1CmXEEB1
	OOs36zvbXOZaDAY7+A9ARZha0e9vTZELShe7ix9Mp7a5mIfStyGqT/wDjYWOV5gb2l7GwjOJYC2P3
	bXVMvnnwvku992dIemZ1fl5gPVuwNPPa0C8bh82Pytzz1WTWKOa1eMq1K7qMyl1p3PCJnmMcqA3v0
	D6mxKReSJU7F7kuGu2s/kX+QS+F6eXNMMGiNpYs5lj8JHv3RgZMgQ7zG92cuTg9/q7kMP7tf/HgHU
	NVii6JFc5wdDm1P79afA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMYC-00EmHP-UV; Wed, 02 Nov 2022 22:49:36 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXv-00Em5g-2U
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:22 +0000
Received: from pps.filterd (m0078137.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2MefUV031717;
	Wed, 2 Nov 2022 22:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=1Xxw/yfLAKAKJHO5y2yT947zc0sXaYnkKFXNVb9ZJBk=;
 b=DEtzF8/+gTUtO+2DRgVJZ+UfrT5yPfNidD9PqTRRr3/r/GiT2bub3NCM7NVPaUEZ6ueN
 W2IdEV6pDFo3nAuI5yBn4PcHXfFaD0JSyH5WWupa7Vzvcp0hDWNLAxYMgtVvffvpVreb
 Sdsx7UeXO6Cx/Z6aE52Ei7p914Hpsdpe19lQ8l4yzv7Hw9TSoJ4RS1rQCDqExtOE4Gpy
 +7roQDol+2kzd7rrWg1yxZ1UNn0izC5/dGEvCmv1VvL2vqgy/T/gQqRp91ITR596EKhs
 yz8ALbj5QHFwXpBLP3YBViJDe9MUsi7kvqMGwSboxvYWJRt7Qk/apLzNjUEDvwPtng04 AQ== 
Received: from xnwpv37.utc.com ([167.17.239.17])
	by mx0a-00105401.pphosted.com with ESMTP id 3kksese6at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwafg.utcapp.com (qusnwafg.utcapp.com [10.161.48.103])
	by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnD1I181925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:14 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwafg.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnDpU006489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:13 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 68B4B20096;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 1/7] misc-utils: flashcp: add safe_write
Date: Wed,  2 Nov 2022 17:47:51 -0500
Message-Id: <20221102224757.58012-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
References: <20221102224757.58012-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: fQ9RLL6fviW-UPUTMzuPPg6LkucT4pRv
X-Proofpoint-GUID: fQ9RLL6fviW-UPUTMzuPPg6LkucT4pRv
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154919_146936_0EF6952C 
X-CRM114-Status: GOOD (  18.72  )
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

Share the writing code between the two write implementations.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/flashcp.c | 58 +++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 9e78831..59389db 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -147,6 +147,29 @@ static void safe_read (int fd,const char *filename,void *buf,size_t count,bool v
 	}
 }
 
+static void safe_write (int fd,const void *buf,size_t count,size_t written,unsigned long long to_write,const char *device,bool verbose)
+{
+	ssize_t result;
+
+	/* write to device */
+	result = write (fd,buf,count);
+	if (count != result)
+	{
+		if (verbose) log_printf (LOG_NORMAL,"\n");
+		if (result < 0)
+		{
+			log_printf (LOG_ERROR,
+					"While writing data to 0x%.8lx-0x%.8lx on %s: %m\n",
+					written,written + count,device);
+			exit (EXIT_FAILURE);
+		}
+		log_printf (LOG_ERROR,
+				"Short write count returned while writing to x%.8zx-0x%.8zx on %s: %zu/%llu bytes written to flash\n",
+				written,written + count,device,written + result,to_write);
+		exit (EXIT_FAILURE);
+	}
+}
+
 static void safe_rewind (int fd,const char *filename)
 {
 	if (lseek (fd,0L,SEEK_SET) < 0)
@@ -170,7 +193,6 @@ int main (int argc,char *argv[])
 {
 	const char *filename = NULL,*device = NULL;
 	int i,flags = FLAG_NONE;
-	ssize_t result;
 	size_t size,written;
 	struct mtd_info_user mtd;
 	struct erase_info_user erase;
@@ -344,22 +366,7 @@ int main (int argc,char *argv[])
 		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
 
 		/* write to device */
-		result = write (dev_fd,src,i);
-		if (i != result)
-		{
-			if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"\n");
-			if (result < 0)
-			{
-				log_printf (LOG_ERROR,
-						"While writing data to 0x%.8lx-0x%.8lx on %s: %m\n",
-						written,written + i,device);
-				exit (EXIT_FAILURE);
-			}
-			log_printf (LOG_ERROR,
-					"Short write count returned while writing to x%.8zx-0x%.8zx on %s: %zu/%llu bytes written to flash\n",
-					written,written + i,device,written + result,(unsigned long long)filestat.st_size);
-			exit (EXIT_FAILURE);
-		}
+		safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device,flags & FLAG_VERBOSE);
 
 		written += i;
 		size -= i;
@@ -469,22 +476,7 @@ DIFF_BLOCKS:
 
 			/* write to device */
 			lseek(dev_fd, current_dev_block, SEEK_SET);
-			result = write (dev_fd,src,i);
-			if (i != result)
-			{
-				if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"\n");
-				if (result < 0)
-				{
-					log_printf (LOG_ERROR,
-							"While writing data to 0x%.8lx-0x%.8lx on %s: %m\n",
-							written,written + i,device);
-					exit (EXIT_FAILURE);
-				}
-				log_printf (LOG_ERROR,
-						"Short write count returned while writing to x%.8zx-0x%.8zx on %s: %zu/%llu bytes written to flash\n",
-						written,written + i,device,written + result,(unsigned long long)filestat.st_size);
-				exit (EXIT_FAILURE);
-			}
+			safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device,flags & FLAG_VERBOSE);
 		}
 
 		erase.start += i;
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
