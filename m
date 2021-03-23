Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C284C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 13:20:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01624619BA
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 13:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01624619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yNZSmNHPi+ecpL3vgJ+b4XFalaPR9iMZ7OWqMHUMOck=; b=Vot2czVTTNHMZSejfHzbwqM9ue
	i4XJ2ZmpP27BzHbECwLUQ46KS31q2AvtQiWFzuek54xaygW93ck1gKe1NqVZgAKsKc3f9jlSl1AEv
	MuP+fKIyMF0QyBWtW+2HjxWZU2Mi+Eg4nZcHR9YA8xCKPU/rFwB5KdbdJWczsl7l5jn0h7hJByD3Y
	sKGosEzhVMQXGGGXMWL/u/AO4J5sG1E/7ytzyIczYpYFhfa85wN1ZrLkhBXvHyTPG4Z41OFJBJ1H3
	svmx4ykldUXTIVJmEAEfLxx9/sLxrRwXWOpiM55PRJeUvqWCtRCjniGgfmpz3O5NitO+KE8l3+unT
	4IoIWc7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOgwa-00F1zp-Il; Tue, 23 Mar 2021 13:19:36 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOgwW-00F1yM-3T
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 13:19:34 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NDJLl5091112;
 Tue, 23 Mar 2021 13:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=6dgzOb3CiJkSySCZ1RJQwzXP6iqC3Xa1CHOUgaq1Sfs=;
 b=x68fuZoDGFxy7KTLaXZjjHqKFkvcP1MNi0ZPVJjcOC5p7//5jP9YIrfKsTV1FNeeTpvl
 j8ORf976vy30ygvzg577RRJYqyrbuJ17zaAmzivWm8Yjq/ji4dzWaTSNtB+rRs3Ug6ba
 RwiPNumWcu7sefP9BmFVcX6gGIK97+pRYIBNO8mF6nsUmHxNvEZFYTsVWQquXzXQAjMY
 RqV/LNbjD9tiPjgwe+DcPE96z/RJsX9MN08CCyJR0NcL5KwyYL/xxwjCVIxxzRGA1CCA
 iWZoZ7IB78mvlIAqVBkCsmE1ojauSW+3L26rc0BItl8E4mVWKHWQrLJWV+RjjAkmBTPd mQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 37d90mex1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 13:19:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NDEjGt133981;
 Tue, 23 Mar 2021 13:19:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 37dtyxe4ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 13:19:16 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12NDJEKh026480;
 Tue, 23 Mar 2021 13:19:15 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 23 Mar 2021 13:19:14 +0000
Date: Tue, 23 Mar 2021 16:19:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-usb@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] thunderbolt: unlock on error path in tb_domain_add()
Message-ID: <YFnqyqDzSHenVN9O@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230097
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_131932_472329_BE9BE8AC 
X-CRM114-Status: GOOD (  13.10  )
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

We accidentally deleted this unlock on the error path.  Undelete it.

Fixes: 7f0a34d7900b ("thunderbolt: Decrease control channel timeout for software connection manager")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thunderbolt/domain.c | 1 +
 1 files changed, 1 insertions(+), 0 deletion(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a7d83eec3d15..98f4056f89ff 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -493,6 +493,7 @@ int tb_domain_add(struct tb *tb)
 	device_del(&tb->dev);
 err_ctl_stop:
 	tb_ctl_stop(tb->ctl);
+	mutex_unlock(&tb->lock);
 
 	return ret;
 }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
