Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A879C28B2E
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up0wJXc3wIQbUwl5J6iHwzeAv8EjFiHdSq0qxWoPb7c=; b=o8syM7Cp/RXKGx
	K0PSS9aU1u5cph5DT5sIJx1njvgBdk+MMeuuBGjjezaLWGO7zFvJdgfRTN/o4/Y/qZBirzPIxnbwR
	XhGbPz7lmQ8QJ7ZCt1Ps8dwNlhFZwcvoJnZtzSI66RMEGuQayta9CCOgScDlMHYFB+mob7KWIUhzO
	QlTtsX3Do/EPNrVQTHhEU068IImFo8dHCerd6GSn1nLpIlVPpY6QJvP1Q+Mh+ndFTu9sVWDFZMe9F
	TqfZK2TJHXWTb4Uzv+SpG0dG5KsqG9/zDfTzHcnug2t+QEiIrpImbf7aFumhYq+J4EKF/PrnLhylk
	bDF6SEeJNJar+ps2SfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjQh-0000000BVex-11A9;
	Thu, 13 Mar 2025 14:20:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiKI-0000000BLCu-3BFG
	for linux-mtd@bombadil.infradead.org;
	Thu, 13 Mar 2025 13:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rTMvJt4YNktuNBdJQjA3KpK3NAKX+jVF+/XcM5yga1o=; b=JMKk7tZ/2SE133gQ7QL1Hr7CTB
	O9+G1XSKhjBtSNAHGtVm10EqVNtE8BDK1xXbdRYv7WpI6QVUcAGma8qOhwUlo43e++zj9dx1OGbBO
	oUchRZ1AXOApfj93SMGNB4kBi4iucSEYJqpP7cf2BcbkZ0idBiYjDsANACD0FkEcn0zxs6fyeKPvl
	MF9VHYofVB3zREKYvT0IzbRKTlC5/V4ieriDxmbjC35UOe8XF2fW9S5cMVR5Xp+wvLujfX/J+IOJ4
	fPapbjygJlVOHn0MOwFjiwT9jhZyrfCdWCx2uK0vGFY4OH3DctotCF6IWtAflUTJHkT1txz15U8Sg
	dOzGeVJg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiKF-00000002dG3-1lqu
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:10:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D7CAr8019811;
	Thu, 13 Mar 2025 13:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rTMvJt4YNktuNBdJQjA3KpK3
	NAKX+jVF+/XcM5yga1o=; b=YwUBfItwxMJmvv9vGJ93gl/9ESVKg8aEnnUq47Yg
	YKjvyPE5gqm6Z3pQaR13aXrCBbxSrEcy4nEPN0ed1COSA115p4N8gHntQapWGOAS
	xDwSl7diFf0kWyFWZtxTvTDvtDlBkXC0q8EoIUI+OETHCNaw1sKql0bjGz0UWthu
	hMjtrQ1QpTmhBWA1bIVgHn75zrskld+D8zOf+MCGVmAjQA/OD1V4W2prWkIY6nMn
	8jB7takgdCcJUHePWTaWSjlgnzEwF1eG+2FK+VC70F8DJbrphUc3JMFZHh464GNg
	fQvZUX8W5Df/OijauLwX+yC5w81yb5UWZiyvHXAc66+Kgw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bts0h0ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 13:10:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DDA3la029846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 13:10:03 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 06:09:58 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH 1/6] dt-bindings: mtd: qcom,nandc: Document the SDX75 NAND
Date: Thu, 13 Mar 2025 18:39:13 +0530
Message-ID: <20250313130918.4238-2-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rfgKCddoWgJMhbTu7oN301xM7z9HAIbj
X-Authority-Analysis: v=2.4 cv=DNSP4zNb c=1 sm=1 tr=0 ts=67d2d92d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Kq_rJIWMMWslwROvJEYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rfgKCddoWgJMhbTu7oN301xM7z9HAIbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_131015_770747_2E132BE9 
X-CRM114-Status: GOOD (  10.25  )
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

Document the QPIC NAND controller v2.1.1 being used in
SDX75 SoC and it uses BAM DMA.

SDX75 NAND controller has DMA-coherent and iommu support
so define them in the properties section, without which
'dtbs_check' reports the following error:

  nand-controller@1cc8000: Unevaluated properties are not
  allowed ('dma-coherent', 'iommus' were unexpected)

Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 35b4206ea918..8b77e8837205 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -11,12 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq806x-nand
-      - qcom,ipq4019-nand
-      - qcom,ipq6018-nand
-      - qcom,ipq8074-nand
-      - qcom,sdx55-nand
+    OneOf:
+      - items:
+          - enum:
+              - qcom,sdx75-nand
+          - const: qcom,sdx55-nand
+      - items:
+          - const: qcom,ipq806x-nand
+          - const: qcom,ipq4019-nand
+          - const: qcom,ipq6018-nand
+          - const: qcom,ipq8074-nand
+          - const: qcom,sdx55-nand
 
   reg:
     maxItems: 1
@@ -31,6 +36,12 @@ properties:
       - const: core
       - const: aon
 
+  dma-coherent: true
+
+  iommus:
+    minItems: 1
+    maxItems: 3
+
   qcom,cmd-crci:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
