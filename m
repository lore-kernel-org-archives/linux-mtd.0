Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25725C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xkN8+RBaEd+hNw/IpCZRIghKuIn1ekGpP9NExykS14=; b=vx5eRm9WEQbMPW
	HUV3NoBI/8ZaXduYJqO8fZ9qS3XKegeadoLtv96klG2IQpRbFWUTAO1bsEJwC9K5nMpw4+Dk1Cjse
	BH5Wlp0QNIzxvWPv4uGUbzj/g2mYiv887a5ayQubAuKWQEy3YYTPNZRSWzLbZy5lYwAS4gQnkS41T
	epSOeydlD2EE7VJ+2PdwbdBBW+9ZHD6cPa3p8XCNF5LaOmpgs3fI05DZHbqP2VNMcGjPaBKdCS/K4
	1TJKcwuhPzBv5cbRQWS+0GRWIRqHwctHycvPlwRQ7td7yi41ZBYxBEF+xnEk+uNGT2CZ7Ozx/Wenb
	yWnc8nicve+KWMxqpqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6w7a-00BwSR-8U; Mon, 10 Jan 2022 14:58:06 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6w7X-00BwRD-Fm
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 14:58:04 +0000
Received: by mail-ua1-f49.google.com with SMTP id u6so23990807uaq.0
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2022 06:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nQ0DI57ualMZ8LS2UY8GJ0ajhnsMyRrkv/BkBWheED4=;
 b=JaHvdyyoqpj86XmVXA40B6B+uBNsrQBWorzSIPV3ACfP1KL5QHL8EB77ftD2pH/hsm
 Hm4y9PJYg3SUkCVEKXooyYtdyXStrvm/AVXShAsLGHc07ZfJh2bK2Pw+EEPLwPA9OtMB
 SeGHpqFqu1IQavhuOhLREKUdIOHP4vXMYVAayX8DaliBxcb7Qr3KOZJM8ajM4xMNs10W
 eTvHzZm1Skvk+d/mgUsgyihoVsvzsrhrRgTw/OLaHKj1FzwWPNpBCosj1sdrlKX848Bt
 RdGhBqOGbAvo8aEWnebLP0WLJyFDkx6bVHj9t9hPvCdu8mzbzOr9Qux1zgfq2GsSRBqm
 w7pQ==
X-Gm-Message-State: AOAM531gWYVBHqC0N/ZUkp26FX3aUhFakH8GxVdXsFXZaoG9jy/fDNtn
 4W4jF7ymn8zzg4g3HW+YxLfuVjZmOSOZBQ==
X-Google-Smtp-Source: ABdhPJzZxleVFn+NPbyrDpEPnrEXv48X53ebXoDvibgqBcLItqH0/AyxWRkBBs6XXMeK4RvHozmlDw==
X-Received: by 2002:a9f:386f:: with SMTP id q44mr18819uad.120.1641826681745;
 Mon, 10 Jan 2022 06:58:01 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id d4sm3873720vkf.39.2022.01.10.06.58.00
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 06:58:01 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id y4so23943890uad.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2022 06:58:00 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr26275304vsg.57.1641826680808; 
 Mon, 10 Jan 2022 06:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
 <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
 <20220110154107.1744c5ea@xps13>
In-Reply-To: <20220110154107.1744c5ea@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 15:57:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgAnfLTkbb7GP2BZMAOtwBkjn9Knfupie5Kpaq=rOcOA@mail.gmail.com>
Message-ID: <CAMuHMdVgAnfLTkbb7GP2BZMAOtwBkjn9Knfupie5Kpaq=rOcOA@mail.gmail.com>
Subject: Re: [PATCH] mtd: Introduce an expert mode for forensics and debugging
 purposes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_065803_552045_9688775F 
X-CRM114-Status: GOOD (  26.92  )
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

SGkgTWlxdcOobCwKCk9uIE1vbiwgSmFuIDEwLCAyMDIyIGF0IDM6NDEgUE0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gZ2VlcnRAbGludXgtbTY4ay5v
cmcgd3JvdGUgb24gTW9uLCAxMCBKYW4gMjAyMiAxNDoxNToyNyArMDEwMDoKPiA+IE9uIFRodSwg
Tm92IDE4LCAyMDIxIGF0IDEyOjQ3IFBNIE1pcXVlbCBSYXluYWwKPiA+IDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4gV2hlbiBkZXZlbG9wcGluZyBOQU5EIGNvbnRyb2xs
ZXIgZHJpdmVycyBvciB3aGVuIGRlYnVnZ2luZyBmaWxlc3lzdGVtCj4gPiA+IGNvcnJ1cHRpb25z
LCBpdCBpcyBxdWl0ZSBjb21tb24gdG8gbmVlZCBoYWNraW5nIGxvY2FsbHkgaW50byB0aGUKPiA+
ID4gTVREL05BTkQgY29yZSBpbiBvcmRlciB0byBnZXQgYWNjZXNzIHRvIHRoZSBjb250ZW50IG9m
IHRoZSBiYWQKPiA+ID4gYmxvY2tzLiBJbnN0ZWFkIG9mIGhhdmluZyBtdWx0aXBsZSBpbXBsZW1l
bnRhdGlvbnMgb3V0IHRoZXJlIGxldCdzCj4gPiA+IHByb3ZpZGUgYSBzaW1wbGUgeWV0IGVmZmVj
dGl2ZSBzcGVjaWZpYyBNVEQtd2lkZSBkZWJ1Z2ZzIGVudHJ5IHRvIGZ1bGx5Cj4gPiA+IGRpc2Fi
bGUgdGhlc2UgY2hlY2tzIG9uIHB1cnBvc2UuCj4gPiA+Cj4gPiA+IEEgd2FybmluZyBpcyBhZGRl
ZCB0byBpbmZvcm0gdGhlIHVzZXIgd2hlbiB0aGlzIG1vZGUgZ2V0cyBlbmFibGVkLgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCA2
N2I5NjdkZGQ5M2QwZWQ1ICgibXRkOgo+ID4gSW50cm9kdWNlIGFuIGV4cGVydCBtb2RlIGZvciBm
b3JlbnNpY3MgYW5kIGRlYnVnZ2luZyBwdXJwb3NlcyIpCj4gPiBpbiBtdGQvbmV4dC4KPgo+IFRo
YW5rcyBmb3IgcmV2aWV3aW5nISBVbmZvcnR1bmF0ZWx5IEkndmUgc2VudCB0aGUgTVREIHB1bGwt
cmVxdWVzdCB0bwo+IExpbnVzIHRoaXMgbW9ybmluZyBzbyBJJ2xsIGhhdmUgdG8gYWRkcmVzcyB0
aGlzIGluIHN1YnNlcXVlbnQKPiBjb21taXRzLgoKTnAsIGFzIGxvbmcgYXMgbm8gb3V0LW9mLXRy
ZWUgbW9kdWxlcyBzdGFydCB1c2luZyB0aGVzZSBzeW1ib2xzIDstKQoKVGhpcyBpcyBqdXN0IG9u
ZSBvZiB0aGUgdGhpbmdzIEkgbm90aWNlZCByaWdodCBiZWZvcmUgdGhlIFhtYXMgYW5kCk5ZIGhv
bGlkYXlzLCBidXQgZGlkbid0IGdldCB0byByZXBvcnRpbmcgb3IgZml4aW5nIGJlZm9yZS4uLgoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
