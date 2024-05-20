Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6C9C25B79
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VieHX/SGnbq8zzi6CnmsffmFfwpKnxsp/Rj+Vuu1cOY=; b=Uc0RZyBRXNZ3sp
	/sJLRKjtcKEJ2bAPQgLopouH2LZAABBAm+7yHm/fGCikJonIM2A+P6KfyoQ3Loc0DBL1sXeFi7/vf
	Y4ojonw9gZv8bBElPViibDcEmnpOyKMqXQCBhSzEmwjG1WcRWK7xKGo+2pXF1J8Q61AT+m9+AALXW
	EtpsyT2lkO8MEA1uNWfD0rJYfdHDkPs/ZP3SLj9gTA5aLa7QayBA/AEzkr2HHh0anD5Wj/avC0blm
	qm+RoFHV6mrgdEWVtlJFZME7y7VjqQyK103v0NGvRHICODfJqu2YxyaqoLuPikGPfVs9zQhnkH34E
	CC+D1g+us3esk999tTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94u6-0000000Eq9N-3sbW;
	Mon, 20 May 2024 15:26:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s94u4-0000000Eq89-0RsR
	for linux-mtd@lists.infradead.org;
	Mon, 20 May 2024 15:26:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KBxetH027895;
	Mon, 20 May 2024 15:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1GSnmUdRyYGVKwRtFxOe1UDSnBY7e7eDTA9KqNUtPp0=; b=fG
	FPhlgMPau73LyO7j+fW76sNe4luWpc4YDoFqVQckgn+Qj61wtppvNUqoSqRZEX6m
	97n4yOQHdWsYuV3k94BC9DrIwpu9/xfwT2thqFRUjgGoIvv2NgvJPr2subK200Z/
	5SDLODnQ9xPIudxwHRH/qQwR2/8V63WAFNWcKm7yuk1MkMWWmMijqiqG9i8vXlD4
	KZLORf/YD4BR0Nskgii+f4mskRbWmFXisZLqtJZGYW9+6q/G8nbpAvNFssobet/+
	gudV/UQ9g9dBSvD+3G3KJxDCwQUpUjb5uZlZ8XfdezVxe1GfQgTZ4d+urOcgUROV
	Wc3+L/sGfmklTfQIUXnQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc3h9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:26:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KFQ8Cd021529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:26:08 GMT
Received: from [10.216.4.5] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 08:26:02 -0700
Message-ID: <05657afe-0c09-a199-00bb-abc864d78780@quicinc.com>
Date: Mon, 20 May 2024 20:55:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 5/7] spi: spi-qpic: add driver for QCOM SPI NAND flash
 Interface
Content-Language: en-US
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
 <20240508083637.3744003-6-quic_mdalam@quicinc.com>
 <20240516145642.644a7f1c@xps-13>
 <434590e3-9298-dde9-f527-6596dbd1952b@quicinc.com>
 <20240520144334.79c754e3@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240520144334.79c754e3@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oclv6RiNCPsGapctBgEFi2IJmX6v0UP1
X-Proofpoint-GUID: oclv6RiNCPsGapctBgEFi2IJmX6v0UP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_082620_182153_100976B6 
X-CRM114-Status: GOOD (  23.89  )
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

CgpPbiA1LzIwLzIwMjQgNjoxMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPj4+
PiArc3RhdGljIGludCBxY29tX3NwaV9pb19vcChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIg
KnNuYW5kYywgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+Pj4+ICt7Cj4+Pj4gKwlpbnQg
cmV0LCB2YWwsIG9wY29kZTsKPj4+PiArCWJvb2wgY29weSA9IGZhbHNlLCBjb3B5X2Z0ciA9IGZh
bHNlOwo+Pj4+ICsKPj4+PiArCXJldCA9IHFjb21fc3BpX3NlbmRfY21kYWRkcihzbmFuZGMsIG9w
KTsKPj4+PiArCWlmIChyZXQpCj4+Pj4gKwkJcmV0dXJuIHJldDsKPj4+PiArCj4+Pj4gKwlzbmFu
ZGMtPmJ1Zl9jb3VudCA9IDA7Cj4+Pj4gKwlzbmFuZGMtPmJ1Zl9zdGFydCA9IDA7Cj4+Pj4gKwlx
Y29tX2NsZWFyX3JlYWRfcmVncyhzbmFuZGMpOwo+Pj4+ICsJcWNvbV9jbGVhcl9iYW1fdHJhbnNh
Y3Rpb24oc25hbmRjKTsKPj4+PiArCW9wY29kZSA9IG9wLT5jbWQub3Bjb2RlOwo+Pj4+ICsKPj4+
PiArCXN3aXRjaCAob3Bjb2RlKSB7Cj4+Pj4gKwljYXNlIFNQSU5BTkRfUkVBRElEOgo+Pj4+ICsJ
CXNuYW5kYy0+YnVmX2NvdW50ID0gNDsKPj4+PiArCQlxY29tX3JlYWRfcmVnX2RtYShzbmFuZGMs
IE5BTkRfUkVBRF9JRCwgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+Pj4+ICsJCWNvcHkgPSB0cnVl
Owo+Pj4+ICsJCWJyZWFrOwo+Pj4+ICsJY2FzZSBTUElOQU5EX0dFVF9GRUFUVVJFOgo+Pj4+ICsJ
CXNuYW5kYy0+YnVmX2NvdW50ID0gNDsKPj4+PiArCQlxY29tX3JlYWRfcmVnX2RtYShzbmFuZGMs
IE5BTkRfRkxBU0hfRkVBVFVSRVMsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPj4+PiArCQljb3B5
X2Z0ciA9IHRydWU7Cj4+Pj4gKwkJYnJlYWs7Cj4+Pj4gKwljYXNlIFNQSU5BTkRfU0VUX0ZFQVRV
UkU6Cj4+Pj4gKwkJc25hbmRjLT5yZWdzLT5mbGFzaF9mZWF0dXJlID0gKih1MzIgKilvcC0+ZGF0
YS5idWYub3V0Owo+Pj4+ICsJCXFjb21fd3JpdGVfcmVnX2RtYShzbmFuZGMsICZzbmFuZGMtPnJl
Z3MtPmZsYXNoX2ZlYXR1cmUsCj4+Pj4gKwkJCQkgICBOQU5EX0ZMQVNIX0ZFQVRVUkVTLCAxLCBO
QU5EX0JBTV9ORVhUX1NHTCk7Cj4+Pj4gKwkJYnJlYWs7Cj4+Pj4gKwlkZWZhdWx0Ogo+Pj4+ICsJ
CXJldHVybiAwOwo+Pj4KPj4+IE5vIGVycm9yIHN0YXRlPwo+PiAgICAgV2UgY2FuJ3QgcmV0dXJu
IHJldHVybiBlcnJvciBoZXJlICwgc2luY2UgdGhpcyBBUEkgaXMgbm90IGZvciBjaGVja2luZyBz
dXBwb3J0ZWQgY29tbWFuZC4KPiAKPiBJIG5vIGxvbmdlciByZW1lbWJlciBleGFjdGx5IHdoZXJl
IHRoaXMgaXMgY2FsbGVkLCBidXQgaWYgdGhlcmUgYXJlCj4gcG9zc2libGUgdW5oYW5kbGVkIGNh
c2VzLCBJIHdhbnQgYW4gZXJyb3IgdG8gYmUgcmV0dXJuZWQuCk9rCj4gCj4+ICAgICBXZSBjYW4g
cmV0dXJuIGVycm9yIG9ubHkgaWYgd2Ugc3VibWl0dGVkIHRoZSBkZXNjcmlwdG9yLiBUaGF0IGFs
cmVhZHkgd2UgYXJlIGhhbmRsaW5nLgo+IAo+IC4uLgo+IAo+Pj4+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvbXRkL25hbmQtcXBpYy1jb21tb24uaAo+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL25h
bmQtcXBpYy1jb21tb24uaAo+Pj4+IEBAIC0zMTUsMTEgKzMxNSw1NiBAQCBzdHJ1Y3QgbmFuZGNf
cmVncyB7Cj4+Pj4gICAgCV9fbGUzMiByZWFkX2xvY2F0aW9uX2xhc3QxOwo+Pj4+ICAgIAlfX2xl
MzIgcmVhZF9sb2NhdGlvbl9sYXN0MjsKPj4+PiAgICAJX19sZTMyIHJlYWRfbG9jYXRpb25fbGFz
dDM7Cj4+Pj4gKwlfX2xlMzIgc3BpX2NmZzsKPj4+PiArCV9fbGUzMiBudW1fYWRkcl9jeWNsZTsK
Pj4+PiArCV9fbGUzMiBidXN5X3dhaXRfY250Owo+Pj4+ICsJX19sZTMyIGZsYXNoX2ZlYXR1cmU7
Cj4+Pj4gICAgPj4gICAJX19sZTMyIGVyYXNlZF9jd19kZXRlY3RfY2ZnX2NscjsKPj4+PiAgICAJ
X19sZTMyIGVyYXNlZF9jd19kZXRlY3RfY2ZnX3NldDsKPj4+PiAgICB9Owo+Pj4+ICAgID4+ICsv
Kgo+Pj4+ICsgKiBFQ0Mgc3RhdGUgc3RydWN0Cj4+Pj4gKyAqIEBjb3JyZWN0ZWQ6CQlFQ0MgY29y
cmVjdGVkCj4+Pj4gKyAqIEBiaXRmbGlwczoJCU1heCBiaXQgZmxpcAo+Pj4+ICsgKiBAZmFpbGVk
OgkJRUNDIGZhaWxlZAo+Pj4+ICsgKi8KPj4+PiArc3RydWN0IHFjb21fZWNjX3N0YXRzIHsKPj4+
PiArCXUzMiBjb3JyZWN0ZWQ7Cj4+Pj4gKwl1MzIgYml0ZmxpcHM7Cj4+Pj4gKwl1MzIgZmFpbGVk
Owo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiArc3RydWN0IHFwaWNfZWNjIHsKPj4+PiArCXN0cnVjdCBk
ZXZpY2UgKmRldjsKPj4+PiArCWNvbnN0IHN0cnVjdCBxcGljX2VjY19jYXBzICpjYXBzOwo+Pj4+
ICsJc3RydWN0IGNvbXBsZXRpb24gZG9uZTsKPj4+PiArCXUzMiBzZWN0b3JzOwo+Pj4+ICsJdTgg
KmVjY2RhdGE7Cj4+Pj4gKwlib29sIHVzZV9lY2M7Cj4+Pj4gKwl1MzIgZWNjX21vZGVzOwo+Pj4+
ICsJaW50IGVjY19ieXRlc19odzsKPj4+PiArCWludCBzcGFyZV9ieXRlczsKPj4+PiArCWludCBi
Ym1fc2l6ZTsKPj4+PiArCWludCBlY2NfbW9kZTsKPj4+PiArCWludCBieXRlczsKPj4+PiArCWlu
dCBzdGVwczsKPj4+PiArCWludCBzdGVwX3NpemU7Cj4+Pj4gKwlpbnQgc3RyZW5ndGg7Cj4+Pj4g
KwlpbnQgY3dfc2l6ZTsKPj4+PiArCWludCBjd19kYXRhOwo+Pj4+ICsJdTMyIGNmZzAsIGNmZzE7
Cj4+Pj4gKwl1MzIgY2ZnMF9yYXcsIGNmZzFfcmF3Owo+Pj4+ICsJdTMyIGVjY19idWZfY2ZnOwo+
Pj4+ICsJdTMyIGVjY19iY2hfY2ZnOwo+Pj4+ICsJdTMyIGNscmZsYXNoc3RhdHVzOwo+Pj4+ICsJ
dTMyIGNscnJlYWRzdGF0dXM7Cj4+Pj4gKwlib29sIGJjaF9lbmFibGVkOwo+Pj4+ICt9Owo+Pj4+
ICsKPj4+PiArc3RydWN0IHFwaWNfZWNjOwo+Pj4+ICsKPj4+PiAgICAvKgo+Pj4+ICAgICAqIE5B
TkQgY29udHJvbGxlciBkYXRhIHN0cnVjdAo+Pj4+ICAgICAqCj4+Pj4gQEAgLTMyOSw2ICszNzQs
NyBAQCBzdHJ1Y3QgbmFuZGNfcmVncyB7Cj4+Pj4gICAgICoKPj4+PiAgICAgKiBAY29yZV9jbGs6
CQkJY29udHJvbGxlciBjbG9jawo+Pj4+ICAgICAqIEBhb25fY2xrOgkJCWFub3RoZXIgY29udHJv
bGxlciBjbG9jawo+Pj4+ICsgKiBAaW9tYWNyb19jbGs6CQlpbyBtYWNybyBjbG9jawo+Pj4+ICAg
ICAqCj4+Pj4gICAgICogQHJlZ3M6CQkJYSBjb250aWd1b3VzIGNodW5rIG9mIG1lbW9yeSBmb3Ig
RE1BIHJlZ2lzdGVyCj4+Pj4gICAgICoJCQkJd3JpdGVzLiBjb250YWlucyB0aGUgcmVnaXN0ZXIg
dmFsdWVzIHRvIGJlCj4+Pj4gQEAgLTMzOCw2ICszODQsNyBAQCBzdHJ1Y3QgbmFuZGNfcmVncyB7
Cj4+Pj4gICAgICoJCQkJaW5pdGlhbGl6ZWQgdmlhIERUIG1hdGNoIGRhdGEKPj4+PiAgICAgKgo+
Pj4+ICAgICAqIEBjb250cm9sbGVyOgkJCWJhc2UgY29udHJvbGxlciBzdHJ1Y3R1cmUKPj4+PiAr
ICogQGN0bHI6CQkJc3BpIGNvbnRyb2xsZXIgc3RydWN0dXJlCj4+Pj4gICAgICogQGhvc3RfbGlz
dDoJCQlsaXN0IGNvbnRhaW5pbmcgYWxsIHRoZSBjaGlwcyBhdHRhY2hlZCB0byB0aGUKPj4+PiAg
ICAgKgkJCQljb250cm9sbGVyCj4+Pj4gICAgICoKPj4+PiBAQCAtMzc1LDYgKzQyMiw3IEBAIHN0
cnVjdCBxY29tX25hbmRfY29udHJvbGxlciB7Cj4+Pj4gICAgPj4gICAJc3RydWN0IGNsayAqY29y
ZV9jbGs7Cj4+Pj4gICAgCXN0cnVjdCBjbGsgKmFvbl9jbGs7Cj4+Pj4gKwlzdHJ1Y3QgY2xrICpp
b21hY3JvX2NsazsKPj4+PiAgICA+PiAgIAlzdHJ1Y3QgbmFuZGNfcmVncyAqcmVnczsKPj4+PiAg
ICAJc3RydWN0IGJhbV90cmFuc2FjdGlvbiAqYmFtX3R4bjsKPj4+PiBAQCAtMzgyLDYgKzQzMCw3
IEBAIHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciB7Cj4+Pj4gICAgCWNvbnN0IHN0cnVjdCBx
Y29tX25hbmRjX3Byb3BzICpwcm9wczsKPj4+PiAgICA+PiAgIAlzdHJ1Y3QgbmFuZF9jb250cm9s
bGVyIGNvbnRyb2xsZXI7Cj4+Pj4gKwlzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIgKmN0bHI7Cj4+Pj4g
ICAgCXN0cnVjdCBsaXN0X2hlYWQgaG9zdF9saXN0Owo+Pj4+ICAgID4+ICAgCXVuaW9uIHsKPj4+
PiBAQCAtNDE4LDYgKzQ2NywyMSBAQCBzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgewo+Pj4+
ICAgID4+ICAgCXUzMiBjbWQxLCB2bGQ7Cj4+Pj4gICAgCWJvb2wgZXhlY19vcHdyaXRlOwo+Pj4+
ICsJc3RydWN0IHFwaWNfZWNjICplY2M7Cj4+Pj4gKwlzdHJ1Y3QgcWNvbV9lY2Nfc3RhdHMgZWNj
X3N0YXRzOwo+Pj4+ICsJc3RydWN0IG5hbmRfZWNjX2VuZ2luZSBlY2NfZW5nOwo+Pj4+ICsJdTgg
KmRhdGFfYnVmOwo+Pj4+ICsJdTggKm9vYl9idWY7Cj4+Pj4gKwl1MzIgd2xlbjsKPj4+PiArCXUz
MiBhZGRyMTsKPj4+PiArCXUzMiBhZGRyMjsKPj4+PiArCXUzMiBjbWQ7Cj4+Pj4gKwl1MzIgbnVt
X2N3Owo+Pj4+ICsJdTMyIHBhZ2VzaXplOwo+Pj4+ICsJYm9vbCBvb2Jfcnc7Cj4+Pj4gKwlib29s
IHBhZ2Vfcnc7Cj4+Pj4gKwlib29sIHJhd19ydzsKPj4+PiArCWJvb2wgcmVhZF9sYXN0X2N3Owo+
Pj4+ICAgIH07Cj4+Pgo+Pj4gSWYgYWxsIHRoZXNlIGRlZmluaXRpb25zIGFyZSBvbmx5IHVzZWQg
YnkgdGhlIHNwaSBjb250cm9sbGVyLCBJIGRvbid0Cj4+PiBzZWUgd2h5IHlvdSB3YW50IHRvIHB1
dCB0aGVtIGluIHRoZSBjb21tb24gZmlsZS4KPj4gICAgV2UgYXJlIHVzaW5nIHFjb21fbmFuZF9j
b250cm9sbGVyey4ufSBzdHJ1Y3R1cmUgYXMgY29tbW9uIGIvdyByYXcgbmFuZAo+PiAgICBhbmQg
c3BpIG5hbmQuIFRoZXNlIGFsbCB2YXJpYWJsZXMgd2lsbCBiZSB1c2VkIGJ5IHNwaSBuYW5kIG9u
bHkgLCBidXQKPj4gICAgcWNvbV9uYW5kX2NvbnRyb2xsZXIgc3RydWN0dXJlIGlzIHBhc3NlZCBh
Y3Jvc3MgYWxsIHRoZSBTUEkgQVBJLCB0aGF0cwo+PiAgICB3aHkgZGVmaW5lIHRoZXNlIGFsbCB2
YXJpYWJsZXMgaW5zaWRlIHFjb21fbmFuZF9jb250cm9sbGVyIHN0cnVjdHVyZS4KPj4gICAgc28g
dGhhdCBpIGNhbiBhY2Nlc3MgZGlyZWN0bHR5Lgo+IAo+IE1heWJlIHlvdSBjYW4gbW92ZSB0aGUg
c3BpLW5hbmQgc3BlY2lmaWMgdmFyaWFibGVzIGluIGEgc3RydWN0LCBhbmQgdGhlCj4gcmF3IE5B
TkQgc3BlY2lmaWMgdmFyaWFibGVzIGluIGFub3RoZXIsIGFuZCB0aGVuIHVzZSBhbiBlbnVtIGlu
IHRoaXMKPiBzdHJ1Y3R1cmUuIFRoaXMgd2F5IG9ubHkgdGhlIHVzZWZ1bCBmaWVsZHMgYXJlIGF2
YWlsYWJsZS4gT3IgbWF5YmUgeW91Cj4gY2FuIGhhdmUgdHdvIHBvaW50ZXJzIGFuZCBvbmx5IHBv
cHVsYXRlIHRoZSByZWxldmFudCBvbmUgZnJvbSB0aGUKPiByZWxldmFudCBkcml2ZXIgd2l0aCB0
aGUgZmllbGRzIHRoYXQgYXJlIG1pc3NpbmcuIEJ1dCB0aGlzIGlzIGEgZ2VuZXJpYwo+IGluY2x1
ZGUsIHNvIGRvbid0IHB1dCBzcGVjaWZpYyBmaWVsZHMgdGhlcmUganVzdCBiZWNhdXNlIGl0IGlz
Cj4gY29udmVuaWVudC4KT2sgLCB3aWxsIGRvIGluIG5leHQgcGF0Y2guCj4gCj4gVGhhbmtzLAo+
IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
