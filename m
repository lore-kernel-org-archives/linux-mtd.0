Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32960C021A0
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 02:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wVj7EqSR9ZAUDAJHcUaJNEMMKT440R/IXBcolZjG/0=; b=iWeijmOLFTr+8X
	PCJNnlXoD1C1FUXdXYAyV9eURN/9t1UaRIYk/eyYnfehG5DeBafnjMs/xFdDHOdQ8s1E46rwSNHuG
	Jn9YQpgFPlgbdP7NtBbYN/DgL9ett8uY4sKcQEvqd6u3bqHVkMPdBCVCjbVEcUfM4UsEZY9F2Zatd
	yt7O4Eu0uSMP7y8hhTPOqFJ9hPH8dMDSCfiNcMb12u3AQot/3ItsrqiXzy0F71/6KZYeqDapH+wS/
	r26AgPpONR4EV54JXZaGJg1wVjs+FKTbpKTrFJyQFc5EGg1XkI5jYo5+buqEyr2dkFTrwQtiowfdu
	4lWUc1lXMktwdoYHq2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilfZ-0000000DNxu-1jsD;
	Fri, 14 Feb 2025 02:43:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til49-0000000DGR6-0Yis
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Feb 2025 02:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EAIg7P9NijZgjwq+VDVW+hbvRMb79rSCrOfw1wR+Kr0=; b=ab8WhxWG3wnt6oyplm8IIDjm05
	vxAGN3VInOxXwMzld5EZqcQIJuSdNQOUOLOW3FC0CB5VNZnQ9T5rK9eVoNe5uaMuSyEtNk9OrhvoF
	daNyq4CMaWJ1nLyYYzNn366gyzbNP4sMwISFEcPVW1Gj9v85rdbXuFcQVcUEFsD3b417KJzeorim5
	OxKGOw5zrtgkH2BCM3j7PiP39mYSJVFxZkaCS7tvbsY38HkvjhuA79RqHWkSTHWLUH+UW2sTe41JI
	Fol50HIrytT5Puk3xAPJW06fGHtna8FqaKhyH/jcGN9jiguLAFUsUnyAKkXAtI9aWTCp5BDUb5Rse
	txZrTvXg==;
Received: from [185.67.36.65] (helo=mout01.posteo.de)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til44-00000001ADa-1hF0
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 02:04:27 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 77019240027
	for <linux-mtd@lists.infradead.org>; Fri, 14 Feb 2025 03:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739498650; bh=WhJmekLyQeapuWa9J6WUco9/aFXXshTQJPKudksd1Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=eFjWex3bTov6olg/0gN7JuhFo0JjTo20CjyVpVLyVEH7hS9CHxqqSRcaZ/vhQbDmQ
	 CrEhbemktkApvxSVJ3ETlUFO35YegC7EcoCiz1D0+NKiLAJjIOOZy6J+52wR1teqMd
	 AWP3LO6ndYvMyL1DhNaT/cv7z1+i88z5SrtiHdTEod7F6Ct5I6xJ6KyW17Y2SQ/UQz
	 P5bY9HMw2QUM4BE7u2V7r2IONbvCFcXS0pBnCvL1rMAJz8veOcFLR/6RDdyAlCVlnO
	 T2tyGaVzw8XHplfjuCSbzC1OSpwx4gOCCfwv2y1Vf2GGTfxxGiA9tnCYSW4RFlZ1kQ
	 zVTDiiLPXiuNg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YvFhy67kgz9rxF;
	Fri, 14 Feb 2025 03:04:02 +0100 (CET)
Date: Fri, 14 Feb 2025 02:04:02 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
Subject: Re: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to YAML
Message-ID: <Z66kksKzsknmOy5Q@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
 <20250212193314.GA4134845-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212193314.GA4134845-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_020425_613683_010A5724 
X-CRM114-Status: GOOD (  16.16  )
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

T24gV2VkLCBGZWIgMTIsIDIwMjUgYXQgMDE6MzM6MTRQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBGZWIgMDcsIDIwMjUgYXQgMTA6MzA6MjBQTSArMDEwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gPiBDb252ZXJ0IHRoZSBGcmVlc2NhbGUgc2VjdXJpdHkgZW5naW5lIChj
cnlwdG8gYWNjZWxlcmF0b3IpIGJpbmRpbmcgZnJvbQo+ID4gdGV4dCBmb3JtIHRvIFlBTUwuIFRo
ZSBsaXN0IG9mIGNvbXBhdGlibGUgc3RyaW5ncyByZWZsZWN0cyB3aGF0IHdhcwo+ID4gcHJldmlv
dXNseSBkZXNjcmliZWQgaW4gcHJvc2U7IG5vdCBhbGwgY29tYmluYXRpb25zIG9jY3VyIGluIGV4
aXN0aW5nCj4gPiBkZXZpY2V0cmVlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2No
w6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiA+IC0tLQo+ID4gCj4gPiBWMjoKPiA+IC0gc2V2ZXJh
bCBpbXByb3ZlbWVudHMgc3VnZ2VzdGVkIGJ5IFJvYiBIZXJyaW5nOgo+ID4gICAtIHJlbW92ZSB1
bm5lY2Vzc2FyeSBtdWx0aWxpbmUgbWFya2Vycwo+ID4gICAtIGNvbnN0cmFpbiBmc2wsbnVtLWNo
YW5uZWxzIHRvIGVudW06IFsxLDRdCj4gPiAgIC0gY29uc3RyYWluIGZzbCxjaGFubmVsLWZpZm8t
bGVuIHRvIHBsYXVzaWJsZSBsaW1pdHMKPiA+ICAgLSBjb25zdHJhaW4gZnNsLGV4ZWMtdW5pdHMt
bWFzayB0byBtYXhpbXVtPTB4ZmZmCj4gPiAtIHRyaW0gc3ViamVjdCBsaW5lIChyZW1vdmUgImJp
bmRpbmciKQo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL2ZzbCxz
ZWMyLjAueWFtbCAgICAgfCAxNDIgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY3J5cHRvL2ZzbC1zZWMyLnR4dCAgICAgICAgfCAgNjUgLS0tLS0tLS0t
LQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTQyIGluc2VydGlvbnMoKyksIDY1IGRlbGV0aW9ucygt
KQpbLi4uXQo+ID4gK3RpdGxlOiBGcmVlc2NhbGUgU29DIFNFQyBTZWN1cml0eSBFbmdpbmVzIHZl
cnNpb25zIDEueC0yLngtMy54Cj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEouIE5l
dXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQuCj4gCj4gbWlzc2luZyA+CgpHb29kIGNhdGNoLCB3
aWxsIGZpeC4KCgo+ID4gKyAgZnNsLGRlc2NyaXB0b3ItdHlwZXMtbWFzazoKPiA+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIGRlc2Ny
aXB0aW9uOiB8Cj4gPiArICAgICAgVGhlIGJpdG1hc2sgcmVwcmVzZW50aW5nIHdoYXQgZGVzY3Jp
cHRvcnMgYXJlIGF2YWlsYWJsZS4gRGVzY3JpcHRvciB0eXBlCj4gPiArICAgICAgaW5mb3JtYXRp
b24gc2hvdWxkIGJlIGVuY29kZWQgZm9sbG93aW5nIHRoZSBTRUMncyBEZXNjcmlwdG9yIEhlYWRl
ciBEd29yZAo+ID4gKyAgICAgIERFU0NfVFlQRSBmaWVsZCBkb2N1bWVudGF0aW9uLCBpLmUuIGFz
IGZvbGxvd3M6Cj4gPiArCj4gPiArICAgICAgICBiaXQgMCAgPSBzZXQgaWYgU0VDIHN1cHBvcnRz
IHRoZSBhZXN1X2N0cl9ub25zbm9vcCBkZXNjLiB0eXBlCj4gPiArICAgICAgICBiaXQgMSAgPSBz
ZXQgaWYgU0VDIHN1cHBvcnRzIHRoZSBpcHNlY19lc3AgZGVzY3JpcHRvciB0eXBlCj4gPiArICAg
ICAgICBiaXQgMiAgPSBzZXQgaWYgU0VDIHN1cHBvcnRzIHRoZSBjb21tb25fbm9uc25vb3AgZGVz
Yy4gdHlwZQo+ID4gKyAgICAgICAgYml0IDMgID0gc2V0IGlmIFNFQyBzdXBwb3J0cyB0aGUgODAy
LjExaSBBRVMgY2NtcCBkZXNjLiB0eXBlCj4gPiArICAgICAgICBiaXQgNCAgPSBzZXQgaWYgU0VD
IHN1cHBvcnRzIHRoZSBobWFjX3Nub29wX25vX2FmZXUgZGVzYy4gdHlwZQo+ID4gKyAgICAgICAg
Yml0IDUgID0gc2V0IGlmIFNFQyBzdXBwb3J0cyB0aGUgc3J0cCBkZXNjcmlwdG9yIHR5cGUKPiA+
ICsgICAgICAgIGJpdCA2ICA9IHNldCBpZiBTRUMgc3VwcG9ydHMgdGhlIG5vbl9obWFjX3Nub29w
X25vX2FmZXUgZGVzYy50eXBlCj4gPiArICAgICAgICBiaXQgNyAgPSBzZXQgaWYgU0VDIHN1cHBv
cnRzIHRoZSBwa2V1X2Fzc2VtYmxlIGRlc2NyaXB0b3IgdHlwZQo+ID4gKyAgICAgICAgYml0IDgg
ID0gc2V0IGlmIFNFQyBzdXBwb3J0cyB0aGUgYWVzdV9rZXlfZXhwYW5kX291dHB1dCBkZXNjLnR5
cGUKPiA+ICsgICAgICAgIGJpdCA5ICA9IHNldCBpZiBTRUMgc3VwcG9ydHMgdGhlIHBrZXVfcHRt
dWwgZGVzY3JpcHRvciB0eXBlCj4gPiArICAgICAgICBiaXQgMTAgPSBzZXQgaWYgU0VDIHN1cHBv
cnRzIHRoZSBjb21tb25fbm9uc25vb3BfYWZldSBkZXNjLiB0eXBlCj4gPiArICAgICAgICBiaXQg
MTEgPSBzZXQgaWYgU0VDIHN1cHBvcnRzIHRoZSBwa2V1X3B0YWRkX2RibCBkZXNjcmlwdG9yIHR5
cGUKPiAKPiBXaHkgMyB2YXJpYXRpb25zIG9mICdkZXNjcmlwdG9yIHR5cGUnPwoKVGhlIHJlYXNv
bnMgaGF2ZSBiZWVuIGxvc3QgaW4gdGltZSwgSSBzdXBwb3NlLiBJJ2xsIG5vcm1hbGl6ZSB0aGUg
c3BlbGxpbmcuCgoKVGhhbmtzLApKLiBOZXVzY2jDpGZlcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
