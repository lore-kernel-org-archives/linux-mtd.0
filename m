Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C2C52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYNPmtyYhyxSf13XwTt0rd+u72FVVFsZDCV6Gn8wr+w=; b=JJG0q4cN05puEj
	7YKKsG+qB/YHsaICifyXEc+Mq+fu6iClf0l6h5t7D3+Scmf2KwAHmz4BF9GULmIKhNOV8bxKRUMgJ
	8aaiNdctbAQEft4/qsw8yUR4kFSYi6qDR6eJ0vhjZxzBgrWf5TsQF6z1AQDWC7d2wrgSMfaZYP6qO
	5ua3PvX9i31za45muHkaITuEwHYCKJrREXvvMoo5MJFelG4D0g1Jpp0IOVM7rd157VrNWfMY22l3K
	9pxzpEfWaoEB6JUpHHOrCjfXs2yd0NfQ6XwimuRDBlS9p6NUBdFni2cqIrgEAklg46qJM72SrPHK4
	AGwKmmIJdnL6Ton6azBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdPVo-0000000HAEb-3NUE;
	Mon, 12 Aug 2024 07:30:40 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdPUv-0000000H9yF-3YlE;
	Mon, 12 Aug 2024 07:29:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0A1D240003;
	Mon, 12 Aug 2024 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723447780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oafu0WWZyssl+BW+Fc+4njgLE2C72ugrKSjldnyJ7kY=;
	b=WEDU8dF6RenmlSwiIq9vVp2pzFbsWxnkYCVxQLUKOYDBbFEFoQGMFFmc91lP0KUuHn4IDj
	8XZTuv2pMuqtdRDxi7wQ1OWVe02fI7Y2og656C23HlxDJpBXvxbubDNKYrIyi9lKoFZM4J
	9RoNxQ3bQlACBJEdCZvWEAkE6JfvLHRprKtow+JhVL/pMnA7NHqpl5er3BUf67rPBZ8yHy
	ovTZBKJ5F7SOsq66sVHnBsc0WF2noadJJSxD5+u2nNQJWt74CI6PLVOsvEzLiFzGsjZ7i5
	PILpt3F8Ui7nDkyVYvKrltfc3/+wgSa7Rt9w8NklTYmY+iSd5tZ2352tYgL7mw==
Date: Mon, 12 Aug 2024 09:29:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <michael@walle.cc>
Cc: "Michal Simek" <michal.simek@amd.com>, "Mahapatra, Amit Kumar"
 <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "pratyush@kernel.org"
 <pratyush@kernel.org>, "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com"
 <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Message-ID: <20240812092937.2bd5c85a@xps-13>
In-Reply-To: <D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
	<BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
	<BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
	<BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
	<9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
	<BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
	<IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
	<D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc>
	<e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com>
	<D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc>
	<9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com>
	<D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_002946_195839_0A247FA8 
X-CRM114-Status: GOOD (  14.88  )
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

SGkgTWljaGFlbCwKCj4gPiA+IFRoZSBmaXJzdCByb3VuZCBvZiBwYXRjaGVzIHdlcmUgcmVhbGx5
IGludmFzaXZlIHJlZ2FyZGluZyB0aGUgY29yZQo+ID4gPiBjb2RlLiBTbyBpZiB0aGVyZSBpcyBh
IGNsZWFuIGxheWVyaW5nIGFwcHJvYWNoIHdoaWNoIGNhbiBiZSBlbmFibGVkCj4gPiA+IGFzIGEg
bW9kdWxlIGFuZCB5b3UgYXJlIG1haW50YWluaW5nIGl0IEknbSBmaW5lIHdpdGggdGhhdCAoZXZl
biBpZgo+ID4gPiB0aGUgY29yZSBjb2RlIG5lZWRzIHNvbWUgY2hhbmdlcyB0aGVuIGxpa2UgaG9v
a3Mgb3Igc28sIG5vdCBzdXJlKS4gIAo+ID4KPiA+IFRoYXQgZGlzY3Vzc2lvbiBzdGFydGVkIHdp
dGggTWlxdWVsIHNvbWUgeWVhcnMgYWdvIHdoZW4gaGUgd2FzIHRyeWluZyB0byB0byAKPiA+IHNv
bHZlIGRlc2NyaXB0aW9uIGluIERUIHdoaWNoIGlzIG1lcmdlZCBmb3IgYSB3aGlsZSBpbiB0aGUg
a2VybmVsLiAgCj4gCj4gV2hhdCdzIHlvdXIgcG9pbnQgaGVyZT8gRnJvbSB3aGF0IEkgY2FuIHRl
bGwgdGhlIERUIGJpbmRpbmcgaXMgd3JvbmcKPiBhbmQgbmVlZHMgdG8gYmUgcmV3b3JrZWQgYW55
d2F5LgoKSSdtIHNvcnJ5IEknbSBub3cgY2F0Y2hpbmcgdXAsIGNhbiB5b3UgcG9pbnQgYXQgdGhl
IHRocmVhZCBleHBsYWluaW5nCndoYXQgaXMgd3JvbmcgaW4gdGhlIGJpbmRpbmdzPyBJIGRpZG4n
dCBmaW5kIHdoZXJlIHRoaXMgd2FzIGRldGFpbGVkLiBPcgpvdGhlcndpc2Ugc3VtbWFyaXplIHF1
aWNrbHkgd2hhdCBuZWVkcyB0byBjaGFuZ2U/CgpUaGFua3MhCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
