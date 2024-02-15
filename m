Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6776BC48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qn2nMsKeE/m6wXO/USqmkLRQ4y57tTFUbG0sckSC5Ng=; b=RWwHNZfOBIgNTz
	CIAInn53s586u0wD+2wV7Xh77A9x4Th0NRB1gZpm0kEjmjklxoM8NQ/2nZpNQwRNBJnDUzt3eKukT
	IjU8yDOsz4lCaJUMBek2HgmQlx2xnl6k74pjuNx+DCx9cPIvGNxlPpkDUGP8dDV83sgEpNamKvLkR
	fQ7eAtrOMcHGnCsImmImG9qLLYpZNczEH2+nSNKb5smCI937EtKgcOjtyI1UKVDdOar4F9dnL5tq4
	gtdCfUftqMog3VL8+cFVD3TOvTlfLRNBjeBmzHGPYf8aKVo8vrrAGVkxJdoroO3uK4be8CnQZ4p3x
	r2xZ8mh+dJXw+26PyRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac7A-0000000GRjR-1cd7;
	Thu, 15 Feb 2024 13:49:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac77-0000000GRhg-0hvb
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 13:49:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41FAITGq004803;
	Thu, 15 Feb 2024 13:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=RcrWZqECuZv3JnbHoWbT
	66Q4is1ZH+pdI5bP3PIcij0=; b=WA5t/QpxKOe2Om+EHXKaqL+uFjTUnot1m7rB
	VEqExolW+bt9jECrlrSKDfheCqq9EksOVuJjL3m33XPGj4CZbNaprnWpN1tWwxOM
	MEdyVkjWsZ+LK8eUeBy/vF+xcW5srRXP3goZLUvmOy6bmASo6vVQDN/xaPfhsuDi
	k1/I3wkDnVpZjRD6fYqwwoDg+L1LNJeZS2LENmsYJsE+vWqS4dJXVv2bAxmCoWur
	kn6Z/0cs/bONFP7WezkeqyC9frXi28LIunXFzq5aCR1PSKe2QIN9ZDV/X47i8nAJ
	pvJEtWzTu/iDyauR4NXCNfB8Hr1TO3roXSCWtyjAzPv2YkWtIA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w96c3snrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41FDn8Zt009961;
	Thu, 15 Feb 2024 13:49:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3w627mb92b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:08 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDn8J5009930;
	Thu, 15 Feb 2024 13:49:08 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41FDn8K9009925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:08 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 5DAA441254; Thu, 15 Feb 2024 19:19:07 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        quic_mdalam@quicinc.com
Subject: [PATCH 0/5] Add QPIC SPI NAND driver
Date: Thu, 15 Feb 2024 19:18:51 +0530
Message-Id: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ek8biRZv5ykBYakJkOmo1PCtQqOcYkam
X-Proofpoint-GUID: Ek8biRZv5ykBYakJkOmo1PCtQqOcYkam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=862 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_054921_238681_D8A967E1 
X-CRM114-Status: GOOD (  11.82  )
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

This series of patches will add initial supports
for QPIC SPI NAND driver.

Currently this driver support following commands

-- RESET
-- READ ID
-- BLOCK ERASE
-- PAGE READ
-- PAGE WRITE
-- GET FEATURE
-- SET FEATURE
-- BAD BLOCK CHECK

This driver has been tested with dd command with read/write page
with multiple file size 1MiB, 10MiB,40MiB etc.
Also tested with "mtd" command like mtd erase, mtd write, mtd verify etc.

Need help to test these all patches on SDX65 and SDX75 platform.

Md Sadre Alam (5):
  spi: dt-bindings: add binding doc for spi-qpic-snand
  drivers: mtd: nand: Add qpic_common API file
  spi: spi-qpic: Add qpic spi nand driver support
  arm64: dts: qcom: ipq9574: Add SPI nand support
  arm64: dts: qcom: ipq9574: Disable eMMC node

 .../bindings/spi/qcom,spi-qpic-snand.yaml     |   82 ++
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |   43 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   |    2 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   27 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/qpic_common.c                |  794 +++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c             | 1226 +----------------
 drivers/spi/Kconfig                           |    9 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-qpic-snand.c                  | 1025 ++++++++++++++
 include/linux/mtd/nand-qpic-common.h          |  548 ++++++++
 11 files changed, 2547 insertions(+), 1211 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
 create mode 100644 drivers/mtd/nand/qpic_common.c
 create mode 100644 drivers/spi/spi-qpic-snand.c
 create mode 100644 include/linux/mtd/nand-qpic-common.h

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
