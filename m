Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEA3C7EE23
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bt0d7L/E1cAVrg5ONehnZ6rNTqqAE2ktpKyR6K+VKhA=; b=bLkqDGvR4xY9Oi
	C5cVX7exBVHeH+FdcerlOxq9n66DYM0x2Ddx0dwfa8Up5EVow7MDdXQmjd8sUGLElozeKGKek9FYU
	OdkG8DmN2pFtdkwO/JCtnZ4l1CHCgol1wJNeSSerwDf6FmusS4PcDJ/9VRuxJxG+IUPC725tjti9P
	2hZl8yDcYBvFhz21r74s8ikEZj/lH7gJ2UIVgB2z1WehUtr3qIspX9Z5RqSyWf4MoN+v5/nXx8nyh
	asneXVlV3wd7FcbMi6STBW4EvWuQUm5Jry+2idvkuyOKJ6uGXthOsX/QmiaKyCPO8lchH1xvcHQIX
	lIaH9hNe9r+5SvjigTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2T6y-001f7e-1U;
	Fri, 26 May 2023 08:47:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2T6u-001f6p-2r
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 08:47:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34Q2ljA5011142;
	Fri, 26 May 2023 08:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=HGWu3OCOHloh07B4sQpl6+28jTNgDrED2oMNgYoKSic=;
 b=T/XRVflVNgDLWtko5pLTRhEjRTjgpj0zQQNXt3yQugVITnOexUbkEUjJESFuAHYkQSMM
 BVRquhZZChA9lWRNmjQ8miCs0dUsWYD0jppG25chcGWGcd8dmTmNZv+2hA7uritIihbh
 HTUpQuSx78n02GKmNzNb2m5nLKkyUzjrB+7EUfO4mRomjRYGqNl+w2IQnr01/s7UBfd6
 qPjEv6DzOsAfdO5b0axImxc8eYrM+dECKbabUgDbSDAB0teLsGV9cosbeyUWquTFHd7Z
 f+iemLxVBuksCEhsY4X2YWEgC3aYYWl2WNdAeQpOqo2Xyf3+vOLuVzZq+Aid9zswvafR wg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qt5uftg0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 08:47:41 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34Q8lesY000552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 May 2023 08:47:40 GMT
Received: from zijuhu-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 26 May 2023 01:47:39 -0700
From: Zijun Hu <quic_zijuhu@quicinc.com>
To: <david.oberhollenzer@sigma-star.at>, <bastiangermann@fishpost.de>
CC: <linux-mtd@lists.infradead.org>, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [PATCH v1] mkfs.ubifs: Fix mkfs.ubifs failure with option selinux
Date: Fri, 26 May 2023 16:47:33 +0800
Message-ID: <1685090853-25855-1-git-send-email-quic_zijuhu@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1V14ojXj5iMEMEEW8UkpTwSaoBYBoGmR
X-Proofpoint-GUID: 1V14ojXj5iMEMEEW8UkpTwSaoBYBoGmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 adultscore=0 priorityscore=1501 mlxlogscore=907 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305260074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_014745_017170_FC639577 
X-CRM114-Status: GOOD (  14.05  )
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

Below failure happens when mkfs.ubifs --selinux=FILE ...
"Error: bad file context FILE 1"
"No such file or directory (error 2)"

It is fixed by this change.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 8211ada..15e6bdc 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -733,6 +733,7 @@ static int get_options(int argc, char**argv)
 			if (!context)
 				return err_msg("xmalloc failed\n");
 			memcpy(context, optarg, context_len);
+			context[context_len] = '\0';
 
 			/* Make sure root directory exists */
 			if (stat(context, &context_st))
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
