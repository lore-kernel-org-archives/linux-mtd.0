Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E9D75BBE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XZ5dhylNe5pD4qLN3QzHTOx+yn1n37lAYJ8WNjvV/Q=; b=bIeykOUw17oYgx
	6rs9cIKbGNb0LIgGmeKVFPv1YFdTeNVG+qzHKA7+gy23dzoSJ3z7ID7ON0qVD3ELR0/J6t829DIU2
	tbNpCCMZLNZ4hg1hEOmWiYjTMX1ytN6FkUZOdrS11xZxvLMNfjwLGnqqLujV0yWcJCc77SK7XN7PG
	3D72Fz8Vqm9RBHSw1hh1xItu/yU9q8FsCszCtGsFbwxLpOnRpNlDy5U03E5Axe5TVrz8PqMFaLXHM
	3TE6S94ApZvUV6/k1YLTBlQdOp4LKM2UdbA+7q+FYPrkZQCeMlkvLr3iSPiIcYZWR03aSRoonCDRb
	l4I1RzuVksl+HQtioD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0Kz-0000000Gu2H-0Hym;
	Thu, 21 Nov 2024 06:06:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0Kw-0000000Gu1d-1j0T
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 06:06:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKEwCf005732;
	Thu, 21 Nov 2024 06:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO6/5HsGPxnfAfCT2ZO6+hxDkdbf3npCoq9C7qnEZ3E=; b=DtrZtUoIYDscjDvO
	X9xOPqYkIfEsEY9uGQcto1VBlIeRRphG7+4JpAs8ZvwLi4CvuuH5/xXWfyWCSzdr
	CjNBwAuyRmzdjEQOC80FRnrgqpzww16YC1U2vmuh864fhFBKtfNrh5L/8K9K811v
	DCSQ0cHBKpbq2aea0dzXuQMkC1JAlm7UENfzt5/YIrkbB+SvyxdPvikgwbc4c2Gk
	hfJpfqMbpbAEztGdEACyn9j6z25gh8yCnPCOdhYIk7ihg3L6B2tMemn+RcSWhSge
	SV7XvpKsGl7ohkGHpOnGkZuV4uwqtcxnsmMooaQ0PGCwnGjmcbfzEa3tXmt2HEts
	tAyIxQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y80698-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:06:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL66a3e024427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:06:36 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:06:32 -0800
Message-ID: <e11e19ce-18e0-1fe9-8eda-aa12f8c87a73@quicinc.com>
Date: Thu, 21 Nov 2024 11:36:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] mtd: rawnand: qcom: Fix onfi param page read
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-3-quic_mdalam@quicinc.com>
 <20241120070609.u2nzofwnupyqnjqp@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241120070609.u2nzofwnupyqnjqp@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1L8Pt72tEb5a8LV64Pn06Ed2tcJo6bYX
X-Proofpoint-GUID: 1L8Pt72tEb5a8LV64Pn06Ed2tcJo6bYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_220642_600043_1A89E087 
X-CRM114-Status: GOOD (  21.92  )
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



On 11/20/2024 12:36 PM, Manivannan Sadhasivam wrote:
> On Tue, Nov 19, 2024 at 02:50:58PM +0530, Md Sadre Alam wrote:
>> For QPIC V2 onwards there is a separate register to read
>> last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
>>
>> qcom_param_page_type_exec() is used to read only one code word
>> If we will configure number of code words to 1 in QPIC_NAND_DEV0_CFG0
> 
> No 'we' in commit message. Also use imperative tone.
Ok
> 
>> register then QPIC controller thinks its reading the last code word,
>> since we are having separate register to read the last code word,
>> we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n" register
>> to fetch data from QPIC buffer to system memory.
>>
>> Also there is minimum size to fetch the data from device to QPIC buffer
>> is 512-bytes. If size is less than 512-bytes the data will not be
>> protected by ECC as per QPIC standard. So while reading onfi parameter
>> page from NAND device setting nandc->buf_count = 512.
>>
> 
> This is a separate fix and should be in a separate patch.
Ok
> 
>> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> 
> Please describe the impact of the issue. Add relevant failure messages, affected
> SoC names etc...
Sure, Will update in next revision.
> 
> Finally, you should also CC stable list to backport the fixes.
Ok
> 
> - Mani
> 
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>   drivers/mtd/nand/raw/qcom_nandc.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index 34ee8555fb8a..6487f2126833 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -2859,7 +2859,12 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>>   	const struct nand_op_instr *instr = NULL;
>>   	unsigned int op_id = 0;
>>   	unsigned int len = 0;
>> -	int ret;
>> +	int ret, reg_base;
>> +
>> +	reg_base = NAND_READ_LOCATION_0;
>> +
>> +	if (nandc->props->qpic_v2)
>> +		reg_base = NAND_READ_LOCATION_LAST_CW_0;
>>   
>>   	ret = qcom_parse_instructions(chip, subop, &q_op);
>>   	if (ret)
>> @@ -2911,14 +2916,17 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>>   	op_id = q_op.data_instr_idx;
>>   	len = nand_subop_get_data_len(subop, op_id);
>>   
>> -	nandc_set_read_loc(chip, 0, 0, 0, len, 1);
>> +	if (nandc->props->qpic_v2)
>> +		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
>> +	else
>> +		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
>>   
>>   	if (!nandc->props->qpic_v2) {
>>   		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
>>   		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
>>   	}
>>   
>> -	nandc->buf_count = len;
>> +	nandc->buf_count = 512;
>>   	memset(nandc->data_buffer, 0xff, nandc->buf_count);
>>   
>>   	config_nand_single_cw_page_read(chip, false, 0);
>> -- 
>> 2.34.1
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
