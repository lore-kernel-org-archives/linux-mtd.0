Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E34CD37B0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Sep 2023 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmSiXMEgRNUSPjrzETQArIFeNB8/k6M+e9HThe6Esu0=; b=mH5XKKZob3/AOL
	yQfNjrNawHHZ+dOladPN30Q+V4DkpHFXsXPDsE2TzImPPl24QiRncPsAmkeKYAzvBxG+dnFOrofg+
	sCZMAmcKOC3m5fSF1SOwt9nMamCkwIB7cG9UankdCrrK4C9aoRTzfvxDaw1iGJHlj9PP2DXD8buFO
	SmNU+B48+hf0T2b6UV6cJokqCn7WmsLurACcUawMMZ1SZQoe3lWf52wDS0oSyD39dYIe9N9aXxwvj
	woYEOalf71sVz+tdBxK49pM7t/ZUHbO6qncFxEJnN59kKvVPWpzPYUaGV/udl6j9NxWwujeDzzyKD
	y0N7Ntr1VXAy0Fusj/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDqC-00FTzI-0c;
	Mon, 18 Sep 2023 12:59:04 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDq9-00FTwj-1R
	for linux-mtd@lists.infradead.org;
	Mon, 18 Sep 2023 12:59:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B5066000A;
	Mon, 18 Sep 2023 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695041935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBXbmgI35Ay6iC6gwJK7LAKP2TjFS8/WQ3+OgmLbkxg=;
	b=eASqEhaQOxhMM0xv2JXtw7MYTf+HDpkUT/wk/+Zw2osl+qMPMkyzZBuIU/fQz2sxzOFFSB
	vw4pHo8+omK/W7OCuTiynmHRBXCLA2eMtZfsYVqWBApHNzFR2eRmnwhvaX37om4kZn18zp
	do4bZYwXanFr193bP8khG3YKXG/pTESP37eRX1wXmvHal4iM3Ykk1o4j/N9Mo0bi2Ipm7q
	0VjUEYkxTRTCcSSfqyB6/oLkoRiTTsQsIOTdNp6cPG+2/bla76DLjprJUCfuQTFUHWovy3
	shQNTgXsLQz2Z5H5lLacO45iqlp4Zs3Se/sMmIeDLp9NuM+6Ydv/h8zDyiaQmQ==
Date: Mon, 18 Sep 2023 14:58:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin via B4 Relay
 <devnull+nikita.shubin.maquefel.me@kernel.org>
Cc: <nikita.shubin@maquefel.me>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, Neil
 Armstrong <neil.armstrong@linaro.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Liang Yang <liang.yang@amlogic.com>, Christophe
 Kerello <christophe.kerello@foss.st.com>, Jean Delvare <jdelvare@suse.de>,
 Johan Jonker <jbx6244@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v4 26/42] mtd: nand: add support for ts72xx
Message-ID: <20230918145852.46a15c77@xps-13>
In-Reply-To: <20230915-ep93xx-v4-26-a1d779dcec10@maquefel.me>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
	<20230915-ep93xx-v4-26-a1d779dcec10@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_055901_670562_01764C3B 
X-CRM114-Status: GOOD (  10.05  )
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

SGkgTmlraXRhLAoKZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1hcXVlZmVsLm1lQGtlcm5lbC5vcmcg
d3JvdGUgb24gRnJpLCAxNSBTZXAgMjAyMwoxMToxMTowOCArMDMwMDoKCj4gRnJvbTogTmlraXRh
IFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KPiAKPiBUZWNobm9sb2dpYyBTeXN0
ZW1zIGhhcyBpdCdzIG93biBuYW5kIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb24gaW4gQ1BMRC4K
CkkgaW5pdGlhbGx5IGFncmVlZCB0byBhY2NlcHQgYSBmaXJzdCB2ZXJzaW9uIG9mIHRoaXMgY29u
dHJvbGxlciBkcml2ZXIKd2l0aCBhIGxlZ2FjeSBBUEkgYmVjYXVzZSBwZW9wbGUgd2VyZSBhcHBh
cmVudGx5IHVuZGVyIHRpbWUgcHJlc3N1cmUgdG8KZ2V0IHRoaXMgaW4uIEkgc2VlIGl0J3MgYmVl
biBhIGNvdXBsZSBvZiBtb250aHMsIHNvIHRoaXMgaXMgbm90IHRoYXQKdXJnZW50IGFmdGVyIGFs
bC4gQXMgdGhlIGRyaXZlciBpcyBvbmx5IDE2NiBsaW5lcyBsb25nLCBJIHdvdWxkCnN0cm9uZ2x5
IHByZWZlciBhIHZlcnkgc3RyYWlnaHQgLT5leGVjX29wKCkgY29udmVyc2lvbiBpbiBvcmRlciB0
byBnZXQKcmlkIG9mIHRoZXNlIHVnbHkgZGlyZWN0IEkvTyBhY2Nlc3Nlcy4KClRoYW5rcywKTWlx
dcOobAoKPiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVl
ZmVsLm1lPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNyArCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVjaG5vbG9n
aWMtbmFuZC1jb250cm9sbGVyLmMgfCAxNjYgKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKykKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
