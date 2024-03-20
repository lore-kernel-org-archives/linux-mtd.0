Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E0C54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaL8J95XWpKNn+a5E7O+GYKqaeiU2RDhN0sUi+ZevaA=; b=iNlIdtKn1LpnKN
	gpOVK9MbPDDZtTDpXMTJ2sNLkdKSIy1sWtEZeOP2b/Sz8L8MTGTautl8wU6OXpLjnZrlcAiXHElrM
	K8oQ0y+vf7eBeuBepqe3fIWVUDl93GDUZdzIAJNBHSQktoOedCzpwIUIn7+W7KPWYny7+NfGld1tY
	epT+y8kXO1H/c8KVhuChALdRfZ6G4mFvXP42ZUyFdFaiN6fzneVAN9Y4MXYnnFWscDOthgdeiHQeK
	ATmfctpU+XusKRUsG+f+CMPuEOINJqZOqGLXYP5FofR0E/h4+t26oHkj39eiEwC5In/sHpZeUeIlp
	Wqp0Lnh8w5E4l/ELBGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpXD-0000000FiAD-24Q2;
	Wed, 20 Mar 2024 06:34:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpX9-0000000Fi8s-33xT
	for linux-mtd@lists.infradead.org;
	Wed, 20 Mar 2024 06:34:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K4I9FJ016465;
	Wed, 20 Mar 2024 06:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gibPDNh+ncfO0OJ7NGZdgTNIfnqZd+drxwtVVYsvV6U=; b=ms
	CSRmCfIwhfqYtxU0xAP81OGWZMJZnq8e5z6Bhs7NtRKxffj1+dTNJXB9AEdmHrj6
	y+OUzT9rt5OMHGYBbmdtOnauqmBlHB8hhFEqBZT76cLB+wh044MAy7pcsg1hnPhp
	sXb08c3N8CQaBXvXXzwjTarWaL+Odaq6miQxBrVHhX6LVylPxL9mY6Hh5uZ3Ksmx
	8BET4BBYa0yWBGh05OqT/gxOiBDpOBhtf9DdxN6Geh2/FrAAB/kQ+F6HIiwhWIoX
	4qrPdUyWPodqLpuzOdrZa1xDApABhOZNlqOH90fNoIQfAyfU0wpeFoymcFUYZJfR
	YGx7+cRSpTWcziI5iawQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wygbbh4y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 06:34:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42K6YPso019848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 06:34:25 GMT
Received: from [10.216.16.222] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 23:34:19 -0700
Message-ID: <58dfa2f5-8b49-a8a9-0857-f75f755f703c@quicinc.com>
Date: Wed, 20 Mar 2024 12:04:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 2/5] drivers: mtd: nand: Add qpic_common API file
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <neil.armstrong@linaro.org>,
        <daniel@makrotopia.org>, <arnd@arndb.de>,
        <chris.packham@alliedtelesis.co.nz>, <christophe.kerello@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
 <20240308091752.16136-3-quic_mdalam@quicinc.com>
 <20240315124517.4a546ce9@xps-13>
 <93b08226-3297-2161-cc7d-d33d839c32f0@quicinc.com>
 <20240319114316.4b977d93@xps-13>
 <756ccc79-0077-5c23-73e3-bbb82fbfa8b0@quicinc.com>
 <20240319140924.167f3063@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240319140924.167f3063@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BfPakkWhuLrOxL76Q0W3qYhEzZTAFfXw
X-Proofpoint-GUID: BfPakkWhuLrOxL76Q0W3qYhEzZTAFfXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_03,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=660 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_233443_966399_DA3AE8B0 
X-CRM114-Status: GOOD (  18.29  )
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

CgpPbiAzLzE5LzIwMjQgNjozOSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPiBx
dWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUdWUsIDE5IE1hciAyMDI0IDE3OjQ2OjA1
ICswNTMwOgo+IAo+PiBPbiAzLzE5LzIwMjQgNDoxMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToK
Pj4+IEhpLAo+Pj4gICAgCj4+Pj4+PiArLyoqCj4+Pj4+PiArICogcWNvbV9vZmZzZXRfdG9fbmFu
ZGNfcmVnKCkgLSBHZXQgdGhlIGFjdHVhbCBvZmZzZXQKPj4+Pj4+ICsgKiBAcmVnczogcG9pbnRl
ciB0byBuYW5kY19yZWcgc3RydWN0dXJlCj4+Pj4+PiArICogQG9mZnNldDogcmVnaXN0ZXIgb2Zm
c2V0Cj4+Pj4+PiArICoKPj4+Pj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgcmV1cm4gdGhlIGFj
dHVhbCBvZmZzZXQgZm9yIHFwaWMgY29udHJvbGxlciByZWdpc3Rlcgo+Pj4+Pj4gKyAqLwo+Pj4+
Pj4gK19fbGUzMiAqcWNvbV9vZmZzZXRfdG9fbmFuZGNfcmVnKHN0cnVjdCBuYW5kY19yZWdzICpy
ZWdzLCBpbnQgb2Zmc2V0KQo+Pj4+Pj4gK3sKPj4+Pj4+ICsJc3dpdGNoIChvZmZzZXQpIHsKPj4+
Pj4+ICsJY2FzZSBOQU5EX0ZMQVNIX0NNRDoKPj4+Pj4+ICsJCXJldHVybiAmcmVncy0+Y21kOwo+
Pj4+Pj4gKwljYXNlIE5BTkRfQUREUjA6Cj4+Pj4+PiArCQlyZXR1cm4gJnJlZ3MtPmFkZHIwOwo+
Pj4+Pj4gKwljYXNlIE5BTkRfQUREUjE6Cj4+Pj4+PiArCQlyZXR1cm4gJnJlZ3MtPmFkZHIxOwo+
Pj4+Pj4gKwljYXNlIE5BTkRfRkxBU0hfQ0hJUF9TRUxFQ1Q6Cj4+Pj4+PiArCQlyZXR1cm4gJnJl
Z3MtPmNoaXBfc2VsOwo+Pj4+Pj4gKwljYXNlIE5BTkRfRVhFQ19DTUQ6Cj4+Pj4+PiArCQlyZXR1
cm4gJnJlZ3MtPmV4ZWM7Cj4+Pj4+PiArCWNhc2UgTkFORF9GTEFTSF9TVEFUVVM6Cj4+Pj4+PiAr
CQlyZXR1cm4gJnJlZ3MtPmNscmZsYXNoc3RhdHVzOwo+Pj4+Pj4gKwljYXNlIE5BTkRfREVWMF9D
RkcwOgo+Pj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5jZmcwOwo+Pj4+Pj4gKwljYXNlIE5BTkRfREVW
MF9DRkcxOgo+Pj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5jZmcxOwo+Pj4+Pj4gKwljYXNlIE5BTkRf
REVWMF9FQ0NfQ0ZHOgo+Pj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5lY2NfYmNoX2NmZzsKPj4+Pj4+
ICsJY2FzZSBOQU5EX1JFQURfU1RBVFVTOgo+Pj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5jbHJyZWFk
c3RhdHVzOwo+Pj4+Pj4gKwljYXNlIE5BTkRfREVWX0NNRDE6Cj4+Pj4+PiArCQlyZXR1cm4gJnJl
Z3MtPmNtZDE7Cj4+Pj4+PiArCWNhc2UgTkFORF9ERVZfQ01EMV9SRVNUT1JFOgo+Pj4+Pj4gKwkJ
cmV0dXJuICZyZWdzLT5vcmlnX2NtZDE7Cj4+Pj4+PiArCWNhc2UgTkFORF9ERVZfQ01EX1ZMRDoK
Pj4+Pj4+ICsJCXJldHVybiAmcmVncy0+dmxkOwo+Pj4+Pj4gKwljYXNlIE5BTkRfREVWX0NNRF9W
TERfUkVTVE9SRToKPj4+Pj4+ICsJCXJldHVybiAmcmVncy0+b3JpZ192bGQ7Cj4+Pj4+PiArCWNh
c2UgTkFORF9FQkkyX0VDQ19CVUZfQ0ZHOgo+Pj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5lY2NfYnVm
X2NmZzsKPj4+Pj4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fMDoKPj4+Pj4+ICsJCXJldHVy
biAmcmVncy0+cmVhZF9sb2NhdGlvbjA7Cj4+Pj4+PiArCWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9O
XzE6Cj4+Pj4+PiArCQlyZXR1cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb24xOwo+Pj4+Pj4gKwljYXNl
IE5BTkRfUkVBRF9MT0NBVElPTl8yOgo+Pj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5yZWFkX2xvY2F0
aW9uMjsKPj4+Pj4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fMzoKPj4+Pj4+ICsJCXJldHVy
biAmcmVncy0+cmVhZF9sb2NhdGlvbjM7Cj4+Pj4+PiArCWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9O
X0xBU1RfQ1dfMDoKPj4+Pj4+ICsJCXJldHVybiAmcmVncy0+cmVhZF9sb2NhdGlvbl9sYXN0MDsK
Pj4+Pj4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18xOgo+Pj4+Pj4gKwkJcmV0
dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uX2xhc3QxOwo+Pj4+Pj4gKwljYXNlIE5BTkRfUkVBRF9M
T0NBVElPTl9MQVNUX0NXXzI6Cj4+Pj4+PiArCQlyZXR1cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb25f
bGFzdDI7Cj4+Pj4+PiArCWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMzoKPj4+Pj4+
ICsJCXJldHVybiAmcmVncy0+cmVhZF9sb2NhdGlvbl9sYXN0MzsKPj4+Pj4KPj4+Pj4gV2h5IGRv
IHlvdSBuZWVkIHRoaXMgaW5kaXJlY3Rpb24/Cj4+Pj4KPj4+PiBUaGlzIGluZGlyZWN0aW9uIEkg
YmVsaWV2ZSBpcyBuZWVkZWQgYnkgdGhlIHdyaXRlX3JlZ19kbWEgZnVuY3Rpb24sCj4+Pj4gd2hl
cmVpbiBhIGJ1bmNoIG9mIHJlZ2lzdGVycyBhcmUgbW9kaWZpZWQgYmFzZWQgb24gYSBzdGFydGlu
ZyByZWdpc3Rlci4KPj4+PiBDYW4gSSBjaGFuZ2UgdGhpcyBpbiBhIHNlcGFyYXRlIGNsZWFudXAg
c2VyaWVzIGFzIGEgZm9sbG93IHVwIHRvIHRoaXM/Cj4+Pgo+Pj4gSSB0aGluayBpdCB3b3VsZCBi
ZSBjbGVhbmVyIHRvIG1ha2UgdGhlIGNoYW5nZXMgSSByZXF1ZXN0ZWQgZmlyc3QgYW5kCj4+PiB0
aGVuIG1ha2UgYSBjb3B5LiBJIHVuZGVyc3RhbmQgaXQgaXMgbW9yZSB3b3JrIG9uIHlvdXIgc2lk
ZSwgc28gaWYgeW91Cj4+PiByZWFsbHkgcHJlZmVyIHlvdSBjYW4gKDEpIG1ha2UgdGhlIGNvcHkg
YW5kIHRoZW4gKDIpIGNsZWFuIGl0IGFsbC4gQnV0Cj4+PiBwbGVhc2UgZG8gaXQgYWxsIGluIHRo
aXMgc2VyaWVzLgo+PiBPawo+Pj4gICAgCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oIGIvaW5jbHVkZS9saW51eC9tdGQvbmFuZC1xcGljLWNv
bW1vbi5oCj4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+Pj4gaW5kZXggMDAwMDAwMDAw
MDAwLi5hY2VkMTU4NjY2MjcKPj4+Pj4+IC0tLSAvZGV2L251bGwKPj4+Pj4+ICsrKyBiL2luY2x1
ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaAo+Pj4+Pj4gQEAgLTAsMCArMSw0ODYgQEAK
Pj4+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+Pj4+Pj4gKy8q
Cj4+Pj4+PiArICogUUNPTSBRUElDIGNvbW1vbiBBUElzIGhlYWRlciBmaWxlCj4+Pj4+PiArICoK
Pj4+Pj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjMgUXVhbGNvbW0gSW5jLgo+Pj4+Pj4gKyAqIEF1
dGhvcnM6ICAgICBNZCBzYWRyZSBBbGFtICAgICAgICAgICA8cXVpY19tZGFsYW1AcXVpY2luYy5j
b20+Cj4+Pj4+PiArICoJCVNyaWNoYXJhbiBSICAgICAgICAgICAgIDxxdWljX3NyaWNoYXJhQHF1
aWNpbmMuY29tPgo+Pj4+Pj4gKyAqCQlWYXJhZGFyYWphbiBOYXJheWFuYW4gICA8cXVpY192YXJh
ZGFAcXVpY2luYy5jb20+Cj4+Pj4+PiArICoKPj4+Pj4+ICsgKi8KPj4+Pj4+ICsjaWZuZGVmIF9f
TVREX05BTkRfUVBJQ19DT01NT05fSF9fCj4+Pj4+PiArI2RlZmluZSBfX01URF9OQU5EX1FQSUNf
Q09NTU9OX0hfXwo+Pj4+Pj4gKwo+Pj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KPj4+
Pj4+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5
Lmg+Cj4+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtYWVuZ2luZS5oPgo+Pj4+Pj4gKyNpbmNsdWRl
IDxsaW51eC9kbWEtbWFwcGluZy5oPgo+Pj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9kbWEvcWNvbV9h
ZG0uaD4KPj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvZG1hL3Fjb21fYmFtX2RtYS5oPgo+Pj4+Pj4g
KyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL3Bh
cnRpdGlvbnMuaD4KPj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL3Jhd25hbmQuaD4KPj4+Pj4K
Pj4+Pj4gWW91IHJlYWxseSBuZWVkIHRoaXM/Cj4+Pj4gWWVzICwgc2luY2Ugc29tZSBnZW5lcmlj
IHN0cnVjdHVyZSB1c2VkIGhlcmUuCj4+Pgo+Pj4gV2hpY2ggb25lcz8gSWYgdGhpcyBpcyBhIGNv
bW1vbiBmaWxlLCB5b3UgcHJvYmFibHkgc2hvdWxkIG5vdC4KPj4gICAgU2luY2Ugd2UgYXJlIHVz
aW5nIHRoaXMgc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyIHsgfQo+PiAgICBmb3IgYm90aCBT
UEkgbmFuZCBhcyB3ZWxsIGFzIHJhdyBuYW5kLiBJbiB0aGlzIHdlIGFyZSBoYXZpbmcgdGhpcwo+
PiAgICBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyIGNvbnRyb2xsZXIgbWVtYmVyLgo+IAo+IE1heWJl
IHdlIHNob3VsZCBub3QgZXhwb3NlIHFjb21fbmFuZF9jb250cm9sbGVyIGF0IGFsbCBhbmQganVz
dCBzaGFyZQo+IHRoZSBtaW5pbXVtIGJpdHMgd2hpY2ggYXJlIHJlYWxseSBjb21tb24uCgogIFdp
bGwgbW92ZSBhbGwgdGhlIGhlYWRlciBmaWxlcyB0byAuYyBmaWxlIGZyb20gbmFuZC1xcGljLWNv
bW1vbi5oCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MsCkFsYW0uCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
