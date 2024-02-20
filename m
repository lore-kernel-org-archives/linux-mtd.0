Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1025C48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S6aroivjoOTetALA/8cbwXrTmmb9vU+GEFp9jJoEks=; b=u2DJZM2p4xseqY
	NAJ56dwSRhSB3oCWsgeljbwpexOLln2FZ9qbcvqptvmqFMB8vk8Zxtfh8x33SpKfiEKCeBqJL78Dl
	1VLkYrhZfdvBsInM8jCO6n6jrY5LWEUMEnK3tHxPJXqN1Bw7K1wGOeF5eGVsQdvYz4sIHMryLoF/7
	zDf5D7cwOpIkAGslMwHh44nidVNVwDaEZX5q7BgqEruwRwgfNxYkjjh8qaTBpWHpTImwFQNhgp7zA
	Sxy2W+uLBWU1aPDzH8H/SSB2BVjBvQ65/4idQx42e7n1fIlaB/8euvlXqDn/zkHoLpEvf9qVrQfWG
	9lIcG+BRu3UhrzOxpr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPHx-0000000Ehvm-01HE;
	Tue, 20 Feb 2024 12:31:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPHt-0000000EhtX-1ZJY
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 12:31:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KAEioE025078;
	Tue, 20 Feb 2024 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+LpGty1WpTBAu3u7mkOybl2Gl1+n/qkpH75rRLI6A+8=; b=UT
	izOyufZn3dlb5lmhN0gMUnMZUzW3VhGArJoLZZ3pVDpdRNq9pJOp8px/4VG4wqt8
	GWi0oktlhZLirGRpZGdf+HSOr/KT3gl+LzHndOrkK+NFiyhBd0Ql4fQQ8ma8y8yO
	hBSLciudHciG4YxG/hl4LMkDl8lyXoXw1oMlpENSKM/9esowMnsyfYzhH1Pyfdzs
	t3X5AQdus8elLzYDZ+JZNrZMCaY9CPJv3KivhIkkLx1fLEFzi82afhUe+2gKlgih
	R6SzJzxUA3cbfj8CYY81fYbIpKjJQGQn/06IMovG0w/4b3QJoWUUcRd8zryFxOcM
	gxygtLWW+rdzt2+iR/kA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wct5787v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:31:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KCVlQS017701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:31:47 GMT
Received: from [10.216.16.129] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 04:31:41 -0800
Message-ID: <3e1e56dc-adb6-e4ec-b99b-688c707ddf0a@quicinc.com>
Date: Tue, 20 Feb 2024 18:01:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/5] arm64: dts: qcom: ipq9574: Add SPI nand support
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <broonie@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-5-quic_mdalam@quicinc.com>
 <17c6b3df-2acd-45e2-8167-02c629b1e972@quicinc.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <17c6b3df-2acd-45e2-8167-02c629b1e972@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: St93OQcwmYXz7tjkL789OcImyOxEtwXK
X-Proofpoint-GUID: St93OQcwmYXz7tjkL789OcImyOxEtwXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402200090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_043153_451508_4EFB55D0 
X-CRM114-Status: GOOD (  14.24  )
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

CgpPbiAyLzE2LzIwMjQgOToxMCBQTSwgS2F0aGlyYXZhbiBUaGlydW1vb3J0aHkgd3JvdGU6Cj4g
Cj4gCj4gT24gMi8xNS8yMDI0IDc6MTggUE0sIE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4+IEFkZCBT
UEkgTkFORCBzdXBwb3J0IGZvciBpcHE5NTc0IFNvQy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWQg
U2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4+IC0tLQo+PiDCoCAuLi4vYm9v
dC9kdHMvcWNvbS9pcHE5NTc0LXJkcC1jb21tb24uZHRzacKgwqDCoMKgIHwgNDMgKysrKysrKysr
KysrKysrKysrKwo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vaXBxOTU3NC5kdHNpwqDC
oMKgwqDCoMKgwqDCoCB8IDI3ICsrKysrKysrKysrKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDcw
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9pcHE5NTc0LXJkcC1jb21tb24uZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9pcHE5
NTc0LXJkcC1jb21tb24uZHRzaQo+PiBpbmRleCA5MWUxMDRiMGY4NjUuLjViNTRhMDI3ZmE1ZCAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL2lwcTk1NzQtcmRwLWNvbW1v
bi5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9pcHE5NTc0LXJkcC1jb21t
b24uZHRzaQo+PiBAQCAtMTM5LDYgKzEzOSw0OSBAQCBncGlvX2xlZHNfZGVmYXVsdDogZ3Bpby1s
ZWRzLWRlZmF1bHQtc3RhdGUgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZHJpdmUtc3RyZW5ndGgg
PSA8OD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLXB1bGwtdXA7Cj4+IMKgwqDCoMKgwqAg
fTsKPj4gKwo+PiArwqDCoMKgIHFwaWNfc25hbmRfZGVmYXVsdF9zdGF0ZTogcXBpYy1zbmFuZC1k
ZWZhdWx0LXN0YXRlIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLXBpbnMgewo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwaW5zID0gImdwaW81IjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZnVuY3Rpb24gPSAicXNwaV9jbGsiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcml2
ZS1zdHJlbmd0aCA9IDw4PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1kaXNhYmxl
Owo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgY3MtcGlucyB7
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbnMgPSAiZ3BpbzQiOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmdW5jdGlvbiA9ICJxc3BpX2NzIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZHJpdmUtc3RyZW5ndGggPSA8OD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJp
YXMtZGlzYWJsZTsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
IGRhdGEtcGlucyB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbnMgPSAiZ3BpbzAiLCAi
Z3BpbzEiLCAiZ3BpbzIiOwo+IAo+IAo+IEFzIHBlciB0aGUgcGluY3RybCBkcml2ZXJbMV0sIHRo
ZXJlIGFyZSA0IGRhdGEgcGlucy4KPiAKPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9waW5j
dHJsL3Fjb20vcGluY3RybC1pcHE5NTc0LmMjbjI5NgoKICAgV2lsbCBmaXggaW4gbmV4dCBwYXRj
aC4KPiAKPiAKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVuY3Rpb24gPSAicXNwaV9kYXRh
IjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJpdmUtc3RyZW5ndGggPSA8OD47Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpYXMtZGlzYWJsZTsKPj4gK8KgwqDCoMKgwqDCoMKgIH07
Cj4+ICvCoMKgwqAgfTsKPj4gK307Cj4+ICsKPj4gKyZxcGljX2JhbSB7Cj4+ICvCoMKgwqAgc3Rh
dHVzID0gIm9rYXkiOwo+PiArfTsKPj4gKwo+PiArJnFwaWNfbmFuZCB7Cj4+ICvCoMKgwqAgcGlu
Y3RybC0wID0gPCZxcGljX3NuYW5kX2RlZmF1bHRfc3RhdGU+Owo+PiArwqDCoMKgIHBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+PiArCj4+ICvC
oMKgwqAgZmxhc2hAMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNwaS1uYW5k
IjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZyA9IDwwPjsKPj4gK8KgwqDCoMKgwqDCoMKgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Owo+PiArwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MT47Cj4+
ICvCoMKgwqDCoMKgwqDCoCBuYW5kLWVjYy1lbmdpbmUgPSA8JnFwaWNfbmFuZD47Cj4+ICvCoMKg
wqDCoMKgwqDCoCBuYW5kLWVjYy1zdHJlbmd0aCA9IDw0PjsKPj4gK8KgwqDCoMKgwqDCoMKgIG5h
bmQtZWNjLXN0ZXAtc2l6ZSA9IDw1MTI+Owo+PiArwqDCoMKgIH07Cj4+IMKgIH07Cj4+IMKgICZ1
c2JfMF9kd2MzIHsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9pcHE5
NTc0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vaXBxOTU3NC5kdHNpCj4+IGluZGV4
IDdmMmU1Y2JmM2JiYi4uZDk2M2RkMjAzNWRkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3Fjb20vaXBxOTU3NC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9pcHE5NTc0LmR0c2kKPj4gQEAgLTMxOSw2ICszMTksMzMgQEAgdGNzcjogc3lzY29uQDE5Mzcw
MDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwMTkzNzAwMCAweDIx
MDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqDCoMKgwqDCoCBxcGljX2Jh
bTogZG1hLWNvbnRyb2xsZXJANzk4NDAwMCB7Cj4gCj4gCj4gTm9kZXMgc2hvdWxkIGJlIG9yZGVy
ZWQgYnkgdW5pdCBhZGRyZXNzIGluIGFzY2VuZGluZyBvcmRlci4gU28gcGxlYXNlIG1vdmUgdGhl
c2Ugbm9kZXMgdG8gdGhlIHJpZ2h0IHBsYWNlLgogIE9rCj4gCj4gCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicWNvbSxiYW0tdjEuNy4wIjsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmVnID0gPDB4Nzk4NDAwMCAweDFjMDAwPjsKPiAKPiAKPiBhZGRyZXNzIHNo
b3VsZCBiZSBwYWRkZWQgdG8gOCBieXRlcy4KT2sKPiAKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE0NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZnY2MgR0NDX1FQSUNfQUhCX0NMSz47Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImJhbV9jbGsiOwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAjZG1hLWNlbGxzID0gPDE+Owo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBxY29tLGVlID0gPDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMg
PSAiZGlzYWJsZWQiOwo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKgwqDCoMKg
wqAgcXBpY19uYW5kOiBzcGlANzliMDAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bXBhdGlibGUgPSAicWNvbSxpcHE5NTc0LXNuYW5kIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnID0gPDB4NzliMDAwMCAweDEwMDAwPjsKPiAKPiAKPiBEaXR0by4uCk9rCj4gCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY2xvY2tzID0gPCZnY2MgR0NDX1FQSUNfQ0xLPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPCZnY2MgR0NDX1FQSUNfQUhCX0NMSz4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwm
Z2NjIEdDQ19RUElDX0lPX01BQ1JPX0NMSz47Cj4gCj4gCj4gRml4IHRoZSBhbGlnbm1lbnQuCk9r
Cj4gCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiYW9u
IiwgImlvbSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYXMgPSA8JnFwaWNfYmFtIDA+
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcXBpY19iYW0gMT4sCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZxcGljX2JhbSAyPjsKPiAKPiAKPiBIZXJl
IGFzIHdlbGwuCk9rCj4gCj4gCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYS1uYW1lcyA9
ICJ0eCIsICJyeCIsICJjbWQiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAi
ZGlzYWJsZWQiOwo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgc2RoY18xOiBtbWNANzgwNDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bXBhdGlibGUgPSAicWNvbSxpcHE5NTc0LXNkaGNpIiwgInFjb20sc2RoY2ktbXNtLXY1IjsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MDc4MDQwMDAgMHgxMDAwPiwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
