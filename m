Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B7ECDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFOIi2QF9AEMB6kaZQtX9cZxH9IJvy3qI8C0V0QqGfw=; b=pzRR4eaHJoIqnP
	zC8UEqNvQvmUu1ArBoSUdQRr7Cc396Jc520+Dz2F1T+SIYzpPpOAlyTSb8NSSij4ouJmIM56sN/dK
	dXwRBh/+Dp0Kpj0ldSMmB+1DjK/iz9dh8zY4CE1Pn+WGufOuPhGPwhzvtDDrVvxieXwV+EgZkKoS9
	SRfb6dJWFGuSHXq+ePXh/TzOOpTgQ2obj3SdmCVxScVXsm0C2Nci+v93+Wk4BrBi7Jg1Il2x6y4im
	QPg482tT3z3+ggv7ySMwZF2XK0oFJZxWfcchxfm8n1FHX4o2NuHuN+aHzKEaWZtlDfHmrxULqx5hj
	lFNHjinP41jvIvk27bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqPX-006mUo-1T;
	Mon, 23 Oct 2023 08:35:43 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqPT-006mTf-2k
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 08:35:41 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d852b28ec3bso2914332276.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2023 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698050136; x=1698654936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mwmd78xs9HxhMGBj7oIOsT6gI0D9O6zUKd9Dh3MymY=;
        b=lUstjOPOzLCa6oLaiYuDmonn5WNncfPzEGpI5bvyzSRZPuEgVLYDOiQCPoLwcnisHe
         CZ5CV8+VhY2zEsBRwLyaBiNuGckoSZLWM8tp0M2UENthRL55U2RP8yKJx4n7pvDeydl9
         hue76vrgRj7VX+Jj80Hn2oqgV4cW1Ez0+D0pqQn+0PjH1H8gk+8LOu8QcCWK8aowin6M
         TrdB3QSjwb2uBtOzCw8h8uPddYnhkUx5cHPHlPm0P8NrsX9cgXpbQFTj10OBTkkQcgcK
         SB3cdaLDNXDW8euEIodYOmCLY3NtAYv5m086grClFgPKUTqgxKJ3CFS0327SWMwlJ5zH
         A1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698050136; x=1698654936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mwmd78xs9HxhMGBj7oIOsT6gI0D9O6zUKd9Dh3MymY=;
        b=R8nnaty1j1zxeKwpMrry+u9gaxsVdQsBDjJvWRIDASCkfuJqtRiXdmCRef/nxUvDfK
         M5WbnErabobGXpq+MOGAsGJlK7u6LVEJPQ+CZD4DgYkkyd5oT8Sp/94bJ55fu4iLoZcI
         bCMaVwLBipexVSuUs0bO0v5dpQx8+XIWymbuB/oVhj1f6IMZKtuBPCalOmVx8LJQlQbB
         aTseHpIKBHgDucHYPKIHMIuOirsnlVfzoxjvsDVyjJxYvJMtn7Z0RB7t40zmVZJ1R4kX
         Ucfuno9Vz/YUXFnmEEnS97KEDwfuOvTdH3Qws8OmrIzlQru2i7W3JvnGkN8y9igcz9Xg
         XFrA==
X-Gm-Message-State: AOJu0Ywdb49eeoMbS6m7T+ROlY/2cmbWmFjCfwrUriPNG3RC4MNDXCvN
	ceYq7BWomCTIkJmhqvD3N6yuJfp6OFFIf36EEvD8og==
X-Google-Smtp-Source: AGHT+IFLaQFg+y5gLi6XYCmqbWW4yOYzUhAuqMg9rBSYQcedOU2GIgVfAG+RjKA0FfI1WDqSVq00BjS2om75bKau9+I=
X-Received: by 2002:a25:e6c8:0:b0:d9c:f9f2:ec45 with SMTP id
 d191-20020a25e6c8000000b00d9cf9f2ec45mr7997201ybh.15.1698050135883; Mon, 23
 Oct 2023 01:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231020-mtd-otp-byteswap-v4-1-0d132c06aa9d@linaro.org> <20231023102552.4b053b17@xps-13>
In-Reply-To: <20231023102552.4b053b17@xps-13>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Oct 2023 10:35:24 +0200
Message-ID: <CACRpkdYaq=RxgLJhRanfgw1+280N1K-aRvpy_BTM3SYY9Xtokw@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: cfi_cmdset_0001: Byte swap OTP info
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Nicolas Pitre <nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013539_899051_BBBAA8A7 
X-CRM114-Status: GOOD (  23.65  )
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

T24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMTA6MjXigK9BTSBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gbGludXMud2FsbGVpakBsaW5hcm8ub3JnIHdy
b3RlIG9uIEZyaSwgMjAgT2N0IDIwMjMgMjI6MzA6MjkgKzAyMDA6Cj4KPiA+IEN1cnJlbnRseSB0
aGUgb2Zmc2V0IGludG8gdGhlIGRldmljZSB3aGVuIGxvb2tpbmcgZm9yIE9UUAo+ID4gYml0cyBj
YW4gZ28gb3V0c2lkZSBvZiB0aGUgYWRkcmVzcyBvZiB0aGUgTVREIE5PUiBkZXZpY2VzLAo+ID4g
YW5kIGlmIHRoYXQgbWVtb3J5IGlzbid0IHJlYWRhYmxlLCBiYWQgdGhpbmdzIGhhcHBlbgo+ID4g
b24gdGhlIElYUDR4eCAoYWRkZWQgcHJpbnRzIHRoYXQgaWxsdXN0cmF0ZSB0aGUgcHJvYmxlbSBi
ZWZvcmUKPiA+IHRoZSBjcmFzaCk6Cj4gPgo+ID4gY2ZpX2ludGVsZXh0X290cF93YWxrIHdhbGsg
T1RQIG9uIGNoaXAgMCBzdGFydCBhdCByZWdfcHJvdF9vZmZzZXQgMHgwMDAwMDEwMAo+ID4gaXhw
NHh4X2NvcHlfZnJvbSBjb3B5IGZyb20gMHgwMDAwMDEwMCB0byAweGM4ODBkZDc4Cj4gPiBjZmlf
aW50ZWxleHRfb3RwX3dhbGsgd2FsayBPVFAgb24gY2hpcCAwIHN0YXJ0IGF0IHJlZ19wcm90X29m
ZnNldCAweDEyMDAwMDAwCj4gPiBpeHA0eHhfY29weV9mcm9tIGNvcHkgZnJvbSAweDEyMDAwMDAw
IHRvIDB4Yzg4MGRkNzgKPiA+IDg8LS0tIGN1dCBoZXJlIC0tLQo+ID4gVW5hYmxlIHRvIGhhbmRs
ZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIGRiMDAwMDAwCj4gPiBb
ZGIwMDAwMDBdICpwZ2Q9MDAwMDAwMDAKPiA+ICguLi4pCj4gPgo+ID4gVGhpcyBoYXBwZW5zIGlu
IHRoaXMgY2FzZSBiZWNhdXNlIHRoZSBJWFA0eHggaXMgYmlnIGVuZGlhbiBhbmQKPiA+IHRoZSAz
Mi0gYW5kIDE2LWJpdCBmaWVsZHMgaW4gdGhlIHN0cnVjdCBjZmlfaW50ZWxleHRfb3RwaW5mbyBh
cmUgbm90Cj4gPiBwcm9wZXJseSBieXRlc3dhcHBlZC4gQ29tcGFyZSB0byBob3cgdGhlIGNvZGUg
aW4gcmVhZF9wcmlfaW50ZWxleHQoKQo+ID4gYnl0ZXN3YXBzIHRoZSBmaWVsZHMgaW4gc3RydWN0
IGNmaV9wcmlfaW50ZWxleHQuCj4gPgo+ID4gQWRkaW5nIGEgc21hbGwgYnl0ZSBzd2FwcGluZyBs
b29wIGZvciB0aGUgT1RQIGluIHJlYWRfcHJpX2ludGVsZXh0KCkKPiA+IGFuZCB0aGUgY3Jhc2gg
Z29lcyBhd2F5Lgo+ID4KPiA+IFRoZSBwcm9ibGVtIHdlbnQgdW5ub3RpY2VkIGZvciBtYW55IHll
YXJzIHVudGlsIEkgZW5hYmxlZAo+ID4gQ09ORklHX01URF9PVFAgb24gdGhlIElYUDR4eCBhcyB3
ZWxsLCB0cmlnZ2VyaW5nIHRoZSBidWcuCj4gPgo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPgo+IFdvdWxkIHlvdSBsaWtlIHRvIGFkZCBhIEZpeGVzIHRhZyBhcyB3ZWxsPyBPciBpcyB0
aGlzIHNraXBwZWQgb24KPiBwdXJwb3NlPwoKWWVzIHRoZSBhY3R1YWwgY29tbWl0IHByZWRhdGVz
IGV4aXN0aW5nIGdpdCBoaXN0b3J5Li4uIDovCgpHaXQgYmxhbWUgbG9va3MgbGlrZSB0aGF0OgoK
XjFkYTE3N2U0YzNmNCAoTGludXMgVG9ydmFsZHMgICAgICAgICAyMDA1LTA0LTE2IDE1OjIwOjM2
IC0wNzAwICA0MjMpCl4xZGExNzdlNGMzZjQgKExpbnVzIFRvcnZhbGRzICAgICAgICAgMjAwNS0w
NC0xNiAxNToyMDozNiAtMDcwMCAgNDI0KQogICAgICAgICAvKiBQcm90ZWN0aW9uIFJlZ2lzdGVy
IGluZm8gKi8KYjM1OWVkNTE4NGFlYiAoSmVhbi1QaGlsaXBwZSBCcnVja2VyICAyMDIwLTA0LTE3
IDE2OjIzOjI2ICswMjAwICA0MjUpCiAgICAgICAgIGlmIChleHRwLT5OdW1Qcm90ZWN0aW9uRmll
bGRzKQpiMzU5ZWQ1MTg0YWViIChKZWFuLVBoaWxpcHBlIEJydWNrZXIgIDIwMjAtMDQtMTcgMTY6
MjM6MjYgKzAyMDAgIDQyNikKICAgICAgICAgICAgICAgICBleHRyYV9zaXplICs9IChleHRwLT5O
dW1Qcm90ZWN0aW9uRmllbGRzIC0gMSkgKgpiMzU5ZWQ1MTg0YWViIChKZWFuLVBoaWxpcHBlIEJy
dWNrZXIgIDIwMjAtMDQtMTcgMTY6MjM6MjYgKzAyMDAgIDQyNykKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgY2ZpX2ludGVsZXh0X290cGluZm8pOwoKSmVhbi1Q
aGlsaXBwZSdzIHBhdGNoIGlzIG5vdCB0aGUgcm9vdCBjYXVzZSBBRkFJQ1QsIGJ1dCBzb21ldGhp
bmcKcHJlZGF0aW5nIGl0LCBhbmQgcHJlZGF0aW5nIGdpdCBoaXN0b3J5LgoKVGhlIGZpeCBlYXNp
bHkgYXBwbGllcyB0byBhbGwgbWFpbnRhaW5lZCBzdGFibGUga2VybmVscy4KCj4gPiBSZXZpZXdl
ZC1ieTogTmljb2xhcyBQaXRyZSA8bmljb0BmbHV4bmljLm5ldD4KPiA+IFNpZ25lZC1vZmYtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gQ2hh
bmdlTG9nIHYzLT52NDoKPiA+IC0gQ29sbGVjdGVkIE5pY28ncyBBQ0suCj4gPiAtIFN0YWxsZWQg
c2luY2UganVuZSEgSGFzIHRoaXMgYmVlbiBtaXNzZWQ/Cj4KPiBPdXIgY3VycmVudCBvcmdhbml6
YXRpb24gcmVsaWVzIG9uIFZpZ25lc2ggdG8gcGljay11cCAob3IgdGVsbCBtZSB0bwo+IHBpY2st
dXApIGNmaSBwYXRjaGVzLiBCdXQgaGUgaXMgc2xpZ2h0bHkgbGVzcyBhY3RpdmUgdGhlc2UgZGF5
cywgc28gaWYgSQo+IGRvbid0IGdldCBhbnkgZmVlZGJhY2sgZnJvbSBoaW0gc29vbiBJIHdpbGwg
dGFrZSBpdCBmb3IgdGhlIG5leHQgbWVyZ2UKPiB3aW5kb3cuCj4KPiBTb3JyeSBmb3IgdGhlIGRl
bGF5IGFueXdheS4KCk5vIHdvcnJpZXMgaXQncyBub3QgbGlrZSB0aGUgcGF0Y2ggaXMgdXJnZW50
LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
