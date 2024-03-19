Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E0C54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUnWikiQJPKssX5aXA6MgLk2kiwn5+iEZLHEXX3gVsU=; b=Iwwbm9GpaDDvSb
	Z6jxwnoVP5dO3y17rSY+2/zfWSnbhg04asEvqP9gdAeuFff4FGDJuDR4/vM3oEXZmoPc0P1RPiAzg
	7oPtlrJ7GOCRzeDlje77P+DqSIs/8Y14FoqvY4/YtoIv8MOL0CkWCxTKC1dzwn8ecswTVwAxWzHsS
	lAfM+AWpiCe2zMQ9FkQl6M4lEOXyoD3zslgKDwC2aV8n+PaLtYX9vFHOtgujsumrHvYLzLJ90YWux
	LkUP4B2zl1UzzehNzlsaq1croz3PuHS3hdDAz8Rw70qJMRIjIMi86FkiWdtgjtUN5X611ybh1YZeU
	YUppBJqTr+9uUlmi+WVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmYOT-0000000CadC-0UD7;
	Tue, 19 Mar 2024 12:16:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmYOP-0000000Cabr-2Yjn
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 12:16:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J7JRxi014653;
	Tue, 19 Mar 2024 12:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=AIdK1UKm7uWbDB4l190w3ji61JcdvONmHoqBYWiLBHM=; b=lQ
	sj4izSKoC2Mosh/Dau3p38O9E4liRYDmx91j9dPqYfU1O/tb+5pAGLWIrW0OK41f
	chgEzYCTkMg+EfYff0oE01UWtAhasSNINPPBl9VUY+MGNPD4EOq7bKSOX9+n0cGv
	r+MhdpvsWQsb4QPVLb9AtHjGiKm4j8+GGNhm2za0z8nOuK4wJNm39LMSTZ0+7IBN
	o5VQZtxlrIjCPfYQhX367Jk8Zo3RAJ/+tl71tgeuRZOYZrnzV2EPireB2FNFtodM
	4JBjmHdg7jF/KC83P6ECyeQ9eg7TVGfR5nhTpJlpr/AQkiSLfDGA8//g745zPaWS
	BQYPHqoMSEPssJejuI4A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy1j2h7e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 12:16:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JCGF8K002516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 12:16:15 GMT
Received: from [10.216.16.222] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 05:16:08 -0700
Message-ID: <756ccc79-0077-5c23-73e3-bbb82fbfa8b0@quicinc.com>
Date: Tue, 19 Mar 2024 17:46:05 +0530
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
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240319114316.4b977d93@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EHsv-UYCpwLm-waElPxoZGnYSzU6NkYY
X-Proofpoint-ORIG-GUID: EHsv-UYCpwLm-waElPxoZGnYSzU6NkYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_02,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxlogscore=650 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_051633_740446_F6287729 
X-CRM114-Status: GOOD (  18.81  )
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

CgpPbiAzLzE5LzIwMjQgNDoxMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPj4+
PiArLyoqCj4+Pj4gKyAqIHFjb21fb2Zmc2V0X3RvX25hbmRjX3JlZygpIC0gR2V0IHRoZSBhY3R1
YWwgb2Zmc2V0Cj4+Pj4gKyAqIEByZWdzOiBwb2ludGVyIHRvIG5hbmRjX3JlZyBzdHJ1Y3R1cmUK
Pj4+PiArICogQG9mZnNldDogcmVnaXN0ZXIgb2Zmc2V0Cj4+Pj4gKyAqCj4+Pj4gKyAqIFRoaXMg
ZnVuY3Rpb24gd2lsbCByZXVybiB0aGUgYWN0dWFsIG9mZnNldCBmb3IgcXBpYyBjb250cm9sbGVy
IHJlZ2lzdGVyCj4+Pj4gKyAqLwo+Pj4+ICtfX2xlMzIgKnFjb21fb2Zmc2V0X3RvX25hbmRjX3Jl
ZyhzdHJ1Y3QgbmFuZGNfcmVncyAqcmVncywgaW50IG9mZnNldCkKPj4+PiArewo+Pj4+ICsJc3dp
dGNoIChvZmZzZXQpIHsKPj4+PiArCWNhc2UgTkFORF9GTEFTSF9DTUQ6Cj4+Pj4gKwkJcmV0dXJu
ICZyZWdzLT5jbWQ7Cj4+Pj4gKwljYXNlIE5BTkRfQUREUjA6Cj4+Pj4gKwkJcmV0dXJuICZyZWdz
LT5hZGRyMDsKPj4+PiArCWNhc2UgTkFORF9BRERSMToKPj4+PiArCQlyZXR1cm4gJnJlZ3MtPmFk
ZHIxOwo+Pj4+ICsJY2FzZSBOQU5EX0ZMQVNIX0NISVBfU0VMRUNUOgo+Pj4+ICsJCXJldHVybiAm
cmVncy0+Y2hpcF9zZWw7Cj4+Pj4gKwljYXNlIE5BTkRfRVhFQ19DTUQ6Cj4+Pj4gKwkJcmV0dXJu
ICZyZWdzLT5leGVjOwo+Pj4+ICsJY2FzZSBOQU5EX0ZMQVNIX1NUQVRVUzoKPj4+PiArCQlyZXR1
cm4gJnJlZ3MtPmNscmZsYXNoc3RhdHVzOwo+Pj4+ICsJY2FzZSBOQU5EX0RFVjBfQ0ZHMDoKPj4+
PiArCQlyZXR1cm4gJnJlZ3MtPmNmZzA7Cj4+Pj4gKwljYXNlIE5BTkRfREVWMF9DRkcxOgo+Pj4+
ICsJCXJldHVybiAmcmVncy0+Y2ZnMTsKPj4+PiArCWNhc2UgTkFORF9ERVYwX0VDQ19DRkc6Cj4+
Pj4gKwkJcmV0dXJuICZyZWdzLT5lY2NfYmNoX2NmZzsKPj4+PiArCWNhc2UgTkFORF9SRUFEX1NU
QVRVUzoKPj4+PiArCQlyZXR1cm4gJnJlZ3MtPmNscnJlYWRzdGF0dXM7Cj4+Pj4gKwljYXNlIE5B
TkRfREVWX0NNRDE6Cj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5jbWQxOwo+Pj4+ICsJY2FzZSBOQU5E
X0RFVl9DTUQxX1JFU1RPUkU6Cj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5vcmlnX2NtZDE7Cj4+Pj4g
KwljYXNlIE5BTkRfREVWX0NNRF9WTEQ6Cj4+Pj4gKwkJcmV0dXJuICZyZWdzLT52bGQ7Cj4+Pj4g
KwljYXNlIE5BTkRfREVWX0NNRF9WTERfUkVTVE9SRToKPj4+PiArCQlyZXR1cm4gJnJlZ3MtPm9y
aWdfdmxkOwo+Pj4+ICsJY2FzZSBOQU5EX0VCSTJfRUNDX0JVRl9DRkc6Cj4+Pj4gKwkJcmV0dXJu
ICZyZWdzLT5lY2NfYnVmX2NmZzsKPj4+PiArCWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9OXzA6Cj4+
Pj4gKwkJcmV0dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uMDsKPj4+PiArCWNhc2UgTkFORF9SRUFE
X0xPQ0FUSU9OXzE6Cj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uMTsKPj4+PiAr
CWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9OXzI6Cj4+Pj4gKwkJcmV0dXJuICZyZWdzLT5yZWFkX2xv
Y2F0aW9uMjsKPj4+PiArCWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9OXzM6Cj4+Pj4gKwkJcmV0dXJu
ICZyZWdzLT5yZWFkX2xvY2F0aW9uMzsKPj4+PiArCWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9OX0xB
U1RfQ1dfMDoKPj4+PiArCQlyZXR1cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb25fbGFzdDA7Cj4+Pj4g
KwljYXNlIE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzE6Cj4+Pj4gKwkJcmV0dXJuICZyZWdz
LT5yZWFkX2xvY2F0aW9uX2xhc3QxOwo+Pj4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fTEFT
VF9DV18yOgo+Pj4+ICsJCXJldHVybiAmcmVncy0+cmVhZF9sb2NhdGlvbl9sYXN0MjsKPj4+PiAr
CWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMzoKPj4+PiArCQlyZXR1cm4gJnJlZ3Mt
PnJlYWRfbG9jYXRpb25fbGFzdDM7Cj4+Pgo+Pj4gV2h5IGRvIHlvdSBuZWVkIHRoaXMgaW5kaXJl
Y3Rpb24/Cj4+Cj4+IFRoaXMgaW5kaXJlY3Rpb24gSSBiZWxpZXZlIGlzIG5lZWRlZCBieSB0aGUg
d3JpdGVfcmVnX2RtYSBmdW5jdGlvbiwKPj4gd2hlcmVpbiBhIGJ1bmNoIG9mIHJlZ2lzdGVycyBh
cmUgbW9kaWZpZWQgYmFzZWQgb24gYSBzdGFydGluZyByZWdpc3Rlci4KPj4gQ2FuIEkgY2hhbmdl
IHRoaXMgaW4gYSBzZXBhcmF0ZSBjbGVhbnVwIHNlcmllcyBhcyBhIGZvbGxvdyB1cCB0byB0aGlz
Pwo+IAo+IEkgdGhpbmsgaXQgd291bGQgYmUgY2xlYW5lciB0byBtYWtlIHRoZSBjaGFuZ2VzIEkg
cmVxdWVzdGVkIGZpcnN0IGFuZAo+IHRoZW4gbWFrZSBhIGNvcHkuIEkgdW5kZXJzdGFuZCBpdCBp
cyBtb3JlIHdvcmsgb24geW91ciBzaWRlLCBzbyBpZiB5b3UKPiByZWFsbHkgcHJlZmVyIHlvdSBj
YW4gKDEpIG1ha2UgdGhlIGNvcHkgYW5kIHRoZW4gKDIpIGNsZWFuIGl0IGFsbC4gQnV0Cj4gcGxl
YXNlIGRvIGl0IGFsbCBpbiB0aGlzIHNlcmllcy4KT2sKPiAKPj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oIGIvaW5jbHVkZS9saW51eC9tdGQvbmFu
ZC1xcGljLWNvbW1vbi5oCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLmFjZWQxNTg2NjYyNwo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9pbmNs
dWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9uLmgKPj4+PiBAQCAtMCwwICsxLDQ4NiBAQAo+
Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+Pj4+ICsvKgo+Pj4+
ICsgKiBRQ09NIFFQSUMgY29tbW9uIEFQSXMgaGVhZGVyIGZpbGUKPj4+PiArICoKPj4+PiArICog
Q29weXJpZ2h0IChjKSAyMDIzIFF1YWxjb21tIEluYy4KPj4+PiArICogQXV0aG9yczogICAgIE1k
IHNhZHJlIEFsYW0gICAgICAgICAgIDxxdWljX21kYWxhbUBxdWljaW5jLmNvbT4KPj4+PiArICoJ
CVNyaWNoYXJhbiBSICAgICAgICAgICAgIDxxdWljX3NyaWNoYXJhQHF1aWNpbmMuY29tPgo+Pj4+
ICsgKgkJVmFyYWRhcmFqYW4gTmFyYXlhbmFuICAgPHF1aWNfdmFyYWRhQHF1aWNpbmMuY29tPgo+
Pj4+ICsgKgo+Pj4+ICsgKi8KPj4+PiArI2lmbmRlZiBfX01URF9OQU5EX1FQSUNfQ09NTU9OX0hf
Xwo+Pj4+ICsjZGVmaW5lIF9fTVREX05BTkRfUVBJQ19DT01NT05fSF9fCj4+Pj4gKwo+Pj4+ICsj
aW5jbHVkZSA8bGludXgvYml0b3BzLmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPj4+
PiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9kbWFlbmdp
bmUuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4+Pj4gKyNpbmNsdWRl
IDxsaW51eC9kbWEvcWNvbV9hZG0uaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS9xY29tX2Jh
bV9kbWEuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+Pj4+ICsjaW5jbHVkZSA8
bGludXgvbXRkL3BhcnRpdGlvbnMuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L210ZC9yYXduYW5k
Lmg+Cj4+Pgo+Pj4gWW91IHJlYWxseSBuZWVkIHRoaXM/Cj4+IFllcyAsIHNpbmNlIHNvbWUgZ2Vu
ZXJpYyBzdHJ1Y3R1cmUgdXNlZCBoZXJlLgo+IAo+IFdoaWNoIG9uZXM/IElmIHRoaXMgaXMgYSBj
b21tb24gZmlsZSwgeW91IHByb2JhYmx5IHNob3VsZCBub3QuCiAgU2luY2Ugd2UgYXJlIHVzaW5n
IHRoaXMgc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyIHsgfQogIGZvciBib3RoIFNQSSBuYW5k
IGFzIHdlbGwgYXMgcmF3IG5hbmQuIEluIHRoaXMgd2UgYXJlIGhhdmluZyB0aGlzCiAgc3RydWN0
IG5hbmRfY29udHJvbGxlciBjb250cm9sbGVyIG1lbWJlci4KPiAKPiBUaGFua3MsCj4gTWlxdcOo
bAoKVGhhbmtzLApBbGFtLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
