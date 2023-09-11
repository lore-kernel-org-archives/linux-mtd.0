Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A48EE57DF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9rrP0aJM8keuLZfnFfy2kfPXcf0xB6OOAn29YldZYk=; b=Ss/wJh2ozeNYXG
	e6mvEOtQt/YA9S0X+XrEFm27s3vgkyl6IzTzFiWvahvn3W9j+JbTenY2unTi45tuQipnMdKXdctNl
	io5c3OCFPTUPHJwtXNhsKqoh7GiFcrTJ5fpiwLv55cOlWZxzltki7axm8b8+A0exAFSOE1oyd0AZr
	Ts21D1butL3QZYeFoVQaJJyObB2ZdnpGCsnZa11TwHNSPcWlgRFezeE6eaZbejahcByI5ibpDIG9+
	AX4MG1HVhelyfz9+w6RX4a7sG+5n5tIclINGdxe8FjZyOYGBxFrNnNPx+lXvmZypi0WwRJTMbZrRc
	PJJfMTNBWgbqNOaXjUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfn5O-001FD3-01;
	Mon, 11 Sep 2023 20:00:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfn5I-001FCf-2w
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 20:00:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BFfRmm026688;
	Mon, 11 Sep 2023 20:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=H5CM1cE9Y6HDbTdAD+oPNCwMtvDm0Oj8TKJeMdK5O9M=;
 b=avwUnqmXR+iLqjn4y1G3qvPqUthwBTWsHZur/8UClZ5dKwIEHy60o7tHkz3g3DqUbp5F
 4HNTElcjTpt42zExF5gB9Ikz/Oc0unrI+Q0Nv3lwDC3mXLzApIsPU0vFO2ZyL6/rNF/W
 81Z7aE2kwY2XXTnvHQg/x0GzVvFRlZ+qdSQ/xB/hvp4w3N/Vvm3QMvv0cJOT1ZMjhQSZ
 7sQIhDAdeQZT5PwV/GBPLYVbHz4Wl3T7ogQ5rJnhI1TIwrn7zIvbeNvLVjW32GuqGov+
 TT7yNPSzFY9nC62vGCZ+jQIlGKKYanpFTE9mzR2ZUA95edLN3bFUOm8Prk0b0Jy+c1TU Zg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t24ra8v7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 20:00:27 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BK0RSl003781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 20:00:27 GMT
Received: from [10.216.42.58] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 11 Sep
 2023 13:00:21 -0700
Message-ID: <f3d77752-f5f0-4896-b209-8e02f501a5b1@quicinc.com>
Date: Tue, 12 Sep 2023 01:30:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: nand: qcom: Fix the node for nand unmap resource
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charnte@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_pkondeti@quicinc.com>
References: <20230911133026.29868-1-quic_bibekkum@quicinc.com>
 <20230911174039.63f6e835@xps-13>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20230911174039.63f6e835@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rtaDGYBllpCMOaBMGjQviBVwBhMT-MmM
X-Proofpoint-ORIG-GUID: rtaDGYBllpCMOaBMGjQviBVwBhMT-MmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_16,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_130036_961875_E3052FF8 
X-CRM114-Status: GOOD (  20.51  )
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

CgpPbiA5LzExLzIwMjMgOToxMCBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBCaWJlaywK
PiAKPiBxdWljX2JpYmVra3VtQHF1aWNpbmMuY29tIHdyb3RlIG9uIE1vbiwgMTEgU2VwIDIwMjMg
MTk6MDA6MjYgKzA1MzA6Cj4gCj4gVGhlIHRpdGxlIHByZWZpeCBzaG91bGQgYmUgcy9uYW5kL3Jh
d25hbmQuCj4gCj4gVGhlIHRpdGxlIGl0c2VsZiBpcyB1bmNsZWFyICJmaXggdGhlIG5vZGUiIGRv
ZXMgbm90IG1lYW4gYW55dGhpbmcgdG8gbWUuCj4gCgpzdXJlIE1pcXVlbCwgd2lsbCByZWN0aWZ5
IHRoZSBwcmVmaXggYW5kIGdpdmUgYSBtZWFuaW5nZnVsIHRpdGxlIGluIHRoZQpuZXh0IHBhdGNo
LgoKPj4gRml4IGFkZHIgYXJndW1lbnQgdG8gZG1hX3VubWFwX3Jlc291cmNlKCkgaW4gdGhlIGVy
cm9yIHBhdGggb2YgcHJvYmUuCj4gCj4gICAgICAgIF4KPiBObyBhYmJyZXZpYXRpb24gdW5sZXNz
IHlvdSBhcmUgcXVvdGluZyB0aGUgY29kZSBkaXJlY3RseS4KPiAKPiAgICAgICAgICAgICAgICAg
ICAgICBvZj8gICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvYmUgZXJyb3IgcGF0aAo+IAo+
PiBUaGUgYWRkciBhcmd1bWVudCBzaG91bGQgYmUgZG1hIGFkZHJlc3MgaW5zdGVhZCBvZiBwaHlz
aWNhbCBhZGRyZXNzLgo+ICAgICAgICBeICAgICAgICAgICAgICAgICAgICAgIF4gICAgICAgICAg
ICAgICAgICAgICAgXgo+ICAgICAgICBkaXR0byAgICAgICAgICAgICAgICAgIHRoZT8gICAgICAg
ICAgICAgICAgICAgdGhlPwo+IAoKVGhhbmtzIGZvciB0aGVzZSBwb2ludGVycywgd2lsbCByZXZp
c2UgdGhlIGNvbW1pdCBtZXNzYWdlIHJlbW92aW5nCmFiYnJldmlhdGlvbnMgYW5kIG1ha2luZyBv
dGhlciBjaGFuZ2VzIGFzIHN1Z2dlc3RlZC4KClRoYW5rcywKQmliZWsKCj4+Cj4+IEZpeGVzOiA3
MzMwZmM1MDVhZjQgKCJtdGQ6IHJhd25hbmQ6IHFjb206IHN0b3AgdXNpbmcgcGh5c190b19kbWEo
KSIpCj4+IFNpZ25lZC1vZmYtYnk6IEJpYmVrIEt1bWFyIFBhdHJvIDxxdWljX2JpYmVra3VtQHF1
aWNpbmMuY29tPgo+PiAtLS0KPj4gdjI6IEluY29ycG9yYXRlZCBjb21tZW50cyBmcm9tIFBhdmFu
L01hbmkuCj4+Cj4+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA5MDcwOTI4
NTQuMTE0MDgtMS1xdWljX2JpYmVra3VtQHF1aWNpbmMuY29tLwo+Pgo+PiAgIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+
PiBpbmRleCA2NDQ5OWMxYjM2MDMuLmIwNzk2MDVjODRkMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3Fjb21fbmFuZGMuYwo+PiBAQCAtMzQ0NCw3ICszNDQ0LDcgQEAgc3RhdGljIGludCBxY29tX25h
bmRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgZXJyX2Fvbl9jbGs6
Cj4+ICAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShuYW5kYy0+Y29yZV9jbGspOwo+PiAgIGVycl9j
b3JlX2NsazoKPj4gLQlkbWFfdW5tYXBfcmVzb3VyY2UoZGV2LCByZXMtPnN0YXJ0LCByZXNvdXJj
ZV9zaXplKHJlcyksCj4+ICsJZG1hX3VubWFwX3Jlc291cmNlKGRldiwgbmFuZGMtPmJhc2VfZG1h
LCByZXNvdXJjZV9zaXplKHJlcyksCj4+ICAgCQkJICAgRE1BX0JJRElSRUNUSU9OQUwsIDApOwo+
PiAgIAlyZXR1cm4gcmV0Owo+PiAgIH0KPj4gLS0KPj4gMi4xNy4xCj4+Cj4gCj4gCj4gVGhhbmtz
LAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
