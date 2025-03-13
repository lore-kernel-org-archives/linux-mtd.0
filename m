Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1101C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Er9WtTKj9X7E+tRSfX427gd824xupMEW9Pk080g6RtY=; b=hzHh0PBpbjeW7r
	ejz5ZTrskA8wbAVAih18SFwVmb+dVfS7YNOQS9pAgv0veNpPJtuFUzKYoNE+Y8NA85iI/auLqtNuq
	1sdXqAVKP1zBomZjf6x8PcfhuvwFU+UsQQlWzwEx8Vh/q0fQudBezv1A14jcQc9lxGnIeP/OLR0Lv
	2b/fsQH2dekBX3OerzGtmbU+DFOVsAG9enwYYfHXuLyxFpZpkfOZzLmfvLWI0YmMu2Fcw7R5XznId
	QzilTtk4+GvxjgsHjVdmK9e7vaL9hsNlRmTAt1Y0es7cNinDhlxExiF2Zl2uWXz470PKkQ7ewHuyl
	6EEbc+Je6EY/oKzG1zBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiK9-0000000BL8Y-21eg;
	Thu, 13 Mar 2025 13:10:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiK6-0000000BL72-1HSb
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:10:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9A5Y0018566;
	Thu, 13 Mar 2025 13:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=dHR26g87SbgpvNBDmfouMw6szuPW3LIbyRevxJX9tiQ=; b=hC
	MZwiXit0hzNmqIyYCGpwHKQJ4/oU0lZUAtp+mIQagRDVatDkhGU2iMCO3wOTUQBg
	UYjNDXRBTCxUuycpNo4dx7DF83PZW/AV0vhKbqUsgx/gGDAWAapt4T9dUIyCVdyc
	RBAgjp05nFBOkRtv3pAClsoXt+B8WsTuOPe6o/qSZ5m0dB3LcU11ZhX+fd2vyv9F
	VxDLtZVVp0wImtRuwpj7/tEn1PSSaTh6WyruiZUmzgGUBWWeRYXpzryoUZ76CVyl
	1pe+QB6vqw/MGGHt5YSmaK08124U7Q6Jr8WIdKgVvsAgvGO/ZafEUqoCF1UwRl/X
	WkMftIo4jk/7mtodO3/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nx03a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 13:09:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DD9wF3013047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 13:09:58 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 06:09:53 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH 0/6] Enable QPIC BAM and QPIC NAND support for SDX75
Date: Thu, 13 Mar 2025 18:39:12 +0530
Message-ID: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dBTtC-SNAllfZqoCWnsaaI4RjB4BGiEL
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d2d928 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=IoVFHHhwEPMUAHoi-2YA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dBTtC-SNAllfZqoCWnsaaI4RjB4BGiEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=657 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061006_489148_D92D569D 
X-CRM114-Status: UNSURE (   9.33  )
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

Hello,

This series adds and enables devicetree nodes for QPIC BAM
and QPIC NAND for Qualcomm SDX75 platform.

This patch series depends on the below patches:
https://lore.kernel.org/linux-spi/20250310120906.1577292-5-quic_mdalam@quicinc.com/T/

Kaushal Kumar (6):
  dt-bindings: mtd: qcom,nandc: Document the SDX75 NAND
  dt-bindings: dma: qcom,bam: Document dma-coherent property
  ARM: dts: qcom: sdx75: Add QPIC BAM support
  ARM: dts: qcom: sdx75: Add QPIC NAND support
  ARM: dts: qcom: sdx75-idp: Enable QPIC BAM support
  ARM: dts: qcom: sdx75-idp: Enable QPIC NAND support

 .../devicetree/bindings/dma/qcom,bam-dma.yaml |  2 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 23 ++++++++---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts        | 18 +++++++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi           | 38 +++++++++++++++++++
 4 files changed, 75 insertions(+), 6 deletions(-)

--
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
