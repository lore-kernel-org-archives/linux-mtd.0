Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA39EC48BF6
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDZjbrOBTO2N/5ZdnL/wC5XQcrkvM9lrjQNJcI31cuY=; b=3/BycXBmP+ewYu
	yteudvz4q7ey4JVI+ewMlPfGIGx1QUJWyxREDp1n4XAIFFmruWOYZ7XABSz1bMm7QWIOv5PbMzp5d
	gqs6qy9GtttxB5ZAC+yz2t5IWqrvBjPL7ZlOsnNF7IVCcJeakX0UcIFC25GOnn09xmI8jckESUY0E
	G9vh6j+hVGGe8wmP2HAtPvU5g8fTmRCc2V4xeAlZ10MWPolzeA1P+18CJXebl/8PlZFKf2ZOyksUU
	K+L72+kZrfmMg+QYJj3yBxaTO1WPuFoJi4Iu1Zaf1CDDZo3g8gxcu3OCKqAnt6EOjHFE8BMrJM5eJ
	dn2tSDYy+nZJeB+RCFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjvj-00000000WjR-3liB;
	Wed, 21 Feb 2024 10:34:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjvg-00000000Wig-2xbY
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 10:34:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L6np3w029179;
	Wed, 21 Feb 2024 10:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=s15kuA4pjVy4qKgvcnbye/y/cqmB3GFypPX74p+09nQ=; b=E3
	+vm1ztPVgjCqgYRi7TylETjlJKiLaJ4wrU2ThrCYxTUFTvAPQDhn+kfRoGuxOGrh
	EGfhopK6p9JW011Nllbh0QEBV2/r9mQZ64cTcNhDEsy6dOlCcqYDX0eEw2G7NWzs
	7MFtF3cAw1+fQ75I+HS0Q8Etf6tvy/FARHrGDpTfYcUWbMhfRfPLw76uJORSyBwZ
	5JZSMCXjRm+fNzcXNyvE5sulXyO4a3dXmseGEA7zhSY3NDmzLgR4Gx6z2GtPSPj6
	kdhQeU/sm6BiTnO5i9RDR3K8BSNzZnVnA80ClwyIPrx1V/tP95ugijPGl9lB38US
	3i9t+kV7B11jo/3GMkxQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21usn0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 10:34:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LAYEro001339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 10:34:14 GMT
Received: from [10.216.62.93] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 02:34:08 -0800
Message-ID: <bfa0edb7-02fd-42dd-2235-0ea34f362515@quicinc.com>
Date: Wed, 21 Feb 2024 16:04:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/5] Add QPIC SPI NAND driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240219130412.GC3281@thinkpad>
 <3ad2909d-4ac3-fff3-739d-b12a3408fa0f@quicinc.com>
 <454a7e8d-70f5-4bf5-a3f1-bf9e42672c4c@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <454a7e8d-70f5-4bf5-a3f1-bf9e42672c4c@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MLVOkpa9aMrn448T-yV6pcqheFsX2HW6
X-Proofpoint-ORIG-GUID: MLVOkpa9aMrn448T-yV6pcqheFsX2HW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=770 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402210081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_023420_795106_5EEAA7D1 
X-CRM114-Status: GOOD (  14.06  )
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



On 2/20/2024 5:06 PM, Krzysztof Kozlowski wrote:
> On 20/02/2024 12:32, Md Sadre Alam wrote:
>>
>>
>> On 2/19/2024 6:34 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Feb 15, 2024 at 07:18:51PM +0530, Md Sadre Alam wrote:
>>>> This series of patches will add initial supports
>>>> for QPIC SPI NAND driver.
>>>>
>>>> Currently this driver support following commands
>>>>
>>>> -- RESET
>>>> -- READ ID
>>>> -- BLOCK ERASE
>>>> -- PAGE READ
>>>> -- PAGE WRITE
>>>> -- GET FEATURE
>>>> -- SET FEATURE
>>>> -- BAD BLOCK CHECK
>>>>
>>>> This driver has been tested with dd command with read/write page
>>>> with multiple file size 1MiB, 10MiB,40MiB etc.
>>>> Also tested with "mtd" command like mtd erase, mtd write, mtd verify etc.
>>>>
>>>
>>> This is not the first version isn't it? Where is the changelog describing what
>>> has changed since then?
>>
>>     The earlier patch was the RFC for design review only.
> 
> RFC is state of patch, not version. This is v2 then.
> 
> These RFC postings are really becoming mess. Some people make multiple
> RFCs and then post v1 hiding entire previous history... And why even
> bother with calling it RFC?

  Sorry, I was not aware of this. Shall I post the next one as V3
  and add references to the RFC patch and this patch in the cover
  letter of V3?
> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
