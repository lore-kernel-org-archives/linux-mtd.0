Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1B7C369B8
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YsTxixjr1exe6kiY3x4LIA5/azNSqWct4FHOnBkBxKM=; b=gw1qmMaLmJKfnl
	EY9AilQUq8a37VrYdNw8Cf5yzQyv4mGw4L46RkCO0QaIzQMx1mewwRJUESsQNj0kIcIfkw5wZI12Z
	1QDngScAykrK5aqe0//OueUS0eJu9pBoWztR8flW+UqGeCJQ6JLEt8BT8bI3vI5uH8zBh8CTe8bNZ
	K3lR1bz3DcHSlnTQmL5yhekf0DdguAithPw4QOz4g4168a6rw8bpW/SK8BCjsuQpIshhZ5E/1Jh7e
	14anGSHZIp6/h0C1zKtJA+LOl5e6d3IxE04EkBQQ2OGWkv2Vn40W4HJkKyZP0GIPIoE84feiduz4Q
	RRwbOl/4u00aCqeUelOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b3b-00000004rxa-0AAR;
	Tue, 15 Apr 2025 07:50:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aim-00000004nwp-2vJl
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 07:28:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15ePk018685;
	Tue, 15 Apr 2025 07:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=te0sy/dFG3n8hgy9m/Xap0ITW+qXd3H9xo5+/x7mjGU=; b=mY
	PijmioGnocsmhlofFGpxERnmgtSE6XYO4jUUOyS5SVG8RtwELNmer24hkS4toEQj
	i1KzTxvZcxlpnZr4JTjNcH8cQEjrriXxU8Xmbk99u3NxQqm1uyokO1RAs+xAVk2d
	Vt84SzYtM7IQC+ty0Fd3SbDKWFJVnBNtJJZ2PWg6IPQ1LUwjFh5c+2u7AEQAaCEw
	DOkLVsFG/NRy7MP/798X7Bm5aKdFaVbmH4kZBhvezT0g5wREHmvOqRkzuO926I5j
	ET+rp6XkyloHTFWrA1j1FX6S+FTWEIKZQoXvpf429D8MErxqF6O3ib5bWKPuWY/J
	CZOxIPEAOjtqkp7/PzEg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wf1pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 07:28:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F7SWHU032593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 07:28:32 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Apr 2025 00:28:27 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v2 0/5] Enable QPIC BAM and QPIC NAND support for SDX75
Date: Tue, 15 Apr 2025 12:57:51 +0530
Message-ID: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe0aa1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=c2BNjoVmnf2s0oQOp70A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _xHYmi8j79GWNkAxsH-MoeC064icYFwT
X-Proofpoint-GUID: _xHYmi8j79GWNkAxsH-MoeC064icYFwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=743 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002840_865942_38601098 
X-CRM114-Status: GOOD (  10.90  )
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

Hello,

This series adds and enables devicetree nodes for QPIC BAM and QPIC NAND
for Qualcomm SDX75 platform.

This patch series depends on the below patches:
https://lore.kernel.org/linux-spi/20250310120906.1577292-5-quic_mdalam@quicinc.com/T/

---
Changes since v1:
 - Use sleep clock instead of adding a dummy clock for QPIC NAND since
   sleep clock has the required properties.
 - QPIC BAM controllers have dma-coherent support hence document it as a
   global property.
 - dma-coherent property is not applicable for QPIC NAND controller so
   remove it.
 - iommus items is fixed for SDX75 NAND controller so document it likewise.
 - Merge QPIC NAND and BAM devicetree enablement into a single patch.
 - Fix minor coding style issues.
 - Link to v1: https://lore.kernel.org/all/5a1b52a3-962b-04f9-cdfc-4e38983610b5@quicinc.com/

Kaushal Kumar (5):
  dt-bindings: mtd: qcom,nandc: Document the SDX75 NAND controller
  dt-bindings: dma: qcom,bam: Document dma-coherent property
  arm64: dts: qcom: sdx75: Add QPIC BAM support
  arm64: dts: qcom: sdx75: Add QPIC NAND support
  arm64: dts: qcom: sdx75-idp: Enable QPIC BAM & QPIC NAND support

 .../devicetree/bindings/dma/qcom,bam-dma.yaml |  2 ++
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 30 +++++++++++++----
 arch/arm64/boot/dts/qcom/sdx75-idp.dts        | 18 ++++++++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi           | 33 +++++++++++++++++++
 4 files changed, 77 insertions(+), 6 deletions(-)

--
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
