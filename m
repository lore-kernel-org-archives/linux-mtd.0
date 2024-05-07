Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB20C19F4F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpQvEo8laKeSCcktoFwLz63yL1IOaNbma/plDeRPx4M=; b=lIKbXSJ9eRtQsT
	e+y6E+np0SC2jBFcnPPCLYsQCvLWsTtB36/xqZlnFaZojIqEIlqVFUKzseNpe5XShagEjbNsxLJhQ
	Efxse8KyK6MDzyZOhIe2evQLIX2yYknql5kRQcvekKUHfXlr5U8oAUjDOI0CzFjnwkXxeuYSXcl+8
	9RuAF9d9HU5oNkVmGOXgbs97G+UVLIAKI+ffV+qlZ4nhV8znn67pkxbAMeoQwx2ZsZHt6a98elNme
	H2lNnkO43xquSE9ByLXuC5mrgBpWmB8VrVA7bTTzux0d0gS8TscY4I0DCwbT45XnULxu5SWFY1PwT
	SbIl8usW8KgyasJbs7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4TyY-0000000DBL5-1fq1;
	Tue, 07 May 2024 23:11:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4TyV-0000000DBJx-3Zoh
	for linux-mtd@bombadil.infradead.org;
	Tue, 07 May 2024 23:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FBqAShKqXxbLSTi/XWNVbqzsTD06CXSdErRUFZ9RsK4=; b=HHPn44KNYaSxGG8OUB1N1cxnpb
	KJRldg4i70pteP1WDk2nCYdRkJram9Z3sgDVC8Z2jNbM68bVOXsqrtNECo4OvJvuq51utDWL8TEbZ
	7sd2lw2GZYKimSHDXHA7bCQNPAZQIcU/XKB7JNo3T37l9opP2+WDcszcvjH1oul6ELc+X/Bu5SQsW
	TmRpfjFWyiHEg3dfwpuPKgFgdGQNYZ7eKzjQrlkwO+nhagHcuNqcI1gjNAcbGlbv1zDN8fEbKe1pk
	Pp2FyL+0lYZ/wnDRyiUuI6wWdaLc5EsyqLHdsanLbkWrUYXM2iJ+E0ogK5HN0nQLiIcbhc6kuaaaM
	GsePd1mg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4TyR-00000002H8W-34bm
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 23:11:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447Msx4q010709;
	Tue, 7 May 2024 23:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=FBqAShKqXxbLSTi/XWNVbqzsTD06CXSdErRUFZ9RsK4=; b=hc
	+MSFruqfWcg1znotrs5tziKCvXR3FjMA4nk8QDejELOj+Vjw/5HMeje90ppqHJcp
	vdDccjqn6OmlD0Ct1OCwgwrlLldjSnksW+XMvha+Vf67BM2NYfP7YsUGFMnQYNXf
	gGtW4cYmkZakVcTWJWzBY7CYqo71pgj1cu+OtRPlGJwalpZa6tsVf7pX9CQw37wf
	O4lk4qE7hc8LbFzhHH6Fqjedwh3Y1qco6ZChj2qOMoe+VKewWFSWc6iREYwiTGKy
	LmNrSEZoadu+WAzyPhM5m1U/XER+vDZs93G2mT61rDSkvS+mCYiwM7E8BgYmAG2W
	YSqpPgrMrZcvL0k/Ez6w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg4rg6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 23:11:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447NBGws015491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 23:11:16 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 16:11:15 -0700
Message-ID: <ae3ebe43-be3b-49dd-a5ad-4dae097e9ff8@quicinc.com>
Date: Tue, 7 May 2024 16:11:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jffs2: nodemgmt: fix kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: David Woodhouse <dwmw2@infradead.org>,
        Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20231205173222.12575-1-rdunlap@infradead.org>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231205173222.12575-1-rdunlap@infradead.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yFu2nQXpwZLoMKxzG9dgbeON128BV444
X-Proofpoint-ORIG-GUID: yFu2nQXpwZLoMKxzG9dgbeON128BV444
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_15,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405070164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_001152_834484_03B1E141 
X-CRM114-Status: GOOD (  12.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/5/23 09:32, Randy Dunlap wrote:
> Update the end of one sentence where a comment was truncated. (dwmw2)
> 
> Fix a bunch of kernel-doc warnings:
> 
> nodemgmt.c:72: warning: Function parameter or member 'sumsize' not described in 'jffs2_do_reserve_space'
> nodemgmt.c:72: warning: expecting prototype for jffs2_reserve_space(). Prototype was for jffs2_do_reserve_space() instead
> nodemgmt.c:76: warning: Function parameter or member 'sumsize' not described in 'jffs2_reserve_space'
> nodemgmt.c:76: warning: No description found for return value of 'jffs2_reserve_space'
> nodemgmt.c:503: warning: Function parameter or member 'ofs' not described in 'jffs2_add_physical_node_ref'
> nodemgmt.c:503: warning: Function parameter or member 'ic' not described in 'jffs2_add_physical_node_ref'
> nodemgmt.c:503: warning: Excess function parameter 'new' description in 'jffs2_add_physical_node_ref'
> nodemgmt.c:503: warning: No description found for return value of 'jffs2_add_physical_node_ref'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: linux-mtd@lists.infradead.org

I was about to submit a patch for these, but then checked lore and saw 
this was posted a while back, but so far not merged. Hopefully my R-B 
will provide some momentum

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
