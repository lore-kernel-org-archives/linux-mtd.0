Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF8CC4346E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:56:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1377D238E3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 15:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8pAp7sV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T23KGyNF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1377D238E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6/6aTkJnq7m415K+hGJkAelBLh995Sj4WHKn69DxGdk=; b=f8pAp7sVFuzG7yLOUhuXW2S48
	BCk4MhIHMdMXPL7TESj1es8dLi83Bre1LLzjtfs+kwj/P5HT7DhenIXb0Y3wNBvOUzs6yXitklWoF
	j72tN24Nh8HnLG9cjxIcn19eqBxlOUemMZtxAuham+D5DrF/AiyoSunlPRf5uulz+6gp5VsGLQz+I
	KxnnYapEXzomhMDHIIrFMl3Xwq5WinG8ImKhhW/a4jVChSeJTMWauBbzAVkBaozERXmAdtgKkJilq
	vqYep+1R3GvGWt2foAUYXlxJHbCem9wABQOip0XXXx4fl3DD/7MRVncj0YKVDJfyw+776H8DBtpVe
	6stw1MI4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTaw-0000M5-GZ; Thu, 24 Sep 2020 15:55:42 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTau-0000LF-9g
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 15:55:41 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFZLm9125803;
 Thu, 24 Sep 2020 15:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=UMrMiRKAEPKCu9R5h0OHmuj7H7bYXllgz/FgByZzp54=;
 b=T23KGyNF55FmeyEYsQIu8ZzQNzqjPTGYsLmWI3bkv0r1GL5atH3ncE7JDgQd4HihRJzp
 QcXkEtynE/j4e7hdpiRmuuN9Wfa4O5VtR4laQ3ogMVmsknED5KP7+keU7mxoZufVXf1p
 vupa7e47pocKxfg5d/WdxS4i4zOD96hQpjigPNoOtDtZoVSc1E2jaQgTWxLPyvyuljab
 8viY6PkrX30EnaiWLFiWM6plVeDJdSxcphzm3dSP+sICJGE6YZNKiRoGninjfOdUhCHl
 ZiUOJy3a3UUEoX+OaO4U+4UF5Mrbzz4A351PGKMWyUj25dUz/2aKHnUle95g3uMZhOJv eQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 33q5rgqg78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 15:55:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFUWlN083381;
 Thu, 24 Sep 2020 15:53:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 33nujr3667-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 15:53:34 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08OFrXhj015689;
 Thu, 24 Sep 2020 15:53:33 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 08:53:33 -0700
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/13] md: update the optimal I/O size on reshape
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq14knnmary.fsf@ca-mkp.ca.oracle.com>
References: <20200924065140.726436-1-hch@lst.de>
 <20200924065140.726436-7-hch@lst.de>
Date: Thu, 24 Sep 2020 11:53:29 -0400
In-Reply-To: <20200924065140.726436-7-hch@lst.de> (Christoph Hellwig's message
 of "Thu, 24 Sep 2020 08:51:33 +0200")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=1
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 clxscore=1015 suspectscore=1 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_115540_424620_927F5F4A 
X-CRM114-Status: GOOD (  16.68  )
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
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 cgroups@vger.kernel.org, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, drbd-dev@tron.linbit.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Christoph,

> The raid5 and raid10 drivers currently update the read-ahead size, but
> not the optimal I/O size on reshape.  To prepare for deriving the
> read-ahead size from the optimal I/O size make sure it is updated as
> well.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
