Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFADC04A6B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 11:34:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F269A206BF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 11:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZGAlrs2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F269A206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpgAPdDOpFXajG/QLr/QKcvHl2fjIu0bEhhlhdM/vI8=; b=ZGAlrs2h6ByFQp
	QO897SnQuBOeq8ITXqz5Bun95CIz595zYF5gDkBRcIv8SSfQ+uQFWh3GVn3wM3Dd1e1OPnh3KPaB9
	g89X6mo33Q35lwRnqS+gNq3d0J183z4Z1m1d/q+pJRdpeouFSba690pbxAxV6W6zzF03PQM9E7oNk
	lHg74T2WRYjMBh24d4zoyhM2sp6CC7yNBQRO19sUkAEfVyZZhT9JqUHk1XV9Cto+1xHmOrIE4Kv7p
	DwEjr+CTfpKQzDQWwhJ7SAnD1fkGDBy/c8Hk7NkW+k3IQi88UQBNd29d6hvU7YKHv3JfF4r0dPC/L
	B+CTAyZdey/DiCqj2A8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNbsb-0000en-O3; Mon, 06 May 2019 11:33:57 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNbsV-0000U0-Dx
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 11:33:54 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46BWomc116690
 for <linux-mtd@lists.infradead.org>; Mon, 6 May 2019 07:33:50 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sajd2m9sw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2019 07:33:49 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <chandan@linux.ibm.com>;
 Mon, 6 May 2019 12:33:47 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 12:33:43 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x46BXgxt39059600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 11:33:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D569DAE055;
 Mon,  6 May 2019 11:33:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 748AAAE053;
 Mon,  6 May 2019 11:33:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.70.42])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 11:33:41 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 08/13] fscrypt: introduce fscrypt_decrypt_block_inplace()
Date: Mon, 06 May 2019 14:31:58 +0530
Organization: IBM
In-Reply-To: <20190501224515.43059-9-ebiggers@kernel.org>
References: <20190501224515.43059-1-ebiggers@kernel.org>
 <20190501224515.43059-9-ebiggers@kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050611-0012-0000-0000-00000318CA52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050611-0013-0000-0000-0000215142F5
Message-Id: <1926821.WNcHRD5IIQ@dhcp-9-109-212-164>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=632 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_043351_947310_D5D12D6A 
X-CRM114-Status: GOOD (  18.71  )
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

On Thursday, May 2, 2019 4:15:10 AM IST Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> fscrypt_decrypt_page() behaves very differently depending on whether the
> filesystem set FS_CFLG_OWN_PAGES in its fscrypt_operations.  This makes
> the function difficult to understand and document.  It also makes it so
> that all callers have to provide inode and lblk_num, when fscrypt could
> determine these itself for pagecache pages.
> 
> Therefore, move the FS_CFLG_OWN_PAGES behavior into a new function
> fscrypt_decrypt_block_inplace().
>

Looks good to me,

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>

-- 
chandan




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
