Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41DD75BD9
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CprQwMPAAA4kDCaTapaQYGWxBE9I7Ur9w188PHaNJGU=; b=hMg7FhvPRl2wjn
	b4qhsKvwCUN4MEMSZxcFoqqqtYsOZ5bY89L94HbYtlkyiCFC53h22Hig42FvyKyZ5GSaPM9qA98sC
	Q8nmHW4gn9gt3u6Gs9YYzGwIbn/Hr9nBC4gf9sSWl0smq+xXVXdcsVFDztUhtAFe4WSPmjrDx1FMw
	l/HMz6TpMru2UcOM7zfr1rRKO1F3ShqcxRpxvxVFVFg2euGZSWAybAz2U6g1oOB5tBnx6e/JtX1th
	5xsmLk83K1Eyq3VUwOEa/V2nrcTM2KY0uyVortpJnEceFNr9e2QuP9BBbaxQyWt0ASS2McAieukE0
	5IYbwc2aSSb5CS1xIpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE35I-0000000HAuX-20qs;
	Thu, 21 Nov 2024 09:02:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE34V-0000000HAnv-1dy9
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 09:01:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0QPNA004490;
	Thu, 21 Nov 2024 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQob7p0JJo2MxbnZrpGC5LnILI6WD9gZ6xWBoswmcjQ=; b=oBVYBkwsxsNeOh3Y
	trM9Ev3JlCE6qYzqrhzVEfcibk/LqVvsu6CBbKzcgcjZTjAU2a6H2fyBBfIEyokj
	fUYFV8Ay0qjqktMYU3zahOQ0EnmMHyZmqp3ul64vocllNsfqbxUTOTu6Pm9oOa3y
	Rc9u6YpcLSyZdeoEkRomSZS032WCtpG0KQRoNAOD0R8MnKbGyjewfXL4HiHpdov7
	422Bih3XsBiBKfNo9r1Z3fqQ6lpYQKKyyQTCgfi7pYJsbD71cmTeVNzr50FJGdMC
	ttqKad3TUJOBpNnUAvoXeDwKQCqWHags9MDGmr9oJzTObc9yv298uqzbqqqxEChd
	dGwFfQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea733mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:01:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL91o5R006559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:01:50 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 01:01:46 -0800
Message-ID: <d3c0414c-6bd7-6b46-93e2-216dcaa4d39a@quicinc.com>
Date: Thu, 21 Nov 2024 14:31:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] mtd: rawnand: qcom: Pass 18 bit offset from QPIC base
 address to BAM
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-2-quic_mdalam@quicinc.com>
 <20241120070115.qox54zr3yhnkqgmd@thinkpad>
 <e76e9562-f7d0-88c9-dcb6-dfcf41cdf205@quicinc.com>
 <20241121065902.5w7rpjjgjqgfxpqo@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241121065902.5w7rpjjgjqgfxpqo@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AXAKvGPVA6kA1P8TxIVQRpkGzxkH1qIZ
X-Proofpoint-ORIG-GUID: AXAKvGPVA6kA1P8TxIVQRpkGzxkH1qIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_010155_440663_C2D21980 
X-CRM114-Status: GOOD (  23.06  )
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



On 11/21/2024 12:29 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 21, 2024 at 11:33:13AM +0530, Md Sadre Alam wrote:
>>
>>
>> On 11/20/2024 12:31 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Nov 19, 2024 at 02:50:57PM +0530, Md Sadre Alam wrote:
>>>> Currently we are configuring lower 24 bits of address in descriptor
>>>> whereas QPIC design expects 18 bit register offset from QPIC base
>>>
>>> You mean 'QPIC IP' here? But is it QPIC or NANDc? I guess the later.
>> It's QPIC IP only.
> 
> Hmm, so what is the difference between QPIC and NANDc?
QPIC is wrapper which integrates NANDc. So only QPIC (Qualcomm Parallel
Interface Controller) will be exposed for interface.
> 
>>>
>>>> address to be configured in cmd descriptors. This is leading to a
>>>> different address actually being used in HW, leading to wrong value
>>>> read.
>>>>
>>>
>>> This doesn't clearly say what the actual issue is. IIUC, the issue is that the
>>> NANDc base address is different from the QPIC base address. But the driver
>>> doesn't take it into account and just used the QPIC base as the NANDc base. This
>>> used to work as the NANDc IP only considers the lower 18 bits of the address
>>> passed by the driver to derive the register offset. Since the base address of
>>> QPIC used to contain all 0 for lower 18 bits (like 0x07980000), the driver ended
>>> up passing the actual register offset in it and NANDc worked properly. But on
>>> newer SoCs like SDX75, the QPIC base address doesn't contain all 0 for lower 18
>>> bits (like 0x01C98000). So NANDc sees wrong offset as per the current logic.
>> Yes correct. If QPIC address = 0x07980000 and QPIC_EBI2NAND address = 0x079b0000
>> the the diff is 0x30000, this is the actual offset expected by QPIC RTL code.
>> and RTL needs only 18-bit offset.
> 
> Okay. So the driver used to pass 0x30000 + offset in older targets and on newer
> ones starting from SDX75, 0x30000 is not passed correctly due to the changed
> QPIC base address.
Yes, correct. In SDX75 the first 18-bits of QPIC base address are non-zero.
> 
> Please mention it clearly in description.
Ok
> 
> - Mani
> 
>>>
>>>> Older targets also used same configuration (lower 24 bits) like sdxpinn,
>>>
>>> Please use actual product names and not internal names. I believe you are
>>> referring to SDX55/SDX65 here.
>> Ok , will change in next revision.
>>>
>>>> ipq etc. but issue is masked in older targets due to lower 18 bits of QPIC
>>>> base address being zero leading to expected address generation.
>>>>
>>>> Sdxpinn     : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
>>>> Sdxnightjar : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for
>>>> older targets.
>>>
>>> Same here.
>> Ok
>>>
>>>>
>>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>>>
>>> Please add relevant Fixes tag.
>> Ok
>>>
>>>> ---
>>>>    drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>>>> index b8cff9240b28..34ee8555fb8a 100644
>>>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>>>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>>>> @@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
>>>>    #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>>>>    /* Returns the NAND register physical address */
>>>> -#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
>>>> +#define nandc_reg_phys(chip, offset)  ((nandc)->props->offset_from_qpic + (offset))
>>>>    /* Returns the dma address for reg read buffer */
>>>>    #define reg_buf_dma_addr(chip, vaddr) \
>>>> @@ -561,6 +561,7 @@ struct qcom_nandc_props {
>>>>    	bool is_qpic;
>>>>    	bool qpic_v2;
>>>>    	bool use_codeword_fixup;
>>>> +	u32 offset_from_qpic;
>>>
>>> nandc_offset?
>> Ok
>>>
>>>>    };
>>>>    /* Frees the BAM transaction memory */
>>>> @@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
>>>>    	.is_bam = false,
>>>>    	.use_codeword_fixup = true,
>>>>    	.dev_cmd_reg_start = 0x0,
>>>> +	.offset_from_qpic = 0x30000,
>>>
>>> How 0x30000 is supposed to work? You said the NANDc ignores lower 18 bits, but
>>> this has 17th and 18th bits set.
>> Not this address 0x30000, this the diff b/w QPIC base and EBI2NAND base. The 18-bits we have see
>> on this address 0x07980000 and this address 0x01C98000.
>>>
>>> - Mani
>>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
