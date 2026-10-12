Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42787CA9EDE
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQepSFanW8w+Bz/hQ1gf2ljyb6JDJuJYFVLXSvXb6yk=; b=E/bHp+0zR9hTLM
	gR7iYbEjXj0UP07Pfsi37d7pzjBhAoFF507MOaEkJaXp6ucfa+zVnvUsg8Ur4rC0lJeHqi7P2A30w
	Utqeq45gMMVzjctzPJFqqqHznImIgv+z78Cbm4e1n8LzUoIrKO5vDk5rvdnzZ24ZakAoYalEoXGzM
	ceXSbyieKkXRW6a3A4uSAXEVmLK3QFRnCP6dl+hT5DUE52T2TN7b5v8k04661PoPtVWn/JbhbeNHV
	N9SOOchEJQhLY3JUgIIdNwtlpRTqrm2IIrUSH1ay4+qAe8gBP/aG6XGK8HkAJCH0LlqIOw/pXR9ba
	4zdlmvBezR5+lWA9r+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLWk-0000000BN0h-0mcc;
	Mon, 12 Oct 2026 19:17:38 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLWh-0000000BMz8-422E
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 19:17:37 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-7c1ecff2b1fso574013137.1
        for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2026 12:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791832655; cv=none;
        d=google.com; s=arc-20260327;
        b=EVdFBziaBbAuaVIb+DP7K7fExQwSU7IF6zVzDTIUo9Kmg1qMXvK+69L9glDBUAQoLX
         kUeAWnxX+QWCsXXJKdmAj+kYsbTM9U2TkcSauMMI3SnKFHa+UK6crVhZaB6lonJ4niQX
         29HGZoTozvPNiuHk5yqUbFyuR9WsOMvhz8nDYV/4t0hjR0dJy6/gYrD5j/OrnXneHQuN
         kR8xyKFBFLBU8FWUUsb52eDWYT4HcDLqpSGQwOgBjn5UxAplYt6dYeBLjByvjeWIq5x9
         cnhq2KZPFkTFRzlhuX6/zwhdsY2pZpO/PYqxR381ehLPB4QwfI8FMatFfCj0e6gIkI/U
         J1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        fh=LMq+xG0AQrp0wd+aVh20IcdWeK/v6fUF4k2t9y45pHc=;
        b=nYSWv49AWbEbFf/l5dGlZIb2Y1Z6HcJtjy//M6my9ZS4yezJfwPtbWOdkoPjPf8dW3
         ztjv7oouZNkFfziMK0kle5foYMJ7GkJcyKTdDQnOgXf047M1TeS0N4xZ8hpMJvlUyy51
         K/zbjp1FTOTvJ6jwwl+o4nZBNlr/LGWKeQCXh85cKpU4YhVI8dG0tQvQprrmSVbyzrbL
         WUBZVTbKZBYFBQXt20KDf1vXsy7ve7Yk1TzzDv70nsXGjxUnIJMQDegMpKyktYypzwTq
         VPdPiDqW1A1NK+Oo2VfrBr29zvuueWv/UI68eGWgSas6zKinnk4D8EG+PEmhXqU+GGEO
         bP2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832655; x=1792437455; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        b=GtJgfcYnR3OpaSAaF3j+b5tya0oZffzqVvXNiQmcMio45Juhl/bb64kqJuKKzUgrJ3
         eEYAsGVeBophng1vwpGZOw0Rto6VaNO2OAEC0BPCis+GTGzSvFYJhUltgRry3d8/twzo
         05VoSPTQbyrRRRNuVnS6d4snUwgZbkeaXrJFATy7Hwt19iG29FnZn2BJSFFW5lD2Ajfp
         lsC00u7nc7KX4vG+INDYYTuQlZXxsp64pmTNGNZFfb8Ez/7Is6dHQjH8XytEHhF2/YDY
         WmdKAn+FpRSZJi+v6akI/nKeOoztdRIh8IWVyOFCeAcPsZKfSJQ/bqe7Lvoql6K/ObqA
         KXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832655; x=1792437455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPLLkky/mBMG1bxMgcOlfanOcStnyU9/PqoEofggCR0=;
        b=J4xZMpjf075euUMFQOOm4Zgl/o9+6oyXYbxIEv1g2AgNtPvbO6k1EXWsq90ISGtPoR
         0k+anKZO9b8sVMbEtoHSAQNqWowxWq+hmyO0Wo9dueAnZAPKbaJdwA73u/8IuJ7FU7Az
         /UoVeDHeiLTX3BKAyzrGn+gnOWYt0KS4oCzFRiAVnXrjrWHZzjNial9UtCICLpAAZbPG
         BoOY/CRGMM/0v5LJDZiiINaa6VlkXYzY+NuB3hxPow4jmYkk/9dkb7tQWRFPKBE9qWSS
         frz3AFJIp7Nx07FS87Q7ZKyaxcK0va/Eq09/2HKMg3c5FU8BYSlLVG158jz5gyPcwIFW
         HOLw==
X-Forwarded-Encrypted: i=1; AKwUvBzznEg4VuMN8vpnoU6Ggqoz2nhG5U5xcmN64dlZjddYPPqgF+oI0Lq04bYgTfuc2qdIqk9FeEML2I8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJLsz7Amz3z2byPuicrLkhBfXgKVgT0eALuvoWQzSMlKIwLNjks
	nxTpudqGYWwVyKMTiDlZ7anP/vYa+IuWDtClNqXP8gmPbY2+sPZxnfj2naSZf96EgpZtCT5ClXl
	l0Zbdp/ZdPOcYycPZHxTpjOfnHpj9ts0=
X-Gm-Gg: AYBFou2Z4VZ7g+++xKIQR2+JbXae7RjP3mWTcH5K29VQq1Ax1vG/4OSfwdOMjr125mr
	o9urrygESV1boi0m1cv4Hlc1yO30KG8yKwchUZp1ppP5bEYl8/SxmKSDEKrP6iK7auZFFiVo6jM
	zRtv3iKvi/Cm/BdXPSS0gVqYQhC7uQwrOo7yCrBpsspc4v619Oo73fbu0v1Rx3n7LYFOKMfsxXN
	vRFYppuKGGZMj2QOhW9RKkKXO06154oz2/4JbeDAfoQAfFCQGwQ6qlzMDtzXZwZAwRNaU4lxSdY
	+Qzx3Iy22ayl7Ni6C2+WDm2XjNsn0HtZrd1uAQGSnwe/uNMJHILiUaYb14F25Hmy0Hb0IxIohGE
	AW5i1rE63CLsjT/GHXUUu7wRf7jTEousEA0BInNPItMnLX8tRrzxw4fMg5+mW7yjbNk1q/LTBn8
	ReR9sgiYg1XymRs3l22/qFz0rUbr0vb47tOQRQRWdnzZQG
X-Received: by 2002:a05:6102:6c7:b0:7c1:8aa5:36d6 with SMTP id
 ada2fe7eead31-7cb372821a6mr2739066137.11.1791832654562; Mon, 12 Oct 2026
 12:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com>
In-Reply-To: <877bjmzqkr.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 13:17:23 -0600
X-Gm-Features: AclHuK_F8iNKqf1C4Ki3QntMVw0O_GSO7mPk67Uyart16gEEmw2VFpP4md4WlVw
Message-ID: <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_121736_028495_980C8D8D 
X-CRM114-Status: GOOD (  48.65  )
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMTowNuKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMTAvMjAyNiBhdCAxMjoyNjowMCAt
MDYsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gT24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMTI6MDLigK9QTSBNaXF1ZWwgUmF5bmFsCj4gPiA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBKYW1lcywKPiA+
Pgo+ID4+IE9uIDE0LzA5LzIwMjYgYXQgMTU6MDk6NDcgLTA2LCBKYW1lcyBIaWxsaWFyZCA8amFt
ZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiA+IEEgdGltZWQtb3V0IHdh
aXQgY2FuIHJldHVybiB3aGlsZSB0aGUgaW50ZXJydXB0IGhhbmRsZXIgaXMgc3RpbGwgdXNpbmcK
PiA+PiA+IHRoZSBwcmV2aW91cyBvcGVyYXRpb24ncyBpbnRlcnJ1cHQgc3RhdHVzIGFuZCBlbmFi
bGUgbWFzay4gU3RhcnRpbmcgdGhlCj4gPj4gPiBuZXh0IHdhaXQgY2FsbHMgaW5pdF9jb21wbGV0
aW9uKCkgb24gdGhlIHNhbWUgb2JqZWN0LCB3aGljaCBjYW4gcmVzZXQgaXRzCj4gPj4gPiB3YWl0
cXVldWUgbG9jayB3aGlsZSB0aGUgb2xkIGhhbmRsZXIgY2FsbHMgY29tcGxldGUoKS4gVGhlIG9s
ZCBoYW5kbGVyCj4gPj4gPiBjYW4gYWxzbyBjb21wbGV0ZSB0aGUgbmV3IHdhaXQgb3IgcmVzdG9y
ZSBhbiBvYnNvbGV0ZSBpbnRlcnJ1cHQgbWFzay4KPiA+PiA+Cj4gPj4gPiBJbml0aWFsaXplIHRo
ZSBjb21wbGV0aW9uIG9uY2UgaW4gcHJvYmUgYW5kIHVzZSByZWluaXRfY29tcGxldGlvbigpIGZv
cgo+ID4+ID4gZWFjaCBpbnRlcnJ1cHQtZHJpdmVuIHdhaXQuIE9uIHRpbWVvdXQsIGRpc2FibGUg
YW5kIHN5bmNocm9uaXplIHRoZSBJUlEKPiA+PiA+IGJlZm9yZSBtYXNraW5nIGNvbnRyb2xsZXIg
aW50ZXJydXB0cyBhbmQgYWNrbm93bGVkZ2luZyB0aGUgd2FpdGVkLWZvcgo+ID4+ID4gZXZlbnRz
LiBEcmFpbmluZyB0aGUgaGFuZGxlciBmaXJzdCBhbHNvIHByZXZlbnRzIGEgcGFydGlhbC1ldmVu
dCBoYW5kbGVyCj4gPj4gPiBmcm9tIHJld3JpdGluZyB0aGUgZW5hYmxlIG1hc2sgYWZ0ZXIgaXQg
aGFzIGJlZW4gY2xlYXJlZC4gRmx1c2ggdGhlc2UKPiA+PiA+IHJlZ2lzdGVyIHdyaXRlcyBiZWZv
cmUgcmUtZW5hYmxpbmcgdGhlIElSUSBsaW5lLCBsZWF2aW5nIHRoZSBjb250cm9sbGVyJ3MKPiA+
PiA+IGludGVycnVwdCBzb3VyY2VzIG1hc2tlZC4KPiA+PiA+Cj4gPj4gPiBGb3Igc3VjY2Vzc2Z1
bCB3YWl0cywgbW92ZSBjb21wbGV0ZSgpIGFmdGVyIHRoZSBoYW5kbGVyJ3MgcmVnaXN0ZXIgdXBk
YXRlcwo+ID4+ID4gc28gdGhhdCB0aGUgbmV4dCBvcGVyYXRpb24gY2Fubm90IHJhY2Ugd2l0aCB0
aG9zZSB1cGRhdGVzLiBLZWVwIHBvbGxpbmcKPiA+PiA+IHVuY2hhbmdlZCBhbmQgbGVhdmUgY29u
dHJvbGxlciBhbmQgRE1BIGFib3J0IGhhbmRsaW5nIHRvIHRoZSBleGlzdGluZwo+ID4+ID4gY2Fs
bGVycy4KPiA+PiA+Cj4gPj4gPiBGaXhlczogMWZlZjYyYzE0MjNiICgibXRkOiBuYW5kOiBhZGQg
c3VueGkgTkFORCBmbGFzaCBjb250cm9sbGVyIHN1cHBvcnQiKQo+ID4+ID4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPiA+PiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4+ID4gLS0tCj4gPj4KPiA+PiBTbyBmcm9tIHRoZSBj
b21taXQgbG9nIEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBhcmUgZml4aW5nIGEgcmFjZS4gVGhlCj4g
Pj4gcHJvYmxlbSBzZWVtcyBsZWdpdGltYXRlLgo+ID4+Cj4gPj4gPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3VueGlfbmFuZC5jIHwgMjYgKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiA+PiA+
ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+PiA+
Cj4gPj4KPiA+PiAuLi4KPiA+Pgo+ID4+ID4gQEAgLTQxNCwxMiArNDE2LDEzIEBAIHN0YXRpYyBp
cnFyZXR1cm5fdCBzdW54aV9uZmNfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+
PiA+ICAgICAgIGlmICghKGllbiAmIHN0KSkKPiA+PiA+ICAgICAgICAgICAgICAgcmV0dXJuIElS
UV9OT05FOwo+ID4+ID4KPiA+PiA+IC0gICAgIGlmICgoaWVuICYgc3QpID09IGllbikKPiA+PiA+
IC0gICAgICAgICAgICAgY29tcGxldGUoJm5mYy0+Y29tcGxldGUpOwo+ID4+ID4gLQo+ID4+ID4g
KyAgICAgLyogRmluaXNoIHVwZGF0aW5nIHRoZSBpbnRlcnJ1cHQgc3RhdGUgYmVmb3JlIHdha2lu
ZyB0aGUgbmV4dCBvcGVyYXRpb24uICovCj4gPj4gPiAgICAgICB3cml0ZWwoc3QgJiBORkNfSU5U
X01BU0ssIG5mYy0+cmVncyArIE5GQ19SRUdfU1QpOwo+ID4+ID4gICAgICAgd3JpdGVsKH5zdCAm
IGllbiAmIE5GQ19JTlRfTUFTSywgbmZjLT5yZWdzICsgTkZDX1JFR19JTlQpOwo+ID4+ID4KPiA+
PiA+ICsgICAgIGlmICgoaWVuICYgc3QpID09IGllbikKPiA+PiA+ICsgICAgICAgICAgICAgY29t
cGxldGUoJm5mYy0+Y29tcGxldGUpOwo+ID4+ID4gKwo+ID4+ID4gICAgICAgcmV0dXJuIElSUV9I
QU5ETEVEOwo+ID4+ID4gIH0KPiA+PiA+Cj4gPj4gPiBAQCAtNDM1LDE2ICs0MzgsMTkgQEAgc3Rh
dGljIGludCBzdW54aV9uZmNfd2FpdF9ldmVudHMoc3RydWN0IHN1bnhpX25mYyAqbmZjLCB1MzIg
ZXZlbnRzLAo+ID4+ID4gICAgICAgICAgICAgICB0aW1lb3V0X21zID0gTkZDX0RFRkFVTFRfVElN
RU9VVF9NUzsKPiA+PiA+Cj4gPj4gPiAgICAgICBpZiAoIXVzZV9wb2xsaW5nKSB7Cj4gPj4gPiAt
ICAgICAgICAgICAgIGluaXRfY29tcGxldGlvbigmbmZjLT5jb21wbGV0ZSk7Cj4gPj4gPiArICAg
ICAgICAgICAgIHJlaW5pdF9jb21wbGV0aW9uKCZuZmMtPmNvbXBsZXRlKTsKPiA+Pgo+ID4+IFRo
ZSB3aG9sZSBjaGFuZ2UgYXJvdW5kIChyZSlpbml0X2NvbXBsZXRpb24gbG9va3MgcmVsZXZhbnQg
KGhlcmUgYW5kIGluIHRoZSBoYW5kbGVyKS4KPiA+Pgo+ID4+ID4KPiA+PiA+ICAgICAgICAgICAg
ICAgd3JpdGVsKGV2ZW50cywgbmZjLT5yZWdzICsgTkZDX1JFR19JTlQpOwo+ID4+ID4gICAgICAg
ICAgICAgICByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJm5mYy0+Y29tcGxldGUs
Cj4gPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXNl
Y3NfdG9famlmZmllcyh0aW1lb3V0X21zKSk7Cj4gPj4gPiAtICAgICAgICAgICAgIGlmICghcmV0
KQo+ID4+ID4gKyAgICAgICAgICAgICBpZiAoIXJldCkgewo+ID4+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIC8qIERyYWluIHRoZSBoYW5kbGVyIGJlZm9yZSBpdCBjYW4gcmVzdG9yZSBhbiBvbGQg
SVJRIG1hc2suICovCj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgZGlzYWJsZV9pcnEobmZj
LT5pcnEpOwo+ID4+Cj4gPj4gZGlzYWJsZV9pcnEoKSBmb3Igc2VyaWFsaXppbmcgYWNjZXNzZXMg
dG8gYSBzaW5nbGUgcmVnaXN0ZXI/Cj4gPgo+ID4gVGhlIGludGVudGlvbiB3YXMgdG8gZHJhaW4g
YW4gaW4tZmxpZ2h0IGhhbmRsZXIgYmVmb3JlIGNsZWFuaW5nIHVwIHRoZQo+ID4gdGltZWQtb3V0
IHdhaXQsIHJhdGhlciB0aGFuIGp1c3Qgc2VyaWFsaXplIHRoZSByZWdpc3RlciB3cml0ZS4KPgo+
IEkgZ3Vlc3MgaGVyZSB5b3UgcmVsYXRlIHRvIHRoZSByYWNlIGV4cGxhaW5lZCBiZWxvdy4KPgo+
ID4gZGlzYWJsZV9pcnEoKSBwcm92aWRlcyB0aGF0IHN5bmNocm9uaXphdGlvbiBhcyB3ZWxsIGFz
IG1hc2tpbmcgdGhlIGxpbmUuCj4gPiBJdCBpcyBvbmx5IHVzZWQgb24gdGltZW91dCwgYW5kIHRo
aXMgSVJRIGlzIHJlcXVlc3RlZCB3aXRob3V0Cj4gPiBJUlFGX1NIQVJFRC4KPgo+IFRoaXMgaXMg
Y2xlYXJseSBkZWJhdGFibGUsIHNpbmNlIHdlIGNhbiBpZGVudGlmeSB0aGUgSVJRLCB0aGF0IGZs
YWcKPiBjb3VsZCAoc2hvdWxkLCBtYXliZSkgaGF2ZSBiZWVuIHNldC4gV2l0aCB5b3VyIGFwcHJv
YWNoIGl0IHdvdWxkIGhhdmUKPiBiZWVuIGV2ZW4gbW9yZSBpbXBhY3RpbmcuIEJ1dCB0aGF0J3Mg
bm90IHRoZSBwb2ludC4KCkFncmVlZC4gSSBtZW50aW9uZWQgdGhpcyB0byBkZXNjcmliZSB0aGUg
Y3VycmVudCByZWdpc3RyYXRpb24sIG5vdCB0bwpydWxlIG91dCBJUlEgc2hhcmluZy4KCj4gPiBB
IHNwaW5sb2NrIGNvdWxkIGFsc28gYWRkcmVzcyB0aGlzLCBwcm92aWRlZCBpdCBjb3ZlcnMgdGhl
IGhhbmRsZXIncwo+ID4gc3RhdHVzL2VuYWJsZSByZWFkcyB0aHJvdWdoIGNvbXBsZXRlKCksIHRv
Z2V0aGVyIHdpdGggdGhlIHdhaXRlcidzCj4gPiBjbGVhbnVwIGFuZCByZWFybWluZy4gUHJvdGVj
dGluZyBvbmx5IHRoZSByZWdpc3RlciB3cml0ZXMgd291bGQgbGVhdmUKPiA+IHRoZSBoYW5kbGVy
IGFibGUgdG8gYWN0IG9uIGFuIG9sZCBzbmFwc2hvdC4KPgo+IEknbSBub3Qgc3VyZSB3aGF0IHlv
dSBjYWxsICJvbmx5IHRoZSByZWdpc3RlciB3cml0ZXMiLCB5b3UgY2FuIGNhbGwKPiBjb21wbGV0
ZSgpIGZyb20gd2l0aGluIHRoZSBsb2NrIGlmIHRoYXQgbWFrZXMgc2Vuc2UgZm9yIHRoaXMgY2Fz
ZSwKPiB5ZXMuIGNvbXBsZXRlKCkgZG9lcyBub3QgYmxvY2sgc28gaXQgaXMgZmluZS4KClllcywg
YWdyZWVkLiBJIG1lYW50IHRoYXQgcHJvdGVjdGluZyBqdXN0IHRoZSB3cml0ZWwoKSBjYWxscyB3
b3VsZCBsZWF2ZQp0aGUgc25hcHNob3QgdW5wcm90ZWN0ZWQuIEEgbG9jayBjb3ZlcmluZyB0aGUg
aGFuZGxlcidzIHN0L2llbiByZWFkcwp0aHJvdWdoIHRoZSByZWdpc3RlciB1cGRhdGVzIGFuZCBj
b21wbGV0ZSgpLCB3aXRoIG1hdGNoaW5nIHByb3RlY3Rpb24KaW4gdGhlIHdhaXRlcidzIGNsZWFu
dXAgYW5kIHJlYXJtaW5nLCB3b3VsZCBhZGRyZXNzIHRoYXQuCgo+Cj4gLi4uCj4KPiA+PiBjb21t
aXQgbG9nLCBJIG5vdyBkaXNhZ3JlZSB3aXRoIHRoZSBmaXJzdCBwYXJ0IG9mOgo+ID4+Cj4gPj4g
PlRoZSBvbGQgaGFuZGxlciBjYW4gYWxzbyBjb21wbGV0ZSB0aGUgbmV3IHdhaXQgb3IgcmVzdG9y
ZSBhbiBvYnNvbGV0ZSBpbnRlcnJ1cHQgbWFzay4KPiA+Pgo+ID4+ICJjb21wbGV0ZSB0aGUgbmV3
IHdhaXQiPyBJIGRvbid0IHNlZSBob3cgYSBzdGFsZSBoYW5kbGVyIGNvbXBsZXRlcyB0aGUKPiA+
PiBuZXh0IHdhaXQgZ2l2ZW4gdGhlIGhhbmRsZXIgaXMgYSBoYXJkIElSUSBhbmQgdGhlIGludGVy
cnVwdCBlbmFibGUKPiA+PiByZWdpc3RlciBpcyBjbGVhcmVkIG9uIHRpbWVvdXQuCj4gPgo+ID4g
VGhlIGNhc2UgSSBoYWQgaW4gbWluZCBpcyBhbiBhbHJlYWR5LXJ1bm5pbmcgaGFuZGxlciBvbiBh
bm90aGVyIENQVToKPiA+Cj4gPiBDUFUgMDogUmVhZCBzdCBhbmQgaWVuIGZvciBvcGVyYXRpb24g
QS4KPiA+IENQVSAxOiBUaW1lIG91dCBvcGVyYXRpb24gQSwgbWFzay9hY2tub3dsZWRnZSBpdHMg
aW50ZXJydXB0cywKPiA+ICAgICAgICB0aGVuIGV2ZW50dWFsbHkgcmVpbml0aWFsaXplIHRoZSBj
b21wbGV0aW9uIGZvciBvcGVyYXRpb24gQi4KPiA+IENQVSAwOiBDYWxsIGNvbXBsZXRlKCkgYmFz
ZWQgb24gdGhlIHNhdmVkIHN0IGFuZCBpZW4gZnJvbSBvcGVyYXRpb24gQS4KPgo+IEZvciB0aGlz
IHRvIGZpcmUsIHRoZSBoYXJkIElSUSBoYW5kbGVyIG9uIENQVTAgd291bGQgaGF2ZSB0byBiZSBz
dG9wcGVkCj4gYmV0d2VlbiByZWFkaW5nIHN0L2llbiBhbmQgY2FsbGluZyBjb21wbGV0ZSgpIGxv
bmcgZW5vdWdoIHRvIHNwYW46Cj4gLSBBJ3MgdGltZW91dAo+IC0gQSdzIGNsZWFudXAKPiAtIEIn
cyB3YWl0IGJlaW5nIHJlYXJtZWQKPiBPbiB0aGlzIGhhcmR3YXJlLCBob3cgaXMgdGhpcyByZWFj
aGFibGU/CgpDT05GSUdfUFJFRU1QVF9SVCBwcm92aWRlcyBhIGNvbmNyZXRlIG1lY2hhbmlzbS4g
VGhlIGRyaXZlciByZXF1ZXN0cyB0aGlzCklSUSB3aXRoIGZsYWdzID0gMCwgd2l0aG91dCBJUlFG
X05PX1RIUkVBRCwgc28gdGhlIGhhbmRsZXIgaXMKZm9yY2VkLXRocmVhZGVkLiBBIGhpZ2hlci1w
cmlvcml0eSB0YXNrIGNhbiBwcmVlbXB0IHRoYXQgSVJRIHRocmVhZAphZnRlciBpdCByZWFkcyBz
dC9pZW46CgpDUFUwOiBUaGUgSVJRIHRocmVhZCByZWFkcyBzdC9pZW4gZm9yIEEgYW5kIGlzIHRo
ZW4gcHJlZW1wdGVkLgpDUFUxOiBBJ3Mgd2FpdCB0aW1lcyBvdXQsIHBlcmZvcm1zIGNsZWFudXAs
IGFuZCBldmVudHVhbGx5IHJlaW5pdGlhbGl6ZXMKICAgIHRoZSBjb21wbGV0aW9uIGFuZCByZWFy
bXMgdGhlIHdhaXQgZm9yIEIuCkNQVTA6IFRoZSBJUlEgdGhyZWFkIHJlc3VtZXMgYW5kIGNhbGxz
IGNvbXBsZXRlKCkgdXNpbmcgQSdzIHNuYXBzaG90LgoKQ2xlYXJpbmcgdGhlIGNvbnRyb2xsZXIn
cyBpbnRlcnJ1cHQtZW5hYmxlIHJlZ2lzdGVyIG9uIENQVTEgZG9lcyBub3QKY2FuY2VsIHRoZSBy
dW5uaW5nIElSUSB0aHJlYWQgb3IgaW52YWxpZGF0ZSBpdHMgc2F2ZWQgdmFsdWVzLiBUaGUgbGF0
ZQpjb21wbGV0ZSgpIHRoZXJlZm9yZSBhY3RzIG9uIHRoZSBjb21wbGV0aW9uIG5vdyBiZWluZyB1
c2VkIGZvciBCLgoKVGhpcyBkb2VzIG5vdCByZXF1aXJlIGEgcHJvbG9uZ2VkIG5vbi1wcmVlbXB0
aWJsZSBoYXJkIElSUSBvciBhIGhhcmR3YXJlCnN0YWxsLgoKPgo+ID4gQ2xlYXJpbmcgdGhlIGRl
dmljZSdzIGVuYWJsZSByZWdpc3RlciBkb2VzIG5vdCBpbnZhbGlkYXRlIHRob3NlIGxvY2FsCj4g
PiB2YWx1ZXMgb3Igd2FpdCBmb3IgdGhlIHJ1bm5pbmcgaGFuZGxlciB0byBmaW5pc2guIEhhcmQt
SVJRIGNvbnRleHQKPiA+IHByZXZlbnRzIHRoaXMgb3ZlcmxhcCBvbiB0aGUgc2FtZSBDUFUsIGJ1
dCBub3QgYWNyb3NzIENQVXMuCj4gPgo+ID4gVGhhdCBkaXN0aW5jdGlvbiB3YXMgbm90IGV4cGxp
Y2l0IGVub3VnaCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEknbQo+ID4gb3BlbiB0byBhIGRpZmZl
cmVudCBpbXBsZW1lbnRhdGlvbjsgdGhlIHJlcXVpcmVtZW50IEkgd2FudGVkIHRvIHByZXNlcnZl
Cj4gPiBpcyB0aGF0IHRoZSBvbGQgaGFuZGxlciBjYW5ub3QgdXBkYXRlIHRoZSBtYXNrIG9yIHNp
Z25hbCB0aGUgY29tcGxldGlvbgo+ID4gYWZ0ZXIgdGhlIHdhaXRlciBoYXMgY2xlYW5lZCB1cCBh
bmQgcmV1c2VkIGl0Lgo+Cj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
