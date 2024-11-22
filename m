Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4CEE69185
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2024 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zujwm3aoMWkkBh+rnCZcbFHKzgxhtSbUEl9VV4d8OPY=; b=g2LOBZiL63Osyx
	tO5G0aoIo9eB5bWjbx8K2n4Ein+YHgXs6ugycjQkpwqv4r39HPVkDKbQZaUf//qpL6gJMEJM2RF5z
	xNrc1Ch2XQhRkbT+tWdLH+RHUz1vUs0ou79DugwpUyknUn1cIfgoYu4YaPkzlqzFzZtDAlKByE4Qw
	dUHGHzdzcW1CLwS0Mwe/w26VpPs8STtuJWWYSNmVholmv/9dc8INR5LXp6ycvJ4H7cXJEdbsoPycu
	AJuh2tk8jzhMQKFVvF3WeNK3VDvWb2109I+DmMV3z1iSH7Ab7yRzJfB6RKI1PA91OtVBRbdbYGm5S
	AB3Tz/L17bS4MsSFtQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXho-000000031RA-28Mq;
	Fri, 22 Nov 2024 17:44:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXhk-000000031PF-2dhD
	for linux-mtd@lists.infradead.org;
	Fri, 22 Nov 2024 17:44:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMG8DCS003764;
	Fri, 22 Nov 2024 17:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtL69AN9oMCYjCSYEQSCltA+7HfPoe92ivrgMjlg/F8=; b=fZ2YMktjrcYHMYno
	k/VdDwPGSL96nK4wxQaNviDas4dnpUYSejiuRF6Fp1o5bHxdVVyAOXOnyMIgUhMn
	eBDU6nG8kO1euGMVDYgtaL+d9E0KEGEYEp7k/uMGDJCSzXnSmpfTMXXZIy2bZrR4
	MyNb7Ml4cIi11FX0OBY6INkqgY56ADT+/eRtPNMfV2QHSm9FFBaJZEPoKDZRmDaJ
	nu/c8kZH3kZhFD7Le3OIsCaghNKSaeUrASgYrMkbF8pwlqjdDRWiwnsRVyneX4kO
	38fyeea7UzPqbcXNHsD5A9mrLqV4G9W5RBPrSi9rgfrEyCachH2U/oGzgK1vYjEA
	wNwavA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432w72r72u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 17:44:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMHiKVG031094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 17:44:21 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 09:44:20 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Fri, 22 Nov 2024 09:44:20 -0800
From: "Lakshmi Sowjanya D (QUIC)" <quic_laksd@quicinc.com>
To: "Md Sadre Alam (QUIC)" <quic_mdalam@quicinc.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at"
	<richard@nod.at>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Sricharan Ramabadhran (QUIC)" <quic_srichara@quicinc.com>,
        "Varadarajan
 Narayanan (QUIC)" <quic_varada@quicinc.com>,
        "Naina Mehta (QUIC)"
	<quic_nainmeht@quicinc.com>,
        "Lakshmi Sowjanya D (QUIC)"
	<quic_laksd@quicinc.com>
Subject: RE: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Thread-Topic: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Thread-Index: AQHbPLzmOYXrwOalokeDht4Doi7jRLLEGOtQ
Date: Fri, 22 Nov 2024 17:44:20 +0000
Message-ID: <741980c863444f02ad949ff1a36f718f@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
In-Reply-To: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.38.245.147]
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oslOqMu6BXiaXyu2pHflFmTSQxq9f-ML
X-Proofpoint-GUID: oslOqMu6BXiaXyu2pHflFmTSQxq9f-ML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_094428_670460_E317622D 
X-CRM114-Status: GOOD (  14.06  )
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



> -----Original Message-----
> From: Md Sadre Alam (QUIC) <quic_mdalam@quicinc.com>
> Sent: Friday, November 22, 2024 2:30 PM
> To: manivannan.sadhasivam@linaro.org; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; bbrezillon@kernel.org; linux-
> mtd@lists.infradead.org; linux-arm-msm@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Sricharan Ramabadhran (QUIC) <quic_srichara@quicinc.com>;
> Varadarajan Narayanan (QUIC) <quic_varada@quicinc.com>; Md Sadre Alam
> (QUIC) <quic_mdalam@quicinc.com>; Naina Mehta (QUIC)
> <quic_nainmeht@quicinc.com>; Lakshmi Sowjanya D (QUIC)
> <quic_laksd@quicinc.com>
> Subject: [PATCH v2 0/3] QPIC v2 fixes for SDX75
> 
> v2:
>  * Updated commit message
>  * Added stable kernel tag
>  * Added Fixes tag
>  * Renamed the variable from offset_from_qpic to nandc_offset
>  * Set buf_count to 512 in the parameter page read
>  * Replaced the buf_count value of 512 with the len in bytes
> 
> v1:
>  * These patches will fix the following:
>  * 1) onfi param page read which was broken by exec_op() patch.
>  * 2) Fixed offset passed to BAM from QPIC base
> 
> Md Sadre Alam (3):
>   mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
>   mtd: rawnand: qcom: Fix onfi param page read
>   mtd: rawnand: qcom: Fix read len for onfi param page
> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> --

Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>     # on SDX75

-- 
Regards
Lakshmi Sowjanya


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
