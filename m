Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E70C48BEB
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntB6Hd0byjP3iUZrgb0tXDsJWVxIzquAzJ6UqWRrP/s=; b=tCMZkiQqXtWd38
	7xv9Ai2xIIyEyxK811MgGSS1CkZMMJ6p5QenuBbmK+OAgRmvh8L7t6+eWc91IVQm2iWkn+sIhkphh
	g1xkXlZOp3lJIOkLL7N4QTIB/8PYOEsQ8lKtNVhIKmUPmzVGTgaiix6c1O0XYb4JUtUe1XcUz0j3m
	oF+7ZOKQuO5b5MtuWdncIaLk4LxCFipOnnV2ZOO5PdlbBSz3HtNemnJWZlWi42YvK7y1pJqiVN2po
	x/f5ZIG6MPTB/in5FJ6nL48JeW10T01uTfbljh63ikrv0Jko9GGpaGQHoXQqmAiplYQlIVOaUX9kQ
	mj8lVy0zDYJQX8KnEqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpqi-00000001nht-04aX;
	Wed, 21 Feb 2024 16:53:36 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpqe-00000001nfr-2EWS
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 16:53:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84DFF40003;
	Wed, 21 Feb 2024 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708534410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t1hdeVQ8w9ifKc+NIqRjOz0AGu74hIuMo8Gh+iy8sYE=;
	b=NifKBHoxcCIbXNFVEgVxBedop3PzRKuZdy0TkqyKpyjnApja9oltJ4EcQqhrQwx6FO2r1F
	vfz3r3jI+XySvxXA8FixN0HFMTz/cN3Qy4+uX0N+h4rfPIVgdYX2Usy4LQuitzYSAWt2qX
	hWTcr/EAybYn5tBkW/KW1SLJukGGDckgT00gEGrPbHI4EWhq/Qh2sDXr4bQnomWzAygeGM
	VAHx7Q1UzYvLDIVIuEXv7kZPklFwbQ6L7HzFHDJXI6FkrK7Ks3/nBbMcxg87lfI0EKuizJ
	obxUiLpIOljXalriynsRYvFWd6gF/w1DlWWLXsjp0mMpM4fkEkPIodbMhfshZw==
Date: Wed, 21 Feb 2024 17:53:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Jaime Liao <jaimeliao.tw@gmail.com>, Alvin
 Zhou <alvinzhou@mxic.com.tw>, <eagle.alexander923@gmail.com>,
 <mans@mansr.com>, <martin@geanix.com>, Sean =?UTF-8?B?Tnlla2rDpnI=?=
 <sean@geanix.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 4/4] mtd: rawnand: Clarify conditions to enable
 continuous reads
Message-ID: <20240221175327.42f7076d@xps-13>
In-Reply-To: <8ed32443-1343-4970-9f5a-34285850b372@foss.st.com>
References: <20231222113730.786693-1-miquel.raynal@bootlin.com>
	<cce57281-4149-459f-b741-0f3c08af7d20@foss.st.com>
	<20240221122032.502fbf3f@xps-13>
	<8ed32443-1343-4970-9f5a-34285850b372@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_085332_881738_D032FB9D 
X-CRM114-Status: GOOD (  38.89  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBX
ZWQsIDIxIEZlYiAyMDI0IDE3OjI5OjQ1ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMi8y
MS8yNCAxMjoyMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIENocmlzdG9waGUsCj4gPiAK
PiA+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBGcmksIDkgRmViIDIw
MjQgMTQ6MzU6NDQgKzAxMDA6Cj4gPiAgIAo+ID4+IEhpIE1pcXVlbCwKPiA+Pgo+ID4+IEkgYW0g
dGVzdGluZyBsYXN0IG5hbmQvbmV4dCBicmFuY2ggd2l0aCB0aGUgTVAxIGJvYXJkLCBhbmQgaSBn
ZXQgYW4gaXNzdWUgc2luY2UgdGhpcyBwYXRjaCB3YXMgYXBwbGllZC4KPiA+Pgo+ID4+IFdoZW4g
SSByZWFkIHRoZSBTTEMgTkFORCB1c2luZyBuYW5kdW1wIHRvb2wgKHJlYWRpbmcgcGFnZSAwIGFu
ZCBwYWdlIDEpLCB0aGUgT09CIGlzIG5vdCBkaXNwbGF5ZWQgYXQgZXhwZWN0ZWQuIEZvciBwYWdl
IDEsIG9vYiBpcyBkaXNwbGF5ZWQgd2hlbiBmb3IgcGFnZSAwIHRoZSBmaXJzdCBkYXRhIG9mIHRo
ZSBwYWdlIGFyZSBkaXNwbGF5ZWQuCj4gPj4KPiA+PiBUaGUgbmFuZGR1bXAgY29tbWFuZCB1c2Vk
IGlzOiBuYW5kZHVtcCAtYyAtbyAtbCAweDIwMDAgL2Rldi9tdGQ5ICAKPiA+IAo+ID4gSSBiZWxp
ZXZlIHRoZSBpc3N1ZSBpcyBub3QgaW4gdGhlIGluZGV4ZXMgYnV0IHJlbGF0ZWQgdG8gdGhlIE9P
Qi4gSQo+ID4gY3VycmVudGx5IHRlc3Qgb24gYSBkZXZpY2Ugb24gd2hpY2ggSSB3b3VsZCBwcmVm
ZXIgbm90IHRvIHNtYXNoIHRoZQo+ID4gY29udGVudCwgc28gdGhpcyBpcyBqdXN0IGNvbXBpbGUg
dGVzdGVkIGFuZCBub3QgcnVuIHRpbWUgdmVyaWZpZWQsIGJ1dAo+ID4gY291bGQgeW91IHRlbGwg
bWUgaWYgdGhpcyBzb2x2ZXMgdGhlIGlzc3VlOgo+ID4gCj4gPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YXNlLmMKPiA+IEBAIC0zNTc3LDcgKzM1NzcsOCBAQCBzdGF0aWMgaW50IG5hbmRfZG9fcmVhZF9v
cHMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IGZyb20sCj4gPiAgICAgICAgICBvb2Ig
PSBvcHMtPm9vYmJ1ZjsKPiA+ICAgICAgICAgIG9vYl9yZXF1aXJlZCA9IG9vYiA/IDEgOiAwOyAg
Cj4gPiAgID4gLSAgICAgICByYXduYW5kX2VuYWJsZV9jb250X3JlYWRzKGNoaXAsIHBhZ2UsIHJl
YWRsZW4sIGNvbCk7ICAKPiA+ICsgICAgICAgaWYgKCFvb2JfcmVxdWlyZWQpCj4gPiArICAgICAg
ICAgICAgICAgcmF3bmFuZF9lbmFibGVfY29udF9yZWFkcyhjaGlwLCBwYWdlLCByZWFkbGVuLCBj
b2wpOyAgCj4gCj4gSSBhbSBzdGlsbCBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSB3aXRo
IHRoZSBwYXRjaCBhcHBsaWVkLgo+IEluIGZhY3QsIHdoZW4gbmFuZGR1bXAgcmVhZHMgdGhlIE9P
QiwgbmFuZF9kb19yZWFkX29wcyBpcyBub3QgY2FsbGVkLCBidXQgbmFuZF9yZWFkX29vYl9vcCBp
cyBjYWxsZWQsIGFuZCBhcyBjb250X3JlYWQub25nb2luZz0xLCB3ZSBhcmUgbm90IGR1bXBpbmcg
dGhlIG9vYiBidXQgdGhlIGZpcnN0IGRhdGEgb2YgdGhlIHBhZ2UuCj4gCj4gcGFnZSAwOgo+IFsg
ICA1Ny42NDIxNDRdIHJhd25hbmRfZW5hYmxlX2NvbnRfcmVhZHM6IHBhZ2U9MCwgY29sPTAsIHJl
YWRsZW49NDA5NiwgbXRkLT53cml0ZXNpemU9NDA5Ngo+IFsgICA1Ny42NTAyMTBdIHJhd25hbmRf
ZW5hYmxlX2NvbnRfcmVhZHM6IGVuZF9wYWdlPTEKPiBbICAgNTcuNjU0ODU4XSBuYW5kX2RvX3Jl
YWRfb3BzOiBjb250X3JlYWQub25nb2luZz0xCj4gWyAgIDU5LjM1MjU2Ml0gbmFuZF9yZWFkX29v
Yl9vcAo+IHBhZ2UgMToKPiBbICAgNTkuMzU1OTY2XSByYXduYW5kX2VuYWJsZV9jb250X3JlYWRz
OiBwYWdlPTEsIGNvbD0wLCByZWFkbGVuPTQwOTYsIG10ZC0+d3JpdGVzaXplPTQwOTYKPiBbICAg
NTkuMzY0MDQ1XSByYXduYW5kX2VuYWJsZV9jb250X3JlYWRzOiBlbmRfcGFnZT0xCj4gWyAgIDU5
LjM2ODc1N10gbmFuZF9kb19yZWFkX29wczogY29udF9yZWFkLm9uZ29pbmc9MAo+IFsgICA2MS4z
OTAwOThdIG5hbmRfcmVhZF9vb2Jfb3AKPiAKPiBJIGhhdmUgbm90IGN1cnJlbnRseSBiYW5kd2lk
dGggdG8gd29yayBvbiB0aGlzIHRvcGljIGFuZCBJIG5lZWQgdG8gdW5kZXJzdGFuZCBob3cgY29u
dGludW91cyByZWFkIGlzIHdvcmtpbmcsIGJ1dCBJIGhhdmUgbWFkZSBhIHBhdGNoIGFuZCBJIGRv
IG5vdCBoYXZlIGlzc3VlcyB3aXRoIGl0IHdoZW4gSSBhbSB1c2luZyBuYW5kZHVtcCBvciBtdGRf
ZGVidWcgdG9vbHMuCgpBY3R1YWxseSBzaW5jZSBteSBwcmV2aW91cyBhbnN3ZXIgSSBtYW5hZ2Vk
IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUuIEkKd2FzIHVuYWJsZSB0byBkbyBpdCBiZWNhdXNlIEkg
d2FzIHRlc3RpbmcgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUKc2Vjb25kIHBhcnRpdGlvbiwgaW5z
dGVhZCBvZiB0aGUgYmVnaW5uaW5nIG9mIHRoZSBkZXZpY2UuIEkgYWxzbwpvYnNlcnZlIHRoZSBz
YW1lIGJlaGF2aW9yLgoKPiBJIGhhdmUgbm90IHRlc3RlZCBpdCBvbiBhIGZpbGUgc3lzdGVtLCBz
byBpdCBpcyBqdXN0IGEgcHJvcG9zYWwuCj4KPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAg
LTM0NjYsMjIgKzM0NjYsMTggQEAgc3RhdGljIHZvaWQgcmF3bmFuZF9lbmFibGVfY29udF9yZWFk
cyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgcGFnZSwKPiAgIAkJCQkgICAg
ICB1MzIgcmVhZGxlbiwgaW50IGNvbCkKPiAgIHsKPiAgIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9
IG5hbmRfdG9fbXRkKGNoaXApOwo+IC0JdW5zaWduZWQgaW50IGVuZF9wYWdlLCBlbmRfY29sOwo+
ICsJdW5zaWduZWQgaW50IGVuZF9wYWdlOwo+IAo+ICAgCWNoaXAtPmNvbnRfcmVhZC5vbmdvaW5n
ID0gZmFsc2U7Cj4gCj4gLQlpZiAoIWNoaXAtPmNvbnRyb2xsZXItPnN1cHBvcnRlZF9vcC5jb250
X3JlYWQpCj4gKwlpZiAoIWNoaXAtPmNvbnRyb2xsZXItPnN1cHBvcnRlZF9vcC5jb250X3JlYWQg
fHwgY29sICsgcmVhZGxlbiA8PSBtdGQtPndyaXRlc2l6ZSkKPiAgIAkJcmV0dXJuOwo+IAo+IC0J
ZW5kX3BhZ2UgPSBESVZfUk9VTkRfVVAoY29sICsgcmVhZGxlbiwgbXRkLT53cml0ZXNpemUpOwo+
ICsJZW5kX3BhZ2UgPSBwYWdlICsgRElWX1JPVU5EX1VQKGNvbCArIHJlYWRsZW4sIG10ZC0+d3Jp
dGVzaXplKSAtIDE7CgpJIGhhZCBhIHNpbWlsYXIgY2hhbmdlIG9uIG15IHNpZGUgc28gSSBiZWxp
ZXZlIHRoaXMgaXMgbmVlZGVkLgoKPiAtCWVuZF9jb2wgPSAoY29sICsgcmVhZGxlbikgJSBtdGQt
PndyaXRlc2l6ZTsKCldlIHNoYWxsIGVuc3VyZSB3ZSBvbmx5IGVuYWJsZSBjb250aW51b3VzIHJl
YWRzIG9uIGZ1bGwgcGFnZXMsIHRvIGF2b2lkCmNvbmZsaWN0cyB3aXRoIHRoZSBjb3JlIHRyeWlu
ZyB0byBvcHRpbWl6ZSB0aGluZ3Mgb3V0LiBTbyBJIGJlbGlldmUKdGhpcyBjaGFuZ2Ugd29uJ3Qg
Zmx5LCBidXQgSSBnZXQgdGhlIGlkZWEsIHRoZXJlIGlzIGRlZmluaXRlbHkKc29tZXRoaW5nIHRv
IGZpeCB0aGVyZS4KCj4gCj4gICAJaWYgKGNvbCkKPiAgIAkJcGFnZSsrOwo+IAo+IC0JaWYgKGVu
ZF9jb2wgJiYgZW5kX3BhZ2UpCj4gLQkJZW5kX3BhZ2UtLTsKPiAtCj4gICAJaWYgKHBhZ2UgKyAx
ID4gZW5kX3BhZ2UpCj4gICAJCXJldHVybjsKPiAKPiBUZWxsIG1lIGlmIHRoaXMgcGF0Y2ggaXMg
YnJlYWtpbmcgdGhlIGNvbnRpbnVvdXMgcmVhZCBmZWF0dXJlIG9yIGlmIGl0IGNhbiBiZSBwdXNo
ZWQgb24gdGhlIG1haWxpbmcgbGlzdC4KCkknbGwgaGF2ZSBkZWVwZXIgbG9vayBpbnRvIHRoaXMg
dG9tb3Jyb3cgYW5kIGdldCBiYWNrIHRvIHlvdS4gVGhhbmtzIGEKbG90IGZvciB0aGUgcHJvcG9z
YWwgdGhvdWdoLCBJIHdpbGwgd29yayBvbiBpdC4KCj4gCj4gUmVnYXJkcywKPiBDaHJpc3RvcGhl
IEtlcmVsbG8uCj4gCj4gPiAgID4gICAgICAgICAgd2hpbGUgKDEpIHsgIAo+ID4gICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgbXRkX2VjY19zdGF0cyBlY2Nfc3RhdHMgPSBtdGQtPmVjY19zdGF0czsK
PiA+IAo+ID4gCj4gPiBJZiB0aGF0IGRvZXMgbm90IHdvcmssIEknbGwgZGVzdHJveSB0aGUgY29u
dGVudCBvZiB0aGUgZmxhc2ggYW5kCj4gPiBwcm9wZXJseSByZXByb2R1Y2UuCj4gPiAKPiA+IFRo
YW5rcywKPiA+IE1pcXXDqGwgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
