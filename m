Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB11E7849A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CT2W+MXSkDFTZxgeb50ml91AUuQprGGdTiziWBmt3vM=; b=n7VvH2wnn1FbmY
	lj9b54OMhBVJLKc+XNZlXSGlNPUcWRApvN8w/cMIV2a9F61qSHMa2IW+N4FU+l2n13EfUEyUuR/mz
	w8NtfLUtcPqHt/pNSGUlTKwfITUTc/6ANt+QCPajgUHRxdSNX7XpTlh/5eMWj+bFvjTMnhKMcH2yd
	nNt3XmiSmabqd2Ect+ygC66obIlrr7uMbxArD5jggM7kATpc/Wsc1vpyj/0+zDlZgeF+E4oeLpiUl
	MY+H4xyulKf+u5Bs84SNiLloGYfmPD5oh6W2xXs/G+yvN/XYfkJs07PZTcqbb3Xikxs4maE3qHRrh
	ddjlteGUgJpV4dI5PBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkp-00Cg2E-0u;
	Mon, 02 Oct 2023 12:10:27 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkS-00CfLp-1G
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 12:10:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68D2040004;
	Mon,  2 Oct 2023 12:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696248598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcXTtPPvML3fSf89NuM1MCWrnP5g92WtwIxjz9b/TuY=;
	b=o+Cn/qC4Ug3B/c0V4o+OalkD6q3vrtx+YSQnHOd6wdA8NhgCc8kwUQMrL/VOo5otaoI9r/
	uoVOS/Ao6bbd7fp9S4eCAGEcAOMd7tRiG0Dz3ZtpG0cGXX1Wf1r3lGw7d1jIxOG5dReqPw
	Csx18ZE78LYanQPDt5vYOROQCUwpxjJyMuMfRYNOLrYHO9tcP+WQeEpZXYRL5D4a2TMAD+
	V5TrK3NERU38ULtydlvfwT2QLfQkamd3Fq55zraukGum1t3MZKbRBgPGAKN0zpcPfmF58L
	+hcqowJIOpXucdRJKhGSFRBpizZ28JKWmQd4YXFxcBmqHLaUnDd5z3IqWg/e5A==
Date: Mon, 2 Oct 2023 14:09:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mario Kicherer <dev@kicherer.org>, Chuanhong Guo
 <gch981213@gmail.com>, Dhruva Gole <d-gole@ti.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <kernel@sberdevices.ru>
Subject: Re: [PATCH v1] mtd: spinand: add support for FORESEE F35SQA002G
Message-ID: <20231002140953.170c0055@xps-13>
In-Reply-To: <54227489-519b-3268-885f-cf7a9687822b@salutedevices.com>
References: <20230929144934.192649-1-mmkurbanov@salutedevices.com>
	<20231002114450.4ce69141@xps-13>
	<54227489-519b-3268-885f-cf7a9687822b@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_051004_627708_9D71FDE3 
X-CRM114-Status: GOOD (  17.27  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBNb24sIDIg
T2N0IDIwMjMgMTM6MTg6MTggKzAzMDA6Cgo+IEhpIE1pcXVlbCwKPiBUaGFua3MgZm9yIHlvdXIg
cmV2aWV3Lgo+IAo+IE9uIDAyLjEwLjIwMjMgMTI6NDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
PiBIaSBNYXJ0aW4sICAKPiA+PiArc3RhdGljIGludCBmMzVzcWEwMDJnX29vYmxheW91dF9mcmVl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiA+PiArCQkJCSAgICAgc3RydWN0
IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCj4gPj4gK3sKPiA+PiArCS8qIFhYWDogSXQgaXMgbm90
IHBvc3NpYmxlIHRvIHBhcnRpYWxseSB3cml0ZSB0byB0aGlzIE9PQiBhcmVhLCBhcyBib3RoCj4g
Pj4gKwkgKiB0aGUgbWFpbiBhbmQgT09CIGFyZWFzIGFyZSBwcm90ZWN0ZWQgYnkgRUNDLiBUaGUg
dXNlciBuZWVkcyB0bwo+ID4+ICsJICogcHJvZ3JhbSBib3RoIHRoZSBtYWluIGFyZWEgYW5kIE9P
QiBhcmVhIGF0IG9uZSBwcm9ncmFtbWluZyB0aW1lLAo+ID4+ICsJICogc28gdGhhdCB0aGUgRUND
IHBhcml0eSBjb2RlIGNhbiBiZSBjYWxjdWxhdGVkIHByb3Blcmx5Lgo+ID4+ICsJICovICAKPiA+
IAo+ID4gSXMgdGhpcyBjb21tZW50IHJlYWxseSBuZWVkZWQ/IEkgYmVsaWV2ZSBpdCBjb3VsZCBi
ZSBkcm9wcGVkLCB1bmxlc3MKPiA+IHlvdSBhcmUgcmVhbGx5IGV4cGVyaWVuY2luZyBzdHJhbmdl
IHN1YnBhZ2Ugd3JpdGUgYXR0ZW1wdHM/ICAKPiAKPiBJZiB5b3Ugd3JpdGUgc2VwYXJhdGVseSB0
byB0aGUgbWFpbiBhcmVhIGFuZCB0aGUgT09CIGFyZWEuIFRoaXMgaXMgdGhlCj4gY2FzZSB3aXRo
IG1hbnkgU1BJIE5BTkQgY2hpcHMsIEkgYWdyZWUgdGhhdCB0aGlzIGNvbW1lbnQgY2FuIGJlIGRy
b3BwZWQuCj4gCgpBbGwgTkFORCBjaGlwcyBoYXZlIHRoaXMgbGltaXRhdGlvbiBhY3R1YWxseS4g
SSBndWVzcyB5b3UgY2FuIGp1c3QgZ2V0CnJpZCBvZiB0aGUgY29tbWVudC4gVGhlIHJlc3QgbG9v
a3Mgb2suCgpUaGFua3MsIE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
