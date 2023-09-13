Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6B9CA5503
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGqULjMfu8mjqBJeAA7GH9TG0J8msBcX8rks5flCesM=; b=vg+vSQdXy10smn
	L+tNZwtW3sOVW+4+DXphP86KE+B2YPlQ7RqkFr5yPm3asptRxyxWHKD2Pq9zckPExuifoFd4/I6L4
	nrE7D1qTysDDGHcV2erzswbwc18HogtsyiSkcsvNZbrABbB6mL0pcgJpqvdmnWOY99bSd8FfST9VS
	NUInpmjik6reAHY9CfKkgmhfUw7t007xUf5qFe0KzjZtcNH1FHMI6mbpmxB81XTXhB86JgWv8VuOQ
	aLZzkCTwkl7KHV0xoe+C2FJyzYCvujjKoX9BgpDiVNiIMCK+R4RWtebOA8C5s5aVcwhAsLamZG0rw
	n7F1PMYWJLtTSYhWOHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJzo-004tig-0s;
	Wed, 13 Sep 2023 07:09:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJzl-004ths-1j
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 07:09:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D6eLGe012023;
	Wed, 13 Sep 2023 07:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nbXt39d+Uly5Prlmsw8HTG2GrjIJiHnSfcz+v/XS12Y=;
 b=kz2Y1XsrHUeKwbroTWpqOpdNA3x3b/ZH3U9AvnMuCHan6iv5oenKawH8KBoIz4uV2oUj
 QLn07+Iz+zb4gS9p0GwDi5zRlPsEtqtjEDhuDfJRTGWncbRffvRvOJEWQHvV6u/SCyCU
 LeKJtiorHK6bUzmy4nu9TXG23fAmlW0ktGyxEvAK4JcWVId1i90MdnrxXOVKCxSM0mQ2
 WSYV+1DrzZYSs5cz4BgB6NBKFr/Qyqv8ZDnyu/B0TUCTjtOICWgrzPOsaUkfcRQeyEaA
 5/aRKVVvlovQ2nGMQhtBhEPvqa5hiXmsAw1kI3Z05VybNQ5n+30RI8HAbS54atXwb7TL UA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y8q0x58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 07:09:00 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38D78xbK028098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 07:08:59 GMT
Received: from [10.214.227.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 13 Sep
 2023 00:08:53 -0700
Message-ID: <6e1ab09c-6eb0-4e70-a97d-2b96f095d7a7@quicinc.com>
Date: Wed, 13 Sep 2023 12:38:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mtd: rawnand: qcom: Unmap the right resource upon
 probe failure
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_charante@quicinc.com>,
        <quic_kaushalk@quicinc.com>, <quic_pkondeti@quicinc.com>
References: <20230912115903.1007-1-quic_bibekkum@quicinc.com>
 <20230912142847.4610c0a0@xps-13>
 <5e80e600-b523-476a-81bd-93d2c517b7b6@quicinc.com>
 <20230912143726.GE6404@thinkpad>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20230912143726.GE6404@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rOdNNTYoqFsrUD7Y6yU-GG5R_MU-Q-A7
X-Proofpoint-GUID: rOdNNTYoqFsrUD7Y6yU-GG5R_MU-Q-A7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=588 bulkscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_000905_688635_B457B804 
X-CRM114-Status: GOOD (  12.56  )
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



On 9/12/2023 8:07 PM, Manivannan Sadhasivam wrote:
> On Tue, Sep 12, 2023 at 08:02:07PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 9/12/2023 5:58 PM, Miquel Raynal wrote:
>>>> We currently provide the physical address of the DMA region
>>>> rather than the output of dma_map_resource() which is obviously wrong.
>>>>
>>>> Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")
>>> Cc: stable?
>> Cc: stable@vger.kernel.org
> 
> You need to send another version adding the CC tag.

Sure Mani, sent a new patch with cc tag. Addressed in v5 patchset.

> 
> With the tag added,
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 

Added in v5 patch.

> - Mani
> 

Thanks & regards,
Bibek

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
