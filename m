Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14072C0219E
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDm3OhHh9vS1jpBseGcTyNV4qnb5T1pYNFnOT6vy4FA=; b=bcoW7PZVDYoKy/
	zPGuQHWfknR7rDs2AuBJgctRGGpASAn1bw/9UyMsdYSXK0pUuyvWjO0CF1WorLIXZcuQKe5jKzL26
	aWn7AjH01AhQyvaO4BgPJNKEQNoh1b0PMq31QpmM8ftN/i1QrnNdSPt9iuXaghuonHdSdQKpimGnQ
	/hLKIXoPWEtAG/ML2ZU2ONOK/6qj09AMCi6A3TqtA1w193jRmCiJizg9L/RK7D7UM7vRYLNtf8M3D
	iYtYkayoWLcAbw6TxokWC3g2lckHe7DInpqqT11wbJ51hUzLhihLWVCvAzg4lUEBmapuexOPbHhzp
	dFKJW3Yz/8bLOw98vqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyl9-00000004BaY-0AeM;
	Mon, 17 Feb 2025 10:53:55 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyGH-00000004648-3tA2
	for linux-mtd@lists.infradead.org;
	Mon, 17 Feb 2025 10:22:03 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id ABA7C240027
	for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2025 11:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739787718; bh=jMs/nQgZnmKABPkw9jqt7Jfzzk1OWmU8OV/13GG2QpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=VoOKg8ScbUMn0vwJXXeE+NHJZ0a9mDWjY3CeKpA7rXlmzvqNpeipXr22cUOZkwj5W
	 hlHqEuxydHy2X+qdRqpAo/cZQ0lKjeeiHRkh9nxqXR5EWMuKhJuMZW1Fm26Xtg1VNw
	 tbdXTKy0CrqIUEbhY0LakzhEglbdyyiFYaoYghcIt8r4EyXEM2uxT+QJ6RRDWpBWm4
	 OAMMipY1+hxsNKuYe7M94yopTUKCsQDL/6zirsQuwS50oW7b0kPaaMuIW9tg7PQOzY
	 ahZGwYFab344VQG/hqYTXsssLZrxpk4bz1wWrxm03KZGWNYvnFT67CaAZfNIy7ddYs
	 JG3RfyGnXf56g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YxJc00sngz9rxD;
	Mon, 17 Feb 2025 11:21:51 +0100 (CET)
Date: Mon, 17 Feb 2025 10:21:51 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
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
Message-ID: <Z7MNv4NX8dSztdsP@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
 <87o6zaurv9.fsf@bootlin.com>
 <Z7Iqir-qaZDt6tsx@probook>
 <87tt8svrxf.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tt8svrxf.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_022202_265311_F2565C4C 
X-CRM114-Status: GOOD (  19.61  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMTA6MzE6MDhBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIZWxsbywKPiAKPiA+PiA+IEluIHNvbWUgc2NlbmFyaW9zLCBzdWNoIGFzIHVuZGVy
IHRoZSBGcmVlc2NhbGUgZUxCQyBidXMsIHRoZXJlIGFyZSByYXcKPiA+PiA+IE5BTkQgY2hpcHMg
d2l0aCBhIHVuaXQgYWRkcmVzcyB0aGF0IGhhcyBhIGNvbW1hIGluIGl0IChjcyxvZmZzZXQpLgo+
ID4+ID4gUmVsYXggdGhlICRub2RlbmFtZSBwYXR0ZXJuIGluIHJhdy1uYW5kLWNoaXAueWFtbCB0
byBhbGxvdyBzdWNoIHVuaXQKPiA+PiA+IGFkZHJlc3Nlcy4KPiA+PiAKPiA+PiBUaGlzIGlzIHN1
cGVyIHNwZWNpZmljIHRvIHRoaXMgY29udHJvbGxlciwgSSdkIHJhdGhlciBhdm9pZCB0aGF0IGlu
IHRoZQo+ID4+IG1haW4gKHNoYXJlZCkgZmlsZXMuIEkgYmVsaWV2ZSB5b3UgY2FuIGZvcmNlIGFu
b3RoZXIgbm9kZSBuYW1lIGluIHRoZQo+ID4+IGNvbnRyb2xsZXIncyBiaW5kaW5nIGluc3RlYWQ/
Cj4gPgo+ID4gSXQncyBhIGJpdCB0cmlja3kuIEFGQUlDUywgd2hlbiBJIGRlY2xhcmUgYSBub2Rl
IG5hbWUgcGF0dGVybiBpbiBteQo+ID4gc3BlY2lmaWMgYmluZGluZyBpbiBhZGRpdGlvbiB0byB0
aGUgZ2VuZXJpYyBiaW5kaW5nLCB0aGUgcmVzdWx0IGlzIHRoYXQKPiA+IGJvdGggb2YgdGhlbSBh
cHBseSwgc28gSSBjYW4ndCByZWxheCBzdHJpY3RlciByZXF1aXJlbWVudHM6Cj4gPgo+ID4gIyBy
YXctbmFuZC1jaGlwLnlhbWwKPiA+IHByb3BlcnRpZXM6Cj4gPiAgICRub2RlbmFtZToKPiA+ICAg
ICBwYXR0ZXJuOiAiXm5hbmRAW2EtZjAtOV0kIgo+ID4KPiA+ICMgZnNsLGVsYmMtZmNtLW5hbmQu
eWFtbAo+ID4gcHJvcGVydGllczoKPiA+ICAgJG5vZGVuYW1lOgo+ID4gICAgIHBhdHRlcm46ICJe
bmFuZEBbYS1mMC05XSgsWzAtOWEtZl0qKT8kIgo+IAo+IFdlbGwsIEkgZ3Vlc3MgdGhpcyBpcyBj
cmVhdGluZyBhIHNlY29uZCBwb3NzaWJsZSBub2RlIG5hbWUuCj4gCj4gPiAjIGR0Ywo+ID4gLy4u
Li9mc2wsZWxiYy1mY20tbmFuZC5leGFtcGxlLmR0YjoKPiA+IG5hbmRAMSwwOiAkbm9kZW5hbWU6
MDogJ25hbmRAMSwwJyBkb2VzIG5vdCBtYXRjaCAnXm5hbmRAW2EtZjAtOV0kJwo+ID4gICAgICAg
ICBmcm9tIHNjaGVtYSAkaWQ6Cj4gPiAJaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRk
L2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwjCj4gCj4gV2hhdCBhYm91dCBmaXhpbmcgdGhlIERUIGlu
c3RlYWQ/CgpJbiB0aGlzIHBhcnRpY3VsYXIgY29udGV4dCB1bmRlciB0aGUgRnJlZXNjYWxlIGVM
QkMgKCJlbmhhbmNlZCBMb2NhbCBCdXMKQ29udHJvbGxlciIpLCBuYW5kQDEsMCBtYWtlcyBjb21w
bGV0ZSBzZW5zZSwgYmVjYXVzZSBpdCByZWZlcnMgdG8gY2hpcApzZWxlY3QgMSwgb2Zmc2V0IDAu
IFRoZSBlTEJDIGJpbmRpbmcgKHdoaWNoIGhhcyBleGlzdGVkIHdpdGhvdXQgWUFNTApmb3JtYWxp
emF0aW9uIGZvciBhIGxvbmcgdGltZSkgc3BlY2lmaWVzIHRoYXQgZWFjaCBkZXZpY2UgYWRkcmVz
cwppbmNsdWRlcyBhIGNoaXAgc2VsZWN0IGFuZCBhIGJhc2UgYWRkcmVzcyB1bmRlciB0aGF0IENT
LgoKVGhlIGFsdGVybmF0aXZlIG9mIHNwZWxsaW5nIGl0IGFzIG5hbmRAMTAwMDAwMDAwIG1ha2Vz
IHJlYWRhYmlsaXR5CnN0cmljdGx5IHdvcnNlIChJTU8pLgoKRHVlIHRvIHRoZSBjb25mbGljdGlu
ZyByZXF1aXJlbWVudHMgb2Yga2VlcGluZyBjb21wYXRpYmlsaXR5IHdpdGgKaGlzdG9yaWMgZGV2
aWNlIHRyZWVzIGFuZCBjb21wbHlpbmcgd2l0aCBtb2Rlcm4gRFQgY29udmVudGlvbnMsCkknbSBh
bHJlYWR5IGlnbm9yaW5nIGEgdmFsaWRhdGlvbiB3YXJuaW5nIGZyb20gZHRjLCB3aGljaCBzdWdn
ZXN0cyB0bwp1c2UgbmFuZEAxMDAwMDAwMDAgaW5zdGVhZCBvZiBuYW5kQDEsMCBiZWNhdXNlIHRo
ZSBlTEJDIGJ1cyBoYXMKaGlzdG9yaWNhbGx5IGJlZW4gc3BlY2lmaWVkIHdpdGggY29tcGF0aWJs
ZSA9IC4uLiwgInNpbXBsZS1idXMiLApzbyBJIGd1ZXNzIHRoZSBmc2wsZWxiYy1mY20tbmFuZCBi
aW5kaW5nIGNhbid0IGJlIHBlcmZlY3QgYW55d2F5LgoKSW4gYW55IGNhc2UsIEknbGwgZHJvcCB0
aGlzIHBhdGNoIGR1cmluZyBmdXJ0aGVyIGRldmVsb3BtZW50LgoKClRoYW5rIHlvdSBmb3IgeW91
ciBpbnB1dHMsCgpKLiBOZXVzY2jDpGZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
