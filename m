Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D73CE7717B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TaxrJUIrPA0E0cvK8Ym/0NsD9owYDCsJQfeVYIcHOag=; b=gfE9csk4y93hxm
	qiTSMYTPcvrucWf40FjyNs07BE2J5AxBMQ/aLa2KTrOTVq+BhoMgQ+2HuxI+clrMM2Q1XwH8PMqqD
	Csy0pF03zpXqNeRDo3mOWQH12ihVobILNOx+qoloUJmPyMmlsuaDmyjRDx/QfJXjkmqwrKyOVi8qA
	FQ9LTu54514vm3bXeG2MFxEKXuscmpPUWpLzofUfmGeZcHvlMgEWfKRWi5bWn1jngczLFtg/mIf2+
	RBVE5Nsm2rS/XisQjZEnlfZbpZk8gckLanrmqaWk16xOUWxgem3XcTpExhrecmN0rNCEgPhDvb37v
	jqkymhsU4j9eKy90g8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXq4-00000001dSz-2Ge5;
	Fri, 06 Dec 2024 12:53:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXq2-00000001dRN-0FI5
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 12:53:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6BmwJV003138;
	Fri, 6 Dec 2024 12:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Q3gonYDhgHp8TDmpOVMp4K2m+cXMh6AwNwWl360M3ug=; b=ma
	q16Z+zKt9XVniozz7pF6q4GQZk9RZFt9mPMe5qTKBw5PQn+YX1FaoeboUmsWn6cu
	c07fEbIrA9N96MI9p0eaOT9k3emFMxEXlw600Xs1omhNmUYmrWqp1BgENc8RnDHm
	zbl5nOyRPU9OkblMlRaWK5DQNSuK00NH2MgGhDJmm7cGT/Xd4+Q5tKHuzh5eM+d9
	8NhjuIh2sk3HYBPOkmtq2qJyivWiUYMRTBn+udlKvQUBToZFSi1Y3VRBZf5ehL6i
	pQANq2ekGG1/RBQYe+WltRYcDS8iSYLfY1OCSlX1+p+kfkiUnr7mmuxgg5E4CRbp
	nodOhbkAi9gpjADjjGUg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp1jq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 12:53:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6CrWu1029763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 12:53:32 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 04:53:29 -0800
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
        Pintu Kumar
	<quic_pintu@quicinc.com>
Subject: [PATCH] ubifs/debug: remove return from end of void function
Date: Fri, 6 Dec 2024 18:22:58 +0530
Message-ID: <20241206125258.9212-1-quic_pintu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QkxsqqPNAy4p3SUB3d43iKi6JwT1nT4d
X-Proofpoint-ORIG-GUID: QkxsqqPNAy4p3SUB3d43iKi6JwT1nT4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=843
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_045342_114648_1DE347BA 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Noticed that there is a useless return statement at the end of void
function ubifs_dump_leb().
Just removed it.

Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
---
 fs/ubifs/debug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 5cc69beaa62e..987eb5b6782a 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -863,7 +863,6 @@ void ubifs_dump_leb(const struct ubifs_info *c, int lnum)
 
 out:
 	vfree(buf);
-	return;
 }
 
 void ubifs_dump_znode(const struct ubifs_info *c,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
