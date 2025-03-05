Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C377C19F32
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOPiwGJUFFcRLE0pQPzBUYSNofdTYRP5pDc6HwPgG30=; b=UDAKFtWkV0UQ5imzWvbw4CyDUF
	5tAUejhG1pGsF5ythtu7YgHPZP4hfnKhzELEBUMe+Vh/fVTrN8z5MWE5UnYkvg3kwOiBz5iDNfWVb
	3fZBWnuKxN7j1QIZATmvFdm6HdMPhYYDh/dBhv/+13iVLCJQt/hi3HG0OO3sYxR2+6Yg+O/6WTCT6
	I0qZLqXSn+PQ80w0WOVfz1a5C8Zq5yUHUDwUGhwVHf1YmAIayKUJsXLGc7v0sHbAf2uOqGdWLYdIT
	C9bAtGd7R8datVQK4eCPtQMcfomuTP/qw6Bg09MYOyfkc0oVFhaxV1+QpiYUaLW5l4UjOBpYQNIkr
	kTMu66qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpndW-00000007yDU-16S5;
	Wed, 05 Mar 2025 12:14:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmsW-00000007qkH-0KYB
	for linux-mtd@lists.infradead.org;
	Wed, 05 Mar 2025 11:25:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525B1B13029016;
	Wed, 5 Mar 2025 11:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggpKhzhXasTU/fGYnPTZ/bmi5BaVyOLTD83OpA3mNRo=; b=e9z5ulmS8wpuk7sv
	3KDlZj0VtKQJFj1MJm8wYDJbYMZXEKIWV56UjtDAheVEvmbFIqwMeSR+gMuLGe96
	X20KOiq7xD9Xn4pJosj1xToeARUSlYkE7sdyLIxO1ANrjqanh/caiT/aJev3m/Bm
	fhNTEzFL5Exv/pixMcatdsKeQrswZ2sfZIhfZXcAGIPbwIzK3v2JEBp7AEceqIL7
	JwBrLNOJXOYLBSV5a7Nh7G9Da39J02w3lR1wDveMP4Q6SieJykGNUq4rFTsTjwGw
	tQbnZ1ou8gEEWHnzviZK3UZHP2VMmzSvHLxr/vKqY8Zv5/UdV7cR+2kHK390NO1Q
	d1+M1w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tn5jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:25:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525BPOJO032203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 11:25:24 GMT
Received: from [10.152.201.53] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 03:25:20 -0800
Message-ID: <04ca77f0-55de-3f1d-7cc8-5a7b9aa70b33@quicinc.com>
Date: Wed, 5 Mar 2025 16:55:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v15 0/2] Add QPIC SPI NAND driver
To: Mark Brown <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <20250224111414.2809669-1-quic_mdalam@quicinc.com>
 <174109164799.27220.16782141488752139254.b4-ty@kernel.org>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <174109164799.27220.16782141488752139254.b4-ty@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c834a5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=PR9Bvw7T5Ps_q21Qd_UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -NSwt4c7gjvIN-N7JVhRMFkvSfB5O153
X-Proofpoint-GUID: -NSwt4c7gjvIN-N7JVhRMFkvSfB5O153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=918
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_032532_148514_4EB73C22 
X-CRM114-Status: GOOD (  17.49  )
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



On 3/4/2025 6:04 PM, Mark Brown wrote:
> On Mon, 24 Feb 2025 16:44:12 +0530, Md Sadre Alam wrote:
>> v15:
>>   * Skipping the following patches
>> 	Merged:-
>> 		mtd: rawnand: qcom: cleanup qcom_nandc driver
>> 		mtd: rawnand: qcom: Add qcom prefix to common api
>> 		mtd: nand: Add qpic_common API file
>> 		mtd: rawnand: qcom: use FIELD_PREP and GENMASK
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [1/2] spi: dt-bindings: Introduce qcom,spi-qpic-snand
>        commit: fd6bc2ba410bf7828dc2104bf78b51ccbb216c40
> [2/2] spi: spi-qpic: add driver for QCOM SPI NAND flash Interface
>        commit: 7304d1909080ef0c9da703500a97f46c98393fcd
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

Thanks Mark for pulling this ! I will follow it up

Regards,
Alam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
