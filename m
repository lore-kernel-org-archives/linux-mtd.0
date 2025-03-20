Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FF7C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 06:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW99b+rIALv0vzaYfEeOVXtdi6eQUaxO2x2iOu5pkF0=; b=2AwFouVHrUD+SU1OC2+hUiOlNF
	NcXg81nmhwHrD5z9wpGXiazoTFfabnehouirkLlZJNoG1Z1bKZp8bm5hd017jr4c3qsFMN+vxOZpK
	GoxQiG2X6YGFV4q5DGCxpdfV0U37IWuJMl663Qt2XvjgvL35MXUIN/viZE0HP1zj3NG6xT2vnP3dn
	lvqK2+WVKtoBZuZp9F4p8kUzF1iqFNSijcop1F+f4iYp3Ob8yMWXpE8U3xBtX8mKWpYXWaGqtiiQ+
	76i0ryjzgwjM75lJYKqreSRfMShqwvik4plb0P6Qy0hKKpvuLfjDPCnNWCk9j5kNuIS17a8B8GO8M
	r3ouBgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv972-0000000BHpS-08bE;
	Thu, 20 Mar 2025 06:10:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv96z-0000000BHp7-3bmA
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 06:10:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JG7ScR031123;
	Thu, 20 Mar 2025 06:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhvEbu/B7DlqECBAv+uD+Fcyi6AFMHzfPm0rMbXagJ4=; b=Fxv0Z96LCoP9szKQ
	0XyJeFpDVRBBQvO4w+PdFwZNaskhMpLuW//0KdgTLAWjYhjQeTeO+FvjXAx1kl6A
	Lv4mNmmwTT0dHaDcXb4k6n6aCcGmzf27YaHRROGD3QJEOCHSdcjNjU/VLgYlol/O
	rp5xDU6wzzMOJ65BbjWXvHH9L1BQFP1LiYSjYPKzyFDy1Ajs02u1Si2LVEq3kPc7
	Wa+3B+TqbZdSv5l/wgT3Hco/Qnlmn/+RT/1f2IraSMxZi1/uvBN5K/3Hl0REYpPJ
	pmNIllqm315GtuiuAD5lai0vyxT4EHlaSbWLsJgcHYFKAuwcgzrvDKORAplbEHvM
	1NRbTg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y1sy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 06:10:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K6AVHf027244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 06:10:31 GMT
Received: from [10.152.201.53] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Mar
 2025 23:10:27 -0700
Message-ID: <22ebf40e-a9ff-32ef-2d45-8077c915d2e8@quicinc.com>
Date: Thu, 20 Mar 2025 11:40:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/4] spi: spi-qpic-snand: set nandc_offset for ipq9574
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-5-quic_mdalam@quicinc.com>
 <a72f0db0-fd49-4cff-bffe-671fc757a219@gmail.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <a72f0db0-fd49-4cff-bffe-671fc757a219@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h-yF-uVW3wrLsLZDyljNUNKUnWF8Klm5
X-Proofpoint-ORIG-GUID: h-yF-uVW3wrLsLZDyljNUNKUnWF8Klm5
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dbb158 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=YrGrCH_7GMspvEpCFK4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_231038_020931_43832722 
X-CRM114-Status: GOOD (  15.80  )
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

CgpPbiAzLzE4LzIwMjUgODoyOCBQTSwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4gMjAyNS4gMDMuIDEw
LiAxMzowOSBrZWx0ZXrDqXNzZWwsIE1kIFNhZHJlIEFsYW0gw61ydGE6Cj4+IFRoZSBCQU0gYmxv
Y2sgZXhwZWN0cyBOQU5EIHJlZ2lzdGVyIGFkZHJlc3NlcyB0byBiZSBjb21wdXRlZCBiYXNlZCBv
bgo+PiB0aGUgTkFORCByZWdpc3RlciBvZmZzZXQgZnJvbSBRUElDIGJhc2UuIFRoaXMgdmFsdWUg
aXMgMHgzMDAwMCBmb3IKPj4gaXBxOTU3NC4gVXBkYXRlIHRoZSAnbmFuZGNfb2Zmc2V0JyB2YWx1
ZSBpbiB0aGUgcWNvbV9uYW5kY19wcm9wcwo+PiBhcHByb3ByaWF0ZWx5Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxhbUBxdWljaW5jLmNvbT4KPj4gLS0tCj4+
Cj4+IENoYW5nZSBpbiBbdjNdCj4+Cj4+ICogQWRkZWQgbmFuZF9vZmZzZXQgZm9yIHByb3BlciBh
ZGRyZXNzIGNhbGN1bGF0aW9uCj4+ICAgIGZvciBuZXdlciBTb2NzCj4+Cj4+IENoYW5nZSBpbiBb
djJdCj4+Cj4+ICogVGhpcyBwYXRjaCB3YXMgbm90IHBhcnQgb2YgdjIKPj4KPj4gQ2hhbmdlIGlu
IFt2MV0KPj4KPj4gKiBUaGlzIHBhdGNoIHdhcyBub3QgcGFydCBvZiB2MQo+Pgo+PiAgIGRyaXZl
cnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgfCAxICsKPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMg
Yi9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4+IGluZGV4IDhjNDEzYTZhNTE1Mi4uODVh
NzQyZTIxY2Y5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4+
ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPj4gQEAgLTE2MDQsNiArMTYwNCw3
IEBAIHN0YXRpYyB2b2lkIHFjb21fc3BpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcWNvbV9uYW5kY19wcm9wcyBpcHE5NTc0X3Nu
YW5kY19wcm9wcyA9IHsKPj4gICAJLmRldl9jbWRfcmVnX3N0YXJ0ID0gMHg3MDAwLAo+PiAgIAku
c3VwcG9ydHNfYmFtID0gdHJ1ZSwKPj4gKwkubmFuZGNfb2Zmc2V0ID0gMHgzMDAwMCwKPj4gICB9
Owo+IAo+IEFwcGx5aW5nIHRoZSBmaXJzdCBwYXRjaCBhbG9uZSByZXN1bHRzIGluIHRoZSBmb2xs
b3dpbmcgZXJyb3Igb24gSVBROTU3NDoKPiAKPiBbICAgIDMuNTk2NDAzXSBxY29tX3NuYW5kIDc5
YjAwMDAuc3BpOiBmYWlsdXJlIGluIHN1Ym1pdHRpbmcgY21kIGRlc2NyaXB0b3IKPiBbICAgIDMu
NTk2NDkwXSBzcGktbmFuZCBzcGkwLjA6IHByb2JlIHdpdGggZHJpdmVyIHNwaS1uYW5kIGZhaWxl
ZCB3aXRoIGVycm9yIC0xMTAKPiAKPiBTbyB0aGlzIGNoYW5nZSBzaG91bGQgYmUgaW50ZWdyYXRl
ZCBpbnRvIHRoZSBmaXJzdCBwYXRjaC4gT3RoZXJ3aXNlLCBTUEkgTkFORAo+IHN1cHBvcnQgd291
bGQgYmUgYnJva2VuIG9uIElQUTk1NzQgdGVtcG9yYXJpbHkgYmV0d2VlbiB0aGUgZmlyc3QgYW5k
IHRoZQo+IGN1cnJlbnQgcGF0Y2guCk9rLCB3aWxsIGludGVncmF0ZSB0aGlzIGluIGZpcnN0IHBh
dGNoIGluIG5leHQgcmV2aXNpb24uCj4gCj4gUmVnYXJkcywKPiBHYWJvcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
