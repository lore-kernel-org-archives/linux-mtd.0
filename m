Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECB4C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyMtjypkzKtCg1CxmchBLFH5BETcLS0leg84zJO0wAo=; b=H++M6la8+xf6XC
	kYn80PSVSVCBN33GiUEQMtF6230jIvydehX+gJDxTnhyBkgTwPkCw3n06taRP3bpW085zH1b9BtvV
	XFRF8Y3dVAeySAGFGk2cC+1iN7fql0VyKlcDirZ0qTGxOaUkYLDkRSKfVK2yDuDXYNha8UUYOkfGg
	/pcPMSteNBSFh1b5TsLUO8j2MnhIbOgU85I++/xeL7hgAgmHyxrRlpurhWb78kpm1gZsKXwW9/phb
	PD/kPU/rNpxRc3Z8iL81mtjBUThfCYImKlG/HBHJrdveeJ5CuHqH8vzwd0H1zPEu1sBrKe4kDrfeI
	aLpa4QtzrsT5URGEatpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIL0-002GDA-0g;
	Fri, 28 Jul 2023 07:56:38 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIKv-002FsL-34;
	Fri, 28 Jul 2023 07:56:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F4ACFF803;
	Fri, 28 Jul 2023 07:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690530989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVIOVVA2436GWgI4YN46x3Q3xQHuNHFhylpbqVYFiQU=;
	b=hG1dHfDW546Ow766eyEBvQm08lot8jzexYkd0kSMrOXdhnfHFbnNhsr1wcGKEX6NJwGIjq
	YMRKT9IRZpY2NuU+Ucq+COi8KGZEUpNE9A/SkHnXCbo7NMIwilhpA3UovhpyClXWpsGRgw
	8b3JPvTxTl0IT72tfaSGDxouAZ+kTG4Ew0df9EpbeIwMYgNTcdxgNkRfVqJLpodCRhzdhG
	L/VsxeLas3ZEnnehvlv21UTe++kKgw0aKlV/AT4S22WdzSQmMr28EHO3d4UqwPm0pRWswH
	w2cHyeo55jzLK8hkBrMxse9kPUywc1L6L0AlzK8rB1MEeeZ4+87CRDBhWuOK1g==
Date: Fri, 28 Jul 2023 09:56:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, Sricharan Ramabadhran
 <quic_srichara@quicinc.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Message-ID: <20230728095624.33ffb3ae@xps-13>
In-Reply-To: <4701576f-5eca-b1e9-5b5c-de1d861e286a@linaro.org>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
	<20230716144612.32132-9-miquel.raynal@bootlin.com>
	<20230717063843.GA7062@thinkpad>
	<20230727165923.32488041@xps-13>
	<4701576f-5eca-b1e9-5b5c-de1d861e286a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_005634_387015_5BA7E091 
X-CRM114-Status: GOOD (  17.23  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAyOCBKdWwg
MjAyMyAwMzozMTo0MSArMDEwMDoKCj4gSGksIE1pcXVlbCwKPiAKPiBPbiA3LzI3LzIzIDE1OjU5
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgU2FkcmUsCj4gPiAKPiA+IG1hbmlAa2VybmVs
Lm9yZyB3cm90ZSBvbiBNb24sIDE3IEp1bCAyMDIzIDEyOjA4OjQzICswNTMwOgo+ID4gICAKPiA+
PiBPbiBTdW4sIEp1bCAxNiwgMjAyMyBhdCAwNDo0NjoxMlBNICswMjAwLCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOiAgCj4gPj4+IFRoZSBuYWRkcnMgdmFyaWFibGUgaXMgaW5pdGlhbGl6ZWQgYnV0IG5v
dCB1c2VkLiBGaXhpbmcgdGhpcyBjb3VsZCBoYXZlCj4gPj4+IGJlZW4gYSBtYXR0ZXIgb2YgZHJv
cHBpbmcgdGhlIHZhcmlhYmxlLCBidXQgdGhlIHJpZ2h0IHdheSB0byBkbyBpdCBsb29rcwo+ID4+
PiBhIGJpdCBtb3JlIGNvbXBsZXg6IHdlIGNhbiBhdm9pZCB1c2VsZXNzIHdyaXRlcyB0byB0aGUg
cV9vcCBzdHJ1Y3R1cmUgYnkKPiA+Pj4gdXNpbmcgaXQuIEluIHByYWN0aWNlIHdlIGNvdWxkIGV2
ZW4gaGF2ZSBwb3NzaWJsZSBvdXQtb2YtYm91bmQgYnVncyB3aXRoCj4gPj4+IHRoZSBleGlzdGlu
ZyBpbXBsZW1lbnRhdGlvbi4gTGV0J3MgZml4IGFsbCB0aGF0IGJ5IGp1c3QgcGVyZm9ybWluZyB0
aGUKPiA+Pj4gcmlnaHQgbnVtYmVyIG9mIGFzc2lnbm1lbnRzIGluIHRoZSBhZGRyezEsMn1fcmVn
IGZpZWxkcy4KPiA+Pj4KPiA+Pj4gRml4ZXM6IDg5NTUwYmViMDk4ZSAoIm10ZDogcmF3bmFuZDog
cWNvbTogSW1wbGVtZW50IGV4ZWNfb3AoKSIpCj4gPj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+Pj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwNzEzMTk1OS5QZFBTQzg2Sy1sa3BAaW50ZWwuY29tLwo+
ID4+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA3
MTMxNzMwLk5PWWJjakJyLWxrcEBpbnRlbC5jb20vCj4gPj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+ICAgIAo+ID4+IExHVE0hIEJ1dCBJ
J20gcmVseWluZyBvbiBTYWRyZSB0byB0ZXN0IGl0Lgo+ID4+Cj4gPj4gQWNrZWQtYnk6IE1hbml2
YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiAgCj4gPiBJIGRvbid0IHRoaW5rIEkn
dmUgcmVjZWl2ZWQgZmVlZGJhY2sgZnJvbSBTYWRyZSwgSSB3b3VsZCBsaWtlIHRvIGNsb3NlCj4g
PiB0aGVzZSBpc3N1ZXMsIGNhbiB5b3UgcGxlYXNlIHRlc3QgYW5kIGdpdmUgdXMgZmVlZGJhY2s/
ICAKPiAKPiBBbGwgcGF0Y2hlcyBhcmUgcHJldHR5IHN0cmFpZ2h0IGZvcndhcmQuIExldCB0aGUg
MC1kYXkgYm90IHJ1biB3aXRoIHRoZW0KPiBhbmQgdGhlbiBhcHBseSBhbGwgaWYgbm8gZnVydGhl
ciBmZWVkYmFjay4KClRoYW5rcyBhIGxvdCBmb3IgYWxsIHRoZSByZXZpZXchIEZvcnR1bmF0ZWx5
IEkganVzdCByZWNlaXZlZCB0aGUKVGVzdGVkLWJ5LCBvdGhlcndpc2UgSSBhZ3JlZSBtb3N0IHBh
dGNoZXMgYXJlIHNpbXBsZSBlbm91Z2ggKGJlc2lkZXMKdGhlIGxhc3Qgb25lIG1heWJlKSBhbmQg
MC1kYXkgbWlnaHQgaGF2ZSBkb25lIGEgZ29vZCBmaXJzdCBpdGVyYXRpb24uCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
