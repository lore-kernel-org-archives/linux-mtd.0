Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BF1C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 09:38:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3031660C3D
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 09:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3031660C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q2yReCOQzzqNefhebJOJwWNwmsrnDXmL4GvkGx0bcW8=; b=i3lZlRZxUD1GpMOpW8E7qGZVak
	++y8c2/PWaeEZHf+QBw3wJQCEtThj5xv0NrKn/wwZ5wP94jusuKYU7QBXS06wDhsgfgWo63wp1l+c
	8Z5R194sSNmu5dN9j2wN+SRatyayurc+HqBUclZB8xdzOCbM4obDlmCz61XBmEzeAqT0CplLPGAC/
	tCyYD5GtcZEBPFq3QuNiffzbBiPEf6yo542eHO0EiRs5dP1ZLXalDxcwJRqUNRDa+69rdU8diTLBg
	TzQjcDMO+Z6Jf+h7EUcd0Bx9ZMFeDnehXDO6itfIbAvnT4mlvS2tSAL7r9iM/UodwjvNEq8JtNxhy
	YYZqMksg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l53jp-0004Se-Kb; Thu, 28 Jan 2021 09:37:17 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l53jn-0004RT-1z
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 09:37:15 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9E4Qq014468;
 Thu, 28 Jan 2021 09:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Qcbhu6FPjjmyWu2EJMpsp4cxmH7sCf68qs6ILGhCu64=;
 b=lnsUak4kUX9WfC1pryMsefodLy12bkhdTVJNnPxcJ4Hqo75+kM23cHNcXv6cJiOb56Jh
 DUdDyE8mH180Do3Bw/pF+iWQE5FufQaYaDBIpMUOCdh5HDrMkPVlL5sSFjbwbzwfF9Lt
 TrVXjslqS4KK4Sfa4isb3jGx7GLrFXvgZPBWm/l6TZqwB7HZdMSPoOGY6SYy6ipgpr4G
 abLar+8zpnDF8ve7x+nL38xgztRR78xGJJriaSxEEJAPtlC7IIqFo2kxYfemd6vW1ZI0
 jNd+9qKsl5jsH99u6SDZLgjMwK8IYN1YTka8744TZisODif0A64wpOy20URUeq1vqwG1 eA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 368b7r36fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 09:37:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9GE6p156504;
 Thu, 28 Jan 2021 09:37:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 368wr02s31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 09:37:04 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10S9b0Ai002136;
 Thu, 28 Jan 2021 09:37:02 GMT
Received: from mwanda (/10.175.203.176)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 28 Jan 2021 01:36:59 -0800
Date: Thu, 28 Jan 2021 12:36:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: parser_imagetag: fix error codes in
 bcm963xx_parse_imagetag_partitions()
Message-ID: <YBKFtNaFHGYBj+u4@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280048
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_043715_285062_D8FFEA2E 
X-CRM114-Status: GOOD (  17.74  )
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
Cc: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If the kstrtouint() calls fail, then this should return a negative
error code but it currently returns success.

Fixes: dd84cb022b31 ("mtd: bcm63xxpart: move imagetag parsing to its own parser")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/parsers/parser_imagetag.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
index d69607b48227..fab0949aabba 100644
--- a/drivers/mtd/parsers/parser_imagetag.c
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -83,6 +83,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid rootfs address: %*ph\n",
 				(int)sizeof(buf->flash_image_start),
 				buf->flash_image_start);
+			ret = -EINVAL;
 			goto out;
 		}
 
@@ -92,6 +93,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid kernel address: %*ph\n",
 				(int)sizeof(buf->kernel_address),
 				buf->kernel_address);
+			ret = -EINVAL;
 			goto out;
 		}
 
@@ -100,6 +102,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid kernel length: %*ph\n",
 				(int)sizeof(buf->kernel_length),
 				buf->kernel_length);
+			ret = -EINVAL;
 			goto out;
 		}
 
@@ -108,6 +111,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid total length: %*ph\n",
 				(int)sizeof(buf->total_length),
 				buf->total_length);
+			ret = -EINVAL;
 			goto out;
 		}
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
