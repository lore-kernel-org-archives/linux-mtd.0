Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD0C88CB2
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w75TduAvO1j1+/Wkn85RrjigucDGYUReQs+CfnVn8fs=; b=gxAreuMMhFhcxR
	p43NFCnt+w96swk2ArVGYLKwk/cx3mIgiw8XR7oVSrQDPKRGL/NmxPh5tTlKUKKqF54GXLNQesEqm
	pNYR4NOe3d09DDEZ9FLA1xL9tn/XwIlTEL1xgLCt0lpebi+y6NcZgRPmQBcLKlVdPoJWMLb8MNis7
	Iu23GSRW8wlv9bWSMKMzQ407l35yYEB2h+59GraxPZwItmS1xE06Ygmyjhnh8pVINeCPWTB42/0+/
	r5EmWw8Uk8lOfWe+hR/Z2B+IQ6BMv1415RcAkWegFlNLS03aK6XWEHvBqValLQd1iFBrb2bap2g/i
	gbv1TkQE620si0yeyPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ljE-004qYj-02;
	Mon, 12 Jun 2023 17:53:20 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8lj9-004qX0-0p;
	Mon, 12 Jun 2023 17:53:17 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686592390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLGlTgvrhOiI7CIUt2StK8gMQZowawdoEviSYddzekk=;
	b=HWk/zjbuzfAc91L/H+00DKcMgNROXKfM8PErTKAN2EJzSVP3ef0FgZlJ74PLd7gHVXR2eJ
	4IAFHbHqfguHcOocRtCxK784SA0u09turJi550wQ6rXrTN8w9+d0gA0E8Ree+78OZGmNva
	m34Xr0DDpxuxv/mBzuHvgNafOf+NCqfAcqG9MjpQuTHzykBYklrqr+DcuVc7YMQSMhBsXV
	jL86MnMFaHeynyRincRfVyESkc0ePMkFmbgLPtrvklk5yOi1uGvGZ1J+litv4pAZ0FwR8N
	Td4af4mG6dTtq2+1nXH59z1GfzAjUIXaAL8gnH3vOyyUl+WEfqB8v8i8xQ14Kg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8467A20004;
	Mon, 12 Jun 2023 17:53:07 +0000 (UTC)
Date: Mon, 12 Jun 2023 19:53:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, linux-kernel@vger.kernel.org, Vignesh
 Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal
 Dasu <kdasu.kdev@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/12] mtd: rawnand: brcmnand: Add BCMBCA read data bus
 interface
Message-ID: <20230612195305.4b097c46@xps-13>
In-Reply-To: <20230612194908.5465bc56@xps-13>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
	<20230606231252.94838-11-william.zhang@broadcom.com>
	<20230607102232.17c4a27b@xps-13>
	<7b393f47-4053-a8c7-f32e-3881d8130d80@broadcom.com>
	<20230608081821.1de5a50b@xps-13>
	<4ab08e3e-3be4-8b8b-6eb8-03a62337f46f@broadcom.com>
	<20230609103544.0f00f799@xps-13>
	<3d3b471b-c555-ee1c-96d6-c04d76979e76@broadcom.com>
	<20230612194908.5465bc56@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_105315_601270_DDDC3A31 
X-CRM114-Status: GOOD (  33.95  )
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

SGVsbG8gYWdhaW4sCgo+ID4gPj4+Pj4gUGVyaGFwcyB3ZSBjb3VsZCBoYXZlIGEgc2luZ2xlIGZ1
bmN0aW9uIHRoYXQgaXMgc3RhdGljYWxseSBhc3NpZ25lZCBhdAo+ID4gPj4+Pj4gcHJvYmUgdGlt
ZSBpbnN0ZWFkIG9mIGEgZmlyc3QgaGVscGVyIHdpdGggdHdvIGNvbmRpdGlvbnMgd2hpY2ggY2Fs
bHMgaW4KPiA+ID4+Pj4+IG9uZSBjYXNlIGFub3RoZXIgaG9vay4uLiBUaGlzIGNhbiBiZSBzaW1w
bGlmaWVkIEkgZ3Vlc3MuICAKPiA+ID4+Pj4+ICAgICA+PiBXZWxsIHRoaXMgd2lsbCBuZWVkIHRv
IGJlIGRvbmUgYXQgdGhlIFNvQyBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiBsZXZlbCAoYmNtPHh4
eD5fbmFuZC5jKSBhbmQgZWFjaCBTb0Mgd2lsbCBuZWVkIHRvIGhhdmUgZWl0aGVyIGdlbmVyYWwg
ZGF0YSBidXMgcmVhZCBmdW5jIHdpdGggaXNfcGFyYW0gb3B0aW9uIG9yIGRhdGFfYnVzX3JlYWRf
cGFnZSwgZGF0YV9idXNfcmVhZF9wYXJhbS4gIAo+ID4gPj4+Cj4gPiA+Pj4gWW91IHRvbGQgbWUg
aW4gY2FzZSB3ZSB3b3VsZCB1c2UgZXhlY19vcCB3ZSBjb3VsZCBhdm9pZCB0aGUgcGFyYW0KPiA+
ID4+PiBjYWNoZS4gSWYgdGhhdCdzIHRydWUgdGhlbiB0aGUgd2hvbGUgc3VwcG9ydCBjYW4gYmUg
c2ltcGxpZmllZC4gIAo+ID4gPj4+ICAgID4+IENvcnJlY3Qgd2UgbWF5IHBvc3NpYmx5IHVuaWZp
ZWQgdGhlIHBhcmFtZXRlciBkYXRhIHJlYWQgYnV0IGV4ZWNfb3AgaXMgbG9uZyBzaG90IGFuZCB3
ZSBhcmUgbm90IGZ1bGx5IHJlYWR5IGZvciB0aGF0IHlldC4gSXQgYWxzbyBkZXBlbmRzIG9uIGlm
IHRoZSBsb3cgbGV2ZWwgZGF0YSByZWdpc3RlciBoYXMgZW5kaWFuZXNzIGRpZmZlcmVuY2UgZm9y
IHRoZSBwYXJhbWV0ZXIgZGF0YSBiZXR3ZWVuIGRpZmZlcmVuY2UgU29Dcy4gIAo+ID4gPj4KPiA+
ID4+IFNvIEkgd291bGQgbGlrZSB0byBwdXNoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGFu
ZCB3ZSBjYW4gZXhwbG9yZSB0aGUgZXhlY19vcCBvcHRpb24gbGF0ZSB3aGljaCB3aWxsIGJlIGEg
bXVjaCBiaWcgYW5kIGNvbXBsZXRlIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbi4gIAo+ID4gPiAK
PiA+ID4gSSBhbSBzb3JyeSBidXQgdGhpcyBzZXJpZXMgaXMgdG90YWxseSBiYWNrd2FyZHMsIHlv
dSdyZSB0cnlpbmcgdG8gZ3Vlc3MKPiA+ID4gd2hhdCBjb21lcyBuZXh0IHdpdGggdGhlICdpc19w
YXJhbScgdGhpbmcsIGl0J3MgZXhhY3RseSB3aGF0IHdlIGFyZQo+ID4gPiBmaWdodGluZyBhZ2Fp
bnN0IHNpbmNlIDIwMTcuIFRoZXJlIGFyZSBwbGVudHkgb2YgLT5leGVjX29wKCkKPiA+ID4gY29u
dmVyc2lvbnMgb3V0IHRoZXJlLCBJIGRvbid0IGJlbGlldmUgdGhpcyBvbmUgd2lsbCBiZSBoYXJk
ZXIuIFlvdQo+ID4gPiBuZWVkIHRvIGNvbnZlcnQgdGhlIGRyaXZlciB0byB0aGlzIG5ldyBBUEkg
YW5kIGdldCByaWQgb2YgdGhpcyB3aG9sZQo+ID4gPiBlbmRpYW5uZXNzIG5vbi1zZW5zZSB0byBz
aW1wbGlmeSBhIGxvdCB0aGUgZHJpdmVyLgo+ID4gPiAgIAo+ID4gSSBhbSBub3QgZ3Vlc3Npbmcg
YW55dGhpbmcgYnV0IGp1c3QgZmFjdG9yIG91dCB0aGUgZXhpc3RpbmcgY29tbW9uIG5hbmQgY2Fj
aGUgcmVhZCBsb2dpYyBpbnRvIHRoZSBzaW5nbGUgZGVmYXVsdCBmdW5jdGlvbihvciBvbmUgZm9y
IHBhZ2UgcmVhZCBhbmQgYW5vdGhlciBmb3IgcGFyYW1ldGVyIHJlYWQgYXMgSSBtZW50aW9uZWQg
aW4gYW5vdGhlciB0aHJlYWQpIGFuZCBhbGxvdyBTb0MgdG8gb3ZlcnJpZGVzIHRoZSBpbXBsZW1l
bnRhdGlvbiB3aGVuIG5lZWRlZC4KPiAKPiBObywgeW91IGFyZSB0cnlpbmcgdG8gZ3Vlc3Mgd2hh
dCB0eXBlIG9mIHJlYWQgdGhlIGNvcmUgaXMgcGVyZm9ybWluZywKPiBlaXRoZXIgYSByZWd1bGFy
IGRhdGEgcGFnZSByZWFkIG9yIGEgcGFyYW1ldGVyIHBhZ2UgcmVhZC4KPiAKPiA+IEkgYWdyZWUg
LT5leGVjX29wIGNhbiBwb3NzaWJseSBnZXQgcmlkIG9mIHRoZSBwYXJhbWV0ZXIgcGFnZSByZWFk
IGZ1bmN0aW9uIGFuZCBpcyB0aGUgd2F5IHRvIGdvLiBCdXQgaXQgd29uJ3QgaGVscCBvbiB0aGUg
cGFnZSByZWFkIGZvciBlbmRpYW5lc3MuCj4gCj4gWW91IHRvbGQgbWUgdGhlcmUgaXMgbm8gZW5k
aWFuZXNzIGlzc3VlIHdpdGggdGhlIGRhdGEgcGFnZXMsIHNvIHdoeSBpdAo+IHdvbid0IGhlbHAg
b24gdGhlIHBhZ2UgcmVhZD8KPiAKPiA+IEl0J3Mgbm90IHRoYXQgSSBhbSBhZ2FpbnN0IGV4ZWNf
b3AgYnV0IEkgd2FudCB0byB0YWtlIG9uZSBzdGVwIGEgdGltZQo+ID4gYW5kIEknZCBsaWtlIHRv
IGdldCB0aGVzZSBmaXhlcwo+IAo+IEkgZG9uJ3Qgc2VlIGFueSBmaXggaGVyZT8gTGV0IG1lIGtu
b3cgaWYgSSBhbSBtaXNzaW5nIHNvbWV0aGluZyBidXQKPiByaWdodCBub3cgSSBzZWUgYSBuZXcg
dmVyc2lvbiBvZiB0aGUgY29udHJvbGxlciBiZWluZyBzdXBwb3J0ZWQgd2l0aAo+IGl0cyBvd24g
Y29uc3RyYWludHMuIElmIHlvdSBhcmUgZml4aW5nIGV4aXN0aW5nIGNvZGUgZm9yIGFscmVhZHkK
PiBzdXBwb3J0ZWQgcGxhdGZvcm0sIHRoZW4gbWFrZSBpdCBjbGVhciBhbmQgd2UgY2FuIGRpc2N1
c3MgdGhpcy4gQnV0IGlmCj4geW91IGp1c3Qgd2FudCB0byBzdXBwb3J0IHRoZSBiY21iY2EgZmxh
dm9yLCB0aGVuIHRoZXJlIGlzIG5vIHJpc2sKPiBtaXRpZ2F0aW9uIGludm9sdmVkIGhlcmUsIGFu
ZCBhIGNvbnZlcnNpb24gaXMgdGhlIHJpZ2h0IHN0ZXAgOikKPiAKCkkgZm9yZ290IHRvIG1lbnRp
b246IHRoZSBleGVjX29wIGNvbnZlcnNpb24gaXMgYWxtb3N0IHJlYWR5LCBCb3Jpcwp3b3JrZWQg
b24gaXQgYnV0IGhlIGxhY2tlZCB0aGUgaGFyZHdhcmUgc28gbWF5YmUgeW91J2xsIGp1c3QgbmVl
ZCB0bwpyZXZpdmUgdGhlIGZldyBwYXRjaGVzIHdoaWNoIHRhcmdldCB5b3VyIHBsYXRmb3JtIGFu
ZCBkbyBhIGxpdHRsZSBiaXQgb2YKZGVidWdnaW5nPwoKaHR0cHM6Ly9naXRodWIuY29tL2JicmV6
aWxsb24vbGludXgvY29tbWl0cy9uYW5kL2V4ZWMtb3AtY29udmVyc2lvbj9hZnRlcj04YTNjZjZm
ZDI1ZDVlMTVjNjY2N2Y5ZTk1YzFmYzg2ZTRjYjczNWU2KzM0JmJyYW5jaD1uYW5kJTJGZXhlYy1v
cC1jb252ZXJzaW9uJnF1YWxpZmllZF9uYW1lPXJlZnMlMkZoZWFkcyUyRm5hbmQlMkZleGVjLW9w
LWNvbnZlcnNpb24KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
