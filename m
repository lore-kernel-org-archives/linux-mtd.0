Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09FFC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:27:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE0B2064A
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tZ+Ta1cX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kF7IMaoT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE0B2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnC96NUXGSTXDasj9aCuVwo3QiZDgdDMnMjKTG4VP1I=; b=tZ+Ta1cX4eesN6
	u0DboKb6gQ4McwlOh0M6FPJbokDOpMwBqUtLiAxH90HyzyDD157eyiev9I8aRGhBBgr3sc2LZfL9Z
	z2yLKKbTcue2kAbY0Mxa/hjBV/4CkXLKOSyQ74772n1/ZJBDvVNXXEsP+SyIM0/KZ/tR8DZ3sUKQ9
	7hydn0UYV6mOWmdvpFM7cHyGbLpr6HvryBXMQ2XbXiUAd8cWxAGUNfIjOTYs8tqbNgFix+xNpNa5g
	dxboGtEb5r93DBWnPQzFliUpL7XtLc1IQYiOtocBLhn9P1nJHScBzQWGi3MLVvrNAlbzvW4N4qmZO
	GDrwIpGgtYZAFu+yM23Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhmQ-0003B5-N9; Wed, 17 Apr 2019 10:27:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhmP-0003An-0t
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57c1jUFRVlr6Skx3BMqbFKR/8WtfHfd53bN/9WmArvg=; b=kF7IMaoT+F/YNeVpLK4zlCYxqV
 gO3HvsJkxW2+vOgt/VwmHPyh4UpglxqChUZTR+Nhap+VYGUE8rPNn347nvirqGdUxlZaf8O/XJj1/
 yV1XvsIZqab6LCP9EAlooMEQFc61aHFmhbDIAB6ACHt05Y1kpXi/J1/GEaF6OJIdolcYqMi1C85hS
 EJ5FmPm0+8Q2txja4r5rK0GVk4R9m5FtyZoBfAOr8ltbupi8xlQ7gc+GS6LzEovtnFzu627ZvWOBL
 IV4/HFkPTRMirt8NQTY0M3uqy0SfTszePdz7nvrOYSyvtXETOh2WdzndHEu0+96YJpoqCkD5HQCs1
 bwG9pKug==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhmL-00017v-Np
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:26:59 +0000
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A455B100003;
 Wed, 17 Apr 2019 10:26:06 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:26:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 07/14] mtd: rawnand: gpmi: remove unused parameters
Message-ID: <20190417122605.43baa42d@xps13>
In-Reply-To: <20190409113421.3037-8-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-8-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_112657_859278_4F3D7BFA 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjE0ICswMjAwOgoKPiBncG1pX2VjY19yZWFkX3BhZ2Vf
ZGF0YSB1c2VzIHRoZSBwYWdlIHBhcmFtZXRlciBvbmx5IGZvciBhIGRlYnVnIHByaW50ZiwKPiBz
byB3ZSBjYW4gZHJvcCB0aGUgcGFyYW1ldGVyIGFuZCB0aGUgZGVidWcgcHJpbnRmLiBNb3Zpbmcg
dGhlIG9vYgo+IGRlbGl2ZXJ5IGZyb20gZ3BtaV9lY2NfcmVhZF9wYWdlX2RhdGEgdG8gZ3BtaV9l
Y2NfcmVhZF9wYWdlIG1ha2VzIHRoZQo+IG9vYl9yZXF1aXJlZCBwYXJhbWV0ZXIgdW5uZWNlc3Nh
cnkgYXN3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5n
dXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWkt
bmFuZC5jIHwgMzQgKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
