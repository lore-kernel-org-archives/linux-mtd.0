Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF37C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 15:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLT0MygHmE99B3D3tNybOVytzoQCMHQd5qFNQn7FuWs=; b=3Z/q18Pr9qSYX2
	KndMxUszKJzAgzmzIW3Zrcl2VyvLqj133q9BnPz6uGu5HU/E2LysIE1t3Yl7ldO1YHRdt4Skb/a5g
	XfVyNjt761CsTY6xq07tl5hSS9Rdvvz+yhcnu/i77PM2OPjWpYDZFk99m2xkREmV5aIX9nPQJU2Ar
	g/tnVLhXRI37SaPeMEdQ8IafL+Vye9p/FSnz7ptDhHm42mVzEQIaoLo4MorFl81q3r530Adsq52fU
	r2SeI0inrq1jVzlQGJxw1AnAS6aqftStX3Ex6d7eZW7aLQz0Mfs0sIUj7pltAnxDl068hHt6GLe66
	IjV8X7RCPsu/L+4oiRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nefLs-001g7p-TZ; Wed, 13 Apr 2022 15:56:16 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nefLo-001g6h-65
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 15:56:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1CFF3100008;
 Wed, 13 Apr 2022 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649865368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12qpawHFnERqRE1NkvVMU3NJkzJ4Yl5g9ig69B3bWPM=;
 b=aMSOZK1UmOlTULlnuykZdkNAb2pjqGc/XDZnLDK1qdRm9nPXCEtYOBupVpfrAEBtl5NvOW
 Td40yQsh7PB0hIeFJlibLTig25UjxEo/QBTz8NcbC58oKr2PItDNkNahic7N94cj/YoNRk
 sqH+wjZHJpTDMKeb7gt3L/KnqOAmPz4b0swCVqmcMTKjMpTibj8L36fpWRu1OqBxU7Wj66
 Q9HURR0VzTRr60E95GciEyCGpdusJ/w5iAnvgQ4dUIOw0BA3ChQY3XHf24Hem87F8BUB5C
 Iwxg9WZRwjnnn07Kr1RnI95lnouS6nNaZ7j5ttXWedpLfP+7PuY4JwUzdTBzEw==
Date: Wed, 13 Apr 2022 17:56:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Felix Matouschek <felix@matouschek.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for XTX XT26G0xA
Message-ID: <20220413175605.758ca842@xps13>
In-Reply-To: <c49e86c8-5433-343f-d41f-ce6e9dcdf75b@matouschek.org>
References: <20220408161904.94383-1-felix@matouschek.org>
 <20220411092311.3f0b97b3@xps13>
 <e697bea9-29b6-2f83-7d42-02afd88fa6b1@matouschek.org>
 <20220411220310.14e2da32@xps13>
 <c49e86c8-5433-343f-d41f-ce6e9dcdf75b@matouschek.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_085612_396964_FC09DA3C 
X-CRM114-Status: GOOD (  12.48  )
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

SGkgRmVsaXgsCgpmZWxpeEBtYXRvdXNjaGVrLm9yZyB3cm90ZSBvbiBXZWQsIDEzIEFwciAyMDIy
IDE3OjM4OjI4ICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gQW0gMTEuMDQuMjIgdW0gMjI6MDMg
c2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+ID4+IEFjY29yZGluZyB0byB0aGUgZGF0YS1zaGVldCAo
c2VjdGlvbiA3LCBwYWdlIDI3KSB0aGUgc3dpdGNoIHNob3VsZCBiZQo+ID4+IGFibGUgdG8gaGFu
ZGxlIGFsbCB2YWx1ZXMgb2YgdGhlIHN0YXR1cyByZWdpc3Rlci4gU28gc2hvdWxkIEkgcmVtb3Zl
IHRoZQo+ID4+IGZpbmFsICJyZXR1cm4gLUVJTlZBTCI/ICAKPiA+IAo+ID4gSSB0aGluayBzbywg
eWVzLiAgCj4gCj4gSSBub3RpY2VkIHRoYXQgdGhlcmUgYXJlIGFjdHVhbGx5IHNvbWUgcG9zc2li
bGUgdmFsdWVzIGZvciB0aGUgRUNDIGJpdHMgaW4gdGhlIAo+IHN0YXR1cyByZWdpc3RlciwgdGhh
dCBhcmUgbm90IGNvdmVyZWQgYnkgdGhlIHN3aXRjaCBjYXNlLiBBY2NvcmRpbmcgdG8gdGhlCj4g
ZGF0YS1zaGVldCB0aGV5IHNob3VsZCBub3QgaGFwcGVuLCBidXQgd291bGQgaXQgYmUgd2lzZSB0
byBjYXRjaCB0aGVtIGFueXdheXM/Cj4gTWF5YmUgaWYgc29tZXRoaW5nIGdvZXMgd3Jvbmc/CgpZ
ZXMgb2YgY291cnNlLCB0aGF0IHdhcyBteSBhZHZpY2UgaW4gdGhlIGZpcnN0IHBsYWNlIDopCgo+
IAo+IFRoYW5rIHlvdSwKPiBGZWxpeAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
