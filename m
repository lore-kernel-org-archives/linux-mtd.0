Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD00C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7126620836
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fguUrQ4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7126620836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Gt8ZK08lzl60qHXnWKcMYr4/XJ6T2fHruJn4M3x9rk=; b=fguUrQ4ZqoADDM
	9QKgVslz4823R3Xgpwo93W23+cjIxMVGYDm/vabKDPVfaMpB+rDI6W3xBFBlYdiZCkA67Fu24kNCF
	vQIC9uKloUkSBuv5j0gK06vdhUf6472OvwWAMk1c/bO1++sPnz6FvXovN5wnp1RK0QUrTVeejjCBY
	1B3GKexdHenqcuu4KFIG1MUylJsXUYceG/L7WX7CGo8Iw1WFUjhOpUgxU3gLEnjELtasDFyF3aZVo
	y70xRQTMZm9bHvfy3QnVpdy0SfRxkQ695s3Ar1xCjpWrKeo+cqTn+QYEcLkWiujIzlxPHrdmY0Xup
	0QnP2AaPE2vY153z/BoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0kAc-000493-6x; Mon, 04 Mar 2019 09:46:02 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kAZ-00048f-Ht
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 09:46:01 +0000
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 87BD424000B;
 Mon,  4 Mar 2019 09:45:55 +0000 (UTC)
Date: Mon, 4 Mar 2019 10:45:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible
 strings for JZ4740 and JZ4725B
Message-ID: <20190304104554.09be4cd4@xps13>
In-Reply-To: <20190209192305.4434-1-paul@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_014559_799777_A101C941 
X-CRM114-Status: GOOD (  20.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBT
YXQsICA5IEZlYiAyMDE5IDE2OjIyOjU3Ci0wMzAwOgoKPiBBZGQgY29tcGF0aWJsZSBzdHJpbmdz
IHRvIHByb2JlIHRoZSBqejQ3ODAtbmFuZCBhbmQgano0NzgwLWJjaCBkcml2ZXJzCj4gZnJvbSBk
ZXZpY2V0cmVlIG9uIHRoZSBKWjQ3MjVCIGFuZCBKWjQ3NDAgU29DcyBmcm9tIEluZ2VuaWMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4g
LS0tCj4gCj4gQ2hhbmdlczoKPiAKPiB2MjogLSBDaGFuZ2UgJ2luZ2VuaWMsano0NzI1Yi1uYW5k
JyBjb21wYXRpYmxlIHN0cmluZyB0bwo+ICAgICAgICdpbmdlbmljLGp6NDc0MC1uYW5kJyB0byBy
ZWZsZWN0IGRyaXZlciBjaGFuZ2UKPiAgICAgLSBBZGQgJ2luZ2VuaWMsano0NzQwLWJjaCcgY29t
cGF0aWJsZSBzdHJpbmcKPiAgICAgLSBEb2N1bWVudCAnaW5nZW5pYyxvb2ItbGF5b3V0JyBwcm9w
ZXJ0eQo+IAo+IHYzOiAtIFJlbW92ZWQgJ2luZ2VuaWMsb29iLWxheW91dCcgcHJvcGVydHkKPiAg
ICAgLSBVcGRhdGUgY29tcGF0aWJsZSBzdHJpbmdzIHRvIHdoYXQgdGhlIGRyaXZlciBzdXBwb3J0
cwo+IAo+IHY0OiBObyBjaGFuZ2UKPiAKPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dCB8IDEwICsrKysrKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLGp6NDc4MC1u
YW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxq
ejQ3ODAtbmFuZC50eHQKPiBpbmRleCAyOWVhNTg1M2NhOTEuLmE1Yjk0MGYxOGJmNiAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsano0
NzgwLW5hbmQudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dAo+IEBAIC02LDcgKzYsMTAgQEAgbWVtb3J5LWNvbnRy
b2xsZXJzL2luZ2VuaWMsano0NzgwLW5lbWMudHh0KSwgYW5kIHRodXMgTkFORCBkZXZpY2Ugbm9k
ZXMgbXVzdAo+ICBiZSBjaGlsZHJlbiBvZiB0aGUgTkVNQyBub2RlLgo+ICAKPiAgUmVxdWlyZWQg
TkFORCBjb250cm9sbGVyIGRldmljZSBwcm9wZXJ0aWVzOgo+IC0tIGNvbXBhdGlibGU6IFNob3Vs
ZCBiZSBzZXQgdG8gImluZ2VuaWMsano0NzgwLW5hbmQiLgo+ICstIGNvbXBhdGlibGU6IFNob3Vs
ZCBiZSBvbmUgb2Y6Cj4gKyAgKiBpbmdlbmljLGp6NDc0MC1uYW5kCj4gKyAgKiBpbmdlbmljLGp6
NDcyNWItbmFuZAo+ICsgICogaW5nZW5pYyxqejQ3ODAtbmFuZAoKV291bGRuJ3QgIi1uYW5kLWNv
bnRyb2xsZXIiIHN1ZmZpeCBiZSBiZXR0ZXI/IE9mIGNvdXJzZSBpbiB0aGUgZHJpdmVyCnlvdSBz
aG91bGQgc3RpbGwgY2hlY2sgZm9yIGp6NDc4MC1uYW5kLgoKPiAgLSByZWc6IEZvciBlYWNoIGJh
bmsgd2l0aCBhIE5BTkQgY2hpcCBhdHRhY2hlZCwgc2hvdWxkIHNwZWNpZnkgYSBiYW5rIG51bWJl
ciwKPiAgICBhbiBvZmZzZXQgb2YgMCBhbmQgYSBzaXplIG9mIDB4MTAwMDAwMCAoaS5lLiB0aGUg
d2hvbGUgTkVNQyBiYW5rKS4KPiAgCj4gQEAgLTcyLDcgKzc1LDEwIEBAIE5BTkQgZGV2aWNlcy4g
VGhlIGZvbGxvd2luZyBpcyBhIGRlc2NyaXB0aW9uIG9mIHRoZSBkZXZpY2UgcHJvcGVydGllcyBm
b3IgYQo+ICBCQ0ggY29udHJvbGxlci4KPiAgCj4gIFJlcXVpcmVkIEJDSCBwcm9wZXJ0aWVzOgo+
IC0tIGNvbXBhdGlibGU6IFNob3VsZCBiZSBzZXQgdG8gImluZ2VuaWMsano0NzgwLWJjaCIuCj4g
Ky0gY29tcGF0aWJsZTogU2hvdWxkIGJlIG9uZSBvZjoKPiArICAqIGluZ2VuaWMsano0NzQwLWVj
Ywo+ICsgICogaW5nZW5pYyxqejQ3MjViLWJjaAo+ICsgICogaW5nZW5pYyxqejQ3ODAtYmNoCj4g
IC0gcmVnOiBTaG91bGQgc3BlY2lmeSB0aGUgQkNIIGNvbnRyb2xsZXIgcmVnaXN0ZXJzIGxvY2F0
aW9uIGFuZCBsZW5ndGguCj4gIC0gY2xvY2tzOiBDbG9jayBmb3IgdGhlIEJDSCBjb250cm9sbGVy
Lgo+ICAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
