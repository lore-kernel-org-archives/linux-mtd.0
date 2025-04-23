Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B549C369D7
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 06:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2L/gxB0HmAoHeYKOvZSHj6ahLZYKVze+yHWQpGBJ5ZQ=; b=cXRr6lsVURbRNs
	sAfeqUaW5sOoEGIFJfjAFs5qk2K74uNLLTuR/H1xYSk7UG5VOsRFAfeiE+G/k5UqZYhnqq8oscNW7
	rV2dLMrVoDwK91o3/PYIvYfbSk0lzG87jQND7/VOWGv1o6H7iR3kniJ51aEPg1Q9YNmtp9tfSwSbK
	RAhFoI8nuepzk0CyfAguf0+mnnQLzvTYTjiR6LYZd7DwGwCxM6nI9WH0XsRKDD1u2MKcI26tdiUM5
	tRWb11F0cbD+iLNwtXut/qh6+woOSJdg6Y96YhdyPte1f/TPZv1a3MicU9Iy9MW0wccdn1tocwEM2
	8kLbQ9U4V3V5FCLoekUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U31-00000009Q29-4Apw;
	Wed, 23 Apr 2025 06:57:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Te8-00000009LbM-15bp
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 06:31:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i96A016294;
	Wed, 23 Apr 2025 06:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YQNBAjlr064X1/5yt4rnDgv
	WKgjcQXurOIWhIT2fjc=; b=IaboBbS1E3qOPyWFduUgZM0fnSl1tl1d1JGHql40
	AO2qJTQHgkxeWQM05nVAMd8bz+WOTO2WXISlu3lFLC8UlIExNvC8hDsk1USx7Uxg
	JTUOQAKNiJ2Ho+0LuXG8EaOZEOMZZR+H9inz9J3WKKxqnX8FhimALvAR7N6Hw3kn
	hq28aH2XewmOAMmeE+EBvFiWKFN/MxmMGWi6xJGrQ/wACCrl3UYwOxl+cfnBlhEN
	DoREiJt4XsTOU6vWHAJ0OQr2BvyiMNq07Gr1RuJT4PGNG1wyptMS6jXZx27rw85K
	tAkYEUY/H0gAGnG4yyFvemF6iaKY6331Rvsns06QkCDJQA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh093x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6VhVn006678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:43 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:31:38 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v3 1/5] dt-bindings: mtd: qcom,nandc: Document the SDX75 NAND controller
Date: Wed, 23 Apr 2025 12:00:50 +0530
Message-ID: <20250423063054.28795-2-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
References: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YCEGiSXAHRT3xrQNtpPg29sRlR7E5zlT
X-Proofpoint-ORIG-GUID: YCEGiSXAHRT3xrQNtpPg29sRlR7E5zlT
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808894f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=T7SboCa-U_X_iRyOqw0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfX6Ui+eBipH0ET n7n9tF2OEyHpq54UGijc9+VruKP/P+qcBHtqWAdhljjF3tDDi/zEKKj5bL+rpsjvJI6dUJlXOrH KfmBqw8Ob5jHipgfKS7SY8MU9ToixODb5+qDUnpobgQ9i3GpLckIaMnhHq3+5NFfeAE7IvAKPY9
 UtxajMB3vbd08ptW0CkN+BZ8Qfwe9eAkzb4+cYXvczaS72vwCbLGfH5fk4T/OinQpbWlMc2XC6Y D9d/tWzvj3SktyATJVNneCE9lUNfA/daSZISQtxRRMtTjVXGHuAa8nn1H4iTnsF5s6TgP5/dBbT OJT6Gmp7W9ncsUKQd9nUUYZFetgKeXgGMEBORfcNDYMd4/s9BeZQnOy7rjv99G3IX5TJHz02zj8
 kl3dMoj5bBeuLSY588/HC80TnGW38/HAKIxItzMEgbGa99kkXeWDDdfYb9UvcrkQvdf2BRba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_233148_305261_637194EB 
X-CRM114-Status: GOOD (  10.30  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
