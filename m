Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CE6E7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uMPQQN6DjRdMJqkKjy0OpB/ut3xhCbXrhz9CiIrg4nk=; b=xoGDj16XRztQuW
	U0DeIYE+dZ5YM9QnVDWe7QZiO1f+T3fNFce+wnp6Q3o3RmWGnW66bFOyudq5nkU9fvWHFW17eRxu8
	qzRCLLSORTnIto3tX3vU/JZXDJXA1rb1dS1NCcfRlXN4fD1jApB4xUC/1gjhb0Ajdk/5oa387UQb2
	zmaFRRY+7Lq4Upmyza3BG6WENQr+inszvxFW+6bzz96iPCXWAULBsN9SS33wVS4Uw8QVvk9LR5B60
	RLaCUssL77RM4XtK34vsrvvzQil0/xv5mt5GMvTII2akiE/9c9KvoVCx6ucJ2LePXf/DIQTHmHGtk
	az+DegfYFtWv6vPsB/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeMI-000000088BH-11Bn;
	Mon, 09 Dec 2024 14:03:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeJ5-000000087Td-1TJO
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 14:00:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9ADA9V010451;
	Mon, 9 Dec 2024 14:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=LYCDrDXJxDehK72J9pt8JiBZkQmznl2IFYQgM47YD8o=; b=nh
	t7vGxnxAZJz1y016lvsxyrpyVLR4IlkPFDx0apH6wxTzAs0mbexrhxFEUlpiLtIl
	gXSp0EchGRWEm5TTkuKbNgVr674L2yooXv+DAnoUBJJJYJsRme30GTN8WS6CWZBa
	6VqzaR/1j6OttxdmmPDKj3dZKcdrsk/lpMShuXf2kFLb8NbB1DqqkBvn/nYo9naM
	2cCGd3vQhvDEVhE29xKMDstje5XXJksaiFQXauRj59ODtU3KsxlXTTeXsEM8vSTg
	xTX211O7MIckOp9r81SP+SVpN+HqwCwYUWcaKW7dKGggHm8q72TVU+fhjggxJf+u
	vf+oGmTekXosCa3XBVsQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdc6d3hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 14:00:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9E01Mb029634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 14:00:01 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 05:59:58 -0800
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
        Pintu Kumar
	<quic_pintu@quicinc.com>
Subject: [PATCH v2] ubifs: dump_lpt_leb: remove return at end of void function
Date: Mon, 9 Dec 2024 19:29:36 +0530
Message-ID: <20241209135936.13229-1-quic_pintu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d6FWbJHLxOwzIU91aR03njawlQ2EB_bS
X-Proofpoint-GUID: d6FWbJHLxOwzIU91aR03njawlQ2EB_bS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=926 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_060015_510306_BB43201C 
X-CRM114-Status: GOOD (  10.23  )
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
Changes in V2:
Change commit title as suggested by Zhihao Cheng.
V1: https://lore.kernel.org/all/abe79e0a-a35f-0b53-bbec-7d642f592fae@huawei.com/
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
