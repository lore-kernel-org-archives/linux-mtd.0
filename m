Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D15ECD993
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HI/uRPABPxvG9S0aIUiCaN/nupKzz8WeQKAMztgfwdI=; b=dUOZ7wX43xJHvm
	aVVA1oXZDLK06pgY57Rb6nOhts7GbshU/3LeoR6EvR12uGSn7BKvNJeQZcUqdjfv0nq725ZejrTbR
	kyWBgWCNz97izuKlHrVAzah/J7m/wU4a9qsM01MI8QNsEipIda3JiVxUDnpN0wPylu88rGDFFVnVN
	JH4zuCQTHhmJVMkrNdRgxOpp8j37T+bgFhJfSN2gomRbD7K6qHphFwI6rrP7CwHjJQExSaJElcumz
	cXUjJzaSsaTJSanIAPx3HKo+yQDgU9BhroqnJxdScAalikJy1oSPWpvUnXTlpvwnx+iKGMYoGItJc
	9c03h09ifT9GZyNGV1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3FD-0000000AISy-1Tl5;
	Thu, 05 Feb 2026 17:34:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3F9-0000000AISM-34kJ
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:34:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9851A1A2C31
	for <linux-mtd@lists.infradead.org>; Thu,  5 Feb 2026 17:34:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DDEB6074D;
	Thu,  5 Feb 2026 17:34:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BD70102F1B6D;
	Thu,  5 Feb 2026 18:34:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770312851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xv3D4MHpekKTqeVvmwQRXxftSB+jQG+0xkfUDkkrFE0=;
	b=Y4cMb5hiK6hrywbwv6QUkfc3iLE78cmu/42KkasTAoxx6ksnJrHYr96KgtcCpjmr7m9yZ2
	elulqXOTdG4gLlapqTWOmFQBtUa8FKZHajAc7gRGgM1EqNzSQuxLXvj8gy2tIU8OLJhGnN
	YVQpcL87726sK+tXk7tw75hAc5wv/jz0NKxIBfkGfz2Y2jJd0JsIn5lwq5hQM1fQJ2VLIY
	V1wydXix0PaKo3SD9UEcc1NuPfmQNSzNPhbXS4mNXIeE3QGLm5/i2HVYmHoilA/CnhJVRM
	EaMR5pmB5//Rj1QtGQFOpvBMKLD+LS1rgr8URHjO1NWcS+hgcdZn71vdPl6wFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
In-Reply-To: <aYS93aJ_TlN3C3-T@smile.fi.intel.com> (Andy Shevchenko's message
	of "Thu, 5 Feb 2026 17:57:17 +0200")
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
	<aYO2IPsoxmDtTsec@smile.fi.intel.com> <87a4xnfu8j.fsf@bootlin.com>
	<aYS93aJ_TlN3C3-T@smile.fi.intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:34:07 +0100
Message-ID: <87y0l7gkmo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_093416_054611_4469D810 
X-CRM114-Status: GOOD (  16.01  )
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

T24gMDUvMDIvMjAyNiBhdCAxNzo1NzoxNyArMDIsIEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNo
ZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gT24gVGh1LCBGZWIgMDUsIDIwMjYg
YXQgMDk6NTE6NTZBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gT24gMDQvMDIvMjAy
NiBhdCAyMzoxMjowMCArMDIsIEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPj4gPiBPbiBXZWQsIEZlYiAwNCwgMjAyNiBhdCAwMjoyNToy
N0FNICswMTAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+ID4+IENvbXBpbGVyIGlzIG5vdCBo
YXBweSBhYm91dCB1c2VkIHN0YWNrIGZyYW1lOgo+PiA+PiAKPj4gPj4gZHJpdmVycy9tdGQvY2hp
cHMvY2ZpX2NtZHNldF8wMDAxLmM6IEluIGZ1bmN0aW9uICdkb193cml0ZV9idWZmZXInOgo+PiA+
PiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYzoxODg3OjE6IGVycm9yOiB0aGUg
ZnJhbWUgc2l6ZSBvZiAxMjk2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEyODAgYnl0ZXMgWy1XZXJy
b3I9ZnJhbWUtbGFyZ2VyLXRoYW49XQo+PiA+PiAKPj4gPj4gRml4IHRoaXMgYnkgZmFjdG9yaW5n
IG91dCBkb193cml0ZV9idWZmZXJfbG9ja2VkKCkuCj4+ID4KPj4gPiBNeSBnb3NoLCBJIGFscmVh
ZHkgc2VudCBhIHYyIGVhcmxpZXIgYW5kIHRoZXJlIHdlcmUgc29tZSByZXBsaWVzLAo+PiA+IEkg
bmVlZCB0byBjaGVjay4uLgo+PiAKPj4gSSdtIG5vdCBzdXJlIEkgZ2V0IHdoYXQgeW91IG1lYW4g
aGVyZT8gSSBnb3Qgbm8gcmVwbHkgKGluIG15IGluYm94KSB0bwo+PiB5b3VyIHYyLiBJIGFtIGxl
dHRpbmcgYSBiaXQgb2YgdGltZSBmb3IgVmlnbmVzaCB0byB0YWtlIGEgbG9vaywgYnV0IEkKPj4g
a25vdyBoZSdzIGJ1c3kgc28gSSBtaWdodCB0YWtlIGl0IG5ldmVydGhlbGVzcyBieSB0aGUgZW5k
IG9mIHRoZSB3ZWVrIGFzCj4+IHdlIGFyZSBhcHByb2FjaGluZyB0aGUgbWVyZ2Ugd2luZG93Lgo+
Cj4gSSBnb3Qgc29tZSBzdHJhbmdlIExLUCByZXBvcnRzLCBJIG5lZWQgdG8gY2hlY2sgdGhlbS4K
PiBQbGVhc2UsIGRpc2NhcmQgdGhpcyBlbWFpbCB0aHJlYWQgYXMgd2UgaGF2ZSBpdCB0aGVyZQo+
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDEyNDEzMzczMC4zNDU0MjQxLTEtYW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tCgpBaCwgdGhpcyBkaWQgbm90IHJlYWNoIG15
IGluYm94LCBtYXJrZWQgU1BBTS4uLiBJJ2xsIGRpc2NhcmQgdGhpcyBwYXRjaApmb3IgdGhpcyBj
eWNsZSwgZmVlbCBmcmVlIHRvIHJlc2VuZCBvbmNlIHRoZSByZXBvcnQgaGFzIGJlZW4gZmlndXJl
ZApvdXQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
