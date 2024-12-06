Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B162FE77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=unLBcT0Yfvqg7K8lSiWUxrT2N0tAf4YaDdP8pUrGpNQ=; b=EIu3UtKIlGtYtl
	i8S64WjbTkqty+FyX9FN0fQmfWBzdeLypUP0yTKVIL9JctUXW1FsEm2H89KDClpcR2ueDWIg7RNwm
	v1azyQ6S7HptzgzOjtdKsQKwjXnHdw7OoqaDbTe4ahsCATCJ14YugATwGOvMcYflbP2PxPcmtpslV
	n1SbRnLOxay3Gk/MTfIsmjPJ4Sm2fzQEuCN1mOjZ9jMtlNHBrPag8/o1ZtCjkVzNJyFXgr9R2iufT
	3Qc5XQhaD/7yBKxdY+2q47jkaq2KBLeA3KCvagxLzog21czKTDtHOoH1pbSe4UQzSRqe6S7Hhrlc+
	7Tp28gxl7J9QhOT0ZTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY1n-00000001gFm-0vZ8;
	Fri, 06 Dec 2024 13:05:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY1l-00000001gF1-0PQT
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 13:05:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6775Jn031009;
	Fri, 6 Dec 2024 13:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=+THftZcvlIieAl5jw5OcObXVsaJk7nXwFhsvTAjoNxY=; b=SC
	UgMWionfKk6rY9XQH6kCLURggq78dunhiL9Ix6qb15F1XGTksSQYiZau8aKNdbYD
	CtoWHP4kgN+0rjH0TTxyINAAdeqv5xYS2wol/VUMsbhunaDWetBGXsj2HV+03Qmq
	jp331i57V+kwQKiXncFxXogJBgGG5cPdfE7+f8f6cbQ0BDsUCtH/RQL6gz0B6QTx
	okyTdUOKCchcz+Fm9Poi7BWMQEP6ssSNfwWqSh1Jk5BeUAzLFmEtqCghInatKXQ2
	WpweqNADH/NejFATuWtHJnDBpEcuATbXf/rKkJdtd9beDDD7krR3FXD8kOMlTD8W
	dkT/zkI/Hs9kW6o3mpkA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be17380g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:05:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6D5dfj020365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 13:05:39 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 05:05:36 -0800
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
        Pintu Kumar
	<quic_pintu@quicinc.com>
Subject: [PATCH] ubifs/lpt_commit: remove return at end of void function
Date: Fri, 6 Dec 2024 18:35:11 +0530
Message-ID: <20241206130511.32592-1-quic_pintu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PSheeY--Q8p1hdWVRx6BhI7ezy8wuMcB
X-Proofpoint-ORIG-GUID: PSheeY--Q8p1hdWVRx6BhI7ezy8wuMcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_050549_246708_AAC86659 
X-CRM114-Status: UNSURE (   9.98  )
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
function dump_lpt_leb().
Just removing it.

Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
---
 fs/ubifs/lpt_commit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index aa8837e6247c..f2cb214581fd 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1932,7 +1932,6 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 	pr_err("(pid %d) finish dumping LEB %d\n", current->pid, lnum);
 out:
 	vfree(buf);
-	return;
 }
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
