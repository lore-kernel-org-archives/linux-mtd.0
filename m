Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7FBC369D8
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 06:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RB+gs7Mqtzx79chGhbcrQLZMKWzpiytr6BEQEeyWlC0=; b=e0ulxswyXNwvjI
	mQU3RciEXak2s02l1Plw8XzD+6fX1H3J8ci3SqgrUMfGn4jN4NP9atGd42csCZ7xJ1nkIyv/i4B2H
	gEPFhZYuFmf8DHMk+YK0P3X2ic5KttMKOBpooQDgfd515n4pmQTA/Uc9KVu4wrHe73TQs2pj1YTNs
	j6l+Y7/K9drNbya1QIADfL5wytut4HZueXkG7aT6k/Vz3JZfa3UAaC8KiZsziN0HlveVlNDp2XveH
	2sk7eixrvDeuKdt34RGimoHZSUJhHH4jaOwnVYsl4uJKdO+YJ7fMREN/OVPO8vtnFiKVl5TeTS6We
	B8wXIyS2x6abHVFz6z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U31-00000009Q22-26qV;
	Wed, 23 Apr 2025 06:57:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Te4-00000009Lag-0lXm
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 06:31:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAiq023892;
	Wed, 23 Apr 2025 06:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=+6WqrjoXPvdWgCP7F3pe1fIcKrBi1oigzlwoSjidNJg=; b=eP
	hdXMsPPffFKIV/rTqQt0aqQNRFgthkVTr+Td3xA3WgBdI2w8NDPxXpWJegFVab/w
	ouqH8cUvceiX38PelFTyyM6zSYG8iC03Mvo5xdN3vIvumTSe5n2fjdP9qj0v4ftE
	DcgX/Dp0fZP2vWNHCkgzk8a6aog5oPpvdHSnFcfVAFEtZvHhFmH+JYrRogqaOJ6M
	sUwgUPKUWGcnqA5CyUEpsYOdCnr0gnF3J7AWE+aj8SH0gZkPYAPdvvjVzqy8k8xM
	tf03lVgNxBitsKH7iaGJ5aI3EcRNr9suYMeab8e7cLq8585ees7bXInjxZH4ro+Q
	gmfHRlCzYHckglmSi0iQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh393hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6VccK024144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:38 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:31:33 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v3 0/5] Enable QPIC BAM and QPIC NAND support for SDX75
Date: Wed, 23 Apr 2025 12:00:49 +0530
Message-ID: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wRCdQKavkm4O_6Khebeo3s8W026o0uJr
X-Proofpoint-GUID: wRCdQKavkm4O_6Khebeo3s8W026o0uJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MyBTYWx0ZWRfX/5DoX8SE+eSG vstYSon9NgCD9QjRgbHLZXOViiEkjWJ4W5CnvS03O66cgTbgHhjdNW6Rj7lZv8WfBomu3LgQBSL ocj3GLAqFwHdVrfCNBXmd5Mqvo2LPEyDhewLz4AVDUNGd+bToAUHHoHDj9PNJZgPzQQRiWUZLTN
 RadlVeLOZWcX0RYZsDZjFsO2xCsq2/rRCsmKdzexy39jMx/k6GyU9AdIAPA8+XC0BiqnUZPR5Mm oD/jicpfQnvtS++eCsp4iUX9rtWq1KkHf6QWGBXn5vl0+jj1cisjrc2UmZhv6Vwp64L/uEK3z70 WWnDXgx+HZxXQcFzrvYRf42XBqENDUMcAWpB+bLzu8CuWug1/nMmZmtbQiAIdfn1hviKnBfwxpS
 oQ7Gi3SzlXMln1/15KwHaBLFRD0uGXpwG0+uYNgxe8rkppoYEXCZPqfjPz72crPCkR2cCWUv
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808894a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=c2BNjoVmnf2s0oQOp70A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=767 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_233144_232891_14C70D91 
X-CRM114-Status: GOOD (  10.95  )
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
https://lore.kernel.org/linux-spi/20250410100019.2872271-1-quic_mdalam@quicinc.com/

---
Changes since v2:
 - Add qcom,bam-v1.7.4 as a compatible for QPIC BAM DMA controller DT node.
 - Link to v2: https://lore.kernel.org/all/20250415072756.20046-1-quic_kaushalk@quicinc.com/

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
