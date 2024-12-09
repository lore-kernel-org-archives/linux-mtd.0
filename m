Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276DDE7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 07:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPFD9ybHIT2nxhwk+omUxk+Cyybl4k7w1tINE7u8bJ0=; b=RYVCqqnct78wRz
	8Of0rB56KJl+7BPIEUc8JZrFX/+bYP83uk9OCP7HBRwqAKT8WisVSBevQNn62c688eX8mABZkdIRG
	xGX5qiPhzpRFKgQ7hojsVPnl1G/AbvqhHWuVmv0Sr5dHKnUBGXetflI/1HEvOYiJPj7V/cHkqfIwu
	iU40nSGndNsB+fWxoaJf0PL/NueNnwgJ1b7eWZi/cwmVMDxE0YhAIrqCZjhxOTo+jFGBlYptvxJNs
	YNWVxZUNQsln5TdD2fgVNxlsg4/06qchHTSKO1tfxE3huQYujSI2QFrOo3C3lzlTrShJvwr2KAHol
	eRzJ8bSYT+3xQIouEzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYJG-00000006k4Z-1lyX;
	Mon, 09 Dec 2024 07:36:02 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYJE-00000006k3Q-0cWQ
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 07:36:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 882E060023;
	Mon,  9 Dec 2024 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733729754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozEPG5B3x7bDnu8neWhW6s4xV4Fs5uDWi0bVNT4nIeY=;
	b=iJ2PUVR3rsE1jLme5fJDoqFVTfco0xRCs5MY3C0V6CXK0XcKMDvrVlmkVmwXwxGq8rSOhv
	OzIT0JkNZQSEMPWOa8KWu+ZEvSXM/bWQoSaiPmRg0tFIv6e+uXOe0Onw/O7NgabWIwMEZg
	1YzPjjb3XmRc/vlzqLA0O8tshWlwbRkNLuu8Z5yzAaeAYlZvfW7+TUFbOOYdFMeVYu5nz3
	DbpwSL+omkquGi4VJwvPdRjyFrHAbZl7mF3QK0nBZNwnHg7VnUXZeLT1TQxV2rREAaAfaS
	ZiYnXWM7qeYqDNxSDDY31/Z3iasXkYRthh1Xh5cOxFN/IHP5bgrN95Ypf33kog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,  "Richard Weinberger" <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  "Rob Herring" <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  "Conor Dooley"
 <conor+dt@kernel.org>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
In-Reply-To: <BL3PR11MB653282E179DA562E3F4AB707A23C2@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Mon, 9 Dec 2024 01:36:57 +0000")
References: <20241205053350.434370-1-niravkumar.l.rabara@intel.com>
	<87mshawhta.fsf@bootlin.com>
	<ugcx6muozaven6lolhzpk5mvrt5fncoaahnsx5lbdsaurid4mc@i4qflh2edqnh>
	<BL3PR11MB653282E179DA562E3F4AB707A23C2@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Dec 2024 08:35:06 +0100
Message-ID: <87jzc9mhqt.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_233600_327941_EF2F9199 
X-CRM114-Status: GOOD (  10.60  )
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

T24gMDkvMTIvMjAyNCBhdCAwMTozNjo1NyBHTVQsICJSYWJhcmEsIE5pcmF2a3VtYXIgTCIgPG5p
cmF2a3VtYXIubC5yYWJhcmFAaW50ZWwuY29tPiB3cm90ZToKCj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4K
Pj4gU2VudDogU3VuZGF5LCA4IERlY2VtYmVyLCAyMDI0IDEwOjI2IFBNCj4+IFRvOiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBDYzogUmFiYXJhLCBOaXJhdmt1
bWFyIEwgPG5pcmF2a3VtYXIubC5yYWJhcmFAaW50ZWwuY29tPjsKPj4gZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+OyBWaWduZXNo
Cj4+IFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mCj4+IEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29u
b3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgbGludXgtCj4+IG10ZEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjRdIGR0LWJpbmRpbmdzOiBtdGQ6IGNhZGVuY2U6IGNvbnZlcnQgY2FkZW5jZS1uYW5k
LQo+PiBjb250cm9sbGVyLnR4dCB0byB5YW1sCj4+IAo+PiBPbiBUaHUsIERlYyAwNSwgMjAyNCBh
dCAxMToyMjowOUFNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiA+IE9uIDA1LzEyLzIw
MjQgYXQgMTM6MzM6NTAgKzA4LCBuaXJhdmt1bWFyLmwucmFiYXJhQGludGVsLmNvbSB3cm90ZToK
Pj4gPgo+PiA+ID4gRnJvbTogTmlyYXZrdW1hciBMIFJhYmFyYSA8bmlyYXZrdW1hci5sLnJhYmFy
YUBpbnRlbC5jb20+Cj4+ID4gPgo+PiA+ID4gQ29udmVydCBjYWRlbmNlLW5hbmQtY29udHJvbGxl
ci50eHQgdG8geWFtbCBmb3JtYXQuCj4+ID4gPiBVcGRhdGUgY2FkZW5jZS1uYW5kLWNvbnRyb2xs
ZXIudHh0IHRvIGNkbnMsaHAtbmZjLnlhbWwgaW4gTUFJTlRBSU5FUgo+PiBmaWxlLgo+PiA+ID4K
Pj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pcmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2a3VtYXIubC5y
YWJhcmFAaW50ZWwuY29tPgo+PiA+Cj4+ID4gTG9va3MgZ29vZCB0byBtZSwgYnV0IEknbGwgd2Fp
dCBmb3IgYmluZGluZyBtYWludGFpbmVycyBhY2sgb2ZjLgo+PiAKPj4gVGhlcmUgd2FzIG9uZSwg
YnV0IGF1dGhvciBpZ25vcmVkIGl0Lgo+PiAKPj4gQmVzdCByZWdhcmRzLAo+PiBLcnp5c3p0b2YK
Pgo+IE15IGFwb2xvZ2llcywgSSBmb3Jnb3QgdG8gaW5jbHVkZSB0aGUgJ1Jldmlld2VkLWJ5OiBD
b25vciBEb29sZXkKPiBjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbScgdGFnIHRoYXQgSSByZWNl
aXZlZCBpbiB0aGUgdjMgcGF0Y2guIEkgd2lsbAo+IGVuc3VyZSB0aGlzIGRvZXMgbm90IGhhcHBl
biBhZ2Fpbi4KClBsZWFzZSByZS1zZW5kIHdpdGggdGhlIG1pc3NpbmcgdGFnKHMpLCBvdGhlcndp
c2UgdGhleSB3aWxsIG5vdCBiZQpwaWNrZWQtdXAgKGF1dG9tYXRpY2FsbHkpLgoKQ2hlZXJzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
