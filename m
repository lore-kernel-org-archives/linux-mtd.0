Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E7C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khA3Ppx0FVgjdsy3TXd3ONEhkcQA7Ojs9vpslqA8QF0=; b=hAkXK4mcYwm5IB
	HYJ3bFhoFn7GuPHHtWhd4BPpYJg9WmJFmxSiAepCPDh2rBUi+mzO2Of58wIyD7r829n9739fb1XPn
	ZhnsgH2NcrTMOTYQBrka+e4T2oV4jcc2sB1cok3MWMBxNLwORibybMPEwb1E4X/7dLxe7KIkA99hB
	mtBYHkIsoXZM6o6fsCTxpy5ludMz1fylbHGyRP2FFE3gCazzvntG8RdlDoB8Y5C5J8n5W1VGkiT9Z
	0jQbYfZhA0CNkUhI3PU8gJzm1C1WsJ2oHORuZwr93w+cLV07eKcPMkuV6OCOlatOVhff5nT49dD1h
	pm4j3bMIYGYbRDb89tdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZV1V-00HNso-DL; Tue, 07 Mar 2023 10:58:25 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZV1S-00HNqr-Do
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 10:58:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id s11so50528651edy.8
        for <linux-mtd@lists.infradead.org>; Tue, 07 Mar 2023 02:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678186698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLQHemRIXRE4FrIg6JDLewKbHFCJRHBj5gtISGj6+Lk=;
        b=aU3b0QfFtNND0Irkk/Mc18zoqOmiezu9rIcyeh4HVIuUkcZjXjhTNUzykoPV18OnTs
         gi5a53S9vy/d+rotfmbKzGXLgiMn4312e0IJ2YsV3H3bhnuNAvFugA552nfFkt12o5Es
         XdaftS00MXt5ymcJm1gESWyuhoMTRpisCOFmvzCbrGHPvayGiizIE9s5cYdfM/oumXaB
         h/dav8wUa68z+iu3eohWb1NV6aptQZT3ZRMryfW5y7Kd1OydeiTjuBUrbrUIuRbgtCKJ
         g4Bq904pxhTLWZVfey5ElxXyxBDHL8p59uU9HPWw/gspI9FGhrTZGN4jp4e5UnM1/r5x
         +iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678186698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLQHemRIXRE4FrIg6JDLewKbHFCJRHBj5gtISGj6+Lk=;
        b=kCSBcmdt75Yddygi0XbEPihyGJ7kpBdnFExaCslW+GgWXZvetP73wuBdGSs5wAi3Ao
         st68kTHgqPZzV+e0w95oHh/WVQ3R8nn2X9SXZ4jw3WowAauK2ZTg2AQEbkD68VFLxtRN
         l/tqqdWSR5raatN36ExH+9foJnRN3CXvxCLwrlSO+ZnX1TR/FPrasDmplhsC2/ufZaol
         rBaHgHKgLjkuGa9/QnFkh9mf1Nq8cy4Wmp6HwyH0fFYd2Fnas0e6QGjG4F5iAGAvwn+T
         N3IV99APZ5zMW8BWN73CqrhA9ddg1VGvtFm3yXOCsCyqVsgaWPh/AHdDiGYS7kZlq+9a
         F21w==
X-Gm-Message-State: AO0yUKU6esJmB7bd1aZ1DbTBAkwH5aTJ0+QzOUHOgpb9B2OgwJEXEZJa
	096+6Z32OSI2NYEFPy82oY/Y2E+Fz+64SCw9NDE=
X-Google-Smtp-Source: AK7set/wDNUrNS4Lkg0oycNkwpaiZjj0SnAa4fQgceS30Sq51ZBWEWmjKvP54F+a3R1s+oLjaWc/fU/1EA9M08vNswU=
X-Received: by 2002:a50:8a9d:0:b0:4bc:5de1:ee5 with SMTP id
 j29-20020a508a9d000000b004bc5de10ee5mr7666471edj.2.1678186698578; Tue, 07 Mar
 2023 02:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
 <20230307100350.1c0af7b9@xps-13> <1e321754-5bdd-4019-8524-2222ee369502@app.fastmail.com>
 <20230307113846.5dab6e66@xps-13>
In-Reply-To: <20230307113846.5dab6e66@xps-13>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 7 Mar 2023 11:58:07 +0100
Message-ID: <CAKXUXMwn8wLBtTru74Mo4D=X6gA-M3b3Zin0L_ugtN9-R2L7-A@mail.gmail.com>
Subject: Re: [PATCH] mtd: parsers: remove reference to config MTD_NAND_TMIO
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_025822_489805_72336BBF 
X-CRM114-Status: GOOD (  25.23  )
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCAxMTozOOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgQXJuZCwKPgo+IGFybmRAYXJuZGIuZGUg
d3JvdGUgb24gVHVlLCAwNyBNYXIgMjAyMyAxMToyNjo0OCArMDEwMDoKPgo+ID4gT24gVHVlLCBN
YXIgNywgMjAyMywgYXQgMTA6MDMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiA+IEhpIEx1a2Fz
LAo+ID4gPgo+ID4gPiBsdWthcy5idWx3YWhuQGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsICA3IE1h
ciAyMDIzIDA4OjQwOjM4ICswMTAwOgo+ID4gPgo+ID4gPj4gQ29tbWl0IDU2ODQ5NGRiNjgwOSAo
Im10ZDogcmVtb3ZlIHRtaW9fbmFuZCBkcml2ZXIiKSByZW1vdmVzIHRoZSBjb25maWcKPiA+ID4+
IE1URF9OQU5EX1RNSU8gYW5kIGl0cyBjb3JyZXNwb25kaW5nIGRyaXZlci4KPiA+ID4+Cj4gPiA+
PiBSZW1vdmUgdGhlIHJlZmVyZW5jZSBpbiBNVERfU0hBUlBTTF9QQVJUUyB0byB0aGF0IHJlbW92
ZWQgY29uZmlnLgo+ID4gPj4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1bHdhaG4gPGx1
a2FzLmJ1bHdhaG5AZ21haWwuY29tPgo+ID4gPj4gLS0tCj4gPiA+PiBBcm5kLCBwbGVhc2UgYWNr
Lgo+ID4gPj4gTWlxdWVsLCBwbGVhc2UgcGljayB0aGlzIG1pbm9yIG5vbi11cmdlbnQgcGF0Y2gg
b24gdG9wIG9mIHRoZSBjb21taXQgYWJvdmUuCj4gPiA+Cj4gPiA+IEFjdHVhbGx5IEkgZ3Vlc3Mg
dGhlIFNIQVJQU0wgZHJpdmVyIGlzIG5vdCBzZWxlY3RhYmxlIHJpZ2h0IG5vdywgc28KPiA+ID4g
dGhpcyBzaG91bGQgYmUgc2VudCBhcyBwYXJ0IG9mIG15IG5leHQgZml4ZXMgUFIuCj4gPgo+ID4g
SSBkb24ndCBzZWUgd2h5IG5vdCwgaXQganVzdCBkZXBlbmRzIG9uICdBUkNIX1BYQXx8Q09NUElM
RV9URVNUJyBhbmQKPiA+IHNob3VsZCB3b3JrIGZpbmUgd2l0aCBDT05GSUdfTUFDSF9TUElUWiBQ
REFzLgo+Cj4gU29ycnksIEkgb3Zlcmxvb2tlZCB0aGUgZGlmZiwgaW5kZWVkIHRoZXJlIGlzIG5v
dGhpbmcgYnJva2VuLCBzbyBJJ2xsCj4gcXVldWUgaXQgdG8gbmFuZC9uZXh0LiBJIHRob3VnaHQg
TVREX1NIQVJQU0xfUEFSVFMgd2FzIG5vdCBzZWxlY3RhYmxlCj4gYW55bW9yZSB3aXRob3V0IENP
TVBJTEVfVEVTVCwgd2hpY2ggd291bGQgaGF2ZSBiZWVuIHByb2JsZW1hdGljLgo+Cj4gRml4ZXMg
dGFnIHN0aWxsIHdlbGNvbWUgdGhvdWdoIDopCj4KCkFybmQncyBjb21taXQgaXMgbm90IGJyb2tl
bi4gSXQgZG9lcyB3aGF0IEFybmQgd3JpdGVzIGluIGhpcyBjb21taXQKbWVzc2FnZSB3aGF0IGl0
IHNob3VsZCBkby4KCkFuZCB0aGlzIHBhdGNoIGlzIGp1c3QgYSBjbGVhbi11cCB0aGF0IHJlbW92
ZXMgcmVmZXJlbmNlcywgYnV0IGl0IGlzCmp1c3QgInN0eWxpc3RpYyIgYW5kIHJlZHVjZXMgdGhl
IGNvbXBsZXhpdHkgb2YgS2NvbmZpZyBkZXBlbmRlbmN5CmRlZmluaXRpb25zIGZvciBub24tZXhp
c3RpbmcgY29uZmlnIHN5bWJvbHMuIEkgZG8gbm90IHNlZSB0aGF0IHRoaXMKcGF0Y2ggZml4ZXMg
QXJuZCdzIHBhdGNoLiBJdCBpcyBqdXN0IGEgY2xlYW4tdXAgd2l0aCBhIHJlZmVyZW5jZSB0bwpB
cm5kJ3MgcGF0Y2ggdG8gdW5kZXJzdGFuZCB3aHkgdGhpcyBjbGVhbiB1cCBjYW4gYmUgZG9uZSBu
b3cuCgpJZiB5b3UgUkVBTExZIHdhbnQgdGhlIEZpeGVzOiB0YWcsIEkgY2FuIHN1cmUgYWRkIGl0
LiBCdXQsIEkgZG8gbm90CmNsYWltIHRoYXQgSSBhbSBmaXhpbmcgYW55dGhpbmcgaGVyZTsgbm90
aGluZyB3YXMgYnJva2VuIGluIHRoZSBmaXJzdApwbGFjZS4gVGhlIHJlZmVyZW5jZSB0byB0aGUg
Y29tbWl0IG9mIGludGVyZXN0IGlzIGluIHRoZSBjb21taXQKbWVzc2FnZSwgYW5kIGFueW9uZSBj
YW4gZm9sbG93IG9yIGV4dHJhY3QgdGhlIGluZm9ybWF0aW9uIGlmIHRoZXkgYXJlCmludGVyZXN0
ZWQuCgpTbywgcGxlYXNlIGtlZXAgdGhpcyBwYXRjaCBpbiB0aGUgcXVldWUgZm9yIG5hbmQvbmV4
dC4KCkx1a2FzCgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
