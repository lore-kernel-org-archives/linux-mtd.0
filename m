Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43654C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Apr 2022 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vqo+hwSTDrqbdWOEMpTYsQhRErj7lDHYpKjpjDgC7ZY=; b=Zv6eg6dweBfmD9
	4sRQx5GeA+2nD+LyVty8ej+M+DX9ctxeRXqcc4ZhDnNofydpZupsjFkviDvbvZJy9eN6sPWTtSaH/
	5xqvBzOj3cp8Gjy5Xc8NSp6hM0Nc2HlGJWJmqjlhTVK2FBn3nIMiQMPi19eTMLkO63fIlpoqdkAHg
	JX9rN39vQAyqi0y8HaskrpI0PMGZA6WNI8VZOp+7dYdnGkqpn+BhQWX6LnOXtcTPSY4KjmfVjg2Bm
	oSYxAOWJuaXu2g7lIZVidwxfjydpFZMifLMA/bhNe0U8sMChGmFO3D86MyKlV3RqoE4GjocWnYAMK
	3HKBdicIKoVYvhIj4Mkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nciAh-00FIbT-59; Fri, 08 Apr 2022 06:32:39 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nciAT-00FIYR-Mm; Fri, 08 Apr 2022 06:32:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11A44FF809;
 Fri,  8 Apr 2022 06:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649399540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFdqjPdj+EvQat/TUNxFw2X8022yUvS5IZjp3j3BFUg=;
 b=HZtCP6Wv6ySD0icGoZTFTcn9erdtWYbltosDs4PvpCpMxgvVbqxZOwGFCPXs4mP+geopHC
 66AjK7hhyS1PIKCZp/d9CLLG6qvXnzHpWvG/W1xns6Osq3u/ZiQNfre7ORWJVDqAZD2Uzy
 UUHHGAtbF/kvSL3lOHzfxyfKcyfBpema+mbmt09dFRGPRoHbGgTMpVifC5sHvUmHz6XRdy
 AID1g+5ccBsNVpM1YKUBuraZYKkMTQwGdRuB4XBDelrdRtMJtmiddDu/t+Qtx9dTcW+vfJ
 we59+GvY1I4OGG4lSHaWC6lQVhXZa9wOPNovYUVcOnciymWg04dGqDNlPHXLtA==
Date: Fri, 8 Apr 2022 08:32:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Cai Huoqing
 <cai.huoqing@linux.dev>, Florian Fainelli <f.fainelli@gmail.com>, Colin Ian
 King <colin.king@intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/Mediatek SoC support), linux-mediatek@lists.infradead.org
 (moderated list:ARM/Mediatek SoC support), linux-kernel@vger.kernel.org
 (open list), linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: Re: [PATCH v4 1/5] mtd: nand: make mtk_ecc.c a separated module
Message-ID: <20220408083214.1473e88a@xps13>
In-Reply-To: <20220407150652.21885-2-gch981213@gmail.com>
References: <20220407150652.21885-1-gch981213@gmail.com>
 <20220407150652.21885-2-gch981213@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_233225_944149_061F8D49 
X-CRM114-Status: GOOD (  11.13  )
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

SGkgQ2h1YW5ob25nLAoKZ2NoOTgxMjEzQGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsICA3IEFwciAy
MDIyIDIzOjA2OjQ4ICswODAwOgoKPiB0aGlzIGNvZGUgd2lsbCBiZSB1c2VkIGluIG1lZGlhdGVr
IHNuZmkgc3BpLW1lbSBjb250cm9sbGVyIHdpdGgKPiBwaXBlbGluZWQgRUNDIGVuZ2luZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbmhvbmcgR3VvIDxnY2g5ODEyMTNAZ21haWwuY29tPgo+IC0t
LQo+IAo+IENoYW5nZSBzaW5jZSB2MToKPiAgIGFjdHVhbGx5IG1ha2UgaXQgYSBtb2R1bGUgaW5z
dGVhZCBvZiBhIHBhcnQgb2YgbmFuZGNvcmUubwo+ICAgICAoRUNDX01YSUMgcHJvYmFibGx5IG5l
ZWRzIGEgc2ltaWxhciBmaXguKQoKUGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byBwcm9wb3NlIHNv
bWV0aGluZyBhYm91dCBpdC4KCk90aGVyd2lzZSBvbiB0aGUgTVREIHNpZGUgdGhlIHNlcmllcyBs
b29rcyBnb29kIChiZXNpZGVzIHRoZSB0d28KY29tbWVudHMgeW91IGFscmVhZHkgcmVjZWl2ZWQp
LgoKSSBkb24ndCBrbm93IGlmIHNvbWV0aGluZyBjaGFuZ2VkIHJlZ2FyZGluZyB0aGUgY29tbWVu
dHMgc3R5bGUgaW4gdGhlCnNwaSBzdWJzeXN0ZW0sIGJ1dCB1c2luZyAvLyBldmVyeXdoZXJlIGxv
b2tzIHN0cmFuZ2UsIGl0J3MgdXN1YWxseQpyZXNlcnZlZCBmb3IgdGhlIFNQRFggdGFnLCBidXQg
SSdsbCBsZXQgTWFyayBjb21tZW50IG9uIGl0LgoKT3RoZXJ3aXNlLCBNVEQgcGF0Y2hlcyAxIGFu
ZCAzIGxvb2sgZmluZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
