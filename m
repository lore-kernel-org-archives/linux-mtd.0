Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED48EE49A8
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 05:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzm7NFFseQhXxhvGa4CrlJ1cXB5GaKb2zT5OFbIdLcA=; b=zyUKGKAiJl70Av
	PeB7PtTgAcvP67faZTnh1NHIkysI+w8LWtRzT68y8TxhDa1pJiv6Bne9JSxEDzFlD5F52XiE9clYH
	iGnOErcNc4FZoS64eByWuoNefbTXms5wJFJ6SQTM59Yr/b45LcrCkNBWyt59I4jD4PHlvCVWize0N
	Sm8sKIOfMSZPPf4dIlZ/u9tT0mP3L9vRYpoeV7da9ZVnZyn5uYlApxzWA0mZlFzsv/adaQp/rxI54
	IkQEeC9zXOxl2xZG2ctunqGv2rbe2QuruIu5ig8cK4TyP8pl2lOz/HLLDvg7OFrwqd1DmZ21UwmRt
	BeacYsw4L+8wWSUDr6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXxVN-00DAKx-0z;
	Mon, 21 Aug 2023 05:31:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXxVH-00DAGs-0U
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 05:31:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37L54abN025014;
	Mon, 21 Aug 2023 05:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=c8uUEEZWKdhdjMO4DdNXq1RHRVYBuI0mJCa8u5UnvD0=;
 b=nXIV8CmzyHyecUi3DLWXPyDfB23Dj/xN9tf/48gvlOfVv489UPpOvEAOOd/w1bl8RoCv
 A1vlYRy5lZGZ4YfuD4NxPpSjUhC6fwpYqKsFugWasbzXwAJnR4d90grvsrXl4qE7t5mn
 eAjszgKrg846IFsAdrGQMGtkqgCJha65HNAJkHdRl4PVcKIdMhyUCShvWBma+AtMGDU4
 8rFTxvTMcmhX0mjLH4WAlyNu9n/4P8NIjIsqLUQRqh0kcs7p3I5DL1rT6/bwy+wira9h
 eHySLtYaWeYLB/5TRmmjvqdWJpGzgHb8SDxIurrfvYZIHsf/w1vwFMrmmvIFEcYAYk0d tg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sjmpxk0d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 05:30:37 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37L5UavZ031646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 05:30:36 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Sun, 20 Aug
 2023 22:30:33 -0700
Message-ID: <1ee5a95c-2fe4-2163-5ff2-0c01d05c30cf@quicinc.com>
Date: Mon, 21 Aug 2023 11:00:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] mtd: rawnand: qcom: Update read_loc size to 512
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20230818145101.23825-1-quic_mdalam@quicinc.com>
 <20230818145101.23825-2-quic_mdalam@quicinc.com>
 <20230818215908.0e60b00b@xps-13>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20230818215908.0e60b00b@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nL12fBierDu-ThJenNzDjeTF1ZFvVonP
X-Proofpoint-ORIG-GUID: nL12fBierDu-ThJenNzDjeTF1ZFvVonP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-20_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308210051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_223103_198551_C283F958 
X-CRM114-Status: GOOD (  21.42  )
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

CgpPbiA4LzE5LzIwMjMgMToyOSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBNZCwKPiAK
PiBxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBGcmksIDE4IEF1ZyAyMDIzIDIwOjIw
OjU5ICswNTMwOgo+IAo+PiBGb3IgcGFyYW1ldGVyIHBhZ2UgcmVhZCB1cHBlciBsYXllciBpcyBw
YXNzaW5nIGxlbgo+PiBhcyAyNTYgYnl0ZXMgYW5kIGlmIHdlIHRyeSB0byBjb25maWd1cmUgMjU2
IGJ5dGVzCj4+IHNpemUgaW4gcmVhZCBsb2FjdGlvbiByZWdpc3RlciB0aGVuIHN1YnNlcXVlbnQg
YmFtCj4+IHRyYW5zYWN0aW9uIGlzIGdldHRpbmcgdGltZWQgb3V0IGZvciA0SyBuYW5kIGRldmlj
ZXMuCj4+IFNvIHVwZGF0ZSB0aGlzIGxlbmd0aCBhcyBvbmUgc3RlcCBzaXplIGlmIGl0cwo+PiBs
ZXNzIHRoYW4gTkFORENfU1RFUF9TSVpFLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTcmljaGFyYW4g
UmFtYWJhZGhyYW4gPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IE1kIFNhZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPgo+IAo+IEknbSBmaW5lIHdp
dGggcGF0Y2hlcyAyIGFuZCAzIGFuZCB3aWxsIHRha2UgdGhlbS4gQnV0IHRoaXMgb25lIGRvZXMg
bm90Cj4gc2VlbSBsZWdpdGltYXRlLiBJIGRvbid0IGxpa2UgaXQuIEFyZSB5b3Ugc3VyZSB0aGUg
RUNDIGVuZ2luZSB3YXMgbm90Cj4gZW5hYmxlZCB3aGVuIGl0IHRpbWVkIG91dD8gRGVmYXVsdCBz
aG91bGQgYmUgaGF2aW5nIHRoZSBFQ0MgZGlzYWJsZWQKPiBhbmQgaXQgc2hvdWxkIGp1c3QgZ2V0
IGVuYWJsZWQgd2hlbiB5b3UgbmVlZCBpdC4gVGhlcmUgaXMgbm8gcmVhc29uCj4gd2h5LCBzcGVj
aWZpY2FsbHkgb24gTkFORCBkZXZpY2VzLCBpdCB3b3VsZCBub3QgYmUgcG9zc2libGUgdG8gcmVh
ZCAyNTYKPiBieXRlcy4KPiAKCiAgICBZZXMgZGVmYXVsdCBFQ0MgZW5naW5lIGlzIGRpc2FibGVk
IG9ubHkuIFdoZW4gbGVuZ3RoIHdhcyA1MTIgYnl0ZXMgZm9yCiAgICBwYXJhbWV0ZXIgcGFnZSBy
ZWFkIGl0IHdhcyBjYXVzaW5nIEJBTSB0aW1lb3V0IGVycm9yIG9uIFNEWDY1LCBidXQgaXQKICAg
IHdhcyB3b3JraW5nIGZpbmUgb24gSVBRODA3eC4KICAgIFdlIHdpbGwgZHJvcCB0aGlzIHBhdGNo
IGZvciBub3cuIExldCBtZSBjaGVjayBvbiBTRFg2NSBhbmQgdHJ5IHRvIGZpeAogICAgYWxsIHRo
ZSBlcnJvci4KCj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8
IDMgKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jCj4+IGluZGV4IGQ0YmEwZDA0Yzk3MC4uNDEzZTIxNGM4ZTg3IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+IEBAIC0yODg1LDYgKzI4ODUsOSBA
QCBzdGF0aWMgaW50IHFjb21fcGFyYW1fcGFnZV90eXBlX2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwgIGNvbnN0IHN0cnVjdCBuYW5kXwo+PiAgIAlvcF9pZCA9IHFfb3AuZGF0YV9pbnN0cl9p
ZHg7Cj4+ICAgCWxlbiA9IG5hbmRfc3Vib3BfZ2V0X2RhdGFfbGVuKHN1Ym9wLCBvcF9pZCk7Cj4+
ICAgCj4+ICsJaWYgKGxlbiA8IE5BTkRDX1NURVBfU0laRSkKPj4gKwkJbGVuID0gTkFORENfU1RF
UF9TSVpFOwo+PiArCj4+ICAgCW5hbmRjX3NldF9yZWFkX2xvYyhjaGlwLCAwLCAwLCAwLCBsZW4s
IDEpOwo+PiAgIAo+PiAgIAlpZiAoIW5hbmRjLT5wcm9wcy0+cXBpY192Mikgewo+IAo+IAo+IFRo
YW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
