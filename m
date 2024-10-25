Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351A1D149E0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCfy3YCfcwDfRVF7wqPwkpiU148lTfpXWCVqKtIHvj8=; b=u29oO90O1D2+rY
	SXMMi02C0NY8TdPdX2VSvga0OHG7GNmaP5oLAfHTJzOip7nFb+po1MRBUyXo5PY1BKHfta8Uy7LJ/
	6tPIOOf3gxnNJqzO3GEWojKTvAR3C9gZ0OZ2d64s1drAUQhBn1sReyJfSmSHlm3ouZLJPIXC3q58P
	2qmsbjZRsdsQiH2WRJ0L9+oKnkE6tKn4qWCwcAmN4i5RCl8mKWW+oBVNR/crWxRCNF42BV7mHpjJ2
	FoFnGJVGMNzM3eeRNQAhR7Y9xxUqKt/Z9Sp2xiTZV+Zo17qYZkCgDOj1pwErKa+w+/Q+BJl7xJGBn
	wxxgBXbN9O8DCAOP5CNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PGz-00000004qJI-2wDt;
	Fri, 25 Oct 2024 18:42:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OpV-00000004lJ3-14qu
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Oct 2024 18:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qrmL14AEOznY4BwbvXypNlUpeH4TrifR/CEAuIy6fto=; b=icWsel8uItK/8oepdJQzq9XuKB
	yrXF3vzcs64Y7uLD7YMcHIkOif/cqtRL4PfBEHAnkcbLUUjc119zG2byZqjq7XpwL80iX3W9fgwUO
	OhNpkFmT1vAvxHyPx+wjnyP17+LLBgxjtagiEZBERrOqHXwYi1NOuwf8ofSMpF85qOsrhptvKVlaa
	hNgmAVOpvAYSRsszuXQE4vRmGzDx/HHediR0LeP1JkfPE4VeDi9apitW7vfNZrqstfDYyFqQMnfX0
	aIIhwpnZFTh4Ty1Q+FKIGylodTNALPdD/OXSfvLF5usxrs8u2zb4+j28CB9v31C55aVXm31wr4kE2
	/A7yGZzg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OpR-000000091A1-1Y7E
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 18:14:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PEui3E011432
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2024 18:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrmL14AEOznY4BwbvXypNlUpeH4TrifR/CEAuIy6fto=; b=erk4/iaRuHTcy+02
	jGCbVFUGsnmWbbgibLC3TSXMeqNMBukwzEGnpGm7SrwSm2Nn8hVkZnPir3Z3uaYN
	GLTIqEV7rL8C06WcTAQPzqSCopbTjCUE8INWvRt+EtyA46/Z6Mh/1KPhBcjf4ips
	tzKeOV2fIM9og34eoPsvJ+yBpuYcE2bLqJEuf3i4uPhCrqpH1o+u+jIldDeCCk6w
	sQGZpa5c3tJKRJrkJF/nO5fI7pNBAZ7/QkSiKJJiFYqEzMLHQqzR8QE4WcvwAcCO
	FzW7beAUJzunVvfxGGRObKBIrF9XhLnEL25xRnaSQ0jfIwYtJJ6isr+xlBY4P0Xk
	VkIAIA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g5q822p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2024 18:14:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbf3f7273cso6566786d6.3
        for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2024 11:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880061; x=1730484861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrmL14AEOznY4BwbvXypNlUpeH4TrifR/CEAuIy6fto=;
        b=wo5wJdxzcnsWyJRFLnOaIKZ1KJJlw8flD2YZV5rHh8yNuEk4VY/fwR7dDsdPkMjzXh
         XBxyjAz6YNUjArHscAWPenmq1rfcMlhBM+pm34YtWnGzyEzTlIjMZq7ibIafDf5hFP17
         9Cf141fHTxdns8Nq+D7Snx0B9/zlnUh4xRVdrSFAdrZq/QV4yqwEUO58ST17y8Z9wo5+
         55uhE+LIVpEoNTnduUSqJZbGp0S/0qmEpOFctqTxkRwoEMd4DEXY2qPyONnKpsi6v2zz
         JBNS8mqYxtkr8eWjOVVMu4dMIs+X+S8bXcaUUNzNWlXkzrsIysCIc15KjFib05ZjwIjs
         /d9w==
X-Forwarded-Encrypted: i=1; AJvYcCUaefef/a9NdW4wR0q1hKy70Wd0uDxOPm9H8B23NCcMdoEyN66TAuROCGikEIHnLYGMNLHcz1Q/j7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUbDG/elhOoJ/FqdzB9XDOPCVK3R6XseFxG7CrG25CyWKlSKf/
	nkS+J8TSHQww8lrspnU4Ak6MSqvflaxugrZdU3iP7WzFUSxQWYrc4CO7mb8fQyD3Od6V4bKdewq
	jdi0A6cyu1Z1uHXKqCWXwjMLnJxN2PjF0RphxS38Y7Zn7IT/JW3BpS/gA47DREfcl
X-Received: by 2002:a05:6214:1d0b:b0:6cb:e981:d7dc with SMTP id 6a1803df08f44-6d185862e6emr1909076d6.12.1729880061484;
        Fri, 25 Oct 2024 11:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXzk3TSC3Xw8NDVKHFxS1ilkakzcOocvD+KuNE8wkBN6jCTi7n2E4Li6yt8CN+Jb53ACok5A==
X-Received: by 2002:a05:6214:1d0b:b0:6cb:e981:d7dc with SMTP id 6a1803df08f44-6d185862e6emr1908896d6.12.1729880061187;
        Fri, 25 Oct 2024 11:14:21 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb634737fsm850633a12.82.2024.10.25.11.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:14:20 -0700 (PDT)
Message-ID: <5a98076f-f5ce-4400-b554-6593d51de9f2@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/8] spi: spi-qpic: add driver for QCOM SPI NAND flash
 Interface
To: kernel test robot <lkp@intel.com>,
        Md Sadre Alam
 <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20241021115620.1616617-7-quic_mdalam@quicinc.com>
 <202410252355.ZofaMeku-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202410252355.ZofaMeku-lkp@intel.com>
X-Proofpoint-ORIG-GUID: UVf2vv1QEGqbsnK7IYFMoHSl4iRAE5tV
X-Proofpoint-GUID: UVf2vv1QEGqbsnK7IYFMoHSl4iRAE5tV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_191429_950135_DECB1926 
X-CRM114-Status: GOOD (  15.50  )
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

On 25.10.2024 6:08 PM, kernel test robot wrote:
> Hi Md,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on mtd/nand/next]
> [also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.12-rc4 next-20241025]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-Introduce-qcom-spi-qpic-snand/20241021-200849
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
> patch link:    https://lore.kernel.org/r/20241021115620.1616617-7-quic_mdalam%40quicinc.com
> patch subject: [PATCH v12 6/8] spi: spi-qpic: add driver for QCOM SPI NAND flash Interface
> config: sparc64-randconfig-r073-20241023 (https://download.01.org/0day-ci/archive/20241025/202410252355.ZofaMeku-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410252355.ZofaMeku-lkp@intel.com/
> 
> smatch warnings:
> drivers/spi/spi-qpic-snand.c:1260 qcom_spi_write_page() warn: unsigned 'cmd' is never less than zero.
> drivers/spi/spi-qpic-snand.c:1279 qcom_spi_send_cmdaddr() warn: unsigned 'cmd' is never less than zero.
> 
> vim +/cmd +1260 drivers/spi/spi-qpic-snand.c
> 
>   1252	
>   1253	static int qcom_spi_write_page(struct qcom_nand_controller *snandc,
>   1254				       const struct spi_mem_op *op)
>   1255	{
>   1256		struct qpic_snand_op s_op = {};
>   1257		u32 cmd;
>   1258	
>   1259		cmd = qcom_spi_cmd_mapping(snandc, op->cmd.opcode);
>> 1260		if (cmd < 0)
>   1261			return cmd;

The robot is right, qcom_spi_cmd_mapping() should return an int, as you
return a negative errno upon failure

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
