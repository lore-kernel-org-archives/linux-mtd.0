Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC01C02198
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2025 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+5XJz4VMXUyFiqI1Ur2gWVS8HCEBKfQuV4QEH4sSNs=; b=ennDbrxh476GKm
	r4qYqVX4Y80Bwfhm2aKph2+NnfHwVVREDIw+FcyQMsG9skkef8q2/WeHi2vQ8Vjhv1tKHtV6bFQll
	lxeF+FdMcn77Zxzsw/aCtWZxyPsl1cwlT9o/yLvgzSgRi/y/xoblQO/16eBobOc04s9W3V2jO2DIL
	RqfaHj4mAkjxpUTWBFbMfnratbWbw8QlDUEtQ261CHaIpOB7dlAXrr3yIv193el2Y/TfZ00iXzJDw
	cpxkBl/t8ISW1MK40ArS9WDDpdhGmXHkPRHOWP+kapKw5ZxBwZbJOkLLWhBfadFbvZjChAFF8Vb/N
	ckaeNIojkSsa2xmoQzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjic7-00000002FpE-3hdx;
	Sun, 16 Feb 2025 17:39:31 +0000
Received: from [185.67.36.65] (helo=mout01.posteo.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjic4-00000002FoW-1Fuz
	for linux-mtd@lists.infradead.org;
	Sun, 16 Feb 2025 17:39:29 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CAE0D240027
	for <linux-mtd@lists.infradead.org>; Sun, 16 Feb 2025 18:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739727562; bh=9Ya3nZNb9MMk0kVeCzyrPJWutNb/VgKd2miIFEuE9e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=RUgSl7vyuD2gu97FMTGIHdpD9+s2OvoQa9Nw1zQw37hMzYtynBGKY1TvPUgt3cQ+/
	 ovTyJ8wwDt+SrvDnejvkHeLCpib+vqnNQZHILfweuQDIh0y2B604KgecdoS7dUP4ae
	 yW6G+OO3uRqrbkwh36SO1nlmLxGT01Y2hkKBOcgNrIREea1UUQCZ0+BUG7+K1iKrN+
	 de+TmyWis9VfuniNIVfA5h4BY1q+/yjAf2NqMNQE6m/FDq7NZQk0KiWCKBSTTw21Sb
	 jf147xX42+o1IMYGbMU9rhLJk8l8+VAd1Ym4Khu0ShwMV3tgVIbmh050LCBKqjbAj4
	 /NluK9WXPq68g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YwtM83X13z6txn;
	Sun, 16 Feb 2025 18:39:16 +0100 (CET)
Date: Sun, 16 Feb 2025 17:39:16 +0000
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
Subject: Re: [PATCH v2 11/12] dt-bindings: nand: Add fsl,elbc-fcm-nand
Message-ID: <Z7IixGUskrWxxZIZ@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-11-8137b0c42526@posteo.net>
 <20250211000157.GA240011-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211000157.GA240011-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_093928_527371_0BF1133C 
X-CRM114-Status: GOOD (  16.09  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDY6MDE6NTdQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBGZWIgMDcsIDIwMjUgYXQgMTA6MzA6MjhQTSArMDEwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gPiBGb3JtYWxpemUgdGhlIGJpbmRpbmcgYWxyZWFkeSBzdXBwb3J0ZWQg
YnkgdGhlIGZzbF9lbGJjX25hbmQuYyBkcml2ZXIKPiA+IGFuZCB1c2VkIGluIHNldmVyYWwgZGV2
aWNlIHRyZWVzIGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy8uCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Cj4gPiAtLS0KPiA+IAo+ID4gVjI6
Cj4gPiAtIHNwbGl0IG91dCBmcm9tIGZzbCxlbGJjIGJpbmRpbmcgcGF0Y2gKPiA+IC0gY29uc3Ry
YWluICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscwo+ID4gLSBhZGQgYSBnZW5lcmFsIGRl
c2NyaXB0aW9uCj4gPiAtIHVzZSB1bmV2YWx1YXRlZFByb3BlcnRpZXM9ZmFsc2UgaW5zdGVhZCBv
ZiBhZGRpdGlvbmFsUHJvcGVydGllcz1mYWxzZQo+ID4gLSBmaXggcHJvcGVydHkgb3JkZXIgdG8g
Y29tcGx5IHdpdGggZHRzIGNvZGluZyBzdHlsZQo+ID4gLSBpbmNsdWRlIHJhdy1uYW5kLWNoaXAu
eWFtbCBpbnN0ZWFkIG9mIG5hbmQtY2hpcC55YW1sCj4gCj4gV2h5PyBEb2Vzbid0IGxvb2sgbGlr
ZSB5b3UgdXNlIGFueXRoaW5nIGZyb20gaXQuIEkgdGhpbmsgdGhlIGNvcnJlY3QgCj4gdGhpbmcg
dG8gdXNlIGhlcmUgaXMganVzdCBtdGQueWFtbCB0byBwaWNrIHVwIHBhcnRpdGlvbnMuCgpUaGVy
ZSBpcyBvbmUgZXhhbXBsZSBvZiBwcm9wZXJ0aWVzIGZyb20gbmFuZC1jaGlwLnlhbWwgYmVpbmcg
dXNlZApvbiBhbiBmc2wsZWxiYy1mY20tbmFuZCBub2RlOiBhcmNoL3Bvd2VycGMvYm9vdC9kdHMv
dHVycmlzMXguZHRzCnVzZXMgbmFuZC1lY2MtbW9kZSBhbmQgbmFuZC1lY2MtYWxnby4KCgpUaGFu
a3MsCkouIE5ldXNjaMOkZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
