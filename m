Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BDDC61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mb68+MXWWdcN20ZmOb27+MPu7zzGgpKYZ6cJNKPJ39M=; b=4365BghhK7P3o/
	OpVZ77fXKflPmHVNL0D6P/G1Z/Y8QZVWezNnegoKYwjMbsxQfmuvIbtxpDoWl6WyB+60WGD+rhHHm
	9AbL2WrZNVlfuOyqUB1djdUE/syqDwOqbuf4N6H2LoaIFrmOIGj+03dD8JSR9hCkd06x4gDU8f2ze
	qdwDT3kLQKQEIavVuX1B+noerrmGE+w/ZIXvd1eAcOv4MJQUlpNsnjoawVHGP92IJkYp4GNimlRLo
	HFDbojXB3Jxqu6GWbA0q8PfWWsRQ3RnL5xclUBcRI+sb7q8zM9rVc8W7yMk9fkeZDkQUCnTZkADUj
	oiURbff6DBnpI4jNMGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCAk-00DQgX-7t; Mon, 06 Mar 2023 14:50:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBub-00DIdx-O9
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 14:34:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326Di5W5007503;
	Mon, 6 Mar 2023 14:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CoparZnNpF8ldgrpBfRtdxPsE4hFBtRG0ld7fcT6gC8=;
 b=XqgQ+EEhYXLBzaZp9WwRettk7Dseq6n0tLTnoSfxIAPIu5WFCX0OUJF9la/Bb0nSivQ+
 ByuZKgXcbpEzUGlyd+/Nx11V0mofc2KzDvn+Bcn36pQZwhRoikLcB6V6clOYr2m5+C4n
 GfiIeIUObZuSj4B3pKoHwMvGMQXiDVrHcqPe22dvhtWklKGtQJ44KaUahN8rRMH/VHu9
 +QWFreeqYpfino0nNIE3CuiXAj1BWvRB0lBpzgwixSstWEQ1tCXfk9DBlQshaPX0eSRD
 xa+l65em+DCYVQkILnadYQ5mvhfzdwpUj/IPpv1CI9qi3ZzzfHwAznB2n3qVqxwf5+Hm /w== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p418750tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 14:33:49 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326EXmHG010409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Mar 2023 14:33:48 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 6 Mar 2023
 06:33:44 -0800
Message-ID: <6d5ea6d8-d8c6-0875-f0b3-2fcaac64899d@quicinc.com>
Date: Mon, 6 Mar 2023 20:03:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi nand
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <robh+dt@kernel.org>, <vigneshr@ti.com>, <richard@nod.at>,
        <miquel.raynal@bootlin.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <quic_srichara@quicinc.com>,
        <qpic_varada@quicinc.com>, <quic_sjaganat@quicinc.com>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
 <20201029100751.713e27df@collabora.com>
 <b70ddb40-a1f1-f967-6b7b-057a39b0bcc2@quicinc.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <b70ddb40-a1f1-f967-6b7b-057a39b0bcc2@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2jpZ0Qo5wMLVWlkDhIdaNydO2Jvw1oGR
X-Proofpoint-ORIG-GUID: 2jpZ0Qo5wMLVWlkDhIdaNydO2Jvw1oGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_063401_855663_1366BD8F 
X-CRM114-Status: GOOD (  21.90  )
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

Ck9uIDMvNi8yMDIzIDc6NDUgUE0sIE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4KPiBPbiAxMC8yOS8y
MDIwIDI6MzcgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IE9uIFNh
dCwgMTAgT2N0IDIwMjAgMTE6MDE6MzkgKzA1MzAKPj4gTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKPj4KPj4+IFRoaXMgY2hhbmdlIHdpbGwgYWRkIGluaXRpYWwg
c3VwcG9ydCBmb3IgcXNwaSAoc2VyaWFsIG5hbmQpLgo+Pj4KPj4+IFFQSUMgVmVyc2lvbiB2LjIu
MCBvbndhcmRzIHN1cHBvcnRzIHNlcmlhbCBuYW5kIGFzIHdlbGwgc28gdGhpcwo+Pj4gY2hhbmdl
IHdpbGwgaW5pdGlhbGl6ZSBhbGwgcmVxdWlyZWQgcmVnaXN0ZXIgdG8gZW5hYmxlIHFzcGkgKHNl
cmlhbAo+Pj4gbmFuZCkuCj4+Pgo+Pj4gVGhpcyBjaGFuZ2UgaXMgc3VwcG9ydGluZyB2ZXJ5IGJh
c2ljIGZ1bmN0aW9uYWxpdHkgb2YgcXNwaSBuYW5kIGZsYXNoLgo+Pj4KPj4+IDEuIFJlc2V0IGRl
dmljZSAoUmVzZXQgUVNQSSBOQU5EIGRldmljZSkuCj4+Pgo+Pj4gMi4gRGV2aWNlIGRldGVjdGlv
biAoUmVhZCBpZCBRU1BJIE5BTkQgZGV2aWNlKS4KPj4gVW5mb3J0dW5hdGVseSwgdGhhdCdzIG5v
dCBnb2luZyB0byB3b3JrIGluIHRoZSBsb25nIHRlcm0uIFlvdSdyZQo+PiBiYXNpY2FsbHkgaGFj
a2luZyB0aGUgcmF3IE5BTkQgZnJhbWV3b3JrIHRvIG1ha2UgU1BJIE5BTkRzIGZpdC4gSSBkbwo+
PiB1bmRlcnN0YW5kIHRoZSByYXRpb25hbGUgYmVoaW5kIHRoaXMgZGVjaXNpb24gKHJlLXVzaW5n
IHRoZSBjb2RlIGZvcgo+PiBFQ0MgYW5kIHByb2JhYmx5IG90aGVyIHRoaW5ncyksIGJ1dCB0aGF0
J3Mgbm90IGdvaW5nIHRvIHdvcmsuIFNvIEknZAo+PiByZWNvbW1lbmQgZG9pbmcgdGhlIGZvbGxv
d2luZyBpbnN0ZWFkOgo+Pgo+PiAxLyBpbXBsZW1lbnQgYSBTUEktbWVtIGNvbnRyb2xsZXIgZHJp
dmVyCj4+IDIvIGltcGxlbWVudCBhbiBFQ0MgZW5naW5lIGRyaXZlciBzbyB0aGUgRUNDIGxvZ2lj
IGNhbiBiZSBzaGFyZWQKPj4gwqDCoMKgIGJldHdlZW4gdGhlIFNQSSBjb250cm9sbGVyIGFuZCBy
YXcgTkFORCBjb250cm9sbGVyIGRyaXZlcnMKPj4gMy8gY29udmVydCB0aGUgcmF3IE5BTkQgZHJp
dmVyIHRvIHRoZSBleGVjX29wKCkgaW50ZXJmYWNlIChub25lIG9mCj4+IMKgwqDCoCB0aGlzIGhh
Y2sgd291bGQgaGF2ZSBiZWVuIHBvc3NpYmxlIGlmIHRoZSBkcml2ZXIgd2FzIHVzaW5nIHRoZSBu
ZXcKPj4gwqDCoMKgIEFQSSkKPj4KPj4gUmVnYXJkcywKPj4KPj4gQm9yaXMKPj4KPiDCoMKgIFNv
cnJ5IGZvciBsYXRlIHJlcGx5LCBhZ2FpbiBzdGFydGVkIHdvcmtpbmcgb24gdGhpcyBmZWF0dXJl
IAo+IHN1cHBvcnQuwqAgVGhlIFFQSUMgdjIgb24gd2FyZHMgdGhlcmUgaXMgc2VyaWFsIG5hbmQg
c3VwcG9ydCBnb3QgYWRkZWQgCj4gLCBpdHMgbm90IGEgc3RhbmRhcmQgU1BJIGNvbnRyb2xsZXIK
Pgo+IMKgwqAgaXRzIFFQSUMgY29udHJvbGxlciBoYXZpbmcgc3VwcG9ydCBmb3Igc2VyaWFsIG5h
bmQuIEFsbCBTUEkgcmVsYXRlZCAKPiBjb25maWd1cmF0aW9uIGRvbmUgYnkgUVBJQyBoYXJkd2Fy
ZSBhbmQgaXRzIG5vdCBleHBvc2VkIGFzIFNQSSBidXMgdG8gCj4gdGhlIGV4dGVybmFsIHdvcmxk
LiBPbmx5IGJhc2VkIG9uCj4KPiDCoMKgIFFQSUNfU1BJX0NGRyA9IDEsIHNlcmlhbCBmdW5jdGlv
bmFsaXR5IHdpbGwgZ2V0IHNlbGVjdGVkLiBTbyB0aGF0IAo+IG5vIG5lZWQgdG8gaW1wbGVtZW50
IGFzIFNQSS1tZW0gY29udHJvbGxlciBkcml2ZXIsIHNpbmNlIGl0cyBub3QgYSBTUEkgCj4gY29u
dHJvbGxlci4KPgo+IMKgIFBsZWFzZSBjaGVjayB0aGUgYmVsb3cgZGlhZ3JhbSBmb3IgdG9wIHZp
ZXcgb2YgUVBJQyBjb250cm9sbGVyLgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgp8IFFQSUMgd3Jh
cHBlciDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgfAoKIMKgwqDCoCDC
oMKgwqAgwqDCoMKgIEFIQiBtYXN0ZXIgSUYgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgfCAKfF9fX19fX19fX19fX19fX19fX19f
X19fIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgX19fX19fX19fX19fX19fX19fX19fX19fX18gwqDC
oMKgIAogwqDCoMKgIMKgwqDCoCDCoMKgwqAgfAoKPC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gwqAgwqAgfCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgCiDCoCB8IMKgIMKgIMKgIMKgwqAgUVBJQyDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCB8IMKgwqAgwqDCoMKgIMKgwqDCoMKgIHwgwqDCoCAK
UVBJQ19JT19NQUNSTyB8IHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0+U2VyaWFsIApOQU5EIElPcwoKfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgIFFQSUNfU1BJX0NGRyA9IDHCoMKgwqDCoCAtLS0tPiB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAp8IChDb250cm9sIFNQSSBCdXMgaW50ZXJuYWxseSkg
fCAKfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT4KCnwgfMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB8IAp8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAoKfCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IHwgCnzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwKCnwgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAKfF9f
X19fX19fX19fX19fX19fX19fX19fX19ffMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwKCnwgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgIF8gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKCnwgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIApFYmkyX2V4
dF9pZsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB8Cgp8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCBRUElD
X1NQSV9DRkc9MMKgwqDCoMKgIC0tLS0tLS0+IHwgfCB8IAp8LS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT4KCnwgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgfCB8IAp8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+UGFyYWxsZWwgTkFORCBJT3MKCjwtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIMKgIHwgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgCiDCoMKgIHxfX19fX19fX19fX19fX19fX19fX19fX18gfCDCoMKgIMKgwqDC
oCDCoMKgIHwgX19fX19fX19fX19fX19fX19fX19fX19fX198IAogwqAgwqAgwqAgwqAgwqAgwqDC
oCB8CgogwqDCoMKgIMKgwqDCoCDCoCBBSEIgU2xhdiBJRiB8IHwKCnxfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX3wKCj4KPgo+Cj4gwqAgUmVnYXJkcywKPgo+IEFsYW0uCj4KPgo+PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
