Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D30C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 14:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C9760E74
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 14:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44C9760E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rE/WxU6mCgBTSFgXkew0kWFizojZqKuGuOVADiysJUA=; b=BV5w07N8DtIQ51
	oE4fJpnMahQE+zagapLQd+DJw/CoQsS21nsGFgmlojhk8Vgjk/Zz0gxnoUfs/OrplLJPGdi8E52Np
	Sf6euML/EGBTxNZhvfKRnRG/ppVjEsVZyVdkDlFhiWVU7K6RvpHnyO7qUFhYuP1mLgRJWc+3qoKUN
	sSM2Dpbdg6+DbDnozL5UttDlFOfRCy+FtXy5XnqB/GouSxtNBYmt/OthHK9c28cGrk8IpPbk4ab89
	z9FWMw3Pq4K6FaADi0gcmxPZYL6uh8fKBhEmudrZQh7psZxDOzLk49AtrBsDUVTmbsBpjYTnODzG4
	1bdNWl/BKGIq6iCKRdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMADd-00CCap-8H; Fri, 03 Sep 2021 14:31:01 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMADa-00CCaJ-Nm
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 14:31:00 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 183E6ICT026116; Fri, 3 Sep 2021 10:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=K1dk/P2wTpVI0p3QS3od3mHTburBeWR5dUPZNm4udps=;
 b=j0I0w/iXGypIbDpx/9Wc7NKetsfLRypj6wFIqBJkCaIZgssBV0fHHzA3gt8HYyR/oWCM
 sMPBRS/SP0EYikutM+CLa2xxvB4dM+EI2yxw6+qt3L9x8q/NDvgFgE/B/9l/mQg/42dO
 fzmt/9lDlWjijJGNhKXys6/A8qVoD7qIBS247VhF5ycLZt5Awlxqhf2xfus7c8ENwWhk
 nIFYVZHgNV5wKBB1Koa+uj+hVLC/70npbU7CHAwqRaHSCz+HovzmXRP49QMbQjSQty/d
 KrV9LAdprASeGVVaLeXONQtlIO6T6PjmPRSwj1mGaNAdaWtbuQJ4/dJs5DzXZ7PEKsTU mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aukatbgkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:30:48 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 183E6fhJ028767;
 Fri, 3 Sep 2021 10:30:48 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aukatbghf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:30:48 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 183ECDI1003658;
 Fri, 3 Sep 2021 14:30:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3au6q7h7vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 14:30:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 183EUf9J45679086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Sep 2021 14:30:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3572EA4064;
 Fri,  3 Sep 2021 14:30:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22229A4072;
 Fri,  3 Sep 2021 14:30:40 +0000 (GMT)
Received: from osiris (unknown [9.145.159.114])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Sep 2021 14:30:40 +0000 (GMT)
Date: Fri, 3 Sep 2021 16:30:38 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
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
Subject: Re: [PATCH 8/9] s390/block/scm_blk: add error handling support for
 add_disk()
Message-ID: <YTIxjn1X0ES8my2a@osiris>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-9-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210902174105.2418771-9-mcgrof@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V2U5m9F_lW0BS0QMZW1f02Rb7B-NE_bq
X-Proofpoint-ORIG-GUID: mLI1i5uQ2HrD42lfDNoMT2JI_B9gbecH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_05:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109030088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_073058_925653_7AC1C659 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, Sep 02, 2021 at 10:41:04AM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/s390/block/scm_blk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
