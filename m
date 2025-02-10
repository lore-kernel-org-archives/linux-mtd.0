Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C271AC0219B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89mteK8P1Da3ObJkUkuNVAG4cWhWZfwClTZMNWp4hHA=; b=aXa2sf7w2rtkQk
	AH8cB646gtJW0W17nezQlqT4FAUQHXTy/ByRspAfiKhw6CB1pWPFAM3jXMDYlvPCn4scj+fflBoCj
	lbtToHdmDRADcy7rExq0fBtTuvx5u0kW/N60eiCRb/Da+HlN3Kdb/7c5HbQ0bkrzMyxlO0Vng33Fy
	tbkggyZUkqmse7/fkOMN7VKkiyDA+nG/xFSRHaVqHLMk+ajlkzAQTIgcg/IVuQ5UHpZrFSWnEAaRr
	ETNutNYLBw3rWhEULh3+73b+UJoEFo7LYvSw4pg5b9qfHi0bOcOuwy4VjpS9mpO+uWh63xVOchyJI
	V4jJOWrwdeEFF4d2rllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thP8k-0000000GeBQ-1zph;
	Mon, 10 Feb 2025 08:27:38 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thP8g-0000000GeA3-2HDI
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 08:27:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E7EC441F0;
	Mon, 10 Feb 2025 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739176047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8e9TvzMvnN655dD9mW3ziQ4pedVgVTCtFygXZeQGWbI=;
	b=ZY02NguFvp2D4ou3No/QCzpfSTJ/vEq/6qT+XJ/nvm4ksYAK39lFMb0mQgDBqM0QIBRl1F
	8lQkkIF/mc8rfl0l4flqx4G6JMtztvl8iq4f4mpGpYsw9F+0rmgop6/sp/OOfQsixdP9Hn
	F5EBu6cuuY9MfhzpBOyfm3OiCFVmX2cf9gRlizM56NuNZNK60icbcTT+3/d+T/Unba6ad9
	nIAJD/b54HfwpeWm89ATdYeoXB7ZO5w+IHsHy0eoz3L543OybW2v5YkqjOB1Y1pInLZonw
	gvl82hS9MNgYZaE0ZItYKARh4AqYqBh+HH0IcpFf14eU4/gDM4YqjQJ7ekjhow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= via B4 Relay
 <devnull+j.ne.posteo.net@kernel.org>
Cc: devicetree@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,  Krzysztof
 Kozlowski <krzk@kernel.org>,  j.ne@posteo.net,  imx@lists.linux.dev,
  Scott Wood <oss@buserror.net>,  Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas
 Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Damien Le Moal <dlemoal@kernel.org>,
  Niklas Cassel <cassel@kernel.org>,  Herbert Xu
 <herbert@gondor.apana.org.au>,  "David S. Miller" <davem@davemloft.net>,
  Lee Jones <lee@kernel.org>,  Vinod Koul <vkoul@kernel.org>,  Lorenzo
 Pieralisi <lpieralisi@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Bjorn Helgaas
 <bhelgaas@google.com>,  J. =?utf-8?Q?Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>,  Wim Van
 Sebroeck <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-ide@vger.kernel.org,  linux-crypto@vger.kernel.org,
  dmaengine@vger.kernel.org,  linux-pci@vger.kernel.org,
  linux-watchdog@vger.kernel.org,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
In-Reply-To: <20250207-ppcyaml-v2-12-8137b0c42526@posteo.net> ("J.
 =?utf-8?Q?Neusch=C3=A4fer?=
	via B4 Relay"'s message of "Fri, 07 Feb 2025 22:30:29 +0100")
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
	<20250207-ppcyaml-v2-12-8137b0c42526@posteo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 09:27:22 +0100
Message-ID: <87o6zaurv9.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepuggvvhhnuhhllhdojhdrnhgvrdhpohhsthgvohdrnhgvtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhdrnhgvsehpohhst
 hgvohdrnhgvthdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhsshessghushgvrhhrohhrrdhnvghtpdhrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_002735_234125_0651422F 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgpPbiAwNy8wMi8yMDI1IGF0IDIyOjMwOjI5ICswMSwgSi4gTmV1c2Now6RmZXIgdmlh
IEI0IFJlbGF5IDxkZXZudWxsK2oubmUucG9zdGVvLm5ldEBrZXJuZWwub3JnPiB3cm90ZToKCj4g
RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0Pgo+Cj4gSW4gc29tZSBzY2Vu
YXJpb3MsIHN1Y2ggYXMgdW5kZXIgdGhlIEZyZWVzY2FsZSBlTEJDIGJ1cywgdGhlcmUgYXJlIHJh
dwo+IE5BTkQgY2hpcHMgd2l0aCBhIHVuaXQgYWRkcmVzcyB0aGF0IGhhcyBhIGNvbW1hIGluIGl0
IChjcyxvZmZzZXQpLgo+IFJlbGF4IHRoZSAkbm9kZW5hbWUgcGF0dGVybiBpbiByYXctbmFuZC1j
aGlwLnlhbWwgdG8gYWxsb3cgc3VjaCB1bml0Cj4gYWRkcmVzc2VzLgoKVGhpcyBpcyBzdXBlciBz
cGVjaWZpYyB0byB0aGlzIGNvbnRyb2xsZXIsIEknZCByYXRoZXIgYXZvaWQgdGhhdCBpbiB0aGUK
bWFpbiAoc2hhcmVkKSBmaWxlcy4gSSBiZWxpZXZlIHlvdSBjYW4gZm9yY2UgYW5vdGhlciBub2Rl
IG5hbWUgaW4gdGhlCmNvbnRyb2xsZXIncyBiaW5kaW5nIGluc3RlYWQ/CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
