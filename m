Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91321E65D35
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2024 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wQ1yVrK0aR43I9jw5Aq73xelm+FtyvUs3GgaLDg1itw=; b=NFdhRkmfes5FpO
	DF2vPFRjhdfbqBzW/pViOVnNZf74RZfgGrUkz6jQz6Ias4FbJr/rs/5fvVRoeP4tMi4mUCQIdkv/w
	N6VJy+aIKhSRW6fjciVbx9IveAbJaqJORXsjff+SdZwJbnuB6rELnEkblovN5ohwLOSKihEngKz51
	7M0LI+keKydwztI/PIfI4EBUW+ed+XeYRMBrGTpufaYJWv41Z4CPlNgleJ9Us1p+QcnslZDYMj6Sw
	DhNnxYvpgFPGhCXcRImuMOf37b7VQhx3CTFM72UbnftdvAswHERuScsphRgt8D/f0jS5Gv7UjDd4r
	dDqJrsGMitraPTlgcp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPWG-0000000208G-024H;
	Fri, 22 Nov 2024 09:00:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPWE-0000000207c-03WR
	for linux-mtd@lists.infradead.org;
	Fri, 22 Nov 2024 09:00:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM4WVnM019747;
	Fri, 22 Nov 2024 08:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V+HCme4EtitAVLS3Z1HOd4
	JRzmtvtNlpepGHbbLHDuw=; b=XxP++Y0HoBKgsXgoE0dy/BP7MT7AXugpBu8Yx2
	NE824ga3hJQE3qfYKmkaNgk9i8/tEidVXiVoDlvcvL2YEWTYEC3Yo41nTU77s+Zq
	nOg8HU7uAEwXYS8E8f73a6ai1Q1jOen5BryW1a0SPBPeVgkKpxXDAxdflE6eLYoM
	gvPwL/CXoirm0l4tCG6FNjbr7D3lgAgEXnrZA3/12PHDQSlr2kHBn1ajcF8gp7c9
	9WBX01V3365J4pBlbpbmjvUPCyAckoFHRDRIqZv8j9nCemERCb9IsJXcyhuxyoZu
	Qilzpd7TCQqiHbCTAUmQH0HbKI/h2sLyeHp+6RILPYurAOeQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326atagy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:59:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM8xsMn006462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:59:54 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 00:59:50 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>
Subject: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Date: Fri, 22 Nov 2024 14:29:30 +0530
Message-ID: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XMiQSuBQRnaBtd-RX6aLVjPL1xzi6IvI
X-Proofpoint-GUID: XMiQSuBQRnaBtd-RX6aLVjPL1xzi6IvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_010002_125848_0EB4FC1E 
X-CRM114-Status: UNSURE (   9.83  )
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

v2:
 * Updated commit message
 * Added stable kernel tag
 * Added Fixes tag
 * Renamed the variable from offset_from_qpic to nandc_offset
 * Set buf_count to 512 in the parameter page read
 * Replaced the buf_count value of 512 with the len in bytes 

v1:
 * These patches will fix the following:
 * 1) onfi param page read which was broken by exec_op() patch.
 * 2) Fixed offset passed to BAM from QPIC base

Md Sadre Alam (3):
  mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
  mtd: rawnand: qcom: Fix onfi param page read
  mtd: rawnand: qcom: Fix read len for onfi param page

 drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
