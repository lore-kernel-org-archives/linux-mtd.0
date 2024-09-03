Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCA6CD343B
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyzbeyM7FVC0TUY5vTNcqD/3B7On858LcL0wEozfWZo=; b=ZPisN3DKnHUlOePFMo6y1uk8BC
	nmD/CaA36HbcoVGN2Jr9lOpFZTHPfU+J2bSxEmof3rAV+yCZW3R2+/Zj0m9AT7jND1ac5uBX4oHPg
	qG/1tI3cLR+oDRfN6wot/KrAYI7kB2uwG8yoZiDcMlgxwUbl4UFiXk6jvrzL9ncrmijHbdC8oXJRE
	ENf2znfmrjeuCW78xJbqjvbqE9jPqpQdeTbPX0rtI3Ut7PwNmFQcfyJaZVUUAsxBIpvLMvwftI1JA
	XiWbrakp7qjxp3O+B9M06errtkWo2gkPAaC4eH8mKQVn58JDzUU1b45WJ1S/0UGJHQXlLIlPjHNJO
	dDV97BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUQo-00000000XxR-0yc0;
	Tue, 03 Sep 2024 14:22:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUQl-00000000Xvp-23rH
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 14:22:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483BJZQO018884;
	Tue, 3 Sep 2024 14:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5X5QFp29hmQ7by+9qCpUoFC+TAzM7t4IqLCLAuIpOTE=; b=gPkkoc7bp40UJapE
	X7PfAT3pqWVLbGb4bc5RujGXS38oqPup31do8NZhBRKgJaZrF7wtDgwOn0cKtw4/
	LOpxMnAXbrtTQpnjaQGn3cE2BwkDD2T5icoOuVZ7b8hCFaJSQNsC5eyrmtcKHDZU
	zNeJgMUY+hVcYaqYZLoAlzCb5IPlACFatRyB6nHTmA/SrM37pXDfeT2O4jNUzvZm
	VascZVMDjj0x52vFsR5GoIZuGxz9hOwr8OaXSppbbuTaGdETjcqqHCxSzA4qD23T
	W3E01byOSK9p/FZDZqrdBpwJ1z7nRo/1c/29VN8BDjKSTECdBijq3BtRaKBWXkhx
	blbwLQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt4rfnra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 14:22:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483EMYMt025782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 14:22:34 GMT
Received: from [10.216.9.110] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 07:22:29 -0700
Message-ID: <57a810e0-c072-7792-1f5f-3ddbeb0c97a3@quicinc.com>
Date: Tue, 3 Sep 2024 19:52:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 0/8] Add QPIC SPI NAND driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
 <5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
 <fed18a8f-446f-4d61-a9ce-4c5e09bf0aaa@kernel.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <fed18a8f-446f-4d61-a9ce-4c5e09bf0aaa@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rttAid4ooQgcOR3iwRLcnkjL--9ZVPR3
X-Proofpoint-ORIG-GUID: rttAid4ooQgcOR3iwRLcnkjL--9ZVPR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_02,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_072251_570772_92DE317D 
X-CRM114-Status: GOOD (  13.36  )
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



On 9/3/2024 7:14 PM, Krzysztof Kozlowski wrote:
> On 03/09/2024 11:15, Md Sadre Alam wrote:
>> Hi Miquel,
>>
>> On 8/20/2024 4:12 PM, Md Sadre Alam wrote:
>>> v8:
>>>    * Fixed compilation warning reported by kernel test robot
>>>    * Added "chip" description in nandc_set_read_loc_first()
>>>    * Added "chip" description" in nandc_set_read_loc_last()
>>>    * Changed data type of read_location0, read_location1,
>>>      read_location2, read_location3, addr0, addr1, cmd, cfg0,
>>>      cfg1, ecc_bch_cfg, ecc_buf_cfg, clrflashstatus, clrreadstatus,
>>>      orig_cmd1, orig_vld to __le32 to fix compilation warning.
>>>    * Included bitfield.h header file in spi-qpic-snand.c to
>>>      fix compilation warning
>>>    * Removed unused variable "steps" variable from
>>>      qcom_spi_ecc_init_ctx_pipelined()
>>>
>>       I have addressed your comments to v6 and further posted till v8.
>>       Could you please let me know if this is fine.
>>       and how to get this merged ?
> 
> Two weeks ago you received reports that your code does not build
> properly. So no, it is not fine. Please respond to the reports and/or
> send corrected code.
   Sorry I missed it, will fix and post next revision.
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
