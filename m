Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4F3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 14:59:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE1B61242
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 14:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAE1B61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=p962EwR10wgItzLrkynXUbGMWDw3oi0AUmoq1LkBaFw=; b=ijLB0iFieAQzwebIUOq9cQECjV
	vhHiUnCKLVHZYdlt72zGjJ3q2hR4rdEfGQTpJZTQn2Km/PAEKSEcmJC3+guvQHMtZTMOLlj0dA/30
	DO4+17osjEzl0BN9X/Lpdoellm8ddJg+YkOlfY7dispsJIWpNY8HMo4QVQKWfpkeomPD4KqDjjRSF
	wgLo3LFYqfGLFiqVUfg3/vI4SQqNc+i6nhc+v3NuKQKe5y8bqxZBuU+AdSXtqrLTmPYzDipxFwjyH
	tiEybWA2Nfwh22dWTqkeZOPT2I7WZnN8pFHJEnKbaqh1Bq46i5VH0Pxpol0E6zIgq/DkVCPrWFyit
	I7hN/2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQWMW-009LKF-Cf; Wed, 15 Sep 2021 14:58:12 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQWMS-009LJL-GQ
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 14:58:10 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FEUr3n028559;
 Wed, 15 Sep 2021 10:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XZCB86uPKuV/GzpbaX8+VV3hy7G2w+54Yd25UoQjYiA=;
 b=p0hUCf/0qQPWDba9bizX/010a1RbKLZmp7dMoG7zsai0bIliEwc+zkgdLGOeV/5721JT
 tZjWfCp0cgVzr2CxY9Ca3vzq6tDiuo2x9/gRQ/N+Jg625dNmKwXzhX+2em0gf3S0nRvi
 /rkG2qsBFbyuYlCPWyWa1VMAgVFh6PaSPQik1D0qiS4sxkVECz/9gDB53mgW/5CdRPF7
 GfBEiuvdp/zKvNOzQngxOvA1HH7h5EYwZE8ya7sYmaHzzPGqA12GJJBncZlSF+YzftOS
 oyEoHdjXsJlbB9SWqwmnh3FYwYAqXnkU3wOw69hIcMZk3JWdcq9GGHDQO1T9iBOaiuqv kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3jnc8t77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 10:57:56 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18FEVhPI002814;
 Wed, 15 Sep 2021 10:57:55 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3jnc8t6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 10:57:55 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FEqw1j024866;
 Wed, 15 Sep 2021 14:57:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3b0m3a72ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 14:57:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18FEvnm248824578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 14:57:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA8ECA405C;
 Wed, 15 Sep 2021 14:57:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0BD8A4054;
 Wed, 15 Sep 2021 14:57:48 +0000 (GMT)
Received: from [9.145.14.74] (unknown [9.145.14.74])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Sep 2021 14:57:48 +0000 (GMT)
Subject: Re: [PATCH 6/9] s390/block/dasd_genhd: add error handling support for
 add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-7-mcgrof@kernel.org>
 <d6140e40-a472-e732-9893-99e1839b717e@linux.ibm.com>
 <f24da7d5-0b67-fa24-862f-0b27a2ab502c@linux.ibm.com>
 <YT+Bmvv3yXbuBddi@bombadil.infradead.org>
From: =?UTF-8?Q?Jan_H=c3=b6ppner?= <hoeppner@linux.ibm.com>
Message-ID: <417cf368-6821-442b-0a14-006b27690591@linux.ibm.com>
Date: Wed, 15 Sep 2021 16:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YT+Bmvv3yXbuBddi@bombadil.infradead.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9TnzlmD7Tr-lHTTUHflItAjPnDnMN64G
X-Proofpoint-GUID: ehalCfQDBnMyMC6p5nCgsPYP3FossWSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_075808_703398_B31392B0 
X-CRM114-Status: GOOD (  29.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTMvMDkvMjAyMSAxODo1MSwgTHVpcyBDaGFtYmVybGFpbiB3cm90ZToKPiBPbiBNb24sIFNl
cCAxMywgMjAyMSBhdCAwMjoxOTozOFBNICswMjAwLCBKYW4gSMO2cHBuZXIgd3JvdGU6Cj4+IE9u
IDEzLzA5LzIwMjEgMTA6MTcsIEphbiBIw7ZwcG5lciB3cm90ZToKPj4+IE9uIDAyLzA5LzIwMjEg
MTk6NDEsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6Cj4+Pj4gV2UgbmV2ZXIgY2hlY2tlZCBmb3Ig
ZXJyb3JzIG9uIGFkZF9kaXNrKCkgYXMgdGhpcyBmdW5jdGlvbgo+Pj4+IHJldHVybmVkIHZvaWQu
IE5vdyB0aGF0IHRoaXMgaXMgZml4ZWQsIHVzZSB0aGUgc2hpbnkgbmV3Cj4+Pj4gZXJyb3IgaGFu
ZGxpbmcuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiAgZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfZ2VuaGQu
YyB8IDggKysrKysrLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvYmxvY2svZGFz
ZF9nZW5oZC5jIGIvZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfZ2VuaGQuYwo+Pj4+IGluZGV4IGZh
OTY2ZTBkYjZjYS4uYmEwNzAyMjI4M2JjIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvczM5MC9i
bG9jay9kYXNkX2dlbmhkLmMKPj4+PiArKysgYi9kcml2ZXJzL3MzOTAvYmxvY2svZGFzZF9nZW5o
ZC5jCj4+Pj4gQEAgLTMzLDcgKzMzLDcgQEAgaW50IGRhc2RfZ2VuZGlza19hbGxvYyhzdHJ1Y3Qg
ZGFzZF9ibG9jayAqYmxvY2spCj4+Pj4gIHsKPj4+PiAgCXN0cnVjdCBnZW5kaXNrICpnZHA7Cj4+
Pj4gIAlzdHJ1Y3QgZGFzZF9kZXZpY2UgKmJhc2U7Cj4+Pj4gLQlpbnQgbGVuOwo+Pj4+ICsJaW50
IGxlbiwgcmM7Cj4+Pj4gIAo+Pj4+ICAJLyogTWFrZSBzdXJlIHRoZSBtaW5vciBmb3IgdGhpcyBk
ZXZpY2UgZXhpc3RzLiAqLwo+Pj4+ICAJYmFzZSA9IGJsb2NrLT5iYXNlOwo+Pj4+IEBAIC03OSw3
ICs3OSwxMSBAQCBpbnQgZGFzZF9nZW5kaXNrX2FsbG9jKHN0cnVjdCBkYXNkX2Jsb2NrICpibG9j
aykKPj4+PiAgCWRhc2RfYWRkX2xpbmtfdG9fZ2VuZGlzayhnZHAsIGJhc2UpOwo+Pj4+ICAJYmxv
Y2stPmdkcCA9IGdkcDsKPj4+PiAgCXNldF9jYXBhY2l0eShibG9jay0+Z2RwLCAwKTsKPj4+PiAt
CWRldmljZV9hZGRfZGlzaygmYmFzZS0+Y2Rldi0+ZGV2LCBibG9jay0+Z2RwLCBOVUxMKTsKPj4+
PiArCj4+Pj4gKwlyYyA9IGRldmljZV9hZGRfZGlzaygmYmFzZS0+Y2Rldi0+ZGV2LCBibG9jay0+
Z2RwLCBOVUxMKTsKPj4+PiArCWlmIChyYykKPj4+PiArCQlyZXR1cm4gcmM7Cj4+Pj4gKwo+Pj4K
Pj4+IEkgdGhpbmssIGp1c3QgbGlrZSB3aXRoIHNvbWUgb2YgdGhlIG90aGVyIGNoYW5nZXMsIHRo
ZXJlIGlzIHNvbWUKPj4+IGNsZWFudXAgcmVxdWlyZWQgYmVmb3JlIHJldHVybmluZy4gSSdsbCBw
cmVwYXJlIGEgcGF0Y2ggYW5kCj4+PiBjb21lIGJhY2sgdG8geW91Lgo+Pj4KPj4KPj4gSXQncyBh
Y3R1YWxseSBqdXN0IG9uZSBjYWxsIHRoYXQgaXMgcmVxdWlyZWQuIFRoZSBwYXRjaCBzaG91bGQK
Pj4gbG9vayBsaWtlIHRoaXM6Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvYmxvY2sv
ZGFzZF9nZW5oZC5jIGIvZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfZ2VuaGQuYwo+PiBpbmRleCBm
YTk2NmUwZGI2Y2EuLjgwNjczZGJmYjFmOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zMzkwL2Js
b2NrL2Rhc2RfZ2VuaGQuYwo+PiArKysgYi9kcml2ZXJzL3MzOTAvYmxvY2svZGFzZF9nZW5oZC5j
Cj4+IEBAIC0zMyw3ICszMyw3IEBAIGludCBkYXNkX2dlbmRpc2tfYWxsb2Moc3RydWN0IGRhc2Rf
YmxvY2sgKmJsb2NrKQo+PiAgewo+PiAgICAgICAgIHN0cnVjdCBnZW5kaXNrICpnZHA7Cj4+ICAg
ICAgICAgc3RydWN0IGRhc2RfZGV2aWNlICpiYXNlOwo+PiAtICAgICAgIGludCBsZW47Cj4+ICsg
ICAgICAgaW50IGxlbiwgcmM7Cj4+ICAKPj4gICAgICAgICAvKiBNYWtlIHN1cmUgdGhlIG1pbm9y
IGZvciB0aGlzIGRldmljZSBleGlzdHMuICovCj4+ICAgICAgICAgYmFzZSA9IGJsb2NrLT5iYXNl
Owo+PiBAQCAtNzksNyArNzksMTMgQEAgaW50IGRhc2RfZ2VuZGlza19hbGxvYyhzdHJ1Y3QgZGFz
ZF9ibG9jayAqYmxvY2spCj4+ICAgICAgICAgZGFzZF9hZGRfbGlua190b19nZW5kaXNrKGdkcCwg
YmFzZSk7Cj4+ICAgICAgICAgYmxvY2stPmdkcCA9IGdkcDsKPj4gICAgICAgICBzZXRfY2FwYWNp
dHkoYmxvY2stPmdkcCwgMCk7Cj4+IC0gICAgICAgZGV2aWNlX2FkZF9kaXNrKCZiYXNlLT5jZGV2
LT5kZXYsIGJsb2NrLT5nZHAsIE5VTEwpOwo+PiArCj4+ICsgICAgICAgcmMgPSBkZXZpY2VfYWRk
X2Rpc2soJmJhc2UtPmNkZXYtPmRldiwgYmxvY2stPmdkcCwgTlVMTCk7Cj4+ICsgICAgICAgaWYg
KHJjKSB7Cj4+ICsgICAgICAgICAgICAgICBkYXNkX2dlbmRpc2tfZnJlZShibG9jayk7Cj4+ICsg
ICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4+ICsgICAgICAgfQo+PiArCj4gCj4gVGhhbmtzIQo+
IAo+IFdvdWxkIHlvdSBsaWtlIHRvIHRvIGZvbGQgdGhpcyBmaXggaW50byBteSBwYXRjaCBhbmQg
cmVzZW5kIGV2ZW50dWFsbHk/Cj4gT3Igd2lsbCB5b3Ugc2VuZCBhIHJlcGxhY2VtZW50Pwo+IAo+
ICAgTHVpcwo+IAoKSSdkIGJlIGZpbmUgd2l0aCB5b3UganVzdCB0YWtpbmcgdGhlIGNoYW5nZXMg
Zm9yIHlvdXIgcGF0Y2hzZXQuCk9uY2UgeW91J3ZlIHJlc2VudCB0aGUgd2hvbGUgcGF0Y2hzZXQg
SSdsbCByZXZpZXcgaXQgYW5kIHNlbmQKdGhlIHVzdWFsIGFjayBvciByLWIuCgpyZWdhcmRzLApK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
