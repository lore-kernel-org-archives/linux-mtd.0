Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F6FC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgBKhEjht35bM0p8krqpFtQjKtoQzz03zAIczgCsGSg=; b=mi67tm4a6hg8Gq
	Ik00ZP6ghm1Sdy58RZESdpxIDvb4J1X5LPOiukOiy1YoWeEF5N4WIRDAAzg+rIOSgtON+AcSZejPx
	0FqO+Ry5jlL5H6PoUUTk4RI/wJZQZMfWdvDF9QEdgLpcBff3QrZ6GLG/h97GwY94GfZwAJyFEXas6
	nQ4ziAU7myHEsDbzX9K0A0DhyEvQE9sX0fp47RYMuMjDNTU33mFVwBGOogZoathUppZaQMiCQavlg
	5toeuMl1hZx2Nnuh5VPDE5XGpuXnqXItlK4v1EdU1M8TxsOGG3qBhGVVjQyGAG+saaNTlRKdADUi/
	2Osq11KbGgWe9HPwKgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybCV-008IV7-TK; Tue, 07 Jun 2022 15:32:59 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybCS-008IQn-Vp
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 15:32:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 344251C0010;
	Tue,  7 Jun 2022 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654615969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHjzMD4vmwG0ozVdVrMEGkBmEoFpQoQXe/SoAASaRuQ=;
	b=PHcWjp5vcHn3qMYkMqBEchshUHD6RWm+dMvkxdNED2UXeBBhiN6gWWq5y+Pyc/GS8+By1d
	jTFuJKSZowAhmp+eyOrxzHhbqxn5FSGfFH4r6wi1/06dRf8e596tCVpieh4+gGsow/O6wt
	aB8mzCXoQAYjZb23JRSKZjwfd2K74cAnOHJtQwjG54hhclYNefnR1ZJOo1UPlAt4b1mQnL
	GWg+Q+B0tmBkjd5QoUzrHGxlocuMNyhGmNggNOejZA98G6o2VwiCNFjU9SKTNQDxFzG7Jz
	5b4f0oDKyDdTmcIAd747XWISwx1jFMWB4OG9ZN6UJezlCOibtLkUYLDnoaP/Ng==
Date: Tue, 7 Jun 2022 17:32:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Yang Yingliang <yangyingliang@huawei.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Arvind Yadav
 <arvind.yadav.cs@gmail.com>, Lee Jones <lee.jones@linaro.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 4/4] mtd: st_spi_fsm: Simplify error checking in
 .probe() a bit
Message-ID: <20220607173244.7c1cdd16@xps-13>
In-Reply-To: <20220607152458.232847-5-u.kleine-koenig@pengutronix.de>
References: <20220607152458.232847-1-u.kleine-koenig@pengutronix.de>
	<20220607152458.232847-5-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_083257_189876_506F4F55 
X-CRM114-Status: GOOD (  19.24  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFR1ZSwgIDcg
SnVuIDIwMjIgMTc6MjQ6NTggKzAyMDA6Cgo+IEluc3RlYWQgb2YgZW5kaW5nIGVhY2ggaWYgYnJh
bmNoIHdpdGggdGhlIHNhbWUgY2hlY2ssIGRvIGl0IG9uY2UKPiB1bmNvbmRpdGlvbmFsbHkgYWZ0
ZXIgdGhlIGlmIGJsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gTm90IGVudGlyZWx5IHN1cmUg
dGhpcyBpcyBhbiBvYmplY3RpdmUgaW1wcm92ZW1lbnQsIGJ1dCBJIGxpa2UgaXQgYmV0dGVyCj4g
dGhpcyB3YXkuCj4gCj4gSXQgY291bGQgYmUgc2hvcnRlZCBvbmUgc3RlcCBmdXJ0aGVyIGJ5IGRv
aW5nCj4gCj4gCXJldCA9IChpbmZvLT5jb25maWcgPzogc3Rmc21fcHJlcGFyZV9yd2Vfc2Vxc19k
ZWZhdWx0KShmc20pOwo+IAlpZiAocmV0KQo+IAkJZ290byBlcnJfY2xrX3VucHJlcGFyZTsKPiAK
PiBidXQgSU1ITyByZWFkYWJpbGl0eSBzdWZmZXJzIGhlcmUuCgpDbGVhcmx5LCB5ZXMsIEkgdGhp
bmsgeW91IG9wdGVkLW91dCBmb3IgdGhlIHJpZ2h0IG9wdGltaXphdGlvbiBpbiB0aGUKZW5kLgoK
PiAKPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMgfCAxMSArKysrLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyBiL2RyaXZlcnMvbXRk
L2RldmljZXMvc3Rfc3BpX2ZzbS5jCj4gaW5kZXggOWY2ZDRkZDhiYWRlLi41NDg2MWQ4ODljMzAg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKPiArKysgYi9k
cml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwo+IEBAIC0yMDg0LDE1ICsyMDg0LDEyIEBA
IHN0YXRpYyBpbnQgc3Rmc21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
CSAqIENvbmZpZ3VyZSBSRUFEL1dSSVRFL0VSQVNFIHNlcXVlbmNlcyBhY2NvcmRpbmcgdG8gcGxh
dGZvcm0gYW5kCj4gIAkgKiBkZXZpY2UgZmxhZ3MuCj4gIAkgKi8KPiAtCWlmIChpbmZvLT5jb25m
aWcpIHsKPiArCWlmIChpbmZvLT5jb25maWcpCj4gIAkJcmV0ID0gaW5mby0+Y29uZmlnKGZzbSk7
Cj4gLQkJaWYgKHJldCkKPiAtCQkJZ290byBlcnJfY2xrX3VucHJlcGFyZTsKPiAtCX0gZWxzZSB7
Cj4gKwllbHNlCj4gIAkJcmV0ID0gc3Rmc21fcHJlcGFyZV9yd2Vfc2Vxc19kZWZhdWx0KGZzbSk7
Cj4gLQkJaWYgKHJldCkKPiAtCQkJZ290byBlcnJfY2xrX3VucHJlcGFyZTsKPiAtCX0KPiArCWlm
IChyZXQpCj4gKwkJZ290byBlcnJfY2xrX3VucHJlcGFyZTsKPiAgCj4gIAlmc20tPm10ZC5uYW1l
CQk9IGluZm8tPm5hbWU7Cj4gIAlmc20tPm10ZC5kZXYucGFyZW50CT0gJnBkZXYtPmRldjsKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
