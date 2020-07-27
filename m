Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779A9C433EA
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 11:22:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473782072E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 11:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pHSJ2248";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mtn12Nnx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 473782072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNCP68uegUacxnVQYVaR2s+Pm3kbwewk6DIfoUEMHl8=; b=pHSJ2248NePyn44icZ3W5lGeNE
	+Jf2PN6sriYx/c5g+PZPTGb2JilAbAxMtRUbRkklj1hr8kfp91PUboZTHY207jQafqp1qdwbeznLF
	YcKrOR2AiMoNI/h1BHYeH5v179cv+eQ1Ln379nksiPyFRNgtoEs1kyBBehW9SRRSMcRxn4Eb7igEQ
	jK7uhtdxzVgkO0fB638CWC7a2DpDYmnXD/KxW///Rr+/7tiouCpbu7F4a6fHHfaQZbGJcpsNuhNoY
	B280ULjF3y9QsZTO1Io1J/WFtslr8CDLif962s5OowBRJSLfbk1neX0EBieVwAlP3pHjmEZSYG5pg
	/5hjClHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k01CZ-0003Wo-NQ; Mon, 27 Jul 2020 11:21:51 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k01CT-0003QQ-UZ
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 11:21:47 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBBZop119221;
 Mon, 27 Jul 2020 11:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=WGgH7UpcrSY/7xtWZj/71YfYOZSBAYCYHgfaCGGpDsY=;
 b=mtn12Nnxs1Bsh7S6ZbCToJcYlqlA59jadM2ZyONZ6+UaCh1kxP5mBWK2r2jj1+U1BiOD
 OHPCoXI2Dq8V74IN3rARUOrZ4gDU4TwYshps6mbM1ZKojZDYqSf/TeGnxGyaCSId8QLv
 cID07ap3L97OOyoprSsJuc8Mz91M/+CfF2/jhx6NCdyOP5YA+B7WLV7JGbOJ/pZ3cAid
 LIOvnDDoAAbkMMgosza2WvV8w9JTz1t4O0BMLi4QZxpQvTO6WvyLegIx3VicUeSAPhcw
 0STeEwRdOWBVdBZvcHki0XCijFW7l7f+gw8L+loOy0wm/nCZP3i+SxCbaP53abID87kC Xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 32hu1j8xjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Jul 2020 11:21:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RBEOrG109108;
 Mon, 27 Jul 2020 11:21:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 32hu5qdpv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 11:21:02 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06RBKxIh021411;
 Mon, 27 Jul 2020 11:21:00 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jul 2020 04:20:58 -0700
Date: Mon, 27 Jul 2020 14:20:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] mtd: unlock on error in ioctl
Message-ID: <20200727112050.GF389488@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_072146_237590_8CFBBE8A 
X-CRM114-Status: GOOD (  22.68  )
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
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We need to unlock before returning on this error path.

Fixes: 210bec567936 ("mtd: properly check all write ioctls for permissions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/mtdchar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 52c120f9fb0d..05f9218592df 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1064,8 +1064,10 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 		struct mtd_oob_buf32 buf;
 		struct mtd_oob_buf32 __user *buf_user = argp;
 
-		if (!(file->f_mode & FMODE_WRITE))
-			return -EPERM;
+		if (!(file->f_mode & FMODE_WRITE)) {
+			ret = -EPERM;
+			goto unlock;
+		}
 
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
@@ -1117,6 +1119,7 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 		ret = mtdchar_ioctl(file, cmd, (unsigned long)argp);
 	}
 
+unlock:
 	mutex_unlock(&mtd_mutex);
 
 	return ret;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
