Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A38C021B5
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ue1yxAmP+rDArrL76FLyB+k6GDq0Pn0j2IKinQ5YElo=; b=ofhMebCupJp7Sn
	9l8+Pb6eYvPh4E56ephcfTNcXZOi5aiXxKiA2QN/QpQMV0a6G9g1UlcAgH1EZHSNyJwprNpBFijES
	G6bt7FJY9Ca781HNKOJaZLRy+4w9EFMfWP+EB800PBhcnxXwHKb/3pi5++iOYn4nDZj5VGjdNfqKI
	hOOxhSVdVr/14T5nMSo75XvLamkPy19dj5yKKMnOWSJX2Yp+W1w/ngqveFk/GoQH4cnJd+lQ3XIRL
	N5Bu2nBvuu7hWxt2MjzYotOH5d9dlLPDUijFWRLQlFwDU6ad+ne3m2bBXp/HftM9RRivo2xYImYU/
	JOd+U6jIaQcIj6BTNxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlStJ-00000005bQa-26VA;
	Fri, 21 Feb 2025 13:16:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlStH-00000005bPl-0zh2
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:16:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LCoZSC012227;
	Fri, 21 Feb 2025 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXZATStOuQiUIAFb67THfjHdGBUb7YTvKE8kj2FT690=; b=GXpc4jkmdL/MQPOr
	pZp6PmeL5Mi6h+yjuc7De9EjOcGwyLk5Pzt+DWsFuvR/4zMHpji7JNti0PzDAsuF
	iuZbvlN3vWkCNT3dXV3XjsLyd/9+5x7WucaTYx/SwXM5Uzym3sMyZpu2PA0fcbZ/
	ElH+Q7hSqBEDGfS94WFZxNChfTCTL7xbpz94nJjmDLZximaFc7Kdx+cS+jv4InpO
	O3MC+FBUWRZZ3ovwFu7u/g+N2IJy4VU44DrfTPhwtfk8/cjY2U/UvWRPue8rGldQ
	Upx+Cvchd4mqxlWfdssnCq94EEAFk8TQ1ubenUTdIjdE5cgzjvAL1GTrzmDcT1TW
	Dlg9cw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1t4hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:15:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LDFmDi007900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:15:48 GMT
Received: from [10.133.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 05:15:40 -0800
Message-ID: <7a151447-4961-4cba-b989-9a9e890d7ba3@quicinc.com>
Date: Fri, 21 Feb 2025 21:15:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void
 APIs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Will Deacon <will@kernel.org>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Thomas
 Gleixner <tglx@linutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang
	<xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
        Jason Gunthorpe
	<jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones
	<lee@kernel.org>,
        Thomas Graf <tgraf@suug.ch>, Christoph Hellwig
	<hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy
	<robin.murphy@arm.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard
 Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Zijun Hu
	<zijun_hu@icloud.com>,
        <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <linux-rdma@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <iommu@lists.linux.dev>,
        <linux-mtd@lists.infradead.org>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
 <2025022145-ungodly-hanky-499e@gregkh>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <2025022145-ungodly-hanky-499e@gregkh>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PjXLPSlfU4X8CAU-woeSzf1fJQlgHVdf
X-Proofpoint-ORIG-GUID: PjXLPSlfU4X8CAU-woeSzf1fJQlgHVdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=775 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_051627_273825_0CB95DC9 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/21/2025 9:12 PM, Greg Kroah-Hartman wrote:
> These span loads of different subsystems, please just submit them all to
> the different subsystems directly, not as one big patch series which
> none of us could take individually.
> 

sure. will do it as you suggest.
thank you.

> thanks,
> 
> greg k-h


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
