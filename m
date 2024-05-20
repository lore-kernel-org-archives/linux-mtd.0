Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D5C04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W18eElqGDqAgT69Ft+QVETEWQbyHsZ6KSCy8IBarI58=; b=nP90vzXlAfYqil
	vSbXvJuCMeHnfTBFCYz6uwbIkSvd4LX6axaCyaAUhM0sQkt7f9UcOdwq3WbGoKUnE1ky9gqQV6Rxa
	UYsObKs1qIS4+BloHiMdPVX7VqDxJJ9UeM1Ba8/AaTknqNGKk8k43d8DaUFdhSX44yVoMLsH3TFbc
	h36mclX+Q/7h9mD9k1AIWoR3RHMIYMfqF3wpLDZsbpFzjv19AFyrXxDtLpa+KCY7U9EgK+HFQ/WwS
	yMTuJCHXsoKB7+haNQqbjfmq7sifYCGxATDJC+D72RxwaSKc4x/3lclBstXdpmdizD7HEeNIQjeRn
	seZtytPFmER72oL6oGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s903F-0000000E6y9-2I9K;
	Mon, 20 May 2024 10:15:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s903C-0000000E6xj-2EHX
	for linux-mtd@lists.infradead.org;
	Mon, 20 May 2024 10:15:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44JNwfm3030497;
	Mon, 20 May 2024 10:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hKiodN63Z0RVsc8gXW3IiXso5pHhoSGv7lkZ5eTB99E=; b=T1
	2CGJkFyF80nsOUBOS4vzcG24n2OQWSDySie8JV1bRvWy/hiAmEkXG3dddzYq/7o+
	bKl2tAY5oeLoBlwDnFqqMBnLr9gkLvO/mGxrO09qt2cRB4juMSOT+I9hbYfTww0t
	LyDNxArrhjEg4DGMoh/Km7cWI9iGAUYEjY6JmzQeiRbRxJ4Ksk6rgdUp7IjWnuvH
	SyZrr+y1ZY7uHXmpg0ggxMhnZLnzLWejav5QQUwpmnY4NPBaKk29ChxnZmUagVg/
	HiTqbHBGQO2v0wNjly5ee1yzY+RjVGNTbFNbltDEEzum2kKnrzAS7fsUi6AzCzkN
	DaElI0tuw8WXK2cLlLog==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5avt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 10:15:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KAFJwU014001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 10:15:19 GMT
Received: from [10.216.4.5] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 03:15:13 -0700
Message-ID: <bdfd0704-ac8f-45c2-e292-a5bc416e6610@quicinc.com>
Date: Mon, 20 May 2024 15:45:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: ipq9574: Disable eMMC node
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>
References: <20240508083637.3744003-1-quic_mdalam@quicinc.com>
 <20240508083637.3744003-8-quic_mdalam@quicinc.com>
 <20240516145915.10adca29@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240516145915.10adca29@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GIfhyrBYp1lFuQVrWvmXxsU1Z8Tk9sjo
X-Proofpoint-ORIG-GUID: GIfhyrBYp1lFuQVrWvmXxsU1Z8Tk9sjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=528 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_031526_604329_992A5811 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzE2LzIwMjQgNjoyOSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPiBx
dWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBXZWQsICA4IE1heSAyMDI0IDE0OjA2OjM3
ICswNTMwOgo+IAo+PiBEaXNhYmxlIGVNTUMgbm9kZQo+IAo+IFBsZWFzZSBleHBsYWluIHdoeSBv
ciByZW1vdmUgdGhpcyBwYXRjaCBmcm9tIHRoaXMgc2VyaWVzLCBiZWNhdXNlIGF0IGEKPiBmaXJz
dCBnbGFuY2UgdGhlcmUgaXMgbm8gcmVhc29uIHRvIGxpbmsgdGhpcyBwYXRjaCB3aXRoIHRoZSBv
dGhlcnMuCiAgcmRwNDMzIGRlZmF1bHQgYm9vdCBtb2RlIGlzIG5vcnBsdXNuYW5kIGFuZCBHUElP
cyBhcmUgc2hhcmVkIGIvdyBlTU1DCiAgYW5kIE5BTkQgc28gd2UgY2FuJ3Qga2VlcCBib3RoLlNv
IHdlIGFyZSBkaXNhYmxpbmcgdGhlIGVNTUMgZm9yIHJkcDQzMy4KPiAKPiBUaGFua3MsCj4gTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
