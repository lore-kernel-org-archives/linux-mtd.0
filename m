Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1BFCA0FF2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Sep 2025 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FecssQjxnB3D6VBiN27289xndwLaDi9XMyNL0evWrFU=; b=c6PP6ialgMC+xP
	CPYheqoOGyZeNYFhRBLbtWsCDSmiZO9XIiMW5eS05Ri3fhbpS5mHeuJIdX2SNp9eh3ja9X7/20rnv
	ibtjBSB7s3vBcAmJMCeQmcbnOP96YpwM8xMpq2w1L+a1t9GVW3eMEAi0NcFh4+yYAiVx3hiVakt/H
	9zVQm/7qcA9DBm6TP2lvz49eeHlqokxXjyk4AQ1UZ2/e4e5A9jR+dFmqVwPh2A2YYp9MeQNWQ1ouj
	UX+16KaPVYlA0tnkp2aVk9AEXrFICU5Rr9UAZdX4vH8PGqqRYL7SBcqbGIQ6dgQJXMAv9n5CWXSUW
	gyDhKSipQ/YKh3rX6IJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrQx-00000007ClL-23pk;
	Wed, 03 Sep 2025 17:38:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnlu-00000006daq-3UTJ
	for linux-mtd@lists.infradead.org;
	Wed, 03 Sep 2025 13:43:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF9QU003120
	for <linux-mtd@lists.infradead.org>; Wed, 3 Sep 2025 13:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhAEVb6Y680w1OtPE9Ykdv0IK3xbZmfs2ASBVN73JdY=; b=UH1qtGH06F5VANyt
	SwvNUMngVUmItbvUX8SL9y+hu362Pwrcw+SUtieT+429RsloOLjAVd2akdLzqQOo
	iP1mPbKYoX502uz5pRx3YdugHFLOFNt3j19T/ru9nHQ70AI9v1UZPFKqli0mpK5H
	kmB6vHBq7A1iEnhja5cm+j7e+A4Cks59rW2EbdsWV/+H0blYVR3ElttLP4ZRzek9
	ptkTlctmEy95uyZ4SBXg1WBM7vfzECknh028d7FxTNqpE4EurBnLdPe6gY/JAJH4
	cZhqxxuETUnwg3U7hxALCgMRGmQgt8mKa05h/hz0/o2c5OaUw0QQEipPih8JSJ96
	HHVZ8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03w8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 03 Sep 2025 13:43:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3037bd983so35392201cf.1
        for <linux-mtd@lists.infradead.org>; Wed, 03 Sep 2025 06:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907013; x=1757511813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhAEVb6Y680w1OtPE9Ykdv0IK3xbZmfs2ASBVN73JdY=;
        b=xCEvoockBxuZRkmoy3g/IA9Ke77q+7NbKaSJu1JodjF777As4lMqVjBbe/y09Y1/+1
         kIpwXsqu6VOzigt2rTrUo46JgPGVAwNotNOSOZi/YVWWFrY832FzhXl0aH0jsu/niORN
         54Und/i4bXBazTpj3IJCk/y0ygif57d2dOGbkV5M9VFOMI5ni1/U90tFNyph/U6Zln/G
         hvvfFStKxdwXznZ8RKFa1SxuYV1bF8CLBmcS8/RtjydJszj71pmaQMKKtSNqtMA1LVWp
         lVJ32ZE0iXnD+/MOwh8QetNpF9evD+9i66PgGk2UO0KG17ZAmK5TnW9jGbjs15HsiiY/
         XCyg==
X-Forwarded-Encrypted: i=1; AJvYcCUMo4injd/ftpylCPW8mTrq5YwtQbRGZPUK7NGyTIEPznlFMgNc6kpIvwzVUYipsQC+QS/kc9i2ct4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQnXT0eWp97TgCRDH5dO0CVnMsrqbCriuoc7uOpKio61c6nzlg
	wngY55iOkqciig3UoUsX/H7+kL+wGve0+XdlVtNO6Sy6+2pJ1zAoAwwzznQG5KBT6yAPJjPBMLl
	EX2AwBD0Zo3pjAxO8KC3XYDWWFxOM9rpAprIhAuUzxqU5vMz24tb4sMX+9UVqNhojH/0U
X-Gm-Gg: ASbGnctN3b9/5g8brZbjadbqjMVWA5xSEd6MWXoylhZVxC9qxTFd7NyUzASGv/8UXMe
	RNywG469UpavqP/MooJKjWKbRgiy09ElENYxnB/Chvez7dHBqfMDCc7+F2iG8rdYX30YIw1BowU
	FSH9DY2aGP2CJsgsWoArJLjNlKVjiDawEGkmBwVF1hVcB3QNvHGWJCvW+SMIIHepWMLqoEL1JnL
	W8EkG50Ao0CUGPzB5vk4mGr2IjUCvLWRPeQ4671zYzAri8bGfuL7rpKv3qFcJ8Y9e7YHdufk3p4
	OkdFOAeHLpdUFADl0CwNDwSgtemcHknDFqiJk8oGmy5fEoKSDF7D/ZIhvzgtWBT8b6Hb5Pobs0t
	DnyLgsdb+F81uj+vm0P81gg==
X-Received: by 2002:a05:622a:1b92:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4b313dd0270mr155416901cf.3.1756907012972;
        Wed, 03 Sep 2025 06:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF56Xam6gZtEwPzJFWPQ1ApnzKwNAHz4Gphd/ZewfD8xSeb5FB3EyFo/YQ8Z02OaDwf9p54/g==
X-Received: by 2002:a05:622a:1b92:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4b313dd0270mr155416621cf.3.1756907012428;
        Wed, 03 Sep 2025 06:43:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046eb335f5sm107990666b.28.2025.09.03.06.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:43:31 -0700 (PDT)
Message-ID: <7a43753d-a0a3-4b9a-829b-5a997ce46625@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: unregister ECC engine on probe error
 and device remove
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250903-qpic-snand-unregister-ecceng-v1-1-ef5387b0abdc@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-qpic-snand-unregister-ecceng-v1-1-ef5387b0abdc@gmail.com>
X-Proofpoint-GUID: CwNX7AZxMcWcId8CyTemKM6wzlmiIKD2
X-Proofpoint-ORIG-GUID: CwNX7AZxMcWcId8CyTemKM6wzlmiIKD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXwgt69kQRqzlf
 4l6KnwQVEwjUZMrmEGwHqkhUpbnt4SiYgSUJIetX/U3vog3WUzXBSRL4CNAcwRg9/yyRKlfU53f
 ZtAwSXWPUWeJNdoJk3X7iutS7KWWK4ZoDf6YMsde8WNuBrqnOINJS8jVRAHTkymM+idonNPMUSH
 R79ObpeRl8gMcsFtnkOI3FnjEmmWjAVe/I8fylNI5AW8SpcbPfMgZcAdIBac5hwFEUtibTke0xN
 7wWvEFnN7q8AtG3goxIUuMug37M6SIrhP3Ve2CCRBxqzztLT/J8Xi7H5WL3AzVbEjqeOCtnb2YR
 TCQhGmt2126hlEJSKUWLkIAC6k675ONpNbdwfrDOs2GHUDgphkSJv7jZG/6KXpDbBjgmOEe9HEs
 u3a3rx6K
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b84605 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MVN0ImEU2R9ubr7hOacA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_064334_994171_4E206D8F 
X-CRM114-Status: GOOD (  13.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/3/25 1:56 PM, Gabor Juhos wrote:
> The on-host hardware ECC engine remains registered both when
> the spi_register_controller() function returns with an error
> and also on device removal.
> 
> Change the qcom_spi_probe() function to unregister the engine
> on the error path, and add the missing unregistering call to
> qcom_spi_remove() to avoid possible use-after-free issues.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
