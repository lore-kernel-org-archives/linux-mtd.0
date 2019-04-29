Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0173CC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:20:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C43DA2147A
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iheBCOPl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C7aPM1JO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C43DA2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6+kZe4Jw7/zkgr5pf5OMUNH8mjbCPc7Ovcu8PuhHGQ=; b=iheBCOPlK9Rnla
	YlETOiuMMDw/tSoskBMXqRv5Ovs6brR5kzLWX2Cm6mwNLNvPP1TUBkFJnCb1yv53Hv/YRcEkXbwXO
	JknwL2WbNmgECPrPDM1eRTYJKug2YD31ilQPRsDN2AuVwiCqABgsHP4KNss8fzo8fyCat8geP1WPy
	nOcF4v/IVFMHt/uV7qBzLJPtl3+Zu6s9747Xizp0oNUUe+/q/Age3NggvUbSxfua8w2yF33S3nS6d
	UyXAWw+Mu34FPD65AX6DOOH1DHmyZAldn/yQbjmbM5KMa5nfnEclwZzwN0J3WRY6PahJxg6mcUkeP
	KGZ6FBX+XuJXMdshm2pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL1WL-0002Bb-Rm; Mon, 29 Apr 2019 08:20:17 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL1WK-0002BS-E0
 for linux-mtd@bombadil.infradead.org; Mon, 29 Apr 2019 08:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FAEKkqOaQt+fPukvAzUOd5gtjaAFC/i39YlO+OAePic=; b=C7aPM1JOrTLcUM+gphjrEXKjBw
 xYi42DZBuKY1GpWdWXo95CPQnDFD5BOvnCIFyX80OdLvDxmLuSKbjtyI/7faEK/OKUJb7LUoIvsGy
 YLN+n3U7OZKk0NdzXWfgyw9PJTqVjAkRMA3VeIzlNQLHECC2GxbpQE8RG/GNV8yopMwg6JTQi8UMt
 0bNtCvH0Q7eTnWlbuz8DbbeSzCjwgAUAR2oCW1l9KbgPQeB1xVPmFVrhdzfEaDdPJgG741h36cNOT
 RKggTkxc/yrwSCG54Bj+E+Yo8y6FUlGdKziNlJkUaP5G4KafROijsR9PoKX3lTLMSY3nMDkoEmKtx
 ac8a5rHw==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL1WH-0006aD-BZ
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 08:20:14 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 791EE20003;
 Mon, 29 Apr 2019 08:19:29 +0000 (UTC)
Date: Mon, 29 Apr 2019 10:19:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 0/5] mtd: onenand/samsung: Add device tree support
Message-ID: <20190429101928.265998b5@xps13>
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_042013_500897_4CCA4083 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 kyungmin.park@samsung.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF3ZcWCLAoKUGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29t
PiB3cm90ZSBvbiBGcmksIDI2IEFwciAyMDE5CjE4OjQyOjE5ICswMjAwOgoKPiBUaGlzIHBhdGNo
c2V0IGFkZHMgZGV2aWNlIHRyZWUgc3VwcG9ydCB0byBTYW1zdW5nIE9uZU5BTkQgZHJpdmVyLgo+
IEl0IHdhcyB0ZXN0ZWQgb24gU2Ftc3VuZyBHYWxheHkgUyBhbmQgU2Ftc3VuZyBHYWxheHkgUyBG
YXNjaW5hdGUgNEcsCj4gYW4gU2Ftc3VuZyBTNVBWMjEwIGJhc2VkIG1vYmlsZSBwaG9uZXMuCj4g
Cj4gVG9tYXN6IEZpZ2EgKDUpOgo+ICAgbXRkOiBvbmVuYW5kL3NhbXN1bmc6IFVuaWZ5IHJlc291
cmNlIG9yZGVyIGZvciBjb250cm9sbGVyIHZhcmlhbnRzCj4gICBtdGQ6IG9uZW5hbmQvc2Ftc3Vu
ZzogTWFrZSBzdXJlIHRoYXQgYnVzIGNsb2NrIGlzIGVuYWJsZWQKPiAgIG10ZDogb25lbmFuZC9z
YW1zdW5nOiBBZGQgZGV2aWNlIHRyZWUgc3VwcG9ydAo+ICAgZHQtYmluZGluZzogbXRkOiBvbmVu
YW5kL3NhbXN1bmc6IEFkZCBkZXZpY2UgdHJlZSBzdXBwb3J0Cj4gICBtdGQ6IG9uZW5hbmQvc2Ft
c3VuZzogU2V0IG5hbWUgZmllbGQgb2YgbXRkX2luZm8gc3RydWN0Cj4gCj4gIC4uLi9iaW5kaW5n
cy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dCAgICAgICAgICB8IDQ2ICsrKysrKysrKwo+ICBkcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jICAgICAgICAgICAgfCA5NCArKysrKysrKysr
KysrLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0
aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9zYW1zdW5nLW9uZW5hbmQudHh0Cj4gCgpJIHRoaW5rIHlvdSBzaG91bGQgdXNl
ICJtdGQ6IG9uZW5hbmQ6IHNhbXN1bmc6IiBhcyBwcmVmaXguCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
