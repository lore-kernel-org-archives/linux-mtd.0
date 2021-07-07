Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A28EC07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 11:59:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23546197F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 11:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B23546197F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmNk0tiIqWT+G4QirdjSrlDWP6RXApemvxbNm17sQ5U=; b=4abXmc12RffCOZ
	AnIXBZwoKzq+8kfT85vaHKEOi8WXYMor4BoPbpOFL4j5tqC6muatZYZyLMDFBr/8c4VxmsF/8gUI9
	5SlPaCW1Df9cN0R9dK1HZUjklEd161OsSwYN7vusvNTd/M8tL/pwqGsTB7rqXiEWxv6FddoZQuryJ
	VZvHeEjyBgK7xwyyReB4ueuk2aC86LusM/MmIwAkqLGkcS6SYWKJRJ12SUgOYHC6ekETscXeYgos7
	NzNh8EGuHZzVZNXUmoUwF8gEFN47rMSRev/3TO3szFXASO8ds6kigibjGROcfbHj25lXaSS3H/HLl
	FRBqOx3qXktq8L2bAnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m16CK-00EiQv-Tf; Wed, 07 Jul 2021 11:58:36 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m16CH-00EiQK-It
 for linux-mtd@lists.infradead.org; Wed, 07 Jul 2021 11:58:35 +0000
Received: by mail-il1-x136.google.com with SMTP id h3so2270216ilc.9
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jul 2021 04:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gz2SvUlCs2AXE2RQDr8qkXptmWjvi19lXYHyzodzOTc=;
 b=G1HxIi6tdpX67gmIqCI9QUKycAiMTOuhvEOSMdSAdZnfZQEZ4Wh5JWI6SZyzdeTRAO
 DGH/9RshAxFKGTTm882PV+U+Vo70BsEqmlV6RhPDmL0gWyBAOEgXuPMfjZ6ArDPPpSEj
 PwFFqxubu4ldPuIIbsf+HRcwbQKGOIUKQlMw8NgR2dhItxYV6i1LBOyzfvv+sp8vtxxz
 wgdrdVy55hi2uwYyezfir4BVnCTY57gsggzbxGvvoig48uJ68mflZdqw5f+FZXUPnRmm
 dMkkGSKNqGfAyqLmZZdKQm8gm34qkUO12i4l2GuoYh5a0PTK+4WcuZQQDWbx+IYVzwEC
 nCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gz2SvUlCs2AXE2RQDr8qkXptmWjvi19lXYHyzodzOTc=;
 b=f09DMjS360qaB6aqh1+GCacvM4g8szo7ZXLX8CEUpjYDg6kcuG1g09x07dcsqEZ9NA
 0v3HobeVaY0BsDdNedNiy2+GNe4R5CScH5gVoRoNJAciCWpxAz/XmAlMK/OiYBZQQjUs
 xzGZmABS5WB+sjvkwS67j+vEB5XuFxH8JSkeSWFUvhHJVx4MuERXeIPqOMINNKK2VPp3
 2LseH9WsM0jxl3zM+QuL2IQw0g+0LvKS/FbEZC5TH8vT+46sQ2TAHdIF+5Vn6uBzraPp
 WP3L7o4F2YLihdWtXTksQyixIFKlI5iIyhENQ5kfHSawXiZJS3Zbo1gLq1PlgS8HuOHl
 Cl7g==
X-Gm-Message-State: AOAM533T1rczlC6hB8oemirW82J0MfyyPzmImluEMAPpqDpIIsB6/mVU
 kqEOX+K8p049c8fx2ljIu+oxxspIAxvJpgAB95I=
X-Google-Smtp-Source: ABdhPJy7CJ8rw6SS4Lx4DcNFplYdKa9xI3gp69S2JE4ODF5WW8bsIFThi1PSjURjQX+1nsW6m/nHnH+tfFsaM4qBABI=
X-Received: by 2002:a92:ce12:: with SMTP id b18mr17622075ilo.96.1625659112717; 
 Wed, 07 Jul 2021 04:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210707101628.GA27472@pn10-Veriton-X4610>
 <35c2e5faa770e228bd16a2186c8caf78@walle.cc>
In-Reply-To: <35c2e5faa770e228bd16a2186c8caf78@walle.cc>
From: MODEL WORK LST <lstfazz@gmail.com>
Date: Wed, 7 Jul 2021 19:58:22 +0800
Message-ID: <CALEtjnoT1BP5OHmf3xGBGV4o-Xc-vfGR8eLzdM5-Udc_ujxokA@mail.gmail.com>
Subject: Re: [PATCH] mtd:spi-nor:Update Winbond SPI NOR Flash device ID
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com, 
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_045833_691470_C2ECCDB3 
X-CRM114-Status: GOOD (  25.21  )
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

U2hhbWUgb24gbWUsIEkgZG9uJ3QgdXNlIHRoZSBwbGFpbiB0ZXh0IHRvIHJlcGx5LgpQbGVhc2Ug
YWxsb3cgbWUgc2VuZCBhZ2Fpbi4KCkRlYXIgTWljaGFlbCBzaXI6CgpNYW55IHRoYW5rcyBmb3Ig
eW91ciBwcm9tcHQgcmVzcG9uc2UuCkl0IGlzIG15IGZpcnN0IHRpbWUgdXBkYXRlIHBhdGNoIGZv
ciBMaW51eCwgcGxlYXNlIGFkdmlzZSBtZSBpZiBJIGRvIHdyb25nLgpXZSBhcmUgdGVzdGluZyB0
aGVzZSBkZXZpY2UgYnkgdGhlIE5YUCBldmFsdWF0aW9uIGJvYXJkLgpCdXQgdGhlIHJ1bm5pbmcg
TGludXggcmV2aXNpb24gZm9yIHRoYXQgYm9hcmQgaXMgc3RpbGwgNC54LiBUbyB1cGRhdGUKdGhl
IGxhdGVzdCBJRCwKc2hvdWxkIHdlIHByZXBhcmUgdGhlIHN5c3RlbSB0aGF0IGNhbiB3b3JrIHdp
dGggbGF0ZXN0IExpbnV4IHJldmlzaW9uPwpGb3IgdGhlIHRlc3QgcHJvY2VzcywgSSB3YXMgd29u
ZGVyaW5nIHRvIGFzayBtb3VudCB0aGUgZGV2aWNlIHRvIFVCSUZTCmlzIGEgZ29vZCB3YXkgZm9y
IHRlc3Q/CgpGb3IgdGhlIElELCB0aGlzIHRpbWUgd2UgYWRkIG5ldyBJRCB0aGF0IGlzIG5vdCBp
bmNsdWRlIGluIHRoZSBmbGFzaF9pbmZvW10uCkFuZCB3ZSB3b3VsZCBrZWVwIG91ciBkZXZpY2Ug
d2hvIHNoYXJlIHRoZSBzYW1lIElEIGhhdmUgY29tcGF0aWJsZQp3aXRoIGVhY2ggb3RoZXIuCk1h
a2Ugc3VyZSB0aGUgRlcgb3IgU1cgb25seSBuZWVkIHRvIG1haW50YWluIGFuIHVuaXF1ZSBmb3Ig
ZWFjaCBkZW5zaXR5LgpJZiB0aGUgc2FtZSBkZW5zaXR5IGRldmljZSBoYXZlIGRpZmZlcmVudCBi
ZWhhdmlvciwgV2luYm9uZCB3b3VsZCBhcHBseSBuZXcgSUQuCk9yIGhhdmUgYXBwbGljYXRpb24g
bm90ZSBmb3IgY3VzdG9tZXIgdG8gYXdhcmUgdGhlIGRpZmZlcmVuY2UuCgpGb3IgdGhlIFNGRFAs
IEkgd291bGQgY2hlY2sgaG93IHRvIHdvcmsgYW5kIGZpbGwgdGhlIGluZm9ybWF0aW9uLgoKVGhh
bmtzIGFnYWluIGZvciB5b3VyIHJlcGx5IGFuZCBpbmZvcm1hdGlvbiBzaGFyZS4KClNpbmNlcmVs
eQoKU3RlYW0gTGluCgoKTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4g5pa8IDIwMjHl
ubQ35pyIN+aXpSDpgLHkuIkg5LiL5Y2INzozMeWvq+mBk++8mgo+Cj4gSGksCj4KPiBBbSAyMDIx
LTA3LTA3IDEyOjE2LCBzY2hyaWViIFN0ZWFtIExpbjoKPiA+IFRoaXMgcGF0Y2ggaXMgdG8gdXBk
YXRlIFdpbmJvbmQgU1BJIE5PUiBkZXZpY2UKPiA+IElEIGluZm9ybWF0aW9uLgo+ID4gQWRkIG5l
dyAzLjNWIGFuZCAxLjhWIGRldmljZSBpbiB0aGUgSUQgdGFibGUuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogU3RlYW0gTGluIDxTdGxpbjJAd2luYm9uZC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJz
L210ZC9zcGktbm9yL3dpbmJvbmQuYyB8IDE0ICsrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
c3BpLW5vci93aW5ib25kLmMKPiA+IGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiA+
IGluZGV4IDlhODFjNjdhNjBjNi4uMDFhYTQ5OTU0NzkzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2lu
Ym9uZC5jCj4gPiBAQCAtMTAyLDYgKzEwMiwyMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNo
X2luZm8gd2luYm9uZF9wYXJ0c1tdID0gewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBT
RUNUXzRLIHwgU1BJX05PUl9RVUFEX1JFQUQgfCBTUElfTk9SX0RVQUxfUkVBRCkgfSwKPiA+ICAg
ICAgIHsgIncyNXE1MTJqdnEiLCBJTkZPKDB4ZWY0MDIwLCAwLCA2NCAqIDEwMjQsIDEwMjQsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQg
fCBTUElfTk9SX1FVQURfUkVBRCkgfSwKPiA+ICsgICAgIHsgIncyNWg1MTJqdm0iLCBJTkZPKDB4
ZWY5MDIwLCAwLCA2NCAqIDEwMjQsIDEwMjQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCkgfSwKPiA+
ICsgICAgIHsgIncyNXEwMWp2cSIsIElORk8oMHhlZjQwMjEsIDAsIDY0ICogMTAyNCwgMjA0OCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVB
RCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+ID4gKyAgICAgeyAidzI1cTAyanZxIiwgSU5GTygw
eGVmNDAyMiwgMCwgNjQgKiAxMDI0LCA0MDk2LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sCj4g
PiArICAgICB7ICJ3MjVoMDFqdm0iLCBJTkZPKDB4ZWY5MDIxLCAwLCA2NCAqIDEwMjQsIDIwNDgs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JF
QUQgfCBTUElfTk9SX1FVQURfUkVBRCkgfSwKPiA+ICsgICAgIHsgIncyNWgwMmp2bSIsIElORk8o
MHhlZjkwMjIsIDAsIDY0ICogMTAyNCwgNDA5NiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+
ID4gKyAgICAgeyAidzI1cTUxMm53cSIsIElORk8oMHhlZjYwMjAsIDAsIDY0ICogMTAyNCwgMTAy
NCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxf
UkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+ID4gKyAgICAgeyAidzI1cTUxMm53bSIsIElO
Rk8oMHhlZjgwMjAsIDAsIDY0ICogMTAyNCwgMTAyNCwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9
LAo+ID4gIH07Cj4KPiBOaWNlIHRvIHNlZSBwYXRjaGVzIGZyb20gdGhlIHZlbmRvciEgRGlkIHlv
dSB0ZXN0IHRoZXNlIGRldmljZXM/IFdlCj4gb25seSBhY2NlcHQgbmV3IElEcyB3aGljaCBhcmUg
YWN0dWFsbHkgdGVzdGVkLiBBbmQgYXJlIHlvdSBhd2FyZSBvZiBhbnkKPiBJRCBjb2xsaXNpb25z
IG9mIHRoZXNlIGNoaXBzPyBFZy4gc29tZXRpbWVzIHRoZSBKV00gcmV1c2VkIHRoZSBJRCBvZiB0
aGUKPiBGVyB2YXJpYW50LiBIb3cgY2FuIHdlIGRpc3Rpbmd1aXNoIHRoZXNlPwo+Cj4gQWxzbywg
eW91IHdpbGwgaGF2ZSB0byBzdXBwbHkgU0ZEUCBkYXRhIGZvciBhbGwgdGhlc2UgY2hpcHMsIHBs
ZWFzZSBoYXZlCj4gYSBsb29rIGF0IFsxXSBob3cgdG8gZG8gdGhhdC4KPgo+IFsxXQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC83MDM4ZjAzN2RlM2UyMjQwMTZkMjY5MzI0NTE3
NDAwZEB3YWxsZS5jYy8KPgo+Cj4gLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
