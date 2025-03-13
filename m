Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBE0C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frPtZulkU3tO0p1imHi9/rqZANwhkM2FHDfmkhBcb6A=; b=cc5qmoJh9M0x6J
	r2HPg276vJK5ZM3ZzGob2iHk+FOx8GmK/AYF4/aGkGpAmYlzLlSnxPlavoxgwh2mAiyKNohKW2r8G
	j9L1U5DKQ8l/D/UNyXeoB2fpfQM6sPvD34YYJvRoQuXcVPHoMumRCl1DvsarXNxHBV2rgIDBJd/6R
	MRfYAPOvNh6Hjgyni7BI5cC9hr0OuNRVIT2ddIOVtXsI2bbnRoGnd5nfZsPU2khoezpVerJJmWIpP
	7fdxbByi0fc/kJzoaxlF4FFCZMJVVdj/iASaC2c1kMXiJ+mkisS31vIjVU75ixJJ5A5+9xzZXX9w4
	HpQqJcgK4HQwntB4Mu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjgj-0000000BYmi-07Jp;
	Thu, 13 Mar 2025 14:37:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjgi-0000000BYmV-21jc
	for linux-mtd@bombadil.infradead.org;
	Thu, 13 Mar 2025 14:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sihxzLONHjt8Oh4C9n2BqWvtteMvgUGVMwmPo7YJzWU=; b=GDd9qkl9h0jNVLCzRoqUHEUfl7
	bxi1LNvQTgqEEm+rC4ANgKGryfbpsoTs2s2TpIx7Miiubf0lydGh7KeNth6kQsdSd5C+0rAiZwK5w
	wKBhV9X7yc5tgwxEIlxhCQIqy4j0edfYCaKra/BXVsr20pjGuhJd4Kh55Gxt9VBuAa1nl7r0NT/78
	eXkFJo/FMVgzvExN+MzZ9vyy3Up7QXYmH9HDVxpnkv2KOTMhW2nVxwklbVNS/d/GzdlFXAW3k8EES
	WHzbyJBfaDNNvjV9zYa1LSJsnW6kSdngdt6M8iq2dSvTgZ2CUt3SAXKXdkhcCdR2ZUJ7MKFBF7mQ4
	nRYmvymA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjgf-00000002hAy-0j61
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 14:37:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DADTaY003733
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 14:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sihxzLONHjt8Oh4C9n2BqWvtteMvgUGVMwmPo7YJzWU=; b=Ni0N1Vw0FEkaNeqa
	01t5SuczAihq+8ElIa2m22gvmbHoIov0DCEr815mL99SpHG0hxy5xjZjmjfmGTTk
	QUd050uMF333VpBgysp8FrU0L1HxbAjwdFi43wTd1e5ntdJI+YdSz3Rppd4ovdHX
	rBxjhw21Mv0oudq3n/ycSSUtHi8zlYyYJEcdx/yl06eNDfqaxHyceakJAU1hwLUu
	gbVy0tnpmQ9bJYZdxysZW8ntpimTpxZ4vSaapzBN5PpkYNoQdM3dLo2KF90/Bxif
	9vC0N3Gk0+QyNTpn2ZzseZev6Zcujil4jepN/1+T8jP8dQkfMvjr8HM2q2lx7iAh
	QYgoLg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96yc3f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 14:37:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3c21043so3148676d6.1
        for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 07:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876642; x=1742481442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sihxzLONHjt8Oh4C9n2BqWvtteMvgUGVMwmPo7YJzWU=;
        b=MkyU+b/TKRIe8KKEIaV5BDts0SDI0vWGjDCdP0auImbmGjCnCdC3G7uz+uksbCSIDo
         6s5CbqQsamR/+R3TMpEfDEFV71ZQGlcVzZTstTCxMu/ApywVI5Xku3jOhJwKVyX2oqVX
         5ST0yM+njFM+T7DrpwLTv9/ZQvzhaU4n7hOz+MDZsDm11LQn+Pd5P0XraLZ5zz4SwesI
         TX9xltJG+xTTjIwOqeERwEJS1sexZ44SS1YZ1Y6yyzkJdt4kwZ3Es3TQQ+ptg0LolQLN
         1d4tPQz5ygnROWiZdwErD3idGtS2+gBs4tOx3qiKD9GTXQdz8CMl465/ZoWfOHxLRDjV
         qtMw==
X-Forwarded-Encrypted: i=1; AJvYcCUyTOa9eKWyDCDxp5qbRz0MRuwY+xo2034+9Ep20exCXs2svCzzrds+TtKNg4rs9OPyKV4MpSpWZdE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHMdPG5O+vc3vkBmrdoXn3JJkAj9BzvsodeIiLqYRx5Xf8VnlC
	7tM+eeE/andSnYzDQgBTGMQO0jKwzZ+PmLbaa6asMMb39oM5vxxKs2KkoP2cwQ5f/ZNKdLBc8kk
	lFnSMcEUkxr5vDQPs8iTAnEiu58PUt0iAw9a7hEtTalOgEm7vKLTWaC+fp7klqgPZ
X-Gm-Gg: ASbGncuh/QoIEZCRgQGCOvl840GDrpmfr5m+oolfBIsFyfMpTE9MrY6DQ71/uJze/9C
	E9jrBvML/zEXcYl5V838KrS0sBItTQ7iLN87bEqyQvoAkstrymeIpmzppiEawugLdeL4c2s5XXs
	JX67nUZGrZR+S1CtxwoOLJFsyUA2aAc3CAsEmiip/fsglwZ5XkQs3/I40pmqi9WlaCApexBITQK
	Zcsan/NnLvHsdo+osBMIQ0VKvhpBlfTBlxlqxDxy2kkwQZkHyCq3E7q01mffO+3Wz2VH6SEYloO
	2J2s7hDWpNkd4No88Kj5Eev1PePtQMQ8q4zVl9pvMxd/7BmEaMZMcUDOeqZVtq1WmnMesw==
X-Received: by 2002:a05:620a:2443:b0:7c0:b7ca:70f6 with SMTP id af79cd13be357-7c55e90cbc0mr638896385a.12.1741876641960;
        Thu, 13 Mar 2025 07:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERjH7r/ky+QJSZhtuQ428edqrYv/ARSPOHHVI70rPypcSuf+ECqANAAhYxQXbXX/WsiqH7zA==
X-Received: by 2002:a05:620a:2443:b0:7c0:b7ca:70f6 with SMTP id af79cd13be357-7c55e90cbc0mr638895685a.12.1741876641593;
        Thu, 13 Mar 2025 07:37:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cf219sm85801266b.88.2025.03.13.07.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 07:37:21 -0700 (PDT)
Message-ID: <d964117a-6e74-42a9-a7fb-c08e3ab84217@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 15:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: dts: qcom: sdx75-idp: Enable QPIC BAM support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-6-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250313130918.4238-6-quic_kaushalk@quicinc.com>
X-Proofpoint-ORIG-GUID: Jwh0vM5-n2nyZFDZWrsgtNlmvb4w_ijN
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d2eda3 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=eg4k1RuA93h8uGKq0ecA:9 a=QEXdDO2ut3YA:10 a=-9l76b1btMQA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Jwh0vM5-n2nyZFDZWrsgtNlmvb4w_ijN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=771
 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_143729_599951_73ECD04F 
X-CRM114-Status: UNSURE (   8.13  )
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

On 3/13/25 2:09 PM, Kaushal Kumar wrote:
> Enable QPIC BAM devicetree node for Qualcomm SDX75-IDP board.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---

There's not reason for this to be a separate commit

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
