Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EB7C197A0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 06:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqjVZC/yAM/7NbpQKFQGB4A7XE5z01RIgtS9PWlYaOU=; b=DsLGhWUD3Vpnfg
	v9Jv3JEQmhms42vA2jKJKoepa90qmP4ZGuWTka+ykHGebaBbLNjlSzsFjjXHEBySPWHYVoPoanydG
	Z4aVTShkC5vZ99vNDUa8ryIgMnq5Q69k0angn2LCTI9DFYXggjAly5IuCHPsP6GQDbJ8+6/vLwzuW
	dkk7ZVdEFwDeqlUrSxMJWAAcxnam+94IEJVAh3gfuclYxQWk/sefWnsx4gKQrQ7oZ+z4SAmZVk2F8
	EmWOAW3I5Q2U9qCcMf/weNcYnAnRgrorSGtlfqCctCQtlJ6nEO7i90EwQTzEcXdQi8WZoYkxBbXu0
	pF5l52b5N3JlSDP8uwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4xns-00BFFW-1R;
	Mon, 20 Nov 2023 06:30:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4xno-00BFEN-2N
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 06:30:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK4gZOn006619;
	Mon, 20 Nov 2023 06:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CGZmw3ytOPVedqQx5ULJZHM7lrN+SXFMFSXmJ04MZbM=;
 b=NP2pJE1O1x35xsRQ3EFCgBukE9fADn/yrxwXXbr/nMbT8lR5J7jWfJk42OyrDsxq2Ymn
 Valz7bbK+/whb9CJ/+cy9vIO59wy3IfZfY5eNExeMV/iyntvvlEBZjMU9YQ4tgoiUjZD
 smjqPI7cfABEve8ULgeUOJ2WJJiVNHFWH6wtM+eJPZq2QmcpBgJFoBHvs/hAm5Rc8yiA
 hTF1O884+uimnJREcDg6BkxgHCTtfPWPSnAhMEr+berE6qZFrGbl9d3rN8iNQwR+i0j3
 vRosMmIMDY9H2Cycy0cIxtXlE3Bp1YDFxTN2DfJn21es17pYQnsG04DkcagTjPGJRsN0 KQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uem80k75k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 06:30:17 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AK6UG2f028003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 06:30:16 GMT
Received: from [10.216.31.13] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 19 Nov
 2023 22:30:10 -0800
Message-ID: <f1a1084f-ecf3-35dd-7822-a6b5931132a3@quicinc.com>
Date: Mon, 20 Nov 2023 12:00:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 1/5] mtd: nand: ecc-qcom: Add support for ECC Engine
 Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-spi@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <qpic_varada@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-2-quic_mdalam@quicinc.com>
 <b9af01d2-1a86-4b41-9bd6-3bf7a0dde1c0@linaro.org>
 <553c1373-c9a0-b2af-2286-058824e31bad@quicinc.com>
 <CAA8EJpp-xsP1x==a5DH8pKpy7XH75UF-L8ewKWmeL8ePtxUq-A@mail.gmail.com>
 <4b911907-44b9-c164-9648-3d399e557672@quicinc.com>
 <20231103144639.6ff40ae2@xps-13>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20231103144639.6ff40ae2@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qZd_ZsaCS1A1-fsxbZp9ZkFvA2ac1FxR
X-Proofpoint-ORIG-GUID: qZd_ZsaCS1A1-fsxbZp9ZkFvA2ac1FxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_03,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_223036_796442_8E9544AD 
X-CRM114-Status: GOOD (  24.84  )
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

CgpPbiAxMS8zLzIwMjMgNzoxNiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAK
Pj4gQmFzZWQgb24gYmVsb3cgZmVlZGJhY2sgWzFdIGFuZCBOQUsgb24gdGhlIGRldmljZSBub2Rl
IHBhdGNoCj4+IGdvdCBpZGVhIG9mIGhhdmluZyBzZXBhcmF0ZSBkZXZpY2Ugbm9kZSBmb3IgRUND
IGlzIG5vdCBhY2NlcHRhYmxlLgo+PiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gY2xhcmlmeSB0
aGF0Lgo+IAo+IElmIEkgbWF5IHRyeSB0byBjb21wYXJlIHdpdGggdGhlIE1hY3Jvbml4IHNpdHVh
dGlvbiwgdGhlIEVDQyBlbmdpbmUKPiB3YXMgYW4gaW5kZXBlbmRlbnQgaGFyZHdhcmUgYmxvY2ss
IHdpdGggaXRzIG93biBtYXBwaW5nIGFuZCBpdHMgb3duCj4gcmVnaXN0ZXJzLCBzbyBpdCB3YXMg
ZGVzY3JpYmVkIGFzIGFuIGluZGVwZW5kZW50IG5vZGUgaW4gdGhlIERULiBUaGUKPiB0eXBlIG9m
IEVDQyBjb250cm9sbGVyIChwaXBlbGluZWQgb3IgZXh0ZXJuYWwpIGlzIGRlc2NyaWJlZCBieSB0
aGUKPiBuYW5kLWVjYy1lbmdpbmUgcHJvcGVydHkgd2hpY2ggZWl0aGVyIHBvaW50cyBhdCB0aGUg
cGFyZW50IG5vZGUKPiAocGlwZWxpbmVkKSBvciBhbiBleHRlcm5hbCBub2RlIChleHRlcm5hbCku
IFRoZSBTUEkgaG9zdCB3b3VsZCBpdHNlbGYKPiBwb2ludCBhdCB0aGUgZXh0ZXJuYWwgRUNDIGVu
Z2luZSBub2RlIHdpdGggaXRzIG93biBuYW5kLWVjYy1lbmdpbmUKPiBwcm9wZXJ0eSAoc2VlIG10
ZC9teGljeSxuYW5kLWVjYy1lbmdpbmUueWFtbCBpbiB0aGUgYmluZGluZ3MpLgoKU29ycnkgZm9y
IGxhdGUgcmVwbHkuCgpTaW5jZSBRUElDIGNvbnRyb2xsZXIgRUNDIGVuZ2luZSBpcyBub3QgYSBz
ZXBhcmF0ZSBIVyBibG9jay4gVG8gY29udHJvbCBFQ0MKZnVuY3Rpb25hbGl0eSB0aGVyZSBpcyBv
bmx5IG9uZSByZWdpc3RlciA0LWJ5dGVzIGxvbmcuQXMgeW91IHN1Z2dlc3RlZCBhYm92ZSwKRUND
IGNvbnRyb2xsZXIgZGVzY3JpYmVkIGJ5IHRoZSBwcm9wZXJ0eSBuYW5kLWVjYy1lbmdpbmUuSSBo
YXZlIGNoZWNrZWQKbXRkL214aWN5LG5hbmQtZWNjLWVuZ2luZS55YW1sIGZpbGUgYW5kIGdvdCB0
byBrbm93IEkgY2FuIHVzZSBsaWtlCm5hbmQtZWNjLWVuZ2luZSA9IDwmcXBpY19uYW5kPjsgaW4g
ZHRzLk5vdyBhZGRpdGlvbmFsIEVDQyBub2RlIG5vdCBuZWVkZWQKaW4gRFRTLiBXaWxsIGNsZWFu
IHVwIGV2ZXJ5dGhpbmcgaW4gbmV4dCBwYXRjaC4KCj4gCj4+IFNpbmNlIEVDQyBibG9jayBpcyBp
bmxpbmVkIHdpdGggUVBJQyBjb250cm9sbGVyIHNvIGlzIHRoZSBiZWxvdwo+PiBkZXZpY2Ugbm9k
ZSBhY2NlcHRhYmxlID8KPj4KPj4gICAgICBiY2g6IHFwaWNfZWNjIHsKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicWNvbSxpcHE5NTc0LWVjYyI7Cj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2siOwo+PiAgICAgICAgICAgICAgICAg
ICAgIH07Cj4gCj4gSWYgaXQgZG9lcyBub3QgaGFzIGl0cyBvd24gbWFwcGluZyBhbmQgaWYgeW91
IGFjY2VzcyB0aGUgRUNDIGVuZ2luZQo+IHRocm91Z2ggdGhlIGhvc3QgcmVnaXN0ZXJzIHRoZW4g
dGhlIGNvbnRyb2xsZXIgc2hvdWxkIGJlIHBhcnQgb2YgdGhlCj4gaG9zdCBub2RlLCBidXQgSSBh
bSBub3Qgc3VyZSBpdCByZWFsbHkgbmVlZHMgdG8gYmUgZGVzY3JpYmVkCj4gZXhwbGljaXRseSwg
bW9zdCBvZiB0aGVtIGFyZSBub3QgZm9yIGhpc3RvcmljYWwgcmVhc29ucy4gQ29uY2VwdHVhbGx5
Cj4gdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggc3Vibm9kZXMgb2YgZWFjaCBvZiB0aGVzZSBjb250
cm9sbGVycyBoYXZpbmcKPiBhIHNpZ25pZmljYXRpb24gYWxyZWFkeTogU1BJIGRldmljZXMgb3Ig
TkFORCBjaGlwcy4KCk5ldyBkZXZpY2Ugbm9kZSBmb3Igc3BpIG5hbmQgbG9va3MgbGlrZSBhcyBi
ZWxvdy4KCiZxcGljX25hbmQgewogICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwogICAgICAgICAg
cGluY3RybC0wID0gPCZxc3BpX25hbmRfcGlucz47CiAgICAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwogICAgICAgICAgc3BpX25hbmQ6IHNwaV9uYW5kQDAgewogICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInNwaS1uYW5kIjsKICAgICAgICAgICAgICAgICAgcmVnID0gPDA+
OwogICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MT47CiAgICAgICAgICAgICAgICAgIG5hbmQtZWNjLWVuZ2luZSA9
IDwmcXBpY19uYW5kPjsKICAgICAgICAgICAgICAgICAgbmFuZC1lY2Mtc3RyZW5ndGggPSA8ND47
CiAgICAgICAgICAgICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6ZSA9IDw1MTI+OwogICAgICAgICAg
ICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw4MDAwMDAwPjsKICAgICAgICAgIH07Cn07CgpX
aXRoIHRoZSBhYm92ZSBkZXZpY2Ugbm9kZSBJIGhhdmUgdGVzdGVkIHRoZSBzcGkgbmFuZCBkZXZp
Y2UgZW51bWVyYXRpb24KaXRzIHdvcmtpbmcgZmluZS4gV2lsbCBjbGVhbnVwIGV2ZXJ5dGhpbmcg
YW5kIHBvc3QgaW4gbmV4dCBwYXRjaC4KCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
