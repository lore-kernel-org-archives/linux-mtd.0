Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E61C021A0
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2025 05:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOjk3oVqTmDpeRSCgHTswMixK0IAE318yV5/K5b6Qq8=; b=3qj19UIe+gEicc
	lm3EDeKt5jrrzP7A8oDdhoRzAjKLsKWgdWYFKIDbTGrlAFdX65+MIvFBjmSSIbNGg0VnVklj58S7g
	j16fohXfLDvAv6e12CABR1IEngLYTQxyCqvBslef1r+fG7Xlh7y3h8teyAviZVLkOWIL1gDBnQ3kg
	EU0yD2C5kJdR0KeBaUAX0rVKWcr4rbQ+OHwCs9dwogFNK7sQMiQK4pRpPfVKfnNM8ilee11S0HXYC
	l6J4cJCyTEnpbYuHJt2rN4KVsWgspvqxKoH7jc814PyyUI6VF9Sm40R5o8t4PK+2vNcrnIwVUgSWF
	7Rlyz2pSSW4g5HZ5YPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tju6k-00000003PGG-2p2N;
	Mon, 17 Feb 2025 05:55:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tju6i-00000003PFZ-13JT
	for linux-mtd@lists.infradead.org;
	Mon, 17 Feb 2025 05:55:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H031RR018869;
	Mon, 17 Feb 2025 05:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHguWXkBimmyRN92Oh4qZPvucUjc1G+/2HYqq30agk0=; b=j6YEceJO0uy52dyl
	7YvsPWT/lH4EWYRC5BKXLRWbkBzY+IZ/2I/cQbyjX2WhHmKCurvz/1MZCWeBrcoE
	0lOXYA7TN2/HZsxvtPFawBVGDp9SZNXuEgYqB9/NMS/mloTlFpuRDN5qwadNYLaZ
	YpItCCc5ReHO/c+FGXcTA77UXXLJdB5oV1gEFtYELkCSoRFN0NhvAPbkniOagtk3
	nNyDGIqhGTk5ULK2MUZJM2/4EENxRvgTqeZvdFwDcyQzjBcFG4Uvip0GwOyFDNYu
	PXlnigXU3JhZ4juw9kp4H7LA2OMYLUuNC3s/MLjDDGj3K/myBYaKL/MTqXEYXqWq
	oefQig==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7srku3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 05:55:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H5tf5M026998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 05:55:41 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Feb
 2025 21:55:36 -0800
Message-ID: <80746729-2b32-9a13-93f5-8d5c222ce4d8@quicinc.com>
Date: Mon, 17 Feb 2025 11:25:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [GIT PULL] mtd: topic branch for spi with Qcom changes
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <richard@nod.at>,
        <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        "Tudor
 Ambarus" <Tudor.Ambarus@linaro.org>,
        Frieder Schrempf
	<frieder.schrempf@kontron.de>,
        Michael Walle <michael@walle.cc>,
        "Pratyush
 Yadav" <pratyush@kernel.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <87jzbp9hnt.fsf@bootlin.com> <87bjwkoxwh.fsf@bootlin.com>
 <96bdefb1-4607-4a4a-8bed-b4d9b5971171@sirena.org.uk>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <96bdefb1-4607-4a4a-8bed-b4d9b5971171@sirena.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jgdh1FUKxTE_jVPzebr2GOblQCrCd6wj
X-Proofpoint-ORIG-GUID: jgdh1FUKxTE_jVPzebr2GOblQCrCd6wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_215552_314922_F4DD5F0E 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Mark,

On 1/6/2025 9:06 PM, Mark Brown wrote:
> On Mon, Jan 06, 2025 at 02:49:18PM +0100, Miquel Raynal wrote:
>> On 24/12/2024 at 17:20:38 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
>>> I'm merging the Qcom series, in case you need a topic branch to apply
>>> the spi bits (binding and driver), here it is.
> 
>> There is a breakage on x86 with this series, I'm applying another patch
>> from Md Sadre Alam on top, so I'd suggest to not merge this branch and
>> wait for the next cycle to take the spi bits if you're happy with them.
> 
> Thanks for the heads up - I didn't pull it yet so as you suggest I can
> just leave it and pick things up from mainline.
The QPIC raw nand patches are available in the linux-next. could you 
please pick the QPIC SPI NAND patches [1]
[1] 
https://lore.kernel.org/all/20241120091507.1404368-7-quic_mdalam@quicinc.com/

Thanks,
Alam.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
