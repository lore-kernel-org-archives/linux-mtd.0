Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A6AC47073
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jan 2024 19:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXBKngpIfIK07Db0KV/R1LH8d3lBeqPbGdLhQEYlN/A=; b=yQMCoDVaQrY+qW
	JqcVAxQHSfyF80KIxfBjs3zRB14q5hDAYg30/3SzSHxVjXDcFyVuR/RojB/AhEvf7+RY5xCxFuli6
	bZRfzoPnDBIXMFWRgKfs0YoQ4/+GtMvrSS3yVzf+69HoPDuEmjdrecV32BEVbg4SvPDs61pW1WGkH
	4G+JkqHS+xieDJTC1rnKqbXZ7jJyQwDGbeyS0WxxeCyUDf7M+sC8u7IqVgmeTRXtOiouksnNDMeSE
	5bLLqOzLVMCkbRbk5ORogpMQ9ntbfWxA9kE4SSlQSjB4G7PUDxmQReN+S7C+EYr9tmfSv1H/uzLN+
	at29m+bhW/GmkK1rrDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNe6f-00Del6-0l;
	Wed, 10 Jan 2024 19:19:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNe6a-00DejJ-2q
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jan 2024 19:19:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AII4np021305;
	Wed, 10 Jan 2024 19:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=jnvwjaJSh71ZVdoK5gBOs
	QlHTKzC8Uxma1PfqBu+KWY=; b=Dw1CASMgk2yRTzRSq2AcXokPOEjLjSnrVW2l9
	nuZmm1dMt6Iyo7XHd8zvbuBCEVkIBFvO4aWCwMqKt1ajwcRqYj1B1TmQT1iAv56I
	yphX3H0ZYIXZmAfcqvhebNPhYlNlZnqIzzQ23iFur1xuryC1RBE4l2xkuZPQ6yqA
	XMT8jpJZCgyOYqUrzfvUJx7nTzUwuBWYJFnBOO2LooB8FjlHi+IlF8p3NPwQlXCM
	ETplm81jt7KYSM39a0qUjF4O/4imS90ZQVJg69cQWXgKK1sz7DSx/ftj3dstw07R
	E8KeJbcbhUcFzec39aI3anDBtMSiM3nF9v4parOIocVmeP2vQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhq2h1ngg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 19:19:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40AJJ1kE003837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 19:19:01 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 11:19:02 -0800
Date: Wed, 10 Jan 2024 11:19:00 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: mtd: avoid automatically select from
 mtd.yaml
Message-ID: <20240110191900.GM1315173@hu-bjorande-lv.qualcomm.com>
References: <1704885705-7486-1-git-send-email-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1704885705-7486-1-git-send-email-quic_zhenhuah@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dC_Wu6G7ldqe4tlIvy4yutzMoxLRc0mM
X-Proofpoint-ORIG-GUID: dC_Wu6G7ldqe4tlIvy4yutzMoxLRc0mM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxlogscore=961 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401100153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_111913_083723_2B711C37 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Jan 10, 2024 at 07:21:45PM +0800, Zhenhua Huang wrote:
> The mtd binding is always $ref'ed by other bindings, default selector
> should be from other binding files which ref'ed it. Now, "$nodename" in
> mtd.yaml turns into a "select" automatically such that a few binding check
> issues reported because it conflicts with sram devices(eg, qcom,imem.yaml,
> rules in folder sram/*)
> 
> To avoid the automatically created "select" in mtd.yaml, adding:
> 
> select: false
> 
> Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Fixes: 7bdc671822e9 ("dt-bindings: mtd: physmap: Reuse the generic definitions")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

> ---
> Hi Bjorn,
> 
> As the idea is from your comment, I added "Suggested-by" you.
> Please tell me if that's not suitable. Thanks.

I appreciate that, thank you.

Regards,
Bjorn

> 
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index f322290..ee442ec 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -10,6 +10,8 @@ maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
>    - Richard Weinberger <richard@nod.at>
>  
> +select: false
> +
>  properties:
>    $nodename:
>      pattern: "^(flash|.*sram|nand)(@.*)?$"
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
