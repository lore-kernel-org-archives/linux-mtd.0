Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E98ED1D887
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2024 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75P+y59pkCo51cBhs3DK6Mev2aA4ZwP6p3pImE55+Uk=; b=aycbo79AUX3nfj
	E73t6P8qQvZglSWFWrkwwPLqdqsB0PED4SgfvJn1A1VQGWEB7egI0rEX8bXCA8Xha81d/vj3eYjR7
	JrGHI8MWUU5xk2RyXJ0TfMvg/QC0aS1PEaZZHZcNqLqo/Q8QLfzFO3GVHZlOS4XfCx5HmBZvAhhFh
	NQwBJwcCT6bR637DBHmBvILpyh1ro6kk6ikWplC2cZhez07p4qGv5Em6QRzAgov5/IR5MdXSj8q1g
	nnFHxT1h8mIPFPkDkpe7Um1lxjmdS5NBOh1dMLa2UdmBycWEYEJ/jKZXSBM9SuPyLqfRTSgP5++7c
	mxi3PVSBO7dbUGMjvDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kGQ-00000008r2r-2c8x;
	Tue, 15 Oct 2024 16:19:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kGO-00000008r2X-21o1
	for linux-mtd@lists.infradead.org;
	Tue, 15 Oct 2024 16:19:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F9qV3l027796;
	Tue, 15 Oct 2024 16:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+FlGNemb68zVPoS1oWfgoA7NXvv0pIJi/EsE9mxPOI=; b=f3hqesS/1jiW0k2a
	MCQ4x0nu7Fx7w15w7SBwqf8PnpvQWIUe+IqSsyTpCwVvyKZS0/nkwCDtJ0LsZz3J
	KgLDgWP94jSZAqjlqHq30gw49hqhBKlpzvZb7z283emY5rOdZ7nAWVudU2P2h5Qh
	7N0PP7qpFZ56N+3qwLPBfYamIN/Ru56Q1mg91h9J+RRMN3oNy7kKXk9C/PNKLKki
	uUwB+VPdttT33x5REQ0Ek4J3Th8Il5aqbIAgZHI2jSH43KDXL1Jm8NU0GPPSTQOs
	bmgUNB8hS4Gt6NQ2CV37ybqRPILVnbLd+t6+EskiuTtlSt52R0bVD3qZaP616j69
	Dma9hA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427jd904tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 16:18:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FGIkRa005017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 16:18:46 GMT
Received: from [10.216.57.188] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 09:18:38 -0700
Message-ID: <382e2d4d-3bf8-d88b-29c1-37c1446a0843@quicinc.com>
Date: Tue, 15 Oct 2024 21:48:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v11 4/8] mtd: nand: Add qpic_common API file
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        kernel test robot
	<lkp@intel.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <arnd@arndb.de>,
        <esben@geanix.com>, <nikita.shubin@maquefel.me>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <oe-kbuild-all@lists.linux.dev>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241010070510.1504250-5-quic_mdalam@quicinc.com>
 <202410130129.M8J7VJoG-lkp@intel.com> <20241015172955.7b0b6708@xps-13>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20241015172955.7b0b6708@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8z6kBnp7XghZECOsLn3_bo8kKUAu8CXp
X-Proofpoint-ORIG-GUID: 8z6kBnp7XghZECOsLn3_bo8kKUAu8CXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=857 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_091912_548860_D9F08EA6 
X-CRM114-Status: UNSURE (   8.58  )
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

CgpPbiAxMC8xNS8yMDI0IDg6NTkgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGksCj4gCj4g
bGtwQGludGVsLmNvbSB3cm90ZSBvbiBTdW4sIDEzIE9jdCAyMDI0IDAxOjU3OjEyICswODAwOgo+
IAo+PiBIaSBNZCwKPj4KPj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5n
IGJ1aWxkIGVycm9yczoKPiAKPiBUaGUgYmVsb3cgZXJyb3JzIHNlZW0gbGlrZSBiYXNpYyBLY29u
ZmlnIG1pc2NvbmZpZ3VyYXRpb24uIFRvIGJlIGNsZWFyLAo+IEkgdXN1YWxseSBkb24ndCByZXZp
ZXcgc2VyaWVzIGdldHRpbmcga2VybmVsIHRlc3Qgcm9ib3QgZmFpbHVyZXMgYW5kIEkKPiBhbSBl
eHBlY3RpbmcgdGhhdCB5b3Ugd2lsbCBmaXggdGhlc2UgZXJyb3JzIGFuZCBwb3N0IGFuIHVwZGF0
ZWQgdmVyc2lvbi4KU3VyZSBXaWxsIGZpeCB0aGlzLCBhbmQgcG9zdCBuZXh0IHJldmlzaW9uLgo+
IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
