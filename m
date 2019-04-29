Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9323FC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B0320673
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uj65G/8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63B0320673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqyfk2d8/IHZoInwP2OpKpaVGra82dAhCW+BmDRFRu0=; b=Uj65G/8xyeckkz
	mgcO5tRFpVFqHpXaHHjH/rlDH1vhH7U6vQPfvinJpQRMqFMXdYGetY+6rzhZlFXRSdnJ7SP68g5Je
	GRmg/K2HoX0KtOkNqPCjt+FI+nfCn8D4CZt+1Lc3FUwkopprtS6lNbEgXytildnYfhqFeec8EOTJg
	rEeEmmO4jXNN/QvaKsRJ2/EJUp+Wrc8Riuzr4dsDC22Tk8SY2V9BuckTSZTTQiFSbU4VeIyXjRMfq
	ohTNFolz4HQJ4QvzVhQOHViA4w7mLaGov0dA107FWONByfn++Q3bHmhyuKx7lkyWY8FLRd1pt8pmy
	PCO9ZiYeXn3VB2PVoGfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2lP-0001IM-UN; Mon, 29 Apr 2019 09:39:55 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2lM-0001Hv-Tf
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 09:39:54 +0000
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id DACF410000A;
 Mon, 29 Apr 2019 09:39:50 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:39:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vesta <laguna-mc@mail.com>
Subject: Re: Arguments when nanddump mtd partitions
Message-ID: <20190429113949.0213e769@xps13>
In-Reply-To: <trinity-5c9b9190-9eab-4324-be77-989be8846f42-1555169751470@3c-app-mailcom-lxa02>
References: <trinity-5c9b9190-9eab-4324-be77-989be8846f42-1555169751470@3c-app-mailcom-lxa02>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_023953_108125_0A79C540 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmVzdGEsCgpWZXN0YSA8bGFndW5hLW1jQG1haWwuY29tPiB3cm90ZSBvbiBTYXQsIDEzIEFw
ciAyMDE5IDE3OjM1OjUxICswMjAwOgoKPiBIZWxsbywKPiAKPiB3aGF0IHNob3VsZCBiZSB0aGUg
cHJvcGVyIGFyZ3VtZW50cyB3aGVuIG1ha2UgYmFja3VwIG9mIG10ZCBwYXJ0aXRpb25zPwo+IAo+
IG5hbmRkdW1wIC1mIC90bXAvbXRkMCAvZGV2L210ZDAKPiBvcgo+IG5hbmRkdW1wIC0tbm9lY2Mg
LS1vbWl0b29iIC1mIC90bXAvbXRkMCAvZGV2L210ZDAKPiAKPiAKPiAjIGNhdCAvcHJvYy9tdGQK
PiBkZXY6ICAgIHNpemUgICBlcmFzZXNpemUgIG5hbWUKPiBtdGQwOiAwMDA2MDAwMCAwMDAwNDAw
MCAidS1ib290Igo+IG10ZDE6IDAwMDIwMDAwIDAwMDA0MDAwICJ1LWJvb3RlbnYiCj4gbXRkMjog
MDEzZTAwMDAgMDAwMDQwMDAgIlJPTUlNQUdFIgo+IG10ZDM6IDAwNzAwMDAwIDAwMDA0MDAwICJI
QUxGSU1BR0UiCj4gbXRkNDogMDEyNjAwMDAgMDAwMDQwMDAgIkxJTlVYX1JPT1RGUyIKPiBtdGQ1
OiAwMDIwMDAwMCAwMDAwNDAwMCAiSFNfRlciCj4gLi4uCj4gCgpJIHdvdWxkIHNheSB0aGF0IGl0
IGRlcGVuZHMgb24geW91ciBjb250cm9sbGVyIGRyaXZlci4KCklkZWFsbHksIHlvdSBzaG91bGQg
cmVhZCBkYXRhK09PQiB3aXRoIEVDQyBlbmFibGVkLiBBbHNvIGVuYWJsZSB0aGUgRUNDCmNvcnJl
Y3Rpb24gd2hlbiB3cml0aW5nIGJhY2suIEJ1dCBpZiB5b3UgY29udHJvbGxlciBkcml2ZXIgaGFz
IG5vCnByb3BlciBzdXBwb3J0IGZvciBpdCBhbmQgeW91IGRvbid0IGNhcmUgYWJvdXQgT09CIChn
ZW5lcmFsbHk6IGluIGFsbApjYXNlcyBidXQgSkZGUzIpIHlvdSBtYXkgd2FudCB0byBqdXN0IGR1
bXAgdGhlIGRhdGEuCgpJZiBmb3Igc29tZSByZWFzb24geW91IGRlY2lkZSB0byBkdW1wIHRoZSBk
YXRhIGluIHJhdyBtb2RlLCB0aGVuIHlvdQp3aWxsIG5lZWQgdGhlIE9PQiBieXRlcyBhbmQgeW91
IHdpbGwgbmVlZCB0byB3cml0ZSB0aGVtIGJhY2sgaW4gcmF3Cm1vZGUgYXMgd2VsbC4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
