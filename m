Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9076EC43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNhn5Mf1cHXKUiyTEDjXsSt3JsffHGFn9FQv5EctuTI=; b=p+VNntkdXGyhmB
	IhnCtJ9c4I4cg93GGkqxAdOfHbRgb3sW4Uy36wV4jDrzxi5wJyhDwqYTQqArEK7msPRGo+i1sdTo+
	52wQ6gUQlg8XsE7SuV/jQcfydpSID6fxyGhLpaKIPeFvRiwyuegGkrJ4J0II/+LHgpZuIO/OBr/Tt
	u81oY6k8ZBKyfQYqCsofyTYFWytc4qmadlVXBTkHZBy9oYsBaSA+X3YAirHJGu+eyV6gVZ/UyXmSg
	SuFcYSYXDewjZj+NjEwDf7NRMTP+cM6C5/IoOspSfK6uFUNidg8Q8HRnh8P1g9nQZR8Kdgsgxq908
	ng2HDUL2LeAThUzjW2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE7W-0000000F6L8-3jAY;
	Mon, 29 Jun 2026 15:42:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE7T-0000000F6Kk-275n
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 15:42:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 75F004E40B60;
	Mon, 29 Jun 2026 15:41:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C4EE5FF96;
	Mon, 29 Jun 2026 15:41:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C710F106F18F2;
	Mon, 29 Jun 2026 17:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782747714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8J9faHVVv2ntVQAaALWU4TngzNzL0U5Yipge3+xPG7s=;
	b=e8JSMcocsEMdwZIn+IiOh7qSvNcGXscTgT6coAUO5+OOVMv+TIftj7LPjGYJw47OR2hur7
	PMvM/INXhv+nzLgO2uPX+Tp0QRt+0qSCY6IKC1/+ijMQyS3aCLG+DxRk/MJwBWirZiLKna
	f8ba9MbnmL0hEvTNPAHVHPr96b3i16a5oZ+ye6dA/wAK80JbdtcYbeRBVP/UJMWquxMk17
	xdpMkk+ESs51mYYjL71XW5OM4hjSrh8r9LmVXDchkgAuDqibWWVh65vz2PFVCNN3EKg/wH
	JOuqneLoMhx4IbDuOiqybLDaFUJu4qzmaAOSoO4O/7Kq4Y+Y+oBl0XfXoYK9NQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v4 01/16] spi: dt-bindings: add
 spi-max-post-config-frequency property
In-Reply-To: <20260622-private-curly-fennec-7e1ad0@quoll> (Krzysztof
	Kozlowski's message of "Mon, 22 Jun 2026 11:14:32 +0200")
References: <20260618073725.84733-1-s-k6@ti.com>
	<20260618073725.84733-2-s-k6@ti.com>
	<20260622-private-curly-fennec-7e1ad0@quoll>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:41:50 +0200
Message-ID: <87bjcts69t.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_084159_708263_FC8803A4 
X-CRM114-Status: GOOD (  16.46  )
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

T24gMjIvMDYvMjAyNiBhdCAxMToxNDozMiArMDIsIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgSnVuIDE4LCAyMDI2IGF0IDAxOjA3OjEwUE0g
KzA1MzAsIFNhbnRob3NoIEt1bWFyIEsgd3JvdGU6Cj4+IEFkZCBzcGktbWF4LXBvc3QtY29uZmln
LWZyZXF1ZW5jeSwgYSBnZW5lcmljIHVpbnQzMiBwcm9wZXJ0eSBmb3IgU1BJCj4+IHBlcmlwaGVy
YWxzIHRoYXQgc3VwcG9ydCB0d28gZGlzdGluY3QgY2xvY2sgcmF0ZXM6IGEgY29uc2VydmF0aXZl
IHJhdGUKPj4gYWx3YXlzIHJlYWNoYWJsZSB3aXRob3V0IGNvbnRyb2xsZXIgY29uZmlndXJhdGlv
biwgYW5kIGEgaGlnaGVyIHJhdGUKPj4gcmVhY2hhYmxlIG9ubHkgYWZ0ZXIgY29udHJvbGxlci1z
aWRlIGNvbmZpZ3VyYXRpb24gc3VjaCBhcyBQSFkgdHVuaW5nLgo+PiAKPj4gV2hlbiBib3RoIHBy
b3BlcnRpZXMgYXJlIHByZXNlbnQsIHNwaS1tYXgtZnJlcXVlbmN5IGdpdmVzIHRoZQo+PiBjb25z
ZXJ2YXRpdmUgcHJlLWNvbmZpZ3VyYXRpb24gcmF0ZSBhbmQgc3BpLW1heC1wb3N0LWNvbmZpZy1m
cmVxdWVuY3kKPj4gZ2l2ZXMgdGhlIGhpZ2hlciBwb3N0LWNvbmZpZ3VyYXRpb24gdGFyZ2V0Lgo+
PiAKPj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+Cj4+IC0t
LQo+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlh
bWwgICAgICAgfCA2ICsrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
PiAKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
c3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbAo+PiBpbmRleCA4ODBhOWY2MjQ1NjYu
LmVjZTg2ZjY1OTMwZiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbAo+PiBA
QCAtNDUsNiArNDUsMTIgQEAgcHJvcGVydGllczoKPj4gICAgICBkZXNjcmlwdGlvbjoKPj4gICAg
ICAgIE1heGltdW0gU1BJIGNsb2NraW5nIHNwZWVkIG9mIHRoZSBkZXZpY2UgaW4gSHouCj4+ICAK
Pj4gKyAgc3BpLW1heC1wb3N0LWNvbmZpZy1mcmVxdWVuY3k6Cj4KPiAtaHoKPiBodHRwczovL2dp
dGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hL2Jsb2IvbWFpbi9kdHNjaGVtYS9zY2hl
bWFzL3Byb3BlcnR5LXVuaXRzLnlhbWwKPgo+IGFuZCB5b3UgbmVlZCBtYXhJdGVtczogMS4KPgo+
IE5vdywgcGxlYXNlIHRha2UgdGltZSBhbmQgdGhpbmsgaWYgdGhpcyBzaG91bGQgbm90IGJlIGFu
IGFycmF5IGluc3RlYWQKPiAobWF4SXRlbXM6IC4uLikgdG8gY292ZXIgb3RoZXIgcG9zc2libGUg
Y2FzZXMsIGUuZy4gZGlmZmVyZW50IHR1bmluZwo+IGxldmVscz8gSU9XLCBoYXZpbmcgc2luZ2xl
IHNwaS1tYXgtZnJlcXVlbmN5IHR1cm5lZCBvdXQgdG8gYmUKPiBpbnN1ZmZpY2llbnQuIFlvdSBh
ZGRyZXNzIHRoYXQgaW5zdWZmaWNpZW5jeSB3aXRoIG9uZSBtb3JlIGZyZXF1ZW5jeSwKPiBidXQg
d2hhdCBpZiB0aGlzIGlzIGdvaW5nIHRvIGJlIGluc3VmZmljaWVudCBuZXh0IG1vbnRoIGFzIHdl
bGw/CgpJdCBpcyBhY3R1YWxseSBhIHZlcnkgZ29vZCByZW1hcmsuIEkgZG8gbm90IGhhdmUgZXhp
c3RpbmcgbmVlZHMgaW4gbWluZAphdCB0aGUgbW9tZXQsIGJ1dCB0aGF0IGRvZXMgbm90IG1lYW4g
dGhlcmUgaXMgbm9uZS4KCkluIFNQSSBOQU5EIHdlIGhhdmUgcGVyLW9wZXJhdGlvbiBtYXhpbXVt
IGZyZXF1ZW5jaWVzIGJlaW5nIGRlZmluZWQgaW4KbWFudWZhY3R1cmVyIGRyaXZlcnMgKHlvdSBj
YW4gY2hlY2sgZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jKQpiZWNhdXNlIHdoZW4gdGhl
IHNwZWVkIGluY3JlYXNlcywgdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMgc2hhbGwgYmUKYWRh
cHRlZCBhY2NvcmRpbmdseS4gU28gd2Uga2luZCBvZiBoYW5kbGUgdGhlIHZhcmlvdXMgZnJlcXVl
bmN5IHBvc3NpYmlsaXRpZXMgYWxyZWFkeQoodGhlIHByb3BlcnR5IGFkZGVkIGJ5IFNhbnRob3No
IHNldHRpbmcgYW4gYWJzb2x1dGUgbWF4aW11bSB0aGF0IGNhbm5vdApiZSBjcm9zc2VkKS4KCkhv
d2V2ZXIsIEkgZG8gbm90IHRoaW5rIFNQSSBOT1JzIGhhdmUgc29tZXRoaW5nIHNpbWlsYXIsIGFu
ZCBhbHNvIG9uZQpkYXkgd2UgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgdHVuaW5nIGxldmVscyByZXF1
aXJpbmcgZGlmZmVyZW50ICJtYXhpbXVtCmZyZXF1ZW5jaWVzIjogd2UgY291bGQgaW1hZ2luZSBh
IGZpcnN0IG1vZGUgd2hlcmUgdHVuaW5nIGlzIHZlcnkgZmFzdCB0bwpjb25maWd1cmUgYW5kIHNw
ZWVkIGdhaW5zIGdvb2QsIGluIGNvbXBldGl0aW9uIHdpdGggYW5vdGhlciBtb2RlIHdoZXJlCnR1
bmluZyBtYWtlcyB0cmFuc2ZlcnMgZXh0cmVtZWx5IGZhc3QgYnV0IHdpdGggYW4gZXh0cmEgY29u
ZmlndXJhdGlvbgpwZW5hbHR5ICh0aGlzIGlzIHB1cmUgc2NpLWZpIGluIG15IGhlYWQgYXQgdGhl
IG1vbWVudCkuCgpJdCBpcyBoYXJkIHRvIHRlbGwgd2hldGhlciB0aGlzIHdldCBmaW5nZXIgZ3Vl
c3Npbmcgd2lsbCByZWFsaXplIGFueQp0aW1lIHNvb24uIE1heWJlIHRoZSBzYWZlc3QgYXBwcm9h
Y2ggaXMgdG8gZ28gZm9yIGFuIGFycmF5LCB0aG91Z2guIEluCnRoYXQgY2FzZSwgY291bGQgd2Ug
YWRkIGEgbWFuZGF0b3J5IG5hbWUgdG8gZWFzZSAoZnV0dXJlKSBwYXJzaW5nPwpUeXBpY2FsbHkg
aGVyZSwgd2UgbWlnaHQgd2FudCB0byBjYWxsIGl0IHBoeS1kZWxheS10dW5pbmcgb3Igc29tZXRo
aW5nCmxpa2UgdGhhdCAobmFtZSB0byBiZSBkaXNjdXNzZWQsIGJlY2F1c2UgdGhlcmUgaXMgdGhl
IHJpc2sgdG8gbWFrZSB0bwp0b28gY29udHJvbGxlciBzcGVjaWZpYykuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
