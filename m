Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A03C3600B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Mar 2025 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Shqmn+68dQIX7rT6yue7NAP9Dsqjsx6Z/I34fjyzPPE=; b=STTywy3xgPzc+K
	kz8l0LcpR0B9YY0rUnFnz9Le5HEWFa6S4CELml2L41euh+e7U6HWEXCd4rS9AiErlnbRv/RKdem7h
	cAvrCC+YMZ/IgF6Vw3RKsyl8x+HEYXNLAGg7UF72C/CVQapzGF1yEJSGmQobGvx/Re6DLtv5zMe2r
	pllSxJ+Brk2QcgkbMmDibW65hLebVyOXDOZYsmQ55wv12KWKO3LmLpt+C3qK7948hbyiJ9Iodgn9h
	Gyi1a5cDPGe6vH4d7NP6D4mGC1D5vDKHE1RrtEV3PDBtrmDCGPXSRc8vvwfqH/UIH/jf5mC6oerLe
	AIpwonANVUYoxXYGSe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkQr-0000000Ah8b-1WDw;
	Thu, 27 Mar 2025 10:25:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkQo-0000000Ah8I-1uY5
	for linux-mtd@lists.infradead.org;
	Thu, 27 Mar 2025 10:25:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFD7024945;
	Thu, 27 Mar 2025 10:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tsbp848yXM+K/838IvLLfnAYwT3qLnRDwYA8IihXJM=; b=p60j44pPfqOa6jw2
	kcSDzZCs14TNVTJx3PYUEvkHI97mrZyhivOuzOPAMcSEK3EmzVbiDuulHIl61gZZ
	nqrgcJqSJ3we7ZSAtuZ4HSkgEsISPi8CQKJDv4wjys6akRMJNmLgtEJ7J793JSx9
	/fEwG0LLblvAnL1QejhVfaqgwyvYKvyZsJ603FZVydVuDdNR9paWrxyBMshCLKBU
	r3a6Ex7u+039vF2kUpg+YvnWCrfPzi4N+ElBuPLnZSyeLGQWN5hbaJayag3IrBnB
	s+fVBC9QBmXpSJXiHRkigaBzCXCBRDAEfgsxmrZAUnHxaUKJhugBjoIBNXDXWPu2
	G5kRpw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4r6wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:25:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RAPhnB006720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:25:43 GMT
Received: from [10.216.8.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 03:25:37 -0700
Message-ID: <8abf9cff-4931-bc8e-734d-86a2e2ad6763@quicinc.com>
Date: Thu, 27 Mar 2025 15:55:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] ARM: dts: qcom: sdx75-idp: Enable QPIC BAM support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-6-quic_kaushalk@quicinc.com>
 <d964117a-6e74-42a9-a7fb-c08e3ab84217@oss.qualcomm.com>
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
In-Reply-To: <d964117a-6e74-42a9-a7fb-c08e3ab84217@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: enttYmezz8AKXM2p1X5KcCidk_NYKs9Q
X-Proofpoint-GUID: enttYmezz8AKXM2p1X5KcCidk_NYKs9Q
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e527a8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=LYm1BIvnotKkRNd3cYoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=654 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_032550_506107_6F938B16 
X-CRM114-Status: UNSURE (   7.33  )
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

On 3/13/2025 8:07 PM, Konrad Dybcio wrote:
> On 3/13/25 2:09 PM, Kaushal Kumar wrote:
>> Enable QPIC BAM devicetree node for Qualcomm SDX75-IDP board.
>>
>> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
>> ---
> There's not reason for this to be a separate commit
Okay, will combine it along with nand enablement in v2.
>
> Konrad


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
