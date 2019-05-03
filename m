Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A90FC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 08:27:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5A2205F4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 08:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L6TAfkNs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5A2205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QqBZJOl3aQr5r6gsjLlRWhVvLnqh8H2PgD4iKoMe6Q=; b=L6TAfkNsrLo8Q3
	Nr8Tx4NUhToW2bcWZj5r/iVfm48rh9TkxAvUILptEo5ACCVGUuIBX6O9Hr8GrEOiTtnC9loLMU3hL
	0tBnjA9/8ypZ1j0U+h4jHgK2bPIN9r7n5huivblylIDYkBbcFbV0zDHflm2xa/3mKkORgzt4vJeB5
	G1PB0qxGMwAZ2WGIKYr1T3oNnbgHc5gjpbrEuaaTYmK27k1SPOvB4rqNIuScou3f3mwUSx7nLM5zl
	Z1vh5Ojlx5H+pkH4O8GBtg+iL/JERJmhDySHULnDEKC/JLwVC6sRec99nmsw+gfR9uXa0cO3Djqbo
	oUdlRQw1mZWxLTVvCetA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMTXA-0005Qg-3H; Fri, 03 May 2019 08:27:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMTX3-0005KV-2v; Fri, 03 May 2019 08:27:02 +0000
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B11361C0011;
 Fri,  3 May 2019 08:26:47 +0000 (UTC)
Date: Fri, 3 May 2019 10:26:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 06/36] mtd: nand: Rename a core structure
Message-ID: <20190503102646.78415a9a@xps13>
In-Reply-To: <20190331133001.7b313cf0@collabora.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-7-miquel.raynal@bootlin.com>
 <20190331133001.7b313cf0@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_012701_276211_74F71826 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDMxIE1hcgoyMDE5IDEzOjMwOjAxICswMjAwOgoKPiBPbiBNb24sICA0
IE1hciAyMDE5IDIzOjI4OjExICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBQcmVwYXJlIHRoZSBtaWdyYXRpb24gdG8gYSBnZW5l
cmljIEVDQyBlbmdpbmUgYnkgcmVuYW1pbmcgdGhlCj4gPiBuYW5kX2VjY19yZXEgc3RydWN0dXJl
IGludG8gbmFuZF9lY2NfY29uZi4gVGhpcyBzdHJ1Y3R1cmUgd2lsbCBiZSB0aGUKPiA+IGJhc2Ug
b2YgYSB3aWRlciAnbmFuZF9lY2MnIHN0cnVjdHVyZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIGlu
Y2x1ZGUvbGludXgvbXRkL25hbmQuaCAgICB8IDggKysrKy0tLS0KPiA+ICBpbmNsdWRlL2xpbnV4
L210ZC9zcGluYW5kLmggfCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210
ZC9uYW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLmgKPiA+IGluZGV4IDg0YWI3NmYzNGM3
NC4uNzhjZjkwNTA4M2M5IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvbmFuZC5o
Cj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLmgKPiA+IEBAIC0xMjMsMTEgKzEyMywx
MSBAQCBzdHJ1Y3QgbmFuZF9wYWdlX2lvX3JlcSB7Cj4gPiAgfTsKPiA+ICAKPiA+ICAvKioKPiA+
IC0gKiBzdHJ1Y3QgbmFuZF9lY2NfcmVxIC0gTkFORCBFQ0MgcmVxdWlyZW1lbnRzCj4gPiArICog
c3RydWN0IG5hbmRfZWNjX2NvbmYgLSBOQU5EIEVDQyBjb25maWd1cmF0aW9uICAKPiAKPiBNYXli
ZSBuYW5kX2VjY19pbmZvLCBuYW5kX2VjY19jYXBzIG9yIG5hbmRfZWNjX3Byb3BzIHdvdWxkIGJl
IG1vcmUKPiBhcHByb3ByaWF0ZSBhcyBfY29uZiBzZWVtcyB0byBpbXBseSB5b3UgY2FuIGNoYW5n
ZSBpdCwgd2hpY2ggaXMgbm90Cj4gdGhlIGNhc2Ugd2hlbiB5b3UgdXNlIHRoaXMgc3RydWN0IHRv
IGV4cHJlc3MgY2hpcCByZXF1aXJlbWVudHMgb3Igd2hlbgo+IHlvdSB1c2UgYW4gb24tZGllIEVD
QyB3aGljaCBpcyBub3QgY29uZmlndXJhYmxlLgoKbmFuZF9lY2NfcHJvcHMgc291bmRzIGdvb2Qg
dG8gbWUhCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
