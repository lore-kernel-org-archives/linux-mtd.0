Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F8BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIoTgyTqJVbwIx5HEUyUenl+BV0XG/zki0/1KXcRxwc=; b=dFUKzdJ2wfNvpJ55StiiBlCjFf
	dz5TaTOgNVvcr92JkpcsmH5wDMsq14v1st1UY9AFVZs6uOhq3oDuPdo2gW7v8FrWjE7lCwlwPmfrO
	RS1V8zfDTkWBEsP6w0mFE4mH4AoStWq+yNonzBvIE5UykLdoP227ufN9bnfaXTEGdVrA6FkYUYcf8
	vwgAUhwvXZsDqIdWEk6n0hKVZgJ7p0PjKHp4x/y9HT8R+K/MCKNbCKgBDTH89b80UR6tp4rsnfloO
	edP/K2zpWVSpWK0E1ofEdsWyGZ2k0Q3CrB71Lmu1QpkEKjO83J5GW6q9K8xn/6S/QjtXtXM7UoYg1
	dH3Qlkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP21q-00Gf40-5K; Tue, 01 Mar 2022 12:54:58 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP21U-00Gez6-Bi; Tue, 01 Mar 2022 12:54:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8DC7522239;
 Tue,  1 Mar 2022 13:54:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646139274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFlFxRBWoezk6edRdSAVsK+0AAKsFQiPQjx4VLgNS64=;
 b=fBy/wSQv2zeMlrR4wxWAXE4ceuk+oLH/Sfue3AHFC2rgtX1RIMEBNzhSb/5/NbwIR7XyQP
 h6z3YKPDFLcikzfvnnbyg+pnOJrHPDfkCXS9MwhoQmMdu12gyx3fQQR74p0X3nAABer79n
 eJ7u94q2i5WuD9Trpkd9sfXSHb5Foms=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 13:54:34 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: heiko.thiery@gmail.com, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
In-Reply-To: <6af32b60-b508-1c17-7e5c-c453feeabf37@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
 <ba3a7bd546934ee0174480a01c505663@walle.cc>
 <0210b628-a331-d935-6319-bc9fe737fe15@microchip.com>
 <f04908c3d761220d8efad70ac244bb84@walle.cc>
 <6af32b60-b508-1c17-7e5c-c453feeabf37@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <683e74eb59cc636ddfcddd750517fd2f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_045436_603544_495EFA19 
X-CRM114-Status: GOOD (  15.08  )
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

QW0gMjAyMi0wMy0wMSAxMzo0Niwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy8xLzIyIDE0OjM2LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIyLTAzLTAxIDExOjUyLCBzY2hy
aWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4+IE9uIDMvMS8yMiAxMjozOCwgTWlj
aGFlbCBXYWxsZSB3cm90ZToKPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSAKPj4+PiBrbm93Cj4+Pj4gdGhlIGNvbnRl
bnQgaXMgc2FmZQo+Pj4+IAo+Pj4+IEFtIDIwMjItMDMtMDEgMTE6MjksIHNjaHJpZWIgSGVpa28g
VGhpZXJ5Ogo+Pj4+PiBIaSBUdWRvciwKPj4+Pj4gCj4+Pj4+IEFtIERpLiwgMS4gTcOkcnogMjAy
MiB1bSAxMDo1NiBVaHIgc2NocmllYiBUdWRvciBBbWJhcnVzCj4+Pj4+IDx0dWRvci5hbWJhcnVz
QG1pY3JvY2hpcC5jb20+Ogo+Pj4+Pj4gCj4+Pj4+PiBIaSwgSGVpa28sCj4+Pj4+PiAKPj4+Pj4+
IFdvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCBzZXQgb24gdG9wIG9mOgo+Pj4+Pj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjIwMjI4MTM0NTA1LjIwMzI3MC0x
LXR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbS8KPj4+Pj4gCj4+Pj4+IFdoZW4gYXBwbHlpbmcg
dGhhdCBzZXJpZXMgdGhlIGZsYXNoIHdpbGwgYmUgcHJvcGVybHkgZGV0ZWN0ZWQuCj4+Pj4+IAo+
Pj4+PiBbwqDCoMKgIDEuMzIyNjU1XSBzcGktbm9yIHNwaTAuMDogbXgyNWwxMjgzNWYgKDE2Mzg0
IEtieXRlcykKPj4+Pj4gCj4+Pj4+IFRoYW5rcwo+Pj4+IAo+Pj4+IEJ1dCBkb2Vzbid0IHRoYXQg
bWVhbiB0aGF0IHRoZSBwcmV2aW91cyBzZXJpZXMgaW50cm9kdWNlcwo+Pj4+IHBvc3NpYmxlIHJl
Z3Jlc3Npb25zIGZvciBvdGhlciBmbGFzaGVzLCB0b28/Cj4+Pj4gCj4+PiBubywgYmVjYXVzZSB0
aGUgb3RoZXIgZmxhc2hlcyBhcmUgdXNpbmcgdGhlIGRlcHJlY2F0ZWQgd2F5IG9mCj4+PiBpbml0
aWFsaXppbmcKPj4+IHBhcmFtZXRlcnMgd2hpY2ggY2FsbHMgZGVmYXVsdF9pbml0KCkgaG9va3Mu
Cj4+IAo+PiBhaGggcmlnaHQhCj4+IAo+PiBCdXQgd2Ugc2hvdWxkIGNsZWFyIHRoZSBxdWFkX2Vu
YWJsZSBpbiB0aGUgY2FzZSB0aGUgU0ZEUCBkb2Vzbid0Cj4+IHNwZWNpZnkgaXQuIFJpZ2h0IG5v
dywgd2UgYXJlIGZhbGxpbmcgYmFjayB0byBhIGZ1bmN0aW9uCj4+IHdoaWNoIGRvZXNuJ3QgbWFr
ZSBzZW5zZSwgYW5kIG1pZ2h0IGV2ZW4gYmUgaGFybWZ1bC4KPj4gCj4gCj4gZG8geW91IG1lYW4g
dGhlIG9uZSBzZXQgaW4gdGhlIGRlZmF1bHRfaW5pdCgpIGhvb2sgZm9yIG1hY3Jvbml4PyB3ZSAK
PiBzaG91bGQKPiBnZXQgcmlkIG9mIHRoZSBkZWZhdWx0X2luaXQoKSwgeWVzLiBXZSBzaG91bGQg
dXNlIFNGRFAgd2hlcmUgcG9zc2libGUsIAo+IHdoZXJlCj4gbm90IHBvc3NpYmxlIHdlIHNob3Vs
ZCB1c2UgdGhlIGxhdGVfaW5pdCgpIGhvb2sgdG8gc2V0IHRoZSBRdWFkIEVuYWJsZSAKPiBtZXRo
b2QuCgpUaGUgb25lIHdlIHNldCBpbiBzcGlfbm9yX2luaXRfZGVmYXVsdF9wYXJhbXMoKSwgaXMg
dGhhdCBwbGFubmVkIHRvIGJlIApyZW1vdmVkLAp0b28/CgpJIHdhcyB0aGlua2luZyBhYm91dCBz
b21ldGhpbmcgYWxvbmcgdGhlIGZvbGxvd2luZyBwYXRjaDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbXRkLzIwMjIwMzAxMTI0OTM1LjI4OTM2MjItMS1taWNoYWVsQHdhbGxlLmNjLwoK
LW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
