Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F6C3ABC9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 May 2025 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kki036EK9s7llpFzBnaVbXObs01tUNvjxXaIHkmFUko=; b=H1V9hRWUjJpArR
	yXb3XotFqMjfwI9SOS1BfStkWDB697X3/yfJwKapZv0ViSJ+7w4Ro085I3Jmnv24FhnAkkR03utI9
	Qccv7c8fhTDWQ4le/QUsPe4H3ACrbzF0pRLV+XvEmHJ9gWgH9uL+764ntiD28pNtDD5mb1wUpf4su
	P/gzam0V0tWRJNZHheA3ECT9dFGxS8L+qWqyCbjuQhHiPOJrWaauAf4M8R9ojHsKyhhJlRoWrD9Zj
	/0usDnWhHtP9TiJjoURiLwutOH0SVte8gUkpVgQEYXqVSWl82WIGRGkcZBpHJ60fMwQEuyhVJKfMl
	7KguhY0VSoSd+B/k2F6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqLH-00000002pHc-3Xez;
	Fri, 16 May 2025 08:22:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqJP-00000002oVR-2hjC
	for linux-mtd@lists.infradead.org;
	Fri, 16 May 2025 08:21:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G2qoG8024409;
	Fri, 16 May 2025 08:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlTck5+gut5iDxag9Y+PUWa5zCFEnS8qkkpw//kTaqU=; b=Bd93Exl4me8ZlhpO
	VrkhWA3GXTCzSxIIrU6j975In7roK6yqeP94oAn0HXFB5UODqle/53X34S/SM3jg
	bH+LwLAiy26EVesv5xJk3sg1OLVOdqVpukokgjMQMdu5ZXsgqtSYVvpWqunaQOww
	tTZuci4lOeGtIbhL2/6BtUGyF28t2OaXKaINKCzPTMYSLdFwDCnYDPFdotOD7/Qf
	oaozZZIymVn1mT5PV8C2qddg+ssW4HOUBRMwK/RM+FUzL/3MtSkOpmyk7Co2aaRa
	2yjgJytVO9S0oEBCeQ49DMtnhd7mIOd6GGdU7Mtc+rOL3GJN1TG7XK2SacykJAIv
	WmcvEg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn1e7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G8KtrV012508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:55 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 May
 2025 01:20:52 -0700
Message-ID: <9bb380f9-ba7f-8c6c-bf57-bb84eb96302f@quicinc.com>
Date: Fri, 16 May 2025 13:50:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] spi: spi-qpic-snand: extend FIELD_PREP() macro usage
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran
	<quic_srichara@quicinc.com>,
        <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250515-qpic-snand-use-bitmasks-v1-0-11729aeae73b@gmail.com>
 <20250515-qpic-snand-use-bitmasks-v1-2-11729aeae73b@gmail.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20250515-qpic-snand-use-bitmasks-v1-2-11729aeae73b@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JvoF3Xa_2Tna_T_Cxr5MsZbXcOaExYFn
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6826f568 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=GCHeSRd5Ohs72rWH-XEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JvoF3Xa_2Tna_T_Cxr5MsZbXcOaExYFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA3NiBTYWx0ZWRfXwVvCuwoLezJl
 jFgMF1i0YFsi1UDF2ITXjmp4tlwTuSlovrgfLGhZMxtXwJCNLIrUg8QLZ9+iwsN5oMPJcWeBTl1
 kTrC55aZiNjdnpwSeifBSKN/euPJb8iIJcW3jxaXShE6idiIvurSUDL8y3Wl7foz8vBshSiY/4Z
 2opBIIMgZGfKZEnFRWjcbg61PFF2Yoai32BYodaBWT31XMub7JxSM7DbNBQ8vPa0C+voz72Dcv6
 zaqkAiKx181xCk9Cq35kKgIIsNpWbF7xO8l+tzLO1ac/PTnnciwb87I9CNg65b1zikI56n7k3Z+
 oQ0bXAD1QTyFcEJQeK29GRUoDO1LLR7N4aPGqGBGq0B5uvnwUhaNxUGMBWAgzYlvpqeZY/dR00I
 pjbT1e4CWzs9Osc9F1CcUiAnZphjLBqs8lUWHZtbgI27wcWtGiG0iWK5QvBWyflp/jarzruz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_03,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_012059_708443_480AE7FF 
X-CRM114-Status: GOOD (  16.39  )
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



On 5/16/2025 12:28 AM, Gabor Juhos wrote:
> Large part of the code uses the FIELD_PREP() macro already to construct
> values to be written to hardware registers. Change the code to use also
> the macro for more registers of which the corresponding bitmasks are
> defined already.
> 
> This makes the code more readable. It also syncs the affected
> codes with their counterparts in the 'qcom_nandc' driver, so it
> makes it easier to spot the differences between the two
> implementations.
> 
> No functional changes intended.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>   drivers/spi/spi-qpic-snand.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index bc45b834fadc5456eda1fe778e5ca8b16177465e..ad01bb456a88b54f0ffc801dd14eb3fa2708ec2e 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -130,9 +130,9 @@ static void qcom_spi_set_read_loc_first(struct qcom_nand_controller *snandc,
>   					int is_last_read_loc)
>   {
>   	__le32 locreg_val;
> -	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
> -		  ((read_size) << READ_LOCATION_SIZE) | ((is_last_read_loc)
> -		  << READ_LOCATION_LAST));
> +	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
> +		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
> +		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
>   
>   	locreg_val = cpu_to_le32(val);
>   
> @@ -151,9 +151,9 @@ static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
>   				       int is_last_read_loc)
>   {
>   	__le32 locreg_val;
> -	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
> -		  ((read_size) << READ_LOCATION_SIZE) | ((is_last_read_loc)
> -		  << READ_LOCATION_LAST));
> +	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
> +		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
> +		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
>   
>   	locreg_val = cpu_to_le32(val);
>   
> @@ -352,7 +352,7 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
>   			       FIELD_PREP(ECC_MODE_MASK, 0) |
>   			       FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, ecc_cfg->ecc_bytes_hw);
>   
> -	ecc_cfg->ecc_buf_cfg = 0x203 << NUM_STEPS;
> +	ecc_cfg->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, 0x203);
>   	ecc_cfg->clrflashstatus = FS_READY_BSY_N;
>   	ecc_cfg->clrreadstatus = 0xc0;
>   
> 

Reviewed-by: Md Sadre Alam <quic_mdalam@quicinc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
