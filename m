Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E9C41513
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9zStofPuf5NilnVuCtCxhVWsWnuyuRJILQURdZs9lc=; b=GQZqz9H+xbd6A7
	uS8Mty0j9hXGh5NkKR7CfaYnFae/yfzCDSvbxVZNYDvo/V+9aqcqCiq9zt/HJn+oW7Z3Os4wkvf//
	iAtu6cOZ96CkklFHpmr/neOhfDOXovdz44Fzt/4f6LJ4eBsx0MHIV2pfuzLJDkoTuqPenchvbmO+z
	2YqKm0DhurpE2glBnlNh2ixuUFE9dX0EWK5VahUmHJU/KFllBt3Yff/bsdq2MnFSgO+QLx7CC/Zip
	52Y1t8HsKMCR7oU05mTrBNdtTfL90l+dkYZOP8PmruSQHkRcskmgqOayx4QSCPJ96IGXbqgUpdfJA
	5TX5k6rA2gShaEWFMCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4cnU-0000000EdVz-1Img;
	Wed, 08 May 2024 08:37:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4cnP-0000000EdQl-3kB7
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 08:37:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4487FTOk019368;
	Wed, 8 May 2024 08:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=f+C+a3L
	u1ZKQmDWTB2U4WfBYAPRmdEbqpFrqHfIl3hI=; b=X0q3Ht0BWkgy57WWjLZ9lcd
	Qbvwxh/5Z4sPFeC5Gmvzvp4TzW4ymsF81t5FWSKG3x1smWc1RnPqexH5hJ2GdASb
	cb/HenoxmBBWihDUrM4sNOY6+OHXaimdmb3WfXwuKv1P9sfgJmEkKk2b2D3qz6IQ
	uUdl2df58AtAZcLzAXLH04l3ZZ5ye4IV/+EaZElN45l+40NGU7FdJTb3I4JHEI5l
	CGRJeu817ZhXcOS3OR+nDX6Y9ZdbtZC/vAOGKLgXckjYkSQX3BJvPgKS+7prKeXZ
	ww4B6y7l3KNeyeGypRN1dIvJpnSzOLLktuwZ/29whYsYF/se6lrt4OhiDX6tc/g=
	=
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg8scxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 08:36:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4488afVk001209;
	Wed, 8 May 2024 08:36:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3xwe3kwch8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 08:36:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4488aedg001176;
	Wed, 8 May 2024 08:36:41 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4488aek3001169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 08:36:40 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 0BDA041359; Wed,  8 May 2024 14:06:40 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        quic_mdalam@quicinc.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v5 1/7] spi: dt-bindings: Introduce qcom,spi-qpic-snand
Date: Wed,  8 May 2024 14:06:31 +0530
Message-Id: <20240508083637.3744003-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508083637.3744003-1-quic_mdalam@quicinc.com>
References: <20240508083637.3744003-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L5ODaaXgOruwlfWXsllZFMR4MvdCYFQ8
X-Proofpoint-ORIG-GUID: L5ODaaXgOruwlfWXsllZFMR4MvdCYFQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_04,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_013703_974075_C729988F 
X-CRM114-Status: GOOD (  14.22  )
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
Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
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
index 000000000000..f0d9f7643849
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
+      - qcom,spi-qpic-snand
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
+        compatible = "qcom,spi-qpic-snand";
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
