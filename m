Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27720C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6+jPOmz9Ya3ED8F/LgvmdI1b+Z8/agnjG5f+/wTDJw=; b=tKYNF8hWf6LB/sLilmEQmVXyZf
	tb2Yn2q/JRQ05ed1XG3x4TAZ+DPne7PQZz29bBr5nTnCZQEHCygVTP5k1RUIUtUpZxLHpFUZF9Cne
	30dn0dEtyvdNwQWAzMRZqwwvY2PaJQdx5akr4dfGjPNnmUnJHaIm4lzy4YuYtr6L7cI4uXTh5FoqA
	s1rAjJ40UZmmSoWZDXUUEhh3+7lqmH6E8sZrHpYF4vDSV2Xu6VUmaBym83ErIiA+TW9LIUzi6DKIQ
	CGkS4YO7KCcEFq2IXuYZ9jsYHiiw0cC+VGm98XJFzjwiQwwMveKfBGFn1I4XP33kBDZcPC0zrqqst
	DkpKntig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyt5y-00BODl-27;
	Fri, 03 Nov 2023 12:16:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyt5t-00BODH-1G
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 12:16:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3BUCid021142;
	Fri, 3 Nov 2023 12:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=46A8X1eP2WUVzUclJZb6kwAOpw9cdJyQ7xhfMFXTtpI=;
 b=WlPXciNuWt/dEEvTMVgyZPvf2OxUxldoYap/oelGgWreQ8kzXwHv0Xskptdc882XjAEs
 paNkCYLZSeul/UC/5+M/R2uZ/0ev26SObev1WR4o189sgjl6omUb0KduMKMnYgu4Bbx7
 nPlul6d8RHHqvtXTwZiHeRj2h9iIOPNGpw86CJ8PZZFJWpR2G9+clCm+HIPLX13ANTYV
 caNSazYxjCVvbh7naVNVWe4hoQ7fh7FD/LBeCCGQ5dYG69fvWmqUzA7aQaBYuOmtIyBf
 dap1Jvxu78/Lx1aJK3torsodI7081OFd7iXnpgoVtGVkL7/dFA26YFt/nZ8zbA2otzN1 +A== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4cw9tdcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 12:16:00 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3CFxDD022887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 12:15:59 GMT
Received: from [10.216.26.1] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 05:15:53 -0700
Message-ID: <e2830e29-e0ab-48d0-6aea-7959b9fccbbd@quicinc.com>
Date: Fri, 3 Nov 2023 17:45:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 4/5] spi: qpic: Add support for qpic spi nand driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-spi@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <qpic_varada@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-5-quic_mdalam@quicinc.com>
 <691607ce-ed05-4fd8-9989-ebd58f2e1664@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <691607ce-ed05-4fd8-9989-ebd58f2e1664@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lbFkFDsIO1Sf6ur0ptLLS37NrVxENWDQ
X-Proofpoint-ORIG-GUID: lbFkFDsIO1Sf6ur0ptLLS37NrVxENWDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_12,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=930 spamscore=0
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311030103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_051609_439452_2C5056B2 
X-CRM114-Status: GOOD (  18.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/31/2023 10:43 PM, Krzysztof Kozlowski wrote:
> On 31/10/2023 13:03, Md Sadre Alam wrote:
>> Add qpic spi nand driver support for qcom soc.
> 
> What is "qcom soc"? Did you mean Qualcomm and SoC?

Yes Qualcomm SoC

> 
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>> ---
>>   drivers/spi/Kconfig          |   7 +
>>   drivers/spi/Makefile         |   1 +
>>   drivers/spi/spi-qpic-snand.c | 604 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 612 insertions(+)
>>   create mode 100644 drivers/spi/spi-qpic-snand.c
>>
> 
> ...
> 
>> +
>> +static int qcom_snand_remove(struct platform_device *pdev)
>> +{
>> +	struct spi_controller *ctlr = platform_get_drvdata(pdev);
>> +	spi_unregister_master(ctlr);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct qcom_nandc_props ipq9574_snandc_props = {
>> +	.dev_cmd_reg_start = 0x7000,
>> +	.is_bam = true,
>> +	.qpic_v2 = true,
>> +};
>> +
>> +static const struct of_device_id qcom_snandc_of_match[] = {
>> +	{
>> +		.compatible = "qcom,ipq9574-nand",
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.

Ok
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
