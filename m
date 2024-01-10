Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BEC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jan 2024 11:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cGwdZGN0Q0ySDCvRQXTZOgWXpQK8WcoxIqWrddejBUc=; b=I3J2kdbr00Pp0w
	4ydfIonk9tJAVxENMDH/0F1ez0MTRrg6Go1ZDSWbi4EoWZbVYk1OZ+bnSLs3iJPQcDj5IhC3Av7HC
	ymTHmvKFHhFtDMqWrgP882pP66wLIesfpgjLpU0F/1U5c/povVyBZ0QEo3ZWJgIIp+y/Tm7hmSTlB
	3EtYQyh+RI8KZroDnhRmw4jt/6uy0LdftSxBAWnawmoWbM2NPr6deOJABJFQLTbVmyc98JStDcAKI
	VuqdJdvSunx1+EpnZzUoo5Xj5MzcAP+6MR9Jxaj0/lEhh4rY92frxDxl3bI6jppV6y/8ohyH5QbhL
	NZG2Gls1lWWXjEqWqWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWhV-00BG1j-1G;
	Wed, 10 Jan 2024 11:24:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWhR-00BFvu-1N
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jan 2024 11:24:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AA33Bf014480;
	Wed, 10 Jan 2024 11:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=J6w8/2Uaivc+IhxWpx33fUyFHAcLJNahWcoAf86tYLU=; b=lZ
	Gq1KKj+QmNxD0sKY8WW9yn6/tRPSSwTozMn2tMp2Z4RBoTZN4Ogk0RKdQjs4uo1i
	6AZKgWjDwyHr9Dr6Hi0qwIWdlckTS2KoUEALKY59OzlwfREaY7gnMfrBvkF4yIeF
	2/3Rz1etd+LZASdOLvXZ8rxCajQd4GujDNRaluTgY6YWdLnpgl520rLkpo9ck+cM
	5O/JO4BYcYCoLpNn1CLKWfx7JzPnRjUcBfzMkMAhl/G2+4rzDQLxIHlxm5V6PiJe
	rXkJP7GAx5QRLLalL9GjVkCAjFHnMDY5QQU/EZ9PkFlvx056ZlmH6FuE8oI1aob8
	TO5nk2GaMwrz0H+Xr7wQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhs4mg634-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 11:24:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40ABOa1j018220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 11:24:36 GMT
Received: from zhenhuah-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 03:24:33 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_bjorande@quicinc.com>, Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH v2] dt-bindings: mtd: avoid automatically select from mtd.yaml
Date: Wed, 10 Jan 2024 19:21:45 +0800
Message-ID: <1704885705-7486-1-git-send-email-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eVtUjBz7nsmPqilmuphc3XYpZr017eOc
X-Proofpoint-ORIG-GUID: eVtUjBz7nsmPqilmuphc3XYpZr017eOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=882
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401100093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_032445_620462_8D3E32AC 
X-CRM114-Status: GOOD (  13.03  )
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

The mtd binding is always $ref'ed by other bindings, default selector
should be from other binding files which ref'ed it. Now, "$nodename" in
mtd.yaml turns into a "select" automatically such that a few binding check
issues reported because it conflicts with sram devices(eg, qcom,imem.yaml,
rules in folder sram/*)

To avoid the automatically created "select" in mtd.yaml, adding:

select: false

Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Fixes: 7bdc671822e9 ("dt-bindings: mtd: physmap: Reuse the generic definitions")
Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
Hi Bjorn,

As the idea is from your comment, I added "Suggested-by" you.
Please tell me if that's not suitable. Thanks.

 Documentation/devicetree/bindings/mtd/mtd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index f322290..ee442ec 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -10,6 +10,8 @@ maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
   - Richard Weinberger <richard@nod.at>
 
+select: false
+
 properties:
   $nodename:
     pattern: "^(flash|.*sram|nand)(@.*)?$"
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
