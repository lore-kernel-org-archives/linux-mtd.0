Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51677C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:10:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 238942173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpic9Cj3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bNn11cF2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 238942173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yqtG4leYuxx1pXBJcXnEfGZTX6YEfARbSq71Zc3d50E=; b=mpic9Cj34QorXf
	pSjBGEYSGWd/0IkO0Pbkj3JbyLNu1xu2JN6mNC14PWKgcxS7uxV2CHzeNAKzkG+0XFMLcuRGDxmk6
	qaCFpqCNtU5wj0TY/DoPAwh6UX2maenx7J/a3vrZLT6AXfyVXaV4JMvNi6noDQ1DMP0G6PIJSy9Ln
	/PmJDJmEQoAnhZ5XmNkNm+AAdVxY+trHPuSz+GvxQrpwk0OQ6n+NOg25I/VfWE9IkNNK6ThTwRabW
	vhGlya1zP9Yt0BMHN1v9w5ENlFoDOsyLiUp3y406kzcsPtpXKxmkWkmibS49wkBvxSVp2kFqDNP6P
	kPLr7L0sI5hlQOQ411cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSyuP-0006KR-R5; Tue, 21 May 2019 07:10:01 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSyuL-00068s-HT
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 07:09:59 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4L79DXT064415;
 Tue, 21 May 2019 07:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ReJFi2TkA02UVdfB7RyyRm/gnA/k2yQY2yZwTv/TkDk=;
 b=bNn11cF2T7HQzw6e9be7fBYtKzIyRbeaEfHypZhAPdsWEM7cG9/1lnq2W8o+0nEC4C/f
 Z9f0I7oFgkyI3Y9k53SKdfbPmCuqUyQXzfxpVZa76Og8nAjSRsJPrS5W2DT/6Jb2R8tg
 X/u2RFNjcFY42LfwDcVPlL5ZIGxWcuGxWZRMfh1u598t1qGAuFI+ijErV2iEkiPIL2R/
 E4w9+oscOWnYNlUsem+P+YknaxEisPeH+lvLra+1HA0mG+UuD2DAsEYNHc/ozj4F5IYl
 3rY4MafRZEGmrjR//0TvkTOLEhnXzou8/TSnwAtHtdo6TXjcDIkya+SqwP8oSgfdyr6r QA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2sj9ftb9xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 07:09:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4L79Z1e104182;
 Tue, 21 May 2019 07:09:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2sks1y1kqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 07:09:50 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4L79iPh012294;
 Tue, 21 May 2019 07:09:44 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 May 2019 07:09:43 +0000
Date: Tue, 21 May 2019 10:09:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: richard@nod.at
Subject: [bug report] ubifs: Don't leak orphans on memory during commit
Message-ID: <20190521070937.GA10654@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9263
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=569
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905210046
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9263
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=598 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905210047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_000957_769566_C56C8216 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard Weinberger,

The patch c16e73587ad6: "ubifs: Don't leak orphans on memory during
commit" from May 15, 2019, leads to the following static checker
warning:

	fs/ubifs/orphan.c:231 ubifs_delete_orphan()
	warn: 'orph' was already freed.

fs/ubifs/orphan.c
   214  void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
   215  {
   216          struct ubifs_orphan *orph, *child_orph, *tmp_o;
   217  
   218          spin_lock(&c->orphan_lock);
   219  
   220          orph = lookup_orphan(c, inum);
   221          if (!orph) {
   222                  spin_unlock(&c->orphan_lock);
   223                  ubifs_err(c, "missing orphan ino %lu", (unsigned long)inum);
   224                  dump_stack();
   225  
   226                  return;
   227          }
   228  
   229          orphan_delete(c, orph);
                                 ^^^^
The "orph" pointer is sometimes free in orphan_delete().

   230  
   231          list_for_each_entry_safe(child_orph, tmp_o, &orph->child_list, child_list) {
                                                             ^^^^
use after free?

   232                  list_del(&child_orph->child_list);
   233                  orphan_delete(c, child_orph);
   234          }
   235  
   236          spin_unlock(&c->orphan_lock);
   237  }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
