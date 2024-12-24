Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618EDE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 05:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TP7tVud6TbancR5Y7GRlc1jC/HS84VtWRTe5gaGYFOg=; b=OQi+vBU6n2nP6w
	o9lZkbjXtQCWNz1+dTB2a1cLxZgCnrjrTpWRtKK4lJyJW6btEDhiMRBq5N9GaHOFM2yKSFQxt6kMg
	w9E9gNHV4YGr5m3PT+ZKzoxvFaeCFY+JMqXfkfeMrHL1D6CCNKYwlXQrclYwyIq1tYB0zkKxl/XcB
	RWdj4zmq3jMcft9KTc7RZDeYsykFY1JWCDcrRm2lJzzkv/FABpu3QZEaI7Ld7xI0C/Khcazb8VyqJ
	OrhblpHpQZI9X/4429D0zsV5jIgdsUozcMeSJSyvVilXR2j8G/nP/rcY5cOswWPP5wxRW5vx+aC5Q
	9Mfu8mSWRKQvdyXxvfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxOA-0000000BIJZ-1eCw;
	Tue, 24 Dec 2024 05:23:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxN3-0000000BIAt-0tWM
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 05:22:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNI0bsw029776;
	Tue, 24 Dec 2024 05:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aR69xwtjfHdKTs0pN5wzidfUIIuH6Dzp2htNeRoFPqs=; b=RtmeyNHn74TxQeRE
	qH+YUb2cTvWQl5J3oEyaQpMHtvIn/4bEApRMtsqCUr8fecNqKzZcthf+Gs70X+Wy
	//QMDhahF8nRVAcQl22+JagrY3ApnWvjkhLqpD9UZwzg9qPtRkjfGGyYNEqARCks
	e9VLnDQOvX8E74kSP03UTXfYl0EENG28GQQ9ZvSoZrEmOGpxoX9yKQtYg9/xs/Wa
	Pf1uZsDBN7S6bTMsRrVSgA/jB4jzUHXN4ImuMfZc81VI+v45LDJQ8WfR/Ze8a4ja
	GWCoipY3DHSPa6eNvH8w1hCtD3JfZ7K25lXfdE11lcHlhAPsyCbMM1ZFrvvFuvfz
	zUCiNg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qcrxsg9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:22:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO5MA7X029574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:22:10 GMT
Received: from [10.50.31.100] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 21:22:06 -0800
Message-ID: <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
Date: Tue, 24 Dec 2024 10:52:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241220093029.z4zsr3owdnqll2vg@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241220093029.z4zsr3owdnqll2vg@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tkWUcyWE1hEi6b855e7JPhe8Zie9bVGl
X-Proofpoint-ORIG-GUID: tkWUcyWE1hEi6b855e7JPhe8Zie9bVGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=942 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_212217_269040_E86105EC 
X-CRM114-Status: GOOD (  13.40  )
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



On 12/20/2024 3:00 PM, Manivannan Sadhasivam wrote:
> On Fri, Nov 22, 2024 at 02:29:30PM +0530, Md Sadre Alam wrote:
>> v2:
>>   * Updated commit message
>>   * Added stable kernel tag
>>   * Added Fixes tag
>>   * Renamed the variable from offset_from_qpic to nandc_offset
>>   * Set buf_count to 512 in the parameter page read
>>   * Replaced the buf_count value of 512 with the len in bytes
>>
>> v1:
>>   * These patches will fix the following:
>>   * 1) onfi param page read which was broken by exec_op() patch.
>>   * 2) Fixed offset passed to BAM from QPIC base
>>
>> Md Sadre Alam (3):
>>    mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
>>    mtd: rawnand: qcom: Fix onfi param page read
>>    mtd: rawnand: qcom: Fix read len for onfi param page
>>
> 
> Do you plan to respin this series? FYI, these are regressions, so should go in
> early as possible.
Waiting for SPI NAND series patches [1] to be merged (raw nand change 
patch 2-5). On top of that will repost these patches.

Thanks,
Alam.

1. 
https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-1-quic_mdalam@quicinc.com/

> 
> - Mani
> 
>>   drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
