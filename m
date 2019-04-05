Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492AAC4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BEFC217D7
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JsP0uC0D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ngzjZTV4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BEFC217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6JcZSbH3RcgcGn30DVU8wvMrHpVP2W0gUS8iRM/k/M=; b=JsP0uC0DxPsRvw
	cW1Xms4ZISkgVt6DAt3vetqRL29LWYIs8yyN7aPCWgY28VmxmVAkN3msy50+tYd+aWrLE41mTdpwa
	sVeqe0dIFDuW3hICD0BJCy0taWLdmwTiSbYePK20SiT+6HECJU+u5XO/PwTIVTHm2XBNxBcj4AOsk
	p0n8nbOdGfJlIpSLVMBABE3KaUQ2z/ZWFMy18VANU6NLqzowSqtzdhUaqhzQLNgqlIXgGJk+0e20O
	MagrwTwswkCPWSkFV7Cghlttu7he7ScEEyrtSp3mkCor91zb8Q0KU9QrW2VM07ewqBpzPhfIauca7
	3SbUdEQH5Oet1E4ZQfxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCM0I-0000s4-BY; Fri, 05 Apr 2019 10:23:22 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCM0G-0000rw-MS
 for linux-mtd@bombadil.infradead.org; Fri, 05 Apr 2019 10:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Mime-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=idegsciNuwyIubnKxCclGw1G/yFXF0xE7RFgDTMecVw=; b=ngzjZTV4nQ3N/gbgrTxZHDWJ90
 ZEPD4AJKeOfNdMMxxvYoyE/4iBfinq1lpvde77wV+3pEZAbBpfRjwU4Mq5y48Zc0QxZZcpOLeTpdQ
 a23cuduLUWHpv8flLBwF+VxfoG9S2FkqQnqvlHXKu5/EKp9sCByvcaO7d4c4F5FMLtD2GQslaIu+U
 NRMv1qSyvSfYuHjPToJKE2dWnaL7c3r/OXnUD2Q55r8INHQwuHdS35nGbvwDvQlL8s3HL+0KNB9An
 FSEx09BemvOmNn8e9RKTNuJniMqzpW+OMZP8tAccOnaykIGPXEPYydJr8ltnq75jgSWsjdVYzXzE/
 DKtB0OGQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCM0D-0008Jm-6t
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:23:19 +0000
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hCM0B-0002Xj-VF; Fri, 05 Apr 2019 12:23:15 +0200
Message-ID: <1554459795.2748.12.camel@pengutronix.de>
Subject: Re: [PATCH 09/10] mtd: rawnand: gpmi: use runtime PM to manage clocks
From: Lucas Stach <l.stach@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Date: Fri, 05 Apr 2019 12:23:15 +0200
In-Reply-To: <20190405100740.5074-10-s.hauer@pengutronix.de>
References: <20190405100740.5074-1-s.hauer@pengutronix.de>
 <20190405100740.5074-10-s.hauer@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_112317_602579_1103A7AB 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gRnJlaXRhZywgZGVuIDA1LjA0LjIwMTksIDEyOjA3ICswMjAwIHNjaHJpZWIgU2FzY2hhIEhh
dWVyOgo+IFRoZSBncG1pIGRyaXZlciBhZ2dyZXNzaXZlbHkgZW4vZGlzYWJsZXMgdGhlIGNsb2Nr
cyBiZXR3ZWVuIG9wZXJhdGlvbnMKPiB3aGljaCBoYXMgc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2Ug
Y29zdC4gVXNlIHJ1bnRpbWUgUE0gdG8gZ2V0IHJpZCBvZgo+IHRoaXMgYm90dGxlbmVjay4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4g
LS0tClsuLi5dCj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZ3BtaV9ydW50aW1lX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRo
aXMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCj4gKwlwcmludGsoIiVzXG4iLCBfX2Z1bmNf
Xyk7Cj4gKwo+ICsJcmV0dXJuIF9fZ3BtaV9lbmFibGVfY2xrKHRoaXMsIGZhbHNlKTsKPiArfQo+
ICsKPiArc3RhdGljIGludCBfX21heWJlX3VudXNlZCBncG1pX3J1bnRpbWVfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKPiArewo+ICsJc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+ICsJcHJpbnRrKCIlc1xuIiwgX19mdW5jX18pOwoKTGVm
dG92ZXIgZGVidWdnaW5nIGluIGJvdGggZnVuY3Rpb25zLgoKUmVnYXJkcywKTHVjYXMKCj4gKwo+
ICsJcmV0dXJuIF9fZ3BtaV9lbmFibGVfY2xrKHRoaXMsIHRydWUpOwo+ICt9Cj4gKwo+IMKgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGdwbWlfcG1fb3BzID0gewo+IMKgCVNFVF9TWVNU
RU1fU0xFRVBfUE1fT1BTKGdwbWlfcG1fc3VzcGVuZCwgZ3BtaV9wbV9yZXN1bWUpCj4gKwlTRVRf
UlVOVElNRV9QTV9PUFMoZ3BtaV9ydW50aW1lX3N1c3BlbmQsIGdwbWlfcnVudGltZV9yZXN1bWUs
IE5VTEwpCj4gwqB9Owo+IMKgCj4gwqBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBncG1p
X25hbmRfZHJpdmVyID0gewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
