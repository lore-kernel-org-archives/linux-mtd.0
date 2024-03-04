Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BD8C5478C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svnXJbifFmXw3vSgrX1tJpXZjfiAJGYA9XgjReUzQNw=; b=QmqZ45WhgvHPX1
	evrAsnOVy7pnAY8N6CuVAQGuo/ah3Iuau60H6zh/cDKCHE4xfp0IhdUeu+N7ZfYl3E0LLPSKnjsLN
	z27cZ2dsL8z+o0QAevYtNhhnjLFb+OVyqbLI/1U8Kscp2dEYb4Uoephf8s7PEE9kKS4gqTQTervRa
	greFugiBYU/k9id924Xc7Ucy+gsLvZ/nbXL+cX+PbF4yUxKgA2sUKxFQ0Kjr16jSw3clnaX+zdsj0
	19JVtcYOXus1BhMYKZeDFL7/NdVyGAxgJtEpUZH8fHwsWdA+h1sZ+H0bkLF4E1QppmLLbakraQbYH
	0r9XCcfipc1PoWhrfc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5q2-00000008h0D-3y1x;
	Mon, 04 Mar 2024 10:46:30 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5pu-00000008gzH-1XQb
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 10:46:26 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4247gAiZ026675;
	Mon, 4 Mar 2024 11:45:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=v5FLLCAArlNcLgScNiV4Le4T1AnPlUVqkw65OKBHt6A=; b=nZ
	Rv22JPT2/RTGWQpKZPhLdQLGEwkU74KSZuZcl369NHhr1WX8AU9b9sNLmWCGO1wP
	N0ZJIyK2uhTZF9FV6JQq2AFOB02v8QoWHxz8IUee2iN2Q+rCT1WFwDlQiu/6U4Iw
	/+HOFzwicR+xv52OseHAFDGvM9VTyZmQ/oPzEvxr7+dCgHW/pS72OlZ3CSlvHbzW
	gPNIsRXOqUU73vNAjTbwywtMQJ7OpQTxmXQqaCVRakbLYOIlp9OVmQg7N7ftKKcV
	ECu7GgZAhC04PXY/4RLSIhjSge2BZSij/gkTqx7e7YlmEG9vFNeucLZXABplnBh9
	ynBEMgPqRczSmgw6vLVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wktdkyend-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 11:45:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EF5AD40044;
	Mon,  4 Mar 2024 11:45:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE61A2681BC;
	Mon,  4 Mar 2024 11:44:40 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Mar
 2024 11:44:40 +0100
Message-ID: <93098d4e-c3b6-4c61-9ab7-764e18b7cb7d@foss.st.com>
Date: Mon, 4 Mar 2024 11:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mtd: rawnand: More continuous read fixes
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav
	<pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        Julien Su <juliensu@mxic.com.tw>, Jaime Liao
	<jaimeliao@mxic.com.tw>,
        Jaime Liao <jaimeliao.tw@gmail.com>,
        Alvin Zhou
	<alvinzhou@mxic.com.tw>, <eagle.alexander923@gmail.com>,
        <mans@mansr.com>, <martin@geanix.com>,
        =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
References: <20240223115545.354541-1-miquel.raynal@bootlin.com>
 <d950908e-5c2b-41f7-9708-2eae1e6d9c76@foss.st.com>
 <20240229114627.647f4af2@xps-13>
Content-Language: en-US
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240229114627.647f4af2@xps-13>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_06,2024-03-01_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_024622_986448_94A78B35 
X-CRM114-Status: GOOD (  35.90  )
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

SGkgTWlxdWVsLAoKT24gMi8yOS8yNCAxMTo0NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBD
aHJpc3RvcGhlLAo+IAo+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBN
b24sIDI2IEZlYiAyMDI0IDE1OjI4OjU5ICswMTAwOgo+IAo+PiBIaSBNaXF1ZWwsCj4+Cj4+IE9u
IDIvMjMvMjQgMTI6NTUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBIZWxsbywKPj4+Cj4+PiBG
b2xsb3dpbmcgQ2hyaXN0b3BoZSByZXBvcnQgSSBtYW51YWxseSBpbnNlcnRlZCBtYW55IGRpZmZl
cmVudAo+Pj4gY29uZGl0aW9ucyB0byB0ZXN0IHRoZSBsb2dpYyBlbmFibGluZ2FuZCBjb25maWd1
cmluZyBjb250aW51b3VzIHJlYWRzIGluCj4+PiB0aGUgY29yZSwgdHJ5aW5nIHRvIGNsYXJpZnkg
dGhlIGNvcmUgYW5kIGhvcGVmdWxseSBmaXggaXQgZm9yIHJlYWwuIEkgYW0KPj4+IHByZXR0eSBj
b25maWRlbnQgcmVnYXJkaW5nIHRoZSBmaXJzdCBwYXRjaCBidXQgYSBiaXQgbW9yZSBpbiB0aGUg
Zm9nIGZvcgo+Pj4gdGhlIHNlY29uZC90aGlyZC4gRXZlbiB0aG91Z2ggSSdtIHByZXR0eSBzdXJl
IHRoZXkgaW1wcm92ZSB0aGUgc2l0dWF0aW9uCj4+PiB0aGVyZSBtaWdodCBzdGlsbCBiZSBjb3Ju
ZXIgY2FzZXMgSSBkb24ndCBoYXZlIGluIG1pbmQuCj4+Cj4+IEkgaGF2ZSB0ZXN0ZWQgdGhlIHBh
dGNoc2V0IGFuZCB0aGUgaXNzdWUgaXMgZml4ZWQsIHNvIEkgd2lsbCBzZW5kIGEgdGVzdGVkLWJ5
IG9uIHBhdGNoIDEuCj4gCj4gR3JlYXQhIFRoYW5rcyEKPiAKPiBGb3Igbm93IEkgY291bGQgbm90
IGdldCBteSBoYW5kcyBvbiBhIGNoaXAgd2l0aCBtb3JlIHRoYW4gb25lIExVTi4gSWYKPiBieSBj
aGFuY2UgeW91cnMgaGFzIHR3byBMVU5zIChvciBtb3JlKSwgY291bGQgeW91IHBsZWFzZSBydW4g
c29tZQo+IGV4cGVyaW1lbnRzIHdoZW4gY3Jvc3NpbmcgdGhlIExVTiBib3VuZGFyeT8KClNvcnJ5
LCBJIGhhdmUgb25lIExVTi4KCj4gCj4gQW55aG93LCB5b3VyIFRlc3RlZC1ieSB3aWxsIGJlIHdl
bGNvbWUuCj4gCj4+IEJ1dCwgSSB0aGluayB0aGF0IHRoZXJlIGlzIHN0aWxsIGFuIGlzc3VlIHVz
aW5nIEZNQzIgYW5kIHByb2JhYmx5IG90aGVycyBkcml2ZXJzLgo+Pgo+PiBGTUMyIGRyaXZlciBo
YXMgMiBtb2RlczogcG9sbGluZyBtb2RlIHRoYXQgd2lsbCBjYWxsZWQgbmFuZF9yZWFkX3BhZ2Vf
b3AgYW5kIHRoZSBzZXF1ZW5jZXIgbW9kZSB0aGF0IGlzIGRlZmluaW5nIGl0cyBvd24gSFcgcmVh
ZCBhbGdvcml0aG0uCj4+Cj4+IFRoZSBGTUMyIHNlcXVlbmNlciBkbyBub3Qgc3VwcG9ydCBjb250
aW51b3VzIHJlYWQgZmVhdHVyZS4KPj4KPj4gSSBoYXZlIGFkZGVkIGJhc2ljIGxvZ3MgaW4gbmFu
ZF9kb19yZWFkX29wcy4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBjb250aW51b3VzIHJl
YWQgZmVhdHVyZSBzaG91bGQgYmUgZGlzYWJsZWQgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1bmN0aW9u
Lgo+Pgo+PiBGTUMyIHBvbGxpbmcgbW9kZToKPj4gcm9vdEBzdG0zMm1wMTp+IyBtdGRfZGVidWcg
cmVhZCAvZGV2L210ZDkgMCAweDIwMDAgL3RtcC9yZWFkLmhleAo+PiBbICAgNDEuMDgzMTMyXSBu
YW5kX2RvX3JlYWRfb3BzIHN0YXJ0czogY29udF9yZWFkLm9uZ29pbmc9MQo+PiBbICAgNDEuMDg2
NDEwXSBuYW5kX2RvX3JlYWRfb3BzIHN0YXJ0czogY29udF9yZWFkLmZpcnN0X3BhZ2U9MCwgY29u
dF9yZWFkLmxhc3RfcGFnZT0xCj4+IFsgICA0MS4wOTQ3OTddIG5hbmRfZG9fcmVhZF9vcHMgZW5k
czogY29udF9yZWFkLm9uZ29pbmc9MAo+PiBbICAgNDEuMDk4MTExXSBuYW5kX2RvX3JlYWRfb3Bz
IGVuZHM6IGNvbnRfcmVhZC5maXJzdF9wYWdlPTAsIGNvbnRfcmVhZC5sYXN0X3BhZ2U9MQo+PiBD
b3BpZWQgODE5MiBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaCB0byAvdG1w
L3JlYWQuaGV4Cj4+Cj4+IEl0IGlzIE9LLiBJbiBwb2xsaW5nIG1vZGUsIGNvbl9yZWFkLm9uZ29p
bmcgaXMgc2V0IHRvIGZhbHNlIGJlZm9yZSBsZWF2aW5nIG5hbmRfZG9fcmVhZF9vcHMgZnVuY3Rp
b24uCj4+Cj4+IEZNQzIgc2VxdWVuY2VyOgo+PiByb290QHN0bTMybXAxOn4jIG10ZF9kZWJ1ZyBy
ZWFkIC9kZXYvbXRkOSAwIDB4MjAwMCAvdG1wL3JlYWQuaGV4Cj4+IFsgICA1Ny4xNDMwNTldIG5h
bmRfZG9fcmVhZF9vcHMgc3RhcnRzOiBjb250X3JlYWQub25nb2luZz0xCj4+IFsgICA1Ny4xNDYz
NzBdIG5hbmRfZG9fcmVhZF9vcHMgc3RhcnRzOiBjb250X3JlYWQuZmlyc3RfcGFnZT0wLCBjb250
X3JlYWQubGFzdF9wYWdlPTEKPj4gWyAgIDU3LjE1NDQ2OV0gbmFuZF9kb19yZWFkX29wcyBlbmRz
OiBjb250X3JlYWQub25nb2luZz0xCj4+IFsgICA1Ny4xNTgwMjBdIG5hbmRfZG9fcmVhZF9vcHMg
ZW5kczogY29udF9yZWFkLmZpcnN0X3BhZ2U9MCwgY29udF9yZWFkLmxhc3RfcGFnZT0xCj4+IENv
cGllZCA4MTkyIGJ5dGVzIGZyb20gYWRkcmVzcyAweDAwMDAwMDAwIGluIGZsYXNoIHRvIC90bXAv
cmVhZC5oZXgKPj4KPj4gS08sIGNvbl9yZWFkLm9uZ29pbmcgaXMgc2V0IHRvIHRydWUgYmVmb3Jl
IGxlYXZpbmcgbmFuZF9kb19yZWFkX29wcyBmdW5jdGlvbi4gVGhhdCBtZWFucyB0aGF0IHJlYWRf
b29iIGNhbiByZXR1cm5lZCB3cm9uZyBkYXRhIChzaW1pbGFyIGlzc3VlIGFzIHRoZSBpbml0aWFs
IHJlcG9ydGVkIGlzc3VlKS4KPj4KPj4gU28sIEkgc2VlIDIgd2F5cyB0byBmaXggdGhpcyBpc3N1
ZS4KPj4KPj4gT24gZnJhbWV3b3JrIHNpZGUgYnkgYWRkaW5nIGEgY2FsbGJhY2sgKHJhd25hbmRf
ZGlzYWJsZV9jb250X3JlYWRzKSB0aGF0IHdpbGwgc2V0IHRvIGZhbHNlIGNvbl9yZWFkLm9uZ29p
bmcgYmVmb3JlIGxlYXZpbmcgbmFuZF9kb19yZWFkX29wcyBmdW5jdGlvbi4KPiAKPiBDYW4geW91
IHBsZWFzZSB0cmFjZSB3aGF0IGhhcHBlbnMgaGVyZT8gVXBvbiB3aGF0IHNwZWNpZmljIGNvbmRp
dGlvbgo+IG5hbmRfZG9fcmVhZF9vcHMgZG9lcyByZXR1cm4gd2l0aCBvbmdvaW5nIHNldCB0byB0
cnVlPyBUaGlzIGlzIHByb2JhYmx5Cj4gd2hhdCBuZWVkcyBmaXhpbmcsIGJ1dCBJIGRvbid0IGZl
ZWwgbGlrZSBhIGRyaXZlciBob29rIGlzIHRoZSByaWdodAo+IGFwcHJvYWNoLgoKVGhlIGNvbnRp
bnVvdXMgcmVhZCBmZWF0dXJlIGlzIGRpc2FibGVkIGluCm5hbmRfbHBfZXhlY19jb250X3JlYWRf
cGFnZV9vcCBmdW5jdGlvbi4gSW4gY2FzZSBvZiB0aGUgc2VxdWVuY2VyIGlzCnVzZWQsIHRoaXMg
ZnVuY3Rpb24gaXMgbmV2ZXIgY2FsbGVkIGFzIHRoZSBIVyB3aWxsIHJlYWQgdGhlIHBhZ2UgdXNp
bmcKaXRzIG93biBhbGdvcml0aG0uCgpJIGhhdmUgZG9uZSB0aGUgdHJhY2VzIGluIHBvbGxpbmcg
YW5kIGluIHNlcXVlbmNlciBtb2RlLgoKc2VxdWVuY2VyOgpyb290QHN0bTMybXAxOn4jIG10ZF9k
ZWJ1ZyByZWFkIC9kZXYvbXRkOSAwIDB4MzAwMCAvdG1wL3JlYWQuaGV4ClsgICA3MC44Njc3NjNd
IHJhd25hbmRfZW5hYmxlX2NvbnRfcmVhZHMKWyAgIDcwLjg3MDAzM10gcmF3bmFuZF9jYXBfY29u
dF9yZWFkcwpbICAgNzAuODczNDYzXSByYXduYW5kX2NhcF9jb250X3JlYWRzOiBwcGw9MjYyMTQ0
IGx1bnNfcGVyX3RhcmdldD0xClsgICA3MC44Nzk2NDldIG5hbmRfZG9fcmVhZF9vcHMgYmVmb3Jl
IHdoaWxlIGxvb3A6IGNvbnRfcmVhZC5vbmdvaW5nPTEKWyAgIDcwLjg4NTcwNV0gbmFuZF9kb19y
ZWFkX29wcyBiZWZvcmUgd2hpbGUgbG9vcDogCmNvbnRfcmVhZC5maXJzdF9wYWdlPTAsIGNvbnRf
cmVhZC5sYXN0X3BhZ2U9MgpbICAgNzAuODk0MzM1XSBzdG0zMl9mbWMyX25mY19zZXFfcmVhZF9w
YWdlClsgICA3MC44OTg2MzddIHN0bTMyX2ZtYzJfbmZjX3NlcV9yZWFkX3BhZ2UKWyAgIDcwLjkw
MjQ0MF0gc3RtMzJfZm1jMl9uZmNfc2VxX3JlYWRfcGFnZQpbICAgNzAuOTA2NDcxXSBuYW5kX2Rv
X3JlYWRfb3BzIGFmdGVyIHdoaWxlIGxvb3A6IGNvbnRfcmVhZC5vbmdvaW5nPTEKWyAgIDcwLjkx
MjI5M10gbmFuZF9kb19yZWFkX29wcyBhZnRlciB3aGlsZSBsb29wOiAKY29udF9yZWFkLmZpcnN0
X3BhZ2U9MCwgY29udF9yZWFkLmxhc3RfcGFnZT0yCkNvcGllZCAxMjI4OCBieXRlcyBmcm9tIGFk
ZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaCB0byAvdG1wL3JlYWQuaGV4Cgpwb2xsaW5nOgpyb290
QHN0bTMybXAxOn4jIG10ZF9kZWJ1ZyByZWFkIC9kZXYvbXRkOSAwIDB4MzAwMCAvdG1wL3JlYWQu
aGV4ClsgICA1OS43MTIyMDZdIHJhd25hbmRfZW5hYmxlX2NvbnRfcmVhZHMKWyAgIDU5LjcxNDQ3
OF0gcmF3bmFuZF9jYXBfY29udF9yZWFkcwpbICAgNTkuNzE4MDYwXSByYXduYW5kX2NhcF9jb250
X3JlYWRzOiBwcGw9MjYyMTQ0IGx1bnNfcGVyX3RhcmdldD0xClsgICA1OS43MjM5NTFdIG5hbmRf
ZG9fcmVhZF9vcHMgYmVmb3JlIHdoaWxlIGxvb3A6IGNvbnRfcmVhZC5vbmdvaW5nPTEKWyAgIDU5
LjczMDI3M10gbmFuZF9kb19yZWFkX29wcyBiZWZvcmUgd2hpbGUgbG9vcDogCmNvbnRfcmVhZC5m
aXJzdF9wYWdlPTAsIGNvbnRfcmVhZC5sYXN0X3BhZ2U9MgpbICAgNTkuNzM4NzkzXSBzdG0zMl9m
bWMyX25mY19yZWFkX3BhZ2UKWyAgIDU5Ljc0MjMzNV0gbmFuZF9yZWFkX3BhZ2Vfb3AKWyAgIDU5
Ljc0NTI2NF0gcmF3bmFuZF9jb250X3JlYWRfb25nb2luZwpbICAgNTkuNzQ4OTQyXSBuYW5kX2xw
X2V4ZWNfY29udF9yZWFkX3BhZ2Vfb3AKWyAgIDU5Ljc1MzU5Nl0gc3RtMzJfZm1jMl9uZmNfcmVh
ZF9wYWdlClsgICA1OS43NTY3MTZdIG5hbmRfcmVhZF9wYWdlX29wClsgICA1OS43NTk1NDldIHJh
d25hbmRfY29udF9yZWFkX29uZ29pbmcKWyAgIDU5Ljc2MzE4NF0gbmFuZF9scF9leGVjX2NvbnRf
cmVhZF9wYWdlX29wClsgICA1OS43NjgzMjldIHN0bTMyX2ZtYzJfbmZjX3JlYWRfcGFnZQpbICAg
NTkuNzcwODc5XSBuYW5kX3JlYWRfcGFnZV9vcApbICAgNTkuNzczOTA3XSByYXduYW5kX2NvbnRf
cmVhZF9vbmdvaW5nClsgICA1OS43Nzc2MTVdIG5hbmRfbHBfZXhlY19jb250X3JlYWRfcGFnZV9v
cApbICAgNTkuNzgyMjE3XSBuYW5kX2RvX3JlYWRfb3BzIGFmdGVyIHdoaWxlIGxvb3A6IGNvbnRf
cmVhZC5vbmdvaW5nPTAKWyAgIDU5Ljc4NzgxOF0gbmFuZF9kb19yZWFkX29wcyBhZnRlciB3aGls
ZSBsb29wOiAKY29udF9yZWFkLmZpcnN0X3BhZ2U9MCwgY29udF9yZWFkLmxhc3RfcGFnZT0yCkNv
cGllZCAxMjI4OCBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaCB0byAvdG1w
L3JlYWQuaGV4Cgo+IAo+IEkgd2FzIGV4cGVjdGluZyB0aGUgb25nb2luZyBib29sZWFuIHRvIGFs
d2F5cyBiZSByZXNldCBhdCB0aGUgZW5kIG9mCj4gbmFuZF9kb19yZWFkX29wcygpLCBJIHByb2Jh
Ymx5IG1pc3NlZCBhIHNjZW5hcmlvLiBJbiBhbnkgY2FzZSB3aGF0IGlzCj4gcHJvYmFibHkgbmVl
ZGVkIGZvciB0aGUgc2VxdWVuY2VyIHRvIHdvcmsgaXM6Cj4gCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtMzcyNiw2ICszNzI2LDcgQEAgc3RhdGljIGludCBu
YW5kX2RvX3JlYWRfb3BzKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGxvZmZfdCBmcm9tLAo+ICAg
ICAgICAgICAgICAgICAgfQo+ICAgICAgICAgIH0KPiAgICAgICAgICBuYW5kX2Rlc2VsZWN0X3Rh
cmdldChjaGlwKTsKPiArICAgICAgIGNoaXAtPmNvbnRfcmVhZC5vbmdvaW5nID0gZmFsc2U7CgpX
aXRoIHRoaXMgcGF0Y2gsIGl0IGlzIE9LLCB0aGUgY29udGludW91cyByZWFkIGZlYXR1cmUgd2ls
bCBiZSBkaXNhYmxlZAphcyBleHBlY3RlZCBpbiBhbGwgY2FzZXMuCgpSZWdhcmRzLApDaHJpc3Rv
cGhlIEtlcmVsbG8uCgo+ICAgCj4gICAgICAgICAgb3BzLT5yZXRsZW4gPSBvcHMtPmxlbiAtIChz
aXplX3QpIHJlYWRsZW47Cj4gICAgICAgICAgaWYgKG9vYikKPiAKPj4KPj4gT3IKPj4KPj4gT24g
Rk1DMiBkcml2ZXIgc2lkZSBieSBkaXNhYmxpbmcgdGhlIGNvbnRpbnVvdXMgcmVhZCBmZWF0dXJl
IGluIGNhc2Ugb2YgdGhlIHNlcXVlbmNlciBpcyB1c2VkIGxpa2UgaXQgaXMgZG9uZSBpbiBuYW5k
c2ltLmMgZHJpdmVyLgo+PiBTb21ldGhpbmcgbGlrZToKPj4gaWYgKGNoZWNrX29ubHkpIHsKPj4g
CQlmb3IgKG9wX2lkID0gMDsgb3BfaWQgPCBvcC0+bmluc3Ryczsgb3BfaWQrKykgewo+PiAJCQlp
bnN0ciA9ICZvcC0+aW5zdHJzW29wX2lkXTsKPj4gCQkJaWYgKGluc3RyLT50eXBlID09IE5BTkRf
T1BfQ01EX0lOU1RSICYmCj4+IAkJCSAgICAoaW5zdHItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRf
Q01EX1JFQURDQUNIRUVORCB8fAo+PiAJCQkgICAgIGluc3RyLT5jdHguY21kLm9wY29kZSA9PSBO
QU5EX0NNRF9SRUFEQ0FDSEVTRVEpKQo+PiAJCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiAJCX0K
Pj4KPj4gCQlyZXR1cm4gMDsKPj4gCX0KPiAKPiBUaGlzIGlzIGEgc2Vjb25kIHBvc3NpYmxlIGNo
b2ljZSBpZiB0aGUgZmlyc3Qgb25lIGRvZXMgbm90IGdpdmUKPiBpbnRlcmVzdGluZyByZXN1bHRz
LiBOb3QgbXkgZmF2b3JpdGUgaW4geW91ciBjYXNlLgo+IAo+IFRoYW5rcyBmb3IgeW91ciBoZWxw
LAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
