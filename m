Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1208EC48BEB
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHRlWkdrDkMTdhAiBfVja2LEJxrUdDPazN9wUR1XG9Q=; b=dWKnjVZdlV2PIP
	y0bw/6vMb7v3QbHVBy6VtRSVUz9mlOa0+ugTrYkHYOH4FuwXd0h/l4ScrFC3vmanjmtnsKa/HreDu
	btJuH0e8vkEbGL4IjpFmGqqjDKx/Pp4zeJHpc8p/LRN5HI65MF2Mf6AmJd7kvTQ1ovXfLpipyTfRe
	j/Xy/YXyxeFqNv9RegLzV+szimM4DnnGwk1sviN2/3px5CJycvOlgZm7wI1pz6pnNyjXF3YxNURtr
	dL0WmNu83U29uGGCDem9bEW8xnkufdjBUk77dwloaa4+SXZ6aT3br8HNTyYFD5zV2RJpTKIyJLosr
	XbbjWFJWrwKPAfx1QhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpVZ-00000001jYs-0BsT;
	Wed, 21 Feb 2024 16:31:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpVW-00000001jYF-0edL
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 16:31:44 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LBQkT0027891;
	Wed, 21 Feb 2024 17:31:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=RgA97dYX4Od/frVDv9EeyOJvDvfZfZ84xgDgXSNIrPY=; b=Cn
	7r0iZ7b0iqY1dX0racFiikHG1ikeqF20ws9xFUbUjcSZjKKASBG7IlQN3QHtm1oC
	Se+M6TJz1ex2mc4JX/pKRZZ425FjBksCbfP+YpNOXR3FEeOVVeE7+UXuHOQys3/F
	eJQEWjLZ6xzKM4dpPAEJbjEIX4n1oGL5n7GQLvptSk/A6kJMDaXNAvXb4Pq1L6KP
	rOO35s6A3Ps+42VQcz/EEHfliB/81B+nxxk60JTqGLxr96xvr3+EtuVefdLJfWZo
	/XKvmLeaEPrlAV2qznuKRz4emm3qbNSb2I5SjrfHFdYTf3vgx5PMSIwDgbE6yEfm
	Hw8VXTTe6/xLxssqKIrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wd201m79j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:31:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F108B40044;
	Wed, 21 Feb 2024 17:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D95F28CFA5;
	Wed, 21 Feb 2024 17:29:58 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 21 Feb
 2024 17:29:57 +0100
Message-ID: <8ed32443-1343-4970-9f5a-34285850b372@foss.st.com>
Date: Wed, 21 Feb 2024 17:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: rawnand: Clarify conditions to enable continuous
 reads
Content-Language: en-US
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
        =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
        <stable@vger.kernel.org>
References: <20231222113730.786693-1-miquel.raynal@bootlin.com>
 <cce57281-4149-459f-b741-0f3c08af7d20@foss.st.com>
 <20240221122032.502fbf3f@xps-13>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240221122032.502fbf3f@xps-13>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_03,2024-02-21_02,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_083142_682581_1464C0BB 
X-CRM114-Status: GOOD (  30.11  )
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

SGkgTWlxdWVsLAoKT24gMi8yMS8yNCAxMjoyMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBD
aHJpc3RvcGhlLAo+IAo+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBG
cmksIDkgRmViIDIwMjQgMTQ6MzU6NDQgKzAxMDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gSSBh
bSB0ZXN0aW5nIGxhc3QgbmFuZC9uZXh0IGJyYW5jaCB3aXRoIHRoZSBNUDEgYm9hcmQsIGFuZCBp
IGdldCBhbiBpc3N1ZSBzaW5jZSB0aGlzIHBhdGNoIHdhcyBhcHBsaWVkLgo+Pgo+PiBXaGVuIEkg
cmVhZCB0aGUgU0xDIE5BTkQgdXNpbmcgbmFuZHVtcCB0b29sIChyZWFkaW5nIHBhZ2UgMCBhbmQg
cGFnZSAxKSwgdGhlIE9PQiBpcyBub3QgZGlzcGxheWVkIGF0IGV4cGVjdGVkLiBGb3IgcGFnZSAx
LCBvb2IgaXMgZGlzcGxheWVkIHdoZW4gZm9yIHBhZ2UgMCB0aGUgZmlyc3QgZGF0YSBvZiB0aGUg
cGFnZSBhcmUgZGlzcGxheWVkLgo+Pgo+PiBUaGUgbmFuZGR1bXAgY29tbWFuZCB1c2VkIGlzOiBu
YW5kZHVtcCAtYyAtbyAtbCAweDIwMDAgL2Rldi9tdGQ5Cj4gCj4gSSBiZWxpZXZlIHRoZSBpc3N1
ZSBpcyBub3QgaW4gdGhlIGluZGV4ZXMgYnV0IHJlbGF0ZWQgdG8gdGhlIE9PQi4gSQo+IGN1cnJl
bnRseSB0ZXN0IG9uIGEgZGV2aWNlIG9uIHdoaWNoIEkgd291bGQgcHJlZmVyIG5vdCB0byBzbWFz
aCB0aGUKPiBjb250ZW50LCBzbyB0aGlzIGlzIGp1c3QgY29tcGlsZSB0ZXN0ZWQgYW5kIG5vdCBy
dW4gdGltZSB2ZXJpZmllZCwgYnV0Cj4gY291bGQgeW91IHRlbGwgbWUgaWYgdGhpcyBzb2x2ZXMg
dGhlIGlzc3VlOgo+IAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtMzU3Nyw3ICszNTc3
LDggQEAgc3RhdGljIGludCBuYW5kX2RvX3JlYWRfb3BzKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
IGxvZmZfdCBmcm9tLAo+ICAgICAgICAgIG9vYiA9IG9wcy0+b29iYnVmOwo+ICAgICAgICAgIG9v
Yl9yZXF1aXJlZCA9IG9vYiA/IDEgOiAwOwo+ICAgCj4gLSAgICAgICByYXduYW5kX2VuYWJsZV9j
b250X3JlYWRzKGNoaXAsIHBhZ2UsIHJlYWRsZW4sIGNvbCk7Cj4gKyAgICAgICBpZiAoIW9vYl9y
ZXF1aXJlZCkKPiArICAgICAgICAgICAgICAgcmF3bmFuZF9lbmFibGVfY29udF9yZWFkcyhjaGlw
LCBwYWdlLCByZWFkbGVuLCBjb2wpOwoKSSBhbSBzdGlsbCBhYmxlIHRvIHJlcHJvZHVjZSB0aGUg
cHJvYmxlbSB3aXRoIHRoZSBwYXRjaCBhcHBsaWVkLgpJbiBmYWN0LCB3aGVuIG5hbmRkdW1wIHJl
YWRzIHRoZSBPT0IsIG5hbmRfZG9fcmVhZF9vcHMgaXMgbm90IGNhbGxlZCwgCmJ1dCBuYW5kX3Jl
YWRfb29iX29wIGlzIGNhbGxlZCwgYW5kIGFzIGNvbnRfcmVhZC5vbmdvaW5nPTEsIHdlIGFyZSBu
b3QgCmR1bXBpbmcgdGhlIG9vYiBidXQgdGhlIGZpcnN0IGRhdGEgb2YgdGhlIHBhZ2UuCgpwYWdl
IDA6ClsgICA1Ny42NDIxNDRdIHJhd25hbmRfZW5hYmxlX2NvbnRfcmVhZHM6IHBhZ2U9MCwgY29s
PTAsIHJlYWRsZW49NDA5NiwgCm10ZC0+d3JpdGVzaXplPTQwOTYKWyAgIDU3LjY1MDIxMF0gcmF3
bmFuZF9lbmFibGVfY29udF9yZWFkczogZW5kX3BhZ2U9MQpbICAgNTcuNjU0ODU4XSBuYW5kX2Rv
X3JlYWRfb3BzOiBjb250X3JlYWQub25nb2luZz0xClsgICA1OS4zNTI1NjJdIG5hbmRfcmVhZF9v
b2Jfb3AKcGFnZSAxOgpbICAgNTkuMzU1OTY2XSByYXduYW5kX2VuYWJsZV9jb250X3JlYWRzOiBw
YWdlPTEsIGNvbD0wLCByZWFkbGVuPTQwOTYsIAptdGQtPndyaXRlc2l6ZT00MDk2ClsgICA1OS4z
NjQwNDVdIHJhd25hbmRfZW5hYmxlX2NvbnRfcmVhZHM6IGVuZF9wYWdlPTEKWyAgIDU5LjM2ODc1
N10gbmFuZF9kb19yZWFkX29wczogY29udF9yZWFkLm9uZ29pbmc9MApbICAgNjEuMzkwMDk4XSBu
YW5kX3JlYWRfb29iX29wCgpJIGhhdmUgbm90IGN1cnJlbnRseSBiYW5kd2lkdGggdG8gd29yayBv
biB0aGlzIHRvcGljIGFuZCBJIG5lZWQgdG8gCnVuZGVyc3RhbmQgaG93IGNvbnRpbnVvdXMgcmVh
ZCBpcyB3b3JraW5nLCBidXQgSSBoYXZlIG1hZGUgYSBwYXRjaCBhbmQgSSAKZG8gbm90IGhhdmUg
aXNzdWVzIHdpdGggaXQgd2hlbiBJIGFtIHVzaW5nIG5hbmRkdW1wIG9yIG10ZF9kZWJ1ZyB0b29s
cy4KCkkgaGF2ZSBub3QgdGVzdGVkIGl0IG9uIGEgZmlsZSBzeXN0ZW0sIHNvIGl0IGlzIGp1c3Qg
YSBwcm9wb3NhbC4KCi0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCkBAIC0zNDY2LDIyICszNDY2LDE4IEBA
IHN0YXRpYyB2b2lkIHJhd25hbmRfZW5hYmxlX2NvbnRfcmVhZHMoc3RydWN0IApuYW5kX2NoaXAg
KmNoaXAsIHVuc2lnbmVkIGludCBwYWdlLAogIAkJCQkgICAgICB1MzIgcmVhZGxlbiwgaW50IGNv
bCkKICB7CiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7Ci0JdW5z
aWduZWQgaW50IGVuZF9wYWdlLCBlbmRfY29sOworCXVuc2lnbmVkIGludCBlbmRfcGFnZTsKCiAg
CWNoaXAtPmNvbnRfcmVhZC5vbmdvaW5nID0gZmFsc2U7CgotCWlmICghY2hpcC0+Y29udHJvbGxl
ci0+c3VwcG9ydGVkX29wLmNvbnRfcmVhZCkKKwlpZiAoIWNoaXAtPmNvbnRyb2xsZXItPnN1cHBv
cnRlZF9vcC5jb250X3JlYWQgfHwgY29sICsgcmVhZGxlbiA8PSAKbXRkLT53cml0ZXNpemUpCiAg
CQlyZXR1cm47CgotCWVuZF9wYWdlID0gRElWX1JPVU5EX1VQKGNvbCArIHJlYWRsZW4sIG10ZC0+
d3JpdGVzaXplKTsKLQllbmRfY29sID0gKGNvbCArIHJlYWRsZW4pICUgbXRkLT53cml0ZXNpemU7
CisJZW5kX3BhZ2UgPSBwYWdlICsgRElWX1JPVU5EX1VQKGNvbCArIHJlYWRsZW4sIG10ZC0+d3Jp
dGVzaXplKSAtIDE7CgogIAlpZiAoY29sKQogIAkJcGFnZSsrOwoKLQlpZiAoZW5kX2NvbCAmJiBl
bmRfcGFnZSkKLQkJZW5kX3BhZ2UtLTsKLQogIAlpZiAocGFnZSArIDEgPiBlbmRfcGFnZSkKICAJ
CXJldHVybjsKClRlbGwgbWUgaWYgdGhpcyBwYXRjaCBpcyBicmVha2luZyB0aGUgY29udGludW91
cyByZWFkIGZlYXR1cmUgb3IgaWYgaXQgCmNhbiBiZSBwdXNoZWQgb24gdGhlIG1haWxpbmcgbGlz
dC4KClJlZ2FyZHMsCkNocmlzdG9waGUgS2VyZWxsby4KCj4gICAKPiAgICAgICAgICB3aGlsZSAo
MSkgewo+ICAgICAgICAgICAgICAgICAgc3RydWN0IG10ZF9lY2Nfc3RhdHMgZWNjX3N0YXRzID0g
bXRkLT5lY2Nfc3RhdHM7Cj4gCj4gCj4gSWYgdGhhdCBkb2VzIG5vdCB3b3JrLCBJJ2xsIGRlc3Ry
b3kgdGhlIGNvbnRlbnQgb2YgdGhlIGZsYXNoIGFuZAo+IHByb3Blcmx5IHJlcHJvZHVjZS4KPiAK
PiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
