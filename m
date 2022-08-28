Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9300FECAAD5
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Aug 2022 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSZEhgTg076Ry7M2HUduxuXusoHcTx1qq4OZWgEwxOc=; b=jBx/piC3F+uz6zXpMiRfQNekwT
	nxt7mV1oeIQfAOuZ+Z9wzNAHG4OsMrS3kZCcBZLYgwBW5hTe2HLJ4B+O61WabyE+ZLFguAx89mUW4
	cEp4SkctJXvQdKbUT5V/MxRrKnchSG+HsO3GEfTTavFVeCyWLiIVAj725TxAjXLI16JW6Out+OYzT
	d0c9qveMzvozge2wBdS8EiOk8i1L2hTS30w0hA40VqbQmWufx2ox3phEiLpbi76tDkJnIqYWtGsOm
	OLfg6/fTsk8yQgEUve6FrUWh/P+PZCJLfvk1dl9gUyBXC7JNYmyf1XcL6UrrynVhYs/yNbI0ZOnX+
	U6lLfHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSJPV-00HYSY-TO; Sun, 28 Aug 2022 14:37:13 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSJPH-00HYN7-UT; Sun, 28 Aug 2022 14:37:01 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0E1D59B1;
	Sun, 28 Aug 2022 16:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661697418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PX7FBllk+cj5XDth3fcwSHpmqNhOA0Ff5hNRkbJfwhM=;
	b=HRM3E+Ka7cQ3cBsabC1jV/2VqjHV5p2dTJcBx80ZUckS1bEWgbWlS3eTCgcGp5O3M/t/3v
	vi9oOY77RFWMaP5LQ2SeQKvdOTpkumQZzJd6rQ5UgOoQ4vjA5OT+JHnSPzgGynHkoazdkP
	lmwpVmIrUUdq7Qr4x9nGygY92tr9eFGeWRkFrPNHEFFTQDd/sorFow7Dc0DRofYQQ0fvTB
	nTGqCDTNNp/NWRvuyCBRVWEFVxeUfyCnE/q8yiZ2UFdBDT6U8N9atMXyh4GfNn1NGKnG2i
	yN9UD19aB5Zuqhh9OSvUqlzuEqdhDaGyOnPQngvUrFLTY+kfxm5QETSDIEtG/w==
MIME-Version: 1.0
Date: Sun, 28 Aug 2022 16:36:57 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [RFC PATCH v1 13/14] nvmem: layouts: u-boot-env: add device node
In-Reply-To: <ca7d8fe6-023f-1e2d-da34-c23d0cdc3b03@milecki.pl>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-14-michael@walle.cc>
 <ca7d8fe6-023f-1e2d-da34-c23d0cdc3b03@milecki.pl>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a40fabd8570067426a544bf0b6ece563@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_073700_151524_876089FD 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wOC0yOCAxNTo1NSwgc2NocmllYiBSYWZhxYIgTWnFgmVja2k6Cj4gT24gMjUuMDgu
MjAyMiAyMzo0NCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gUmVnaXN0ZXIgdGhlIGRldmljZSBu
b2RlIHNvIHdlIGNhbiBhY3R1YWxseSBtYWtlIHVzZSBvZiB0aGUgY2VsbHMgZnJvbQo+PiB3aXRo
aW4gdGhlIGRldmljZSB0cmVlLgo+PiAKPj4gVGhpcyBvYnZpb3VzbHkgb25seSB3b3JrcyBpZiB0
aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgbmFtZSBjYW4gYmUgCj4+IG1hcHBlZAo+PiB0byB0aGUg
ZGV2aWNlIG5vZGUsIHdoaWNoIGlzbid0IGFsd2F5cyB0aGUgY2FzZS4gVGhpbmsgb2YgIl8iIHZz
ICItIi4KPj4gQnV0IGZvciBzaW1wbGUgdGhpbmdzIGxpa2UgZXRoYWRkciwgdGhpcyB3aWxsIHdv
cmsuCj4gCj4gV2UgcHJvYmFibHkgc2hvdWxkbid0IHN1cHBvcnQgdW5kb2N1bWVudGVkIHN5bnRh
eCAoYmluZGluZ3MpLgoKSWYgd2Ugb25seSBzdXBwb3J0IGEgcHJlZGVmaW5lZCBsaXN0IG9mIHZh
cmlhYmxlcywgd2UgY2FuIG1ha2UgdGhlbQpkZXZpY2UgdHJlZSBjb21wYXRpYmxlIGFueXdheS4g
RS5nLiB3ZSBjb3VsZCBoYXZlIGEgbWFwcGluZwoic2VyaWFsLW51bWJlciIgPC0+ICJzZXJpYWwj
IgoKLW1pY2hhZWwKCj4gSSd2ZSBpZGVudGljYWwgbG9jYWwgcGF0Y2ggdGhhdCB3YWl0cyBmb3IK
PiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBudm1lbTogdS1ib290LGVudjogYWRkIGJhc2ljIE5WTUVN
IGNlbGxzCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUt
YmluZGluZ3MvcGF0Y2gvMjAyMjA3MDMwODQ4NDMuMjE5MjItMS16YWplYzVAZ21haWwuY29tLwo+
IHRvIGJlIGFjY2VwdGVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
