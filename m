Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28A1C0219B
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7V9VMcDjnQi+N1B4nyHFYqaTZBupx+DmF6RbvOWERg=; b=2xSSMnLKBNalgm
	kHHw0/kOtq5I3abGL0L7a4wu23iett+x/qWjAv77mkyuDS/1rKb6opwsAhXxlkaaAbxcwsgpX+kup
	/OxVFlgHoAnM3CjNbMN2J16Wl/Z2fhEXWb/q/uIZ2iRlgiCJqaG+wpUpoh146tr7rshxSRs3OnU4N
	i0zcxJo+L4IzH6WIrxhYPp3z4BDicC9n+crJUkYy35VPtzZi5moGydpknA6aPdOz0Vzcp6L0x0TcH
	hqc0QYJVFCl/qPyAeXqd0Fzc0nU2C//2jdXgYCw2qizZJpEelDTt8r/61puKhkW0dltzP05q1m7gK
	FK8lWnN43PUeyaestb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thB6Z-0000000FFi9-1yYt;
	Sun, 09 Feb 2025 17:28:27 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thB6W-0000000FFhK-34Yk
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 17:28:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 01BE1240028
	for <linux-mtd@lists.infradead.org>; Sun,  9 Feb 2025 18:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739122101; bh=3qpw2bQ12DB6YGamFBnTxyKWuhTs/kDLk94p3S330Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=RHnN+wDKAMU0dOwFT1Pu7fyGsT0Gt9DsPRzfHDfqEPrdS6Qf2YK2JJbyvmVX0ooh4
	 EcSNJH+559vYooXaiUo4suSNha8ozsDhaK0855yvWR7FowQZHkM5intMA3Xm8631mg
	 fwcitB6a3NHfwWk/AOkYnottBn4nxixjXVY4sV+irUOpblwVZDLNmNTWGa9LunO/ea
	 GhBbXZquiNiSXqobyOmRe6R04m2y2qX7QMm6KCtHF/CbbFSgw4C1PaK0DgG5VDF8DF
	 40s8seJG1eG99kWjdKwGXpTWUw8q1BthHVVojmnH/cU7wXLVR9miP+A7QZwlizo+9r
	 uU2hyqwUMjw3A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YrZRd3h87z9rxG;
	Sun,  9 Feb 2025 18:28:13 +0100 (CET)
Date: Sun,  9 Feb 2025 17:28:13 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Mark Brown <broonie@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-ide@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>, Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <Z6jlrU7EPeATjK8s@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <173897189669.2630636.11579554304003668196.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173897189669.2630636.11579554304003668196.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_092825_058379_4F28281B 
X-CRM114-Status: GOOD (  11.15  )
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

T24gRnJpLCBGZWIgMDcsIDIwMjUgYXQgMDU6NDQ6NTlQTSAtMDYwMCwgUm9iIEhlcnJpbmcgKEFy
bSkgd3JvdGU6Cj4gT24gRnJpLCAwNyBGZWIgMjAyNSAyMjozMDoyNiArMDEwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6ClsuLi5dCj4gPiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9m
c2wsZWxiYy55YW1sICAgICAgfCAxNDYgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvbGJjLnR4dCAgICAgICAgfCAgNDMgLS0tLS0t
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0p
ClsuLi5dCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLmV4YW1wbGUuZHRi
OiAvZXhhbXBsZS0wL2xvY2FsYnVzQGYwMDEwMTAwL3NpbXBsZS1wZXJpcGhAMiwwOiBmYWlsZWQg
dG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnZnNsLGVsYmMtZ3BjbS11aW8n
XQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMv
ZnNsLGVsYmMuZXhhbXBsZS5kdGI6IC9leGFtcGxlLTEvbG9jYWxidXNAZTAwMDUwMDAvbmFuZEAx
LDA6IGZhaWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydmc2wsbXBj
ODMxNS1mY20tbmFuZCcsICdmc2wsZWxiYy1mY20tbmFuZCddCj4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9mc2wsZWxiYy5leGFtcGxlLmR0Yjog
L2V4YW1wbGUtMS9sb2NhbGJ1c0BlMDAwNTAwMC9uYW5kQDEsMDogZmFpbGVkIHRvIG1hdGNoIGFu
eSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2ZzbCxtcGM4MzE1LWZjbS1uYW5kJywgJ2ZzbCxl
bGJjLWZjbS1uYW5kJ10KCkkgdGhpbmsgdGhpcyBpcyBkdWUgdG8gaG93IHRoZSBwYXRjaGVzIGFy
ZSBvcmRlcmVkIGluIHRoZSBzZXJpZXMuClRoaXMgcGF0Y2ggdXNlcyBmc2wsZWxiYy1ncGNtLXVp
byBhbmQgZnNsLGVsYmMtZmNtLW5hbmQgaW4gZXhhbXBsZXMsIGJ1dApjb21lcyBiZWZvcmUgdGhl
IHBhdGNoZXMgdGhhdCBkZWZpbmUgdGhlIGNvcnJlc3BvbmRpbmcgYmluZGluZ3MuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
