Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6321C021A1
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGTTFO7VACMpJP3abqvxXSCdBoAOudiWo0adDRep6Y0=; b=AIAgOjYZ0Xv72x
	xjMm4LZY9n3sKtjw1Lws8uKbL8Kpe2rQaqvnBc/yPYe/uR64vJ5FkjxZSQQQEG2nT5hzVNR3jNmZN
	R8Xdf0e/1xilC+cjD7iBTY9zJ2B8kzoL27VMRk54HdS/LbXShcK8Vn87G7IBjbkGtmUBJUgfUkdnt
	BvjUYjDxYUMF8QsFKr2KAYPHg9wKbD6ZK4kUoKxSPR4PFgYOsiq083wQGeSF/mGuRBdeQzMs6W6oD
	aGE5kj0v7ZCk7xuZ4kT7P84qHGQw8bau2Lx+3aQ1hzdiLNRrSZY2ACoRgX2RMZsrDuyJx8/ZkWQXy
	wDcsp8/wN/nVFhe5GNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thr19-000000044iS-2RlR;
	Tue, 11 Feb 2025 14:13:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thr17-000000044i1-135O
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 14:13:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9475FA40451;
	Tue, 11 Feb 2025 14:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FA2C4CEDD;
	Tue, 11 Feb 2025 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739283215;
	bh=vDix81U6Ld3DReX03VSDWokaA9gTIex+ysGARHYBa4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UWXtA3oTS+v0q5G+sC9wAGrQZjODEQAnaR0oVQTshDp+I9TwaC8dSIgVEox+pVhiv
	 WWcvOT3MmyWJ75dZACpkY8Ja3QESry9PBuQV9mlp1VMqI/238hvWLqFYRuZ9Jqm0oN
	 cwTz0p2oIVVzONSb4lDc9caK6gmpqGWLqfw/lwN56VuXEYaARH68C1tUya+W8JUVg9
	 3U5dEFvvQsZXw3u7N+8B3j4rIFzCmvZVl7xl2QxnqTdoxo6WV51ZbZRiK96/YKQpV9
	 1kOSZLQ8BBJBrMsbguCncwtdh8zf2Crfw5Wgh4QQqqYCFFWPSquZBXcWueQ4cHPvb6
	 srLbfkvAlWIXA==
From: Lee Jones <lee@kernel.org>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
Subject: Re: (subset) [PATCH 4/9] dt-bindings: mfd: Convert
 fsl,mcu-mpc8349emitx binding to YAML
Message-Id: <173928320921.2188572.3955959141357602902.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 14:13:29 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_061337_352189_5C6C5157 
X-CRM114-Status: UNSURE (   6.20  )
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

T24gU3VuLCAyNiBKYW4gMjAyNSAxOTo1ODo1OSArMDEwMCwgSi4gTmV1c2Now6RmZXIgd3JvdGU6
Cj4gQ29udmVydCBtY3UtbXBjODM0OWVtaXR4LnR4dCB0byBZQU1MIGFuZCBsaXN0IHRoZSBjb21w
YXRpYmxlIHN0cmluZ3MKPiBjdXJyZW50bHkgaW4gdXNlLgo+IAo+IAoKQXBwbGllZCwgdGhhbmtz
IQoKWzQvOV0gZHQtYmluZGluZ3M6IG1mZDogQ29udmVydCBmc2wsbWN1LW1wYzgzNDllbWl0eCBi
aW5kaW5nIHRvIFlBTUwKICAgICAgY29tbWl0OiAyNTJjOTVlYzM4MDJhNWY0NDdkZjU4MjUzNTc1
YjUyYWE3NDFjMWExCgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
