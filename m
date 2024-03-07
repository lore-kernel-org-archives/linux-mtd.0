Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22D6C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 04:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClUbIKMLBc8PMKMxRWg7cUhXmq7ACg/U5NgkL6zO3Yg=; b=Uha7aFB8dACYih
	xvdipATFCRj9cJZa/BjLNylj2Q0pV9VGnsEs9mtMPDGU8Y20G3Rp4dMqUOBkW9Da8gsSded+o1dqm
	9F++d+MzHwdtvSvuoA2C0PNEx00LaxPL2Vobo0J5xi+n4QL+z+DVvomtrG1PH2SK0FFgogjQrtn1V
	hwAURgYWkP83EFuP+v3FLB2L7ZyPpAlagJW8PhHzw3EYVwZmiszyfkpmat0bXlJqoLNh4DnSfKF1/
	Cjqi15rPqiVYBN5jxsoKCf1fg+ECiskpGPho9tek/yQeMdCzwZSh2d6YXvH6e9U2Yppy2oEMhiKie
	SJCXt+WQvpOCO6DGMNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri55p-00000002vqJ-086N;
	Thu, 07 Mar 2024 04:10:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri55l-00000002vpa-3bxk
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 04:10:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4274Ahmv023139;
	Thu, 7 Mar 2024 04:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7TJ3n/0fLnBwB4tq1En+ngQc6f0xHxORsLFGuLy1AT8=; b=Zp
	JE59e3su4jwgTyG8df7mLw0oeUoDqDAHe2YZKwn0dAq6rWxapfVLp66jKe2J8GnX
	07I2QHDQQrktFLso0OdjcuqrdQvlN6RT5XMiQ/6hE/qOY6p1m+FTu5hQNl9e2nsE
	e+Ew3Bg3paDUXeg6LVXkM+sMhHFoXuitezsedw87RpnlmvHCa+DlvCb1XLae40FN
	9o2xiz53WfFdYGxo0QRRxDHzYsSuBUOoaiWoYOoe2UgA+moXX7l9TrEWkF8QyCPW
	dTvIqM2IN02QSXFqld+DC8XX5e1yM8E7NVRk1yLhLXoZs3ihdSlSge3JuOTTgroo
	ZUsKe5ynOaCOLbkHV6Wg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wq0u3ghfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 04:10:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4274Af06004104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Mar 2024 04:10:41 GMT
Received: from [10.201.3.124] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Mar
 2024 20:10:36 -0800
Message-ID: <b11eb8c8-8bdf-2554-eb36-64618b6e1ac7@quicinc.com>
Date: Thu, 7 Mar 2024 09:40:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Content-Language: en-US
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
 <3e544d37-b1d2-9c58-3130-9e6950430671@quicinc.com>
 <19176685-898b-4aeb-b819-fec54a126233@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <19176685-898b-4aeb-b819-fec54a126233@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HGBlTF-g-DbUeilbsrEZ7p2PEOyyL914
X-Proofpoint-GUID: HGBlTF-g-DbUeilbsrEZ7p2PEOyyL914
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=835
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403070026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_201050_069881_6CDDD070 
X-CRM114-Status: UNSURE (   8.95  )
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

CgpPbiAzLzYvMjAyNCA5OjU3IFBNLCBLb25yYWQgRHliY2lvIHdyb3RlOgo+IAo+IAo+IE9uIDMv
Ni8yNCAwNzowMSwgTWQgU2FkcmUgQWxhbSB3cm90ZToKPj4gS29ucmFkLAo+Pgo+PiBPbiAyLzIw
LzIwMjQgNTo0NCBQTSwgTWQgU2FkcmUgQWxhbSB3cm90ZToKPj4+Pj4gK8KgwqDCoCBlY2NfY2Zn
LT5jZmcwID0gKGN3cGVycGFnZSAtIDEpIDw8IENXX1BFUl9QQUdFCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBlY2NfY2ZnLT5jd19kYXRhIDw8IFVEX1NJWkVfQllURVMK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgPDwgRElTQUJMRV9TVEFU
VVNfQUZURVJfV1JJVEUKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMg
PDwgTlVNX0FERFJfQ1lDTEVTCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCBlY2NfY2ZnLT5lY2NfYnl0ZXNfaHcgPDwgRUNDX1BBUklUWV9TSVpFX0JZVEVTX1JTCj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAwIDw8IFNUQVRVU19CRlJfUkVBRAo+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSA8PCBTRVRfUkRfTU9ERV9B
RlRFUl9TVEFUVVMKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGVjY19j
ZmctPnNwYXJlX2J5dGVzIDw8IFNQQVJFX1NJWkVfQllURVM7Cj4+Pj4KPj4+PiBMZXQgbWUgaW50
cm9kdWNlIHlvdSB0byBGSUVMRF9QUkVQL0dFVCBhbmQgR0VOTUFTSygpLi4gTWFueSBhc3NpZ25t
ZW50cwo+Pj4+IGluIHRoaXMgZmlsZSBjb3VsZCB1c2UgdGhlc2UuCj4+Pgo+Pj4gwqDCoE9rCj4+
Cj4+IFdoaWxlIGRvaW5nIHRoZSBjaGFuZ2UgaSByZWFsaXplZCB0aGF0IGl0IHdpbGwgaW1wYWN0
IHJhdyBuYW5kIGRyaXZlciBhcyB3ZWxsLgo+PiBTaGFsbCBJIHBvc3QgdGhpcyBjaGFuZ2UgYXMg
c2VwYXJhdGUgcGF0Y2guIElzIHRoaXMgb2s/IFBsZWFzZSBsZXQgbWUga25vdy4KPiAKPiBPbmUg
cGF0Y2ggcGVyIGZpbGUvdG9waWMsIHllcywgcGxlYXNlCiAgVGhhbmsgeW91Cj4gCj4gS29ucmFk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
