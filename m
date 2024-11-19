Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B72D6204E
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Nov 2024 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kFQPP4xLGj8mFLMGS11grZMfMyNpdZvJn5MugDFBCNs=; b=YEES+fSS7NqaN9
	CEnFmYAufhD+08msmUJN6419yIzBcdUvWzRyx8YHCW3loynNNOOVLCzghlILx07FXmx2R8dIfscF6
	C1zI9nBIkSeXyC95f8feX0NBn+c140CSYd1iO1QCJXPCAfYpqwzvSjD5D4R8IGJJ5fE4VHL7ACl7H
	RwPkWqAvxc0kFikeWxzcpBgRT7L0gwRXLht2Jsl4Klbn+78pJXD0kyRJu8uaLueTZdiMnBr9bs//j
	gE2AaKv53gQG32fXhqpZkVYDoGTgd9keAkNKN5OlmKnUwm4XdhVs5Npmu1Nh3SQgWku5t6MY7ab36
	9bU0N4e37HT8c/9R4V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKQN-0000000Bs5X-1EVS;
	Tue, 19 Nov 2024 09:21:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKQK-0000000Bs4u-15OM
	for linux-mtd@lists.infradead.org;
	Tue, 19 Nov 2024 09:21:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7F8FI004708;
	Tue, 19 Nov 2024 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BM/vYOPtFIg6lICyqBL4ZR
	26RlC4Jn1npyuN2f43SgI=; b=Zejrvb94+5fVehP5ziXVSRiQLpj0AMgWT+mKsx
	Culy6LSQHhKCv16OSye5uMoY4a43gA0f2CD6Ryx69Q3kfHYVOqzWvYEgRGLUEjZ/
	Ol/UKRgj0klwOFq4MWdlz/2YGCeywCMGm/megkHZ7nNxH9duV7Os3WUTqBdx3yN3
	ZDQo80fJWMtCLD9hOMLPXlfqjakh4/DoA8v0DpyYu4pl5seLrM/cU0AYDsXacwiq
	czYRnfaienQp7fg9dsSAtX5bDKOiTgvb/8Hv4y8QyKIPtZCfpwNNi8YsJFpmJZm+
	C9Dm+CXcIhoQDmzJyGCO8k4B5sYIVv/F/ozoNeEF7HElS8/g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7t1m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:21:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ9LLdI011298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:21:21 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 01:21:18 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/2] QPIC v2 fixes for SDX75
Date: Tue, 19 Nov 2024 14:50:56 +0530
Message-ID: <20241119092058.480363-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mTQF6_ZJw8fDetbnkEbODP2F8fIKLRo4
X-Proofpoint-ORIG-GUID: mTQF6_ZJw8fDetbnkEbODP2F8fIKLRo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=933 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_012128_408405_FA319B29 
X-CRM114-Status: UNSURE (   8.81  )
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

These patches will fix the following:
 
1) onfi param page read which was broken by exec_op() patch.

2) Fixed offset passed to BAM from QPIC base


Md Sadre Alam (2):
  mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
  mtd: rawnand: qcom: Fix onfi param page read

 drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
