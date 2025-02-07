Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E0C0219E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 23:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QQK0j3rMzMNla22TjAPdRD9P6fD9FWR+K6dpKSrGJaw=; b=RLAxKS5y1C+hGS2uEzEiKSReVR
	Z7wRHObAt72lp8k6OJCmlFzvkRnezCJyhZEwFZt3OjyCVjgBK2TH9a0FewM3xGSYx17RbRR06GqSQ
	zGCnccZmOg9mEE7oSTgt03UhIBeBNAzFM+TCOk1viqOgR7v2Y+4accLIoSiMAKn2nUQl8kS9lfQtk
	8ZOjoxx0VZ1sHNG8fi0t/IkMcvK7jrc+jgxFZFC0g61gNV2VtUNYHBqZYCo8FFaNQ9/yjgjaqAtZb
	+EOdwDHd/fb817JBtmdMoa8Top/5BC1wCeGcWEhqq/82BoBQh+x5kNt+i1NfDNdPE4rLRgNnjVKhm
	6k/pU1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1v-0000000BY5G-1CPE;
	Fri, 07 Feb 2025 23:45:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgY1s-0000000BY3N-0FoU
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 23:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76F94A43C61;
	Fri,  7 Feb 2025 23:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7666C4CED1;
	Fri,  7 Feb 2025 23:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738971899;
	bh=0OcYIgMuhOEeKZ02PL/wKdLJvCr/x2GC0bB/FCHa3js=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FcFD7E6x/lq9R9GSbnFWQ84X6jA3wHn8MV9k9BwUEU5Jy3GduQqYEh0TAxZg84hd6
	 U/1mtO4DOlNDyWNaUYLvCvf330mxj9hdZo3Ap9AdXSFLJzN989NVrfwM7hrblNq5Vg
	 rBgXMw5MXP4WKs2vld+G4/TK0CCvjuFMv45Pt2rv7LGomPO/wwwhXgaUbVlAhiwJ0k
	 FKpaEdfJWr8j/V+qutaVdWXkjF/AlONGhMFLYgFT7+ApRz3JHy5WCCZbmTdYAil683
	 nEtQYHSdNFhl0ynU/NrzOmE9kS6c2Mv3qEwGLvCA6rIlaSL+WsaycsHH/XLRHNOch/
	 7FrFsFlmciVrg==
Date: Fri, 07 Feb 2025 17:44:57 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, linux-pci@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-crypto@vger.kernel.org, 
 imx@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Vinod Koul <vkoul@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Damien Le Moal <dlemoal@kernel.org>, devicetree@vger.kernel.org, 
 dmaengine@vger.kernel.org, Scott Wood <oss@buserror.net>, 
 Guenter Roeck <linux@roeck-us.net>, "David S. Miller" <davem@davemloft.net>, 
 Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-watchdog@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-mtd@lists.infradead.org
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
In-Reply-To: <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
Message-Id: <173897189562.2630598.5483742714479681257.robh@kernel.org>
Subject: Re: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to
 YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_154500_232783_0CAA35CB 
X-CRM114-Status: GOOD (  13.14  )
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

Ck9uIEZyaSwgMDcgRmViIDIwMjUgMjI6MzA6MjMgKzAxMDAsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
Ogo+IEZvcm1hbGlzZSB0aGUgYmluZGluZyBmb3IgdGhlIFBDSSBjb250cm9sbGVycyBpbiB0aGUg
RnJlZXNjYWxlIE1QQzh4eHgKPiBjaGlwIGZhbWlseS4gSW5mb3JtYXRpb24gYWJvdXQgUENJLVgt
c3BlY2lmaWMgcHJvcGVydGllcyB3YXMgdGFrZW4gZnJvbQo+IGZzbCxwY2kudHh0LiBUaGUgZXhh
bXBsZXMgd2VyZSB0YWtlbiBmcm9tIG1wYzgzMTVlcmRiLmR0cyBhbmQKPiB4cGVkaXRlNTIwMF94
bW9uLmR0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8u
bmV0Pgo+IC0tLQo+IAo+IFYyOgo+IC0gbWVyZ2UgZnNsLHBjaS50eHQgaW50byBmc2wsbXBjOHh4
eC1wY2kueWFtbAo+IC0gcmVncm91cCBjb21wYXRpYmxlIHN0cmluZ3MsIGxpc3Qgc2luZ2xlLWl0
ZW0gdmFsdWVzIGluIG9uZSBlbnVtCj4gLSB0cmltIHN1YmplY3QgbGluZSAocmVtb3ZlICJiaW5k
aW5nIikKPiAtIGZpeCBwcm9wZXJ0eSBvcmRlciB0byBjb21wbHkgd2l0aCBkdHMgY29kaW5nIHN0
eWxlCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wsbXBjOHh4eC1wY2ku
eWFtbCAgIHwgMTE1ICsrKysrKysrKysrKysrKysrKysrKwo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxwY2kudHh0ICB8ICAyNyAtLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDExNSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPiAKCk15IGJvdCBmb3Vu
ZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOgoK
eWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOgoKZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoK
Cgpkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2RvY3MpOgpXYXJuaW5nOiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxtcGM4eHh4LXBjaS55YW1sIHJl
ZmVyZW5jZXMgYSBmaWxlIHRoYXQgZG9lc24ndCBleGlzdDogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BjaS9mc2wscGNpLnR4dApEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGNpL2ZzbCxtcGM4eHh4LXBjaS55YW1sOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGNpL2ZzbCxwY2kudHh0CgpTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAyNTAyMDctcHBjeWFtbC12Mi02
LTgxMzdiMGM0MjUyNkBwb3N0ZW8ubmV0CgpUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5l
cmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVuY3kKc2hvdWxkIGJlIG5v
dGVkIGluICp0aGlzKiBwYXRjaC4KCklmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5n
X2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUKZXJyb3IocyksIHRoZW4gbWFrZSBzdXJl
ICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8KZGF0ZToKCnBp
cDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKClBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0
IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUKdGhhdCBEVF9T
Q0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVwIGNo
ZWNraW5nCnlvdXIgc2NoZW1hLiBIb3dldmVyLCBpdCBtdXN0IGJlIHVuc2V0IHRvIHRlc3QgYWxs
IGV4YW1wbGVzIHdpdGggeW91ciBzY2hlbWEuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
