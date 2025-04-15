Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BE1C369BC
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cJhLLsutVYFojiXQov3A2XoEit7nVXoh8ZtnhsGhng=; b=D97GNdhHAUwdCi
	iAwv5BxZHQ/insdf8RgNHbQmYEpG7LbXYvszbcgZkdMW0D9TL3BpuKALMDGgpYjkOTTFlkrOuIMxI
	G3AINj0Zr9zC8dS4xTkc1PK97i7Kd2REEkLCK4WO46QApQeJfb/l28NgZrog4KqJO/TKm+jTiv8FZ
	yLYlOfW9uxZGDPNj1wOPyXsjJaani3b+5O3Rm8atR9vaROBqwDo7EW++jThUPqxc0JidPOi3H2I/k
	ZmM3DQHFbuxMkW0AbBlPsMBthfimHuWU/53eDHjW44fbZOAkIfn3MZEypXSwK1YPhvPtME9HsIYWH
	WOZc5vQl1t1n3QXayVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b3b-00000004rxt-2EVy;
	Tue, 15 Apr 2025 07:50:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aiq-00000004nxM-0WXh
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 07:28:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15eIG018673;
	Tue, 15 Apr 2025 07:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/7sr4frIRrXDp+8MyO3ns1rd
	lIU1FmZuxSCDIjTr/fI=; b=M+Axz2dRkq1TMtIMRljTKsnfo3m/ZlVutriOtLRU
	niguMv//e+aDvPjjJIs5aybVgOdZxtTiDo0lOcz6vfjmxoREEtTa2fNDjC6e1JZy
	NDsPgjs9vv8U0LBFwh8yBib+ToG+x4EEqcUJA/OwHUZkBYV/0F2V7Ou9i4bdtCDT
	K9OSfTmZRR20z7Z5ks7YGgsUPOjrc+TQ7FhqAYALyNwjXBygvA6apeRTmU5y1yLM
	n8k551CkVlBA4pLgwh5bcw4JPH9YDh1RdfAnGwMZ/+K5veQ0eqUmzD1b+U5HXPNg
	4ioF68DehJmpY19FXweQ8GCXBu88VAC9R8XOrQunCPY3GA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wf1pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 07:28:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F7Sbnf015760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 07:28:37 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Apr 2025 00:28:32 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v2 1/5] dt-bindings: mtd: qcom,nandc: Document the SDX75 NAND controller
Date: Tue, 15 Apr 2025 12:57:52 +0530
Message-ID: <20250415072756.20046-2-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe0aa6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=gQ9Sc5ERrPajg2iT2GcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YPMQ8t5MUU92MFmj40rAdGishOCRq2y5
X-Proofpoint-GUID: YPMQ8t5MUU92MFmj40rAdGishOCRq2y5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002844_284212_AF8955D3 
X-CRM114-Status: GOOD (  10.40  )
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

Add new compatible for the QPIC NAND controller v2.1.1 used for SDX75 SoC.

SDX75 NAND controller has iommu support so define it in the properties
section.

Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 35b4206ea918..5511389960f0 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -11,12 +11,18 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq806x-nand
-      - qcom,ipq4019-nand
-      - qcom,ipq6018-nand
-      - qcom,ipq8074-nand
-      - qcom,sdx55-nand
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdx75-nand
+          - const: qcom,sdx55-nand
+      - items:
+          - enum:
+              - qcom,ipq806x-nand
+              - qcom,ipq4019-nand
+              - qcom,ipq6018-nand
+              - qcom,ipq8074-nand
+              - qcom,sdx55-nand
 
   reg:
     maxItems: 1
@@ -95,6 +101,18 @@ allOf:
           items:
             - const: rxtx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdx75-nand
+
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
