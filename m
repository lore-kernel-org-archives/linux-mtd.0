Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CAD44171
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOgAFrVFt2DJ+YmesLQn+eEXSFB9VqoO/MQ4HHoxUM0=; b=usdbiPFJxKs7qG
	U9+E2bIkW0CvZCydse49Udivt4Ey1iV+h2zdBrNiDRO7H+k8lvDCr7O5vUjnfE0O5PlmEPGy28mqG
	vEECPC5WI2rXEKwVf4VpBcfzrIyLUZbxI0BNyhy9/nZp90NbctB14+Pn6JXtuvZHfhOC9ZDSvfBNB
	Qw0qQc389K+ULjvCZ+FOWBr0vbI7Au7ldIolws+8QzykTKvJiPwrHe1z/tA9l1PgaJ+ZDoRbl8DV+
	lP1t0KmOoN+zn8b/5OqSDX5+nbvm6SGO8yR6CPSw1bbdOumWEHLcenbxed0bPVd6s0H5rALKEJdV8
	VJ+x/Q4M+nf/huoYib2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgoH-0000000EsKM-2eXh;
	Wed, 20 Nov 2024 09:15:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgoE-0000000EsJ5-0l1p
	for linux-mtd@lists.infradead.org;
	Wed, 20 Nov 2024 09:15:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FLR6005925;
	Wed, 20 Nov 2024 09:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0d9J5LyB0dODKFd4sCsu1yD21ybHkstDPXQJNYHSus=; b=e2pT9JKLKESQE/Ek
	kWoZv7d9Ma+5RiN1KeHE58eaCpBIQ7wd+cYxZTpXOsIqSiPOaTOFUBLQSvyNkQpR
	ZCkhVqHXloQESdfthXpiPN/hOOKjEY1UIYGxNPCey2JfZR9cuIXDa/SqHWGCVBhe
	i+U9qwSO7O0MA8qr3IgyMke4384WKrOnn2bZvi2sc5hB3PL8B7e6ThFY0jEPUOZj
	5AXF1scWSc/DutlfHPwp4ot6ibzuBFRkvvkrUPctB56uGJRDBZDhkbs5E6EVvkVS
	9rPHWT3EvZdfUZJufdJbWhhb5urYWyVJQZBlTzJWjaF346kN9NtbHaV6STdEGMN4
	J/4/UQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4317t20ruw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:15:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK9FVuf017925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:15:31 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 01:15:26 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH v14 1/8] spi: dt-bindings: Introduce qcom,spi-qpic-snand
Date: Wed, 20 Nov 2024 14:44:59 +0530
Message-ID: <20241120091507.1404368-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sUvD8e1Bs3iowytLMev5UE4fj46HSUZt
X-Proofpoint-ORIG-GUID: sUvD8e1Bs3iowytLMev5UE4fj46HSUZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_011538_356704_D167E273 
X-CRM114-Status: GOOD (  15.90  )
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

Document the QPIC-SPI-NAND flash controller present in the IPQ SoCs.
It can work both in serial and parallel mode and supports typical
SPI-NAND page cache operations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v14]

* No change

Change in [v13]

* No change

Change in [v12]

* Added Reviewed-by tag

Change in [v11]

* Dropped Reviewed-by tag
* Added Soc based compitable "qcom,ipq9574-snand"
 
Change in [v10]

* No change

Change in [v9]

* No change

Change in [v8]

* No change

Change in [v7]

* No change

Change in [v6]

* No change

Change in [v5]

* No change

Change in [v4]

* Fix spelling mistake in HW description

* Added commit message

* Removed '|' from description

* Removed minItems in clock

* Added blank line

* Removed co-developed by

Change in [v3]

* Updated commit message, removed "dt-bindings" from commit
  message

* Updated compatible name as file name

* Added hardware description

* Documented clock-name

* Moved dma-names property to top

* Droped unused label "qpic_nand"

* Fixed indentation in example dt node

Change in [v2]

* Added initial support for dt-bindings

Change in [v1]

* This patch was not included in [v1]

 .../bindings/spi/qcom,spi-qpic-snand.yaml     | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
new file mode 100644
index 000000000000..aa3f93319203
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/qcom,spi-qpic-snand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QPIC NAND controller
+
+maintainers:
+  - Md sadre Alam <quic_mdalam@quicinc.com>
+
+description:
+  The QCOM QPIC-SPI-NAND flash controller is an extended version of
+  the QCOM QPIC NAND flash controller. It can work both in serial
+  and parallel mode. It supports typical SPI-NAND page cache
+  operations in single, dual or quad IO mode with pipelined ECC
+  encoding/decoding using the QPIC ECC HW engine.
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9574-snand
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: aon
+      - const: iom
+
+  dmas:
+    items:
+      - description: tx DMA channel
+      - description: rx DMA channel
+      - description: cmd DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: cmd
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+    spi@79b0000 {
+        compatible = "qcom,ipq9574-snand";
+        reg = <0x1ac00000 0x800>;
+
+        clocks = <&gcc GCC_QPIC_CLK>,
+                 <&gcc GCC_QPIC_AHB_CLK>,
+                 <&gcc GCC_QPIC_IO_MACRO_CLK>;
+        clock-names = "core", "aon", "iom";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            nand-ecc-engine = <&qpic_nand>;
+            nand-ecc-strength = <4>;
+            nand-ecc-step-size = <512>;
+        };
+    };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
