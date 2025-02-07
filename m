Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAFBC02199
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 23:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Lo5nYTLWEne2uo674ItVazsTQTul0VGb/4Md0qxw8eo=; b=w84xMGGfzFR+g8yE9tq53SEXS2
	kCxgCoI5J3xWXFb0UBMhZLykHjQihaeaVr5aAM/uS1rTSohXiW6QIamOEaPZqDALeV/wEJ5qZhEHd
	P5StRhJC4Brll/wIDg/wEHHIYD7ZDefqMCSrr/eH751md1hNgPe90pIPyMiNcWZAF8/4ZHq9Q9zQ6
	GdGgwvN9/8A6niEUaAfYBQtvwsehLltKGgSZqSB/a3G66Qk+7oZXce/FCt598GflHMcXz+BFFpsn1
	upXPKu4WsxYYBN6dKnRUAzDdIVT1uZub18Keb+d5k1Vd77+UXYs120KB8CbOeEF9yi3cNN2F0LN7O
	q5mbaUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1v-0000000BY5V-3AJY;
	Fri, 07 Feb 2025 23:45:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1t-0000000BY4C-31Uu
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 23:45:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B7F75C704D;
	Fri,  7 Feb 2025 23:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EBCC4CEED;
	Fri,  7 Feb 2025 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738971900;
	bh=oxDEJrSuRw9jHuBedmerkRKEsabLePL5ItoY++NvcWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cskSHgtkDNZpjrroSTdfIB2pBrFWA/I8lyqrwRM3VEsMsQJ8xJ8HgHGrqbX3gKw8p
	 uxzQNr1B8LTK0QWKcrCpaseaC5vB6Bb8PaNk9IeKqu1/r7oLuL7Zz9L9+Eg+NlKvsi
	 YXjY65GMCfwsS4caD9gupEyizInImvIclQf6R+0epDHm0rRw5hBOartRJHhiMeCSTs
	 3KGvQS+zSo92/eXSV7+l1PwvSUyLoI358WwuktySbalbHOg+XnYGZKWgTA/IeFP+Bh
	 X2pRORuLGKSwryBQvt56Ldi77izopX6xGKBTIQVbndi6y7PsSQnjFMS04O38gPVaNA
	 HPK4MwWUSENUw==
Date: Fri, 07 Feb 2025 17:44:59 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
 Herbert Xu <herbert@gondor.apana.org.au>, linuxppc-dev@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Naveen N Rao <naveen@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev, 
 Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Richard Weinberger <richard@nod.at>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-pci@vger.kernel.org
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
Message-Id: <173897189669.2630636.11579554304003668196.robh@kernel.org>
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_154501_849758_87E5DC3A 
X-CRM114-Status: GOOD (  18.26  )
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

Ck9uIEZyaSwgMDcgRmViIDIwMjUgMjI6MzA6MjYgKzAxMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
Ogo+IENvbnZlcnQgdGhlIEZyZWVzY2FsZSBsb2NhbGJ1cyBjb250cm9sbGVyIGJpbmRpbmdzIGZy
b20gdGV4dCBmb3JtIHRvCj4gWUFNTC4gVGhlIHVwZGF0ZWQgbGlzdCBvZiBjb21wYXRpYmxlIHN0
cmluZ3MgcmVmbGVjdHMgY3VycmVudCB1c2FnZQo+IGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy8s
IGV4Y2VwdCB0aGF0IG1hbnkgZXhpc3RpbmcgZGV2aWNlIHRyZWVzCj4gZXJyb25lb3VzbHkgc3Bl
Y2lmeSAic2ltcGxlLWJ1cyIgaW4gYWRkaXRpb24gdG8gZnNsLCplbGJjLgo+IAo+IENoYW5nZXMg
Y29tcGFyZWQgdG8gdGhlIHR4dCB2ZXJzaW9uOgo+ICAtIHJlbW92ZWQgdGhlIGJvYXJkLWNvbnRy
b2wgKGZzbCxtcGM4MjcyYWRzLWJjc3IpIG5vZGUgYmVjYXVzZSBpdCBvbmx5Cj4gICAgYXBwZWFy
cyBpbiB0aGlzIGV4YW1wbGUgYW5kIG5vd2hlcmUgZWxzZQo+ICAtIGFkZGVkIGEgbmV3IGV4YW1w
bGUgd2l0aCBOQU5EIGZsYXNoCj4gIC0gdXBkYXRlZCBsaXN0IG9mIGNvbXBhdGlibGUgc3RyaW5n
cwo+IAo+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Cj4g
LS0tCj4gCj4gVjI6Cj4gLSBmaXggb3JkZXIgb2YgcHJvcGVydGllcyBpbiBleGFtcGxlcywgYWNj
b3JkaW5nIHRvIGR0cyBjb2Rpbmcgc3R5bGUKPiAtIG1vdmUgdG8gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycwo+IC0gY2xhcmlmeSB0aGUgY29tbWl0
IG1lc3NhZ2UgYSB0aW55IGJpdAo+IC0gcmVtb3ZlIHVubmVjZXNzYXJ5IG11bHRpbGluZSBtYXJr
ZXJzICh8KQo+IC0gZGVmaW5lIGFkZHJlc3MgZm9ybWF0IGluIHBhdHRlcm5Qcm9wZXJ0aWVzCj4g
LSB0cmltIHN1YmplY3QgbGluZSAocmVtb3ZlICJiaW5kaW5nIikKPiAtIHJlbW92ZSB1c2Ugb2Yg
InNpbXBsZS1idXMiLCBiZWNhdXNlIGl0J3MgdGVjaG5pY2FsbHkgaW5jb3JyZWN0Cj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMueWFtbCAgICAgIHwgMTQ2
ICsrKysrKysrKysrKysrKysrKysrKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBj
L2ZzbC9sYmMudHh0ICAgICAgICB8ICA0MyAtLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNDYg
aW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCj4gCgpNeSBib3QgZm91bmQgZXJyb3JzIHJ1
bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91ciBwYXRjaDoKCnlhbWxsaW50IHdh
cm5pbmdzL2Vycm9yczoKCmR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6CkRvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBs
ZS5kdGI6IC9leGFtcGxlLTAvbG9jYWxidXNAZjAwMTAxMDAvc2ltcGxlLXBlcmlwaEAyLDA6IGZh
aWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydmc2wsZWxiYy1ncGNt
LXVpbyddCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxl
cnMvZnNsLGVsYmMuZXhhbXBsZS5kdGI6IC9leGFtcGxlLTEvbG9jYWxidXNAZTAwMDUwMDAvbmFu
ZEAxLDA6IGZhaWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydmc2ws
bXBjODMxNS1mY20tbmFuZCcsICdmc2wsZWxiYy1mY20tbmFuZCddCkRvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMuZXhhbXBsZS5kdGI6
IC9leGFtcGxlLTEvbG9jYWxidXNAZTAwMDUwMDAvbmFuZEAxLDA6IGZhaWxlZCB0byBtYXRjaCBh
bnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydmc2wsbXBjODMxNS1mY20tbmFuZCcsICdmc2ws
ZWxiYy1mY20tbmFuZCddCgpkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2RvY3Mp
OgpXYXJuaW5nOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zc2Qx
Mjg5ZmIudHh0IHJlZmVyZW5jZXMgYSBmaWxlIHRoYXQgZG9lc24ndCBleGlzdDogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2xiYy50eHQKRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3NkMTI4OWZiLnR4dDogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2xiYy50eHQKClNlZSBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDI1
MDIwNy1wcGN5YW1sLXYyLTktODEzN2IwYzQyNTI2QHBvc3Rlby5uZXQKClRoZSBiYXNlIGZvciB0
aGUgc2VyaWVzIGlzIGdlbmVyYWxseSB0aGUgbGF0ZXN0IHJjMS4gQSBkaWZmZXJlbnQgZGVwZW5k
ZW5jeQpzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLgoKSWYgeW91IGFscmVhZHkgcmFu
ICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQplcnJvcihz
KSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBp
cyB1cCB0bwpkYXRlOgoKcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQoKUGxlYXNlIGNo
ZWNrIGFuZCByZS1zdWJtaXQgYWZ0ZXIgcnVubmluZyB0aGUgYWJvdmUgY29tbWFuZCB5b3Vyc2Vs
Zi4gTm90ZQp0aGF0IERUX1NDSEVNQV9GSUxFUyBjYW4gYmUgc2V0IHRvIHlvdXIgc2NoZW1hIGZp
bGUgdG8gc3BlZWQgdXAgY2hlY2tpbmcKeW91ciBzY2hlbWEuIEhvd2V2ZXIsIGl0IG11c3QgYmUg
dW5zZXQgdG8gdGVzdCBhbGwgZXhhbXBsZXMgd2l0aCB5b3VyIHNjaGVtYS4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
