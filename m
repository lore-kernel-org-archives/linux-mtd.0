Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D67E77181
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EGyjWYgQ19adjU1J+BKd/yL9E15vzA8uFOQ4XfISv+8=; b=2h9qGP36ZdrYK5
	yjRXEAUi6bMB6cmmygRhA0NSPO9vM8t4KpU0ycQY4DXfqPEG399+ILXO9vL6jHSF+Vu+ejIudB7wn
	Ym7ptJKXlOxyLM5s4bImXYW8eWGFGOpe7M4mgzMi07WtR4SVBaFMc6CrrvmY/BYsr8favl49U5Xy9
	zvx56FnUaSoz5BC6OCBrlNoiGghjKZQvFm+ZHLtovsiEy5EwYVmVgRaSfKD6NHzEaNtOZAFUBi31U
	2KB5vstdNhlZj/LaOOUmdBXjkDUXMc8Ec3xhb/tuLNwije1Qzmv73Ju6GndZVzXPceEt+IJ36wkfG
	vaCKJYf9CCGGreEETDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgW5-00000008XG6-0NPI;
	Mon, 09 Dec 2024 16:21:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgVu-00000008XDx-0Vwb
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 16:21:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FaNQl014046;
	Mon, 9 Dec 2024 16:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=jeX8jBQrA4Y/1/e2bofe8t72kt/HJ+dQVyIr2KvR5Tg=; b=i4
	6ik0RDPtgMRze8JDiu4HPhCdlKGqpr9rw9qquxNU/V75xR+Kuehp0vW1WwlHeJ6O
	kAIiA/nQF0xg9+vqdm62Iu5h9onNXgNBzj2EJ8bKJG5qSfw5zRHzO/yOggtH5XGA
	XXiizC7ivsMc9wtXGznfBbUHlqyvWEYA5XqwK/flzFXtfwGkTnD3HLn6p0eUFRjx
	3cU1lYiAIMIVqIdWGYJDRMaax7jcUop0U5huO2WDXIMtRY1Xf8hsPjZ2CR2bW3xe
	INinuMKeQftePE5/NAZRs6aSHMhkhCZF9v/SZMP8sNWI3E+mNByi782/8WlF1Uxb
	6LqVKg8Y/5bLH2u1L+5A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyahmrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 16:21:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9GLTjd015708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 16:21:29 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 08:21:26 -0800
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
        Pintu Kumar
	<quic_pintu@quicinc.com>
Subject: [PATCH v2] ubifs: ubifs_dump_leb: remove return from end of void function
Date: Mon, 9 Dec 2024 21:51:04 +0530
Message-ID: <20241209162104.15331-1-quic_pintu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rRIns4iJhf67h--F4ZCl6Xyt5b0A4NzM
X-Proofpoint-ORIG-GUID: rRIns4iJhf67h--F4ZCl6Xyt5b0A4NzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=821 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_082138_286869_352ED2A0 
X-CRM114-Status: GOOD (  10.48  )
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
Changes in V2:
Change commit title as suggested by Zhihao Cheng.
V1: https://lore.kernel.org/all/e43da923-0184-d41e-a273-a02848f3b671@huawei.com/
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
