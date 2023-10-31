Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25281C4167D
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXeg09ilgbZVK8pDkAHO9u44ZwOX3KOI8sm/WXuQz68=; b=t5ahwauziDtLJU
	GfDHUN9jP9KTb0fWQmTuLLhBGgy5m4uLs5w18Nz4gmEsy0DAtCW/9PZt81bDCbrrr6SUMXYlSiV1B
	E3PbCakn/gW1SnSA9FeIuJkRUI5BNoty+GlDNF+QfE/9b2Jl1JtZJKwLvke18JaLEP7cvI+ph3cxs
	OCe7lpJSIGgazMHeYfOVHNQ9jvrSGarXv6y4R7sjUvuLQXZ1v8lrHEemOgR4MbIXM7qibB/2nth6X
	P3L25v6j3E1aATIqZkqVqhYTGO+Hay6/Ew2RiWtwKT6/8yDWnvB7N1RPE0C4XQCTw44p9Ni2y7ond
	MrHsOG14tFvMRRbPEZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxnT4-005EsN-31;
	Tue, 31 Oct 2023 12:03:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxnSy-005Epe-2o
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 12:03:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39VAAtxE025495;
	Tue, 31 Oct 2023 12:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=Rz7FoOgVVF6qLGQwCv68miCnmwfmImZT149I8dxHdBY=;
 b=J7EKT5Z0XD9PilD5oWKjprMK7zeVntNbEdBQlUIHV6X79pDSCJDQ4N+y85F60BjmWmek
 1rSH4sOndSZnzYjjBnv1Vs3/7STBzneI4fwG41wAc5+4jx6r5W0b25kg0+7/ECcQeiBW
 uXiHsOrgtVVoUi2+3ThM5XZEbCSbfXVJ5+tBoant8taEYKuYM7y8hX/i28uoHNURS35S
 BgF+ZkjYHOIRU268SSXTYYhfTBjs9h+5GK8eYjUW9MIWWQuJPiQ4Lz1r5cXSFAZ4s0I5
 jiP4K8eL6ytmnVAnYB3elMX8rbn3KKfo+cf/8yX2t+jCDy01KIYjrvyhTAgDUQpOL6l4 4Q== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2fuvjc1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:03:14 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 39VC3B9Q005273;
	Tue, 31 Oct 2023 12:03:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3u0uckvvp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:03:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39VC3BKb005266;
	Tue, 31 Oct 2023 12:03:11 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 39VC3BGf005265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:03:11 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 5382A414B1; Tue, 31 Oct 2023 17:33:10 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-spi@vger.kernel.org, quic_srichara@quicinc.com,
        qpic_varada@quicinc.com
Cc: quic_mdalam@quicinc.com
Subject: [RFC PATCH 2/5] arm64: dts: qcom: ipq9574: Add ecc engine support
Date: Tue, 31 Oct 2023 17:33:04 +0530
Message-Id: <20231031120307.1600689-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9sWzIsBXCgwtCbL1n4tm2kR0MpwZAYIK
X-Proofpoint-GUID: 9sWzIsBXCgwtCbL1n4tm2kR0MpwZAYIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_01,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=684 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310310094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_050329_042979_654F940A 
X-CRM114-Status: GOOD (  13.40  )
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

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5f83ee42a719..b44acb1fac74 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -336,6 +336,11 @@ sdhc_1: mmc@7804000 {
 			status = "disabled";
 		};
 
+		bch: qpic_ecc {
+			compatible = "qcom,ipq9574-ecc";
+			status = "ok";
+		}
+
 		blsp_dma: dma-controller@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07884000 0x2b000>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
