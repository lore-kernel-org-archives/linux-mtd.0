Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F660C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csL7rdfA6wWnK+zvq6kfN7AXy2Vy1qyc1fJGwPg1KWY=; b=JYnD8PwXA0oo1H
	KEqjNqd/9Umsyl0wyknxjtLEj1QVmAc5zevotTSVSSbqxaGARaEftNo7dB/yt6htQq1/Y+G1m43bG
	eZIOdiSNJMoSI0heo8In7HIrItFFDJoJtZ/Kwg0n3QUtVhECZcG2FyGV8wZQik39DtzD7K62v9lgy
	G6CmsxmVbttXb6RjV/gPXMGm8hATatwZrE2lVp/3bqhDLWyPY4ArR9m/ipmG5vlGPiY+bi5CkSKdj
	9tMIPt/IsVwAOUM3rH3Vfico+gEf+eeV0qK7hdRdiyP5ksORcdo9o2aGkUP7YLTl2afeQW+7HigNF
	bbk34r+/8TcxVSKPDQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjDk-0000000CYMe-0zKh;
	Mon, 06 Jul 2026 13:18:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjDc-0000000CYKd-1yc0
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 13:18:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B4991A0E90;
	Mon,  6 Jul 2026 13:18:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66252601A2;
	Mon,  6 Jul 2026 13:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C780C11BB817F;
	Mon,  6 Jul 2026 15:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783343901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U0UUTPXYOIMUbfKiPj5WyHNGQxtCYRhMQN2tHOjGjGI=;
	b=cSoSugduSkj26OSLyr0eg4z0X07uDcmEPgzzCoZ4G5miflrsmGdrvIOatE6BgNtt0iiJG6
	WzZpJnWsVmaHT/XKbJvTYwstnmDNVbAQIbbye7xFfNThHAc/4DCIe7/4VWXaHPv7mYD8LI
	8tvomJnUel812gpqO7ixkDOfIEjlPHZvFfr7+1u0OBmkL0DKLzqiAGDYNpUUuCR37CUEdl
	2u6zoFIvF6O6NOfT0AJvy41LYQ9MlvJdeK2JuT8wX+DWqzJDyM+w19IfLUxDqCBEpIDMTs
	vf7X/F247KGIweN/KPkCdGoAjLG/zvWHvtjsW72LkuiRzQrCA+4jXNzVPJhoOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Manivannan
 Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
In-Reply-To: <akult0UUSSwKQ8F5@linaro.org> (Stephan Gerhold's message of "Mon,
	6 Jul 2026 14:55:26 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
	<akult0UUSSwKQ8F5@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 15:18:18 +0200
Message-ID: <875x2smf39.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_061841_071594_541C09B2 
X-CRM114-Status: GOOD (  26.51  )
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

SGkgU3RlcGhhbiwKCk9uIDA2LzA3LzIwMjYgYXQgMTQ6NTU6MjYgKzAyLCBTdGVwaGFuIEdlcmhv
bGQgPHN0ZXBoYW4uZ2VyaG9sZEBsaW5hcm8ub3JnPiB3cm90ZToKCj4gSGkgTWlxdcOobCwKPgo+
IE9uIE1vbiwgSnVuIDI5LCAyMDI2IGF0IDA1OjQ2OjU3UE0gKzAyMDAsIE1hbml2YW5uYW4gU2Fk
aGFzaXZhbSB3cm90ZToKPj4gT24gTW9uLCBKdW4gMDgsIDIwMjYgYXQgMDM6MjA6MjFQTSArMDIw
MCwgU3RlcGhhbiBHZXJob2xkIHdyb3RlOgo+PiA+IE1ETTk2MDcgaGFzIFFQSUMgdjEuNSB0aGF0
IHN1cHBvcnRzIHRoZSBPUF9QQUdFX1JFQURfT05GSV9SRUFEIGNvbW1hbmQsIGJ1dAo+PiA+IGlz
IG1pc3NpbmcgdGhlIHJlc3Qgb2YgdGhlIGhhcmR3YXJlIGNoYW5nZXMgaW4gUVBJQyB2Mi4gVGhl
cmUgaXMgYWxzbyBvbmx5Cj4+ID4gYSBzaW5nbGUgY2xvY2sgdGhhdCBjYW4gYmUgY29udHJvbGxl
ZCB1c2luZyB0aGUgUlBNIGZpcm13YXJlLiBEb2N1bWVudCBhbmQKPj4gPiBhZGQgdGhlIG5ldyBx
Y29tLG1kbTk2MDctbmFuZCBjb21wYXRpYmxlIGZvciB0aGlzIHNldHVwLgo+PiA+IAo+PiA+IFNp
Z25lZC1vZmYtYnk6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbi5nZXJob2xkQGxpbmFyby5vcmc+
Cj4+IAo+PiBZb3UgY291bGQgYW1tZW5kIHBhdGNoIDEncyBjb21taXQgbWVzc2FnZSB3aXRoIHRo
ZSBpbmZvcm1hdGlvbiBJIHNoYXJlZCBpbiB0aGUKPj4gcmVwbHkuIEJ1dCBuZXZlcnRoZWxlc3M6
Cj4+IAo+PiBSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5v
cmc+Cj4+IAo+Cj4gRG8geW91IHdhbnQgbWUgdG8gcmVzZW5kIHRoZSBzZXJpZXMgd2l0aCBwYXRj
aCAxIGNvbW1pdCBtZXNzYWdlCj4gYWRqdXN0ZWQ/IFRoZXJlIHdlcmUgbm8gb3RoZXIgY2hhbmdl
cyByZXF1ZXN0ZWQgYXMgZmFyIGFzIEkgY2FuIHRlbGwuCgpJIHdhcyBtb3N0bHkgd2FpdGluZyBm
b3IgYW5zd2VycyBvbiBteSBxdWVzdGlvbnMgZnJvbSB0aGUgRFQgYmluZGluZwptYWludGFpbmVy
cywgYnV0IEkgdW5kZXJzdGFuZCB0aGV5IG11c3QgYmUgdG9vIGxvYWRlZCBhdCB0aGUgbW9tZW50
LgoKPiBJIHRoaW5rIHRoZSBjdXJyZW50IGNvbW1pdCBtZXNzYWdlIHRoZXJlIGlzIGZpbmUsIGVz
cGVjaWFsbHkgaWYgeW91IGFkZAo+IHRoZSBMaW5rOiB0YWcgZHVyaW5nIGFwcGx5aW5nLiBUaGUg
ZXh0cmEgY29udGV4dCB3aWxsIGJlIHRoZXJlLgo+Cj4gSWYgeW91IHdhbnQgbWUgdG8gcmVzZW5k
LCBJIHdvdWxkIGp1c3QgcmVwbGFjZSB0aGUgc2Vjb25kIHBhcmFncmFwaCBpbgo+IHBhdGNoIDEg
d2l0aCB0aGUgZm9sbG93aW5nOgo+Cj4gLS0tCj4gT24gTURNOTYwNyBhbmQgb3RoZXIgcmVjZW50
IFNvQ3MsIHRoZSBRUElDIGhhcmR3YXJlIHJlcXVpcmVzIDMgY2xvY2tzCj4gKGFoYiwgY29yZSwg
YW9uKS4gSG93ZXZlciwgdGhlIGFjY2VzcyB0byB0aGVzZSBjbG9ja3MgaXMgcmVzdHJpY3RlZCB0
bwo+IHRoZSBSUE0gZmlybXdhcmUgdGhhdCBjb250cm9scyB0aGUgc2hhcmVkIHBvd2VyIHJlc291
cmNlcyBmb3IgdGhlIHdob2xlCj4gU29DLiBUaGUgY2xvY2tzIGNhbm5vdCBiZSBjb250cm9sbGVk
IHNlcGFyYXRlbHksIHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUKPiBSUE1fU01EX1FQSUNfQ0xLIGNs
b2NrIHRoYXQgaW1wbGljaXRseSBlbmFibGVzIGFsbCBvZiB0aGUgMyBjbG9ja3MuCj4gVGhlIG9u
bHkgZXhjZXB0aW9uIHRvIHRoaXMgYXJlIHNvbWUgSVBRKiBTb0MgdGhhdCBhcmUgbm90IHVzaW5n
IFJQTSwKPiB0aGVyZSB0aGUgY2xvY2tzIGFyZSBkaXJlY3RseSBjb250cm9sbGVkIGJ5IHRoZSBr
ZXJuZWwgdmlhIHRoZSBjbG9jawo+IGNvbnRyb2xsZXIgKEdDQykuIFJlcXVpcmUgb25seSBvbmUg
Y2xvY2sgaW4gdGhlIGR0LWJpbmRpbmdzIGZvciBNRE05NjA3Cj4gdG8gYXZvaWQgaGF2aW5nIHRv
IGRlZmluZSBkdW1teSBjbG9jayBlbnRyaWVzLgoKSSBhbSBzb3JyeSBidXQgdGhpcyBpcyBzdGls
bCBpbmNvcnJlY3QuIFlvdSBkb24ndCBoYXZlIHRvIGRlZmluZSAyIGR1bW15CmNsb2Nrcy4gWW91
IHdvdWxkIGhhdmUgdG8gZGVmaW5lIDMgdGltZXMgdGhlIHNhbWUgY2xvY2sgKGFuZCB0aGF0J3Mg
bm90CmEgcHJvYmxlbSkuIEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24gdGhlIGNvbmNlcHQgb2YgY2xv
Y2sgbmV4dXMgd2hpY2gKbWF5IHNvbHZlIHRoaXMga2luZCBvZiBpc3N1ZSBpbiBhIHJhdGhlciBl
bGVnYW50IHdheSBidXQgdGhhdCdzIG5vdApyZWFkeSB5ZXQuCgpJbiBteSBvcGluaW9uIHRoZSBi
aW5kaW5nIHRoYXQgeW91IHdhbnQgdG8gcHVzaCAoYSBzaW5nbGUgY2xvY2spIGlzCndyb25nLCBi
dXQgc2luY2UgSSd2ZSBiZWVuIGV4cGxhaW5pbmcgdGhpcyBmb3Igc2V2ZXJhbCB3ZWVrcyBhbHJl
YWR5LApwbGVhc2UgYXQgbGVhc3QgZml4IHRoZSBjb21taXQgbWVzc2FnZSBhbmQgSSB3aWxsIHRh
a2UgaXQgYXMgeW91IHdhbnQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
