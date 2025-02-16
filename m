Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0927C021A6
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2025 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkpTsYkQt3nsrcgPgwCaX8tI4lMs/rvUnhrys2WQotw=; b=aOkQxIJYyNAAb1
	/uagxSuYKzHTF/0FF9COM5lCsjvuX3+toa1UfioDFUK4S6feFdzvzYXKDwgrvbNP0oizcen3m3cuG
	NO9YpOZIOT3jMJXvgnXu45sApMvMsQI/LqfKrQ5ihupZCt8YLB4/zS+7RCxlXuH8CYYSo/o5TqO9j
	al1FwRUJGGt7MDSUkv/kX01D6qiyT73o+Kw2cpk5IU8sdqP7s4K+2pVhVeXc07NfAFeahKc2ZprvZ
	HxHCtzIf6l8Vyo/fcdaCPep+GmEpFzigUlJgMiVjsep+0L1RITO5ml6u0dtior69gDqFX/w6Vx0Wc
	CUrDeQD0uc6dmr9U/jPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjj8A-00000002IxO-0KeK;
	Sun, 16 Feb 2025 18:12:38 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjj87-00000002Iwh-3lxj
	for linux-mtd@lists.infradead.org;
	Sun, 16 Feb 2025 18:12:37 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 58B38240104
	for <linux-mtd@lists.infradead.org>; Sun, 16 Feb 2025 19:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739729552; bh=YUqph/b4fBwdoaZ+voCpRWWS6XtVpDBsEp5ssxllxE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=fRSHGNjNl1cAmfChbInU63IRKQoTu0JS4Iplfwe6RMf1WKD/8cj1/It/DYf7mq3SO
	 YYOBmVZjU/UUQJtErfw/Vv/SWTzbu0/FmZcn4PFWEYFufoigcMrJ61CTy3Gy4uYAVr
	 4uv3Ys+FTeiG5ex24zqk1VNfKtgXa/Ga0Qt74Mcc4toniz1OCmFfwdFl7CoZHKfDJ3
	 C3HrXTooDAaMfAUdpm7iRMmLtB2EVfetl428iA4VwI1k2D77rjkmG+2NR0fcpU+07m
	 N2K7T2bnW27tZzoW2bN0x+LJuOe6avDzrxNt7l22CJifL2g9IzlI/a2ptu6b9mjJGi
	 0xKN+sirq5c2A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywv5R2d3Hz9rxK;
	Sun, 16 Feb 2025 19:12:27 +0100 (CET)
Date: Sun, 16 Feb 2025 18:12:26 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, j.ne@posteo.net,
	imx@lists.linux.dev, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
Message-ID: <Z7Iqir-qaZDt6tsx@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
 <87o6zaurv9.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o6zaurv9.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_101236_252128_7562DB5B 
X-CRM114-Status: GOOD (  13.65  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDk6Mjc6MjJBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIZWxsbywKPiAKPiBPbiAwNy8wMi8yMDI1IGF0IDIyOjMwOjI5ICswMSwgSi4gTmV1
c2Now6RmZXIgdmlhIEI0IFJlbGF5IDxkZXZudWxsK2oubmUucG9zdGVvLm5ldEBrZXJuZWwub3Jn
PiB3cm90ZToKPiAKPiA+IEZyb206ICJKLiBOZXVzY2jDpGZlciIgPGoubmVAcG9zdGVvLm5ldD4K
PiA+Cj4gPiBJbiBzb21lIHNjZW5hcmlvcywgc3VjaCBhcyB1bmRlciB0aGUgRnJlZXNjYWxlIGVM
QkMgYnVzLCB0aGVyZSBhcmUgcmF3Cj4gPiBOQU5EIGNoaXBzIHdpdGggYSB1bml0IGFkZHJlc3Mg
dGhhdCBoYXMgYSBjb21tYSBpbiBpdCAoY3Msb2Zmc2V0KS4KPiA+IFJlbGF4IHRoZSAkbm9kZW5h
bWUgcGF0dGVybiBpbiByYXctbmFuZC1jaGlwLnlhbWwgdG8gYWxsb3cgc3VjaCB1bml0Cj4gPiBh
ZGRyZXNzZXMuCj4gCj4gVGhpcyBpcyBzdXBlciBzcGVjaWZpYyB0byB0aGlzIGNvbnRyb2xsZXIs
IEknZCByYXRoZXIgYXZvaWQgdGhhdCBpbiB0aGUKPiBtYWluIChzaGFyZWQpIGZpbGVzLiBJIGJl
bGlldmUgeW91IGNhbiBmb3JjZSBhbm90aGVyIG5vZGUgbmFtZSBpbiB0aGUKPiBjb250cm9sbGVy
J3MgYmluZGluZyBpbnN0ZWFkPwoKSXQncyBhIGJpdCB0cmlja3kuIEFGQUlDUywgd2hlbiBJIGRl
Y2xhcmUgYSBub2RlIG5hbWUgcGF0dGVybiBpbiBteQpzcGVjaWZpYyBiaW5kaW5nIGluIGFkZGl0
aW9uIHRvIHRoZSBnZW5lcmljIGJpbmRpbmcsIHRoZSByZXN1bHQgaXMgdGhhdApib3RoIG9mIHRo
ZW0gYXBwbHksIHNvIEkgY2FuJ3QgcmVsYXggc3RyaWN0ZXIgcmVxdWlyZW1lbnRzOgoKIyByYXct
bmFuZC1jaGlwLnlhbWwKcHJvcGVydGllczoKICAkbm9kZW5hbWU6CiAgICBwYXR0ZXJuOiAiXm5h
bmRAW2EtZjAtOV0kIgoKIyBmc2wsZWxiYy1mY20tbmFuZC55YW1sCnByb3BlcnRpZXM6CiAgJG5v
ZGVuYW1lOgogICAgcGF0dGVybjogIl5uYW5kQFthLWYwLTldKCxbMC05YS1mXSopPyQiCgojIGR0
YwovLi4uL2ZzbCxlbGJjLWZjbS1uYW5kLmV4YW1wbGUuZHRiOgpuYW5kQDEsMDogJG5vZGVuYW1l
OjA6ICduYW5kQDEsMCcgZG9lcyBub3QgbWF0Y2ggJ15uYW5kQFthLWYwLTldJCcKICAgICAgICBm
cm9tIHNjaGVtYSAkaWQ6CglodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvZnNsLGVs
YmMtZmNtLW5hbmQueWFtbCMKCihJIGNoYW5nZWQgdGhlIHNlY29uZCBwYXR0ZXJuIHRvIG5hbmQt
ZmFpbEAuLi4gYW5kIGR0YyB3YXJuZWQgYWJvdXQgaXQKIG1pc21hdGNoaW5nIHRvby4pCgpQZXJo
YXBzIEknbSBtaXNzaW5nIGEgRFQtc2NoZW1hIHRyaWNrIHRvIG92ZXJyaWRlIGEgdmFsdWUvcGF0
dGVybi4KCkFsdGVybmF0aXZlbHkgKHBlbmRpbmcgZGlzY3Vzc2lvbiBvbiBwYXRjaCAxMS8xMiks
IEkgbWlnaHQgZW5kIHVwIG5vdApyZWZlcmVuY2luZyByYXctbmFuZC1jaGlwLnlhbWwuCgoKQmVz
dCByZWdhcmRzLApKLiBOZXVzY2jDpGZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
