Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93737D3C902
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2024 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFNQN/4lhIaMjgc8lhFWrzStDbCCFulAydfprbwaDdE=; b=A7Jo11f+r46LeO
	S5BHa2sgxu+jf93u/MUhXXaZpRbqnNLXZpgTZhmjtvLQNDPcnfGG8mzfSwPOxaOVGO+Exb0R8ihUZ
	ch7QvBQHjXU7KwHRND7RrUvZA2Zmp49hFBP5CBYnFrwv+8HFJjbNhMjDvYqNixLUHCbvaA9rkJT5n
	So3CvV4BRxlttE5vMvpRmOR2y2VzNkQhVYcC2iGft008qths814vVP3HY9QAfq3X2cBfB7KPnwysk
	QnLVoxtyCnYeaDMYSguW853trkFGDqFj3KP2cCPs3J3Na7jQnlPRIUB5IWGdFEAwLGz5rhCTaecTE
	RoAB/autyu9jCG9qRijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t25j9-00000002yii-0J5w;
	Sat, 19 Oct 2024 09:26:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t25iP-00000002ydr-1ULg
	for linux-mtd@lists.infradead.org;
	Sat, 19 Oct 2024 09:25:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49J9HlDE009714
	for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2024 09:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ri+83Yu4ZXb1/js5f/3dc6wHAHC3KvCprDKA8rk/2c=; b=VznYs3u7IKxt1wsB
	zX9m+YafNkaZaNn77DwHVbLQttF3/dwGmmTilc01NQEDWBXtS472E40EDNAzxKEJ
	9nJnI4adL0MqX/faCDfGf/znpi9XoH25BDTw1RnHIYLHb2EvEMiD4VB4DzoS0NCR
	q7LpQXfGBCx9C/FqNPRSyY6kg8osZH6SCo2voug8V7AWaSondoOZy1vDEKpiaWVt
	iyN+t+FnV/5eQ6/oI3x16j3cdnRtsHbSGgZ50GMzxuPxeXVA1K4qLlc3muZBKk65
	7xG72+IOHP/8pzg0bW38wR9WkLDSlfpCa+GPboXygT7PPzvx6ohePcXWe0C8aoxW
	0alWvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6ts8a4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2024 09:25:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso8850756d6.1
        for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2024 02:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729329939; x=1729934739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ri+83Yu4ZXb1/js5f/3dc6wHAHC3KvCprDKA8rk/2c=;
        b=c+DvrGjsskdSRuvvbi7GBWsh90bRJyNoURWMdolqusw0tTxvQZfVb0qiJM3+RkjG87
         hHE3LavPcdX//ptTofOglS3s1rVmJVEHi+wWsWSE4+RXZa8x7c3oN1dV06nB5+i2hyiI
         0SyhdsrqEtyjnALivVQIapz9p5U0y5wpktODH9LZ6bA+2peQb2CRYedNDiG9NTeTirfJ
         2/tZXsHlOU5xg1RCLjSjtikFzg3uNTk0XqXlvSf+cXFFx3D+Gg4Xkl8vM6eCe1tsyxye
         WD4CzUB5ofvRquRot68ivu57tSYqo17eMBIXOxr0on8ZP07l3OKwCS5KV1CAgTxUu4j5
         KKBA==
X-Forwarded-Encrypted: i=1; AJvYcCW6yG9+B69r1yozRuoLH3spGimgkfAhd572NFJa8vsaaaq8vOnph0l11ziEIngzRCNcA9cxbeKXyD8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLUju/5kPgfH9JMovzRdg6wnqczeM8xpunlO2eN4xhibZ5uBEK
	Alt1RarNuxLWbqG/Tbp1nIrfWKLfIh09zmuRx4c5z4z10gJ1JeFGQpU05Xb8wLBHpEJuckybVaU
	YjF7HQD0lM88DMZS8Lu0AYXaOjpy8UZ5M3RKQFCrwEsc/D5NICB3VGX6eEgpLbErE
X-Received: by 2002:a05:6214:c48:b0:6cb:6e29:bad4 with SMTP id 6a1803df08f44-6cde1608419mr33897156d6.11.1729329938604;
        Sat, 19 Oct 2024 02:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo97/Ubq2Cj/vhLVuZ991o9JQ0HdC0i8f/KYoL1rOT218sW7MZ/fq/TieusFevpWQBzqRjuQ==
X-Received: by 2002:a05:6214:c48:b0:6cb:6e29:bad4 with SMTP id 6a1803df08f44-6cde1608419mr33897006d6.11.1729329938291;
        Sat, 19 Oct 2024 02:25:38 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c2e62fsm194944566b.220.2024.10.19.02.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Oct 2024 02:25:37 -0700 (PDT)
Message-ID: <0bde12c0-0c36-4d7c-9538-25d1b55d2fa9@oss.qualcomm.com>
Date: Sat, 19 Oct 2024 11:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 8/8] arm64: dts: qcom: ipq9574: Disable eMMC node
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, arnd@arndb.de, esben@geanix.com,
        nikita.shubin@maquefel.me, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241010070510.1504250-1-quic_mdalam@quicinc.com>
 <20241010070510.1504250-9-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241010070510.1504250-9-quic_mdalam@quicinc.com>
X-Proofpoint-GUID: zqT9n2XFEcnnskzCHMGIIKDJj3S8oh2W
X-Proofpoint-ORIG-GUID: zqT9n2XFEcnnskzCHMGIIKDJj3S8oh2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=502 malwarescore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_022541_551363_747AE935 
X-CRM114-Status: UNSURE (   9.08  )
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

On 10.10.2024 9:05 AM, Md Sadre Alam wrote:
> Disable eMMC node for rdp433, since rdp433
> default boot mode is norplusnand
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

If eMMC is absent on this board, remove the whole &sdhc_1{} section

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
