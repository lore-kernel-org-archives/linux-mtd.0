Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D3EC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 16:09:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F4F2078B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 16:09:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nzWTsHyW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fX78gnQD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F4F2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N/ICTjVsssXAq9UY6Wo+yZXNuuirm4uxk8MPkUnQqjw=; b=nzWTsHyWHhAWobK3zCzaBEuE2
	asi78Vf6Dnuli6ZgMgHRa471iARNEJNWzEP20bMGS4IY4gDRP7TID7pRbxBdFntpZbDfVwzFiheq5
	Ht+bR/kZKEE1f/4yr4RvA8MYB5FLjfbpolD5aayRjO4HiDqZrv8K8XrkoDcWV8acx9mJDzcbnDKS5
	DIzodEwPkRBUPQdQpRuVqKRCp+UrygBu2raZ6zzo90+mGPggSlYF3IKvd1DIG0y/TVue0cOckBGw2
	GoFeIKHuKfpHr3HtuhYIiwwBAibuIpExvp8COHfx4gdgxYeRE1Ob/gWYm9gn8BRP6jXrTJbnlwvPa
	opQjTk8Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb4Id-0001KP-45; Fri, 06 Nov 2020 16:09:15 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb4IZ-0001J6-TJ
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 16:09:12 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6G35hd163495; Fri, 6 Nov 2020 11:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=7W+KlFrvlVCE1tszckPeCRwketIIYuzjK60HHTqUggw=;
 b=fX78gnQDgo0lZRSs4f0TaNTqhWRCEsiCARBBbJmZk56i9nMkHyjydqCTrfL8HFR50oZZ
 V8Jl/H3D2RhII575uqX2745bZSPiDxNJ1wu6/crmy336kMjUYH8h2oDROFomrdS+Vs3z
 IbQ/8ya4s8EZtiW9GqVciH5Kh9iwDZnxx1JD2a02r/yK5eJSuMAgWOkgmDnMxOXQFFVV
 N4Q8/i4A9G4vxxnqmBXr7zhWYCejOYNE068+ui5Nhw1g/ondKoM7B2m0ZIGaLhGuUT0H
 EVGnKHp5POroL6B5d2Wfze3AJ9nuuoBn2M3J/lDI/xUZHE8kIe//coxzDqnVxj31FQev 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34n3jpdabb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 11:09:05 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A6G36xm163549;
 Fri, 6 Nov 2020 11:09:04 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34n3jpdaaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 11:09:04 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6G92fS014519;
 Fri, 6 Nov 2020 16:09:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 34h01kkecx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 16:09:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A6G907Q4522674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 16:09:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77CEF11C054;
 Fri,  6 Nov 2020 16:09:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DD4611C050;
 Fri,  6 Nov 2020 16:09:00 +0000 (GMT)
Received: from imap.linux.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Nov 2020 16:08:59 +0000 (GMT)
Date: Fri, 6 Nov 2020 17:08:58 +0100
From: Stefan Haberland <sth@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/10] dasd: implement ->set_read_only to hook into
 BLKROSET processing
Message-ID: <20201106160858.GA76682@imap.linux.ibm.com>
References: <20201103100018.683694-1-hch@lst.de>
 <20201103100018.683694-7-hch@lst.de>
 <20201105205634.GA78869@imap.linux.ibm.com>
 <20201106140201.GA23087@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106140201.GA23087@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_110912_016663_45E648CE 
X-CRM114-Status: GOOD (  32.51  )
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
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Christoph Hellwig <hch@lst.de> schrieb am Fri, 06. Nov 15:02:
> On Thu, Nov 05, 2020 at 09:56:47PM +0100, Stefan Haberland wrote:
> > > +	/* do not manipulate hardware state for partitions */
> > >  	if (bdev_is_partition(bdev))
> > > -		// ro setting is not allowed for partitions
> > > -		return -EINVAL;
> > > -	if (get_user(intval, (int __user *)argp))
> > > -		return -EFAULT;
> > > +		return 0;
> > > +
> > >  	base = dasd_device_from_gendisk(bdev->bd_disk);
> > >  	if (!base)
> > >  		return -ENODEV;
> > > -	if (!intval && test_bit(DASD_FLAG_DEVICE_RO, &base->flags)) {
> > > -		dasd_put_device(base);
> > > -		return -EROFS;
> > > -	}
> > > -	set_disk_ro(bdev->bd_disk, intval);
> > 
> > 
> > While testing this patch I just noticed that when I set a device readonly this is
> > not going to be passed on to the partitions on this device any longer.
> > 
> > This is caused by the removed call to set_disk_ro().
> > 
> > Is this intentional or was this removed by accident?
> 
> It was unintentionally intentional :)
> 
> The generic code used already by almost all drivers in mainline only
> calls set_device_ro from blkdev_roset, that is it only sets the main
> device read-only.  dasd was the outlier here, and I didn't notice it
> actually called set_disk_ro instead of set_device_ro.   That being
> said I think setting all the partitions read-only as well when the
> full device is set read-only makes perfect sense.  I'm just a little
> worried it could cause regressions.  Let me prepare a follow on patch
> on top of the series that switches to that behavior.

Makes sense.
I am fine with that.

With this in mind:

Reviewed-by: Stefan Haberland <sth@linux.ibm.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
