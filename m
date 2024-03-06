Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFD4C54E41
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 06:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5cykMQh9sLYOe5d0NWCgv5JJn1bVrZV4/eUkc6yfr8=; b=O2ZMVZjilVSu2K
	p+cQNT+dE9LQHBC0kR6AyHr1UX5iD9wpQMw0lHREGnpLzlMpAmB6p17oh1gDIeEmQKhHES7EjRaWm
	1cWYYwyr3TAldf4haq+slmiV5RYEkGvJDBKCeujOtLSt+aylqhf7gggPx6NSmjqloB9/3fBCU82aL
	bJ0Q7lNo3WM9uzmb1q41Zzw1DBQSexqJafEC5rUZZ5sHksXJelWCWnDJB9a/quDZZXM/cI8+Uzbve
	2uUSKk6vD0lz2T6OXpkK315prExkW63okuYg/nN8fGTBpxTWRI0JwhH1/ka78cHBBROSWClIMl7xo
	5LgHyaXXKsumsJzu/fZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhkMD-0000000GU24-2uSH;
	Wed, 06 Mar 2024 06:02:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhkMA-0000000GU1D-393n
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 06:02:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4264lnL6025042;
	Wed, 6 Mar 2024 06:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1agwj1KEBjXJb1VsQmvvWQDpTBswQ8dZsb3xaybDUfA=; b=O3
	7JzgXqIAQRBJs2N4xDV3yOhhsX/4023Gwu0vO2d8p0GWbfVvOgxy8wTYlQ7k/uB9
	8ETK+B5slU2P0V+WA1B1Q92sauFU2DuXmamZ0fHvPT9aSqBNfUOst/ijFi+fHX5L
	A+ynX8MyU2I/ZYMm3J+oADniWO8VUmF8fy+/Ij+KNOz+FPm5ZrRRNasqht295ObZ
	gRKhhHXQ715/OYAW3ZN5g/RNPaS5RbaObderlh/vViC8Nxnl90Y0jjHtQ0RgE3+s
	3PdpUC0myFgfSs+H/vbcraNpRlh+gBNX0VLZwPrLNvYsaW8E98Vr3ALoBKxb7zfT
	O/3dYh+l7y+LMgMR8MZQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wp7ky1dsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:02:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42661skN008895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:01:54 GMT
Received: from [10.216.3.154] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:01:47 -0800
Message-ID: <3e544d37-b1d2-9c58-3130-9e6950430671@quicinc.com>
Date: Wed, 6 Mar 2024 11:31:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <broonie@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-4-quic_mdalam@quicinc.com>
 <d1c80d3f-3b70-4630-8f7d-b00983b487dd@linaro.org>
 <f5177fad-214f-1b60-46ba-1dc0a4fb059e@quicinc.com>
Content-Language: en-US
In-Reply-To: <f5177fad-214f-1b60-46ba-1dc0a4fb059e@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f8jqsuNHAm51FTD0iqA6FB3d6deFb5aV
X-Proofpoint-ORIG-GUID: f8jqsuNHAm51FTD0iqA6FB3d6deFb5aV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_03,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011
 mlxlogscore=963 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_220222_816802_2013BDE6 
X-CRM114-Status: UNSURE (   7.89  )
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

S29ucmFkLAoKT24gMi8yMC8yMDI0IDU6NDQgUE0sIE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4+PiAr
wqDCoMKgIGVjY19jZmctPmNmZzAgPSAoY3dwZXJwYWdlIC0gMSkgPDwgQ1dfUEVSX1BBR0UKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBlY2NfY2ZnLT5jd19kYXRhIDw8IFVE
X1NJWkVfQllURVMKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIDw8IERJ
U0FCTEVfU1RBVFVTX0FGVEVSX1dSSVRFCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMyA8PCBOVU1fQUREUl9DWUNMRVMKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCBlY2NfY2ZnLT5lY2NfYnl0ZXNfaHcgPDwgRUNDX1BBUklUWV9TSVpFX0JZVEVTX1JT
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMCA8PCBTVEFUVVNfQkZSX1JF
QUQKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIDw8IFNFVF9SRF9NT0RF
X0FGVEVSX1NUQVRVUwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGVjY19j
ZmctPnNwYXJlX2J5dGVzIDw8IFNQQVJFX1NJWkVfQllURVM7Cj4+Cj4+IExldCBtZSBpbnRyb2R1
Y2UgeW91IHRvIEZJRUxEX1BSRVAvR0VUIGFuZCBHRU5NQVNLKCkuLiBNYW55IGFzc2lnbm1lbnRz
Cj4+IGluIHRoaXMgZmlsZSBjb3VsZCB1c2UgdGhlc2UuCj4gCj4gIMKgT2sKCldoaWxlIGRvaW5n
IHRoZSBjaGFuZ2UgaSByZWFsaXplZCB0aGF0IGl0IHdpbGwgaW1wYWN0IHJhdyBuYW5kIGRyaXZl
ciBhcyB3ZWxsLgpTaGFsbCBJIHBvc3QgdGhpcyBjaGFuZ2UgYXMgc2VwYXJhdGUgcGF0Y2guIElz
IHRoaXMgb2s/IFBsZWFzZSBsZXQgbWUga25vdy4KClJlZ2FyZHMsCkFsYW0uCgo+Pgo+PiBLb25y
YWQKPiAKPiBUaGFua3MgZm9yIHJldmlld2luZywgd2lsbCBmaXggYWxsIHRoZSBjb21tZW50cyBp
biBuZXh0IHBhdGNoLgo+IAo+IFJlZ2FyZHMsCj4gQWxhbS4KPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
