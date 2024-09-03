Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485F6CD343A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKPQiUKwgYlEbEk8mtdHdZEfPXSNlCdoN71S5fL2IuE=; b=rknsoxhGRFXZa2
	Rq96ZanYp8bD+P/jNZgpda9Kg8Y/tPUyZY2DREMgPlMrkI5OxcX0jcXv+lqWJrZcmWNR1f84JvqND
	oOPgxVLHEL+eGuLc27gAdiGbO0RYGJyrtN2qgGUXBL//DX8LtMFWEqdy91OlV5UzGnnzRBWmHz/RB
	w97wFVqXmdWiHRzzIwK2pTV9BXt7k5A7nRHEKldREpEjNWyNzX75tkTwcCSU0RklCrEVnpTnSyXcp
	OpjaALYXxXvt4tBQ4X8GxLVwpMzHBriVY+57Spas/zWCU7AFcr8aXXWofBRV4p0WFHKzdwAiB4keZ
	maudr1FjMwjrt5HlrtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUP1-00000000XXc-3oOz;
	Tue, 03 Sep 2024 14:21:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUOz-00000000XXC-3Myx
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 14:21:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4838R7AC020929;
	Tue, 3 Sep 2024 14:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44ZenkOsuRdWbJkYILWBtuSlvXtFq9Y0l8/3H8KjMRU=; b=h234HtXng3G752zd
	EpaXh+8bPMhNeDv7ECr1Rbzq5KVF5eTj9PsfpredkPe0Vc5yOcJIB40ITkI06/Mq
	akLMCsERb8eZC3BXMp9lnlQ4DfxQcy/JvipcbLEbwyt/mfyoefcZPhEw0W5Cs3XX
	IGGzj3LJLlpdMp2PXhidwcqWCiMxzu0jdoB+k7BMKVF2slJuUb5KM6zJl2dDXTtW
	AKeb0I7PNpOoXTW3t/k31nHYuuRb9A29S4vIeDl1Q1MvTsSVEBdxF7DEVEEsgC57
	E6Z7Q4oKcROTkZRUdQCxYoGZ0qo2wt3ceWzAP4lKeqIVS8zWo7/pzYj29dH1Xuak
	84BGRA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy20y50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 14:20:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483EKhvl006075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 14:20:43 GMT
Received: from [10.216.9.110] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 07:20:38 -0700
Message-ID: <9989334b-cd91-9493-6097-c1f94c518cb8@quicinc.com>
Date: Tue, 3 Sep 2024 19:50:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 0/8] Add QPIC SPI NAND driver
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
 <5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
 <20240903150826.749b8560@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240903150826.749b8560@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XjxU3FVBARlC6hh-Q6OUfpodIPFZY2Z4
X-Proofpoint-ORIG-GUID: XjxU3FVBARlC6hh-Q6OUfpodIPFZY2Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_02,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=974 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_072101_869035_A4F4DB88 
X-CRM114-Status: GOOD (  13.39  )
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

CgpPbiA5LzMvMjAyNCA2OjM4IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpLAo+IAo+IHF1
aWNfbWRhbGFtQHF1aWNpbmMuY29tIHdyb3RlIG9uIFR1ZSwgMyBTZXAgMjAyNCAxNDo0NToxNSAr
MDUzMDoKPiAKPj4gSGkgTWlxdWVsLAo+Pgo+PiBPbiA4LzIwLzIwMjQgNDoxMiBQTSwgTWQgU2Fk
cmUgQWxhbSB3cm90ZToKPj4+IHY4Ogo+Pj4gICAgKiBGaXhlZCBjb21waWxhdGlvbiB3YXJuaW5n
IHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90Cj4+PiAgICAqIEFkZGVkICJjaGlwIiBkZXNj
cmlwdGlvbiBpbiBuYW5kY19zZXRfcmVhZF9sb2NfZmlyc3QoKQo+Pj4gICAgKiBBZGRlZCAiY2hp
cCIgZGVzY3JpcHRpb24iIGluIG5hbmRjX3NldF9yZWFkX2xvY19sYXN0KCkKPj4+ICAgICogQ2hh
bmdlZCBkYXRhIHR5cGUgb2YgcmVhZF9sb2NhdGlvbjAsIHJlYWRfbG9jYXRpb24xLAo+Pj4gICAg
ICByZWFkX2xvY2F0aW9uMiwgcmVhZF9sb2NhdGlvbjMsIGFkZHIwLCBhZGRyMSwgY21kLCBjZmcw
LAo+Pj4gICAgICBjZmcxLCBlY2NfYmNoX2NmZywgZWNjX2J1Zl9jZmcsIGNscmZsYXNoc3RhdHVz
LCBjbHJyZWFkc3RhdHVzLAo+Pj4gICAgICBvcmlnX2NtZDEsIG9yaWdfdmxkIHRvIF9fbGUzMiB0
byBmaXggY29tcGlsYXRpb24gd2FybmluZy4KPj4+ICAgICogSW5jbHVkZWQgYml0ZmllbGQuaCBo
ZWFkZXIgZmlsZSBpbiBzcGktcXBpYy1zbmFuZC5jIHRvCj4+PiAgICAgIGZpeCBjb21waWxhdGlv
biB3YXJuaW5nCj4+PiAgICAqIFJlbW92ZWQgdW51c2VkIHZhcmlhYmxlICJzdGVwcyIgdmFyaWFi
bGUgZnJvbQo+Pj4gICAgICBxY29tX3NwaV9lY2NfaW5pdF9jdHhfcGlwZWxpbmVkKCkKPj4+ICAg
IAo+PiAgICAgICBJIGhhdmUgYWRkcmVzc2VkIHlvdXIgY29tbWVudHMgdG8gdjYgYW5kIGZ1cnRo
ZXIgcG9zdGVkIHRpbGwgdjguCj4+ICAgICAgIENvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cg
aWYgdGhpcyBpcyBmaW5lLgo+PiAgICAgICBhbmQgaG93IHRvIGdldCB0aGlzIG1lcmdlZCA/Cj4g
Cj4gVGhlcmUgYXJlIHN0aWxsIGtlcm5lbCB0ZXN0IHJvYm90IHJlcG9ydHMsIHNvIHRoaXMgbWVh
bnMgdGhlcmUgYXJlCj4gaXNzdWVzIGluIHlvdXIgY29kZSB0aGF0IEkgZG9uJ3QgbmVlZCB0byBw
b2ludCBvdXQgZXhwbGljaXRseSwgYnV0IEkgYW0KPiBhY3RpdmVseSB3YWl0aW5nIGZvciB0aGVt
IHRvIGJlIGZpeGVkLgoKICAgU29ycnkgSSBtaXNzZWQgaXQsIHdpbGwgZml4IGFuZCBwb3N0IG5l
eHQgcmV2aXNpb24uCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
