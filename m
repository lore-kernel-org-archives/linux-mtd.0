Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CB2C4346E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:52:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D9823600
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WutEGha9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iehH+Ovn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D9823600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g4m0ICGZZD/wSQjIxA6FpNNgNYyIbGjTKkpAyv3Fd5s=; b=WutEGha9vIFpxzoCd/ptIQB7C
	agJHELHReKWVcyzFxzTjUdiU5W6QBO9gXHob6u6s1KPxnx1Ajqgi5JJtZ8ACk7qCrdjJ13rjdR8bq
	LXmfjs5ET8/uHoh9/ke9+zAAdZAyosy7adSasTceI+Yp5rC0E/odNlsRnti5ZI1KdotDAvLJjib52
	3BNZqVJEubNkaefh87Jj2kqg6yzNhHZV35nxUJZQ55JlIYHP07HzXO9D9CuxsN0Ccvz2PAS2GtcO9
	2OIhrSDnI8sScujfGVnfAE1RUPg0v9H84cGhYfw+ghybkfgf87amgcGGwUX8RB5rtAkDymzGT7tVt
	y4i/natgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTXD-0007xC-Ed; Thu, 24 Sep 2020 15:51:51 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTXA-0007wF-MB
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 15:51:49 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFZ1hm158198;
 Thu, 24 Sep 2020 15:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=vPj5HUHK1sveLhinkO2rrNMbTgOHpcSG/Qgh39xMlGk=;
 b=iehH+OvnhOP4xunxBiWDwJl2tVgSMeneguI6LEzqTnboYBhn8AWWBseqRFc2zq4/m/54
 UM+ayvNJBXUE5JNyPGLXukWuHVDQ3qORJtdLN6KbwjrxzyKY/4SZ38VTgsp7dAIkY5C6
 /LZP39sv5Pjdf0lTAVJshlT4T1LAnFsUBQZJQjzjVHRjToI6kufzXjzanL70Oz/adSHN
 cDwdxQRR9mh0SKHTJJYf9LtsYKFLHJfwIanK0JUt72ao9w6ZBvcldPmXJdRp2HyjX1/J
 ZEp31Gk93HSQgvp17OAVeX358nlEJN4npJyl3CkR8O3iIQj08lUWyf0+zMdcBbAQV4bx Lw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 33ndnus5vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 15:51:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFVSmU126417;
 Thu, 24 Sep 2020 15:51:31 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 33nux2yuk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 15:51:31 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OFpSHu001507;
 Thu, 24 Sep 2020 15:51:29 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 08:51:28 -0700
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] aoe: set an optimal I/O size
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1a6xfmawt.fsf@ca-mkp.ca.oracle.com>
References: <20200924065140.726436-1-hch@lst.de>
 <20200924065140.726436-5-hch@lst.de>
Date: Thu, 24 Sep 2020 11:51:24 -0400
In-Reply-To: <20200924065140.726436-5-hch@lst.de> (Christoph Hellwig's message
 of "Thu, 24 Sep 2020 08:51:31 +0200")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=1 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=1 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_115148_906641_B28E4CAB 
X-CRM114-Status: GOOD (  17.87  )
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
 Hans de Goede <hdegoede@redhat.com>, Justin Sanders <justin@coraid.com>,
 Jan Kara <jack@suse.cz>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, cgroups@vger.kernel.org,
 linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Christoph,

> aoe forces a larger readahead size, but any reason to do larger I/O is
> not limited to readahead.  Also set the optimal I/O size, and remove
> the local constants in favor of just using SZ_2G.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
