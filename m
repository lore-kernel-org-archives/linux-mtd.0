Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF94C47082
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6460261242
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 12:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6460261242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3SjqcQ9Cl+fvdKz/VZcd2p3hkzVbSL/JwQCvnHYdlHg=; b=C7XbtcvpnmStYa
	19Ph5lpdj/XgoALAUpGu+HbFeylEuhYWO9BdEkcAbrx9rRdIdKUiwP/ukyPhW+CwieSY7/t0nch/0
	UnVFrN8I+FKLwgRJtTst5EhLSUyn6/ab3xbwXgP3q6QTAfrtMYi4CKhB2BXqnuMKzZH6+RxwMiCH0
	X5RvhUPx2EsHzbZ8FYUMk8YUQjo/Ha0kIb1Bx+zZcejY/Sr8v/kbr8hTIszWAVhlysq/xPqTwveE/
	gSmnohmj8ymchlVnpT9wFdO/kaAMEd/IDjAy/mo7c//dF2s206FLP0kZX2LivD7JCHSOQcx5L9I4b
	ci9jVg9JoKXsomXyGYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomYy-008exQ-Ed; Thu, 03 Jun 2021 12:35:04 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomYs-008ets-Qw
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 12:35:01 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153CUv3S088402;
 Thu, 3 Jun 2021 12:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=umhuKUbm8gjwABm6opsKffTVYqL1p4//Cl+iUJGjF40=;
 b=oDRjLsIwUsnhPRd89rA8XCd6AFnRJ1HdwWCBtljjvA6/svAgCjaEmwKOkk1MWK/Vvwu6
 ri2EjvIZWVsboOtt+6Xu/mk/CXbj1wKsKcDKzGH/aXLqxY9lERGB/zBNlvAV2HabZpIC
 oWRoRKsWKgzsbfy1uYGos22n2AEXwlioGbQwgKWv+EjMIrvJDYN1ud9r3f/PGSALRyUE
 S6PJ50PYml3exfTslXESedPtWhcTf2qo42ZdNpG6LUaqAr9d6VQ4wvyj5SBOwx+lOLy4
 IapCzZJZL+ER+zOGasHxvG1F81piMtZVOcoR+hCkRo+ZRqx3h/Dud68vCpkyxEIcwdTx 2A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 38ub4cu953-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Jun 2021 12:34:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153CVpxK114924;
 Thu, 3 Jun 2021 12:34:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38udeevu57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Jun 2021 12:34:53 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 153CY0XV128340;
 Thu, 3 Jun 2021 12:34:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 38udeevu3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Jun 2021 12:34:52 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 153CYorj003418;
 Thu, 3 Jun 2021 12:34:51 GMT
Received: from mwanda (/10.175.206.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Jun 2021 12:34:49 +0000
Date: Thu, 3 Jun 2021 15:34:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Adrian Hunter <ext-adrian.hunter@nokia.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ubifs: fix an IS_ERR() vs NULL check
Message-ID: <YLjMYy9E6U2/flhP@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: oiKughyiwmpH2gMde8IxRVk0DRcxAxMM
X-Proofpoint-ORIG-GUID: oiKughyiwmpH2gMde8IxRVk0DRcxAxMM
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10003
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106030085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_053459_007790_CBB0D3FA 
X-CRM114-Status: GOOD (  15.07  )
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

The ubifs_fast_find_frdi_idx() function returns NULL on error, it
doesn't return error pointers.  Update the check accordingly.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ubifs/gc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index dc3e26e9ed7b..7cc22d7317ea 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -895,8 +895,8 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 	/* Record index freeable LEBs for unmapping after commit */
 	while (1) {
 		lp = ubifs_fast_find_frdi_idx(c);
-		if (IS_ERR(lp)) {
-			err = PTR_ERR(lp);
+		if (!lp) {
+			err = -ENOMEM;
 			goto out;
 		}
 		if (!lp)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
