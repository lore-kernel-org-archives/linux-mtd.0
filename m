Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E16BD10BF7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Oct 2024 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPdZflrdCIDX2FaAzagWME39iPVm7PNap+xSt2aGKw4=; b=umDCfoDnq3q9Lu
	ozfIf1NQwZcKcxLb/YkTSWekzNa58NxV/ACdHJVL9XluSCXz+JpfMbBYnzD+yDlPOwUZ8Vm9NF+EH
	SbJB6BGOJp2jFhWaitG8w5cfH9vSOCmJdPMHapfW2Pi57ZLn4imZMHYMjvRKCo51pn6bTeXHksp6S
	UtNW3Y12FbNOTBFYu1bEMaMCv0P8xJVnItO+Kfxq0dSBR6I86I2j+ERi62oVfXVvY4mMQCGx3s18a
	8AKHbCzX4zPZUfy7fHCU9QRVdGXtw4X6nMlzwwjPENB+1jwsYnKy6SawXfux5n56Ax0bd2RcuwEU8
	s/utscwQigA3XKB+J7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fEv-00000006XcU-2bHF;
	Sat, 26 Oct 2024 11:45:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fEr-00000006Xc8-42Rg
	for linux-mtd@lists.infradead.org;
	Sat, 26 Oct 2024 11:45:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q5lqX8023303
	for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2024 11:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wA68l2lf8wyRrI4R0eE4ltYNmKHxDtsxldAExe2fGzY=; b=H3k2UMFairNLtfHM
	v9W60fAGmcec5NDWUBbQWauBq6grJNNxWuCTckmZO8d78fjZS9N4T1vy29ZCtCNf
	SqOWU0sdnN2g51KRbGko3BvTlxrYvRsPls1sJeLNOxwQz2yWIAvvLOAsbJLakULQ
	cPPrnoj0xwLH7yZr8vRzlT5EQLGqkuHqMzLaxjRjsWU7BRnstoI8c/+fBavW9D/5
	uT95n7F4s3367AHG/iRDVjhjxJGTZ0XS/uSiIFcwJsmltNolhbq6LbmRFNtNAypB
	5nx0IAd5Ig1Cc89C82TdGA6U3X+gVGzkn1zEljjhHKTkgr4mB1MLEa1/lGpGN2Lz
	LBjJwg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqgxkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2024 11:45:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso6399656d6.1
        for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2024 04:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729943147; x=1730547947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wA68l2lf8wyRrI4R0eE4ltYNmKHxDtsxldAExe2fGzY=;
        b=QtA/RkjlQuO8+L3zZtX7h7UVO4dM0PVQ2ly/bHPI6l6VnR3TfVSF6+qS1LDjzfYcjL
         HjXtI0GmqJATiYuiF8n5mZylvlJCgy23giRHGyG+Qcoeye6SqxaxFG/Bt5anirYpf4Hn
         O40MCuWvMbHlkkWsbVcUuu3HPZr4DCTekpdStyiXVGoprbEYx/3YDn1D60haZlIJC+eO
         Nm9yTA8VNesrRC+Ce2aaeyXQE/tKGAS4A/R3T7KNiatXL4ltoDWRfbPShO4Hoo4UxZE/
         smVofZn0ub0R119yyJ1sD66PEB2jmfuCWkfx6OuDqfh08urZthzpzddezlrjJV3+yOsH
         C8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUSQPd5gi788wtCdCP8VvvlXCEcsR8GPQDwI+03D5/y4N58vTea9vu/kmdv30tC8a9cCfAOA5MSRk0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA0ny6kk3ctWy6+5SJ1kzpaBQHt8OU7YnGK+7rjJIZbhEn1Jgk
	BUpZKe+LV34NaEPnctBOsaC/fD3oarh/Xv5qBbEKIt0UYrqBDHjtQgycuRzgoiCWYfE70VPNsps
	lE4UN/OUKG+OYGc7EggoVa/69G6WVjGpktxwR3a4gWHnKlY2rOAzkgZHwCeE2FYde
X-Received: by 2002:ad4:5cc1:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6d185862964mr16327836d6.12.1729943147549;
        Sat, 26 Oct 2024 04:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWADU17TJTVGXKCcyZaOhFfjzC7J4Ij3YUYX4KBl8kpdlvloYKNu7sa1t17L6IFUTcv7yxJw==
X-Received: by 2002:ad4:5cc1:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6d185862964mr16327626d6.12.1729943147166;
        Sat, 26 Oct 2024 04:45:47 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30c7b5ccsm167348266b.152.2024.10.26.04.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 04:45:46 -0700 (PDT)
Message-ID: <b153229c-3cac-48cc-8f85-7eb9bb0ff79f@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 13:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/8] mtd: rawnand: qcom: Add qcom prefix to common api
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
 <20241021115620.1616617-4-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021115620.1616617-4-quic_mdalam@quicinc.com>
X-Proofpoint-ORIG-GUID: zg-VJWYPh6KzdlJVqEVeq7raN8uY02FR
X-Proofpoint-GUID: zg-VJWYPh6KzdlJVqEVeq7raN8uY02FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=668 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_044550_042071_19BE822E 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

On 21.10.2024 1:56 PM, Md Sadre Alam wrote:
> Add qcom prefix to all the api which will be commonly
> used by spi nand driver and raw nand driver.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
