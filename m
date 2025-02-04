Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062FFC02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 23:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhXhLj+DMpHeirsJfTUYZZuXrOvAoFaZfjtkSQYI9r0=; b=OP1iYUEIEL9X1x
	/JTtqOERLCyuG9Px2xS66CFjY8GXuIwC8G96bVdoJeq/sv0HPLc+w3PV3lYiTTXFFP/0cPpkCXTE4
	LsqruPAVJ5SA5slVcNF/jky8Hlu2Rzd7XCps4fubVEXNKOabSWKbcIn3VVd0mvyneddRhGz1+KU29
	c/D5KlTak+1rkLiLbfPqMBGq50Fys5+cDS/AkG2py7l7zV6a8i3oZwAjA4AhLwtoVa4x3+Eni72L1
	o27J2XTAaCO92r2Jub610ydYmW22TCbSmGQbw3LqxHC7rwqx8UpjPhx4SAFH2NZF+cQTlTHSzS0Py
	CEMdpbIsr4kUrBxEkLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSR8-00000001pxz-3Rwt;
	Tue, 04 Feb 2025 23:34:34 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSR7-00000001pxR-0Bwy
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 23:34:34 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6410024002B
	for <linux-mtd@lists.infradead.org>; Wed,  5 Feb 2025 00:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738712071; bh=ZyVExCqzB2iyA3bGQRpDduhuvKS4WRQAEUDFtlqCUyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=DBuTUrKvwBPCFb3wwTF27nUmKACldPAcQK56BYzilnfVJPf906YaloXYiMrBH0c8c
	 vIuQx+YGYTxutPEplefcxq8yPY37zyFAgpbLU6vWf/V/09gaXv9jpMdG1O9VTiAqZf
	 y3RU6mPPwJm03hw0li/MOC9HLNHPTIthKkPNCuvplIYQqPzLkejWIoUDMNA6fb0GEz
	 MXx7QT9XTpACA6ETCFVSYuQe4WroRMb+BIlsBRIPjO+EN0pliE531twvejZqcI+Nlt
	 GgJWtXw4wqJWoCOpmvC72HFB+3ku/yRvl2HD/J/3mKxYeJYNYBMkjmgGhoKwtjXWMV
	 Fi8SRj0C0Cjow==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YnfpX3DL2z6tyt;
	Wed,  5 Feb 2025 00:34:28 +0100 (CET)
Date: Tue,  4 Feb 2025 23:34:28 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Frank Li <Frank.li@nxp.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
Message-ID: <Z6KkBEaGTkSyWiE_@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
 <Z5qx3jAFE81Ni2cJ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5qx3jAFE81Ni2cJ@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_153433_229947_8BFE6DD0 
X-CRM114-Status: GOOD (  12.48  )
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

T24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDU6NTU6MjZQTSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTk6MDFQTSArMDEwMCwgSi4gTmV1c2Now6Rm
ZXIgd3JvdGU6Cj4gPiBTdXBwbGVtZW50IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wY2kvZnNsLHBjaS50eHQgd2l0aCBhIG1vcmUKPiA+IGZvcm1hbCBiaW5kaW5nIGluIFlBTUwg
Zm9ybWF0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1wYzh4
eHgtcGNpLnlhbWwgICB8IDgzICsrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgODMgaW5zZXJ0aW9ucygrKQpbLi4uXQo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4g
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4K
PiA+ICsKPiA+ICsgICAgcGNpMTogcGNpZUBlMDAwOTAwMCB7Cj4gCj4gbmVlZG4ndCBsYWJlbCBo
ZXJlCgpXaWxsIGNoYW5nZS4KCgpUaGFua3MsCkouIE5ldXNjaMOkZmVyCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
