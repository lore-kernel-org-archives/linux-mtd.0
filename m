Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E696C433E2
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 10:09:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4968D206A5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 10:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EcbYRFAN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PabTpu+m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4968D206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EZb3PsX+fh8HRR0B0OsNA9ErHRX8/kQghNXzp2jurOw=; b=EcbYRFANg+dAEY6Z4tSbI92jT
	Wu5gEwjwFlkr675ZS+ssVk7kcK4hHwSgUUIJzcfvI+lN1xr8e1Ldk55SVMRp4V+Lvb4xvz/QbVaBN
	tvwEoPDQUdJJQvvQXDTrWyeb62u6woP4Ovhdmbt512NuHJ1s6PCLWxrZSYK7JHYuifz8Nnt1y69Yo
	uuKhex7XBO6otsgz+kxHC+ynYGI49EiDEOXYiHkv0QXPSGJR1gfbmmhYqeXtBvhU2cuVtADSIfKpm
	9ZMIwoLiFU/I9pZMOufYZhotE/7Z5I014FoIEBwCcJD2Q7LDsktcLjSdAlq3Cop/vjmjmbKnr0Zm+
	fuWkVyngQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD3Dg-0003pS-TN; Tue, 01 Sep 2020 10:08:52 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD3De-0003os-H7
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2020 10:08:51 +0000
Received: by mail-il1-x141.google.com with SMTP id c6so643124ilo.13
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2020 03:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/VJjjchCtjabDLsqV0TwJQW+I0UeUO6WBqn4dSyvXv4=;
 b=PabTpu+m1tvjJ2AhUaZoFMJ0/1nCU1a81ap7MXYolzu67F9i6GsJ0ITYceocpOVFcj
 /MQgtlblfNv4oSr6hgdpKAtN9m6dP3N39y8+AS/d3qUocWNylSdaKcwe0pBJKnAxxmer
 7qIsEl3jggqNB9gO92Qt+GchhsTdnSGjHoKOI1PFm3pmg18FMFiUDcCFWcYdltyk6sch
 hkeB5xcKfj4gR31GZha29WvHHfXsVe5S92YbLQSm2z/EDDxqVcM7fMV5mYj3hG40oeLK
 6eTNVmENY8R3pbBjDOf7xGvw9VeAwpknwEqsGuBkTC7SeHncCavdfR60L//F3AzQ9wn8
 ZT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/VJjjchCtjabDLsqV0TwJQW+I0UeUO6WBqn4dSyvXv4=;
 b=B8nykFrKxiyUvdCvB7Gv7QKQVsCo+6dAuIVc/3ZfgozHP42W8saNZAEGvyOWKtBa/g
 ZWaYe5fv7sKUfMccyphm6GIf093a05xJ5bktGySjnUxMHAW8etwEV36/GF8xuzKbWah9
 lCCiAXMyaMIenQ06oZQTubvq88IuXbPoySCIyie0/zy72YqsB4xg2+0Vr7f4/emSDfJQ
 H7nn50EMR+yNRiYsDbhdFCM3SuULc+L9cBxeKKwCl7uQ6nmsO34kMAwrPUPoKlRlMf1F
 TGG/zPXUs6On6VGRWEVV0Dm0uygiH7/bGyu25A+1mTYK2Rc96NL1d59dyBc7SuGaOK5p
 bi6Q==
X-Gm-Message-State: AOAM5331+NaWbL7QBQsxRAzVCwK3z38nmRh/i9BumA1HIZclImDrJjG4
 RW3+n4sVdUTUUUEjIvo8aSD48gumsE8KQtLXkA==
X-Google-Smtp-Source: ABdhPJyL+vhLasLa2CZlBPrVvDLOSmhG1DBCMevdHSFAEI9v+HDIxxl7HfK0RYeB81kStxLFT8MPJ7jcVcvHZOY1e4U=
X-Received: by 2002:a05:6e02:f4e:: with SMTP id
 y14mr649290ilj.255.1598954928743; 
 Tue, 01 Sep 2020 03:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <20200901094816.ddw2do2ryjvqvasq@ti.com>
In-Reply-To: <20200901094816.ddw2do2ryjvqvasq@ti.com>
From: =?UTF-8?Q?Matthias_Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Date: Tue, 1 Sep 2020 12:08:36 +0200
Message-ID: <CAO8h3eF_XQZBAP2szOu2oHv=DxznSo-2bDEOsthsJk+MP1s6ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_060850_761690_444D7C06 
X-CRM114-Status: GOOD (  23.63  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com,
 Yicong Yang <yangyicong@hisilicon.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gRGkuLCAxLiBTZXB0LiAyMDIwIHVtIDExOjQ4IFVociBzY2hyaWViIFByYXR5dXNoIFlhZGF2
IDxwLnlhZGF2QHRpLmNvbT46Cj4gT24gMDEvMDkvMjAgMDg6MTZBTSwgTWF0dGhpYXMgV2Vpw59l
ciB3cm90ZToKPiA+IEFtIERpLiwgMTYuIEp1bmkgMjAyMCB1bSAxNTowMyBVaHIgc2NocmllYiBZ
aWNvbmcgWWFuZwo+ID4gPHlhbmd5aWNvbmdAaGlzaWxpY29uLmNvbT46Cj4gPiA+IElmIHRoZSBm
bGFzaCdzIHF1YWQgbW9kZSBpcyBlbmFibGVkLCBpdCdsbCByZW1haW4gaW4gdGhlIHF1YWQgbW9k
ZSB3aGVuCj4gPiA+IGl0J3MgcmVtb3ZlZC4gSWYgd2UgZHJpdmUgdGhlIGZsYXNoIG5leHQgdGlt
ZSBpbiBTUEkvRHVhbCBtb2RlLCB0aGVuCj4gPiA+IHByb2JsZW0gb2NjdXJzIGFzIHRoZSBmbGFz
aCdzIHF1YWQgZW5hYmxlIGJpdCBpcyBub3QgY2xlYXJlZC4KPiA+Cj4gPiBPbiBmbGFzaCBkZXZp
Y2VzIHdpdGggYSBub24tdm9sYXRpbGUgcXVhZCBlbmFibGUgYml0ICh3ZSB1c2UgUzI1Rkw1MTJT
KQo+ID4gdGhpcyB3aWxsIHdlYXIgb3V0IHRoZSBxdWFkIGVuYWJsZSBiaXQgYXMgb24gZXZlcnkg
Ym9vdCB0aGUgYml0IGlzCj4gPiBzZXQgYW5kIHJlc2V0IG9uIHNodXRkb3duLiBPciBkbyBJIG1p
c3Mgc29tZXRoaW5nIGhlcmU/Cj4KPiBZZXMsIEkgdGhpbmsgaXQgd2lsbC4gSWYgeW91IGFsd2F5
cyB3YW50IHRoZSBiaXQgZW5hYmxlZCAoYW5kIGl0IGJlaW5nCj4gbm9uLXZvbGF0aWxlIHN1Z2dl
c3RzIHRoYXQgaXMgdGhlIGludGVuZGVkIHVzZSksIHdoeSBub3Qgc2V0Cj4gbm9yLT5wYXJhbXMt
PnF1YWRfZW5hYmxlKCkgdG8gTlVMTD8gVGhhdCB3YXkgaXQgd29uJ3QgYmUgdG91Y2hlZCBhdCBh
bGwsCj4gbmVpdGhlciBvbiBib290IG5vciBvbiBzaHV0ZG93bi4KCkJlY2F1c2Ugd2Ugd2FudCB0
byB1c2UgcGxhaW4gbWFpbmxpbmUga2VybmVsIHdpdGhvdXQgYW55IGxvY2FsIHBhdGNoZXMuCgo+
ID4gPiBEaXNhYmxlIHRoZSBxdWFkIG1vZGUgaW4gc3BpX25vcl9yZXN0b3JlKCksIHRoZSBmbGFz
aCB3aWxsIGxlYXZlCj4gPiA+IHF1YWQgbW9kZSB3aGVuIHJlbW92ZS4gVGhpcyB3aWxsIG1ha2Ug
c3VyZSB0aGUgZmxhc2ggYWx3YXlzIGVudGVyIHRoZQo+ID4gPiBjb3JyZWN0IG1vZGUgd2hlbiBs
b2FkZWQuCj4gPgo+ID4gV2UgaGF2ZSBhIHN5c3RlbSB3aGljaCByZWxpZXMgb24gYW4gZW5hYmxl
ZCBxdWFkIG1vZGUgb24gYm9vdAo+ID4gKGJvb3Rsb2FkZXIgdXNlcyBxdWFkIG1vZGUgd2l0aG91
dCBlbmFibGluZyBpdCkgc28gdXNpbmcgdGhpcyBwYXRjaAo+ID4gd2lsbCBwcmV2ZW50IG91ciBk
ZXZpY2UgZnJvbSBib290aW5nLgo+Cj4gT3V0IG9mIGN1cmlvc2l0eSwgaG93IGRvZXMgdGhlIGZs
YXNoIGdldCBkZXRlY3RlZCBieSBTUEkgTk9SPyBJdCBpc3N1ZXMKPiB0aGUgUmVhZCBJRCBjb21t
YW5kIGluIDFTLTFTLTFTIG1vZGUgYnV0IHRoZSBmbGFzaCBpcyBleHBlY3RpbmcgMVMtNFMtNFMK
PiBjb21tYW5kcy4gRG8geW91IGhhdmUgYW55IGV4dHJhIHBhdGNoZXMgYXBwbGllZCB0byBtYWtl
IGl0IHdvcms/CgpUaGUgUkRJRCBjb21tYW5kICgweDlGKSBpcyBhbHdheXMgYSAxUy0xUy0xUyBj
b21tYW5kIHJlZ2FyZGxlc3Mgb2YgdGhlClFFIGJpdCBzdGF0ZSBhcyBlLmcuIHRoZSBSRUFEIGNv
bW1hbmQgKDB4MDMpLiBUaGUgb25seSByZWFzb24gZm9yIHRoZSBRRQpiaXQgaXMgdGhhdCBpdCBy
ZW1hcHMgdGhlIHVzYWdlIG9mIHRoZSAhV1AgYW5kICFIT0xEIHNpZ25hbHMgdG8gSU8yIGFuZCBJ
TzMuCgpUaGUgU1BJIGNvbnRyb2xsZXIgKFFTUEkgb24gaW14NiBpbiBvdXIgY2FzZSkgaGF2ZSB0
byBiZSBwcm9ncmFtbWVkCmFjY29yZGluZ2x5IHRvIGV4ZWN1dGUgdGhlIFJESUQgY29tbWFuZCBp
biAxUy0xUy0xUyBtb2RlIGJ1dCB0aGVuIHRoZQpzdGF0ZSBvZiB0aGUgUUUgYml0IGRvZXNuJ3Qg
bWF0dGVyLgoKPiBJIHRyaWVkIHNvbHZpbmcgdGhpcyBwcm9ibGVtIGZvciA4RC04RC04RCBtb2Rl
IGJ1dCBuZXZlciByZWFsbHkgZm91bmQgYQo+IGdvb2Qgc29sdXRpb24uCgpJIGRvbid0IGtub3cg
eW91ciBoYXJkd2FyZSBidXQgSSBhbSBzdXJlIHRoYXQgc2hvdWxkIHdvcmsgdGhhdCB3YXkgdG8u
CgpUaGUgY3VycmVudCB3YXkgaXQgaXMgZG9uZSBpbiB5b3VyIHBhdGNoIG1heSB3ZWFyIG91dCB0
aGUgUUUgYml0IChhbmQKbWF5YmUgb3RoZXJzIGluIHN0YXR1cy9jb25maWd1cmF0aW9uIHJlZ2lz
dGVyKSBxdWl0ZSBxdWlja2x5IGlmIHlvdQpoYXZlIGEgZGV2aWNlIHdoaWNoIGlzIGJvb3RlZCBm
cmVxdWVudGx5LgoKUmVnYXJkcywKTWF0dGhpYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
