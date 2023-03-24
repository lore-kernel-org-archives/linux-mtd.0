Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA39C6FD1C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJKH7ATewVrUBqYz7iaDlJILsXFjRspEpYI278V6qJs=; b=jj51jXHKC8582X
	+U+5dXvhbGSZWSnjq2DwkG2rJZsEBvH6LhJVZfnXk8U1LpzxroQDVu7E3qpDbIyriqK5imLV3didh
	zf6EiCRriPqJ1pw/GTdsHS3cWmvXL9ZjjS8+bgsU8LZ2SksOAyxRxk4jWfPI+Gi2+KUMusFGz6WUI
	pB9qUqdbXRe0Zsa51eIs8Nav3+7ETgiVPo0belCMdirUzJApzAQqRnb+wvZc1lyVZ/q6sehAtNsNJ
	pGMLhTmwM7NvkLoRuoRzh/RvXCTDX6vXQCJVSsXjoXGN6CIPEVWTTRPQGTrZV7dlqd/fqvBdQyawe
	VRh1RXmr1dGXYDHADfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfduV-0043IB-2i;
	Fri, 24 Mar 2023 09:40:35 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfduR-0043Gf-1w
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 09:40:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1A5F1240009;
	Fri, 24 Mar 2023 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679650826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfAKNLINoAFCJxtObHpd6qzp3wuoC13J4SnQQo/qL/w=;
	b=mRY6y3KS98Yvv4kQKfT8tHIKiqhJBOAKKJqbtewDvDpralDha4cvXqaVlpj0Lz5amLtCkf
	WtPk2l4noyb4JXkAsUjWu9ETGqgbwpSpgtLnzbiqjuN9uGdPeVDbFIN6F0CanNxopllIay
	IKuxBm1V+mTTGPOhq26e53x3sTSUx4xDX4rG6HcmUifoatmHIf4dlQ56cq82ZytlMQKBXa
	HHBcoO+Mt7DuQWl3odKY/AyzzmMbIxTnWNovkJbg59cB/1k9MnJ4fL+bC418afObE0kz4u
	hsqKgeFLjY+2EB3JQB0PMUoODFJLl8dVbr00znSOG1R3y0+nq0t4JIgm9ZruMw==
Date: Fri, 24 Mar 2023 10:40:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, masonccyang@mxic.com.tw,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nand: Macronix: document new
 binding
Message-ID: <20230324104020.54754079@xps-13>
In-Reply-To: <20230323124510.2484808-2-noltari@gmail.com>
References: <20230323124510.2484808-1-noltari@gmail.com>
	<20230323124510.2484808-2-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_024031_785153_ED8C7D11 
X-CRM114-Status: GOOD (  14.11  )
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

SGkgw4FsdmFybywKCm5vbHRhcmlAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMjMgTWFyIDIwMjMg
MTM6NDU6MDkgKzAxMDA6Cgo+IEFkZCBuZXcgIm14aWMsZGlzYWJsZS1ibG9jay1wcm90ZWN0aW9u
IiBiaW5kaW5nIGRvY3VtZW50YXRpb24uCj4gVGhpcyBiaW5kaW5nIGFsbG93cyBkaXNhYmxpbmcg
YmxvY2sgcHJvdGVjdGlvbiBzdXBwb3J0IGZvciB0aG9zZSBkZXZpY2VzIG5vdAo+IHN1cHBvcnRp
bmcgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0
YXJpQGdtYWlsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9uYW5kLW1hY3Jvbml4LnR4dCB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQKPiBpbmRleCBmZmFiMjhhMmM0ZDEuLjAzZjY1Y2Ez
MmNkMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L25hbmQtbWFjcm9uaXgudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dAo+IEBAIC0xNiw2ICsxNiw5IEBAIGluIGNoaWxkcmVu
IG5vZGVzLgo+ICBSZXF1aXJlZCBOQU5EIGNoaXAgcHJvcGVydGllcyBpbiBjaGlsZHJlbiBtb2Rl
Ogo+ICAtIHJhbmRvbWl6ZXIgZW5hYmxlOiBzaG91bGQgYmUgIm14aWMsZW5hYmxlLXJhbmRvbWl6
ZXItb3RwIgo+ICAKPiArT3B0aW9uYWwgTkFORCBjaGlwIHByb3BlcnRpZXMgaW4gY2hpbGRyZW4g
bW9kZToKPiArLSBibG9jayBwcm90ZWN0aW9uIGRpc2FibGU6IHNob3VsZCBiZSAibXhpYyxkaXNh
YmxlLWJsb2NrLXByb3RlY3Rpb24iCj4gKwoKQmVzaWRlcyB0aGUgZmFjdCB0aGF0IG5vd2FkYXlz
IHdlIHByZWZlciB0byBzZWUgYmluZGluZyBjb252ZXJzaW9ucyB0bwp5YW1sIGJlZm9yZSBhZGRp
bmcgYW55dGhpbmcsIEkgZG9uJ3QgdGhpbmsgdGhpcyB3aWxsIGZseS4KCkknbSBub3Qgc3VyZSBl
eGFjdGx5IHdoYXQgImRpc2FibGUgYmxvY2sgcHJvdGVjdGlvbiIgbWVhbnMsIHdlCmFscmVhZHkg
aGF2ZSBzaW1pbGFyIHByb3BlcnRpZXMgbGlrZSAibG9jayIgYW5kICJzZWN1cmUtcmVnaW9ucyIs
IG5vdApzdXJlIHRoZXkgd2lsbCBmaXQgYnV0IEkgdGhpbmsgaXQncyB3b3J0aCBjaGVja2luZy4K
Ck90aGVyd2lzZSwgd2h5IHdvdWxkIHlvdSBkaXNhYmxlIHRoZSBibG9jayBwcm90ZWN0aW9uPyBX
aGF0IGRvZXMgaXQKbWVhbiBleGFjdGx5PyBJJ20gbm90IGluIGZhdm9yIG9mIGEgTWFjcm9uaXgt
c3BlY2lmaWMgcHJvcGVydHkgaGVyZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
