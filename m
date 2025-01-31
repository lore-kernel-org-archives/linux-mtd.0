Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD25EC0218F
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pf9mLjcDpFyb+POlSsjQ/wOod4+2bCRY6RPfHnEnJM=; b=PxvJ/92ZxZMT3S
	TUgC40C9g0R0eSR1eZNqNpXykiWhiDA0aN8ZEFU7sB8YGXrWsLmY2M3bxxkdrIvvo+7ZutfSmf1o8
	3U2+ZumDYKRXRCu2dKWP2qC6jw11e0gj0z5OBsIoiBUZZt2apyUnKGgSAnN4HHujhEFz49SoXlgom
	djy1jg80V5IUXYp1enJNj+XSiIJqGq/o6YLHiAa9B+1m/Dp/RPSZsholrUisWNIkchxf1Z4fBS6f7
	9j5EE0B5qh4AUTCuWG4kP5sKbC743ehjGtG62fcANbOjapiKe0G2CtlYlTbPOIGQT/vVbTn8Qproe
	bPbLzgRSuI8cDSBJjlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrc5-0000000AjoW-2lZ4;
	Fri, 31 Jan 2025 14:03:17 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrc2-0000000Ajo6-2rjb
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 14:03:16 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4C011240028
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 15:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738332192; bh=k6iepJ3khtCHe4wAP+Co9RM2WKV6wPbtel3+iGpB+ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=U01V4Z6OZulu42RAyuhImUM7a4bKoe0MgxbzYtZ5Gtv3IQrM8v608XW6/eU8W1NPh
	 0t/gSDEdIYRPW7vnEa11pXSviVtdikX48Q82whS+CWfyd0UJeXt6rBD0fzF8KVfKTX
	 0Z03SYRn2Uu6IQP/L3bQo1aUJLI7+xN0KIfAIHVkK9eX5ItMwz6M+cxbDmy672oS74
	 Ci1CAAuttEEzIB8kkfBe89QxG3GD24LegtRlStjnbw6LmLN0kOJgA12M6XWLDU/om0
	 0GU6bntTsoAjFW2kCo3ZvOHG6G4u/oVw4TFTi6xdV9jF6Jo61OrWwlqWw5s5EDKsSb
	 1HFTZr/jTX1+Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YkyK53T11z6v08;
	Fri, 31 Jan 2025 15:03:05 +0100 (CET)
Date: Fri, 31 Jan 2025 14:03:05 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <Z5zYGdZU-IXwIuR6@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
 <20250127044735.GD3106458-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250127044735.GD3106458-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_060315_021765_42AA3A0F 
X-CRM114-Status: GOOD (  15.54  )
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

T24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMTA6NDc6MzVQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTk6MDBQTSArMDEwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gPiBUaGUgZGV2aWNldHJlZSBiaW5kaW5ncyBmb3IgRnJlZXNjYWxlIERN
QSBlbmdpbmVzIGhhdmUgc28gZmFyIGV4aXN0ZWQgYXMKPiA+IGEgdGV4dCBmaWxlLiBUaGlzIHBh
dGNoIGNvbnZlcnRzIHRoZW0gdG8gWUFNTCwgYW5kIHNwZWNpZmllcyBhbGwgdGhlCj4gPiBjb21w
YXRpYmxlIHN0cmluZ3MgY3VycmVudGx5IGluIHVzZSBpbiBhcmNoL3Bvd2VycGMvYm9vdC9kdHMu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+
Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvZnNsLGVsby1kbWEueWFt
bCAgICAgICB8IDEyOSArKysrKysrKysrKysrCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL2ZzbCxlbG8zLWRtYS55YW1sICAgICAgfCAxMDUgKysrKysrKysrKysKPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9kbWEvZnNsLGVsb3BsdXMtZG1hLnlhbWwgICB8IDEyMCArKysrKysr
KysrKysKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9kbWEudHh0ICAg
ICAgICB8IDIwNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDM1
NCBpbnNlcnRpb25zKCspLCAyMDQgZGVsZXRpb25zKC0pClsuLi5dCj4gPiArcGF0dGVyblByb3Bl
cnRpZXM6Cj4gPiArICAiXmRtYS1jaGFubmVsQC4qJCI6Cj4gPiArICAgIHR5cGU6IG9iamVjdAo+
IAo+ICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKCkknbGwgYWRkIGl0LgoKPiAo
VGhlIHRvb2xzIHNob3VsZCBoYXZlIGhpZ2hsaWdodGVkIHRoaXMpCgpXaXRoIGR0c2NoZW1hIDIw
MjQuMTEgaW5zdGFsbGVkLCAibWFrZSBkdF9iaW5kaW5nX2NoZWNrCkRUX1NDSEVNQV9GSUxFUz1m
c2wsZWxvLWRtYS55YW1sIiBkb2VzIG5vdCBoaWdobGlnaHQgdGhpcy4KCj4gPiArCj4gPiArICAg
IHByb3BlcnRpZXM6Cj4gPiArICAgICAgY29tcGF0aWJsZToKPiA+ICsgICAgICAgIGl0ZW1zOgo+
ID4gKyAgICAgICAgICAtIGVudW06Cj4gPiArICAgICAgICAgICAgICAtIGZzbCxtcGM4MzE1LWRt
YS1jaGFubmVsCj4gPiArICAgICAgICAgICAgICAtIGZzbCxtcGM4MzIzLWRtYS1jaGFubmVsCj4g
PiArICAgICAgICAgICAgICAtIGZzbCxtcGM4MzQ3LWRtYS1jaGFubmVsCj4gPiArICAgICAgICAg
ICAgICAtIGZzbCxtcGM4MzQ5LWRtYS1jaGFubmVsCj4gPiArICAgICAgICAgICAgICAtIGZzbCxt
cGM4MzYwLWRtYS1jaGFubmVsCj4gPiArICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3LWRtYS1j
aGFubmVsCj4gPiArICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc4LWRtYS1jaGFubmVsCj4gPiAr
ICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc5LWRtYS1jaGFubmVsCj4gPiArICAgICAgICAgIC0g
Y29uc3Q6IGZzbCxlbG8tZG1hLWNoYW5uZWwKPiA+ICsKPiA+ICsgICAgICByZWc6Cj4gPiArICAg
ICAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgICAgIGNlbGwtaW5kZXg6Cj4gPiArICAgICAg
ICBkZXNjcmlwdGlvbjogRE1BIGNoYW5uZWwgaW5kZXggc3RhcnRzIGF0IDAuCj4gPiArCj4gPiAr
ICAgICAgaW50ZXJydXB0czogdHJ1ZQo+IAo+IFlvdSBoYXZlIHRvIGRlZmluZSBob3cgbWFueSBp
bnRlcnJ1cHRzIGFuZCB3aGF0IHRoZXkgYXJlLgoKV2lsbCBkby4KCihhbmQgdGhlIHNhbWUgZm9y
IHRoZSBvdGhlciB0d28gZmlsZXMpCgoKQmVzdCByZWdhcmRzLApKLiBOZXVzY2jDpGZlcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
