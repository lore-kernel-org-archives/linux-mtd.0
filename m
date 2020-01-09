Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0270C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:26:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B532D20721
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gY4a16bG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QkH5cjkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B532D20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6e9nvecYjr+HoOKaFqS4VoWTYxNjWijOwBT6pvZQW0=; b=gY4a16bGKZJNqf
	GwXtsVVH7QurrfGfdyH2IPLa1y6zRpwjcxkPegXQIfhM7j01oxsbp4P90/OxCL/n4JKWaQn2D9hi0
	xxY0DyfQYURd9A7Nck+nuH4dyiXQOskH8gaZdKCUwYaZyW8UqoGtl89GtUirxaz3C8t2h5xfPtPhk
	wD3OEkUeBR48UpyZLFEsOZQ1Qwy6B3Fhsf5nMfDM0fBOi+Lz3dbxEjQbY1G6hEWIyLXlptMiLzJ79
	JcpSJCPsxYtMv2hMXUsaxSpQVQbfuZP8Z73c6xUyVgvRBZGu0taZlTWiynlnimESXpD9hi5u3+SAX
	LWNO8i1sa4vc7Ie2M8rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipZhp-0004w6-F1; Thu, 09 Jan 2020 15:26:41 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipZhl-0004vC-PK
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 15:26:39 +0000
Received: by mail-lf1-x141.google.com with SMTP id y1so5483762lfb.6
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2020 07:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r1uJPrM0722ZAZdZD1u7i67ETXd5iMwmhJ8SByCEg8Q=;
 b=QkH5cjkVO7FpbMG2bfUzb8x1AZjOT2LDKNRt1iYpstFP8gUzLBKRESPSqn/ha9K9rR
 JOSETySTRT7ryhQi3ZyUyl/JvGTJaNae2voy1zpGnB3o6hh1/PpcvaYKOjA46WUwRyJf
 taHKHJmA7H9yiuOKeBphYdCm9VfSw8XtLWj9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r1uJPrM0722ZAZdZD1u7i67ETXd5iMwmhJ8SByCEg8Q=;
 b=CAQSDgLufMRTnOKJieSNYgZxZ/hNdZpkO/ueMbQdUYn3gCC2UJULBNV/xLCaIHGa8J
 tTAVANrP9wbDCTni98CKiq8amqM8+cLb2prCfnW6rBPjtPL807P2D0wJNMpKUYSWAH9B
 KFstsK7vyVlhzSkLH1kv9x2tL8gR2t4hcbwEwfLJbRsXFio70aTeqgtvwc7+JrVvd0D4
 UDFqBJRDv4nRTvbLd+MuvuH1aATUy+QejY5KjOJ6aePdE3D6MPWb+bFzk/m3X68DQt99
 7AOdrsQlN9LBl3gBqfm+N5usUf0Bvm6uN6FkwWYKOPrwuWsSPnh0QTX/EqdUpuHnoEUU
 R2NA==
X-Gm-Message-State: APjAAAV+0Yom+sA2fjo1/dLoUT6QfG7J6nrHsHxeVD7ecmcwu5i6P+XY
 xZrYFeU4I53189PtQxTe7DHPcylsoOk2VI+wUVan+A==
X-Google-Smtp-Source: APXvYqwwOamAUbWQafZjbxgWWXcTW3PPbJ8ulX5mxUsqtl+iH4nMzWdI4AcYLvYxseXTYeLufsUD7OEGLwm6EDxW1pc=
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr6511455lfq.176.1578583595493; 
 Thu, 09 Jan 2020 07:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
 <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
 <20200109160352.6080e1e5@xps13>
In-Reply-To: <20200109160352.6080e1e5@xps13>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 9 Jan 2020 10:25:59 -0500
Message-ID: <CAKekbeucdjZgttQfHeiXH6S92He2qkKGsQcEqz_4_okHzDK16A@mail.gmail.com>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_072637_823682_D0278B4E 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWlxdWVsLAoKWWVzIHRoZSBpc3N1ZSBpcyBzdGlsbCBvcGVuLiBJIHdhcyB0cnlpbmcgdG8gdW5k
ZXJzdGFuZCB0aGUgc3VnZ2VzdGlvbgphbmQgZGlkIG5vdCBnZXQgYSByZXBseSBvbiB0aGUgcXVl
c3Rpb24gSSBoYWQKClJpY2hhcmQgd3JvdGUgOgoiU28gdGhlIHJpZ2h0IGZpeCB3b3VsZCBiZSBz
ZXR0aW5nIHRoZSBwYXJlbnQncyBvb3BzX3BhbmljX3dyaXRlIGluCm10ZF9wYW5pY193cml0ZSgp
LgpUaGVuIHdlIGRvbid0IGhhdmUgdG8gdG91Y2ggbXRkcGFydC5jIgoKSG93IGRvIEkgZ2V0IGFj
Y2VzcyB0byB0aGUgcGFydHMgcGFyZW50IGluIHRoZSBjb3JlID8uIE1heWJlIEkgYW0KbWlzc2lu
ZyBzb21ldGhpbmcuCgpLYW1hbAoKT24gVGh1LCBKYW4gOSwgMjAyMCBhdCAxMDowMyBBTSBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+
Cj4gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGUgb24gV2VkLCA2IE5v
diAyMDE5IDAwOjAzOjQyCj4gKzAxMDAgKENFVCk6Cj4KPiA+IC0tLS0tIFVyc3Byw7xuZ2xpY2hl
IE1haWwgLS0tLS0KPiA+ID4gVm9uOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+Cj4gPiA+IEFuOiAiS2FtYWwgRGFzdSIgPGtkYXN1LmtkZXZAZ21haWwuY29tPgo+
ID4gPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImJj
bS1rZXJuZWwtZmVlZGJhY2stbGlzdCIgPGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNv
bS5jb20+LAo+ID4gPiAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zz4sICJEYXZpZCBXb29kaG91c2UiIDxkd213MkBpbmZyYWRlYWQub3JnPiwgIkJyaWFuIE5vcnJp
cyIKPiA+ID4gPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4sICJNYXJlayBWYXN1dCIgPG1h
cmVrLnZhc3V0QGdtYWlsLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIKPiA+ID4gPHZpZ25lc2hyQHRpLmNvbT4KPiA+ID4gR2VzZW5kZXQ6IERp
ZW5zdGFnLCA1LiBOb3ZlbWJlciAyMDE5IDIwOjAzOjQ0Cj4gPiA+IEJldHJlZmY6IFJlOiBbUEFU
Q0hdIG10ZDogc2V0IG10ZCBwYXJ0aXRpb24gcGFuaWMgd3JpdGUgZmxhZwo+ID4KPiA+ID4gSGkg
S2FtYWwsCj4gPiA+Cj4gPiA+IFJpY2hhcmQsIHNvbWV0aGluZyB0byBsb29rIGludG8gYmVsb3cg
OikKPiA+Cj4gPiBJJ20gc3RpbGwgcmVjb3ZlcmluZyBmcm9tIGEgYmFkIGNvbGQuIFNvIG15IGJy
YWluIGlzIG5vdCBmdWxseSB3b3JraW5nIDspCj4gPgo+ID4gPiBLYW1hbCBEYXN1IDxrZGFzdS5r
ZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAyMSBPY3QgMjAxOSAxNTozMjo1Mgo+ID4gPiAt
MDQwMDoKPiA+ID4KPiA+ID4+IENoZWNrIG10ZCBwYW5pYyB3cml0ZSBmbGFnIGFuZCBzZXQgdGhl
IG10ZCBwYXJ0aXRpb24gcGFuaWMKPiA+ID4+IHdyaXRlIGZsYWcgc28gdGhhdCBsb3cgbGV2ZWwg
ZHJpdmVycyBjYW4gdXNlIGl0IHRvIHRha2UKPiA+ID4+IHJlcXVpcmVkIGFjdGlvbiB0byBlbnN1
cmUgb29wcyBkYXRhIGdldHMgd3JpdHRlbiB0byBhc3NpZ25lZAo+ID4gPj4gbXRkIHBhcnRpdGlv
bi4KPiA+ID4KPiA+ID4gSSBmZWVsIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uCj4gPiA+IHJlZ2FyZGluZyBwYXJ0aXRpb25zIGJ1dCBJIGFt
IG5vdCBzdXJlIHRoaXMgaXMgdGhlIHJpZ2h0IGZpeC4gSXMgdGhpcwo+ID4gPiBzb21ldGhpbmcg
eW91IGRldGVjdGVkIHdpdGggc29tZSBraW5kIG9mIHN0YXRpYyBjaGVja2VyIG9yIGRpZCB5b3UK
PiA+ID4gYWN0dWFsbHkgZXhwZXJpZW5jZSBhbiBpc3N1ZT8KPiA+ID4KPiA+ID4gSW4gdGhlIGNv
bW1pdCBsb2cgeW91IHNheSAiY2hlY2sgbXRkIChJIHN1cHBvc2UgeW91IG1lYW4gdGhlCj4gPiA+
IG1hc3RlcikgcGFuaWMgd3JpdGUgZmxhZyBhbmQgc2V0IHRoZSBtdGQgcGFydGl0aW9uIHBhbmlj
IHdyaXRlIGZsYWciCj4gPiA+IHdoaWNoIG1ha2VzIHNlbnNlLCBidXQgaW4gcmVhbGl0eSBteSB1
bmRlcnN0YW5kaW5nIGlzIHRoYXQgeW91IGRvIHRoZQo+ID4gPiBvcHBvc2l0ZTogeW91IGNoZWNr
IG10ZC0+b29wc19wYW5pY193cml0ZSB3aGljaCBpcyB0aGUgcGFydGl0aW9ucycKPiA+ID4gc3Ry
dWN0dXJlLCBhbmQgc2V0IHBhcnQtPnBhcmVudC0+b29wc19wYW5pY193cml0ZSB3aGljaCBpcyB0
aGUgbWFzdGVyJ3MKPiA+ID4gZmxhZy4KPiA+Cj4gPiBJSVVDIHRoZSBwcm9ibGVtIGhhcHBlbnMg
d2hlbiB5b3UgcnVuIG10ZG9vcHMgb24gYSBtdGQgcGFydGl0aW9uLgo+ID4gVGhlIHRoZSBmbGFn
IGlzIG9ubHkgc2V0IGZvciB0aGUgcGFydGl0aW9uIGluc3RlYWQgZm9yIHRoZSBtYXN0ZXIuCj4g
Pgo+ID4gU28gdGhlIHJpZ2h0IGZpeCB3b3VsZCBiZSBzZXR0aW5nIHRoZSBwYXJlbnQncyBvb3Bz
X3BhbmljX3dyaXRlIGluCj4gPiBtdGRfcGFuaWNfd3JpdGUoKS4KPiA+IFRoZW4gd2UgZG9uJ3Qg
aGF2ZSB0byB0b3VjaCBtdGRwYXJ0LmMKPiA+Cj4KPiBUaGlzIGlzc3VlIGlzIHN0aWxsIG9wZW4s
IHJpZ2h0PyBLYW1hbCBjYW4geW91IHNlbmQgYW4gdXBkYXRlZCB2ZXJzaW9uPwo+Cj4KPiBUaGFu
a3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
