Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D46C48BF6
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 10:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Itgc1BSeIrh5u36R18OPIDr0pphSfYa1w/dZNzGsScg=; b=1KOy57NR542hoM
	CwUGbXcSOOdTpTvrD363/gpoDOMIuKn29aa6lrXLOoi1bPU0mBjWOFtZgVkKaGiBnkvj4uCr1sNSz
	qTC9Bj6D4bjDRTrbXjMNal7kfyBCEIURKAySuMZ6n9i+93Wpfqk19yQTvDwS3AGQxe8l275Q0zheH
	tQTDczQYFmourB5uyU2i3e7iH2yNaYKEiXMmd/xN/wDcAKrtxmWdFC6GFVkXPS4Nmbj/G7P1/ti3P
	sgCmB4Id51CzwDLpfrjsmz/4G3wiTCEro5yX63EBmIzz+On7TW+DBBJjQxRV1YPXgm5ZXE3HIPPkp
	yjxDwspfDkB+7FiF2XFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjy3-00000000XMt-2j7o;
	Wed, 21 Feb 2024 10:36:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjy0-00000000XLy-3cHq
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 10:36:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L8CWCX016491;
	Wed, 21 Feb 2024 10:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2tfnXEaH1+rYdVexdUMIWkSw3lJ/qZ/7127EFCDGXMI=; b=Zr
	aD7TuH7bF/s2yRCxZl+y7AAHxPRhMCpOa1a7Q7Ta66ZpNsNQkg7L+0CFrtkCJuks
	+EkSB4v/iQAiay4Sxfkg/0WGYVeuYrYlxqtngbTvuQgZrzdkoxih6CQhhjkgLLtS
	GisoLrrgOkHXXWVX7r7/4RwesGXupR8QVDdlwdCKg1eMt6mjpD72G0tLxriuy9XU
	rnKDQfPJdCBNNUNQTEDSj0OnsdqIwzDVisyGN0qbGEafHynIryeszoy5P7LcwC9M
	tqsdE+05Z064tZDS1LQsAaKXAxwAAgL5rgWj9b80BvqPPiizaXEvSU3vS287tfVG
	wBphV7Wx2DvOFbZcE4OA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdddg0b0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 10:36:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LAaaaD004597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 10:36:36 GMT
Received: from [10.216.62.93] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 02:36:31 -0800
Message-ID: <04d68be4-e053-4fea-d50a-217d423bd0e0@quicinc.com>
Date: Wed, 21 Feb 2024 16:06:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-4-quic_mdalam@quicinc.com>
 <21dde665-54b4-48e4-b963-1008ac890df3@sirena.org.uk>
 <4a0e51cf-d29a-5843-9c61-1d31a9721a3d@quicinc.com>
 <8422fb6a-edd4-4911-89b7-2974c197981b@sirena.org.uk>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <8422fb6a-edd4-4911-89b7-2974c197981b@sirena.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b-gdpO-FePoSmpYlSk2OJV-uswyjPuRH
X-Proofpoint-ORIG-GUID: b-gdpO-FePoSmpYlSk2OJV-uswyjPuRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=731
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_023644_949211_F8139D2A 
X-CRM114-Status: GOOD (  12.96  )
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



On 2/20/2024 9:34 PM, Mark Brown wrote:
> On Tue, Feb 20, 2024 at 05:24:43PM +0530, Md Sadre Alam wrote:
>> On 2/15/2024 7:44 PM, Mark Brown wrote:
>>> On Thu, Feb 15, 2024 at 07:18:54PM +0530, Md Sadre Alam wrote:
> 
>>>> +	if (op->cmd.opcode == SPINAND_READID) {
>>>> +		snandc->buf_count = 4;
>>>> +		read_reg_dma(snandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
>>>> +
>>>> +		ret = submit_descs(snandc);
>>>> +		if (ret)
>>>> +			dev_err(snandc->dev, "failure in submitting descriptor for readid\n");
>>>> +
>>>> +		nandc_read_buffer_sync(snandc, true);
>>>> +		memcpy(op->data.buf.in, snandc->reg_read_buf, snandc->buf_count);
> 
>>> These memcpy()s don't seem great, why aren't we just reading directly
>>> into the output buffer?
> 
>>    This reg_read_buf is being used in common API so that it will be used by both
>>    serial nand as well raw nand, so I can't directly use the output buffer since
>>    internally CW mechanism I have to maintain in common API.
> 
> We have control over all the source code in the kernel so if there's
> problems with the internal interfaces we can improve them.

Ok , will try to maintain CW mechanism uniform and remove from common API
and move to corresponding driver. Will try to fix in next patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
