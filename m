Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4A4C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RllRA72FinIVhzMW3evEDSM0oDih1oba60VoGLGL9NU=; b=gyaXqEtRnznhX5
	/cl7fyPZInZ/PWJrmd8aJl1Y25RC7EMhQ9pM9dmPHNEQMRLujCopMl0e8Dvk5ZXW+LwP3yRqIICH2
	bI4s5sg5Kg7PltWVsh6pHnZl/bMvbdfZwls4cfsiDVkogzrsR+BM9RJNrldXeo4rQPWyACsLOIlC0
	+QaSWLktU5a47NOzF16S2J408sbjMf/vzz7ezaF1qnIpgmHeF0kgnywhcVHmqhs8rsVS+umBQSYKo
	4bH3bJZrU2NqkeMiuxPZk36ka93Y+bmasDqwd/4NiSzZHbyJ5/kmZ9wTiBj0aClBFvDWVcGbIc7cE
	kDxdRJbCV3xyRvi4MOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rec0E-000000018o6-18kj;
	Mon, 26 Feb 2024 14:30:46 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rec0A-000000018kc-1obt
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 14:30:44 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QALMrb025877;
	Mon, 26 Feb 2024 15:30:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=HMvmcJ5Ogo6NdV3AhLthG6hBMTqr+kGQEtQNqoOum3M=; b=Hr
	3CJPeI3yAUVB6UE+sxH0c2k0aREsHo4D49W7A/lLiQV8X44zogt2JHhfPbfbl2Kt
	CQVTd4/KQDjlVThzk5+/dHXK7/n8jz13+7f0AZtUx5AnyJP4SJOhlxxDDR1kFCiO
	VJLFA8tW3aSebhiWa4dSgKLN6a2tXrGx919TRlHCo3iWkeGmZcNF/yA6J8koJ3Yp
	L0QkZpYnvENxn9XTC5/oLlpsS+b3BBb8QJbUMXQWHDoOFwThxjYYi/NGbOd2KF65
	+ZHRXEUW56YGOrPa5IRSx638rcNuX0xpmFyx1miFVyaQiLCNkPBdcAPHqSloLm4+
	vqJlDiIchysZM4FIYG7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wf8p27e9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 15:30:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 991774002D;
	Mon, 26 Feb 2024 15:30:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6994128F9C6;
	Mon, 26 Feb 2024 15:29:01 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 26 Feb
 2024 15:29:00 +0100
Message-ID: <d950908e-5c2b-41f7-9708-2eae1e6d9c76@foss.st.com>
Date: Mon, 26 Feb 2024 15:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mtd: rawnand: More continuous read fixes
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus
	<tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Julien Su
	<juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
        Jaime Liao
	<jaimeliao.tw@gmail.com>,
        Alvin Zhou <alvinzhou@mxic.com.tw>, <eagle.alexander923@gmail.com>,
        <mans@mansr.com>, <martin@geanix.com>,
        =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
References: <20240223115545.354541-1-miquel.raynal@bootlin.com>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240223115545.354541-1-miquel.raynal@bootlin.com>
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_10,2024-02-26_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_063042_786416_754751BB 
X-CRM114-Status: GOOD (  21.58  )
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

SGkgTWlxdWVsLAoKT24gMi8yMy8yNCAxMjo1NSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxs
bywKPiAKPiBGb2xsb3dpbmcgQ2hyaXN0b3BoZSByZXBvcnQgSSBtYW51YWxseSBpbnNlcnRlZCBt
YW55IGRpZmZlcmVudAo+IGNvbmRpdGlvbnMgdG8gdGVzdCB0aGUgbG9naWMgZW5hYmxpbmdhbmQg
Y29uZmlndXJpbmcgY29udGludW91cyByZWFkcyBpbgo+IHRoZSBjb3JlLCB0cnlpbmcgdG8gY2xh
cmlmeSB0aGUgY29yZSBhbmQgaG9wZWZ1bGx5IGZpeCBpdCBmb3IgcmVhbC4gSSBhbQo+IHByZXR0
eSBjb25maWRlbnQgcmVnYXJkaW5nIHRoZSBmaXJzdCBwYXRjaCBidXQgYSBiaXQgbW9yZSBpbiB0
aGUgZm9nIGZvcgo+IHRoZSBzZWNvbmQvdGhpcmQuIEV2ZW4gdGhvdWdoIEknbSBwcmV0dHkgc3Vy
ZSB0aGV5IGltcHJvdmUgdGhlIHNpdHVhdGlvbgo+IHRoZXJlIG1pZ2h0IHN0aWxsIGJlIGNvcm5l
ciBjYXNlcyBJIGRvbid0IGhhdmUgaW4gbWluZC4KCkkgaGF2ZSB0ZXN0ZWQgdGhlIHBhdGNoc2V0
IGFuZCB0aGUgaXNzdWUgaXMgZml4ZWQsIHNvIEkgd2lsbCBzZW5kIGEgCnRlc3RlZC1ieSBvbiBw
YXRjaCAxLgoKQnV0LCBJIHRoaW5rIHRoYXQgdGhlcmUgaXMgc3RpbGwgYW4gaXNzdWUgdXNpbmcg
Rk1DMiBhbmQgcHJvYmFibHkgb3RoZXJzIApkcml2ZXJzLgoKRk1DMiBkcml2ZXIgaGFzIDIgbW9k
ZXM6IHBvbGxpbmcgbW9kZSB0aGF0IHdpbGwgY2FsbGVkIApuYW5kX3JlYWRfcGFnZV9vcCBhbmQg
dGhlIHNlcXVlbmNlciBtb2RlIHRoYXQgaXMgZGVmaW5pbmcgaXRzIG93biBIVyAKcmVhZCBhbGdv
cml0aG0uCgpUaGUgRk1DMiBzZXF1ZW5jZXIgZG8gbm90IHN1cHBvcnQgY29udGludW91cyByZWFk
IGZlYXR1cmUuCgpJIGhhdmUgYWRkZWQgYmFzaWMgbG9ncyBpbiBuYW5kX2RvX3JlYWRfb3BzLiBN
eSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgCnRoZSBjb250aW51b3VzIHJlYWQgZmVhdHVyZSBzaG91
bGQgYmUgZGlzYWJsZWQgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1bmN0aW9uLgoKRk1DMiBwb2xsaW5n
IG1vZGU6CnJvb3RAc3RtMzJtcDE6fiMgbXRkX2RlYnVnIHJlYWQgL2Rldi9tdGQ5IDAgMHgyMDAw
IC90bXAvcmVhZC5oZXgKWyAgIDQxLjA4MzEzMl0gbmFuZF9kb19yZWFkX29wcyBzdGFydHM6IGNv
bnRfcmVhZC5vbmdvaW5nPTEKWyAgIDQxLjA4NjQxMF0gbmFuZF9kb19yZWFkX29wcyBzdGFydHM6
IGNvbnRfcmVhZC5maXJzdF9wYWdlPTAsIApjb250X3JlYWQubGFzdF9wYWdlPTEKWyAgIDQxLjA5
NDc5N10gbmFuZF9kb19yZWFkX29wcyBlbmRzOiBjb250X3JlYWQub25nb2luZz0wClsgICA0MS4w
OTgxMTFdIG5hbmRfZG9fcmVhZF9vcHMgZW5kczogY29udF9yZWFkLmZpcnN0X3BhZ2U9MCwgCmNv
bnRfcmVhZC5sYXN0X3BhZ2U9MQpDb3BpZWQgODE5MiBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMDAw
MDAwMCBpbiBmbGFzaCB0byAvdG1wL3JlYWQuaGV4CgpJdCBpcyBPSy4gSW4gcG9sbGluZyBtb2Rl
LCBjb25fcmVhZC5vbmdvaW5nIGlzIHNldCB0byBmYWxzZSBiZWZvcmUgCmxlYXZpbmcgbmFuZF9k
b19yZWFkX29wcyBmdW5jdGlvbi4KCkZNQzIgc2VxdWVuY2VyOgpyb290QHN0bTMybXAxOn4jIG10
ZF9kZWJ1ZyByZWFkIC9kZXYvbXRkOSAwIDB4MjAwMCAvdG1wL3JlYWQuaGV4ClsgICA1Ny4xNDMw
NTldIG5hbmRfZG9fcmVhZF9vcHMgc3RhcnRzOiBjb250X3JlYWQub25nb2luZz0xClsgICA1Ny4x
NDYzNzBdIG5hbmRfZG9fcmVhZF9vcHMgc3RhcnRzOiBjb250X3JlYWQuZmlyc3RfcGFnZT0wLCAK
Y29udF9yZWFkLmxhc3RfcGFnZT0xClsgICA1Ny4xNTQ0NjldIG5hbmRfZG9fcmVhZF9vcHMgZW5k
czogY29udF9yZWFkLm9uZ29pbmc9MQpbICAgNTcuMTU4MDIwXSBuYW5kX2RvX3JlYWRfb3BzIGVu
ZHM6IGNvbnRfcmVhZC5maXJzdF9wYWdlPTAsIApjb250X3JlYWQubGFzdF9wYWdlPTEKQ29waWVk
IDgxOTIgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2ggdG8gL3RtcC9yZWFk
LmhleAoKS08sIGNvbl9yZWFkLm9uZ29pbmcgaXMgc2V0IHRvIHRydWUgYmVmb3JlIGxlYXZpbmcg
bmFuZF9kb19yZWFkX29wcyAKZnVuY3Rpb24uIFRoYXQgbWVhbnMgdGhhdCByZWFkX29vYiBjYW4g
cmV0dXJuZWQgd3JvbmcgZGF0YSAoc2ltaWxhciAKaXNzdWUgYXMgdGhlIGluaXRpYWwgcmVwb3J0
ZWQgaXNzdWUpLgoKU28sIEkgc2VlIDIgd2F5cyB0byBmaXggdGhpcyBpc3N1ZS4KCk9uIGZyYW1l
d29yayBzaWRlIGJ5IGFkZGluZyBhIGNhbGxiYWNrIChyYXduYW5kX2Rpc2FibGVfY29udF9yZWFk
cykgdGhhdCAKd2lsbCBzZXQgdG8gZmFsc2UgY29uX3JlYWQub25nb2luZyBiZWZvcmUgbGVhdmlu
ZyBuYW5kX2RvX3JlYWRfb3BzIGZ1bmN0aW9uLgoKT3IKCk9uIEZNQzIgZHJpdmVyIHNpZGUgYnkg
ZGlzYWJsaW5nIHRoZSBjb250aW51b3VzIHJlYWQgZmVhdHVyZSBpbiBjYXNlIG9mIAp0aGUgc2Vx
dWVuY2VyIGlzIHVzZWQgbGlrZSBpdCBpcyBkb25lIGluIG5hbmRzaW0uYyBkcml2ZXIuClNvbWV0
aGluZyBsaWtlOgppZiAoY2hlY2tfb25seSkgewoJCWZvciAob3BfaWQgPSAwOyBvcF9pZCA8IG9w
LT5uaW5zdHJzOyBvcF9pZCsrKSB7CgkJCWluc3RyID0gJm9wLT5pbnN0cnNbb3BfaWRdOwoJCQlp
ZiAoaW5zdHItPnR5cGUgPT0gTkFORF9PUF9DTURfSU5TVFIgJiYKCQkJICAgIChpbnN0ci0+Y3R4
LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfUkVBRENBQ0hFRU5EIHx8CgkJCSAgICAgaW5zdHItPmN0
eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1JFQURDQUNIRVNFUSkpCgkJCQlyZXR1cm4gLUVPUE5P
VFNVUFA7CgkJfQoKCQlyZXR1cm4gMDsKCX0KClNvLCBzaG91bGQgaXQgYmUgZml4ZWQgb24gZHJp
dmVyIHNpZGUgb3IgZnJhbWV3b3JrIHNpZGU/CgpSZWdhcmRzLApDaHJpc3RvcGhlIEtlcmVsbG8u
Cgo+IAo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDI0MDIyMTE3
NTMyNy40MmY3MDc2ZEB4cHMtMTMvVC8jbTM5OWJhY2IxMGRiOGY1OGY2YjFmMDE0OWExZGY4Njdl
YzA4NmJiMGEKPiAKPiBDaGVlcnMsCj4gTWlxdcOobAo+IAo+IE1pcXVlbCBSYXluYWwgKDMpOgo+
ICAgIG10ZDogcmF3bmFuZDogRml4IGFuZCBzaW1wbGlmeSBhZ2FpbiB0aGUgY29udGludW91cyBy
ZWFkIGRlcml2YXRpb25zCj4gICAgbXRkOiByYXduYW5kOiBBZGQgYSBoZWxwZXIgZm9yIGNhbGN1
bGF0aW5nIGEgcGFnZSBpbmRleAo+ICAgIG10ZDogcmF3bmFuZDogRW5zdXJlIGFsbCBjb250aW51
b3VzIHRlcm1zIGFyZSBhbHdheXMgaW4gc3luYwo+IAo+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9iYXNlLmMgfCA3NyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
