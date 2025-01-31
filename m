Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8F1C0218F
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edbU2Ot6ExBUqmWJOikkMH0PBk2rS33YlyQTJ7QGbEQ=; b=IuUyfP4wdxq50P
	IRH5XU5s1jiE/bYTFnpUxrzIOvDC6rwWGSBuNN4kLqH7o5Ddq7j+RAgVfYYqouN2xU8XyQP3zV9mD
	DXtrKMjxgwjC8MBsutT459+RordrwovKoyqVQSEPFgVAY3VFZq77BIndNe3IpInGREQikDsvf7imR
	V7y1nKv3Mog6t+n+PWpHOuudKhDvGjE/IQjzmyFNbATSUt/iVPQQ9EfB7deBHksgsB6Gxp4vxyfC0
	wCdeQjqiZe2eRqO1+GR/G0j5/vHsbyrC4KtFlh26K9eAygyirQLRZnnZ9N2qPMgto05HRAuDDFDjx
	t1gedtoVizDlfwpLLvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpXO-0000000AY79-012B;
	Fri, 31 Jan 2025 11:50:18 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpHT-0000000AW5F-2JL3
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 11:33:52 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 32201240103
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 12:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738323226; bh=476EBTGgcI5xdYOaJ6LQa3tfmwSruyF9mYzvA+HovWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Yz9CI78/fovWb2L5arMhqzICRpUn5PDCJglnqxot979BF/cz24B57yuu4aqG+WEsA
	 SwkGWcjgcrBU0WNZOH5ITMaS93rkXZ5MKtflImxIJt3OEmQhmszJJZmMatbXyhZ4bj
	 9eN6uGxkTzbO3lC3ZbMVIteudpPKS6+AdjcAQogx5QcbvxPI4VmDx8o1g4HJVTxM3n
	 wFVcW3I0tdDAt9EwDVnVPV8xr9ykgPT5lxzvCP/k4JSgJgzI22+ncddHWp5ZTvMMz0
	 Xps9MsPE2HzxePqW35oCBQWUWRgqSQV/OvOk7usYRAPfrme2gy7aX9OnJUFBT91Osg
	 whcxqOR2a8c7w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ykv0g42F0z9rxF;
	Fri, 31 Jan 2025 12:33:39 +0100 (CET)
Date: Fri, 31 Jan 2025 11:33:39 +0000
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
Subject: Re: [PATCH 0/9] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z5y1E6TUclqzV2Rp@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <Z5qr1VkKSlyBE/E4@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5qr1VkKSlyBE/E4@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_033351_747955_F0FB08C4 
X-CRM114-Status: GOOD (  13.63  )
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

T24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDU6Mjk6NDFQTSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTg6NTVQTSArMDEwMCwgSi4gTmV1c2Now6Rm
ZXIgd3JvdGU6Cj4gPiBUaGlzIGlzIGEgc3Bpbi1vZmYgb2YgdGhlIHNlcmllcyB0aXRsZWQKPiA+
ICJwb3dlcnBjOiBNUEM4M3h4IGNsZWFudXAgYW5kIExBTkNPTSBOV0FQUDIgYm9hcmQiLgo+ID4K
PiA+IER1cmluZyB0aGUgZGV2ZWxvcG1lbnQgb2YgdGhhdCBzZXJpZXMsIGl0IGJlY2FtZSBjbGVh
ciB0aGF0IG1hbnkKPiA+IGRldmljZXRyZWUgYmluZGluZ3MgZm9yIEZyZWVzY2FsZSBNUEM4eHh4
IHBsYXRmb3JtcyBhcmUgc3RpbGwgaW4gdGhlIG9sZAo+ID4gcGxhaW4tdGV4dCBmb3JtYXQsIG9y
IGRvbid0IGV4aXN0IGF0IGFsbCwgYW5kIGluIGFueSBjYXNlIGRvbid0IG1lbnRpb24KPiA+IGFs
bCB2YWxpZCBjb21wYXRpYmxlIHN0cmluZ3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1
c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiAKPiBQbGVhc2UgY2MgaW14QGxpc3RzLmxpbnV4
LmRldiBuZXh0IHRpbWUKPiAKPiBGcmFuawoKV2lsbCBkby4KCkJlc3QgcmVnYXJkcywKSi4gTmV1
c2Now6RmZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
