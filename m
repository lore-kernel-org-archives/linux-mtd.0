Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5CBC021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uSRx1ydLhK8lJN/w1hZhTKcg1Dky5bKPLLCUaLSstY=; b=YunsTz+WzNVo/G
	HGuxuPlneRXjpN0AKz14BQgs17JOf6kLVnu1nRq5w5vGVQSh2ycTrT2JnzV82bb2NOebpYUkZnAT7
	z0IdIATlD1cLLyWgC/O4xTNUwGImTKlsNIuE1v0fQCUs6qBO7Z0V493QNzR8T295rVBm9NvZt33e9
	1g0jg4ahhycANpREX4ErIonpELX1dVep8V7t5ezFAqTUsYrwoGUfuDrBk0EqlQl5hYvkaOhNier2B
	E9SlkufeyxFBvt+ZMOSW7FPJZp3ZqwUdgxoowIaEBx2QCrH8jxxN8XF6ST1n4QMla0w9ST7+o+YUK
	5OIeFD6qnCtiatA+IFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTz3-00000005odz-19sC;
	Fri, 21 Feb 2025 14:26:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSq7-00000005aTQ-29Ry
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:13:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LCkunU031803;
	Fri, 21 Feb 2025 13:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMvoDC9TQDacf/N4q7elXEm8gc6mCq2kbKwfjC8SnZE=; b=pc773gsjOQLDV/PM
	r17xLoo6bZqZ2646wj4cFe1GVnZb/X5+Q3SL5PCzSLg058TzPTP4wC9gwdLLi7uR
	w+MvokjXu516qUFcWhVs5inKQIXjZEOs+27Hstywy2GStMMl9S2Ye0kFmYcm36fI
	VnTW4nQ1ftmRByq4AZnerZaYKIpPYRqkogaGne5lMCENEzLeKLqXT2enmfz0oFMX
	6t0SJIyZDOaW5/LM/HDgvhtiljH+do9ffOB7c3F0YC6qKXcXYZCIFJJp9mOJjB97
	NEoeItGOkynDrKEFPp2FSIfQEAJ35Ga5eLsYPD0f4hKDhXXYEpa7aLPF++I//CzR
	BAlz9Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5j0cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:12:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LDCdgX003306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:12:39 GMT
Received: from [10.133.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 05:12:31 -0800
Message-ID: <1aefcfbe-cdfe-460e-9ccc-d7b5e0f9f330@quicinc.com>
Date: Fri, 21 Feb 2025 21:12:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 13/18] gpiolib: Remove needless return in two void
 APIs
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon
	<will@kernel.org>,
        Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Nick Piggin <npiggin@gmail.com>,
        Peter Zijlstra
	<peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S.
 Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Eric Dumazet <edumazet@google.com>,
        Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman
	<horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jamal Hadi
 Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko
	<jiri@resnulli.us>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky
	<leon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones
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
 <20250221-rmv_return-v1-13-cc8dff275827@quicinc.com>
 <CAMRc=McG2xLUcE_yHq4MiFnm665riHHuHjk0GJE4cFV_gGU90Q@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <CAMRc=McG2xLUcE_yHq4MiFnm665riHHuHjk0GJE4cFV_gGU90Q@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6LBvVGxpuh7hzUH31SaVtdTZALn_bpnL
X-Proofpoint-GUID: 6LBvVGxpuh7hzUH31SaVtdTZALn_bpnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=827 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_051311_660614_B6CECD13 
X-CRM114-Status: GOOD (  14.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMi8yMS8yMDI1IDk6MDYgUE0sIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gT24gRnJp
LCBGZWIgMjEsIDIwMjUgYXQgMjowMuKAr1BNIFppanVuIEh1IDxxdWljX3ppanVodUBxdWljaW5j
LmNvbT4gd3JvdGU6Cj4+Cj4+IFJlbW92ZSBuZWVkbGVzcyAncmV0dXJuJyBpbiB0aGUgZm9sbG93
aW5nIHZvaWQgQVBJczoKPj4KPj4gZ3Bpb19zZXRfdmFsdWVfY2Fuc2xlZXAoKQo+PiBncGlvX3Nl
dF92YWx1ZSgpCj4+Cj4+IFNpbmNlIGJvdGggdGhlIEFQSSBhbmQgY2FsbGVlIGludm9sdmVkIGFy
ZSB2b2lkIGZ1bmN0aW9ucy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWmlqdW4gSHUgPHF1aWNfemlq
dWh1QHF1aWNpbmMuY29tPgo+PiAtLS0KPiAKPiBUaGF0IHdvdWxkIG5vcm1hbGx5IG1ha2Ugc2Vu
c2UgYnV0IHdlJ3JlIGdldHRpbmcgdGhhdCByZXdvcmtlZFsxXSBpbgo+IHRoaXMgdmVyeSBjeWNs
ZSBzbyBwbGVhc2UgZHJvcCB0aGlzIHBhdGNoIGZyb20geW91ciBzZXJpZXMuCj4gCgpzdXJlLCB3
aWxsIGRyb3AgaXQgaW4gbmV4dCByZXZpc2lvbi4KCj4gQmFydAo+IAo+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1ncGlvLzIwMjUwMjIwLWdwaW8tc2V0LXJldHZhbC12Mi0wLWJj
NGNmZDM4ZGFlM0BsaW5hcm8ub3JnLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
