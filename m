Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26C1C3DA59
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2024 23:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmK2Yj/nDVQq3kMAB69eVbIn/CFtcs4GCI8M74Mj2Mw=; b=IV9nbcFjOF/DZg
	xsqGk+tNZsQJ1peyRQl988A09fBuMpJ+F+ZhrUpnse/mOGby0TIU3aDxwWHqffueHuK2/h+XgVpbC
	aUSzr+wTVYYvTDuGJyBlK575t1DB7CHpnylPVVWrDlKnQV8U0T1k3qVFhrb3vjkw8dWRBJr783mRB
	B/3jc6j1JoaIEWJPFreYzHrkjCFkvX44J3F+NY7qIPw2q1WJaakjyb1d/T+3EmMKqXd8Xj74MzZ8d
	l0axMdhpscdVCcOLvnTPjju3tWNtW6t5Qu4nJOZ12WJwAxWjQMT6Nbm9TWJEzz/AtJ+kaDdM6jWaJ
	k8kfo9AT4QSkiz1hkpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTrpm-0000000C5sL-31B7;
	Tue, 16 Jul 2024 23:43:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTrpj-0000000C5re-1nMQ;
	Tue, 16 Jul 2024 23:43:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHf5TC027012;
	Tue, 16 Jul 2024 23:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N3QJ5/o/wDR3TZtIE94AfbmLbVWg1q+EHZ/P1r1AiVg=; b=C+sTG0f2IMrnTAlx
	4lk2QaJ4v/CcGvT5+BB4BGpLGPxpFumq8mOwZ8gnPNZInGHl+N6YXUaLmbKzDLHj
	2K7veyXTejKeunE66CPV9GkvVW4D2OGsK3W7xkpAf9hFrmAr+7eMDLDSMOuk7C5F
	4q0u2R2TYxypbZW1hi/eQMdk2YRi99/EQfzNwIO/fOCoT/bRKwkD1tyJm9IrZ5iq
	qf8w0m1c/zcyLLh7Ejuu2P/X/E3PhZyUkRXC78ctdGuN3o4vAB/mzO4Rj5ky2O/f
	9WskK7p8+NlIZgiGcwRgyczAVyL4JBR8p8c7KBE715OiYWbcWfSPPUteyC7z9Ull
	NFaZVw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs0m4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 23:43:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GNhZE5003908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 23:43:35 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 16:43:34 -0700
Message-ID: <7145cd8e-590a-4260-a738-dc1a386e7787@quicinc.com>
Date: Tue, 16 Jul 2024 16:43:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nvmem: layouts: add U-Boot env layout
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Walle
	<michael@walle.cc>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-boot@lists.denx.de>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
	<rafal@milecki.pl>
References: <20240715135434.24992-1-zajec5@gmail.com>
 <20240715135434.24992-2-zajec5@gmail.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240715135434.24992-2-zajec5@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HjDUvP7cKZSBjai9_qJv7ION5Anjs5h9
X-Proofpoint-GUID: HjDUvP7cKZSBjai9_qJv7ION5Anjs5h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=956
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_164347_587417_44B06D15 
X-CRM114-Status: GOOD (  18.31  )
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

T24gNy8xNS8yNCAwNjo1NCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBVLUJvb3QgZW52aXJvbm1lbnQgdmFyaWFi
bGVzIGFyZSBzdG9yZWQgaW4gYSBzcGVjaWZpYyBmb3JtYXQuIEFjdHVhbAo+IGRhdGEgY2FuIGJl
IHBsYWNlZCBpbiB2YXJpb3VzIHN0b3JhZ2Ugc291cmNlcyAoTVRELCBVQkkgdm9sdW1lLCBFRVBS
T00sCj4gTlZSQU0sIGV0Yy4pLgo+IAo+IE1vdmUgYWxsIGdlbmVyaWMgKE5WTUVNIGRldmljZSBp
bmRlcGVuZGVudCkgY29kZSBmcm9tIE5WTUVNIGRldmljZQo+IGRyaXZlciB0byBhbiBOVk1FTSBs
YXlvdXQgZHJpdmVyLiBUaGVuIGFkZCBhIHNpbXBsZSBOVk1FTSBsYXlvdXQgY29kZSBvbgo+IHRv
cCBvZiBpdC4KPiAKPiBUaGlzIGFsbG93cyB1c2luZyBOVk1FTSBsYXlvdXQgZm9yIHBhcnNpbmcg
VS1Cb290IGVudiBkYXRhIHN0b3JlZCBpbiBhbnkKPiBraW5kIG9mIE5WTUVNIGRldmljZS4KPiAK
PiBUaGUgb2xkIE5WTUVNIGdsdWUgZHJpdmVyIHN0YXlzIGluIHBsYWNlIGZvciBoYW5kbGluZyBi
aW5kaW5ncyBpbiB0aGUKPiBNVEQgY29udGV4dC4gVG8gYXZvaWQgY29kZSBkdXBsaWNhdGlvbiBp
dCB1c2VzIGV4cG9ydGVkIGxheW91dCBwYXJzaW5nCj4gZnVuY3Rpb24uIFBsZWFzZSBub3RlIHRo
YXQgaGFuZGxpbmcgTVREICYgTlZNRU0gbGF5b3V0IGJpbmRpbmdzIG1heSBiZQo+IHJlZmFjdG9y
ZWQgaW4gdGhlIGZ1dHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Cj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4gLS0tCj4gVGhpcyBjaGFuZ2Ugd2FzIG9yaWdpbmFsbHkgc2VudCAo
YW5kIGFwcHJvdmVkIGJ5IE1pcXVlbCkgYXMgYQo+IFtQQVRDSCBWMyA2LzZdIG52bWVtOiBsYXlv
dXRzOiBhZGQgVS1Cb290IGVudiBsYXlvdXQKPiAKPiBJIGp1c3QgYWRqdXN0ZWQgaXQgdG8gdGhl
IGFwcHJvdmVkIGJpbmRpbmcgYW5kIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UuCj4gSSBrZXB0IE1p
cXVlbCdzIFJldmlld2VkLWJ5IHRhZyBkdWUgdG8gbWluaW1hbCBjaGFuZ2VzLgo+IAo+IEkndmUg
c3VjY2Vzc2Z1bGx5IHRlc3RlZCB0aGlzIGNvZGUgdXNpbmcgaXQgaW4gYm90aCB3YXlzOiBhcyBO
Vk1FTQo+IGRldmljZSBkcml2ZXIgJiBOVk1FTSBsYXlvdXQuCj4gCj4gICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIGRyaXZlcnMvbnZtZW0vS2NvbmZpZyAg
ICAgICAgICAgICAgfCAgIDMgKy0KPiAgIGRyaXZlcnMvbnZtZW0vbGF5b3V0cy9LY29uZmlnICAg
ICAgfCAgMTEgKysKPiAgIGRyaXZlcnMvbnZtZW0vbGF5b3V0cy9NYWtlZmlsZSAgICAgfCAgIDEg
Kwo+ICAgZHJpdmVycy9udm1lbS9sYXlvdXRzL3UtYm9vdC1lbnYuYyB8IDIwMyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAgZHJpdmVycy9udm1lbS9sYXlvdXRzL3UtYm9vdC1lbnYu
aCB8ICAxNSArKysKPiAgIGRyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jICAgICAgICAgfCAxNTgg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAyMzQgaW5zZXJ0aW9u
cygrKSwgMTU4IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbnZt
ZW0vbGF5b3V0cy91LWJvb3QtZW52LmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL252
bWVtL2xheW91dHMvdS1ib290LWVudi5oCj4gCi4uLgoKPiArbW9kdWxlX252bWVtX2xheW91dF9k
cml2ZXIodV9ib290X2Vudl9sYXlvdXQpOwo+ICsKPiArTU9EVUxFX0FVVEhPUigiUmFmYcWCIE1p
xYJlY2tpIik7Cj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiArTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgdV9ib290X2Vudl9vZl9tYXRjaF90YWJsZSk7CgpJcyB0aGlzIG1pc3NpbmcgYSBNT0RV
TEVfREVTQ1JJUFRJT04oKT8KClNpbmNlIGNvbW1pdCAxZmZmZTdhMzRjODkgKCJzY3JpcHQ6IG1v
ZHBvc3Q6IGVtaXQgYSB3YXJuaW5nIHdoZW4gdGhlIApkZXNjcmlwdGlvbiBpcyBtaXNzaW5nIikg
YSBtb2R1bGUgd2l0aG91dCBhIE1PRFVMRV9ERVNDUklQVElPTigpIHdpbGwgCnJlc3VsdCBpbiBh
IHdhcm5pbmcgd2l0aCBtYWtlIFc9MS4KCkknbGwgaG9wZWZ1bGx5IGhhdmUgYWxsIGV4aXN0aW5n
IHdhcm5pbmdzIGZpeGVkIGluIDYuMTEgc28gcGxlYXNlIGF2b2lkIAphZGRpbmcgbmV3IG9uZXMg
OikKCi9qZWZmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
