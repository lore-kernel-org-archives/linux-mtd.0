Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67B2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 14:36:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A03E160EE6
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 14:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A03E160EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiaeq5ZtG/LslQVpDmmBDcPFvOkzM8Pux7TOBZ5LOCc=; b=cPCMIoivHaOQVy
	dPNWG1+lDDIutQlykc/5lqaNlojSLKdzcjT6kzEcDh3mA+QmiUnydCu90Qtt2m1ZXwdoVM/QVTJRw
	hAYWqh2v02spSQpDSFNunlyOynQg10P2swb2VFKbx8BO1pRpz7LXVC1tjJk9mUXVZKQN7Mh5ded6e
	QKJ8oNu8ggGsJ0Ti4F3kZS7lmoU2Xy7tkZkI3Audlj6xRd9/UoQs8oIgXPyWQD3mo6k4L89W1ZIsw
	CC/nU3A6STF5KPCfuNpfmJe8mGJwrFUTPqfYnv4BfvGGpM9Em9kIRennsC2KFDBFdAuVefpZW3W09
	uW3VQpnU3GhEXoCXDjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNFiq-00179J-Pc; Mon, 06 Sep 2021 14:35:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNFio-00178z-7q
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 14:35:43 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 186EYWcw092852; Mon, 6 Sep 2021 10:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=t5OR0eUDklpD1WGcingITtl2OO+Tv7Am9adn1Pg8ob8=;
 b=Fg5yauhmATD6QI5Na7k8vSPW5iTgGoMSjYH5iBmL2WQAHem/LLdTfeyfvHKh/Ta5fuOu
 u2cQFR2ixl8pEwImQgKY5qk2q1bNRqY9w/LCTSNtkKdE+6Di68i3mKZeeMTw7cDsBCjN
 lP3qqMU/HCRWZfFaKElSULlrf9L12xixT63jXCC1HqoV/R7ujHNzZA+iZYezwPDaxgWO
 6hVLfY/TJwmcDZAL8wwEBkKOA/UDBAImf38T7LQNH6fqBbdQqRvYpVb6U4uRZoKY9rZG
 4qk9cTJEO6YzOC8M7BxWdldZdzFnFH5EuchBQLQrG4J0UMabuxBnaQcAS2KvX+VSviXW Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awh9cwbev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 10:35:18 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 186EZImE100053;
 Mon, 6 Sep 2021 10:35:18 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awh9cwbdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 10:35:17 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 186EXUwh023137;
 Mon, 6 Sep 2021 14:35:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3av02j4kq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 14:35:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 186EZBZp46072230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 14:35:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 722F8AE065;
 Mon,  6 Sep 2021 14:35:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C4D9AE055;
 Mon,  6 Sep 2021 14:35:10 +0000 (GMT)
Received: from osiris (unknown [9.145.3.161])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  6 Sep 2021 14:35:10 +0000 (GMT)
Date: Mon, 6 Sep 2021 16:35:09 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Christoph Hellwig <hch@infradead.org>
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
Subject: Re: [PATCH 9/9] s390/block/xpram: add error handling support for
 add_disk()
Message-ID: <YTYnHUYSfB6YElnh@osiris>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-10-mcgrof@kernel.org>
 <YTIr1w/qPvgioUfL@osiris> <YTXcPBph323n2WJ8@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTXcPBph323n2WJ8@infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hBKOiASlRVgdP6m0ZVyfrL0h5Yz4Ft1A
X-Proofpoint-ORIG-GUID: sRBTe9g0KJq9hO82J9XVDCM7Uj8j1L5y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_06:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_073542_317924_5EC00340 
X-CRM114-Status: GOOD (  20.98  )
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

On Mon, Sep 06, 2021 at 10:15:40AM +0100, Christoph Hellwig wrote:
> On Fri, Sep 03, 2021 at 04:06:15PM +0200, Heiko Carstens wrote:
> > Hmm, this is a more or less dead device driver, and I'm wondering if
> > we shouldn't remove it instead. But anyway, your patch is not correct:
> 
> I'm all for removing it.  I think we need to do a little more spring
> cleaning on unmaintained and likely to be unused block drivers.

Yes, we'll remove it. I'll schedule it even for this merge
window. Should be away with -rc1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
