Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A8BC25B74
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwx8wuSReY3NCEgwShJMX+NYaPsKZMdBTQYYzk8rZ6Y=; b=lauW3slIccESvG
	XSJiqUt6mjHvkRV37hdA6Y8JUIAOFL7Tij9NF+8poE9RlIWlBgd92nFxcNhX6YCz95Yoaq5wne5hT
	VP5IgtON7SGMqhMtrKl2f/zKB+Fy0j3xaRvIWqPDL6itdEu6Npm+J0HALtBJ1KoE915gvy6KPFIHs
	04s5tiq5cwy4U5XsWofwJLlinzr+a4W6ELIgE2oTut027c98rh12oOsKNA1MghEmYSFwtMd/MqKvW
	W32dvDIyyDfea0UWJ0m/N30dY9BqfF+A2y217KxeBI94YEt1yVNKuuyvqpf49B0kdUmHxqhKOViDi
	f7n9X2+H2tnkSfg2OBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Oek-0000000HSCn-3aHw;
	Tue, 21 May 2024 12:31:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Oeh-0000000HSCJ-3jSO
	for linux-mtd@lists.infradead.org;
	Tue, 21 May 2024 12:31:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L3aVf6030616;
	Tue, 21 May 2024 12:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IlNoFCAo5nlH1H6C7luAGx5l0cpdPI2BaL3sVZ5ChUQ=; b=OK
	nzGjWb/xQ3SL22yP1AOVCAM5+gVyAZHPnyFuj1TYnDxBCWe9hxm887WNawshFbrb
	14Cs9hjVRCPM1sqYfqvsCuqM8lsc1bcgwxyUb617i5zi0WfqTsDCartXQgriQ/la
	fM/t3979B0oaUnOcqjha2f3/TSlAUzAZomXqe8JoRMSsx/O3Cbby/Dz0xDCwkI8N
	cY4aB1zAEIujCe9PvtSCrwV05APVYRDc5wWOwURfeCaoXufo892lAELuU4iNDaSF
	wuyz5yt2cmcWNyrERzFHhakhzX78lQDoNVsRrTWnjPrQA9NvCoC3U//DS9YdZRH7
	Fk6YfjoSTnGl99RYbIsA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pr2nqmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 12:31:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LCVbnB004681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 12:31:37 GMT
Received: from [10.216.52.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 05:31:30 -0700
Message-ID: <abead689-de3f-eed1-fcd8-6347a2518ce6@quicinc.com>
Date: Tue, 21 May 2024 18:01:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 4/8] drivers: mtd: nand: Add qpic_common API file
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240521105532.1537845-1-quic_mdalam@quicinc.com>
 <20240521105532.1537845-5-quic_mdalam@quicinc.com>
 <38517491-678e-4aba-ad5a-f7cb7519ef1c@kernel.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <38517491-678e-4aba-ad5a-f7cb7519ef1c@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L6mg3MFywzwiotuHjWfx-Ee_7MeP3vZ4
X-Proofpoint-GUID: L6mg3MFywzwiotuHjWfx-Ee_7MeP3vZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=802 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_053147_973874_98FF4732 
X-CRM114-Status: GOOD (  10.13  )
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



On 5/21/2024 5:24 PM, Krzysztof Kozlowski wrote:
> On 21/05/2024 12:55, Md Sadre Alam wrote:
>> Add qpic_common.c file which hold all the common
>> qpic APIs which will be used by both qpic raw nand
>> driver and qpic spi nand driver.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>> Change in [v6]
>>
> 
> This is v6, but you still keep prefixing in the subject as "drivers".
> Drop it finally from all your patches.
  Sorry, Will correct in next patch.
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
