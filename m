Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EBFC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpgpsx3HMjlgXYV3mE8yr44ard346wSM7IfHkgLSBrI=; b=zwMsBy2rhyqF0N
	tqBeJKvzJvPHXtsSJyznSkInuQJor1RzAgkuKAIa2KmYaxItj64/qpCT4RATfxdvnBqsRyJnKIkmP
	DP1HEZP8YDp4NlWvos4TQ+elX88vK8GxVXTBPHKR4Gvb9XHtti6OSE7Ic5HqPTzk6u34kcwgf7/1m
	H1e67qTEkGWMwaxHn7mqGUqfTNZn+HvJUCrspsKAoHdWRHFH71kxmuGIGj/DkhZe9p8+ymh4pyNeP
	HN46KFveJX4uBWeE/RgwlPJPExdkBt1HWUDImU+nPFzY3E9eYFiihcGBJDcXT4OTkBqbw/4QX24bP
	uUNwgsHHkAQH7zhWrzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMYA-00EmFg-4t; Wed, 02 Nov 2022 22:49:34 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXv-00Em5v-1E
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:22 +0000
Received: from pps.filterd (m0083135.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2MgFfc003546;
	Wed, 2 Nov 2022 22:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=SNGiglUwc44pBqP3o2SWRqrpNDuljhU8C3uJPkgtBQQ=;
 b=jsipBrpwefHSHlDZsBVOzsmzYmyrRwQybM03xGabkqj05mV8G1JiPqnXwZyFT5kUZIxs
 bmAT3I1v+MOPDBe9/4WXEqf69I6/bEz7Ksw+y3JkTMAHmdslNQK3C6zbYtDKbSwQ5Ldl
 Y5uU8tXOOEjBjaXEGpQGdo73u2a0tiqNNkL/xFPG3xDASUxoJq2MgU1/b8LAZu6ARdEV
 9PyveQ+xxgNeqy4vBIfJP3fETUXCNex0gs5dcJpK/YxhT1BXd+xbaZONEr1Ti8rLi9oe
 CLa8qNtZG3dbqBSY3s/wdWQ81pSE9QGcZrJ85Xaixh07VrLrd9j5FlApNKVFpd4s1ItP 9A== 
Received: from xnwpv35.utc.com ([167.17.239.15])
	by mx0a-00105401.pphosted.com with ESMTP id 3kktubcvs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
	by xnwpv35.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnEUN074104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:14 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnECa025233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id BC6BC200A5;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 6/7] misc-utils: flashcp: verify data in --partition
Date: Wed,  2 Nov 2022 17:47:56 -0500
Message-Id: <20221102224757.58012-7-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
References: <20221102224757.58012-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 3h0QEF63dIXwe1xavCScbpfivEoSGBQA
X-Proofpoint-GUID: 3h0QEF63dIXwe1xavCScbpfivEoSGBQA
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154919_113107_D4EAA05F 
X-CRM114-Status: GOOD (  15.41  )
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

The --partition mode is not verifying that data is being written
successfully.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/flashcp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 02be081..13ff2f1 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -465,6 +465,15 @@ DIFF_BLOCKS:
 			/* write to device */
 			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
 			safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device);
+
+			/* read from device */
+			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
+			safe_read (dev_fd,device,dest,i);
+
+			/* compare buffers for write success */
+			if (memcmp (src,dest,i))
+				log_failure("File does not seem to match flash data. First mismatch at 0x%.8zx-0x%.8zx\n",
+						written,written + i);
 		}
 
 		erase.start += i;
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
