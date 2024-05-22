Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581A4C25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2024 06:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjaE7b/Ae2v09LrpdDEuUDtwbonp/zMVP/OX9Bd+NVE=; b=k8raMOIaxIstrV
	AZzuBRIPSLQo7pZRgp9eSJgeFKoCTzy/3mbtRH4cJGD/nWBt0cJIuG/h4FlNXih9yTjUPukU5eqYk
	5nuIp5JEWpCPh6m7/4s+DT4PA+g7ZoXqurg1Zw8lFxkJLdEC/vm6A43ZOU333LF/JvyWHy0OOTZRR
	/GESmb5LQOUbMscYIq47+OXK39LPU6Kk6PGPUXd7ozuW3uVczO5TIkmP7qUp1LZSxfUbdJKkJ79D1
	y9I0yaUTsqf1ToTvqlj8VeEc9JkkgItfgykPNhIdP5rYgXmwNY3Sq3XwsPW4C0tSRSmOZtQXlcsY+
	kpcD43ySvPglCOQsy4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fAU-0000000251M-2i63;
	Wed, 22 May 2024 06:09:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fAR-0000000250P-2fps
	for linux-mtd@lists.infradead.org;
	Wed, 22 May 2024 06:09:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M4W1eE000805;
	Wed, 22 May 2024 06:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=yg0dNwgVIJbFrnHIEpXFbKaS8qAQ7OaX5TaUpxBRbG4=; b=UP
	BM/UY8kpvvroQ1RUpYj101AXdsLG4v1xbhPWUq4EncqHMuYBGuk3Cllx/tGYPLSs
	Z7ZfOyCrSqKrkjKNt/10MajRhQB5VssoNVoDntF34NLUeOJxm8E2fTKBADEQjf/7
	Tr+DVYYCm6+Vpvb7NXcZ9LiuGefAzx9k8NsDX/HOArBtkYCsEp6cstbbnanNeXZi
	//xWtb5P1eDpTuhrlSZaN0iZyaNu4eFjqksMUuj2wbLPRJb0boUGklGMbB0Z/lKX
	K/SBGw5OCwMjO9LXy1DSkCmIP//CX2QJJ45nJFEUXo3DGaqPHGi/iGWaHCkUMWK5
	Fbjdn1rHdUVyMDYfGc5g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqaqswg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 06:09:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44M69QLN023398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 06:09:26 GMT
Received: from [10.216.52.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 23:09:20 -0700
Message-ID: <39ccbbbb-e6f5-89e3-e11c-a2338dcd5a30@quicinc.com>
Date: Wed, 22 May 2024 11:39:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 5/8] drivers: mtd: nand: use FIELD_PREP and GENMASK
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240521105532.1537845-1-quic_mdalam@quicinc.com>
 <20240521105532.1537845-6-quic_mdalam@quicinc.com>
 <20240521145327.745f8b50@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240521145327.745f8b50@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g9ppQNO8W1rJh15p4AUwxVFKOp3GABtu
X-Proofpoint-ORIG-GUID: g9ppQNO8W1rJh15p4AUwxVFKOp3GABtu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_02,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=722 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405220043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_230939_730779_E6A949A1 
X-CRM114-Status: UNSURE (   8.08  )
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

CgpPbiA1LzIxLzIwMjQgNjoyMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPiBx
dWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUdWUsIDIxIE1heSAyMDI0IDE2OjI1OjI5
ICswNTMwOgo+IAo+PiBVc2UgdGhlIGJpdGZpZWxkIG1hY3JvIEZJRUxEX1BSRVAsIGFuZCBHRU5N
QVNLIHRvCj4+IGRvIHRoZSBzaGlmdCBhbmQgbWFzayBpbiBvbmUgZ28uIFRoaXMgbWFrZXMgdGhl
IGNvZGUKPj4gbW9yZSByZWFkYWJsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxh
bSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4+IC0tLQo+PiBDaGFuZ2UgaW4gW3Y2XQo+Pgo+
PiAqIEFkZGVkIEZJRUxEX1BSRVAoKSBhbmQgR0VOTUFTSygpIG1hY3JvCj4gCj4gTWF5YmUgeW91
IHdhbnQgdG8gaW5jbHVkZSBsaW51eC9iaXRmaWVsZC5oIG5vdy4KICBPawo+IAo+IE90aGVyd2lz
ZSB0aGF0J3MgYSBncmVhdCBpbXByb3ZlbWVudC4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
