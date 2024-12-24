Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A53E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fedWIPgQWSD/NrItD2NyYSsoXbBzceTLOMuD3HS8Ps=; b=Lej0wSPkYs+uQQ
	VfBkRhAb1qDEU9VMVy0rdhKdN+uafp1AYTXX9QUUwfyCIvJUJBG3yzx6wdTTbQNpzLt3F88HcKm7T
	8SJnGWtkjn2FMnlxbdXfp8Az0PbX8T2SMhAkEgiPdMnBXZwUMFJx/ISlaYzJBb7AKbVc8ZiXZLtrp
	WMADG6d4sq81lHrLOEmtcLsgsnf0eMd+0xWFi8yRsfl03WDjnctRIa+ZXo9z/72cthJ3TPJeLw2VK
	EA5dO4fM2b62XT2ahuE2o9QeCsUiZy0oSvOV+xusZc2KU3hV5qUygGeb3fQMrfjOqBQQKJAsW8S8T
	4wN84ZiTbdIxVkEaFHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3Ty-0000000Btxm-1l7B;
	Tue, 24 Dec 2024 11:53:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3Tw-0000000Btwd-1tJv
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 11:53:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO9ZaUt007862;
	Tue, 24 Dec 2024 11:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDg6oN1OyIP9bHy27NdtIJIUQEneZnd+hcIOiawXXNY=; b=TQW8oe/1A3AZJJ0d
	3BIMNw2tn3kQ3oobMhcO6AlR8mkZPyu/tStlws24gw7hioJTgxUA6cvQv9mjnqLf
	MlfvzZbBAk8VajbDaJ0SvJh6WFnHatcBshaqKx+/E0QgGHuKdehFhNdPBobRTEDx
	z67GYU0RifjwLo2GGMUvXZ5YfY0nHufns2pzr6q3/bjVlyYMnXsKLLk06xakOoXN
	d30yPflxBrR6DTZVZvYg3Y3tkhjKWsNv7kXZcNhK3xE8Sfkn8t0xCOGVfZXB+ihC
	NFEZKdHOj7O6pESK8BKlitYP7UWYuDdsXSdizwxPdNL2t7DZEpFp8mseOUMiBXqf
	EM9ZCA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qtf88qrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 11:53:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOBrf22012651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 11:53:41 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 03:53:34 -0800
Message-ID: <ff9ed09b-61ca-52c5-a0a1-4102f35b0849@quicinc.com>
Date: Tue, 24 Dec 2024 17:23:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, <richard@nod.at>,
        <vigneshr@ti.com>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241220093029.z4zsr3owdnqll2vg@thinkpad>
 <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
 <87seqdpknc.fsf@bootlin.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <87seqdpknc.fsf@bootlin.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KAAU4yjnbnd7btV7HVK5Lf6Ssspd1fq8
X-Proofpoint-ORIG-GUID: KAAU4yjnbnd7btV7HVK5Lf6Ssspd1fq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=653 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_035348_613921_4C12B544 
X-CRM114-Status: GOOD (  12.99  )
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

CgpPbiAxMi8yNC8yMDI0IDE6MzkgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBEbyB5b3Ug
cGxhbiB0byByZXNwaW4gdGhpcyBzZXJpZXM/IEZZSSwgdGhlc2UgYXJlIHJlZ3Jlc3Npb25zLCBz
bwo+Pj4gc2hvdWxkIGdvIGluCj4+PiBlYXJseSBhcyBwb3NzaWJsZS4KPj4gV2FpdGluZyBmb3Ig
U1BJIE5BTkQgc2VyaWVzIHBhdGNoZXMgWzFdIHRvIGJlIG1lcmdlZCAocmF3IG5hbmQgY2hhbmdl
Cj4+IHBhdGNoIDItNSkuIE9uIHRvcCBvZiB0aGF0IHdpbGwgcmVwb3N0IHRoZXNlIHBhdGNoZXMu
Cj4gCj4gV2hlbiB0aGVyZSBhcmUgY29tbWVudHMgb24gYSBzZXJpZXMsIHRoZSBlbnRpcmUgc2Vy
aWVzIHVzdWFsbHkgZ2V0cwo+IGRpc2NhcmRlZCwgc28gaXQgaXMgbm93IG91dCBvZiBteSBzaWdo
dC4gSWYgeW91IHdhbnQgdGhlIHNwaSBiaXRzIHRvIGJlCj4gYXBwbGllZCwgaXQgbXVzdCBtYWtl
IHNlbnNlIHRvIGhhdmUgdGhlbSBhbG9uZSwgYnV0IHlvdSBjYW4gc2VuZCBhIG5ldwo+IHZlcnNp
b24gb2YgdGhlIHNwaSBiaXRzIGFsb25lIGlmIHlvdSBmZWVsIGxpa2UgdGhlIHJhdyBuYW5kIHBh
dGNoZXMKPiBhcmVuJ3QgcmVhZHkuIEJ1dCBvdGhlcndpc2UgcGxlYXNlIGZpeCB0aGUgc2VyaWVz
IGFuZCBzZW5kIGEgbmV3Cj4gdmVyc2lvbi4KU3VyZSBXaWxsIGNyZWF0ZSAyIGRpZmZlcmVudCBz
ZXJpZXMgb25lIGZvciByYXcgbmFuZCBhbG9uZyB3aXRoIFNEWDc1IApidWcgZml4ZXMgYWRkZWQg
YW5kIGFub3RoZXIgc2VyaWVzIGZvciBTUEkgTkFORCBzdXBwb3J0IGFuZCByZXBvc3QuCj4gCj4g
VGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
