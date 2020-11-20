Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0555C71156
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DDEF22244
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aDfHcE12"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DDEF22244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwH72CBzQ6yhdSl0y5hULyJo+7W3AVDEuUYNv2SylXo=; b=aDfHcE12xbmQ8BLbY59VrwGNNP
	1l8MJzaU1n/LXJS7QRO3+IqGZsnNvV5/doRbBPbsMP4ZVKqWJEOqIZQhHQterIo2sMjSYPLGiLWjL
	ResceGwqvqG/zOwV4uVgNj5MwKxPPjU7WJa86mYfmoPKQR6/1kmlLumJgf42HnZgti027vesZH72l
	zb8P46VNpWhYYtulegF2sS6OS6RtRFbwdMb1CPFH6NWNRpmdSBKBpvzBEqUdXl3hs/NaTLRHSFlqE
	juzcqDKc7wLLaaYDnhiB75r1rnk4GsJiu0nqPax2TqXCQB37ogqbUuARnLme1IcqS6S1mJau2+tJP
	bQslIfKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg4YK-0000T7-U4; Fri, 20 Nov 2020 11:26:09 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg4YE-0000R4-UL
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 11:26:07 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D093160004;
 Fri, 20 Nov 2020 11:25:56 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:25:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: orion: Allow compile testing
Message-ID: <20201120122555.6503d579@xps13>
In-Reply-To: <20201119210603.24128-1-miquel.raynal@bootlin.com>
References: <20201113124058.333-1-miquel.raynal@bootlin.com>
 <20201119210603.24128-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_062603_083513_5D1E3A78 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFRodSwg
MTkgTm92IDIwMjAKMjI6MDY6MDIgKzAxMDA6Cgo+IE9uIEZyaSwgMjAyMC0xMS0xMyBhdCAxMjo0
MDo1OCBVVEMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBUaGVyZSBpcyBub3RoaW5nIHByZXZl
bnRpbmcgY29tcGlsZSB0ZXN0aW5nIGluIHRoaXMgZHJpdmVyIHNvIGVuYWJsZQo+ID4gaXQuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+ICAKPiAKPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LgoKVW5mb3J0dW5hdGVseSBp
dCBkb2VzdCBub3Qgd29yayBvbiB4ODYgYmVjYXVzZSBvZiBhIHJlYWRzbCgpLiBJJ2xsIGRyb3AK
aXQgb2ZmIGZyb20gbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
