Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE478C282CB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 01:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1BA22175B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 01:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T1HN3Vhh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1BA22175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKHAV4rSbUyvkSQv+EDmTd8tLHsV4xkTX9Lh8UtAQWI=; b=T1HN3Vhhin+AdQ
	ASZDWkp48OrtKT+lbQizkBueIaK5JBJc5RlOyJi31/lOMo1mOcjzYPxoMK69hzo5x/BtMFngDRRZc
	FnlHKRhO5azr88ZTeIzoWvBLrzHntUFVWCfQXx+SGhAAgj4YsDViPXx3N3w73jKs4Mtb2atniwFTn
	tiRHfpSt7YhR7cnfTmpp2sreGzDid3dh3Z6+q9UWJL1K4O4GwuiR8aUIX1xLdSu/jJt1ksZ+5TvyJ
	DTMfMfhLX7mAQh/89gsUdkyewF1XhetV2R2HB2pAxsIBroODnGrBvbvG9Br2aze1iND0X0/3C2yLe
	QUweUkk+0s2zoHmdfmIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grBj9-0001uI-Ma; Wed, 06 Feb 2019 01:10:11 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grBj5-0000yr-UM
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 01:10:09 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x161A2D7026234
 for <linux-mtd@lists.infradead.org>; Tue, 5 Feb 2019 20:10:04 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qfmq52ebp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2019 20:10:02 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <stewart@linux.ibm.com>;
 Wed, 6 Feb 2019 01:08:46 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Feb 2019 01:08:43 -0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1618gGx19857434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Feb 2019 01:08:42 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BC42B206A;
 Wed,  6 Feb 2019 01:08:42 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A0BFB205F;
 Wed,  6 Feb 2019 01:08:42 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.92])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  6 Feb 2019 01:08:42 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id C5AD44EC62C; Wed,  6 Feb 2019 12:08:40 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: powernv: SPDX and comment fixups
In-Reply-To: <20190206003659.27107-1-joel@jms.id.au>
References: <20190206003659.27107-1-joel@jms.id.au>
Date: Wed, 06 Feb 2019 12:08:40 +1100
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19020601-0072-0000-0000-000003F55FC2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010544; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01156890; UDB=6.00603512; IPR=6.00937414; 
 MB=3.00025452; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-06 01:08:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020601-0073-0000-0000-00004B135085
Message-Id: <87imxxiuzr.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=534 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902060006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_171008_120624_4FB7D56A 
X-CRM114-Status: GOOD (  21.38  )
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Joel Stanley <joel@jms.id.au> writes:
> converts the powernv flash driver to use SPDX, and adds some
> clarifying comments that came out of a discussion on how the mtd driver
> works.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

We probably don't need to mention the dim dark corners of the FFS format
and I kind of wish it'd die rather than spread further.

Reviewed-by: Stewart Smith <stewart@linux.ibm.com>


-- 
Stewart Smith
OPAL Architect, IBM.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
