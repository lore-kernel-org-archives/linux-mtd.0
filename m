Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A87EC87FDB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zvevWmbrxd1c+oF2J63riH+Mx99mOmTKFzuXgGSldM=; b=p0RJuARJm8HFub
	pjvAKlLQ3jK8M+Foa9SDSmD6Up0vK4SKFkFPityCrupRZxPViMVXF3tXDjuD8Wg2aHnK0ttPDYu5F
	alO7fAWBhT4HLgBsePtcXNnvI+J5XdN8MIDBYIHgjSIWr4+ljU3LTO+XvXtU9P7EFzQVTbVQJssBP
	4t5SXTjp0ArcI2so2v0UEea3tSW+h1CRDd11MJmGEKDDF6s2HP0UFmgT3NRwqxoqWFCG2R5V3vWDp
	D6zHFcZXZ25W4KOoHRSG1taR805y/haajLQOcM84qpr/sExvVVaW98uWAz7kko1MmS4cuYy8w4oOU
	kcla1x3aCSJyPR2leXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQ3B-00000007O1y-3gy1;
	Mon, 11 Aug 2025 10:46:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPtL-00000007LTC-3AkH
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 10:36:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dE6W013175
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 10:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXMlWa5HL3QmwtlgJpH4Z3z739VIBK+LB8Zp4WNnwz4=; b=lqLnyDLaYQjLcnWe
	FyypZAxHsbY4Q+RIXBSk08vROgb/WoJJDdDYYBKV+dTXu15FHAOeG42gyO3EeRef
	LG1VDqLoyW9+8XY7J5WcpnLgA3VuKkNEFT59RbLxyB9jr+jiQCYpeX5bAMQkfuli
	5dxDBeKzSKOwut4SYvw9UC6K20AeEezUJz24KnnrDQDvS2t97Tfp445Yljp7vv4S
	MDNySFQXeij4UBGKwgCpJ9yptJdl2jigB5kEe+7dUsvDKdZDdN+eYPx8GhXGs4wz
	d4A1V1MKL20NR2VuKmGIskYLCX5w7C4cUtNc/Jn3qcPvGVckxPXEmeN/LaxSyDjs
	dYzR6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm5sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 10:36:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e802190d0dso121516685a.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 03:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908594; x=1755513394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXMlWa5HL3QmwtlgJpH4Z3z739VIBK+LB8Zp4WNnwz4=;
        b=hO27iHIvzwI60q8Z1VGbrJ4omnECUkKc6X/7Z0RedXeC3UqIPvPGO2kdyBSCSq6eeC
         Uc3e7pDrzsq2mGykx57p1t7tO+aGNScK1H4oPo3BxyRqwf3UBkLZJVXamhbhaOJzsrcs
         8h8W+pTjwD87oDe/QrPB5X+6cxmVMmsSeJO834eM/S7gfPIxd4WLxYkuBFCo0jZAXddx
         yDhAFRWLW2W4aKrjTLZXIWP34PcQL7Q2kyR9PcNpU3kIa3oBNUOWdp0SF4VxXpBPiWXT
         18seM96ABjOvibwIReUeWY2QveK46JuMEjpKfoRM2Rh71AHInFk/YHPrBMAF/i5yR3YI
         6ygA==
X-Gm-Message-State: AOJu0Yy/PzXJojwCZDP/vmld2WlwPR8mLxAtAVZ0aWsa4quNLYQsdNnJ
	7LDLt2S0Ks29y9h4S4z+W8VxJZrkcB2L5+ZutUpGXiR+A8SpmqJ19cRTqDTc1QIhEX0cJ/ZkWRu
	/iHFcxYw+9miRppdrChd+N4JhK9gvSFN9TH697n7MUGtLlI5d45u57hRQ5O/GVHKiI3Uz
X-Gm-Gg: ASbGncsGegWg9/RfP32Pq63TN/YTZVyKjRGBioxq/9LPTlsJhw4b06raP8BHGBiu0tb
	8BYFssvMbVhOTZtuHAncKJhwHa5uRI+tdV3JnOY1jmuUJG5R0evCNkTX5ogTjD+JxMcr00K4e+t
	ipJG14GX2ZPxcjqpWxA7l0eZ5jvm5fv5sztAM2lv1VZ9gMKjkkC86Ou4+Krw/hdBUbjgdAT5uzu
	j8JoGgCDQiv2tITxJV/FL27Q69OL+WDryWUXroHlVAoHN1UNacTlqmH4k94bK2qjnQWDgzk7LW0
	0lWW2AaQwGKYY916XQ25udsD3g0+BSQA9Po/RkM0dVr+dam34tYLI/bohmU/fDeT/+JfEPb1BHF
	6MBp2hjYHuUCJlV0YEw==
X-Received: by 2002:a05:622a:52:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b0becffb44mr51535801cf.8.1754908593902;
        Mon, 11 Aug 2025 03:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEofb0nG3bNmj1Nbdu+0B+tsQeV+xQK2a0YZ0/dVDJLm8BgaWfm52BhC7cv0p80m5kMtNIO5A==
X-Received: by 2002:a05:622a:52:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b0becffb44mr51535581cf.8.1754908593423;
        Mon, 11 Aug 2025 03:36:33 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af985e63730sm1174315166b.67.2025.08.11.03.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:36:32 -0700 (PDT)
Message-ID: <388af03e-a9b8-47dd-876d-104d9c549957@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: nand: qpic_common: use {cmd,data}_sgl_nitems for
 sg_init_table()
To: Gabor Juhos <j4g8y7@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c7b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3CxiO8553sRBInyl-lUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5dgIPQpYYSE-uEyQNEq23PTiVq4hyop5
X-Proofpoint-ORIG-GUID: 5dgIPQpYYSE-uEyQNEq23PTiVq4hyop5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX9MrRdddXf0O1
 ZckX/vSHLv1z9gePUonUX9JcYj6mgOOrt8hN/k+xnG7kUJxDUZQ7F4zMRqg7XfbMa4BCwaPeE6K
 823lFm+JUP2YBpqN+1YQMB88I/8vklIoGNScxXKg5rJlil2LwRXnPgfAgBKYqV62OT02quF/HTG
 wdGPyf8XckSZYMz+NOm/2m+lycF72mT5T9nJ4xAznat9aQNiGzPgmlRP8BXAJyqE2ApY3Cc0hnm
 pybZecv1DxNqtOGMhAJJ3a9Hjlg4kao385Oo7sWXHgVhgFX8QGuaV5L2y9OjtDX62woQmLlgLUf
 EQSA7mevIU8H+q1cfWNucEBUN43v2GWz7Tu+vnKtWeu4o+Ll1ftk2BW5WCUMuPnsWUtSLDcraON
 oJvMOfNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_033635_923725_E61F1D93 
X-CRM114-Status: GOOD (  11.62  )
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

On 8/11/25 10:30 AM, Gabor Juhos wrote:
> Since commit ddaad4ad774d ("mtd: nand: qpic_common: prevent out of
> bounds access of BAM arrays"), the {cmd,data}_sgl_nitems members in
> the 'bam_transaction' structure are containing the number of elements
> in the cmd/data scatter-gather lists.
> 
> Change the qcom_clear_bam_transaction() function to use these numbers
> while reinitializing the sg lists instead of recomputing the number of
> elements to make it less error prone.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
