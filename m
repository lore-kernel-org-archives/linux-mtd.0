Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D3DE64A89
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3ZFoiVFpPcAO9FIiVVdgDoU7xAAwa+GQ7cUUaU5Jto=; b=r4LCQivN1+aCmu
	H26a//aylkFCBzYUJCED23A0Ukt7ek+c9EVYKQc2rMmLEYbtGiCcTBOjAHk9DFXcv3SnZCF9WK3CN
	fhfjgtNfSKP3BLEtj5g4HXpfwKuslT5PfWJhUqaUV4jRDvBAXTX1RDdkW5Nf+oAme8xBNLGOnOWTh
	YVyRZRi39SGZSs7zLojB9F7RaA0kS3rpEy+1/FPtF+J2d5MQZSvf6u2vU2e/AWhdS2WJqbyebKYy2
	tN3sVh2fyjcZyDh77fluGSSpmdZ0MZ6zHHUUcuirCInLmg7lMVmcmh8PouFnQsmNFnSwR9D+f8myh
	cKcJcieUnEDl33IDD1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIS1M-00000009QrT-2SoF;
	Tue, 03 Dec 2024 12:28:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQi3-00000009Brz-2ELS
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 11:04:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B38tmMU010851;
	Tue, 3 Dec 2024 11:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KhuAO45BpGUJQh6ai96J1rGFDAPsljoRBrp3z4py8Q=; b=W3qUl5Wt9kYDTdvA
	qciAg6ePv0EDGxkuOFckIdSLXkFi7fiGfo7Mbyg5HNdAzt24EK4eio0MFXECT4jM
	KUDFNSZyRP4pQ76AKTplz/QpxpW6UMXpm6KsOufrRY+T+cie98C9t8OKW8wu3YG5
	Fk+8QLaL4gq23vnWFR8naci+2no+q+WeragMDrLS6gvpOMyqLfoC4tBZto9RjFUw
	7mJO10mr9sfmtzvPESwGDAsUuRthUykQrismf1ZisZWbIr80s0ZSm7rBt/rQsdz5
	4qflIW+MZvCaykTCtkHODYU371sEO6lPiRC9bXtSD2dPdcocml1UhRat5XmxE7kN
	zPsCIw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mpcs38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 11:04:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3B4iVv004429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 11:04:44 GMT
Received: from [10.151.36.201] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 03:04:39 -0800
Message-ID: <11ed6654-5362-4529-88a0-801e770e164b@quicinc.com>
Date: Tue, 3 Dec 2024 16:34:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/8] Add QPIC SPI NAND driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
 <87mshe58gq.fsf@bootlin.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <87mshe58gq.fsf@bootlin.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HMFqzdjarEFsMZ_sJpFyTTzJmtl81YBi
X-Proofpoint-GUID: HMFqzdjarEFsMZ_sJpFyTTzJmtl81YBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_030451_586153_CB1B373F 
X-CRM114-Status: GOOD (  14.66  )
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

CgpPbiAxMi8yLzIwMjQgMTA6MjcgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgTWFyYywK
PiAKPiBPbiAyMC8xMS8yMDI0IGF0IDE0OjQ0OjU4ICswNTMwLCBNZCBTYWRyZSBBbGFtIDxxdWlj
X21kYWxhbUBxdWljaW5jLmNvbT4gd3JvdGU6Cj4gCj4+IHYxNDoKPj4gICAqIFVwZGF0ZWQgY29t
bWl0IG1lc3NhZ2UKPj4gICAqIEZpeCBzcGVsbGluZyBtaXN0YWtlCj4+ICAgKiBSZW1vdmUgImlu
bGluZSIgZnJvbSBtdWx0aXBsZSBBUElzIGZyb20gcWNvbV9uYW5kYy5jIGZpbGUKPj4gICAqIE1v
dmUgJ3wnIGluIHFjb21fcGFyYW1fcGFnZV90eXBlX2V4ZWMoKSBBUElzIGF0IHRoZSBlbmQgb2Yg
bGluZQo+IAo+IEkgZ3Vlc3MgaXQgaXMgbm93IHRpbWUgdG8gbW92ZSBvbiwgSSBjYW4gYXBwbHkg
cGF0Y2hlcyAyLTUgYW5kIHNoYXJlIGFuCj4gaW1tdXRhYmxlIHRhZy4gSG93ZXZlciwgZHVlIHRv
IHRoZSBmcmVxdWVudCBpbmNvbnNpc3RlbmNpZXMgb2JzZXJ2ZWQKPiBkdXJpbmcgdGhlIGxpZmV0
aW1lIG9mIHRoaXMgcGF0Y2hzZXQsIHdlIG1pZ2h0IGJlIHNsaWdodGx5IG1vcmUKPiBjb25zZXJ2
YXRpdmUgdGhhbiB1c3VhbCBhbmQgc3BsaXQgdGhlIHBhdGNoZXMgb3ZlciB0d28ga2VybmVsCj4g
cmVsZWFzZXMuIEkgZmVhciB0aGVyZSBtaWdodCBiZSBhbm5veWluZyBmaXhlcyBvbiB0aGUgbXRk
IHNpZGUgbmVlZGVkCj4gYmVjYXVzZSBvZiBzb21lIHNpZGUgZWZmZWN0cy4gV2l0aG91dCB0aGVz
ZSwgdGhlIHNwaSB0cmVlIG1pZ2h0IGhhdmUKPiBicm9rZW4gcWNvbSBzdXBwb3J0IGZvciBzZXZl
cmFsIHdlZWtzLiBXaGF0IGRvIHlvdSB0aGluaz8KU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3Bv
bnNlLiBJJ20gZmluZSB3aXRoIG1lcmdpbmcgcGF0Y2hlcyAyIHRvIDUuIEkgCnRlc3RlZCB0aGVt
IG9uIHRvZGF5J3MgbGludXgtbmV4dCwgYW5kIHRoZSBkcml2ZXIgcGVyZm9ybWVkIGFzIGV4cGVj
dGVkLgo+IAo+IENoZWVycywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
