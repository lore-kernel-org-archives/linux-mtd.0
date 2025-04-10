Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EFDC369A6
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lkIxgMSK9InTCxMgujjz7uICHJfe7xV8jh0Vq3bTBmo=; b=1Zo1s3COXlvWqK
	2B8sA1hcYFZotVlFjBJbqGTIvUK3ApHns4yeGUD+70F3K4kBswm0nTgoARifJGPj5qoBGTAUv20fZ
	CfF/8hCiNv4bI0wXvGEqEY1cISgsR4X2WEj2PGoUwyzgItogmU8WEab/bHMIU74DCiFDrSIR3HoYv
	mA5TlJr7HxTFFxnvtAr4w2Vz/LJHuq4QSjDKuwxDPpwp1m66MK1re9X9aaWSmc5m1J+l4p8/D6eAF
	UZsKTfDhXpcEgnffq80/qQ4g9gHbJBEOKAOEzGXE0JlQERxO5kgfTsHpIsoGOvkQgHbHGW1ZMzj5k
	iOwMKZSRA0jQaunau6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pvQ-0000000AFIG-03SS;
	Thu, 10 Apr 2025 11:18:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2oir-0000000A1aE-3FAD
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 10:01:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75c5j013900;
	Thu, 10 Apr 2025 10:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NchtbtraFMmqPHn0SazdXU
	b816o2RpvA5zsf8ovCTcA=; b=NY7HWyS4lEdUObbDU948HWReruBDOIBqLuqvd1
	zbFdC19kZ47WDl8TRoK20w6ZeHslph1nsa2IRwnvnfcPNlawjl2ajQTVIJCcGdBr
	DqJiHDYDB0dPWwVGYhT+aVqfsE8BtkEW7MHNLWQ9ek5O+aPtsmMtWJK4ogoEijPA
	BfVc7/UJypUQuE8WWwH9GvpftYkfajrNClwX8MOT7yp6nFXNnCF+yzk7ncEGixxn
	QstbUNFbyK8XUI5fmnaGMjqZjNdv97ZJSVSfpKMXCP8x/6O+/Ni7EEtBz9rosVz/
	Oogq4JF7wtWgJnS4JT45UOQ56hSRe5aCeK0zThymhlIdObww==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbeej92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 10:00:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53AA0e07013849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 10:00:40 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 03:00:35 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <broonie@kernel.org>,
        <absahu@codeaurora.org>, <bbrezillon@kernel.org>,
        <architt@codeaurora.org>, <quic_srichara@quicinc.com>,
        <quic_mdalam@quicinc.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v4 0/3] QPIC v2 fixes for SDX75
Date: Thu, 10 Apr 2025 15:30:16 +0530
Message-ID: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N2LFS1NTaM-ZbhqeYhkuswWJTBLTCTav
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f796c8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=kYr7qnbrJmlb9xinWT0A:9
X-Proofpoint-ORIG-GUID: N2LFS1NTaM-ZbhqeYhkuswWJTBLTCTav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_030125_813972_DDAB9D36 
X-CRM114-Status: GOOD (  13.70  )
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

The BAM command descriptor provides only 18 bits to specify the NAND
register offset. Additionally, in the BAM command descriptor, the NAND
register offset is supposed to be specified as "(NANDc base - BAM base)
+ reg_off". Since, the BAM controller expecting the value in the form of
"NANDc base - BAM base", so that added a new field 'bam_offset' in the
NAND properties structure and use it while preparing the command descriptor.

Previously, the driver was specifying the NANDc base address in the BAM
command descriptor.

also fixing last codeword read in qcom_param_page_type_exec() and read
len for onfi param page.

v4:
 * updated commit message
 * Renamed nand_offset to bam_offset
 * Dropped this patch "spi: spi-qpic-snand: set nand_offset for ipq9574"
   as "Gabor" suggested at [1]
   [1]:https://lore.kernel.org/lkml/a72f0db0-fd49-4cff-bffe-671fc757a219@gmail.com/
 * Removed nandc_reg_phys(chip, offset) macro and implemented this in function
   itself
 * Merged "spi: spi-qpic-snand: set bam_offset for ipq9574" in 
   "mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM"

v3:
 * Updated commit message
 * updated qpic_v2 to qpic_version2
 * Removed dev_cmd_reg_start = 0 in sdx55_nandc_props {}
 * Added new patch to add nand_offset in spi_qpic_snand
   driver

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
  mtd: rawnand: qcom: Pass 18 bit offset from NANDc base to BAM base
  mtd: rawnand: qcom: Fix last codeword read in
    qcom_param_page_type_exec()
  mtd: rawnand: qcom: Fix read len for onfi param page

 drivers/mtd/nand/qpic_common.c       |  8 ++++----
 drivers/mtd/nand/raw/qcom_nandc.c    | 18 +++++++++++++++---
 drivers/spi/spi-qpic-snand.c         |  1 +
 include/linux/mtd/nand-qpic-common.h |  4 +---
 4 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
