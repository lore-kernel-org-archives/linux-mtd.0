Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79591C04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvjIUMtmBzrXhgBO5HG+RIojA3cNkU+DD4q1wn+dDHs=; b=ap7G3mpAoU058z
	H0G+D40FSsg8MPtyoqqm7lP89uEJaMcBKuTDQThxh55SNq9VugHzKmBpO0WFp0F7MZtMYV45YJdIY
	CjZzzy2UklQgl4pelXrb4qZ5e0lEBV2g7zz5AE4Hi4Uu2VchhHjAwuVR7X8TPT8KBD6iOruoahU8p
	L6bi8Htau5bh2wT/sBP88aZgefpDdR2y1wrpSG+FSGKAQefp+L8pwZkCnDz516vju+XT+peME00Mh
	S8HQqAO8qRe8TqPhtA0ppaLO/h8oHgB8n/nrHqx0OOpn+q/YAshgpxObf1/obQZVsWfRWkqO4ag5C
	z49IJrYlo+nPjxEya2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zg4-0000000E32n-0G9I;
	Mon, 20 May 2024 09:51:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zfz-0000000E32H-0SAK
	for linux-mtd@lists.infradead.org;
	Mon, 20 May 2024 09:51:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K0Hoxb025938;
	Mon, 20 May 2024 09:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SLkGXQQ/Q4Is1uX4318tZb1aH/Kcs5rkYvuM2oRuifI=; b=kt
	DKSq+WnfbehDvoQJQnbL+nhH8hFh2oxLmWBg8qKoNe7aSfZ2Qid16SmdWZVNbNQg
	IVpmK6rH0is8/3k1pAOBVcotjeH5DXfng4/N40+cRj90L2t42krAdEBR9rNyRtJ/
	gM+hFhqzHcXteRfwX/TKNAZmnbPcgoC8CSvJhNjVey08HklFUYZLdHcfFULav2fu
	TjLjJhTid5CdDFroWK5Mb/tEvq8te8HCyIkCdXcomehEdPp5YgFOQTqAujTz11OP
	M8hupB3sbxeYWufKx1AT1/zYmozhddUW4UwZVy2wNJCv1QDdQJXYs49wK8Zisjm9
	vLaK1wwABmx8TD2oC9kw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psnatm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 09:51:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K9pIES010746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 09:51:18 GMT
Received: from [10.216.4.5] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 02:51:12 -0700
Message-ID: <349190aa-9569-f3cc-ef3c-d8561ddf0a51@quicinc.com>
Date: Mon, 20 May 2024 15:21:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 4/7] drivers: mtd: nand: Add qpic_common API file
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
 <20240508083637.3744003-5-quic_mdalam@quicinc.com>
 <20240516143748.2aa6de80@xps-13>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240516143748.2aa6de80@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7PiPCh_Xeb0pAiPh_uzfqDxrBeHKIP4c
X-Proofpoint-ORIG-GUID: 7PiPCh_Xeb0pAiPh_uzfqDxrBeHKIP4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_025127_190640_16140EB3 
X-CRM114-Status: GOOD (  15.40  )
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

CgpPbiA1LzE2LzIwMjQgNjowNyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAK
Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvS2NvbmZpZwo+PiBAQCAtNjEsNiArNjEsMTQgQEAgY29uZmlnIE1URF9OQU5EX0VDQ19NRURJ
QVRFSwo+PiAgIAloZWxwCj4+ICAgCSAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBoYXJk
d2FyZSBFQ0MgZW5naW5lIGZyb20gTWVkaWF0ZWsuCj4+ICAgCj4+ICtjb25maWcgUVBJQ19DT01N
T04KPj4gKwl0cmlzdGF0ZSAiUVBJQyBjb21tb24gYXBpIGZpbGUiCj4+ICsJZGVwZW5kcyBvbiBB
UkNIX1FDT00gfHwgQ09NUElMRV9URVNUCj4+ICsJaGVscAo+PiArCSAgVGhpcyBlbmFibGVzIHN1
cHBvcnQgZm9yIGNvbW1vbiBhcGkgZm9yIHFwaWMgbmFuZCBjb250cm9sbGVyLgo+PiArCSAgY29t
bW9uIGFwaXMgd2lsbCBiZSB1c2VkIGJ5IGJvdGggcmF3IG5hbmQgZHJpdmVyIGFuZCBzZXJpYWwg
bmFuZAo+PiArCSAgZHJpdmVyLgo+IAo+IFRoaXMgc2hvdWxkIHByb2JhYmx5IG5vdCBiZSBhIHN0
YW5kYWxvbmUgc2VsZWN0YWJsZSBpdGVtLiBNYWtlIGl0Cj4gYXV0b21hdGljYWxseSBzZWxlY3Rl
ZCBieSB0aGUgdXNlcnMgaW5jbHVkaW5nIHRoZSBjb21tb24gaGVhZGVyLgogIE9rLgo+IAo+PiAr
Cj4+ICAgZW5kbWVudQo+PiAgIAo+PiAgIGVuZG1lbnUKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvTWFrZWZpbGUgYi9kcml2ZXJzL210ZC9uYW5kL01ha2VmaWxlCj4+IGluZGV4IDE5
ZTEyOTFhYzRkNS4uYzBjMWY4YmQwMjIwIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvTWFrZWZpbGUKPj4gQEAgLTMsNiAr
Myw3IEBACj4+ICAgbmFuZGNvcmUtb2JqcyA6PSBjb3JlLm8gYmJ0Lm8KPj4gICBvYmotJChDT05G
SUdfTVREX05BTkRfQ09SRSkgKz0gbmFuZGNvcmUubwo+PiAgIG9iai0kKENPTkZJR19NVERfTkFO
RF9FQ0NfTUVESUFURUspICs9IGVjYy1tdGsubwo+PiArb2JqLSQoQ09ORklHX1FQSUNfQ09NTU9O
KSArPSBxcGljX2NvbW1vbi5vCj4+ICAgCj4+ICAgb2JqLXkJKz0gb25lbmFuZC8KPj4gICBvYmot
eQkrPSByYXcvCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kNDg4OTIxNDEzNjUKPj4gLS0tIC9kZXYvbnVsbAo+PiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmMKPj4gQEAgLTAsMCArMSw3NDEgQEAK
Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPj4gKy8qCj4+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMTYsIFRoZSBMaW51eCBGb3VuZGF0aW9uLiBBbGwgcmlnaHRzIHJl
c2VydmVkLgo+PiArICovCj4+ICsjaW5jbHVkZSA8bGludXgvYml0b3BzLmg+Cj4+ICsjaW5jbHVk
ZSA8bGludXgvY2xrLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPj4gKyNpbmNsdWRl
IDxsaW51eC9kbWFlbmdpbmUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+
PiArI2luY2x1ZGUgPGxpbnV4L2RtYS9xY29tX2FkbS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2Rt
YS9xY29tX2JhbV9kbWEuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPj4gKyNpbmNs
dWRlIDxsaW51eC9tdGQvcGFydGl0aW9ucy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L210ZC9yYXdu
YW5kLmg+Cj4gCj4gTm8gcmF3IE5BTkQgaW5jbHVkZSBpbiB0aGUgY29tbW9uIGZpbGUuIElmIHRo
ZXJlIGlzIHNvbWV0aGluZyByYXcgTkFORAo+IHNwZWNpZmljLCBpdCBzaG91bGQgbm90IGJlIGhl
cmUuCk9rICwgd2lsbCBmaXggaW4gbmV4dCBwYXRjaAo+IAo+PiArI2luY2x1ZGUgPGxpbnV4L29m
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ICsjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9uLmg+
Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
