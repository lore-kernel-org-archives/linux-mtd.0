Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786C9C47074
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sDP/oZqQw/FzKZ8GGBI1DaujEC9VV6RwATPDRkU3zvU=; b=KlO4uS0OH9G3eH
	QcGExy2p04UCR072SQnek7ytvu37jWYW94HfdvcG50PhUFqNgeqgmM3Y8AsUCJ5mOLNdLYV8F/L0P
	CXQfG0p80fgd39tIV1LVwzHKY2+k2EbPraeaYN6RKqgPBSBkjYwOCwqJ7W3OhlZas5sVm2F7/qa6S
	aEQPxslyl3SQrdblt+JPmUF3rtaJJOobYw0X1iOtNkmdBepZzdh1jIbvFe9tKCIoASd/VrvhnNihH
	49Uub0J9Lyiv8LRAhWtOxb0qZYe6vOg32lz+9syU1dTxfy8EWzt36BgXonLa2W5eJ4YS5CS5Bwi2N
	FIlhtMZ+j15pYW/+A6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLov-00DhxT-2Y;
	Thu, 04 Jan 2024 11:23:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLos-00DhsN-08
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 11:23:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4047efg9020092;
	Thu, 4 Jan 2024 11:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=aTyOt6+SodX6bP52NpaT44ugzzw6dI40D4PGBU1bCzU=; b=pO
	uVTLfNeu6BowS6RRhUJkCKR35oVUAjzDehsKfpC5xwRn4Nm4P25e44WN1Msyv8la
	dP/rWmLuKTX2rwXCIHlpIiEpSJC4g8P+LzMTNvNEjAiROLso+HM6bGpuuCLJoyyV
	Ys7ugRSvV5XYccwls6nFB6not6lBrjhITVGlt4vgg5fH3RLp+meM0HB5EIG5Vc6D
	rvgpyU4EFsqf3+c2tdYhEh6hO3CVgFyNpS5blV/DaIGZ69qweq5L7I6KmXrekAKO
	apwN6ajJv8+IQvgf/OH1MEDx+ZemqkBNesSoUqXLxz4rbatKHprV4mKYbe4MilKl
	HSiN05jqZk8QrOVHsUfA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vdra38kcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 11:23:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 404BNGBI028553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jan 2024 11:23:16 GMT
Received: from zhenhuah-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 4 Jan 2024 03:23:13 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_bjorande@quicinc.com>, Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH] dt-bindings: mtd: Change the schema for nodename which includes "sram"
Date: Thu, 4 Jan 2024 19:23:02 +0800
Message-ID: <1704367382-29979-1-git-send-email-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FltXqd4Vq79xg_8J-GVunkFoQIhGr56X
X-Proofpoint-ORIG-GUID: FltXqd4Vq79xg_8J-GVunkFoQIhGr56X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_032326_208283_B3501960 
X-CRM114-Status: GOOD (  12.67  )
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

Node name which includes "sram" not only represents MTD devices, but also
lots of sram devices(eg, qcom,imem.yaml, rules in folder sram/*).

To avoid the conflicts, change the schema as:
 - if node name includes "sram", must select "compatible" to match
(I have listed all "comptible" string in mtd.yaml by searching
drivers/mtd/* to find applicable drivers)
 - if node name is nand/flash, use "nodename" to select.

Fixes: 7bdc671822e9 ("dt-bindings: mtd: physmap: Reuse the generic definitions")
Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
Hello,

Tested a few devicetree nodes, which confirms:
"qcom,imem.yaml" which in sram/ not matches with mtd.yaml anymore.
All nodes include string "sram" must have "compatible" which listed in
mtd.yaml to be matched.

Current I just modify the rule for "sram" as it is definitely conflicting with
rules in sram/*. I have not much backgrounds on nand/flash whether they may have
similar conflicts.

 Documentation/devicetree/bindings/mtd/mtd.yaml | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index f322290..1704437 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -10,10 +10,28 @@ maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
   - Richard Weinberger <richard@nod.at>
 
-properties:
-  $nodename:
-    pattern: "^(flash|.*sram|nand)(@.*)?$"
+select:
+  if:
+    properties:
+      $nodename:
+        pattern: "^.*sram(@.*)?$"
+  then:
+    properties:
+      compatible:
+        enum:
+          - arm,vexpress-psram
+          - cypress,cy7c1019dv33-10zsxi
+          - microchip,48l640
+          - mtd-ram
+  else:
+    properties:
+      $nodename:
+        pattern: "^(flash|nand)(@.*)?$"
 
+  required:
+    - $nodename
+
+properties:
   label:
     description:
       User-defined MTD device name. Can be used to assign user friendly
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
