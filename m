Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D77C02194
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2wyuAYWAQgQErOf5mSD0HnAlIbmUs86+RVdYBLvyvM=; b=qb20OAk3Q1W5pc
	7wwcoBnMU2y5ouTOGbrIfqlP8WlMBDViKq/JySANVULhQKGhLUUn3tJkXuaOSGFBDHuBOnmTZXmJf
	zXGZiaECFhxJrpj4ssTFYClyZdpYScr7mdeyXx7KMDGX43kCFixuh89+EqzP+wRYlSfdHA1pODK5x
	gAvlZgEjei06vnjXdgHCuJCzTdgZQwmxtQn5zqfE+5tAYTktiGOzCgW2zouoS327j3T3M8/KT201h
	vd+QeW42wZnYl9MJ3LpV1Ky25SlUHgbHP3Nv9Ip/CS1esVHzZ1ZNATuYk3z1sHKFKEygDlf+vzhQC
	NCMy/eCgyNsJZi+348Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOXl-00000009gNt-3BVU;
	Fri, 07 Feb 2025 13:37:17 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOXj-00000009gMg-08yV
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 13:37:16 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3A892240101
	for <linux-mtd@lists.infradead.org>; Fri,  7 Feb 2025 14:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738935432; bh=IdbOi6N0+bHgyQ08uTaIC9JomsdE+10WelxdSZmGp0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=DsxxJJuriK7OP/3VAdpJyhOhoqIowUPkuVAs6bIe7RSHnrSQTmrd8/a1Pz3A6wfGk
	 wWBvQqRkfXbmrjUzJDJ7qee4Nx96J2fYuvMUgNF9+MRVjdPg0ygKTXHWT9QUgmaEiU
	 f2ZMTrVA6WyCwliBTXfACOYXbu5IpQAOLzMHbdyDQsMGMte9ag2XeoYgPJ11DGHzzZ
	 YI9B9h8pkDWmEnNuaW1rDdp+sLu0MCREo5AVPVKurrL3bOGq3FkN5/yoTx5fVxFB1W
	 AmgPoDINAPQX7MwC4V3xUd+MxEDsh65nfvE2xVC5HDdaKnXih39UhBaEcb6MnJcx47
	 qZeYjzYclbBpg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YqFPs4w9Pz9rxF;
	Fri,  7 Feb 2025 14:37:05 +0100 (CET)
Date: Fri,  7 Feb 2025 13:37:04 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Scott Wood <oss@buserror.net>,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
Message-ID: <Z6YMgETdCZGMJI4i@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
 <Z5qx3jAFE81Ni2cJ@lizhi-Precision-Tower-5810>
 <Z6KkBEaGTkSyWiE_@probook>
 <689302c6-8fba-4fd1-a4b7-557cb2f8fa4d@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689302c6-8fba-4fd1-a4b7-557cb2f8fa4d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_053715_214911_5009789C 
X-CRM114-Status: UNSURE (   6.72  )
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

T24gVGh1LCBGZWIgMDYsIDIwMjUgYXQgMDY6MTI6NDdQTSArMDUzMCwgTXVrZXNoIEt1bWFyIFNh
dmFsaXlhIHdyb3RlOgo+IG5lYXQ6IHN1YmplY3Q6IHNpbmNlIGJpbmRpbmcgaXMgYWxyZWFkeSBt
ZW50aW9uZWQgaW4gdGhlIHByZWZpeCBvZiB0aGUKPiBzdWJqZWN0LCBubyBuZWVkIHRvIGFkZCBi
aW5kaW5ncyB3b3JkIGFnYWluLgoKU291bmRzIHJlYXNvbmFibGUsIHRoYW5rcwpKLiBOZXVzY2jD
pGZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
