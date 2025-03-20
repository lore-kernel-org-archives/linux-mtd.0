Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41510C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 05:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMTTJhw6IZNR60bhDHxQTXUNC8ZzpuBvCTDRYh8DPrg=; b=rul0urqfmZBqNA
	IsptXpDQ467iujbDmQF+nbDcMFIQlSm5EWPelVWfB7IDLq034PoRcRlK0utPglGFOlpIJIsElXRzK
	6bUYrF7bmYO9MbHCOHqPtd6xN3W4SoDiKXBmU4glBJi+/1ww2N8LzFxSJ98HWcfjBXmoTMOQESiHk
	ASSNu5GyPpej+F8r2P7qiHLhC8Mx2U4SxAT/91lcNIWbIS7kT3rXrYZKzwdAtMi68OhgIpRYRB8cz
	kL9aEhVvIxOQNMY66pOFSK0HD42+HNGaQYRlhoAgsB10fAnhNeYtjSF9WGOvluUOeSqbwYxj9y9D/
	AmI797YhT6Cgq6AO5Zzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8rQ-0000000BG9z-1dBH;
	Thu, 20 Mar 2025 05:54:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8rM-0000000BG9Z-3nJx
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 05:54:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JJ5ade023163;
	Thu, 20 Mar 2025 05:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TzirwVH5VU4gkjCscgdngjuwWlXChLjrl0qrdi6aS78=; b=k5DGo+qcQA5VoK+l
	SKIN2wF1BASs3C4lQ/I5GLMdNpWvkBYMbyt38BheotCASL6H52EdCEylc7WriCbF
	3NDVfeOMeVAnsQU9MKIl8p7HR5rLfUSGO2kkb6dS1rfmTXMkCKPe88QufymUHb1P
	EzmBu6H0rr2IFZ6OGdkW+GSfOAKZTEcPDH7cGSenukEEwK6wAW9MxTW2v+ttSn3b
	j/ziSRWqUb7KzF1kwyIn1FB4lnKKlWepSX6kyo/++ZVT46pe+80YUwgtt7hb1MfO
	5LFtessw4yeI+9QTD29lHGDb36VR3T6twBtap4mKmGJrmG0XxuM1WcM4A3elRx+C
	hyqzeQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf18yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:54:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K5sL8C024503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:54:21 GMT
Received: from [10.152.201.53] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Mar
 2025 22:54:17 -0700
Message-ID: <004c7c4a-69b4-c6f6-14c2-eb62672a7125@quicinc.com>
Date: Thu, 20 Mar 2025 11:23:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/4] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-2-quic_mdalam@quicinc.com>
 <20250318073332.guylcyqjmfq5nyyr@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20250318073332.guylcyqjmfq5nyyr@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NeLOEPrrhpzlC8lvWZInxmyJwq0KE6zi
X-Proofpoint-ORIG-GUID: NeLOEPrrhpzlC8lvWZInxmyJwq0KE6zi
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dbad8e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=nuhMKF8qPs2EJ1YYQfUA:9 a=EmiLsFTZwY_euXZu:21 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_225429_077061_56255020 
X-CRM114-Status: GOOD (  26.44  )
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



On 3/18/2025 1:03 PM, Manivannan Sadhasivam wrote:
> On Mon, Mar 10, 2025 at 05:39:03PM +0530, Md Sadre Alam wrote:
>> Currently we are configuring lower 24 bits of address in descriptor
>> whereas QPIC design expects 18 bit register offset from QPIC base
>> address to be configured in cmd descriptors. This is leading to a
>> different address actually being used in HW, leading to wrong value
>> read.
>>
>> the actual issue is that the NANDc base address is different from the
>> QPIC base address. But the driver doesn't take it into account and just
>> used the QPIC base as the NANDc base. This used to work as the NANDc IP
>> only considers the lower 18 bits of the address passed by the driver to
>> derive the register offset. Since the base address of QPIC used to contain
>> all 0 for lower 18 bits (like 0x07980000), the driver ended up passing the
> 
> What is this address? Is it coming from DT?
> 
>> actual register offset in it and NANDc worked properly. But on newer SoCs
>> like SDX75, the QPIC base address doesn't contain all 0 for lower 18 bits
>> (like 0x01C98000). So NANDc sees wrong offset as per the current logic
>>
>> The address should be passed to BAM 0x30000 + offset. In older targets
> 
> You gave no explanation on how this 0x30000 offset came into picture. I gave the
> reasoning in v2:
> 
> "SDX55's NANDc base is 0x01b30000 and it has bits 17 and 18 set corresponding to
> 0x30000. So it is correct that the IP only considers lower 18 bits and it used
> to work as the driver ended up passing 0x3000 + register offset."
> 
> Then you replied:
> 
> "This address 0x30000 is the address from QPIC_BASE to QPIC_EBI2NAND
> e.g for SDX55 and SDX65 the QPIC_BASE is 0x01B00000. So here lower 18-bits
> are zero only."
> 
> No one outside Qcom knows what QPIC_BASE and QPIC_EBI2NAND are. We just know the
> NANDc address mentioned in DT, which corresponds to 0x01b30000 for SDX55.
> 
> Please reword the commit message to present the full picture and not half baked
> info. This is v3, I see no improvement in the commit message, sorry.
> 
>> the lower 18-bits are zero so that correct address being paased. But
>> in newer targets the lower 18-bits are non-zero in QPIC base so that
>> 0x300000 + offset giving the wrong value.
>>
>> SDX75 : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
>> SDX55 : QPIC_QPIC | 0x1B00000 (Lower 18 bits are zero) Same for
> 
> There is no address as '0x1B00000' in DT.

Mani,

Please see if this commit message would be acceptable?

	The BAM command descriptor provides only 18 bits to specify
	the NAND register offset. Additionally, in the BAM command
	descriptor, the NAND register offset is supposed to be
	specified as "(NANDc offset - BAM base offset) + reg_off".
	Since, the nand driver isn't aware of the BAM base offset,
	have the value of "NANDc offset - BAM base offset" in a new
	field 'nandc_offset' in the NAND properties structure and use
	it while preparing the descriptor.

	Previously, the NAND driver was incorrectly specifying the
	NAND register offset directly in the BAM descriptor.

Thanks
Alam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
