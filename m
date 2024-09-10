Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E92ECE582
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 06:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PNlzCDYzy/QNDYT8z+asZlwTvmarR93QokygVUQDwY=; b=AhsFQGUorm4vio
	n7hSTtwDh2u/TmSL2hPstZ6lOwbO48+Q+N1pAFrZeftCh8OvLaxWOqsJfAvmyWtvGFHOE/THYeHep
	bKk+BWc+CirPLIo3CgP99HxfdAMk2EDeCuytkRWIU0Oy/nySES9dgIkM2ogi8jGylH8xUHpbcev+B
	967OLVzRce0VvJmpnU5dZXwW8OmJkhi0JxEK3u7tL/4GRkEHVDEB/Y7KTzvcQXcwWwhKV9066CoOe
	+e4yyU0kkHAKu2/9k8aurr2tcJyStCZ57pglxXYHMyuVFy1lYeYkZCqjrzuFqERUS+BdudNJ0Nko0
	gq9hZqyXzcIvX4qrNRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snuGU-00000004R6S-27AC;
	Tue, 10 Sep 2024 06:22:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snuGQ-00000004R5N-12nM
	for linux-mtd@lists.infradead.org;
	Tue, 10 Sep 2024 06:22:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A3mI8H028083;
	Tue, 10 Sep 2024 06:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abGkKzVbCFyg6JdPil4boqV7m6mzwnRG4sSLRPcCDkU=; b=IORkB/U2GEXb5SAd
	66NTftFHUvLgYmCnfdAD/rUZJIng9zk7Ay7VZDHzvF2ooDb3IJY3yUpe+Xz71Np7
	zthM8eHN040D1RS+y8Un161tvNpUB2SNERtDQ8da+bV0DD3YxawDt1Sx/9HokC6T
	C/qkPCUC0MZKnYYnPCurNyXQJSh9cjNPtPEug7g7dCXF4cvXWaS4YSH3MG/bqi4x
	dPuDsheJcb/JlUIrMk+ky1UJ/bl0q1nq6wqNXf8rLYWQj34EmNNH1v78Tr/u+u+z
	vLpCA+Jcvuyh+VqsGeV1WWORXSNwnZUztETDrVe04CgP1+g3qrpHw6iEG5z3wonP
	PEeFGQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rcwjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 06:21:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48A6LiPU025302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 06:21:44 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 23:21:39 -0700
Message-ID: <bb1397c3-2327-e211-f7eb-cac4b126424e@quicinc.com>
Date: Tue, 10 Sep 2024 11:51:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 0/8] Add QPIC SPI NAND driver
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
 <5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
 <20240903150826.749b8560@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240903150826.749b8560@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mRLGbG3WlngwSJ0VTAdjQSQVj9PbpP2f
X-Proofpoint-ORIG-GUID: mRLGbG3WlngwSJ0VTAdjQSQVj9PbpP2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409100046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_232210_579812_318D7477 
X-CRM114-Status: GOOD (  15.05  )
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



On 9/3/2024 6:38 PM, Miquel Raynal wrote:
> Hi,
> 
> quic_mdalam@quicinc.com wrote on Tue, 3 Sep 2024 14:45:15 +0530:
> 
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
> There are still kernel test robot reports, so this means there are
> issues in your code that I don't need to point out explicitly, but I am
> actively waiting for them to be fixed.

I have fixed most of the sparse warnings after converting __le32 to u32.
However am not able to address the following sparse warnings

	drivers/mtd/nand/raw/qcom_nandc.c:1401:29: sparse: warning: cast to restricted __le32
	drivers/mtd/nand/raw/qcom_nandc.c:1587:30: sparse: warning: cast to restricted __le32
	drivers/mtd/nand/raw/qcom_nandc.c:1588:31: sparse: warning: cast to restricted __le32
	drivers/mtd/nand/raw/qcom_nandc.c:1589:34: sparse: warning: cast to restricted __le32
	drivers/mtd/nand/raw/qcom_nandc.c:2479:47: sparse:    got restricted __le32 [usertype]
	drivers/mtd/nand/raw/qcom_nandc.c:2480:47: sparse:    got restricted __le32 [usertype]
	drivers/mtd/nand/raw/qcom_nandc.c:2616:25: sparse: warning: cast to restricted __le32
	drivers/mtd/nand/raw/qcom_nandc.c:2672:32: sparse: warning: cast to restricted __le32

These warnings are seen with existing kernel code too. For example

	drivers/mtd/ftl.c:299:39: sparse: warning: cast to restricted __le32
	drivers/mtd/ftl.c:387:23: sparse:    got restricted __le32 [usertype]

Hence, can these be ignored as false positives and post the next version of the patches.
Kindly advice.

Thanks
Alam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
