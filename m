Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89D1C4346E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6A123600
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5nshdww";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jGpN8isN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6A123600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RQfAb6hx5gQ3heQ+IDlO0pQqTAMQlIYGsHgo7il7iuA=; b=E5nshdww/f+ieI7Lbyseqhgl8
	FpV3D0mnWbtY1OyeAPJ5KJHit735u2hP3RdqtoK4pNynZTeoJiy951I92ohCU0Fgn9ZSxttarqKJ0
	N9q+7IWKJGTpvHGDw0xwoW/mnm39u1UWDUgKLUS8OmEV1op8i5Eullh2gdrFgh1UGO5TpXeKr3Mnw
	gWCWfGdV7iuJ/sknBW0Xa7kOIFb2DfPnQNX+xMk1GuOH+zcSoxIZTDcJAOXmX+1I2++dUuVSDjmEx
	yDEXcuAJOBgvw/hNsv6u8ibEqoBMSiwQOzNXnPZFwdDHtYIM55rwX0pguIQe092xI0ZzGbFkxoT3u
	1OfLONkOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTVd-0007kk-FH; Thu, 24 Sep 2020 15:50:13 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTVb-0007jh-Gj
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 15:50:12 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFZLxn125776;
 Thu, 24 Sep 2020 15:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=vn1696U5CRhKmLmc6mdwCozBnLCLObO7LgftVl1wh2o=;
 b=jGpN8isNZtCM5z7nsb1wBtRcRov8B0bLS4Y8Jgq8H3hJMgkHBgpw+B0j+n0iQtU6oW4a
 QX84oMRfxrda29DxxN+D1WO6Juo95LBcan1pWECxN045bzOeYSFit8QXthhoJDaQRbnU
 seFTga76zsuEvub1vBYax7ppb/U+L6mAumw2Mhgx2mEcIYPYMg5hWrJvCiudE1KCKong
 6dgAASGoNxvU+gi3A53HQylRFymVIzYtV5b4NqtIoeyAAlCFpl+JO5CMpcTFKUHNrPPx
 wq25IEd46NnTfcYJ10+Cju65COp21F54g/3/Y9TEogN0+CpBlb7kUPWjmg4Oti/cRVCh Lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 33q5rgqf43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 15:50:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFUZHt054350;
 Thu, 24 Sep 2020 15:49:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 33nurwbrpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 15:49:59 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08OFnq1D012263;
 Thu, 24 Sep 2020 15:49:53 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 08:49:51 -0700
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/13] bcache: inherit the optimal I/O size
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1ft77maz5.fsf@ca-mkp.ca.oracle.com>
References: <20200924065140.726436-1-hch@lst.de>
 <20200924065140.726436-4-hch@lst.de>
Date: Thu, 24 Sep 2020 11:49:48 -0400
In-Reply-To: <20200924065140.726436-4-hch@lst.de> (Christoph Hellwig's message
 of "Thu, 24 Sep 2020 08:51:30 +0200")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=1 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_115011_648760_2A4E6D6C 
X-CRM114-Status: GOOD (  16.30  )
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

> Inherit the optimal I/O size setting just like the readahead window,
> as any reason to do larger I/O does not apply to just readahead.

Looks fine.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
