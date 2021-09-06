Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EB6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 14:37:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D6A60EE6
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 14:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25D6A60EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pOAZcDtkpOhzpbx6DyAmbhTfxtp7Rx8eQ4PaRtoW10=; b=4pon4DHe0uo9fb
	s9+O5E4ydGF3Z7ZFwN/oeVwgqRxeEzQq535MQn3hKvH6uVbr3jb5ve0gVSqMkr53XFP5jiYVMpkNS
	F8kf+oZMOQNHyhSYT6afWREybPis2zrPegKvYHA8bKgtKK9SidYShIV9NPvcKMXecltEw+4AuyL12
	rR8JZNqTxej/67xj+kQciZjxZnVLyyXFAYCm0zuzsiT4Qml0lmZPhSx/69ADeelabHH7Iq7AnEhAC
	Ld3Wl7kE/CMaA1leFGMvcWVzRgWP1bKS1PctuDm4vkqCuqW1rGXd4diozA9Cb6D4LBMU+6PT/sxLm
	E3k9l6/HfGHziGqjpKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNFjR-0017C6-BR; Mon, 06 Sep 2021 14:36:21 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNFjN-00176h-SD
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 14:36:19 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 186EB0cd093954; Mon, 6 Sep 2021 10:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=K9YoRjs+OVJTZWwE3aqGWgWmXGlfnLRk4vE6zXW/7MI=;
 b=pr6D7d1d18e9uwZlU0Ty8GzNce4SEulx18mGcF9L1kEJ+zwvsOlx2ic4beSbSKw26JXq
 +wabtQ6fpEzwdqEUSQHic1lITg/cwVqj2Q9qvwIMCxTPnmi7I9/KTvTxJIpE4M3WM14v
 HYDFATUechLGhhqevTYTmAG5IXFY/tsxIuKqHi3m4r5SPjgAoEk5be+4X9Ttpy82h96g
 fh5avbZFBx/ShTM0cCfRkPrxAMtwX+VSP+LliZEDjWMy+NMGkZhRKG+NSJI4ZCJCUQV+
 gebnm3jalueksIc+cPWp9KV8M6hqjwyRk4edwR6GL+1FQWUA2fUN0+1R8Cr9CPFKM6e2 Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awhbyn14m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 10:34:04 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 186EB02d093867;
 Mon, 6 Sep 2021 10:34:03 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awhbyn13w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 10:34:03 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 186EX2rL017980;
 Mon, 6 Sep 2021 14:34:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3av0e9chec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 14:34:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 186EXwhM54198718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 14:33:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F4D3AE058;
 Mon,  6 Sep 2021 14:33:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49EFEAE05D;
 Mon,  6 Sep 2021 14:33:57 +0000 (GMT)
Received: from osiris (unknown [9.145.3.161])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  6 Sep 2021 14:33:57 +0000 (GMT)
Date: Mon, 6 Sep 2021 16:33:55 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
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
Message-ID: <YTYm09U6jZUDtB9l@osiris>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-8-mcgrof@kernel.org>
 <YTIscKy+jg5L/TMh@osiris> <YTLP8mYBX37R++9E@bombadil.infradead.org>
 <20210906134346.19c14246@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906134346.19c14246@thinkpad>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oSOWQOHMJCB8KRa2gHe6rtDES0-9leq3
X-Proofpoint-ORIG-GUID: uWvV3nnx5hIse_lWekuNz15Kr0UNPFaR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_06:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_073618_069448_46F0E88A 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Sep 06, 2021 at 01:43:46PM +0200, Gerald Schaefer wrote:
> On Fri, 3 Sep 2021 18:46:26 -0700
> Luis Chamberlain <mcgrof@kernel.org> wrote:
> > > > +	rc = device_add_disk(&dev_info->dev, dev_info->gd, NULL);
> > > > +	if (rc)
> > > > +		goto put_dev;
> > > 
> > > This looks not correct to me. We seem to have now in case of an error:
> > > 
> > > - reference count imbalance (= memory leak)
> > > - dax cleanup is missing
> > 
> > Care to provide an alternative?
> 
> See patch below:
> 
> From 7053b5f8c0a126c3ef450de3668d9963bd68ceaa Mon Sep 17 00:00:00 2001
> From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Date: Mon, 6 Sep 2021 13:18:53 +0200
> Subject: [PATCH] s390/block/dcssblk: add error handling support for add_disk()
> 
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---
>  drivers/s390/block/dcssblk.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Thanks Gerald! FWIW:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
