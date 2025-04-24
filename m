Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7CAC369DC
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHhybpLRc+CugIQfAsD7x5tDGtFvqlIwULuV+lnDEPc=; b=xT9la92427fl1F
	idpN9lBKGYwPEub7ZuAvyARWatBy7rF47Zl+1/TRY8jQ/lnm9OQVW8n289bS2DMO03RR5xyQGcqJX
	4q3TDvWh09/rS2NjQe4VNJDa11nyCDAccHgxwjfdB2bih8ayN7IGG7yG18ElKJQmQ1ztIVfYsFiMo
	zE+3WoEcGGsKjKLREd0+t3h0DQaj1NpkLfaPWJVnxoEH7CSiyKM4CTnJ3X86oPCUJciomjExB3vXo
	i0COrin91Z2IALZ3xvy9G9++IjfGg9AmoyPWG9D46EeP94+0XOZiGvOu6vo+avElS6LAfJroah2A5
	7AVwepcuTqn+8FDbpI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z33-0000000EZjp-2D3z;
	Thu, 24 Apr 2025 16:03:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uo3-0000000DrjX-1utA
	for linux-mtd@bombadil.infradead.org;
	Thu, 24 Apr 2025 11:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=phE46890agfRLDRFzI4kRMIfJJ+UiUB12tGt+ATd+Yc=; b=K4tYnEa34jVaif3X2tLaMmTMLr
	qHBiXLifZ4wgioYYgkL9lNFgiwpAAfCBDj4YKZJ0f0TFcDCL9VvkgmUbJgw4t1pe/Q8LhpNbLHkAP
	Q85eTx+UirFPZDiAu2gVJqHpRoHzSLySYYyAZO2W50iuqZKyqeQV0DZ30BjjiWqzAYBqZO08ScF6l
	kg8T7jUT8B/TkJ58ocvn320HIb0b5htk6JTmprxkddWnjoYCb3QxOUPfDIVRpciRBFbyDg06MdKNs
	BP3/Kf3+Xa8eso0x1NfjjSxgb/dS2cD3TwpoWbFXcQaCx3x4eBlfnS3/MZA+wLtIJ33/LRABBVRbU
	Ei5icQCw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7uo0-0000000BlwU-084F
	for linux-mtd@lists.infradead.org;
	Thu, 24 Apr 2025 11:31:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OA7hIU031170;
	Thu, 24 Apr 2025 11:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phE46890agfRLDRFzI4kRMIfJJ+UiUB12tGt+ATd+Yc=; b=H9dUZ6k3cGtYN/gz
	K6coqSAa7v/PsezKqP+QvhsEUuHUFYGMdTvophdRmfxoK6x8O1HBBW05j1AoOZzi
	4Qy2WxT+Aqfmfsv6szX1wtoxeQUk7BM8vdx8zegtTtwCFTSfePfAuSsSgw8MlbSH
	4POExew4ARfkUMxjXfq5kapO4bNVK/RXgmCY5UNSRXzMqUeNg68jqk+fDyFfJhAN
	E5R20aBcuCMf/gv3SDwEOBahLW6xi4LvgnJAQWUF1WvaMWiwz/xOObKv+VNVbS2h
	3Ednm0QUzbwNNu/dqwyjK318+TFVLQwF8er3P4m3H7ukNRgsn2k7fj2AS8V3p7fr
	OF6mEQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5dcm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:31:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBVdlq022044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:31:39 GMT
Received: from [10.50.10.37] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 04:31:36 -0700
Message-ID: <5c860a06-48ff-554b-824b-51fdf4d51f4e@quicinc.com>
Date: Thu, 24 Apr 2025 17:01:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] spi: spi-qpic-snand: propagate errors from
 qcom_spi_block_erase()
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Sricharan Ramabadhran" <quic_srichara@quicinc.com>,
        Varadarajan Narayanan
	<quic_varada@quicinc.com>
CC: <linux-spi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NyBTYWx0ZWRfXzG44nQxQGakF WjL9HTamLrEiJEqzGuo0t5pL3NlpLIWTVrHYECqMEay9r1Bu5nZ1yijdjgokicpwvaR0EmrxEaU 5vY9wbGLwBkfaWgIS3he6DwRWZwnyFwEReNVap4HyjZBr1AkKNb6LngSaFpearFSJM97XBQ34ld
 0qv+yYB50rsO+HaKeGJBDKKm3jx3HmDgxt0zqN5p3K+ZHADwbDAr5tsCs+8Twf+hlvn4Qhkew6c kR8HFOssftN0WaAHe58b/UQlAlEGd31Ob5WLXMVAjJ+KNhaAUG1Bu93gx9oGttaIP3v2f2BhlEP RgTpmNzbGi300NKQRNzx5AEI5o+Xf34YonuuDGnHdE28x4Jg3z57b3mNP8cb13ZERPx7chdVGXE
 Ro/ScWZaaNUvIPWJHeCb4lxiICRG8TSjkDEIwEF8U3LSTcTobv1yMNszlOimUf6WaGFG7d0S
X-Proofpoint-GUID: 9d7JXDfoIfw0xaWkzl9jImmRYSLf9iZ-
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a211c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=5uVZKOckcYlA3JQ-cpIA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9d7JXDfoIfw0xaWkzl9jImmRYSLf9iZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_123148_410844_670E0CF8 
X-CRM114-Status: GOOD (  14.08  )
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



On 4/24/2025 1:01 AM, Gabor Juhos wrote:
> The qcom_spi_block_erase() function returns with error in case of
> failure. Change the qcom_spi_send_cmdaddr() function to propagate
> these errors to the callers instead of returning with success.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>   drivers/spi/spi-qpic-snand.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 17eb67e19132612c4c1a84848fa6f7432b1130a8..ae32c452d0bcf852b69b76e595f3588ea7e1a670 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -1307,8 +1307,7 @@ static int qcom_spi_send_cmdaddr(struct qcom_nand_controller *snandc,
>   		snandc->qspi->addr1 = cpu_to_le32(s_op.addr1_reg << 16);
>   		snandc->qspi->addr2 = cpu_to_le32(s_op.addr2_reg);
>   		snandc->qspi->cmd = cpu_to_le32(cmd);
> -		qcom_spi_block_erase(snandc);
> -		return 0;
> +		return qcom_spi_block_erase(snandc);
>   	default:
>   		break;
>   	}
> 
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250422-qpic-snand-propagate-error-9c95811ab811

Reviewed-by: Md Sadre Alam <quic_mdalam@quicinc.com>

> Best regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
