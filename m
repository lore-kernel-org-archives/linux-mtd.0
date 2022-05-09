Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F28EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPfD8ZU4TORCRzM33IFk3apzgqZRAUSDTwfKwlVd56w=; b=u/KuhOo54ouqoi
	ZaXQy7GmvhNuDsmEgtMCzvIKBIWzipdf+OnHgIyK1b2las8mwZEiw/Jy+aJ5iWfELYwMPQFZdjNKM
	/3PEAWgefZyVhbsXLcjW41hbgdJIiGd4YvM58XP8xbcnycpVVErr4EWzIeQPmWCgH/wSdhiKu8IDh
	vC9CIggDBGGQLS4utQtSJIAjHcc8S9mcn3DZ0ajdkp/R765YkNBX3gS5l3E03CjadcfDyM2GJH3xs
	bIOXf+cUAgDeNMMwvmiMhesMU0bKhxaVel4+qPRM77G699zjtzJt94FrpCcxoX3S7fueA9PhUb6Zb
	at42Eb/aw1xE/+2IaniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no5PD-00F8XE-16; Mon, 09 May 2022 15:34:39 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no5P9-00F8WP-B2
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 15:34:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC631FF804;
 Mon,  9 May 2022 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652110469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KLuJlfNEA5Fbzc0NZoL/MBREpZ4szczQ+9JCfaD3NQ=;
 b=PL0vubCc5JiqT/rNnrn6CLfeOz8ceMyyGjJByHomeB+MrDwcanoPmdG4jr2hvLzAdshhrw
 Hh+zBfc/KwdW02sYBG+yGBs9US0CJLUaD2iCp/xyyZTDD3hwaU44OKB2dY8tgRvxRUNH6z
 4SOCmxt/URhi5TR2ix8H4gxKMSmcFBUq6G0ViYZ+9ZO7bfPjIus3b1NZhiaJkVE/+FPSOg
 NFDlaTPcgbTyGhMaKRAAeXa3VMHyoBn63lQYiDuYW+bmpLDfIl1o61PHrmBcspF7Uby8lF
 UI5nEEerrxJzH7eR1VHHfYCTh5jn3UFFr9YWUANcjAfiktQB2iHWfrTBiu5f2Q==
Date: Mon, 9 May 2022 17:34:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
Message-ID: <20220509173424.75ec0d1a@xps13>
In-Reply-To: <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
 <20220429105229.368728-4-miquel.raynal@bootlin.com>
 <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_083435_553785_D21C6A0F 
X-CRM114-Status: GOOD (  12.60  )
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

SGkgR2VlcnQsCgoKPiA+ICAgICAgICAgcmV0ID0gZG1hX3NldF9tYXNrKCZwZGV2LT5kZXYsIERN
QV9CSVRfTUFTSygzMikpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gLSAgICAgICAgICAgICAg
IGdvdG8gZGlzYWJsZV9lY2xrOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAr
Cj4gPiArICAgICAgIHBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOwo+ID4gKyAgICAgICBw
bV9ydW50aW1lX2dldF9zeW5jKCZwZGV2LT5kZXYpOyAgCj4gCj4gcmV0ID0gcG1fcnVudGltZV9y
ZXN1bWVfYW5kX2dldCkuLi4pOwo+IGlmIChyZXQgPCAwKSAuLi4KCkkgYWxzbyBjaGFuZ2VkIHRo
ZSBlbmFibGUgY2FsbCB0byB1c2UgZGV2bV9wbV9ydW50aW1lX2VuYWJsZSgpIGFuZApkcm9wcGVk
IHRoZSBjYWxscyB0byBwbV9ydW50aW1lX2Rpc2FibGUoKSBiZWxvdyAoc2FtZSBpbiB0aGUgUlRD
CmRyaXZlcikuCgo+IAo+ID4gKwo+ID4gKyAgICAgICAvKiBUaGUgZXh0ZXJuYWwgTkFORCBidXMg
Y2xvY2sgcmF0ZSBpcyBuZWVkZWQgZm9yIGNvbXB1dGluZyB0aW1pbmdzICovCj4gPiArICAgICAg
IGVjbGsgPSBjbGtfZ2V0KCZwZGV2LT5kZXYsICJlY2xrIik7Cj4gPiArICAgICAgIGlmIChJU19F
UlIoZWNsaykpIHsKPiA+ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGVjbGspOwo+ID4g
KyAgICAgICAgICAgICAgIGdvdG8gZGlzX3J1bnRpbWVfcG07Cj4gPiArICAgICAgIH0KPiA+ICsK
PiA+ICsgICAgICAgcm5hbmRjLT5leHRfY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoZWNsayk7Cj4g
PiArICAgICAgIGNsa19wdXQoZWNsayk7Cj4gPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
