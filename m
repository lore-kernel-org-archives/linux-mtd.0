Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8726AC001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uW09Vh2H5HRCbPMGLDY8IAZBwvxaHfWUq4wvAIJTXN8=; b=XvadJu+MlCtGXm
	MSo+4Sd9pn+j+onngBCaxc5vh1se2dpERUxZdANphVX1BOoa7jujiDHSwGmueLCfHzyBxr6Iu1+W/
	vxaYIUOslPThJjNzwolPp9I9/vcMYG/CxCo9brVPeN40xG0nPMsxw30CxOh/u0CGwil8LXJyAVbXK
	vbdtAhqP5eqBEXcZcmOxuSW0YG72y0uGHZQCx8ae/ThjAzp4M/f73Z/hlJqCLdvz5Lc7r+zzW6fHk
	th1GPv5nLvoAnmvjSNvaiViE2FbxMJIIVW41pydmHH1niKcyEHD6mx6BMhAm3QOt0gpLQqHjcQDtG
	qmWnCvjT9GnUWYYcf91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOg8-002oni-38;
	Tue, 08 Aug 2023 15:31:24 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOfq-002omn-2D
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 15:31:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B63C1C0002;
	Tue,  8 Aug 2023 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691508661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+saSUU4i95GfsJnKcmRQztuk49lxmmudM5Ya+X+5DhA=;
	b=UeDkMKfheiFCHa+8W6cgVYpEHQGVXUpsfrqAIpv1xcd7ponr4WJVr3VZRsfKLhvTjvkJ/E
	btKpPQmKSFpQFuqzFGgAGrmglE8SWqaXbbYAayvHOOE7xxdyYBeT3TlwO5N6rFyUiGo5eS
	wczMluH5x4gv8ipbUXz/SxRjnYX+OFJitzTpH52mCnEL41L7SFNm2rWivRXujYgBeoJ9O8
	b+aFzNX1X32XGlMZgZYQeTk6+TQ3/BLTr7jtn0FE3VwAqFNfy9faHCTt/qD+nfbyfAUGVQ
	44DwzHzsP6VptMgvxIc6/eNSlTISJ5DJnp9hIrIaoIYwSVHxxjFVDEH5/xtiiw==
Date: Tue, 8 Aug 2023 17:30:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for sst26vf032b flash
Message-ID: <20230808173059.5fbea615@xps-13>
In-Reply-To: <b2153d9bc6be2923f38a170afd82ba6f@walle.cc>
References: <20230808075001.223150-1-miquel.raynal@bootlin.com>
	<e618ba6c48d67469b9a2c19ee8bb5a1c@walle.cc>
	<20230808102401.26631155@xps-13>
	<b2153d9bc6be2923f38a170afd82ba6f@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_083107_051257_F6AAD3F0 
X-CRM114-Status: GOOD (  37.37  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gVHVlLCAwOCBBdWcgMjAyMyAx
MDozNTowOCArMDIwMDoKCj4gSGksCj4gCj4gPj4gTWhoLCB0aGlzIGZsYXNoIGhhcyB2ZW5kb3Ig
dGFibGVzLiBUaGUgc3N0MjZ2ZiBnbG9iYWwgdW5sb2NrIHNob3VsZAo+ID4+IGJlIGRpc2NvdmVy
YWJsZS4gVGhlcmUgaXMgYSB0YWJsZSB3aXRoIGFsbCBzdXBwb3J0ZWQgb3Bjb2Rlcywgd2hpY2gK
PiA+PiBjb3VsZCBiZSB1c2VkIHRvIHNlZSB3aGV0aGVyIHRoaXMgZmxhc2ggbmVlZHMgdGhlIGds
b2JhbCB1bmxvY2suICAKPiA+IAo+ID4gSXMgdGhpcyBsb2dpYyBhbHJlYWR5IGV4aXN0aW5nIGlu
IHRoZSBjb3JlPyAgCj4gCj4gTm8gdW5mb3J0dW5hdGVseSBub3QuCj4gCj4gPiBEbyB5b3UgaGF2
ZSBhIHBvaW50ZXI/ICAKPiAKPiBJdCBzZWVtcyB0aGF0IHdlJ2QgbmVlZCB0byBoYXZlIHNvbWUg
a2luZCBvZiBwYXJzZXIgc3VwcG9ydCBmb3IKPiB2ZW5kb3Igc3BlY2lmaWMgU0ZQRCB0YWJsZXMu
IFRoZW4gbG9vayBmb3IgdGhlIHNzdDI1dmYgZmFtaWx5Cj4gYW5kIHRoZSBhdmFpbGFiaWxpdHkg
b2YgdGhlIGdsb2JhbCB1bmxvY2sgY29tbWFuZCwgaWYgYm90aCBpcwo+IHNhdGlzZmllZCwgc2V0
IHRoZSBsb2NraW5nIG9wcy4KCkRvIHlvdSBtaW5kIGlmIHdlIGFjdHVhbGx5IHRha2UgdGhhdCBv
bmUgd2hpY2gsIG9uIHRoaXMgcmVnYXJkIHNob3VsZApiZSBhYnNvbHV0ZWx5IGlkZW50aWNhbCB0
byB0aGUgZXhpc3RpbmcgNjRiIGVudHJ5PwoKSWYgb25lIGV2ZXIgYnJpbmdzIHRoZSBsb2dpYyB5
b3UgZGVzY3JpYmVkIEknbGwgYmUgcGxlYXNlZCB0byB0ZXN0IGl0CmFzIGxvbmcgYXMgSSBoYXZl
IHRoZSBib2FyZC4KCj4gPj4gSSdkIGxpa2UgdG8gcHVzaCBhcyBtdWNoIGFzIHBvc3NpYmxlIGlu
dG8gYXV0by1kaXNjb3ZlcmluZwo+ID4+IGZlYXR1cmVzLi4gYWZ0ZXIgd29ya2luZyBvbiB0aGF0
IGZsYXNoIGRiIGNsZWFudXAuICAKPiA+IAo+ID4gSSB1bmRlcnN0YW5kLCBidXQgYXMgSSBzYWlk
LCB0ZXN0aW5nIGxhdGVzdCB2ZXJzaW9ucyBvZiB0aGUga2VybmVsIG9uCj4gPiBteSBoYXJkd2Fy
ZSBpcyBub3Qgc3RyYWlnaHRmb3J3YXJkLgo+ID4gICAKPiA+PiA+IENoYW5nZXMgaW4gdjM6Cj4g
Pj4gPiAqIERyb3BwZWQgdGhlIHNlY29uZCBwYXRjaCAodW50ZXN0ZWQgY2hhbmdlcyBhcyBhZHZp
c2VkIGJ5IFR1ZG9yKS4KPiA+PiA+ICogQXZvaWRlZCBwbGF5aW5nIHdpdGggbG9ja2luZyBhcyBJ
IGNhbm5vdCB0ZXN0IGl0IGVpdGhlcjogc2ltcGxpZmllZAo+ID4+ID4gICB0aGUgZGlmZiBieSBq
dXN0IHVzaW5nIHRoZSBQQVJTRV9TRkRQIGZsYWcuCj4gPj4gPiAqIFJlYmFzZWQgb24gdG9wIG9m
IC1yYzEgYW5kIGFkYXB0ZWQgdGhlIHBhdGNoIHRvIHRoZSBjdXJyZW50IHN0YXRlLgo+ID4+ID4K
PiA+PiA+ICBkcml2ZXJzL210ZC9zcGktbm9yL3NzdC5jIHwgNCArKysrCj4gPj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4+ID4KPiA+PiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9zcGktbm9yL3NzdC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYwo+ID4+ID4g
aW5kZXggNjg4ZWIyMGM3NjNlLi40MTRlZTQ2OTJmZDEgMTAwNjQ0Cj4gPj4gPiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL3NzdC5jCj4gPj4gPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3Nz
dC5jCj4gPj4gPiBAQCAtMTExLDYgKzExMSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNo
X2luZm8gc3N0X25vcl9wYXJ0c1tdID0gewo+ID4+ID4gIAkJCSAgICAgIFNQSV9OT1JfUVVBRF9S
RUFEKSB9LAo+ID4+ID4gIAl7ICJzc3QyNnZmMDE2YiIsIElORk8oMHhiZjI2NDEsIDAsIDY0ICog
MTAyNCwgMzIpCj4gPj4gPiAgCQlOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxf
UkVBRCkgfSwKPiA+PiA+ICsJeyAic3N0MjZ2ZjAzMmIiLCBJTkZPKDB4YmYyNjQyLCAwLCAwLCAw
KQo+ID4+ID4gKwkJRkxBR1MoU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfU1dQX0lTX1ZPTEFU
SUxFKQo+ID4+ID4gKwkJUEFSU0VfU0ZEUAo+ID4+ID4gKwkJLmZpeHVwcyA9ICZzc3QyNnZmX25v
cl9maXh1cHMgfSwKPiA+PiA+ICAJeyAic3N0MjZ2ZjA2NGIiLCBJTkZPKDB4YmYyNjQzLCAwLCA2
NCAqIDEwMjQsIDEyOCkKPiA+PiA+ICAJCUZMQUdTKFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9S
X1NXUF9JU19WT0xBVElMRSkKPiA+PiA+ICAJCU5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9O
T1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpICAKPiA+PiA+PiBIb25lc3RseSwgdGhp
cyBpcyBzdWNoIGEgbWVzcy4gVGhlcmUgYXJlIHRocmVlIGlkZW50aWNhbCBjaGlwczogIAo+ID4+
IHNzdDI2djAxNmIsIDAzMmIgYW5kIDA2NGIgYW5kIGFsbCBoYXZlIGRpZmZlcmVudCBmbGFncyA6
KCAgCj4gPiAKPiA+IEkgb25seSBoYXZlIHRoZSAzMmIgdmFyaWFudCwgYnV0IEkgYmVsaWV2ZSB0
aGV5IGFyZSBhbGwgaWRlbnRpY2FsLiBUaGUKPiA+IEZMQUdTIGFuZCBmaXh1cHMgZmllbGRzIGFy
ZSBtaXNzaW5nIGZyb20gdGhlIDE2YiB2YXJpYW50IGluIG1haW5saW5lCj4gPiBidXQgdGhleSBh
cmUgYWxsIGlkZW50aWNhbCBpbiB0aGUgbGludXg0bWljcm9jaGlwIHJlcG9zaXRvcnksIEkgYmVs
aWV2ZQo+ID4gdGhlIG1pc3NpbmcgcGF0Y2hlcyBoYXZlIG5ldmVyIGJlZW4gdXBzdHJlYW1lZCwg
dGhhdCdzIGFsbC4KPiA+IAo+ID4gQW5kIEkgYW0gbm93IHVzaW5nIHRoZSBQQVJTRV9TRkRQIGZs
YWcgYXMgYWR2aXNlZCBiZWNhdXNlIGl0IHdvcmtzLCBidXQKPiA+IGluaXRpYWxseSBJIHdhbnRl
ZCB0byBrZWVwIHRoZSBoYXJkY29kZWQgZmxhZ3MuICAKPiAKPiBBaCBzb3JyeSwgSSB3YXMganVz
dCBzdGF0aW5nIGEgZmFjdCwgbm90IGNyaXRpY2l6aW5nIHlvdXIgcGF0Y2guIFRoZXJlCj4gYXJl
IGFsc28gb3RoZXIgcGxhY2VzIGluIHRoZSBmbGFzaF9pbmZvIGRiIHdpdGggc3VjaCBhIG1lc3Mu
IEJ1dCB3aXRoCj4gdGhlIGN1cnJlbnQgcnVsZSAibm90IHRvIHRvdWNoIGFueXRoaW5nIHVudGVz
dGVkIiBJIGd1ZXNzIHRoYXQgaXMKPiB3aGF0IHdlIGdldC4gRnVubnkgZW5vdWdoLCB2ZW5kb3Ig
dHJlZXMgc2VlbSB0byBmaXggJ2VtLgoKOy0pCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
