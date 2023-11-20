Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC819C5AD4C
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTZHzP2TTy0PwOXBXE824t9sXZiuOOTGyYduJAowHUw=; b=hh6qqLo9uWiWcK
	bKqjYIk5ra49DqMpQNXPa3kjcufrgHMXEJMcAJRMux20VbKGoNZ6/1qKron9kreJabPG0AIBb2sps
	c/ymguk+y0wWnmvK3pdN9yN4LIDoUHFL8pQ5Jm6xFPRqPg2I2FDD7yO2ss2w8TBe/9SGL2uxWdAQT
	n3ZM+cmufr+WgJeOJN/JY3irUt/dCv5wRNkNuy9VahEyQHi8rrniE7iKtp5uQ56+rF7Lg3J0YSrjC
	H71JzuE/eiPRqjvhdrAUkEzKFpVXnyNu+QBXOeZ1sS9Z99lJHmeyPp3Ptv93NkfNsWJKBHVpQM1UC
	u76v430Vrdg7jT17zjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4xsL-00BFy5-23;
	Mon, 20 Nov 2023 06:35:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4xsJ-00BFxU-0h
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 06:35:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK55xDL024798;
	Mon, 20 Nov 2023 06:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D5WmKHJFvxp5MEqkfEjkHwA3uy953aAUbqh6hRAe3Mg=;
 b=ntnX2OEmo/9BDaPJoLtMMen0fue/MTtUcmJXDBhGi+qzHM8wfP+oeWtrptbWHCRDws7h
 abLAlhVexFTBLmK8ApA1qO8uf+BGXEVShEzvH4+T/gjHRd5aqTE8t7yHjuSFlWuwEW7p
 dbuwSofgoSHgiOlniAUl5Yi6fdqpq9yV3E42SYT3JDW9bOg1gKO6cKiKVRHYQoIob+sv
 DucR7mb6PQsGzQFdNerTZnriqwfYar9WDA3l23mSHGoNG++do8tPLVchoXjtV/bA1wU+
 /r6SEqxSqoj0mt5wxWFszBKqmmll4gzPMzD9VH7tavwu6DjgFYLzjqXEKSWT2xHHElpU GQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uepjhk2hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 06:35:10 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AK6Z9Z1005200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 06:35:09 GMT
Received: from [10.216.31.13] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 19 Nov
 2023 22:35:03 -0800
Message-ID: <4bf6e5c2-56ef-717b-88a8-db05b07a33ff@quicinc.com>
Date: Mon, 20 Nov 2023 12:04:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 4/5] spi: qpic: Add support for qpic spi nand driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <qpic_varada@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-5-quic_mdalam@quicinc.com>
 <a1270a88-49a9-4bdb-89a9-ce6929f2294d@sirena.org.uk>
 <2b9e943a-198e-7999-b898-e7b2498a9ffa@quicinc.com>
 <b35b4184-d456-46f3-9268-8f0af2fbb4eb@sirena.org.uk>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <b35b4184-d456-46f3-9268-8f0af2fbb4eb@sirena.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LNUnRR6UDD_bNfMDIGg3J71Zz2tsbqs0
X-Proofpoint-GUID: LNUnRR6UDD_bNfMDIGg3J71Zz2tsbqs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_04,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=626 clxscore=1015 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_223515_308540_F5409CE8 
X-CRM114-Status: GOOD (  15.31  )
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



On 11/3/2023 6:17 PM, Mark Brown wrote:
> On Fri, Nov 03, 2023 at 04:50:54PM +0530, Md Sadre Alam wrote:
>> On 10/31/2023 7:53 PM, Mark Brown wrote:
>>> On Tue, Oct 31, 2023 at 05:33:06PM +0530, Md Sadre Alam wrote:
> 
>>>> +	ret = submit_descs(snandc);
>>>> +	if (ret)
>>>> +		dev_err(snandc->dev, "failure in sbumitting spiinit descriptor\n");
>>>> +
>>>> +	free_descs(snandc);
> 
>>> This seems to be doing a bit more than I would expect an init function
>>> to, and it's very surprising to see the descriptors freed immediately
>>> after something called a submit (which suggests that the descriptors are
>>> still in flight).
> 
>> Our controller supports only bam mode , that means for writing/reading even
>> single register we have to use bam.
>> submit_descs() is synchronous so I/O is complete when it returns.
>> Hence freeing the descriptor after it.
> 
> That seems like the BAM API is very confusing and error prone.

Sorry for late reply
Yeah, By HW itself its complex due to security reason. We are trying
to write a BAM common API interface for all the driver which will use BAM.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
