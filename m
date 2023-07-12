Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DD6EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmsnvZkFlBJ2jmUv9ejbeuZjxrO2Vyf3LVZ/t/5Tj3s=; b=xhQByptpDW0r3k
	hgpdbr3cbnvnr8A619IjRle8ACZm6QLLUxWgOIb4IFQoNnAPzajfHigummjA0+MzwwRXG/JavrQmd
	qpAzLGjb3jBkSWU2WHHdFc1EYWWvHsSUrI9OjIGegXcrv5V8+y3XdmNwbH1U07ydWareka0xGbYUq
	cCWs9kzmQLAZNh5zJgO01kDei78pXtsKcCHaKD4l8Oaeua8CsneUyFgTF/7Cge22772QGMFBBDQGq
	pPhxPlCL3m0GByV4kHAMYK3eC/rf2N5Ym1+I7jxgmVHMNyOjkOOq/JK/4LyxV7m/q6Grhcj+JTcaf
	rHqEjwOVatlmPjIgzJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZ1I-00HXXR-0U;
	Wed, 12 Jul 2023 12:32:36 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZ1B-00HXWP-1m
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 12:32:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0559D24000C;
	Wed, 12 Jul 2023 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689165146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMAmlAAfV/E3+8xeb2DY6C2+zCz1wmbuPYuto9/gghs=;
	b=UIBF8vAIz5VH3xswnjijkgkjrvCSy+4uPDwLYpvSwymiFlzJz4j1cFtt/yUspvcmzqK4gx
	EGE/KIKQliTr6P5p7ZFxIf4Xb40v5dQQ/zgKyWgmUS+nhjM3NmvvPrgoUs6ZAqjSgKUS9e
	fTGWEW3kcixsXElORuQ75dMrpu6ciq/iv5CVyyQvTtlV3402JqUShoUQVU/95L8fFffnd2
	8jg9i10QjT7qIkILpdq+uLXnsHED36kbzME51KUa59jFalwQIWEUbmcfLOMGQ0G4wPSwsC
	qDFwMbVMVrY26baRGsd47JnlMURXmPAXCcAOF6pyRQjnrJxGsbTYWLBqOVCQMg==
Date: Wed, 12 Jul 2023 14:32:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 gregory.clement@bootlin.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: Add AC5 specific binding
Message-ID: <20230712143220.06a3d6eb@xps-13>
In-Reply-To: <20230703035044.2063303-2-chris.packham@alliedtelesis.co.nz>
References: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
	<20230703035044.2063303-2-chris.packham@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_053229_743346_4B51B417 
X-CRM114-Status: GOOD (  14.15  )
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

SGkgQ2hyaXMsCgpjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gTW9u
LCAgMyBKdWwgMjAyMyAxNTo1MDo0MgorMTIwMDoKCj4gQWRkIGJpbmRpbmcgZm9yIEFDNSBTb0Mu
IFRoaXMgU29DIG9ubHkgc3VwcG9ydHMgTkFORCBTRFIgdGltaW5ncyB1cCB0bwo+IG1vZGUgMyBz
byBhIHNwZWNpZmljIGNvbXBhdGlibGUgdmFsdWUgaXMgbmVlZGVkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4KPiBB
Y2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkkgbmVl
ZCBEVC1iaW5kaW5nIG1haW50YWluZXIncyBhY2sgdG8gdGFrZSB0aGlzIHBhdGNoLCBidXQgdGhp
cyBjb21taXQKZGlkIG5vdCByZWNlaXZlIGZlZWRiYWNrIChwb3NpdGl2ZSBvZiBuZWdhdGl2ZSkg
ZnJvbSB0aGVtIGFuZCBpcyBubwpsb25nZXIgaW4gdGhlaXIgcGF0Y2h3b3JrLiBDYW4geW91IHBs
ZWFzZSByZXNlbmQgdGhlIHNlcmllcz8KClRoZSBvdGhlciBwYXRjaGVzIExHVE0uCgoKPiAtLS0K
PiAKPiBOb3RlczoKPiAgICAgQ2hhbmdlcyBpbiB2MzoKPiAgICAgLSBDb2xsZWN0IGFjayBmcm9t
IENvbm9yCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgIC0gS2VlcCBjb21wYXRpYmxlcyBpbiBh
bHBoYWJldGljYWwgb3JkZXIKPiAgICAgLSBFeHBsYWluIEFDNSBsaW1pdGF0aW9ucyBpbiBjb21t
aXQgbWVzc2FnZQo+IAo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbCxuYW5k
LWNvbnRyb2xsZXIueWFtbCAgICAgICAgIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL21hcnZlbGwsbmFuZC1jb250cm9sbGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwsbmFuZC1jb250cm9sbGVyLnlhbWwKPiBpbmRleCBh
MTA3MjliYjE4NDAuLjFlY2VhODQ4ZThiOSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwsbmFuZC1jb250cm9sbGVyLnlhbWwKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwsbmFuZC1jb250
cm9sbGVyLnlhbWwKPiBAQCAtMTYsNiArMTYsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAg
LSBjb25zdDogbWFydmVsbCxhcm1hZGEtOGstbmFuZC1jb250cm9sbGVyCj4gICAgICAgICAgICAt
IGNvbnN0OiBtYXJ2ZWxsLGFybWFkYTM3MC1uYW5kLWNvbnRyb2xsZXIKPiAgICAgICAgLSBlbnVt
Ogo+ICsgICAgICAgICAgLSBtYXJ2ZWxsLGFjNS1uYW5kLWNvbnRyb2xsZXIKPiAgICAgICAgICAg
IC0gbWFydmVsbCxhcm1hZGEzNzAtbmFuZC1jb250cm9sbGVyCj4gICAgICAgICAgICAtIG1hcnZl
bGwscHhhM3h4LW5hbmQtY29udHJvbGxlcgo+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBsZWdhY3kg
YmluZGluZ3MKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
