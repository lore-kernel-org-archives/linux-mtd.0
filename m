Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B0AC369D3
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 06:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJy1lYp1lK/VlHMnP7vUj8fdnJW5Wtyw0EFCytqWNqw=; b=0imA+B+iDPdxov
	Zz1AaP7Ozfksi2kXHFc2Px2zEjW5PzccQW3FxscX2+i8lnzQd6/AtawZcFB7onipaHxddFhu9QtOB
	U6QGXOK775I4KGM+yt8uKm48MOfaTGjZHRWyXxgwJxDU5LS/ez+Yq4l/9z7ydqugNsVL9JxXpKzs3
	UJxQQ40BIroNtNhxyaDh0zug0fOp8GfTwCUeCvF+BWu4TOlS1I7n5RP7q022M5SaG+1aeHV6WFCG2
	gE+/QRmq2H4yOWFkjgp2Qpb8pN0p0D9KpqY6EsR8bMcPLNqtZfY1DcFbJzFytRpJYP5n1TJUzPzUK
	cKjzq8ZJMLCHkTW+1ppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U32-00000009Q2S-27Bi;
	Wed, 23 Apr 2025 06:57:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TeE-00000009Lc1-1uSv
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 06:31:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i7cY016800;
	Wed, 23 Apr 2025 06:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V7S70dp14c15cpZzwHjjn8rD
	l7ku/WQWo7T9YgP2qnA=; b=LTw7wWp+EHnV/gDgLbd2O6jrYn4AwXvFJ1cTFLtG
	mXGYZ8Np7lXnzsDaMql4t/MnskLlZRf3rhPUPbZt5O+5OdzHWaMg77eUBlIKXude
	t3x01lzzLL/ARB4juMBRRP51h0M2FvapLGkNQw6KSGKAYqglAXUwavEoOXJ7y99K
	f//Ztcl8DlQoA6N0qR1Ua9VwHfhuSewUMOR/0q0gpWSnfCh/gh6HPWYK+NsicB7J
	qF+VlAgNokbEv1T7ghWpiOPrDMc/x0mT12tfrv3zrcuYENrNwpiC/IfYvYftjx3v
	tfbohadZ7+E06Ca2vR4WS43xQkI1wvNBEKmbi1XLBp5pJQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh013xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6VmfO025615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:48 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:31:43 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v3 2/5] dt-bindings: dma: qcom,bam: Document dma-coherent property
Date: Wed, 23 Apr 2025 12:00:51 +0530
Message-ID: <20250423063054.28795-3-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
References: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MyBTYWx0ZWRfX1SU7JBSrp9JS A4dAJLYytlGkrvr4FnD1qMvU2fafqlP+Kn8zaKfSA3eKAiU3AWfHwSD8mq0vfG0Bhf28SU56jqH DIzu1ylb06xVVP06Utm/wAVULkOjcM0E/aXMLP+1SIJVwLuAS02AFjYICRdHJ4S+/UBC/OO/cIS
 NfbdO3JFAtkW2AOomVr+jBvq3KNUVJOy/Eze4i329fPbznZihgsm/vF6MUchOlqCHVn//HcS5De if0H0g7lpeZvQgA/Qnhm7Xu39UozvuRSoo2APlDfg5AxbArxhYkf4/6icD+TMrzPrar4v1ridhm fpK3sTwgB4t/ykX0rWefOeOTyf8BikYGxOVqytm1zhopj0WNGRNDpO8p5OY+c88rWt1NXWH7rLb
 dTaJKO7noUnuDDjYwcUEOp8r+AIcC3ZRJlhOBk5QuzURVOqOz8Vzhj6WHgyOcHCVllq/EBIi
X-Proofpoint-GUID: Kp8AEuM4oq0ahRF5JW7Vefvbetu96Im_
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68088955 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=s6VSgM3AptX_uwP4r18A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Kp8AEuM4oq0ahRF5JW7Vefvbetu96Im_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=860 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_233154_616919_5259EB32 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

Qualcomm BAM DMA controller has DMA-coherent support so define it in the
properties section.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 3ad0d9b1fbc5..f2f87f0f545b 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -42,6 +42,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  dma-coherent: true
+
   iommus:
     minItems: 1
     maxItems: 6
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
