Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1726C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 11:45:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90DE36056B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 11:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90DE36056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dySwsalpv+pY8uuSZmIlMZTmkkmkA3bHgLaB6vS6evg=; b=V/iEHh2kTZDjs9
	yq7hrdgHjo9rUGqYDJCdZ2/bOKp5QtwJi7luonFDey1y9wloNZFpRTZGXZeoK2lB+g1fU51Nc0sjR
	+9DElMx9swF9FksWzc41M0H77yX2AwceYQgjOinIUV9+lSZV2rJZYA3505zpKqdHTY8vv072R+db5
	lU0mD+IRsHsgOiy1ZWmqE6BN261thJBH2UxMoXu5dUmNSlTdr6Zv789CBXjZe9yKvuE2geB/CwYIA
	vcPpQqPwH+jyO3o3FX9H+cXsD+FYIjDSwGix0GpvyD2rMeXno/4xP8GpEeN0wmd1WfM8h28Z9Z6MM
	nFAzhLDRI+k0axqSHJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mND2r-000dpg-VJ; Mon, 06 Sep 2021 11:44:14 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mND2m-000dom-9t
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 11:44:09 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 186BXrJc036697; Mon, 6 Sep 2021 07:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YDq2fdygf8Y3QfqeYgjO/iDMTPx1mMqDc6x9GEPkVK8=;
 b=rXGDkgyuwG12cXOP7sKpTlrDfxf78vS+ERlDVQCznYwY5Umu8fLmsvJUXjC5BHfSGofC
 mNZLMiKDL4Pej8yeE74rxKpkwA6ruFPgvcgdkod+CtyruxDbqBiM7l0TRHnXzBae4/kc
 gleUWs3TeQju2cuGcS33ONcK2nO9ltXSFCx/VXaqcgb8oytTbnYbaQHzPi5FqSrVVY+x
 FSQ0ordEbBK0kmS4GWXSfP4mo5ddON6BAOT/n5lSJ+/1sAR7UCL/FnPvnhXwNf5cRgkB
 X1h0P192iHYvBq71WsaqpcK+siTe0Tf9Ogc7eOakqhmdwAs6sGnyxW2fZUFNmf6ePqiG ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3awj5t0901-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 07:43:56 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 186BYkTj039013;
 Mon, 6 Sep 2021 07:43:55 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3awj5t08yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 07:43:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 186BhLge007528;
 Mon, 6 Sep 2021 11:43:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3av0e938eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 11:43:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 186BhnlL43975164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 11:43:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8747A4054;
 Mon,  6 Sep 2021 11:43:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36C25A405C;
 Mon,  6 Sep 2021 11:43:48 +0000 (GMT)
Received: from thinkpad (unknown [9.171.78.139])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  6 Sep 2021 11:43:48 +0000 (GMT)
Date: Mon, 6 Sep 2021 13:43:46 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, axboe@kernel.dk,
 gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] s390/block/dcssblk: add error handling support for
 add_disk()
Message-ID: <20210906134346.19c14246@thinkpad>
In-Reply-To: <YTLP8mYBX37R++9E@bombadil.infradead.org>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-8-mcgrof@kernel.org>
 <YTIscKy+jg5L/TMh@osiris> <YTLP8mYBX37R++9E@bombadil.infradead.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lKjoO_-t65aECnh67DPT1WhBnwVtT5Mm
X-Proofpoint-GUID: koNu9BnZWKx9Oz09ckXYLCDs_6zcUj8t
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_05:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_044408_488327_0CF6993F 
X-CRM114-Status: GOOD (  32.06  )
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

On Fri, 3 Sep 2021 18:46:26 -0700
Luis Chamberlain <mcgrof@kernel.org> wrote:

> On Fri, Sep 03, 2021 at 04:08:48PM +0200, Heiko Carstens wrote:
> > On Thu, Sep 02, 2021 at 10:41:03AM -0700, Luis Chamberlain wrote:
> > > We never checked for errors on add_disk() as this function
> > > returned void. Now that this is fixed, use the shiny new
> > > error handling.
> > > 
> > > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > > ---
> > >  drivers/s390/block/dcssblk.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> > > index 5be3d1c39a78..b0fd5009a12e 100644
> > > --- a/drivers/s390/block/dcssblk.c
> > > +++ b/drivers/s390/block/dcssblk.c
> > > @@ -696,7 +696,9 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
> > >  	}
> > >  
> > >  	get_device(&dev_info->dev);
> > > -	device_add_disk(&dev_info->dev, dev_info->gd, NULL);
> > > +	rc = device_add_disk(&dev_info->dev, dev_info->gd, NULL);
> > > +	if (rc)
> > > +		goto put_dev;
> > 
> > This looks not correct to me. We seem to have now in case of an error:
> > 
> > - reference count imbalance (= memory leak)
> > - dax cleanup is missing
> 
> Care to provide an alternative?

See patch below:

From 7053b5f8c0a126c3ef450de3668d9963bd68ceaa Mon Sep 17 00:00:00 2001
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Date: Mon, 6 Sep 2021 13:18:53 +0200
Subject: [PATCH] s390/block/dcssblk: add error handling support for add_disk()

Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
---
 drivers/s390/block/dcssblk.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 5be3d1c39a78..0741a9321712 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -696,7 +696,9 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	}
 
 	get_device(&dev_info->dev);
-	device_add_disk(&dev_info->dev, dev_info->gd, NULL);
+	rc = device_add_disk(&dev_info->dev, dev_info->gd, NULL);
+	if (rc)
+		goto out_dax;
 
 	switch (dev_info->segment_type) {
 		case SEG_TYPE_SR:
@@ -712,6 +714,10 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	rc = count;
 	goto out;
 
+out_dax:
+	put_device(&dev_info->dev);
+	kill_dax(dev_info->dax_dev);
+	put_dax(dev_info->dax_dev);
 put_dev:
 	list_del(&dev_info->lh);
 	blk_cleanup_disk(dev_info->gd);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
