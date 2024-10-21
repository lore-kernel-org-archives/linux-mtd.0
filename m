Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D547D0E6C3
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xRLNTOf7L36y549cKwrfsPM7ldUTj0RkbMzFtdGffw=; b=iHdwL1RNJDzK6i
	jY8/xWu591kBrbW3Dek3pHS3EPNy4orny9bU/JdTKgL6JQ1cByY4nPS1Oa4h7T94sVHoxkST0OWIn
	inQeFh/hqPNnHC+AYsr5Et9jXskMlD2jElpzcWdpfH+ExgcDNfs1a5pL5M7SMLE59drGTUgWB3dT6
	awrP+rusNF9vjUY7g2yI/HQU8e25Oh+0TLwmOropk2vgTdO6hn24nVk80iaILV4O+z4hiEioBAdZ/
	7p+BbeS7CVcC0U9A044He+zi0dnP8olVu3Z/V/7D2an3flFTz0ockJBkk7dvxgrIpmpaaZWBy+GMP
	sm2Xc3yPhE+W1Wm19xjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nA8-00000006RVz-0HLh;
	Mon, 21 Oct 2024 07:49:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2n1j-00000006Pa4-1fBO
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 07:40:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8FA3FF804;
	Mon, 21 Oct 2024 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729496427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Asrwsm8zwlwMCiUP5EbChP1RzR2jVUK8/9CWZ0z+nHQ=;
	b=MLXcKR5ykn3Ts0iXIMhSUAQDpw0ANk/IPcVQJityqPx1s4Xi6mOGpvGXKESMP/coO97yTO
	KLi/RuDHzUPasteHvAc9AejXVn/3T/FsCtfjAHqPWZkRmqiaCImK9rIlgzhnbERGjbh8j5
	Vl5NVcfJazP/23+BnxVlY9hwO3w/fL9V3iNRTzwjGLVWvkl95xO6Q2/pLY/0i9vy+a7169
	D6omHOZ2QM2BKahW2azpv1kbvbkHI9SVXsKJZqIECZP4RMnzJnXi7nzZo2buqaiSjN4Tc5
	Sbqu3faKUUfJEDVy/3tqmv5r5R1yN4KgZYCs9XRxic7h2OcWMea97z4yX6jN6w==
Date: Mon, 21 Oct 2024 09:40:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] mtd: rawnand: davinci: order headers alphabetically
Message-ID: <20241021094024.6855b93c@xps-13>
In-Reply-To: <CAMRc=MeVQVeXdMTk-ZjabkEv58VN=2vchcy3LZ24pEwwN1DTpw@mail.gmail.com>
References: <20241007122350.75285-1-brgl@bgdev.pl>
	<CAMRc=MeVQVeXdMTk-ZjabkEv58VN=2vchcy3LZ24pEwwN1DTpw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_004031_584105_E2020100 
X-CRM114-Status: GOOD (  10.02  )
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

SGkgQmFydG9zeiwKCmJyZ2xAYmdkZXYucGwgd3JvdGUgb24gTW9uLCAyMSBPY3QgMjAyNCAwOToy
NTo0OCArMDIwMDoKCj4gT24gTW9uLCBPY3QgNywgMjAyNCBhdCAyOjI04oCvUE0gQmFydG9zeiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEZvciBi
ZXR0ZXIgcmVhZGFiaWxpdHksIHB1dCBhbGwgaW5jbHVkZXMgaW4gYWxwaGFiZXRpY2FsIG9yZGVy
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29s
YXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+IC0tLQoKLi4uCgo+IAo+IEl0J3MgYmVlbiB0d28gd2Vl
a3Mgc28gZ2VudGxlIHBpbmcuCgpUaGUgcGF0Y2hlcyBhcmUgZ29vZCwgSSBkaWRuJ3QgdG9vayB0
aGUgdGltZSB0byBxdWV1ZSB0aGVtIHlldCBidXQgSQpwbGFuIG9uIGNvbGxlY3RpbmcgYWxsIHRo
ZSBwZW5kaW5nIHBhdGNoZXMgKGluY2x1ZGluZyB5b3VycykgdGhpcyB3ZWVrLgoKU29ycnkgZm9y
IHRoZSBkZWxheSEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
