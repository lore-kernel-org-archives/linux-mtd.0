Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04091C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C628A20835
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:03:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T5FTmHy6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C628A20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLN4Z9f2oskrjh3pUeq2405QyPhHS92/4KuEeYLywro=; b=T5FTmHy6buqU9Y
	h9Sd2OcBMFtpnzSThegvEjYEhMx/muZjnlt4x00nFLZTL33Hi0cwhRpOmqlLIy0WH/4bbWxX26Cbn
	eqWGK1hctoYmm8bm5WKX7rYu8ZI7Ak5KirBrsM0zoIXngYtsx0OG08B9rGrBlSbIPYt+BSw3Zrhqz
	cWaXjZHP6yUS2prUZJRmipHToW+I2o30OZHKA2VD5wdkFg8vDd6ZCvKfi03qWU6Lh4cFYIIWbpJw5
	Py0P6eFaQJaWOKTAc+EdwBcCrxrrcFY2c9x+YG/k+Z2FJnPrHgsK1zvvs1MFFUzbRGWrj4bA6hp05
	B7/dY6F2u38JDvCcL8AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhPo-0007dw-LK; Wed, 17 Apr 2019 10:03:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhPm-0007dF-04
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:03:39 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 521AEE000E;
 Wed, 17 Apr 2019 10:03:34 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:03:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 1/7] mtd: rawnand: Always store info about bad block
 markers in chip struct
Message-ID: <20190417120333.3dc535e3@xps13>
In-Reply-To: <20190218104122.18788-2-frieder.schrempf@kontron.de>
References: <20190218104122.18788-1-frieder.schrempf@kontron.de>
 <20190218104122.18788-2-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_030338_187675_9A0C1BF6 
X-CRM114-Status: UNSURE (   8.58  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJpZWRlciwKClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gTW9uLCAxOCBGZWIKMjAxOSAxMDo0MjozOSArMDAwMDoKCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IAo+IFRoZSBpbmZv
cm1hdGlvbiBhYm91dCB3aGVyZSB0aGUgbWFudWZhY3R1cmVyIHB1dHMgdGhlIGJhZCBibG9jawo+
IG1hcmtlcnMgaW5zaWRlIHRoZSBiYWQgYmxvY2sgYW5kIGluIHRoZSBPT0IgZGF0YSBpcyBzdG9y
ZWQgaW4KPiBkaWZmZXJlbnQgcGxhY2VzLiBMZXQncyBtb3ZlIHRoaXMgaW5mb3JtYXRpb24gdG8g
bmFuZF9jaGlwLm9wdGlvbnMKPiBhbmQgbmFuZF9jaGlwLmJhZGJsb2NrcG9zLgo+IAo+IEFzIHRo
aXMgY2hpcC1zcGVjaWZpYyBpbmZvcm1hdGlvbiBpcyBub3QgZGlyZWN0bHkgcmVsYXRlZCB0byB0
aGUKPiBiYWQgYmxvY2sgdGFibGUgKEJCVCksIHdlIGFsc28gcmVuYW1lIHRoZSBmbGFncyB0byBO
QU5EX0JCTV8qLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIu
c2NocmVtcGZAa29udHJvbi5kZT4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
