Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3291FC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 15:09:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0204420675
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 15:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TKvxweDh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0204420675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0D49NjoinR9Pw87dina8MgtAYXZ3BGfMWflYQlT6Y0=; b=TKvxweDhyyVz0q
	Dsm0lLRyAOgioRYJVTzDiNe6EQ7P6wyfc08fWcAIGkrE1gHTQkUFjimWKV8lDDJPOiH0UOi4R5Yr1
	jhMYedYMGT3Z6uCCrfFpDNv5aDcTUxVkdhRXakpfJRA8rjng7SL2Lgja6XEgoHNOCwmOavlZXIvSN
	HM7T+3JFRHik+T9C/7deiy0jRIImkP0bDXWTK1Kh1O64fOlJmqLdPHnWtfdK6NQZlikcYy4Qc3OfE
	BHKAxdd5pPNThylvF3tk6Z0Ws6pD3iOKOANoAOdNCy4phDs8VtZh6AyB5DC0qmIeuUMKKBIPIrvNm
	Hrr1RPj667vGAiEzwjXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMDLJ-0005ei-TA; Thu, 02 May 2019 15:09:49 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMDLG-0005cb-Hc
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 15:09:47 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42F7X4v137895
 for <linux-mtd@lists.infradead.org>; Thu, 2 May 2019 11:09:43 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s8235thpc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 11:09:43 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <chandan@linux.ibm.com>;
 Thu, 2 May 2019 16:09:41 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 May 2019 16:09:38 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x42F9bNd16187540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 May 2019 15:09:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 221794C04E;
 Thu,  2 May 2019 15:09:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 904814C044;
 Thu,  2 May 2019 15:09:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.71.82])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 May 2019 15:09:35 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 01/13] fscrypt: simplify bounce page handling
Date: Thu, 02 May 2019 20:40:34 +0530
Organization: IBM
In-Reply-To: <20190501224515.43059-2-ebiggers@kernel.org>
References: <20190501224515.43059-1-ebiggers@kernel.org>
 <20190501224515.43059-2-ebiggers@kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050215-0016-0000-0000-000002779FA6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050215-0017-0000-0000-000032D43490
Message-Id: <3273903.Njs8gtEjer@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=530 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905020102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_080946_707582_17663816 
X-CRM114-Status: GOOD (  19.32  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thursday, May 2, 2019 4:15:03 AM IST Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Currently, bounce page handling for writes to encrypted files is
> unnecessarily complicated.  A fscrypt_ctx is allocated along with each
> bounce page, page_private(bounce_page) points to this fscrypt_ctx, and
> fscrypt_ctx::w::control_page points to the original pagecache page.
> 
> However, because writes don't use the fscrypt_ctx for anything else,
> there's no reason why page_private(bounce_page) can't just point to the
> original pagecache page directly.
> 
> Therefore, this patch makes this change.  In the process, it also cleans
> up the API exposed to filesystems that allows testing whether a page is
> a bounce page, getting the pagecache page from a bounce page, and
> freeing a bounce page.

Looks good to me,

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>

-- 
chandan




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
