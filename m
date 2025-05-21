Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F70C2D0CD
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 05:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zblq17/JiP04Ys/YZYwCvdl62KpGPcSOWh70oTItnW8=; b=FU+Cj+p3FHt6fy
	a7xHI+xGtbMpenw0vmrjCT01wAYhxPRJNLnUyonKGQJ6BhG7s435PLcCiMtmwxkJ5SROg6iyUPoCo
	M+UvrgrDK72XL/4Qpfr26ich7vuwUsNbqTv11rAWZb67ABmq6SJ+iBh5vyExFuRiUgWCt7uLyKzKR
	glu0DsOLZjgQeWDcDCE6tC4/1444v0M06rqEPUOFH1X48fbFOYigTIICrKwXsVISauhHxHLAG9cKv
	Oz1+bQK/uKS5LALPhR7vtoH2axwXlYvzARBw3ENwCRHEZsDtfZ5AXplXVIG/jw1GCKx9xlw3Q53LR
	x+P1Y9b8BgqzK83HZMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHc9s-0000000ErUE-0SEb;
	Wed, 21 May 2025 05:38:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHc9p-0000000ErTp-0DXL
	for linux-mtd@lists.infradead.org;
	Wed, 21 May 2025 05:38:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5JAia019165;
	Wed, 21 May 2025 05:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rIXHTD4csw6kw4kJQD3SUf479s6VR/JxiTwReVlOHY=; b=WoGqUnhTryWGHLFf
	7RC/X9H8XXL09zf+tY5lcWWfS5qEo2Jcj0fSPz+wbzryEc4yflTWeGXqCg5omNfm
	B4S5Gni0I2vy4GtnaQU9n7+URF+Ae9Rep5/SP6aXsLKqc/QF+TpOGXs9leyuBY40
	YfvDOTCPg5RQk8Vy9/HQMfZ4NyyLEC96A+2C+QyTLO2HNmkU5l1PrxRCU4Kz/M4M
	dgkWK/G+70BIWq6zjMvD7/ybCRla3HLM2YDRbQFW6Ud4JAssdU0aw7A8/Bgz0B25
	CZizA6dq4OD7RtZ5nposlOGOmi2pJVb/7JHfc3289JccKt2BMTjQbpba5ko40QNd
	+i2WuQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh59mj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 05:38:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L5cGTs020104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 05:38:16 GMT
Received: from [10.50.1.151] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 22:38:13 -0700
Message-ID: <e9f460c3-a575-1014-cca7-27f1d79024e2@quicinc.com>
Date: Wed, 21 May 2025 11:08:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH next 2/2] spi: spi-qpic-snand: add support for 8 bits ECC
 strength
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Sricharan Ramabadhran
	<quic_srichara@quicinc.com>,
        <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com>
 <20250502-qpic-snand-8bit-ecc-v1-2-95f3cd08bbc5@gmail.com>
 <8aa3d4da-da3e-2af4-e0f9-cd56d6259d8f@quicinc.com>
 <c1729d39-9f7f-4c6d-b8a4-72dfee4bfca5@gmail.com> <878qn2nsa0.fsf@bootlin.com>
 <16195524-1f31-4968-a3fd-f3d24f1c4223@gmail.com> <87msbhezjf.fsf@bootlin.com>
 <007881c9-e03c-1473-d8eb-53fbad8c6a8e@quicinc.com>
 <87frh4ej87.fsf@bootlin.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <87frh4ej87.fsf@bootlin.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA1MyBTYWx0ZWRfX/2G/PLeDfvwU
 AKDm/VEWgRmm5Je2fSjPQEqzqALTfgMTpAntgbAb9Qil9EbPOZPB47MqPUfSBwIyjOw402nNeoC
 JN5/jJIMo0OI4Y2R5CS8FDIgk4pOf45DCzfaPbByPMQGQVKKaOte9lq8CuvaycC3XH0h7VFXMAX
 oKXiGtDnVtRGenKiI9wj1RyO7kOMfdQ7kEPsV89z2kmWv0upEbiNXjYoQty9iJeTgQVq6+J2Ggl
 w5M6FcozbEN8U1gEs7stzj3axjfhzbKd2E2Z51tIVtsIpWFy8r4IJErsCEowo5+XVp141BfEYvJ
 WaH0pWvY2nO70BQOEYEHfS0pszW30XjFQFh3M5GSs4DT6KbPJk1l0/tteABD1GCLXTDDnOwEHKZ
 XqJXCd8Z1RWT3zZ2Hf7YN4LupesNQC+y7VvsPNFvdIbT6SVaDA5C3naxxzqZXa2YIIDlL4MD
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682d66c9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=1P9lDc0nu8lX0kGsQioA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lX6Lf87Bh5Z_R65mhOqeVWWz-ecQjf5h
X-Proofpoint-ORIG-GUID: lX6Lf87Bh5Z_R65mhOqeVWWz-ecQjf5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=831 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_223825_113050_1652979E 
X-CRM114-Status: GOOD (  13.43  )
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

Hi,

On 5/16/2025 7:44 PM, Miquel Raynal wrote:
> 
>>>> Interestingly enough, it reports the correct number of bit errors now.
>>>> For me it seems, that the hardware reports the number of the corrected
>>>> *bytes* instead of the corrected *bits*.
>>> I doubt that, nobody counts bytes of errors.
>>> You results are surprising. I initially though in favour of a software
>>> bug, but then it looks even weirder than that. Alam?
>> I have checked with HW team , the QPIC ECC HW engine reports the bit
>> error byte wise not bit wise.
>>
>> e.g
>>      Byte0 --> 2-bitflips --> QPIC ECC counts 1 only
>>      Byte1 --> 3-bitflips --> QPIC ECC counts 1 only
>>      Byte2 --> 1-bitflips --> QPIC ECC counts 1 only
>>      Byte3 --> 4-bitflips --> QPIC ECC counts 1 only (in 8-bit ecc)
>>      Byte4 --> 6-bitflips --> QPIC ECC counts 1 only (in 8-bit ecc)
>>
>> Hope this can clearify the things now.
> 
> o_O ????
> 
> How is that even useful? This basically means UBI will never refresh the
> data because we will constantly underestimate the number of bitflips! We
> need to know the actual number, this averaging does not make any sense
> for Linux. Is there another way to get the raw number of bitflips?
I have re-checked with HW team, unfortunately currently there is no 
register fields available to get the raw number of bit flips. But
for newer chipset they have fixed this issue. But currently the QPIC
QPIC_NANDC_BUFFER_STATUS | 0x79B0018 register bit-8 will get set if 
there is uncorrectable bitflips happened.

For 4-bit ECC if 5-bit raw bit flips happened then bit-8 will get set in
QPIC_NANDC_BUFFER_STATUS.

similar for 8-bit ECC if 9-bit raw bit flips happened then bit-8 will 
get set in QPIC_NANDC_BUFFER_STATUS.

Thanks,
Alam.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
