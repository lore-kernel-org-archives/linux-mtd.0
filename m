Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79D0C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 10:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgjiFciiGss5XhdT4mLfVbLLlMkHvJDm43oeUm13b0g=; b=el3znifoBGXbBh
	UiHKGfpnLB4m9uHfs5BMivpkkuzxyNseIMliSJXazeWu4mmENGPzz24Q6beJuA3fx4/mkQplZv8Wt
	UmL2cG4qTo41JjzeESJ1Du7fnqaZ32t/3/W00CNwsf+jQCLGtobwoclJwJDM2hM5ROL+4Wn6GFyrI
	SVKibCckvHLDyxwwovBHmmvX9Ncpwm4MJaUQCQOJF9gABXsw8Q/uDLMxPTTq6x7JMQof7W1QhN2m2
	xyGoujPoAoG0EvORnjSgL9WNhJc3i8IfjE00/0ckytwfSFXDBEMMQUUy82XmwjWq6Nz+rbNKHW5cV
	i2O4UxrBOtpkxAkmHUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfarC-00000006YnH-1N87;
	Fri, 03 Jul 2026 10:10:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfar5-00000006YlU-1o8e
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 10:10:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B3514E40C57;
	Fri,  3 Jul 2026 10:10:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50ABA60300;
	Fri,  3 Jul 2026 10:10:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAB20104C8399;
	Fri,  3 Jul 2026 12:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783073438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KUxpJqYYa0VhNofPWE55WEfT0pzSsC+tc3Iw1yJfJ80=;
	b=HKxugvqmlXpYp00MdUMi8LdjB/ut+8I3zFW6xoA9fpxouy34H7l4QeEH1BXYeBOE7FxOE9
	NjQNxmrt6ulvJwxDl30gHKLWJVYbXabaScEloreVGrP+rikqz0/W84cCWMSgkEV6pEPH35
	YSkiOVtvZQmbC5WBMXXMIgbrS71E0PZqMzeP+NCrWcFcX93tadIRVjAQ8A9tfIXM1jxKaI
	SuX6hqE52+3qO6W2bu5QjqYnXPsI0GwvUwtlbNS6AaqWB2b7Uy3ZgKjnQYUoT9jbq9quM1
	lf/0rDB21QVeASXPQ/PTNk8FNmD5by4w2OLHa48KLXakvZE970v99pA5YSpuJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Manikandan.M@microchip.com,  krzk@kernel.org,  pratyush@kernel.org,
  mwalle@kernel.org,  takahiro.kuwano@infineon.com,  richard@nod.at,
  vigneshr@ti.com,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  srini@kernel.org,  Nicolas.Ferre@microchip.com,
  alexandre.belloni@bootlin.com,  claudiu.beznea@tuxon.dev,
  linux@armlinux.org.uk,  richardcochran@gmail.com,  linusw@kernel.org,
  arnd@arndb.de,  michael@walle.cc,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
In-Reply-To: <20260702163723.GA227454-robh@kernel.org> (Rob Herring's message
	of "Thu, 2 Jul 2026 11:37:23 -0500")
References: <20260630092406.150587-1-manikandan.m@microchip.com>
	<20260630092406.150587-2-manikandan.m@microchip.com>
	<20260702-utopian-termite-of-perfection-f1f3ec@quoll>
	<860213fd-6a4b-42d4-a8f7-7308e070f09e@microchip.com>
	<20260702163723.GA227454-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Jul 2026 12:10:32 +0200
Message-ID: <8733y0penb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_031043_613249_3D464F1A 
X-CRM114-Status: GOOD (  13.16  )
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

T24gMDIvMDcvMjAyNiBhdCAxMTozNzoyMyAtMDUsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgoKPiBPbiBUaHUsIEp1bCAwMiwgMjAyNiBhdCAwNjo1NToxNUFNICswMDAwLCBN
YW5pa2FuZGFuLk1AbWljcm9jaGlwLmNvbSB3cm90ZToKPj4gSGkgS3J6eXN6dG9mLAo+PiAKPj4g
T24gNy8yLzI2IDExOjQ2IEFNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiA+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+PiA+IAo+PiA+IE9uIFR1ZSwgSnVuIDMwLCAy
MDI2IGF0IDAyOjU0OjAwUE0gKzA1MzAsIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOgo+
PiA+PiBBZGQgYW4gb3B0aW9uYWwgInNmZHAiIGNoaWxkIG5vZGUgKGNvbXBhdGlibGUgImplZGVj
LHNmZHAiKSB0aGF0Cj4+ID4+IGRlc2NyaWJlcyB0aGUgU0ZEUCBhcyBhIHJlYWQtb25seSBOVk1F
TSBwcm92aWRlciB2aWEgbnZtZW0ueWFtbCwgc28gaXRzCj4+ID4gCj4+ID4gV2hhdCBpcyBTRkRQ
Pwo+PiA+IAo+PiBTRkRQIGlzIHRoZSBTZXJpYWwgRmxhc2ggRGlzY292ZXJhYmxlIFBhcmFtZXRl
cnMgLS0gYSBKRURFQy1zdGFuZGFyZGlzZWQKPj4gKEpFU0QyMTYpIHJlYWQtb25seSBwYXJhbWV0
ZXIgdGFibGUgcHJlc2VudCBpbiBtb3N0IFNQSSBOT1IgZmxhc2hlcywgdGhlIAo+PiB0YWJsZSBj
b250ZW50cyBwcm92aWRlIGJhc2ljIGluZm9ybWF0aW9uIGFib3V0IHRoZSBmbGFzaC4gVGhlcmUg
YXJlIAo+PiBzdGFuZGFyZCB0YWJsZXMgd2hpY2ggYXJlIHNwZWNpZmllZCBieSB0aGUgSkVERUMg
c3RhbmRhcmQgYW5kIHRoZXJlIGFyZSAKPj4gdmVuZG9yIHRhYmxlcy4KPgo+IElzIFNGRFAgcHJl
c2VudCBvciBub3QgZGlzY292ZXJhYmxlPyBPciB3ZSBoYXZlIGEgdGFibGUgb2YgZGlzY292ZXJh
YmxlIAo+IHBhcmFtZXRlcnMgdGhhdCBpdHNlbGYgaXMgbm90IGRpc2NvdmVyYWJsZS4KClNGRFAg
aXMgYWxtb3N0IGFsd2F5cyB0aGVyZS4gSSBkb24ndCB0aGluayB0aGVyZSBhcmUgYW55IG5vbiBT
RkRQIGNoaXBzCm1hbnVmYWN0dXJlZCB0b2RheSAoPykuIFRoZSB0aGluZyBpcywgZXZlbiBpZiB3
ZSBkb24ndCBuZWVkIHRvIGRlZmluZSBpdAppbiBEVCwgd2UgbWlnaHQgbmVlZCB0byBwb2ludCB0
byBpdCBpbiBvcmRlciB0byBleHRyYWN0IGVnLiBhIHVuaXF1ZSBJRApvciBhIE1BQyBhZGRyZXNz
IHRocm91Z2ggdGhlIE5WTUVNIGludGVyZmFjZS4KClNGRFAgaXMgc3BsaXQgaW50byBzZXZlcmFs
IHN1Yi10YWJsZXMsIHRoZSBmaXJzdCBvbmUgaXMgbWFuZGF0b3J5LCBidXQKdGhlbiB0aGVyZSBh
cmUgb3B0aW9uYWwgdGFibGVzIHdoaWNoIGNhbiBiZSBkaXNjb3ZlcmVkIGR5bmFtaWNhbGx5LgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
