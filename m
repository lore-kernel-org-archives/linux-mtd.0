Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57561C7EE2C
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EWB7P6lKTMcUzk9YQQhb6rmzndIUiXitGGnOM4ZUGQ=; b=otJOHjfFXokeGH
	hW9S5yUlDXt35AVG8H2eiXjFuqI7Bs7JWtdJ33WY+lZSjFkgsArh3zVw527ZFHHKRo/MSZNZCOPrd
	qAXvNcG8hD78N0J8GFSMuJKDcemCfNUzLL4wMwZhbXzq+/r4xdQDl0jynVideNPB09RI1bL8y0jH8
	bTKECox5VpAnA1Ekm38z99F1Q8mU0tZ3MrN3/o6fotwH45nX7PrXMjttD+KOOkznPtJH/9cIt2Gkd
	AisXzOq6Qu8vfB7/R18VE4zE2GeMXBltmHIUhmqt5hvD9Bu/xoCMSlxRHptVLSK37ewyk2y6k44fR
	2NW7DCTamjJSlqfkYoCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1krF-00CyQD-0I;
	Wed, 24 May 2023 09:32:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1krB-00CyPV-33
	for linux-mtd@lists.infradead.org;
	Wed, 24 May 2023 09:32:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O8c7rJ019014;
	Wed, 24 May 2023 09:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dANZ+34Cj+apXQq0ujqh5laptz7aFMADMcnj2pcYRpg=;
 b=V7KqU+ES0Bv6cJ/Iw18gliaRRDRNAHZR9ZyANakioHJP47CSf0k5Cuy+CKn7ycQ715uL
 QQWupR1isJf5CnWhTdcoyj3DIUJyayVUF9/fDJUOPqA0CG89FjeZ2cJ60anWXGCQvWOm
 4PARlycNFi4Xn4trAbBEoxIEwO/yAWYABYTMXFQov7XaJM3p8DAmClXjfObKd7jjrOza
 wl0zvNVBE/0kTGzXjD7rmI40vU6KQOkmy2Yetuis8pjwz6NGsry564+P5S6z/RwZQzVY
 V3nKvLczbLBUAnUq+SAbmpAkTmV5CjGlcZC3WZdiam/YgxYghNx6c+XXW86dL8A9Wsc4 hQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsf8805df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 09:32:28 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34O9WS0F004019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 09:32:28 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 02:32:25 -0700
Message-ID: <fa9806d7-a69a-6998-d77e-543f2dfbf456@quicinc.com>
Date: Wed, 24 May 2023 15:02:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 4/5] mtd: rawnand: qcom: Add support for read, write,
 erase exec_ops
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20230511133017.6307-1-quic_mdalam@quicinc.com>
 <20230511133017.6307-5-quic_mdalam@quicinc.com>
 <20230522155345.1d12600e@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20230522155345.1d12600e@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -U9uGJkjeqSIBjqHQfJKJSV3cPBKL8Au
X-Proofpoint-GUID: -U9uGJkjeqSIBjqHQfJKJSV3cPBKL8Au
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_05,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_023233_993749_382313E5 
X-CRM114-Status: GOOD (  24.18  )
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

CgpPbiA1LzIyLzIwMjMgNzoyMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiAKPiBxdWljX21k
YWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUaHUsIDExIE1heSAyMDIzIDE5OjAwOjE2ICswNTMw
Ogo+IAo+PiBUaGlzIGNoYW5nZSB3aWxsIGFkZCBleGVjX29wcyBzdXBwb3J0IGZvciBSRUFELCBX
UklURSwgYW5kIEVSQVNFCj4+IGNvbW1hbmQuCj4+Cj4+IENvLWRldmVsb3BlZC1ieTogU3JpY2hh
cmFuIFJhbWFiYWRocmFuIDxxdWljX3NyaWNoYXJhQHF1aWNpbmMuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBTcmljaGFyYW4gUmFtYWJhZGhyYW4gPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPgo+
PiAtLS0KPj4gQ2hhbmdlIGluIFt2Ml0KPj4KPj4gKiBNaXNzZWQgdG8gcG9zdCBDb3Zlci1sZXR0
ZXIsIHNvIHBvc3RpbmcgdjIgcGF0Y2ggd2l0aCBjb3Zlci1sZXR0ZXIKPj4KPj4gICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gaW5kZXggODcxN2Q1MDg2Zjgw
Li4xNGFiMjFhNDc3MWIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21f
bmFuZGMuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gQEAg
LTE3NjUsNyArMTc2NSw4IEBAIHFjb21fbmFuZGNfcmVhZF9jd19yYXcoc3RydWN0IG10ZF9pbmZv
ICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4+ICAgCWludCByZXQsIHJlZ19vZmYgPSBG
TEFTSF9CVUZfQUNDLCByZWFkX2xvYyA9IDA7Cj4+ICAgCWludCByYXdfY3cgPSBjdzsKPj4gICAK
Pj4gLQluYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBOVUxMLCAwKTsKPj4gKwljaGlw
LT5jb250X3JlYWQub25nb2luZyA9IGZhbHNlOwo+IAo+IFRoaXMgc2hvdWxkIGJlIGNoZWNrZWQg
b25jZSBmb3IgYWxsIGJ5IHRoZSBjb3JlIGF0IHN0YXJ0dXAsIHRoYXQncyB3aGVuCj4geW91IGNh
biB0ZWxsIHRoZSBjb3JlIGNvbnRpbnVvdXMgcmVhZCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZQo+
IGNvbnRyb2xsZXIuCgogICBTdXJlLCBXaWxsIGZpeCB0aGlzIGluIG5leHQgcGF0Y2ggVjMuCj4g
Cj4+ICsJbmFuZF9yZWFkX3BhZ2Vfb3AoY2hpcCwgcGFnZSwgMCwgZGF0YV9idWYsIG10ZC0+d3Jp
dGVzaXplKTsKPj4gICAJaG9zdC0+dXNlX2VjYyA9IGZhbHNlOwo+PiAgIAo+PiAgIAlpZiAobmFu
ZGMtPnByb3BzLT5xcGljX3YyKQo+PiBAQCAtMjE4MiwxNCArMjE4MywyNCBAQCBzdGF0aWMgdm9p
ZCBxY29tX25hbmRjX2NvZGV3b3JkX2ZpeHVwKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwg
aW50IHBhZ2UpCj4+ICAgc3RhdGljIGludCBxY29tX25hbmRjX3JlYWRfcGFnZShzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLCB1aW50OF90ICpidWYsCj4+ICAgCQkJCWludCBvb2JfcmVxdWlyZWQsIGlu
dCBwYWdlKQo+PiAgIHsKPj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNo
aXApOwo+PiAgIAlzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhvc3QgPSB0b19xY29tX25hbmRfaG9z
dChjaGlwKTsKPj4gICAJc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYyA9IGdldF9x
Y29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPj4gKwlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNj
ID0gJmNoaXAtPmVjYzsKPj4gICAJdTggKmRhdGFfYnVmLCAqb29iX2J1ZiA9IE5VTEw7Cj4+ICAg
Cj4+ICAgCWlmIChob3N0LT5ucl9ib290X3BhcnRpdGlvbnMpCj4+ICAgCQlxY29tX25hbmRjX2Nv
ZGV3b3JkX2ZpeHVwKGhvc3QsIHBhZ2UpOwo+PiAgIAo+PiAtCW5hbmRfcmVhZF9wYWdlX29wKGNo
aXAsIHBhZ2UsIDAsIE5VTEwsIDApOwo+PiArCWNoaXAtPmNvbnRfcmVhZC5vbmdvaW5nID0gZmFs
c2U7Cj4+ICsJbmFuZF9yZWFkX3BhZ2Vfb3AoY2hpcCwgcGFnZSwgMCwgYnVmLCBtdGQtPndyaXRl
c2l6ZSk7Cj4+ICsJbmFuZGMtPmJ1Zl9jb3VudCA9IDA7Cj4+ICsJbmFuZGMtPmJ1Zl9zdGFydCA9
IDA7Cj4+ICsJaG9zdC0+dXNlX2VjYyA9IHRydWU7Cj4+ICsJY2xlYXJfcmVhZF9yZWdzKG5hbmRj
KTsKPj4gKwlzZXRfYWRkcmVzcyhob3N0LCAwLCBwYWdlKTsKPj4gKwl1cGRhdGVfcndfcmVncyho
b3N0LCBlY2MtPnN0ZXBzLCB0cnVlLCAwKTsKPj4gKwo+PiAgIAlkYXRhX2J1ZiA9IGJ1ZjsKPj4g
ICAJb29iX2J1ZiA9IG9vYl9yZXF1aXJlZCA/IGNoaXAtPm9vYl9wb2kgOiBOVUxMOwo+PiAgIAo+
PiBAQCAtMjI1OSw2ICsyMjcwLDEwIEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kY193cml0ZV9wYWdl
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKPj4gICAKPj4gICAJ
bmFuZF9wcm9nX3BhZ2VfYmVnaW5fb3AoY2hpcCwgcGFnZSwgMCwgTlVMTCwgMCk7Cj4+ICAgCj4+
ICsJc2V0X2FkZHJlc3MoaG9zdCwgMCwgcGFnZSk7Cj4+ICsJbmFuZGMtPmJ1Zl9jb3VudCA9IDA7
Cj4+ICsJbmFuZGMtPmJ1Zl9zdGFydCA9IDA7Cj4+ICsKPj4gICAJY2xlYXJfcmVhZF9yZWdzKG5h
bmRjKTsKPj4gICAJY2xlYXJfYmFtX3RyYW5zYWN0aW9uKG5hbmRjKTsKPj4gICAKPj4gQEAgLTMw
ODEsNyArMzA5NiwzOCBAQCBzdGF0aWMgaW50IHFjb21fcmVhZF9zdGF0dXNfZXhlYyhzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLAo+PiAgIAo+PiAgIHN0YXRpYyBpbnQgcWNvbV9lcmFzZV9jbWRfdHlw
ZV9leGVjKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ym9wICpz
dWJvcCkKPj4gICB7Cj4+IC0JcmV0dXJuIDA7Cj4+ICsJc3RydWN0IHFjb21fbmFuZF9ob3N0ICpo
b3N0ID0gdG9fcWNvbV9uYW5kX2hvc3QoY2hpcCk7Cj4+ICsJc3RydWN0IHFjb21fbmFuZF9jb250
cm9sbGVyICpuYW5kYyA9IGdldF9xY29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPj4gKwlzdHJ1
Y3QgcWNvbV9vcCBxX29wOwo+PiArCWludCByZXQgPSAwOwo+PiArCj4+ICsJcWNvbV9wYXJzZV9p
bnN0cnVjdGlvbnMoY2hpcCwgc3Vib3AsICZxX29wKTsKPj4gKwo+PiArCXFfb3AuY21kX3JlZyB8
PSBQQUdFX0FDQyB8IExBU1RfUEFHRTsKPj4gKwo+PiArCXByZV9jb21tYW5kKGhvc3QsIE5BTkRf
Q01EX0VSQVNFMSk7Cj4gCj4gVGhlIGluc3RydWN0aW9uIGlzIHVwIHRvIHRoZSBjYWxsZXIsIG5v
dCB0byB0aGUgZHJpdmVyLiBJZiBubyBvdGhlcgo+IGluc3RydWN0aW9uIHJhdGhlciB0aGFuIE5B
TkRfQ01EX0VSQVNFMSBjYW4gYmUgdXNlZCB3aXRoIHRoaXMgcGF0dGVybiwKPiB0aGVuIGl0IHNo
b3VsZCBiZSBwcm9wZXJseSBkZXNjcmliZWQgKHNlZSB0aGUgQXJhc2FuIGNvbnRyb2xsZXIsCj4g
YW5mY19jaGVja19vcCgpKS4KPiAKICAgVGhhbmtzLCB3aWxsIGZpeCB0aGlzIGluIG5leHQgcGF0
Y2ggVjMuCgo+PiArCj4+ICsJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0ZMQVNIX0NNRCwgcV9v
cC5jbWRfcmVnKTsKPj4gKwluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfQUREUjAsIHFfb3AuYWRk
cjFfcmVnKTsKPj4gKwluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfQUREUjEsIHFfb3AuYWRkcjJf
cmVnKTsKPj4gKwluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfREVWMF9DRkcwLAo+PiArCQkgICAg
ICBob3N0LT5jZmcwX3JhdyAmIH4oNyA8PCBDV19QRVJfUEFHRSkpOwo+PiArCW5hbmRjX3NldF9y
ZWcoY2hpcCwgTkFORF9ERVYwX0NGRzEsIGhvc3QtPmNmZzFfcmF3KTsKPj4gKwluYW5kY19zZXRf
cmVnKGNoaXAsIE5BTkRfRVhFQ19DTUQsIDEpOwo+PiArCj4+ICsJd3JpdGVfcmVnX2RtYShuYW5k
YywgTkFORF9GTEFTSF9DTUQsIDMsIE5BTkRfQkFNX05FWFRfU0dMKTsKPj4gKwl3cml0ZV9yZWdf
ZG1hKG5hbmRjLCBOQU5EX0RFVjBfQ0ZHMCwgMiwgTkFORF9CQU1fTkVYVF9TR0wpOwo+PiArCXdy
aXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRVhFQ19DTUQsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsK
Pj4gKwo+PiArCXJldCA9IHN1Ym1pdF9kZXNjcyhuYW5kYyk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJ
ZGV2X2VycihuYW5kYy0+ZGV2LCAiZmFpbHVyZSBpbiBzYnVtaXR0aW5nIHJlc2V0IGRlc2NyaXB0
b3JcbiIpOwo+PiArCj4+ICsJZnJlZV9kZXNjcyhuYW5kYyk7Cj4+ICsKPj4gKwlyZXQgPSBxY29t
X3dhaXRfcmR5X3BvbGwoY2hpcCwgcV9vcC5yZHlfdGltZW91dF9tcyk7Cj4+ICsKPj4gKwlyZXR1
cm4gcmV0Owo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgaW50IHFjb21fcGFyYW1fcGFnZV90eXBl
X2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ym9wICpz
dWJvcCkKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
