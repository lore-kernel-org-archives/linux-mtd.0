Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A472DC282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34l9IVTefYgACbbV2rN7Vp4gx/S8FtiTcuK+cduHuEc=; b=DD+5d5n+b+gpUc
	JPFK9K/dQkM1jnYOjXTLKsWuHNpCNSMmlB0uPlz0btfF9R427aVg20p7MP+UjqWk7Thf5tDOSr2yp
	2WoWaLeHzkl0Z2ol6Fw/ApD/ahj0CDnb0SYBT+vWwQJdHWlBJy9K41c6Hdi2dg8QZDykNS0qImPpp
	s9nqRtLewymyBnaUJlvNyvWt1WG7WuInd1s5R1lcZlnwD6et4HdUC4pZUknIsxVYaZqSjERXpZOYE
	gyKMskU8gi/8iAzyY7CA8NG/hOe3uthdYUCDtoRcfd4Pl4behzh453krK8Zyg4XKEfHQbVKtA6GTm
	ds25wt/i3UF5REkv3bOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsja9-0000000BXQ4-14vT;
	Thu, 13 Mar 2025 14:30:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsja6-0000000BXPT-2Ggt
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 14:30:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D7RYCG022547
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 14:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHUDmC4PTSFYAcWgaACKX1N5/pWQOKndXgV5ZuGvDLc=; b=ju7BUlzCln+YLfMy
	kdWXxUplQuGwkchYliq91VG/zEC2L20ojpqBGdIC36R6pUF3od3KUsdXY5vyKDSj
	QtDeTHqzqpAh7/qyWGnMbPnUyg9iYvIL9KVT5njNA4IVHul4nuR0vGEHDrMYnIIM
	WdoqiHIIjl/Yrv1iYl5CWZAlF//x1PmnAC2WX8n6ZHHvE6qQ2/meMkZ7rjeW83Gh
	mybOs+DSAlmlOjbMVxoloQoGO5V7OJgAmTMzD25rVCkyIzvlXur9Jdw8qX73mDY9
	64i6WXRPuuNeeprpab06KNhC4TWIeYh74ebIhTRLYoXhLz1D7KsHMxcZbDfRESNG
	TccUjg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07h5em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 14:30:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso3109456d6.3
        for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876240; x=1742481040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHUDmC4PTSFYAcWgaACKX1N5/pWQOKndXgV5ZuGvDLc=;
        b=j54fHVMkUxgRslK/9unLCeoN3bfRhtNH8kFZ4ZD83M8VqNNQe6DuEBF3xfbk67fv4b
         AMDVsjFtqKsABJN8pZDs4HCr+QTNuICu+0/98xZ14quZVH+8AysD1WsHpcsVZUx1TXQH
         42BTVPO2gxnpHbrxWj3uIE5fWHCs7pXIl+wy0FWlEoCUCAPc7u5ee9CKGmgdGzJEcwEt
         6cCakJ0QBYcdEEZkYe0kGJwsb43O0tTdQEsv9xHWLDTmQNmL8OwFH1GwIrkW2XCBcz9D
         WFxJpLOf/wHQNa2Arr1woEdLAxHvTinUXT3X8fUWuKSj71rLJy5xziTekv7mTJysAdT3
         eJbw==
X-Forwarded-Encrypted: i=1; AJvYcCXLlJcLSjTm2OFn7lrMboui9f0IIrhGoJHyjvEA55NTWOM1wBtAEw5MA7Ej16lSncZzbNwyZE560UY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw63yqpm6vbkRfQIUB6//C3tE95ZWvVQJgs//rV6MFpF781euTe
	CDt13FYUz43M1T9IE+rjux0sf9qxgIVVZJX3SldsWU9+Cz79Bv50qY6vHDpiVTYsz9KUe1EPk8C
	CgsXcz6NoPY/C6QWJqcC/P2Gc8ZOw1m0hZM99ectcuoX9eL2/QWLEYyLzOTVef2aX
X-Gm-Gg: ASbGnctZeeSFrcye61XUY1MF3yQy/AHNeZmb9Ovyqhx3RoUZPImzaQNNcgbH+zQJMhv
	DRQW2KxgEcIGV7udaZ2Uxa5BWhXzxQsOSlju+bGfT1nz7JaLhe/9sSh1NuRm5WP6Dk80P4OTmbg
	HrQ0sxKs6fM+ZbiWWrfe4lV2IXWuVMCJmTjy8YvUi9TxEhH4SJbVGzp6j3h6MYYRhoNSENFF++d
	B9o6lWOD62DPZft3BQtAV5GM3BeCvsujAtxvpPNvPKHoBLzjp4u9tddl0GmTqQ8YGK76QGpdjiX
	uvPTOyUaYyiKv3zQimuztbOlyUF13knvT754+Wf0Wn9RP+gA+BQzn3zDLAMwISVIu/68Aw==
X-Received: by 2002:a05:620a:40d1:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c56fee175emr285585885a.3.1741876239690;
        Thu, 13 Mar 2025 07:30:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGew7PamKyiAcrPgUIZlCIP2W0SkL4/r8o51tM8nCHDl5YMpcw4o7WNySRMHlagbq/nm3aG7w==
X-Received: by 2002:a05:620a:40d1:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c56fee175emr285583085a.3.1741876239273;
        Thu, 13 Mar 2025 07:30:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cf25csm85386166b.113.2025.03.13.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 07:30:38 -0700 (PDT)
Message-ID: <07957f72-ce7e-41f7-8ea8-5839a33f04a3@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 15:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Enable QPIC BAM and QPIC NAND support for SDX75
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
X-Proofpoint-GUID: ks-lHLTcP539C1W_ce_B7Qep29XUULX1
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d2ec10 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=puiEX6dKtv1lSrn3j0sA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ks-lHLTcP539C1W_ce_B7Qep29XUULX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=784
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_073042_713866_B8BB7C28 
X-CRM114-Status: GOOD (  12.06  )
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

On 3/13/25 2:09 PM, Kaushal Kumar wrote:
> Hello,
> 
> This series adds and enables devicetree nodes for QPIC BAM
> and QPIC NAND for Qualcomm SDX75 platform.
> 
> This patch series depends on the below patches:
> https://lore.kernel.org/linux-spi/20250310120906.1577292-5-quic_mdalam@quicinc.com/T/
> 
> Kaushal Kumar (6):
>   dt-bindings: mtd: qcom,nandc: Document the SDX75 NAND
>   dt-bindings: dma: qcom,bam: Document dma-coherent property
>   ARM: dts: qcom: sdx75: Add QPIC BAM support
>   ARM: dts: qcom: sdx75: Add QPIC NAND support
>   ARM: dts: qcom: sdx75-idp: Enable QPIC BAM support
>   ARM: dts: qcom: sdx75-idp: Enable QPIC NAND support

subjects: sdx75 is arm64 and the prefix in that dir is:

arm64: dts: qcom: <soc/board>: foo

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
