Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C67C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 13:24:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118502080D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 13:24:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IDGGj8gp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="erLYBBdi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118502080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XsDw9Ixuqnok8cmMEJVCTCDuFoO3hgwNBdEVtIVO6c=; b=IDGGj8gpQhB8iF
	F9r7LtDVMeAsztsSPYz8efIwo8fbBIqOZkgaU2YiUq0Hv51htIdwgoSIMfBvYD13lhNireCf6ApFG
	CPnM6ca9QwP+ZqXfsVaqi1IcmaYDogiRyvqnI8ZYT0X/WW1ujKpbnl/LlGfZhqrrPrkppCpF3xp2I
	ojxljfdT4YeiuYrv2lGsztv1y/PfVAkRRFEMo4iNQHcoFcCwqSJ5hAStEJ56qsHp/Np6T8v2BVK56
	RqEkvC+Ud/g8jKdFP2flMw7dGvVjBHfyFyY+sNAz+oHWuX5OLA3ADgNnlAQNc7MR3bR+ydk35QFpx
	qmdBQwvt2oFjnpcgMRig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqzhk-0004Wl-El; Mon, 13 Jan 2020 13:24:28 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqzhh-0004WE-O9
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 13:24:27 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DDMeRq116202;
 Mon, 13 Jan 2020 13:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Ga946dKjkWL6cw2gC4q2vcikz/DRqUl8k49hkbQNN44=;
 b=erLYBBdiZE73upde6C3zUurIz10Re6RCdcFehNJt5jWIAw483zwcjJWdhlkxZH2OFd89
 Lgb8W+YkosBsiDLtSmKCbtDZjUwMjxqU6kCM5tlJ+hpcUmnXkB20Dz/1unzU3mlRaEbT
 Bj1k4uvo3Qj1HzB+zkK5Bqmh0zrXxXSenehl1G44As3VTICecYWxwfe1ZYIZZ3kvcJyj
 Rz/YugKSoeMH3Kx9SYn+6BP1HSapP/i4nGkepPndqIJuJ2edKjaCKRYqTOtqLqkfFZKF
 FZ3WE81olddiQLsVr9sogOnOUM+gpUTcMF3lf0odJoxCM7RZKXawICWOecSULmnwsLCx uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2xf74rxw6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 13:24:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DDOBx0084936;
 Mon, 13 Jan 2020 13:24:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2xfrh62vs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 13:24:15 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00DDNsNN007011;
 Mon, 13 Jan 2020 13:23:55 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Jan 2020 05:23:54 -0800
Date: Mon, 13 Jan 2020 16:23:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: Fix an error pointer dereference in error handling code
Message-ID: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9498
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001130112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9498
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001130112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_052425_873418_3A321474 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
and we try to kfree() it which results in an Oops.

This patch re-arranges the error handling so now it only frees things
which have been allocated successfully.

Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)
---
 drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1c7be4eb3ba6..6b544665318a 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1137,7 +1137,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	struct rb_node *tmp_rb;
 	int ret, i, j, free_peb_count, used_peb_count, vol_count;
 	int scrub_peb_count, erase_peb_count;
-	unsigned long *seen_pebs = NULL;
+	unsigned long *seen_pebs;
 
 	fm_raw = ubi->fm_buf;
 	memset(ubi->fm_buf, 0, ubi->fm_size);
@@ -1151,7 +1151,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	dvbuf = new_fm_vbuf(ubi, UBI_FM_DATA_VOLUME_ID);
 	if (!dvbuf) {
 		ret = -ENOMEM;
-		goto out_kfree;
+		goto out_free_avbuf;
 	}
 
 	avhdr = ubi_get_vid_hdr(avbuf);
@@ -1160,7 +1160,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	seen_pebs = init_seen(ubi);
 	if (IS_ERR(seen_pebs)) {
 		ret = PTR_ERR(seen_pebs);
-		goto out_kfree;
+		goto out_free_dvbuf;
 	}
 
 	spin_lock(&ubi->volumes_lock);
@@ -1328,7 +1328,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avbuf);
 	if (ret) {
 		ubi_err(ubi, "unable to write vid_hdr to fastmap SB!");
-		goto out_kfree;
+		goto out_free_seen;
 	}
 
 	for (i = 0; i < new_fm->used_blocks; i++) {
@@ -1350,7 +1350,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		if (ret) {
 			ubi_err(ubi, "unable to write vid_hdr to PEB %i!",
 				new_fm->e[i]->pnum);
-			goto out_kfree;
+			goto out_free_seen;
 		}
 	}
 
@@ -1360,7 +1360,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		if (ret) {
 			ubi_err(ubi, "unable to write fastmap to PEB %i!",
 				new_fm->e[i]->pnum);
-			goto out_kfree;
+			goto out_free_seen;
 		}
 	}
 
@@ -1370,10 +1370,13 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	ret = self_check_seen(ubi, seen_pebs);
 	dbg_bld("fastmap written!");
 
-out_kfree:
-	ubi_free_vid_buf(avbuf);
-	ubi_free_vid_buf(dvbuf);
+out_free_seen:
 	free_seen(seen_pebs);
+out_free_dvbuf:
+	ubi_free_vid_buf(dvbuf);
+out_free_avbuf:
+	ubi_free_vid_buf(avbuf);
+
 out:
 	return ret;
 }
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
