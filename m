Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87498C10F00
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 05:36:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236E521850
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 05:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XU7SgL2K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dduaxbTr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236E521850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xnYvMYnJft1U4J5rhHNLODA/dkQ7RnY2DN6xFLK3094=; b=XU7SgL2K1CWhH5
	9o3HnsqVO99vwUJokhQC2NLRJAXMtjs4rdplN8sO84+WsCiOlc/zIvz3uC+3K33wFhq+PletyYsGI
	KtkmhG68fbTJUIAJbyg+Z6rxtFje6Sr2nqA3a5YL8hawDbgc2IPCe+ztGuB1J61EFpQB9EeXIyTIE
	57m/glyoaULnVI8LAwemUWDBVUOdc0hXIG00DEUyX2uqSwYQSJEHcBuPfpXa/UaWbSYwv8as84XnB
	JA8yYrQQWviyiMj/lhboD24tekLA4OlXDJyN8XkaOKNgIJYATtQDANz2REuK3APca7k4cCb8tYRpo
	uJqfrUph4YWV+vurMMZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzEMr-0005e2-U8; Thu, 28 Feb 2019 05:36:25 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzEMn-0005dB-Cx
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 05:36:22 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x1S5XvdT056496;
 Thu, 28 Feb 2019 05:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=/fDC22xAYWtn0nGLk6+c/CCroSr5JQ1vrczT+c/nFu4=;
 b=dduaxbTrrJolz1knEZgZR7Cz8leqTJoreXTZxSXL+VZbyBaIglm7+ifYqijWMBI6soPt
 K0skPYsYsggQC/r0LQQAxFW0QJawQldrzKYJ1mDh5uHEY3c0NecKxm1WRzxV2pTfByKn
 PHGOSomzBzxNoB50wwFXHGiqNnhk6l1Tsb7OAy154h1LXjl0gla8+4QVrwzp5iWsVVpE
 st/fcoedvxLOiUxxpNPw+4GJgdHkynL6q1PUo5X/gDkylteGIdqwpaWzUCTilO5CjmNg
 4GoEQPACz40ZxMwdWMLPR61bCLS057xHGRHUv59sJrU/C5DYNPCBu6vrfNtyCObmWOUu tg== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
 by userp2130.oracle.com with ESMTP id 2qtwkuevey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Feb 2019 05:36:01 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id x1S5a013013802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Feb 2019 05:36:00 GMT
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x1S5ZxCe001181;
 Thu, 28 Feb 2019 05:35:59 GMT
Received: from kadam (/197.157.0.25) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 27 Feb 2019 21:35:59 -0800
Date: Thu, 28 Feb 2019 08:35:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: wl: Silence uninitialized variable warning
Message-ID: <20190228053551.GB3253@kadam>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9180
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902280038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_213621_526600_45A9060D 
X-CRM114-Status: GOOD (  16.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This condition needs to be fipped around because "err" is uninitialized
when "force" is set.  The Smatch static analysis tool complains and
UBsan will also complain at runtime.

Fixes: 663586c0a892 ("ubi: Expose the bitrot interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 40f838d54b0f..2709dc02fc24 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1517,7 +1517,7 @@ int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force)
 		mutex_unlock(&ubi->buf_mutex);
 	}
 
-	if (err == UBI_IO_BITFLIPS || force) {
+	if (force || err == UBI_IO_BITFLIPS) {
 		/*
 		 * Okay, bit flip happened, let's figure out what we can do.
 		 */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
