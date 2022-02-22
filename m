Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2697C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pun6IPLcQTrRLd/RzgbVT6cg/PHlvkJshJbS3H+nnHc=; b=enVsdCbRP0FCG2
	KsUMUpORlPXuPw+ZyHIpaVQMhbgZqAjBNokF9gtJi3+1qgJ1iLfsGrBtSi6VOgwLMcZp9aEEyKSUy
	WNxxVQCX/mEmXI43OAEJUOtezHVE+yzo23BZudausp1ErPnL8KHX26LaeSA1FkTBlKMdz0JRXCGOH
	0RQ53SV1vXU0pgLQQaic0yiIWgBW9yJtx4lXmUdBEnBoIhC4xPAdesUFKgUrxeqszok6JR+upmdTX
	d2PoKwz6cb9hpbQMH92zko2bNXNOs2z6yFu5JeiUuf1h9dYq55s8cd35YJ4VGYuJ2vs4Sl+6EXJwE
	XJlKawH5BoFCa0dqFwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMScU-0098bk-21; Tue, 22 Feb 2022 10:42:10 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMScO-0098YO-U2
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 10:42:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E7D8620005;
 Tue, 22 Feb 2022 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645526519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZ42NyxEmt0CuMFV9FTwX0iyn7TfTnG5TAcnR3dovOY=;
 b=UD0NyR3PvT/bfnygLpBlca2nq1ckk2Wl1M3RnfRasEc4I3tRtT0FG6zCl1mwz2V7F7FpLh
 rEznwqyLyNLhlXUh3OUVGS5pAGKQNxJscyrwy00RenzINt32cedmGINxVVnVW+v+PxzisF
 R/laSIk6r89x/dCSnrOS6eHJIJoy0j7sd6f0ibrVZa2NNWnhv7UygOlw2f//LGRfhvAZ47
 jk6YRJygS+WRA72swsPDiSQJzgsiEeUizoC1xkgIfxgFV0tISZiQPoOFc6d9pK53virVhM
 uT6fakSBrtHTmnPhKzps9xKJdLo1w8oKLR6+c62aAe21uo03HiYFKDgJmByu7Q==
Date: Tue, 22 Feb 2022 11:41:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 14/28] mtd: nand: mxic-ecc: Add Macronix external ECC
 engine support
Message-ID: <20220222114153.4dfaf0b8@xps13>
In-Reply-To: <CAMuHMdXJHAx4HptRRqfhe74mkfm+-oKp0qtd9Ns7Moh5omWehg@mail.gmail.com>
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
 <20211216111654.238086-15-miquel.raynal@bootlin.com>
 <CAMuHMdXJHAx4HptRRqfhe74mkfm+-oKp0qtd9Ns7Moh5omWehg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_024205_119314_164A348E 
X-CRM114-Status: GOOD (  19.77  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBUdWUsIDIyIEZlYiAyMDIy
IDExOjM5OjM0ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVGh1LCBEZWMgMTYsIDIwMjEg
YXQgMTI6NDggUE0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+IFNvbWUgU1BJLU5BTkQgY2hpcHMgZG8gbm90IHN1cHBvcnQgb24tZGllIEVDQy4g
Rm9yIHRoZXNlIGNoaXBzLAo+ID4gY29ycmVjdGlvbiBtdXN0IGFwcGx5IG9uIHRoZSBTUEkgY29u
dHJvbGxlciBlbmQuIEluIG9yZGVyIHRvIGF2b2lkCj4gPiBkb2luZyBhbGwgdGhlIGNhbGN1bGF0
aW9ucyBieSBzb2Z0d2FyZSwgTWFjcm9uaXggcHJvdmlkZXMgYSBzcGVjaWZpYwo+ID4gZW5naW5l
IHRoYXQgY2FuIG9mZmxvYWQgdGhlIGludGVuc2l2ZSB3b3JrLgo+ID4KPiA+IEFkZCBNYWNyb25p
eCBFQ0MgZW5naW5lIHN1cHBvcnQsIHRoaXMgZW5naW5lIGNhbiB3b3JrIGluIGNvbmp1bmN0aW9u
Cj4gPiB3aXRoIGEgU1BJIGNvbnRyb2xsZXIgYW5kIGEgcmF3IE5BTkQgY29udHJvbGxlciwgaXQg
Y2FuIGJlIHBpcGVsaW5lZAo+ID4gb3IgZXh0ZXJuYWwgYW5kIHN1cHBvcnRzIGxpbmVhciBhbmQg
c3luZHJvbWUgbGF5b3V0cy4KPiA+Cj4gPiBSaWdodCBub3cgdGhlIHNpbXBsZXN0IGNvbmZpZ3Vy
YXRpb24gaXMgc3VwcG9ydGVkOiBTUEkgY29udHJvbGxlcgo+ID4gZXh0ZXJuYWwgYW5kIGxpbmVh
ciBFQ0MgZW5naW5lLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+ICAKPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4g
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvS2NvbmZpZwo+ID4gQEAgLTQ2LDYgKzQ2LDEyIEBAIGNvbmZpZyBNVERfTkFORF9FQ0NfU1df
QkNICj4gPiAgICAgICAgICAgRUNDIGNvZGVzLiBUaGV5IGFyZSB1c2VkIHdpdGggTkFORCBkZXZp
Y2VzIHJlcXVpcmluZyBtb3JlIHRoYW4gMSBiaXQKPiA+ICAgICAgICAgICBvZiBlcnJvciBjb3Jy
ZWN0aW9uLgo+ID4KPiA+ICtjb25maWcgTVREX05BTkRfRUNDX01YSUMKPiA+ICsgICAgICAgYm9v
bCAiTWFjcm9uaXggZXh0ZXJuYWwgaGFyZHdhcmUgRUNDIGVuZ2luZSIKPiA+ICsgICAgICAgc2Vs
ZWN0IE1URF9OQU5EX0VDQwo+ID4gKyAgICAgICBoZWxwCj4gPiArICAgICAgICAgVGhpcyBlbmFi
bGVzIHN1cHBvcnQgZm9yIHRoZSBoYXJkd2FyZSBFQ0MgZW5naW5lIGZyb20gTWFjcm9uaXguICAK
PiAKPiBJIGd1ZXNzIHRoaXMgaXMgYSBsaWNlbnNhYmxlIElQIGNvcmUsIHdoaWNoIGNhbiBhcHBl
YXIgYW55d2hlcmUsIHNvCj4gd2UgZG9uJ3QgaGF2ZSBhIHByb3BlciBwbGF0Zm9ybSBkZXBlbmRl
bmN5IHRvIGFkZCBoZXJlPwoKWWVzLCBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgbGltaXRhdGlvbiBv
biB0aGF0IHNpZGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
