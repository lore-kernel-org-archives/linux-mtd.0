Return-Path: <SRS0=t7GP=TY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21BBC072B5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2019 07:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8562220879
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2019 07:58:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aqnK2H3v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="KOnEtOO2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8562220879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtVhuDVY6hJJvGHPA0NEqKX1LupozAenJzA2GXme4Mo=; b=aqnK2H3vike5nZ
	oAPZ6/X77PHjstERkc1LVBrcb8oIU+xg5zy8irZ8PD+umgbJv0LdP3FCGcu0iIjLICmicNHUq56Lk
	gFnscirrwWj17CysilzQxKstDR4pQx/N5j25RjMP/7Wlg+N5deoGC5oNDJwy29fmAjIlY49VC4vV1
	4G5J+B2RUbD7ksLxg9NlG8mMiSXzcvHbu6ePVlRMSxeIZEaIHdLCr5fd4U+pUCd+D3mBTlEB0JaC/
	t0i5GCOQRv50AdyI9mfC5C00ErtMiRqH/N+eTMz2jPvpPDbjc5XuD2hoMNM5TWFJnGs1n6vFFlwDE
	G+1y0cScfOInBzPm+nug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU55d-0002A3-RF; Fri, 24 May 2019 07:58:09 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU55Z-000298-Na; Fri, 24 May 2019 07:58:07 +0000
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x4O7vXaN012803;
 Fri, 24 May 2019 16:57:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4O7vXaN012803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558684654;
 bh=iwxptEWNoNuAggIv6ZzzOgYePALjmh157JvK6O3GQ+M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KOnEtOO2tVYR3pSVhF2Roje/9zkqOoma80gDcWzCuNA5peJdqgbTJcZjMmDe7kkwP
 lvTb7eS32JVnxZ7yHo9oAVFr7pNEK0mCfOrLItt/5WmVKWQsfOMY1NKvETu4KgmZBv
 YajKYHAvvBFBUJSZiHcAU8aHQtBADEN7gO8S1X9OAJEUlAAQ4IZ04jUbTc3ZNtWCCh
 nN37B7jfKKb1NhOlQtfpyszPkRAocoVSAwm1IVJN/Ys1PWN4GqPoH5Qr11dRNnsDQd
 al5c7JYGdW5LsQZdCamORCwKLWruaymrk7I/M8eWG9zrLe5O5rygQ2gAz1ZkyoWBGV
 Tmd1E/nLhI0Hw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id x184so5182040vsb.5;
 Fri, 24 May 2019 00:57:33 -0700 (PDT)
X-Gm-Message-State: APjAAAVdHR5r6h2r9g/2ie4U89MqWl5aUoStaG8y3i+7PilsmTjcHvVL
 cZj3VpbuVz+u/AQ8ZQFuK/cfZOH26L74RwuQE08=
X-Google-Smtp-Source: APXvYqy9HyOTLHREY5vNW/0PnyiebTKKzFcHFlc01jbS/K6N+3usbwH5tgTtX3aXMfw8ABKVzIxuldjqWecMuKfKCbg=
X-Received: by 2002:a05:6102:3d9:: with SMTP id
 n25mr23613569vsq.181.1558684652750; 
 Fri, 24 May 2019 00:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190507092020.1917-1-xiaolei.li@mediatek.com>
 <20190507092020.1917-2-xiaolei.li@mediatek.com>
 <CAK8P3a3d-2U=hpb0P0+W-eZ0cviwKVwy6dWvHbhBCgF4CJUWKA@mail.gmail.com>
In-Reply-To: <CAK8P3a3d-2U=hpb0P0+W-eZ0cviwKVwy6dWvHbhBCgF4CJUWKA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 24 May 2019 16:56:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAScdEk=1P5M5JEtmjtSmGTHcBSf1M7kR5s9wGsA_dTn_A@mail.gmail.com>
Message-ID: <CAK7LNAScdEk=1P5M5JEtmjtSmGTHcBSf1M7kR5s9wGsA_dTn_A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver
 as Dual MIT/GPL
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_005805_982935_023665C9 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Ryder Lee <ryder.lee@mediatek.com>, srv_heupstream@mediatek.com,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>, Wen Yang <yellowriver2010@hotmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Jorge Ramirez Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Xiaolei Li <xiaolei.li@mediatek.com>, rogercc.lin@mediatek.com,
 Dan Carpenter <dan.carpenter@oracle.com>, peterpandong@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgNDo1MyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDcsIDIwMTkgYXQgMTE6MjAgQU0gWGlhb2xlaSBM
aSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4KPiA+IEl0IGlzIHdhbnRlZCB0
byB1c2UgTVRLIE5BTkQgZHJpdmVyIHdpdGggR1BMLTIuMCBvciBNSVQgbGljZW5zZS4KPiA+IEJ1
dCBub3cgaXQgaXMgb25seSBsaWNlbnNlZCBhcyBHUEwtMi4wLgo+ID4gU28gcmUtbGljZW5zZSBp
dCBhcyBkdWFsIE1JVC9HUEwgYW5kIHJlcGxhY2UgbGljZW5zZSB0ZXh0IHdpdGgKPiA+IFNQRFgg
dGFnLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0
ZWsuY29tPgo+ID4gQWNrZWQtYnk6IEpvcmdlIFJhbWlyZXotT3J0aXogPGpvcmdlLnJhbWlyZXot
b3J0aXpAbGluYXJvLm9yZz4KPiA+IEFja2VkLWJ5OiBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRp
YXRlay5jb20+Cj4gPiBBY2tlZC1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
Pgo+ID4gQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
Cj4gPiBBY2tlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3Jh
LmNvbT4KPiA+IEFja2VkLWJ5OiBSb2dlckNDIExpbiA8cm9nZXJjYy5saW5AbWVkaWF0ZWsuY29t
Pgo+Cj4gQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBTb3JyeSBm
b3IgbWlzc2luZyB0aGlzIGVhcmxpZXIuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8KCgpJIGZvdW5kIG15IHRpbnkgY29udHJpYnV0aW9uIGZvciBtdGRfbmFuZC5jIChmMGRi
ZTRhYTM1ZTczKS4KQW55d2F5LCBJIGRvIG5vdCBtaW5kIHRoaXMuCgpBY2tlZC1ieTogTWFzYWhp
cm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KCgoKLS0gCkJlc3QgUmVn
YXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
