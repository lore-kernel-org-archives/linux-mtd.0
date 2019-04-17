Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7856BC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:05:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4228220835
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aq9YewQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4228220835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgUfsQbeSX6+ns9xQAFmZBNQFkO/jgeg1KgsXXqa1gU=; b=aq9YewQOJU323f
	ER6zTXPoGD/+9gLr0U87QcHmkdJhhvWf6+uYcUBz0Ag65+3WuKIbOws2jO/W4iEbUoUfP0QxUvKjo
	towbOdC2Kp88EnTsEyxLr8Kb7VPargiJZGF7CvknOCeh5lVe7RYwty4iFsXrEFGfuFFr3/3NHX2TA
	YX9HMI3GoftxgGb7yLqQcXr4Wzsgs9B3XsHCgsZvJxymca3qploJ3rhJF7RHflfIkXeak6EqcKNfl
	DjnV9lYY5XSH4OBEy8vZtgXDjpKqk4t/dnDqtnr+sqpugOSF1WhHTTEG2QObpd8WTMMlbSx8fpv7H
	0UG3CfQWbnftl5mMWu2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhRK-0001Al-UZ; Wed, 17 Apr 2019 10:05:14 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhRD-0000FE-NL
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:05:12 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0531C40011;
 Wed, 17 Apr 2019 10:05:04 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:05:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 3/7] mtd: nand: Cleanup flags and fields for bad
 block marker position
Message-ID: <20190417120504.105ffcb5@xps13>
In-Reply-To: <20190218104122.18788-4-frieder.schrempf@kontron.de>
References: <20190218104122.18788-1-frieder.schrempf@kontron.de>
 <20190218104122.18788-4-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_030508_998574_78B57829 
X-CRM114-Status: UNSURE (   7.35  )
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
ZT4gd3JvdGUgb24gTW9uLCAxOCBGZWIKMjAxOSAxMDo0Mjo0MyArMDAwMDoKCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IAo+IE5vdyB0aGF0
IHdlIGhhdmUgbW92ZWQgdGhlIGluZm9ybWF0aW9uIHRvIHRoZSBjaGlwIGxldmVsLCBsZXQncwo+
IHJlbW92ZSBhbGwgdGhlIHVudXNlZCBmbGFncyBhbmQgZmllbGRzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4KPiAtLS0K
ClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
