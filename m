Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1BCC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 10:46:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D02E613CB
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 10:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D02E613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dp6Ri3hMc7VjNvQR+HTS+9sXd998LxpsWl0TvLia9Pc=; b=LHn4GUoElpEKd3zKP7Zv+JG0oj
	zJnR0BO2seLjkylVxV4QNV6uEryl2zs4qoJPaDfBAd0Mw2P7SMCeoCwT9el5rt3CJzI8z9ElUOq+m
	3fOVYoUB7mCml0k9UX2knx5ruq3mbHrICwCp5ecbciMVyuzH718gGB4NHIZ/OQjt7UifLYq/Oa/QA
	a9KpQVEf+T3xj+wnGmf7HiUqmuajDJsDl7YsIUCSN16K+eeZzLO/Kyt5W69oI6YODcyexl6EcyFRb
	s4bsuATA5q+qLOR+C5MGtENEvqBgpAKP7y/mYzBHc1MN7ATh5V7B3Z4092KvB82298MBDduVq+1Xe
	MADl62Bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPtw-00H0IW-0F; Tue, 11 May 2021 10:46:08 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMZK-00GTxf-2w
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=bOp/npdKBNjrpeNmwbAIxmkWgoyso0P/KtdS+cREOds=; b=IeBCbM57/+zy2rY5lsJXnuFwaz
 hfKjqKc9crw6nM2Ovp9nSx7leDrRwmjXMIxCQm4u8Sg9J2zzX5Sgii+4gcvuoLImYRgyiKpxZIhfx
 Jtr3nZIv4unXCL0Ds+jEuTklM/W0UAXuRhm9eSVFyJ+XMCfNLZKjLOvKz4CXaS5Afkzo9Kp/6bWNQ
 fvSJ+i6pFOKz36XqwGntrQrh0iaMa29MdUHH5keKStPmLqNbfrOx0wcCaXUGAFHsM0xufdZL33QAi
 5kIVynbSW3SD3bfSrQEKinYLxHYo4aQ8WJAqgsby57BhsWy3iKYz1jWXbDYmj65uYb6d75QYEoZrK
 kYC4DlSA==;
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMZ8-009M2M-V5
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 07:12:28 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B7CFOq074110;
 Tue, 11 May 2021 07:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=bOp/npdKBNjrpeNmwbAIxmkWgoyso0P/KtdS+cREOds=;
 b=NR72fIGab4jbE8+60ycDseDoxrEQLY91fjbrKHZGxfi8TGPo4i2RK1W+hGU03PX9Ckir
 S5WAMulPHNcmxWfk/chwLu+1GevlyoLYfS2QMUQ3fl34wjrEn07JpN8y4SonxV/J7IRc
 wqjWZ70fJimeS9ATznQiO021EHnUvgoGQ1+rTzc4/amQKAMfkrFuLZtRh62UCt18PNE0
 Lcz2PIXNQ2XDe1DvaFka3Z6Yka6LqRDzJaq74KNS2teZyYGa6GTiEK3hGuSwORexrxzp
 xMe8jzSxWJMTk4SStQ9bweaUK0dS1lzrnzLamdDRa/mbHu/P05q8i9dcpEQO8lAzx0tU 7Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 38dg5bdrfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 07:12:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B79nvX051622;
 Tue, 11 May 2021 07:12:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38e5pwqmp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 07:12:15 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14B7CE11060528;
 Tue, 11 May 2021 07:12:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 38e5pwqmnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 07:12:14 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14B7C7Cj021104;
 Tue, 11 May 2021 07:12:12 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 May 2021 00:12:07 -0700
Date: Tue, 11 May 2021 10:12:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] ubifs: fix snprintf() checking
Message-ID: <YJouQKMQZe1I2kkg@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: 3wvVLYegYHyQAbTUgjskSeriImquWwta
X-Proofpoint-ORIG-GUID: 3wvVLYegYHyQAbTUgjskSeriImquWwta
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_001227_140371_611C4953 
X-CRM114-Status: GOOD (  16.41  )
/bin/ln: failed to access
 'reaver_cache/texts/20210511_001227_140371_611C4953': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_001227_140371_611C4953 
X-CRM114-Status: GOOD (  13.63  )
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

The snprintf() function returns the number of characters (not
counting the NUL terminator) that it would have printed if we
had space.

This buffer has UBIFS_DFS_DIR_LEN characters plus one extra for
the terminator.  Printing UBIFS_DFS_DIR_LEN is okay but anything
higher will result in truncation.  Thus the comparison needs to be
change from == to >.

These strings are compile time constants so this patch doesn't
affect runtime.

Fixes: ae380ce04731 ("UBIFS: lessen the size of debugging info data structure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/ubi/debug.c | 2 +-
 fs/ubifs/debug.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index ac2bdba8bb1a..3c0c8eca4d51 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -511,7 +511,7 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 
 	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
 		     ubi->ubi_num);
-	if (n == UBI_DFS_DIR_LEN) {
+	if (n > UBI_DFS_DIR_LEN) {
 		/* The array size is too small */
 		return -EINVAL;
 	}
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 1bbb9fe661b1..fc718f6178f2 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2824,7 +2824,7 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
 
 	n = snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
 		     c->vi.ubi_num, c->vi.vol_id);
-	if (n == UBIFS_DFS_DIR_LEN) {
+	if (n > UBIFS_DFS_DIR_LEN) {
 		/* The array size is too small */
 		return;
 	}
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
