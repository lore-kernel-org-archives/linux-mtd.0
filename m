Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAA5C369B4
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOasRTIY+HVhR2rr5GfXRkItthjYNCIlXxRscnIlh3Q=; b=IngM6COLfkUS44
	93XY0GUjHf/kiy/iku/oLx4nBMSn1RdKeoSUMdW/YQc5Vca1W6nGcFkTuBzkCTHEj3v1vY98vw0kU
	PoS29eHmXQDS3Ta3S666vmpRiw/ukRO+y5PondhsOr8GNw53vSTqJHqD9Aoft/j5OdkwC0foHmJuP
	qGI7Sio8pcqtLhL8Ttk/hqdT2fqdv9DRfs2lrRDO5Eg1bC7A/CvW8foWrfVCKpz7j8WNukSeDXHdw
	OmFxYJgnJ5wgpiqxpu9EUgyCJjbSMMImOTjLUtaBb9CZj9eu/KSqgzS34drF144Ki07cimXJaEUMF
	kHT9oVh/aObcdTaToTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dEU-00000005HIM-3m3K;
	Tue, 15 Apr 2025 10:09:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4czM-00000005DiX-0oid
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 09:53:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tdw5012914
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 09:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxeuE2eVL5Eoo29xjyLgJecbYqVi8+nNdiHJPQLgII4=; b=o7Rsj/zAPhupkj9v
	IGCH94/ff7yFpwjI2gpAfE8QGpx3kwHZDwAS5MXs/SXf0DpFAxaTjzM0oLBVgMq2
	ptXqv4ku56/vrPfk0xRA1LH/NSdEA7Un30R1sBs1dHdLBAcIPE2zP9faNY+7zvG7
	lFOsezFz5NG7J6fXs9lrLhtTpDRcArRxfPfekByzCw9k1md2DlkA0DL76H2E7Qhz
	YAkZLxDWldSx0HdYEYp9GP+upHc14UTKK+DpX5BrEHqddo4NpTJckqO938Dv4CSl
	gB0ussQi7u3O9XF6NJJpEytyWt4U42J/btVyx3tXhGY1I/EmdnZVDmIInlqa3uS9
	G/MLCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq7tfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 09:53:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso11640506d6.3
        for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710834; x=1745315634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxeuE2eVL5Eoo29xjyLgJecbYqVi8+nNdiHJPQLgII4=;
        b=VHNF4IOuQ6Z2MNVDcGHGRoD+l83e4y36DbCo39W1ZE1ozhgwKTBlp+QrAlYdgYTKIb
         3IpNC9vzcGW2fQbTWs3MRvqCVTfPN9BrBL+hdaJ3uO6iTAV4gvVjXscIUI9PkLvbrZBg
         AzXdySFPuuwI4/ipg8ouhl0q2rTeysyTTNW7ob1xb4/q8S9vc+JUNbVgCgl2kDYn7c9t
         rGSzhZUU7tL/TTmExw5EOEhX83osf9V7w5MiThlKkzA6xlzdcted2ol/57IV8IvNQXoL
         kkGU+QQrBmFX+1kpDPvuTaJUq6H+t4b1fxZ1aENJ7wjBnjhQjn/ZYJdqu7PkZ00obSsr
         nkRw==
X-Forwarded-Encrypted: i=1; AJvYcCWOUrA6dY1pSTpBoK4B9mPz1Fw8a767AF485BwkUZnGyMxCUaVOxWhEOxZEXQ04hOC6G80EXfkBCsQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLF8aam4y9I7i+7YmuFs9h5htFZmB9oiVzVd1mfGIlAnp+ZJWM
	y0w+EwI8UPKIfzS9VKmDePptktVtG+nzSOvQMziOuy629cLxz6pzGGV5Vd02/vEiljHP7YhmBx2
	SiZk0IW1xZL+77SdR0lpT5a1loaAiRIg5XhCKv+uI05bj0+E7Z7DOphv1k6KUeSMj
X-Gm-Gg: ASbGncuJ3QLiY6zURD27zxz00/+Z8s3hEL8blStOqwEJDa4damRNyrpxhgMgn0BT35s
	K+LN9W/3ND4r4GiW7AHciLLFCcsDfz/uMTkrEYREdnVz3i1uKwCNbqMk8ifJoJqt2f0DluzhR4F
	BtmKnPEucMQgrLBk9CVEcpgGuIC2eC/DeyIDsvciwHWQf6k3FKJ5VUsd46xELBA6kmh1+E+aXAi
	ByPOnDgrvn0nCy596k6jQXbV03XNvR4XjZbV1bXbXaF2k4ANqJ/YTqL6gy+bJk8LwcsKvBEsZVN
	d8dNDHbXkQKtOgcQaokSQS5VRjtMTYLjxfjhU78E5TsQ0euH12rEMZUNqrOKjHUHc6A=
X-Received: by 2002:a05:6214:20cc:b0:6e8:f019:af59 with SMTP id 6a1803df08f44-6f230cb9754mr96287756d6.1.1744710834363;
        Tue, 15 Apr 2025 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaJX2J+7JlHuueBHmISXlo1aK9U92F4gsipjLZi1j7TSnpCxzm7LQz4Rmzpb9J06CEF1Qug==
X-Received: by 2002:a05:6214:20cc:b0:6e8:f019:af59 with SMTP id 6a1803df08f44-6f230cb9754mr96287716d6.1.1744710834041;
        Tue, 15 Apr 2025 02:53:54 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3120sm1049550566b.1.2025.04.15.02.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:53:53 -0700 (PDT)
Message-ID: <4c57a98f-045f-4487-8354-807b647b2040@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdx75: Add QPIC NAND support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-5-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415072756.20046-5-quic_kaushalk@quicinc.com>
X-Proofpoint-ORIG-GUID: IIgNiV4DeYXhv16-TPW_ZD6D_wsVnKn0
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fe2cb3 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HfTDXfZYWx141HAPJAYA:9 a=QEXdDO2ut3YA:10
 a=-9l76b1btMQA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IIgNiV4DeYXhv16-TPW_ZD6D_wsVnKn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=807
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_025356_361034_FEDCCAAE 
X-CRM114-Status: UNSURE (   9.13  )
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

On 4/15/25 9:27 AM, Kaushal Kumar wrote:
> Add devicetree node to enable support for QPIC NAND controller on Qualcomm
> SDX75 platform.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
