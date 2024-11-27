Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9442ED609B9
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2024 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrPuliCZjIyPDAPhHqdYSD2i4uTE0a0JXt1tNAJZ7gc=; b=Aj4vbYEbDd0pRc
	eriwjdRJovoXdTRCd4H+79DTBNLH/YoTIIa3TelQQdSYDbPoZkFXmwRLb2fJYuHJwbwCCmA3P3if0
	dcSzTRQOQPulZ6L7KlUf1GG0gpK0d8QB111q/6WhVLUjCrJKpWxF93RuqU4XoBpK2SPMYnj98EMaj
	Cir4EcQMdUCujIONBOXreaF4earc5tCsL2nIeChTUR/dudWfGSxhMy3n3q3RSDjN329NaI4HLLcvi
	3iHCvxpO5hzhOe3x5U5utLsg/bQpaiuZKOS1feaSrZ3c0xwcFW938nADUFChLTYEqFoXvQX36MnD0
	ANy6BrFkfqSxw9wMMdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE59-0000000CfkN-3eKI;
	Wed, 27 Nov 2024 09:11:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE57-0000000CfjV-2f5t
	for linux-mtd@lists.infradead.org;
	Wed, 27 Nov 2024 09:11:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR64jBM000828;
	Wed, 27 Nov 2024 09:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPoWXTJ5g40D7FXVXok8S9PkK66Riq85uQri4nd5Ay8=; b=KRy49Cfz53hwb5yM
	l3J7s9aztn8BvmYSEDXP97xulOc/IgpYL8AiOkDb/zGCBsp2XP1XsW6S0vHphe3L
	qdRBHQ2gDO8rON/g3vFBLpYXyn1pOfLMN5TbLe/bqPs3xqtattBTPEXwiXJk6aA1
	z8JBBO8aYG0eZ9y/yKF0dGtsRsA2NdHXFxKz0BO9HzIYPBA898e7poSKz8cjuOcV
	wc3HRtP+miUI6sbUgzi6NQBnNQf5U2QRnEV9MdyXsJaxDqd80wlPsEhgyJo3vSYY
	4wOKOlUtf9g+k6F7+yxEbfEcyZQw63rM/h6MqYgxdufXQwJ2EBPRelOVkESPEjlp
	ZERKgw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435wuerg63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:11:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR9BRFD029189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:11:27 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 01:11:23 -0800
Message-ID: <fe912c14-170f-92b7-d0be-71c4a7a456d0@quicinc.com>
Date: Wed, 27 Nov 2024 14:41:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/3] mtd: rawnand: qcom: Fix onfi param page read
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-3-quic_mdalam@quicinc.com>
 <20241126054135.5v7f5ln5vwc64eys@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241126054135.5v7f5ln5vwc64eys@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TqBkF3t_1oEpfbKdomLQIAR-XW4e8jwL
X-Proofpoint-GUID: TqBkF3t_1oEpfbKdomLQIAR-XW4e8jwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_011133_803411_4D9CAAAE 
X-CRM114-Status: GOOD (  21.85  )
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



On 11/26/2024 11:11 AM, Manivannan Sadhasivam wrote:
> On Fri, Nov 22, 2024 at 02:29:32PM +0530, Md Sadre Alam wrote:
> 
> Please change subject to:
> 
> mtd: rawnand: qcom: Fix last codeword read in qcom_param_page_type_exec()
Ok
> 
>> For QPIC V2 onwards there is a separate register to read
>> last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
>>
>> qcom_param_page_type_exec() is used to read only one code word
>> If it will get configure number of code words to 1 in QPIC_NAND_DEV0_CFG0
> 
> "If it configures the number of..."
Ok
> 
>> register then QPIC controller thinks its reading the last code word,
>> since we are having separate register to read the last code word,
>> we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n" register
>> to fetch data from QPIC buffer to system memory.
>>
>> Without this change page read was failing with timeout error
>>
>> / # hexdump -C /dev/mtd1
>> [  129.206113] qcom-nandc 1cc8000.nand-controller: failure to read page/oob
>> hexdump: /dev/mtd1: Connection timed out
>>
>> This issue only seen on SDX targets since SDX target used QPICv2. But
>> same working on IPQ targets since IPQ used QPICv1.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> - Mani
> 
>> ---
>>
>> Change in [v2]
>>
>> * Updated commit message
>>
>> * Added stable kernel tag
>>
>> * Replaced the buf_count value of 512 with the len in bytes.
>>
>> Change in [v1]
>>
>> * Resolved the issue with reading a single code word in the parameter
>>    page read
>>
>>   drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index cc59461df72e..31ec3db1246d 100644
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
>> @@ -2911,7 +2916,10 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>>   	op_id = q_op.data_instr_idx;
>>   	len = nand_subop_get_data_len(subop, op_id);
>>   
>> -	nandc_set_read_loc(chip, 0, 0, 0, len, 1);
> 
> nandc_set_read_loc() does changes the register offset based on QPIC version. So
> what exactly you are trying to fix here?
QPICv2 having separate register to copy last code word data from QPIC buffer to Memory.
e.g for 2K page nand total code word = 4, so to copy first three code word need to configure
NAND_LOCATIONn register , but to copy last code word need to configure NAND_LOCATIONn_LAST
register.
> 
> - Mani
> 
>> +	if (nandc->props->qpic_v2)
>> +		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
>> +	else
>> +		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
>>   
>>   	if (!nandc->props->qpic_v2) {
>>   		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
>> -- 
>> 2.34.1
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
