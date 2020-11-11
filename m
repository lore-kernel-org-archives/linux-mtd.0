Return-Path: <SRS0=6UFQ=ER=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829CAC388F9
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:53:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C861206FB
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:53:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HMGkCcJr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="exGX3C0q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C861206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UAcd8pTki/JgwSmDIzcgSCUyQTdP/Q4/Ze9cskler8g=; b=HMGkCcJrmFxEfa5FyGUt1+Gmy
	yvRhmU3oVySyF1VTWeh+REDX4YJFZ5z5MQE96BCX/zbDqw1Z76+okUwdlQRAKZCbArGpZzlNmgdlB
	7Slw22vC0cZ4Ct2XBsdKTV1ur8R0Wqjb7HTEmdzzCzB/1o9ge4mwWVTYqYScgIsEuFUbgmeR/AZHr
	F9eAF9TeZzXkReyJCeKtNj4zHQ/bAmCC3d6nyJadM3SR53cUeQoT5z7/uPhv7U4Wr5dmP1FTiRh3y
	FJXQFweng9H5tPwB7Fav4fHIF+5TEUkshe8SiUfIq69q7fUlEaaKuC5/DWPzV2i3e/M0DVU3DJtwO
	+UEj7MJUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kctN8-0001OO-E2; Wed, 11 Nov 2020 16:53:26 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kctN5-0001NH-4n
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2020 16:53:24 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ABGjcP7055598;
 Wed, 11 Nov 2020 16:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=rtr9ZwfifFQUB6Xm7rE6zrQB75duW4A6ZUujJWOIcy0=;
 b=exGX3C0qT4hc/xlWa/AIm9ktJgo3Z//a0o4mVgKdeKGmGA/eaFYoQbi800neiStHpB4e
 tFsrnOWmxAuossvNG8Pw+BxUWop8xMBSCqnr7z/BRW8uJVoZbgurNkL3ZGrwGHzwfuA4
 Gs7RSMJIhJKB1v4bnboh+uSU+6W4DiMcXMh1h5xVZ0dpa9hpH3Rl5ykPpFR0of3rZSoX
 +jIlTtURtYo1Dq5KH+0vEOfFvvvdWfCnug14v78NOiYUPi1u0vBpnSjlcACdYBGweMr2
 1yEDh9l2TA2MZkJqrSGrANe41/rwZrW/lu4+bGwkBt467AYodHuM5qVxksGh9ZXr0qZt /A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34p72er0e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 16:53:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ABGitBl102834;
 Wed, 11 Nov 2020 16:53:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 34p5g1x6bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 16:53:11 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ABGr6tR015124;
 Wed, 11 Nov 2020 16:53:07 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Nov 2020 08:53:05 -0800
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH, RFC 11/10] block: propagate BLKROSET to all partitions
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1o8k3dei6.fsf@ca-mkp.ca.oracle.com>
References: <20201106140817.GA23557@lst.de>
 <yq1imacecwz.fsf@ca-mkp.ca.oracle.com> <20201111080334.GA23062@lst.de>
Date: Wed, 11 Nov 2020 11:53:02 -0500
In-Reply-To: <20201111080334.GA23062@lst.de> (Christoph Hellwig's message of
 "Wed, 11 Nov 2020 09:03:34 +0100")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9802
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9802
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=1 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_115323_337241_301722FA 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Christoph,

> I actually think your patch that goes further is the right thing to
> do, and I was going to look into something similar for a problem with
> hardware read-only namespaces in NVMe.  I think I'll take your patch
> as a starting point and will work from there.

Sounds good!

I still have the blktests in a branch. Will adjust and resubmit once you
post your rework.

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
