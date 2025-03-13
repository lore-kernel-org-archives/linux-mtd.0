Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82992C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezybI39Ld75gxPwbHY/Jz1dsUlH1hz2vdi8Y7eRfg94=; b=BzYdXZoSHESq0S
	yPDIbQqerNe7AkpiR54WMHa9n54jGJCK143JrTyMhC7ziZTP3drbnXdsqSYANai7+KGjYZGCNIPtu
	U2Vfipur/QDU2RO015saKQss7TgmaMjhwKY8NPXTfrdYnZsyDugu1zivseX0V/Aqf/mK5nFIEIuSN
	fg4m7RD0SF+HsBvl9YGWMF6w6hPcE1ckY5t/3X9L5oQPfy8bYoN8sK3nCpQHoPiHQvt4DL9FW3RjE
	lqUAJCqzB/xTvCAfyLvL+2Nyra+4lWUPE05DO4XKhsm96xFj6ornao+NyBtWGi5YyhYgafiq5QKHn
	wbjOHZAtxhHR/BwSwogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjg4-0000000BYbm-1seq;
	Thu, 13 Mar 2025 14:36:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjg1-0000000BYat-4067
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 14:36:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DCArgw007418
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 14:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iayw8L6OX7w5xqy3B7BuifNHp7uwUgTuMGxBekIniRE=; b=LOnlQYMVTahsWjbi
	rVEBFc9qK85ziMo4ChS2xBAlNqXqTBl5SIq81UVC5F66SQg5JmNIWTnQjoFng3gM
	ZGetDtXF4zhKhU/qLbxZIiXV8LU0BDGnpJOsSQ+8W+sZJD1rcklDgPf78nMAJW8Z
	/3UO5ZbbFkCVyqFxiqySACe5RYe1ovHCrzQahNL8qFtvHepAPrgqukq6RdfoZxaF
	9cAf2yZGbbYOvvLySXY0NYZ99kSvh2IwsE99yuhHkN1pREtDxwb1/PHxngxIGCDS
	/p8KyrfW4f007ltqzS49AN4WgakqOpF6vGhlLL+r8q2KUC4N5s3ZmmlmornetAVh
	/FbpEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg89w9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 14:36:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19bfc2025so3162586d6.1
        for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 07:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876608; x=1742481408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iayw8L6OX7w5xqy3B7BuifNHp7uwUgTuMGxBekIniRE=;
        b=FxtFnUETSWwSy15s+xuYNAluW5voqXLtbZ/LTAB7fcI0ZqCu4tlOxpidGyggWp/DEF
         ZqtPtvvFUKlM5ApTdzFaemB/2voVyT4sOfvuHQvjNJl80liK2Atg0qwZZO4ZREIEBLPv
         qsIHXMP+uwfyhUoaRcWFm/44oMKF9dPPexA2DkewWLgbJBdaCz3rw/gRxJy7h5lIW8Ab
         No58K1TRPwS9mnG39ulnli6BnFz2z9nc5hy/LYkKpn/mzqCoCH236x7wpWQ29J5spqz5
         1+BF5kTxnGExZplR2J9gQqBwBYc8bVJ/fIvb3xjCHHoBfl9vzAuejjlabG56TQWi1X73
         YPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDLifk2I6isEaBgRAC+wHf1qcZKpx47Wz7md7NozSmvOnmuetAMDLGvtPPPSmL3L5PwFPoP47Nfjg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyP30J8FoJ9tBk33RvQz7OGWvDrdwtJ+ecmq/uLnc+YVDAZ1dfE
	uTL35Q+6EXeJX4tCyQIGsjusRqSqBtUz7eNMFuo3irxDdXsTe1Ls5LRi9VHOVpOAFfaF6TNJw7n
	ddb+iMPt7wpmhT0dBZtDzOrGhmkgPkSUA1X+PkCY/Ujs12qq127b34gS3KN7DuAMv
X-Gm-Gg: ASbGncsdGsTeKZtO+FFEpYoh8rJ+oxiosKEygbDALBlojdnxEb8LCnyHd7OwRiUfyzK
	wOPEKyHvgl3YnjVYkDXz3Jifv4+pNtM6Ab8rflJaxXc8wpEueSxI+SFStRwAIIgbRocqomxm0hi
	okEDBFButgKoBn2kaO7B6kBE/dd5Te8iWSk6crmGMKfXSAfmoFSm5YNf5REwSV4T66igkuLTGH6
	GDDj4YJxuFcU6A6l9dZK6hhl5dDwuifijD/A6vCbuIbWVQmcxCzAqNWWYhkEbTAxeFFwV5WMfP/
	wqn1DIEYX8/Eh420JEO4u4p0zdGAdTT0iVee+l+ewReXf+cLy+52PX5U2ZnUycZa2KsYVg==
X-Received: by 2002:ad4:5c6e:0:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6e908d5cd3fmr118537676d6.6.1741876607899;
        Thu, 13 Mar 2025 07:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtErHMVXuVhR9/1k6bEnfgqC6qn9DQ6fe884e1yhVTkqGYcXJ5LojlhftI2iNuNv3u6p6Rwg==
X-Received: by 2002:ad4:5c6e:0:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6e908d5cd3fmr118537536d6.6.1741876607455;
        Thu, 13 Mar 2025 07:36:47 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0df9sm87916766b.99.2025.03.13.07.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 07:36:46 -0700 (PDT)
Message-ID: <2fb1ddf6-0fca-4bf6-9970-728448f893d2@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 15:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: qcom: sdx75: Add QPIC NAND support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-5-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250313130918.4238-5-quic_kaushalk@quicinc.com>
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d2ed81 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ncw13XDXEW9X0_jSTFUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 6GsdJf3KKPn5IMb72WK3pHXP-O_pu8oH
X-Proofpoint-ORIG-GUID: 6GsdJf3KKPn5IMb72WK3pHXP-O_pu8oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=888 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_073650_000686_7C0B4DDD 
X-CRM114-Status: GOOD (  11.37  )
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
> Add devicetree node to enable support for QPIC
> NAND controller on Qualcomm SDX75 platform.
> Since there is no "aon" clock in SDX75, a dummy
> clock is provided.

Alter the bindings not to require it then, instead

[...]

>  
> +		qpic_nand: nand-controller@1cc8000 {
> +			compatible = "qcom,sdx75-nand", "qcom,sdx55-nand";
> +			reg = <0x0 0x01cc8000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&rpmhcc RPMH_QPIC_CLK>,
> +				 <&nand_clk_dummy>;
> +			clock-names = "core", "aon";
> +
> +			dmas = <&qpic_bam 0>,
> +			       <&qpic_bam 1>,
> +			       <&qpic_bam 2>;
> +			dma-names = "tx", "rx", "cmd";

Please make dma-names a vertical list, just like dmas

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
