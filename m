Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD660C48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHmtnq6gn2xR3umwACyhed2fKHQdbK7Uzm4v7pRLymE=; b=4TL6r6vWZjsr7V
	F/eT8vyTFEFMBMHCKFKSnh+bXkxKY8P2SB5giZ6ej1sc2nOt+thuk6JLxE3nPfz2VaD+3Mm9t7ple
	z93Di1qd3AVI6buVkK3rDVa43BROBCZU2WbRkRFsnBoAJyF5RqQKcko5uuz5zgZHoOb6MzqbCasKG
	cb4igaK4ojxuyeCCiRgwGCgbGrwsRC+cHmck2pqQnx57Rjju/3JhYStU5DqqRPR5JCLc7sV96qwjf
	J11d5MGBDymGR8UgqHY26RZhm8J/hkDFuJzORbCe5TQBGqHLPeSy9OWP+FFRY2MJWOrpNhnA6281N
	zdSJ38kvE2SrE42CaAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcP36-0000000EdRA-3DGQ;
	Tue, 20 Feb 2024 12:16:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcP32-0000000EdQg-0wy6
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 12:16:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KAweER007356;
	Tue, 20 Feb 2024 12:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=AO32al+Us7Zr/WvVNVqK8EIUSqXn1K1PdLFIuOU3tXs=; b=k+
	i4EtAadU3l2YApB/YDUl9KqyPlgkngnST7tx5736pUq6kjXvBXuduvpLSYSlQwVw
	yH3KDtq4H1b3dOL1c02mFs6dVMYAzJykDq4+SWRuwhxQUtUJguuEzV4pgZggakcS
	LFxupIAevkajN4hbo628RHPXWZOd7mhlxJI5xiVRD0u4HjAVpTPj0YYCJIR9iihm
	+dqC0RSNf0pAQqzAPX55VZ652qpfCvw/PRFkFHq+ptV7GAVodlFEVUyW4LYt5DDD
	hudbyTS2ZJ5wzNiE8pG2VuTYSqklozHfkCf/q3YPSCBa6GmwR+lyXo2G+8qaowxC
	NYx+mqFLj11MUWcEEpKQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wctmtr5du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:16:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KCGPFR018880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:16:26 GMT
Received: from [10.216.16.129] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 04:16:19 -0800
Message-ID: <8bc1f81e-3f41-a1a4-69cc-2cc1ecd112af@quicinc.com>
Date: Tue, 20 Feb 2024 17:46:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq9574: Disable eMMC node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-6-quic_mdalam@quicinc.com>
 <CAA8EJpqV=w38TqjfTp6OurAwHjR87PpmQTs2jUo6O7vF1-T-WQ@mail.gmail.com>
 <584a5308-c73d-4559-bb61-21d07cd63d6c@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <584a5308-c73d-4559-bb61-21d07cd63d6c@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0owUN9JrF2nGv8lGvUMjMvU4ZMm1fcva
X-Proofpoint-GUID: 0owUN9JrF2nGv8lGvUMjMvU4ZMm1fcva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=604 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402200088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_041634_224464_B56826FA 
X-CRM114-Status: UNSURE (   7.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2/15/2024 11:28 PM, Konrad Dybcio wrote:
> On 15.02.2024 16:00, Dmitry Baryshkov wrote:
>> On Thu, 15 Feb 2024 at 15:49, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>>>
>>> Disable eMMC node for rdp433, since rdp433 default boot mode
>>> is norplusnand.
>>
>> Are they exclusive?
> 
> Even if they're not, having access to the eMMC/sdcard would still
> be nice..

   GPIO are shared b/w eMMC and NAND so we can't keep both.
> 
> Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
