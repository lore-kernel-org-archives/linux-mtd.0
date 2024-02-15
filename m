Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0171BC48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avr1+2XphSr7mQpcNALlEVEA95ITPmAIXHm5+ySuswE=; b=TlbPCWdDtx0CF/
	cQCzm0UTrpLadkRVva3jucKXUuUvW7WhzRSMQ5z7do0fDxSFlg7661Emv5h6V1BHtPtPdoDvaAJrC
	8YovaWkUxt6wn+ilBojkmX6nxv/dy8Szuq1ZlUEbuXxa+4Xiktn/V9ea1F8y20ymJOYI3G8Kfmq2b
	I00rguzlJuZmsBwnUMsJn2JJSm3LgEIlLCHE1T2vQ0Y9D99Jyd5ZdtoziX5DM4FqU/1yq5lP5MZiB
	irkcjDtdUBQL6BlgS2MZCBzCRfaUF3BP+9B+2nrpuHbx3t3aVtj9UVYnCdPtod/2sOEaPMKYQPFSU
	QiDSMHBzJbi67Qk2CX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac7E-0000000GRkz-0DM1;
	Thu, 15 Feb 2024 13:49:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac78-0000000GRhf-0XJn
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 13:49:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41FDf5Vg029729;
	Thu, 15 Feb 2024 13:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=UP6W8Qm
	8762PwBscluUW90igYSOn17R2qh15DrFj1KA=; b=IgI1gQ0VnOoSN65dJzzG9dU
	LRYvEWj21Z+2ZVRhY2bs1XImGd4GhlGr7XnVMfldGWzYY0FrG16ylyGdCfGjjlC6
	c17dfh3V7f7d2b+y5u4u3T/6cnwP8E94n9zOMmggNRrP4y4lRpsRXRXCNvypgfMw
	1PvvZuuoJdlgRmsESJz6sfdp/3yf7nqIN18nFhPYhu3WuYfCJh5CLOIn/zGT1Yfi
	9WGK0g6cdG2In+0k/8nd07fd2pBTQhJQcbjVLyvqkwOnWu/4CoEhDhA0FJQal/AG
	SMljwrriSoqvrRv+cClqjdrY9Kk/ehq50hWYKi6Hc4JG+vFPqeDopmHwbZWc+0Q=
	=
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w974j1hyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41FDn9w5009979;
	Thu, 15 Feb 2024 13:49:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3w627mb92m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:09 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDn9WG009974;
	Thu, 15 Feb 2024 13:49:09 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41FDn90t009973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:09 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 70F8C415ED; Thu, 15 Feb 2024 19:19:07 +0530 (+0530)
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
Subject: [PATCH 5/5] arm64: dts: qcom: ipq9574: Disable eMMC node
Date: Thu, 15 Feb 2024 19:18:56 +0530
Message-Id: <20240215134856.1313239-6-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1QBL-_SnkUpxoedTM1dtZRlyxDp3CRQP
X-Proofpoint-ORIG-GUID: 1QBL-_SnkUpxoedTM1dtZRlyxDp3CRQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=631 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_054922_190193_6BF5BF51 
X-CRM114-Status: GOOD (  11.93  )
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

Disable eMMC node for rdp433, since rdp433 default boot mode
is norplusnand.

Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 1bb8d96c9a82..e33e7fafd695 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -24,7 +24,7 @@ &sdhc_1 {
 	mmc-hs400-enhanced-strobe;
 	max-frequency = <384000000>;
 	bus-width = <8>;
-	status = "okay";
+	status = "disabled";
 };
 
 &tlmm {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
