Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2BDC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 19:06:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA7120663
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 19:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WARhCiSX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA7120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/8yFI70JGAB0Rmmgb+E8xPCqMZNeF9fAwg1/VGtSAM=; b=WARhCiSXHfb2ko
	VV5FztGbDMVnMimjScTJ1/AvIitdeOjOg7yI1h+4Te8fXScFGaW/llKFfvNuStnmMQ1ByAAqvUVsl
	/wcNOl91vzFAu4Kwbqxtzxpsb0qnkq8FVXhMw1eywDESNyGShN9u0wIlielqiHjTwyU27Nek7yRgB
	IDcBiFzK9FRV4oMlxjJosVv6RkjAgshP7Fv5sA2iEaHnvtoC421SWG+g1X/hnhuYdiFQgjNDNRZBu
	Nj9JIV8gRvyKQZkz3XRr+IKVRMsI3j/0iI8Fd3fNdQ12tvIZYiOJhtIzgGbmUBK0eHBMRGNTehNzh
	BZtu2q6pTL/mCU+u+B9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0sua-0004cn-Nh; Mon, 04 Mar 2019 19:06:04 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0suY-0004cP-9A
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 19:06:04 +0000
Received: from xps13 (76.15.136.77.rev.sfr.net [77.136.15.76])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 77901200006;
 Mon,  4 Mar 2019 19:05:48 +0000 (UTC)
Date: Mon, 4 Mar 2019 20:04:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 6/9] mtd: rawnand: ingenic: Separate top-level and
 SoC specific code
Message-ID: <20190304200129.4eefabba@xps13>
In-Reply-To: <1551723968.4932.4@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-6-paul@crapouillou.net>
 <20190304112058.67cd5194@xps13> <1551723968.4932.4@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_110602_469974_8109D2E0 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBN
b24sIDA0IE1hciAyMDE5IDE5OjI2OjA4CiswMTAwOgoKPiBPbiBNb24sIE1hciA0LCAyMDE5IGF0
IDExOjIwIEFNLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiA+IEhpIFBhdWwsCj4gPiAKPiA+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3Uu
bmV0IDxtYWlsdG86cGF1bEBjcmFwb3VpbGxvdS5uZXQ+PiA+IHdyb3RlIG9uIFNhdCwgIDkgRmVi
IDIwMTkgMTY6MjM6MDIKPiA+IC0wMzAwOgo+ID4gICAKPiA+PiAgVGhlIGluZ2VuaWMtbmFuZCBk
cml2ZXIgdXNlcyBhbiBBUEkgcHJvdmlkZWQgYnkgdGhlIGp6NDc4MC1iY2ggPj4gZHJpdmVyLgo+
ID4+ICBUaGlzIG1ha2VzIGl0IGRpZmZpY3VsdCB0byBzdXBwb3J0IG90aGVyIFNvQ3MgaW4gdGhl
IGp6NDc4MC1iY2ggPj4gZHJpdmVyLgo+ID4+ICBUbyB3b3JrIGFyb3VuZCB0aGlzLCB3ZSBzZXBh
cmF0ZSB0aGUgQVBJIGZ1bmN0aW9ucyBmcm9tIHRoZSA+PiBTb0Mtc3BlY2lmaWMKPiA+PiAgY29k
ZSwgc28gdGhhdCB0aGVzZSBBUEkgZnVuY3Rpb25zIGFyZSBTb0MtYWdub3N0aWMuICAKPiA+PiA+
ICAgCj4gPiBJIGxpa2UgdGhlIGlkZWEsIGFjdHVhbGx5IEkgYW0gd29ya2luZyBvbiB0aGlzIHNl
cGFyYXRpb24gKHNlZQo+ID4gWzFdKSBhbmQgSSB3b3VsZCByZWFsbHkgYXBwcmVjaWF0ZSB0aGF0
IHlvdSB0cnkgdG8gaW1wbGVtZW50IHRoZQo+ID4gaW50ZXJmYWNlIHdoZW4gaXQgd2lsbCBiZSBh
dmFpbGFibGUgKHYyIGlzIGNvbWluZyB0aGlzIHdlZWssIEkgdGhpbmsgPiB2Mwo+ID4gd2lsbCBi
ZSB0aGUgb25lIHRvIHRlc3Qgd2hlbiByYXcgTkFORCBkZXZpY2VzIHdpbGwgYmUgcHJvcGVybHkK
PiA+IHN1cHBvcnRlZCkuIEkgd2lsbCBhZGQgeW91IGluIENjOiBpZiB5b3Ugd2FudCB0byBmb2xs
b3cvcmV2aWV3Lgo+ID4gCj4gPiBbMV0gPiA8aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlw
ZXJtYWlsL2xpbnV4LW10ZC8yMDE5LUZlYnJ1YXJ5LzA4NzgxNS5odG1sCj4gPiAgCj4gCj4gRG8g
eW91IHRoaW5rIHRoaXMgd2lsbCBiZSByZWFkeSBmb3IgNS4yPwoKTWF5YmUsIGJ1dCBJIGNhbid0
IHRlbGwgZm9yIHN1cmUuIEl0IHdpbGwgZGVwZW5kIG9uIGhvdyBpbnZhc2l2ZSB0aGUKcmF3IE5B
TkQgY29udmVyc2lvbiBpcy4gSSBkb24ndCB3YW50IHRvIGRlbGF5IHlvdXIgd29yayBidXQgbWF5
YmUgb25jZQp0aGUgaW50ZXJmYWNlIHdpbGwgYmUgcmVhZHkgdG8gYmUgaW1wbGVtZW50ZWQgaXQg
d291bGQgYmUgYSBncmVhdApvcHBvcnR1bml0eSB0byBkbyBpdCB3aXRoIHRoZSBJbmdlbmljIGRy
aXZlci4KCj4gCj4gWW91IGNhbiBhZGQgbWUgaW4gQ2M6LgoKVGhhbmtzIQpNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
