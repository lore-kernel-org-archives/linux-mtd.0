Return-Path: <SRS0=afzE=YB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823BBC10F14
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 15:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57059205C9
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 15:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YI2MGWBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57059205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjYGwuTs2LKXkBfGQKvlz+CFlRHLnPhrgZMgDcEq+Ys=; b=YI2MGWBWj9Vheq
	/35hufZMLyxcPatNZginbQbqmLf4F6jApE5oX7seaNWX800Jg0KaLIdHsbU9WuxuFtZb/W4askn9B
	8eCERt1DKW6W+Yb4/A1DPj0ssu/ao2P0T4z4AUP/bTImmoCvh6M0W+g4FICi/15NvdcrRt41t9x/3
	ADgoHB9+bq/6dYYG9APQi/fGBZzYg316yD26j/jyum1MIckasPAeaf21bFqrtvzida9H1RhwQarb2
	vmtP9bDa7NRyVBkqaURDM6RpfNC04F4hOpzw9pamDHrzRUxanipbSWW7iYHpGhRjlzdybXjhEDI03
	4gMGogcGNnLs6LrGCa0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHr17-0007yf-0r; Tue, 08 Oct 2019 15:03:13 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHr0x-0007nJ-3C
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2019 15:03:05 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DB95C24000F;
 Tue,  8 Oct 2019 15:02:50 +0000 (UTC)
Date: Tue, 8 Oct 2019 17:02:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block
 Protection function
Message-ID: <20191008170249.06bd45ce@xps13>
In-Reply-To: <OFEDE76FEE.8BC48D9E-ON4825848D.000BCC94-4825848D.000E0643@mxic.com.tw>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
 <1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
 <20191007104511.5aa7b8f2@xps13> <20191007112442.783e4fbe@xps13>
 <OFEDE76FEE.8BC48D9E-ON4825848D.000BCC94-4825848D.000E0643@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_080303_268281_FFDCB186 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org, richard@nod.at, tglx@linutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBUdWUsIDggT2N0IDIw
MTkgMTA6MzM6MTEgKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiA+ID4gICAKPiA+ID4gPiBNYWNy
b25peCBBQyBzZXJpZXMgc3VwcG9ydCB1c2luZyBTRVQvR0VUX0ZFQVRVUkVTIHRvIGNoYW5nZQo+
ID4gPiA+IEJsb2NrIFByb3RlY3Rpb24gYW5kIFVucHJvdGVjdGlvbi4KPiA+ID4gPiAKPiA+ID4g
PiBNVEQgZGVmYXVsdCBfbG9jay9fdW5sb2NrIGZ1bmN0aW9uIHJlcGxhY2VtZW50IGJ5IG1hbnVm
YWN0dXJlcgo+ID4gPiA+IHBvc3Rwb25lZCBpbml0aWFsaXphdGlvbi4gICAKPiA+ID4gCj4gPiA+
IFdoeSB3b3VsZCB3ZSBkbyB0aGF0Pwo+ID4gPiAKPiA+ID4gQW55d2F5IHlvdXIgc29sdXRpb24g
bG9va3Mgb3ZlcmtpbGwsIGlmIHdlIGV2ZXIgZGVjaWRlIHRvCj4gPiA+IGltcGxlbWVudCB0aGVz
ZSBob29rcyBmb3IgcmF3IG5hbmQsIGl0IGlzIGJldHRlciBqdXN0IHRvIG5vdAo+ID4gPiBvdmVy
d3JpdGUgdGhlbSBpbiBuYW5kX3NjYW5fdGFpbCgpIGlmIHRoZXkgaGF2ZSBiZWVuIGZpbGxlZAo+
ID4gPiBwcmV2aW91c2x5IChpZS4gYnkgdGhlIG1hbnVmYWN0dXJlciBjb2RlKS4gIAo+ID4gCj4g
PiBBY3R1YWxseSB5b3Ugc2hvdWxkIGFkZCB0d28gTkFORCBob29rcyB0aGF0IGRvIHRoZSBpbnRl
cmZhY2Ugd2l0aCB0aGUKPiA+IE1URCBob29rcy4gSW4gdGhlIE5BTkQgaG9va3MsIGNoZWNrIHRo
YXQgdGhlIHJlcXVlc3QgaXMgdG8gbG9jayBhbGwgdGhlCj4gPiBkZXZpY2UsIG90aGVyd2lzZSBy
ZXR1cm4gLUVOT1RTVVBQLiAgCj4gCj4gc29ycnksIGNhbid0IGdldCB5b3VyIHBvaW50Lgo+IAo+
IEJlY2F1c2UgdGhlIE5BTkQgZW50aXJlIGNoaXAgd2lsbCBiZSBwcm90ZWN0ZWQgaWYgUFQocHJv
dGVjdGlvbikgcGluIAo+IGlzIGFjdGl2ZSBoaWdoIGF0IHBvd2VyLW9uLgoKSW4geW91ciBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgbG9ja2luZywgeW91IHNob3VsZCBjaGVjayB0aGF0IHRoZQpsb2Nr
aW5nIHJlcXVlc3QgaXMgb3ZlciB0aGUgZW50aXJlIGRldmljZSwgdW5sZXNzIHlvdSBjYW4gbG9j
ayBhCnNtYWxsZXIgcG9ydGlvbiBvZiBjb3Vyc2UuCgo+IAo+ID4gCj4gPiBUaGVuIGZpbGwtaW4g
dGhlc2UgdHdvIGhvb2tzIGZyb20gdGhlIG1hbnVmYWN0dXJlciBjb2RlLCB3aXRob3V0IHRoZQo+
ID4gcG9zdHBvbmVkIGluaXQuCj4gPiAgIAo+IAo+IEJ1dCBpbiB0aGUgZmluYWwgb2YgbmFuZF9z
Y2FuX3RhaWwoKSwgbXRkLT5fbG9jay9fdW5sb2NrIHdpbGwgYmUKPiBmaWxsZWQgYnkgTlVMTCwg
cmlnaHQgPwoKVGhlIE5BTkQgY29yZSBzaG91bGQgc2V0IG10ZC0+X2xvY2svX3VubG9jaygpIHRv
IE5BTkQgc3BlY2lmaWMgaG9va3Mgc28KdGhhdCB0aGUgTVREIGxheWVyIGlzIGFic3RyYWN0ZWQg
YW5kIGFuZCBkcml2ZXJzIGRvIG5vdCBzZWUgaXQuIFRoZW4sCmluIHRoZSBOQU5EIGhlbHBlciwg
ZWl0aGVyIHRoZXJlIGlzIG5vIHNwZWNpZmljIGhvb2sgZGVmaW5lZCBieSBhCm1hbnVmYWN0dXJl
ciBkcml2ZXIgYW5kIHlvdSByZXR1cm4gLUVOT1RTVVBQLCBvciB5b3UgZXhlY3V0ZSB0aGUKZGVm
aW5lZCBob29rLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
