Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D279C54EE9
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Sep 2022 07:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jccy08muiaivwETiU3dlbe6UYr2EG4AO4PqePoEcE1s=; b=D0z5Ev3Y2e7uEh
	CsOaeXWIj+3KENhL7Iu21ZWjaoikgzxpW5Uvb4LY+J9vWrfOuGrQriWRv0GqrQi2T0slcgEPPzFhK
	vZFPs1OixLFIS5J06fA2ZxgRuTSiU7BJXQXlQyWaJ51weoY53azg2uadckANd+AqiaOIzLXcdQkB8
	xYhte10jEnC5vPjeUf3CHzHTkNIFtpNmH81Lp9P9wdA2K1EQAVBIf3yq9vNPEbSISkdkhthut7MYI
	9pvZzEG3/SRW6/6xT2cvfpIzndME9ML3v++V1ld6BRDDp4lnZmWu3hwDLg2Wnve0cxPiTXXfFhmgL
	S6vQKT+goVbzeecjKSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0hl-0016ep-Lr; Fri, 02 Sep 2022 07:03:05 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0hi-0016Yr-RP
	for linux-mtd@lists.infradead.org; Fri, 02 Sep 2022 07:03:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8155FFF809;
	Fri,  2 Sep 2022 07:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662102176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kUEi3qE9VsWHjdX8pelP/Njt/+TRnCAycHuxXrGFqsM=;
	b=Hph2yMdjFg6+8neCCiNoZc5rRX6pnFD61fs7s86ZWlXK3hV5+yezKmaloLEFyBucCQqNBF
	Ivh4VNLKUOOHPrEjGcDeo9NV8RyKvzi7NwP/3/o0WQtnwc2JDVeBO0ME8+j4HQ63l6Xk8/
	hhtJM8DcJHlcwEHMewja9rvFCy+73FaZnlXmzHbWFiZ7p9cQKCs6fP369XxHtOc5MBXmGl
	FmwvxirY4CgUrSVo22SjiO7dNP2pg/U/yNXj9sPkyyi9Gw8yJsh5Ym4jnlJlvJNjODGYlv
	7QX/Xo0ZCptEwemyE+a8kZTjSwFgPLJPoAFLGEbDcW0DaG7NzZoLaeOWphQA7Q==
Date: Fri, 2 Sep 2022 09:02:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Tomasz =?UTF-8?B?TW/FhA==?=
 <tomasz.mon@camlingroup.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Sasha Levin <sashal@kernel.org>, torvalds <torvalds@linux-foundation.org>,
 Han Xu <han.xu@nxp.com>, kernel <kernel@pengutronix.de>, stable
 <stable@vger.kernel.org>, k drobinski <k.drobinski@camlintechnologies.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Message-ID: <20220902090252.75285234@xps-13>
In-Reply-To: <770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
	<c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
	<fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
	<YtD/9KJZwlVj+6hS@kroah.com>
	<20220715074631.GA7333@pengutronix.de>
	<YtEdIujszEKSprbF@kroah.com>
	<770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_000303_067356_23950D2D 
X-CRM114-Status: GOOD (  11.71  )
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

SGV5IGZvbGtzLAoKcmljaGFyZEBub2QuYXQgd3JvdGUgb24gRnJpLCAxNSBKdWwgMjAyMiAwOTo1
OToxMCArMDIwMCAoQ0VTVCk6Cgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+
PiBNeSBJUkMgaGlzdG9yeSBkb2Vzbid0IGdvIGJhY2sgZmFyIGVub3VnaCwgYnV0IGlmIEkgcmVj
YWxsIGNvcnJlY3RseQo+ID4+IE1pcXVlbCBpcyBvbiB2YWNhdGlvbiwgaGUgd291bGQgaGF2ZSBw
aWNrZWQgdXAgdGhpcyBwYXRjaCBmb3IgbGludXgtbmV4dAo+ID4+IG90aGVyd2lzZS4gIAo+IAo+
IEV4YWN0bHkuCgpJbmRlZWQsIEkgd2FzIG9mZiBmb3IgYW4gZXh0ZW5kZWQgcGVyaW9kIG9mIHRp
bWUsIEknbSAodmVyeSkgc2xvd2x5CmNhdGNoaW5nIHVwIG5vdy4KCj4gIAo+ID4gT2ssIGxldCBt
ZSBkbyBhIHJvdW5kIG9mIHN0YWJsZSByZWxlYXNlcyBzbyB0aGF0IHBlb3BsZSBkb24ndCBnZXQg
aGl0IGJ5Cj4gPiB0aGlzIG5vdy4uLiAgCj4gCj4gVGhhbmtzIGEgbG90IGZvciBkb2luZyBzby4K
PiAgCj4gPiBIb3BlZnVsbHkgdGhpcyBnZXRzIGZpeGVkIHVwIGJ5IDUuMTktZmluYWwuICAKPiAK
PiBTdXJlLCBJJ2xsIHBpY2t1cCB0aGlzIHBhdGNoLgoKVGhhbmtzIEdyZWcgJiBSaWNoYXJkIGZv
ciB0aGUgaGFuZGxpbmcgb2YgdGhpcyBpc3N1ZS4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
