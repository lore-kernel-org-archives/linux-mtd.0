Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABA0C54E5D
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TC7ljwZUbU2frcX0RG7jQQ5OWaqaS5MD7CIefcSf+js=; b=wcGH3UxG7Tv8I5
	VIF7hTfhjq+pEnRkQraatSpihqzXAK9AKUoD+O6EeUIrCiFwycoa2R9uOJ5AlkzYAu8cZAmszE9Oc
	yA9CBWxOng5k1YFlNHL99B06l2t4RtrRVB/X/ia8Z+Y+YZEd9ZjTQh5JnoYighlAqtjpySZLa2ZRo
	WHT3n1z32n5RNU94ULRb/ZZjVx5fN9aaFNXYty+W0qtlVYVbn60joqm1YI1/LAxoreP8/ECv9qZW6
	iiVXDMWG3ny7j2MDdvcqcFyxcLa/pkGehCn7K0HQcBpShA0Ku2BwzGBwb0AvGRsf/Hd58JYhjFFWj
	dJB8NbERGEqecDSXWuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWMw-00000008XHr-1jsw;
	Fri, 08 Mar 2024 09:18:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWMq-00000008XFS-3aYR
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 09:18:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4285heYn026848;
	Fri, 8 Mar 2024 09:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=HDziPel+BrFQg/5S2VF+
	aH3HKwoNshDw0bupI07JG7s=; b=ihFG3u1bjc7echEZRlTUrEhSbzpDJlSc7Grd
	hCoCoQT4x7oG0V/AYC0LyFq0H3WMX4pSJxy/5D4pPx2amOvRT1Ol9Ph3KAnHGrr3
	R1OQzrk/NNMaj9KsoLzjZqikpE+4gvrCzkdjsqOL++arvhkH7qbpo66XjtWyBJIK
	c2mvMksn/aEL4EfJYMLRD4JV5jbqIBBWuzyjwrDPnIY7a3OznmmdtDPW5zkc920W
	Nl8NSRS4qO3EIdb66kTlHUaDtrubA9MKVtSb5g4T78RHRVvIFXkVjrxqodaP1odr
	m5aOkmuu6JUJQ8XabN5T0dWZjCbdWbCkCxqC/ROWLF9ARunVyw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqn8m1bn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 09:17:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4289HuOe000776;
	Fri, 8 Mar 2024 09:17:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3wkw6m3h0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 09:17:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4289Htco000744;
	Fri, 8 Mar 2024 09:17:56 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4289Ht8r000737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 09:17:55 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id E2F274132A; Fri,  8 Mar 2024 14:47:54 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
        neil.armstrong@linaro.org, daniel@makrotopia.org, arnd@arndb.de,
        chris.packham@alliedtelesis.co.nz, christophe.kerello@foss.st.com,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        quic_mdalam@quicinc.com
Subject: [PATCH v4 0/5] Add QPIC SPI NAND driver
Date: Fri,  8 Mar 2024 14:47:47 +0530
Message-Id: <20240308091752.16136-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WKfuC7vJmFC507W01c4ePmePgwF7gq1K
X-Proofpoint-ORIG-GUID: WKfuC7vJmFC507W01c4ePmePgwF7gq1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=543 impostorscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_011816_990443_5F97C690 
X-CRM114-Status: GOOD (  10.60  )
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

v4:
 * In this patch series fixes kernel doc for all the cmmon api
 * Also fixes dm-binding commit message
 * Fix qpic_common.c compilation based on config

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
  spi: dt-bindings: Introduce qcom,spi-qpic-snand
  drivers: mtd: nand: Add qpic_common API file
  spi: spi-qpic: Add qpic spi nand driver support
  arm64: dts: qcom: ipq9574: Add SPI nand support
  arm64: dts: qcom: ipq9574: Disable eMMC node

 .../bindings/spi/qcom,spi-qpic-snand.yaml     |   83 +
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |   43 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   |    2 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   27 +
 drivers/mtd/nand/Kconfig                      |    7 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/qpic_common.c                |  834 ++++++++++
 drivers/mtd/nand/raw/Kconfig                  |    1 +
 drivers/mtd/nand/raw/qcom_nandc.c             | 1440 ++---------------
 drivers/spi/Kconfig                           |    8 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-qpic-snand.c                  | 1041 ++++++++++++
 include/linux/mtd/nand-qpic-common.h          |  547 +++++++
 13 files changed, 2729 insertions(+), 1306 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
 create mode 100644 drivers/mtd/nand/qpic_common.c
 create mode 100644 drivers/spi/spi-qpic-snand.c
 create mode 100644 include/linux/mtd/nand-qpic-common.h

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
