Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB0AC48BF6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 04:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nIhWD/dzgXduSKCYaRrgbr3f/Ly0ot0kpaLFQi8NMtQ=; b=khzkgDS4nTptWh
	55ovRsOfhKvqc0A11OpjU7dm028EnCnuuh8P8JL6Pcwvav3O1/AY/Ap8SEgXICWIu6BZU62AmEJpN
	FqjzTVyS6OWTWxZO1wmINDwfWUf9ObYXiNwfOsvVr99v7eMXhLFupYUGtANgxDKGJjSyCxTzO5ent
	xFwpF7ZOdNKoSbmGa0M4N/Y1VfdqweRJILiUOrA82fLeQGE5863tpOfYwRuDlYSkGstllxhhj9mGi
	gmWZtT5oS0v/XuY/qDBtYc7EHw+wcdiLZ7tUeLlSvBaL7VtNbyHItxJzUx4ImzB8dIAVQtDnCDecm
	LbE9+EVCA8ooqY5AX/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri5CT-00000002wwF-2CnN;
	Thu, 07 Mar 2024 04:17:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri5CQ-00000002wuS-1602
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 04:17:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42745gc1013144;
	Thu, 7 Mar 2024 04:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=VcB0Az2E5kvwEhji6bm9
	s9YDP1iRfXCtBOxnVmBp1jA=; b=cXFIim5Kkv/oZctiIiWzG9Htm60m3y8bMIr9
	sULIheQomehD8BGlC8W4vjiIt1qQfKytw5iu3+njlcE1KJ400cvEDCXmw9VttmOk
	kDtcRGy7xffcAh8VCgHq2MmLsA6yOFwayhVoppJPKayBtXD64Q4XcrKC1oP99cOB
	g93i9ThRfqMvzBMll55ng/rc+VLOk/UHZiW9rr9ieumXQpJrHEhCxxIFpGFHmdWb
	apSpNR6UK4eWNCq+32DH226w5GAsT4LsC0elo0GkOl3Pvvv/FxYbmkIhAsfYOo7u
	PRdzGpEARHWE+BYdFIjgq5H+9a169cSo+jK5B0C6pWPjFuig8g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wq0u3ghss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 04:17:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4274HU1k009261;
	Thu, 7 Mar 2024 04:17:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3wp060d47a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 04:17:30 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4274HTp3009231;
	Thu, 7 Mar 2024 04:17:29 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4274HTlC009224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 04:17:29 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id C547D41356; Thu,  7 Mar 2024 09:47:28 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Cc: quic_mdalam@quicinc.com, quic_varada@quicinc.com,
        quic_srichara@quicinc.com
Subject: [PATCH v3 0/5] Add QPIC SPI NAND driver
Date: Thu,  7 Mar 2024 09:47:21 +0530
Message-Id: <20240307041726.1648829-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Nb7AhbZ_HhXF0o7cg6WR4083uJMMIdSB
X-Proofpoint-GUID: Nb7AhbZ_HhXF0o7cg6WR4083uJMMIdSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=459
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403070027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_201742_464273_7FEA0085 
X-CRM114-Status: GOOD (  11.05  )
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

v3:
* In this patch series fixes multiple things like
  added clock-name, added _alloc_controller api instead
  of alloc_master, made common apis more generic etc.

* Addressed all the comment from v2 patch series

v2: 
* https://lore.kernel.org/linux-arm-msm/20240215134856.1313239-1-quic_mdalam@quicinc.com/
* In this series of patchs we have added basic working QPIC SPI NAND
  driver with READ, WRITE, ERASE etc functionality

* Addressed all the comments given in RFC [v1] patch
 
v1:
* https://lore.kernel.org/linux-arm-msm/20231031120307.1600689-1-quic_mdalam@quicinc.com/
* Initial set of patches for handling QPIC SPI NAND.

Md Sadre Alam (5):
  spi: dt-bindings: add binding doc for spi-qpic-snand
  drivers: mtd: nand: Add qpic_common API file
  spi: spi-qpic: Add qpic spi nand driver support
  arm64: dts: qcom: ipq9574: Add SPI nand support
  arm64: dts: qcom: ipq9574: Disable eMMC node

 .../bindings/spi/qcom,spi-qpic-snand.yaml     |   83 +
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |   43 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   |    2 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   27 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/qpic_common.c                |  789 +++++++++
 drivers/mtd/nand/raw/qcom_nandc.c             | 1440 ++---------------
 drivers/spi/Kconfig                           |    8 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-qpic-snand.c                  | 1041 ++++++++++++
 include/linux/mtd/nand-qpic-common.h          |  547 +++++++
 11 files changed, 2676 insertions(+), 1306 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
 create mode 100644 drivers/mtd/nand/qpic_common.c
 create mode 100644 drivers/spi/spi-qpic-snand.c
 create mode 100644 include/linux/mtd/nand-qpic-common.h

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
