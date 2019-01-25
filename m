Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEB2C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF7B218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJlL6gqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF7B218D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cu0BlrD9CfM+b/5fWaG/UWyiJ9OoRnhG0TMSgLlrDas=; b=KJlL6gqg2I2gb/
	UcNKovmc75GeMtyGdGKfETsFy7M0EUU8QBFmfoYSThz1bknFfV7N8HJyBJFpd065NoOlYJUUS+uh7
	5Z965QeQdnawxgX7sjla1J+FHWoN4y3wl2xtfc7+m1ROxtsn8awg+56qrWfwcwWSZikDpt12DqcBN
	FrjH/8J/gS5yH+44cB1v7hZX9vmLfJSo10NZAvoeOTNP1X73ionw/5u3M9o0yB+RlvCmbGJwtP8UP
	+pcKSuDZllxMKj37atosIt+StoUWw4hLBr5C2Tjs64+U3pLOAAo4MfG7Ll1ArQ3LtjgNsh+Atck/y
	kmviYETYb8QjGZbWLO/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1LS-0007rV-EY; Fri, 25 Jan 2019 13:16:30 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1LM-0007r4-Gk
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:16:28 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 17A6920A12; Fri, 25 Jan 2019 14:16:23 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id D603420798;
 Fri, 25 Jan 2019 14:16:12 +0100 (CET)
Date: Fri, 25 Jan 2019 14:16:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v3] mtd: spinand: Add support for GigaDevice GD5F1GQ4UExxG
Message-ID: <20190125141612.22b483c2@xps13>
In-Reply-To: <20190124154346.18033-1-sr@denx.de>
References: <20190124154346.18033-1-sr@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_051626_063409_C32B0DCB 
X-CRM114-Status: UNSURE (   8.65  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU3RlZmFuLAoKU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPiB3cm90ZSBvbiBUaHUsIDI0IEph
biAyMDE5IDE2OjQzOjQ2ICswMTAwOgoKPiBBZGQgc3VwcG9ydCBmb3IgR2lnYURldmljZSBHRDVG
MUdRNFVFeHhHIFNQSSBOQU5EIGNoaXAuIFRlc3RlZCB3aXRoIHRoZQo+ICdVJyAoMy4zVikgdmVy
c2lvbiwgR0Q1RjFHUTRVRXh4RyBidXQgc2hvdWxkIGFsc28gd29yayBqdXN0IGZpbmUgd2l0aAo+
IHRoZSAnUicgKDEuOFYpIHZlcnNpb24gYXMgd2VsbC4gVG8gc3VwcG9ydCB0aGlzIDEuOFYgY2hp
cHMgdmVyc2lvbiwKPiBhIG5ldyBlbnRyeSBpbiB0aGUgZ2lnYWRldmljZV9zcGluYW5kX3RhYmxl
IHdpdGggdGhlIGRldmljZSBJRCBvZiB0aGlzCj4gY2hpcCAoMHhjMSkgc2hvdWxkIGJlIHN1ZmZp
Y2llbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPgo+IFJl
dmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4KPiBDYzog
Q2h1YW5ob25nIEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT4KPiBDYzogRnJpZWRlciBTY2hyZW1w
ZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25A
a2VybmVsLm9yZz4KPiAtLS0KClRoYW5rcyBmb3IgdGhlIHdvcmssIGFwcGxpZWQgdG8gbmFuZC9u
ZXh0LiBMZXQgbWUga25vdyBpZiB5b3UgZmluZAphbnl0aGluZyBlbHNlIHN0cmFuZ2UuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
