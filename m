Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F331BC369AB
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3kY/7e9zjj19BMuT4TYUlyx/eDwSOjOB/5u8hkK9sA=; b=NYv4CuczHUNitZ
	WqOf09BjmvbcLe2DmpOVlJ3LUQEzP4O6YB5uI6FEZmI2nWolgfcqWfR8+xwkLwl0SCqXWGRjsESFi
	4odpWVrUY8IxMQCqbivGIYZCAQmWR6zQsClrvXcLlzQS9IIOyY0ZPrMXHphz/hejDD5DLTqA5uiYj
	2JBqT9DhrTF3LEy8CqBCvUckSfyyebj46pVhuXXit0fOuF1nhB4SW9kfQAxbx5cANVUQT4pzmISn6
	ft93aIKF6ggZE1eZ9WJRakcGCzQkrTOygrPzSFNXgrCIwqFXlwu1MAI2kOvXNMhNMOO/UOHdNNHu+
	cLvFqjhy9qHkkfmFJy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dEK-00000005HCC-49qe;
	Tue, 15 Apr 2025 10:09:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cxY-00000005DPh-2MPP
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 09:52:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tL1s019767
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebp25KTVcY1mUAqA9R7DsK7wGxUkxQQ3jeK5351XBkw=; b=pAR6955ZBN+rB+Xu
	Ug2zNd10LaLaYRvzPKm2NsQkiyUtPKGRyaLHgaruAuxeshAn6v2SyMpKeKSnbVm3
	5Is1o2h5kNsOzAeaskQqzmCfIdKMvGs5vD/+mms/2KxuNYqySHXZE0eVr2R8dZ+k
	n9XqCRxU4uMMnpnCelU7pFqByzzJnh0ugW4DLh9vHCGPCxkWKWNjo7VabkCZgS36
	+hlPjhFy7KnqEKJMOx9uDr7gzhie/j5OjC/K9+ZzHBzfE7+wSck1hZ12dKSzH/TH
	JF8ZIE9kxLuhVXHyW1kLGYVn3oWlyeR9dd+Un0JrUdg0aDq0t6mPR+7s7Y+R/THv
	v9iGGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcyf96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 09:52:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso110628885a.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 02:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710722; x=1745315522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebp25KTVcY1mUAqA9R7DsK7wGxUkxQQ3jeK5351XBkw=;
        b=Nh5TF0o8pXoYN8AE1LMHECvjbRLFw4AkF6rNAzidYajPhgNwE3UEnj+QcrLvAgWkoM
         kOCPsuX7VRcSR+gq9pXHHFlBJHCJHs2A5ieamJbTHwJJuBTsA398t2LIAZ7au1RA3TlZ
         /kGDbxDzibgX8T+6tV8OF2TRr96F8KRmLcmR12inW7ka76RKhEefamTlNCdpOklwgL8y
         jh9DNRaKxozPm+s8mzaa3cjlwiIn8Bp7BGOj6TzGO6dskt2Ax0o+r3LWXNIqViasmbfG
         teUHw8vt7Zantn8xfzJeyxVR34v3cWKh/c7DJU/obJopkXAbl/YY3NgMrw+EKJY19mpC
         /9QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtxNpT1jv/q+rn1W8ZQ0yki7HgiEDepzh/W86gcz+U7a5nE2wHuHsMknHN2oH6vg7D2wrZ1fPUkkQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlE6IW09XnGKWTW++zWKyekEq9Ns+SMQesADMWfIyTmr7FUphH
	22PtNK9Z49unOX5Vw5yEv4gm2ZdVg5M/lDtJhjuDxBQePnHbLzDU7vfdXKtFpdNnBZWQSGflXFT
	/hDTQITT6Rr7NGgIuEqSicmeihf3r+ORO9VmBhWMESUN+9NBrJPDemH/omWVLJBTX
X-Gm-Gg: ASbGncuG7ynh7BXzaDDlX/+e73l7ZavNNvgeYuKM3yu/tzHLn+NqgMwGQ2Gi5kAuRCj
	/YO5DReNTXLTWiQCVLclXuvj6jKz7itu4J1MgQKAF4bH/sMVIR5yL/rGBlm4BMWNJieP94ujYxi
	WrlaGKv7c2/ln4NjqsLWF5TrKkRty9Hbm9c1j42Wt/kn1Ev5OBd8v1fPM+/fX5OYuhFhRcA53iJ
	9gO5R8vk4XJQph5SAad8+XM3h18uPj9ksxOSaZhRArLUmevJPj4sdtRpFzM/c7NF0gjut0YyBW9
	setT1a3FWbxDVV1rGQO6OI+Uk62EtlwCFY5XTjhgyDvSYoQS36uPCHTxOO1V+nlb5IU=
X-Received: by 2002:a05:620a:28d6:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7e5b706c3mr148945585a.15.1744710722499;
        Tue, 15 Apr 2025 02:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6eE3aexRTtrLGQXx+8WtgcWasctyUV4noEcYBOFknm9DaHBEdqfmSXMP2iUTUVqabA0Ebxg==
X-Received: by 2002:a05:620a:28d6:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7e5b706c3mr148945185a.15.1744710722203;
        Tue, 15 Apr 2025 02:52:02 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb40c0sm1076488366b.109.2025.04.15.02.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:52:01 -0700 (PDT)
Message-ID: <c9a91cf2-f9c3-4687-a68d-c34209c4520c@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdx75-idp: Enable QPIC BAM &
 QPIC NAND support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-6-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415072756.20046-6-quic_kaushalk@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe2c43 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=-9l76b1btMQA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4DUDdFb7piza8-4Gi9u4SmuzsFw8yU_c
X-Proofpoint-ORIG-GUID: 4DUDdFb7piza8-4Gi9u4SmuzsFw8yU_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=790 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_025204_609991_68DE48DA 
X-CRM114-Status: UNSURE (   9.64  )
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
> Enable QPIC BAM and QPIC NAND devicetree nodes for Qualcomm SDX75-IDP
> board.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
