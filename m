Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ED1EDE99F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaMOCcjyyXNZc04d+UBtHjRv/IPhoRKcielHFzlPjuc=; b=Eq4LbPyOTKpfAa
	nbSmco3JyH1k2ivxGhFRi9gS2L81ijlVMCnmyAYZuvxRF8hMkFy7PqsV3vWrGV9BSmVOeP2W/ClNN
	bdQv1OsKDoi7V9fr06HIQ9xESq0sa4KvTubb7d3/j8R93E5z25eN5S0KA2nelR+7gyNwVI3WhKmlV
	KPuUBIOeP0/Rb6Ijq+oXcF+fh4tMWrSSMabQF1lj/aXffETM86xsE6h4o9mtjF72vuM9eZdBftRGu
	4mqafEM3VEAEc9WfhQSWRgs9rH+hYA2kJesFcUPr3lKEqxsoUfBxLTQSfx0X4jd89iH6gS0IxNGNq
	lfyC96F2VyRSKEzDcejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj4d-007tni-2b;
	Thu, 14 Sep 2023 09:55:47 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj4a-007tnC-2b
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 09:55:46 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59bc97d7b3dso21372107b3.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 02:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694685343; x=1695290143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dubvhEEU/vJD4l4Oom86kE1O6KwYjirs5KUVCSNEkoY=;
        b=q5AI6Oqz91yjN9C6npkh/HIeL6UVq8Lt43n6gmAWucVJzfyhdSe1vvJPE1zwZRSk/Y
         i356KiSfMtpmV2rHlcevBE+zCGY+2jLOiQ/NCuryhpsRdLw07r3rG60njq26LAUH1g4S
         EHDf8lTqSkGbCM+pVbNRcFxsqaXQ/wDK4+zqHGyeuApEODUKsH9z1CCar20P1hZ4pLd/
         fAgDVqEsen7MgeoEoywL4QqNi0dBMfpEHR0d570aMsnmQ1svn1QPXoBJCYBzI/9Uh3cq
         j1oB535WvvsBWTwE6Rk+Vf4YD0bokL3Atzc9/El0ZhVZC5pt4EnYLuhUGuBuh0R1yuJy
         q+gA==
X-Gm-Message-State: AOJu0Yxa0z1S2ujUY7FolgCSYQornxpo2U1Br7XxVoOQgb2PjyFMfuEC
	PzkrZWhEaYnXqGok4DR3PEHTae0nkVakUg==
X-Google-Smtp-Source: AGHT+IGYYpmniLlqdQyAHMXC6HAdavsh8+hpvmCLBse1cj09pVXh5HJe9CZtXLp9mR31J8drv41eUQ==
X-Received: by 2002:a81:91d3:0:b0:59b:52c2:5f15 with SMTP id i202-20020a8191d3000000b0059b52c25f15mr759962ywg.25.1694685343130;
        Thu, 14 Sep 2023 02:55:43 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id c80-20020a814e53000000b0057399b3bd26sm242030ywb.33.2023.09.14.02.55.42
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 02:55:42 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d8165e3b209so1926799276.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 02:55:42 -0700 (PDT)
X-Received: by 2002:a25:b34a:0:b0:d7b:a78e:6b2d with SMTP id
 k10-20020a25b34a000000b00d7ba78e6b2dmr939974ybg.20.1694685341843; Thu, 14 Sep
 2023 02:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org> <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
 <20230914105937.4af00bf2@xps-13> <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
 <20230914111200.6e6832ca@xps-13> <CAMuHMdVryt5bTk8HeFMS3NU-4EpQdU3Tf6LiGmGQQ5bVD-Emsg@mail.gmail.com>
 <OS0PR01MB5922B4BF11D1954DFBE2976F86F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922B4BF11D1954DFBE2976F86F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2023 11:55:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUA23VxkK-8CebyqiF=Oe81QZgpEmWmMrMGVd_+BXfsLA@mail.gmail.com>
Message-ID: <CAMuHMdUA23VxkK-8CebyqiF=Oe81QZgpEmWmMrMGVd_+BXfsLA@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025544_845387_0721AE70 
X-CRM114-Status: GOOD (  49.70  )
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

SGkgQmlqdSwKCk9uIFRodSwgU2VwIDE0LCAyMDIzIGF0IDExOjM34oCvQU0gQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToKPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEZpeCBJTyBzdGF0ZSBiYXNlZCBvbiBmbGFzaAo+ID4g
dHlwZQo+ID4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTE6MTLigK9BTSBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gd3JvdGU6Cj4gPiA+IGdlZXJ0QGxpbnV4
LW02OGsub3JnIHdyb3RlIG9uIFRodSwgMTQgU2VwIDIwMjMgMTE6MDQ6MDEgKzAyMDA6Cj4gPiA+
ID4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6NTnigK9BTSBNaXF1ZWwgUmF5bmFsCj4gPiA+
ID4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiA+ID4gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcgd3JvdGUgb24gVGh1LCAxNCBTZXAgMjAyMyAxMDozNDo1MCArMDIwMDoKPiA+
ID4gPiA+ID4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6MDjigK9BTSBLcnp5c3p0b2YgS296
bG93c2tpCj4gPiA+ID4gPiA+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4gPiA+ID4gPiA+IE9uIDMwLzA4LzIwMjMgMTc6MTgsIEJpanUgRGFzIHdyb3RlOgo+ID4g
PiA+ID4gPiA+ID4+PiAgICAgICAgICAgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHJwYy0+cmVn
bWFwLAo+ID4gPiA+ID4gPiA+ID4+PiBSUENJRl9DTU5DUiwgQEAgLTc3NCw2Cj4gPiA+ID4gPiA+
ID4gPj4+ICs3NzYsMTIgQEAgc3RhdGljIGludCBycGNpZl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlCj4gPiA+ID4gPiA+ID4gPj4+ICsqcGRldikKPiA+ID4gPiA+ID4gPiA+Pj4gICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gPiA+ID4gPj4+ICAgICAgICAgfQo+ID4gPiA+
ID4gPiA+ID4+Pgo+ID4gPiA+ID4gPiA+ID4+PiArICAgICAgIGlmIChycGMtPmluZm8tPnR5cGUg
PT0gUlBDSUZfUlpfRzJMICYmCj4gPiA+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4gPiA+PiBXb3Vs
ZG4ndCB0aGlzIGFwcGx5IHRvIG5vbi1SWi9HMkwgc3lzdGVtcywgdG9vPwo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IEl0IGFwcGxpZXMsIGlmIHRoZSBkZXZpY2UgdXNlcyB0aGUgZmxh
c2hbMV0gb3IgWzJdIGFuZCBpdAo+ID4gPiA+ID4gPiA+ID4gbmVlZHMgNC1iaXQgdHggc3VwcG9y
dC4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBHZWVydCwKPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IERvZXMgaXQgYW5zd2VyIHlvdXIgY29tbWVudCBvciBk
byB5b3UgZXhwZWN0IGhlcmUgc29tZSBjaGFuZ2VzPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBX
ZWxsLCBub3cgaXQgaGFzIGJlZW4gY29uZmlybWVkIHRoaXMgYXBwbGllcyB0byBub24tUlovRzJM
Cj4gPiA+ID4gPiA+IHN5c3RlbXMsIHRvbywgdGhlIGNoZWNrIGZvciBSUENJRl9SWl9HMkwgc2hv
dWxkIHByb2JhYmx5IGJlCj4gPiA+ID4gPiA+IHJlbW92ZWQuICBJbiB1cHN0cmVhbSwgb25seQo+
ID4gPiA+ID4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmx7LGN9LXNtYXJjLXNv
bS5kdHNpIGhhdmUKPiA+ID4gPiA+ID4gZGV2aWNlcyB0aGF0IGFyZSBjb21wYXRpYmxlIHdpdGgg
Im1pY3JvbixtdDI1cXU1MTJhIiwgYnV0IG9idmlvdXNseQo+ID4gdGhleSBjYW4gYXBwZWFyIGVs
c2V3aGVyZSwgdG9vLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBOb3csIHRoZSBwcmVzZW5jZSBv
ZiB0aGF0IGNvbXBhdGlibGUgdmFsdWUgaW4KPiA+ID4gPiA+ID4gcnpnMmx7LGN9LXNtYXJjLXNv
bS5kdHNpIGN1cnJlbnRseSBjYXVzZXMgYSBkdGJzX2NoZWNrIHdhcm5pbmcsIGFzCj4gPiBpdCBp
cyBub3QgZG9jdW1lbnRlZC4KPiA+ID4gPiA+ID4gSG93ZXZlciwgdGhlcmUgaGFzIGJlZW4gc29t
ZSBwdXNoYmFjayBhZ2FpbnN0IGFkZGluZyBtb3JlCj4gPiA+ID4gPiA+IGNvbXBhdGlibGUgdmFs
dWVzLCBjZnIuIG15IHBhdGNoIHRvIGFkZCBtdDI1cXU1MTJhWzFdLCBhbmQgTWlxdWVsJ3MKPiA+
IGNvbW1pdCBbMl0uCj4gPiA+ID4gPgo+ID4gPiA+ID4gSnVzdCBGWUksIEkgc2VudCBbMl0gYWZ0
ZXIgYW4gdW5zdWNjZXNzZnVsIGF0dGVtcHQgdG8gdXBkYXRlIHRoYXQKPiA+ID4gPiA+IGxpc3Qg
dG9vLCBzZWUgWzNdLiBUaGUgaWRlYSBpczogaWYgeW91IGRvbid0IGhhdmUgYW55dGhpbmcgdXNl
ZnVsCj4gPiA+ID4gPiB0byBhZGQsCj4gPiA+ID4KPiA+ID4gPiBPaCwgSSBkaWRuJ3Qga25vdyB0
aGF0Lgo+ID4gPiA+Cj4gPiA+ID4gPiBqdXN0IHVzZSB0aGUgZ2VuZXJpYyBjb21wYXRpYmxlLiBJ
ZiB5b3UgbmVlZCBzcGVjaWZpYyBjaGFuZ2VzLCB5b3UKPiA+ID4gPiA+IGNhbiBhZGQgYW4gZW50
cnkuCj4gPiA+ID4KPiA+ID4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHVzdWFsbHkgdGhlc2UgdGhp
bmdzIGFyZSBkaXNjb3ZlcmVkIHRvbyBsYXRlLCBzbwo+ID4gPiA+IHRoZSBvbmx5IHBydWRlbnQg
d2F5IGlzIHRvIGJlIHByb2FjdGl2ZSwgYW5kIGFsd2F5cyBhZGQgdGhlbS4KPiA+ID4gPiBJbml0
aWFsbHkgSSB0aG91Z2h0IHRoYXQgdGhlIGRpZmZlcmVudCBoYW5kbGluZyBvbiBSWi9HMkwgd2Fz
IGR1ZSB0bwo+ID4gPiA+IGEgZGlmZmVyZW5jZSBpbiB0aGUgUlBDLUlGIGJsb2NrLiAgQnV0IG5v
dyB3ZSBrbm93IGl0J3MgZHVlIHRvIHRoZQo+ID4gPiA+IHR5cGUgb2YgRkxBU0ggYXR0YWNoZWQu
Cj4gPiA+Cj4gPiA+IEFjdHVhbGx5IHdoYXQgSSBzYXkgaXMgd3JvbmcsIHdlIGFyZSBub3Qgc3Vw
cG9zZWQgdG8gdG91Y2ggdGhhdCBsaXN0Cj4gPiA+IGFueW1vcmUgYW5kIHByZWZlciB0byBoYW5k
bGUgdGhlIGlzc3VlcyBpbiB0aGUgZHJpdmVycyBieQo+ID4gPiBhdXRvLWRpc2NvdmVyeS4gQ2Fu
J3Qgd2UgZG8gdGhhdCBpbiB5b3VyIGNhc2U/Cj4gPgo+ID4gSSdtIG5vdCBzdXJlIHdlIGNhbiBk
byB0aGF0LCBhcyB0aGlzIGNvZGUgaXMgcGFydCBvZiB0aGUgaGFyZHdhcmUKPiA+IGluaXRpYWxp
emF0aW9uIGR1cmluZyBwcm9iaW5nLgo+ID4gQmlqdTogaXMgdGhpcyBuZWVkZWQgdGhhdCBlYXJs
eSwgb3IgY2FuIGl0IGJlIGRvbmUgbGF0ZXIsIGFmdGVyIHRoZQo+ID4gY29ubmVjdGVkIGRldmlj
ZSBoYXMgYmVlbiBpZGVudGlmaWVkPwo+Cj4gSSBuZWVkIHRvIGNoZWNrIHRoYXQuCj4KPiBZb3Ug
bWVhbiBwYXRjaCBkcml2ZXJzL3NwaS9zcGktcnBjLWlmLmMKPiB0byBpZGVudGlmeSB0aGUgZmxh
c2ggdHlwZSBmcm9tIHNmZHAgaW5mbyBhbmQgcGFzcyBhcyBhIHBhcmFtZXRlciB0byBycGNpZl9o
d19pbml0Pz8KClNvbWV0aGluZyBsaWtlIHRoYXQuCgpUaGF0IGNvbmZpZ3VyYXRpb24gc2hvdWxk
IGJlIHNhdmVkIHNvbWV3aGVyZSwgYXMgcnBjaWZfaHdfaW5pdCgpIGlzCmFsc28gY2FsbGVkIGZy
b20gcnBjaWZfcmVzdW1lKCksIGFuZCB3aGVuIHJlY292ZXJpbmcgZnJvbSBhbiBlcnJvcgppbiBy
cGNpZl9tYW51YWxfeGZlcigpLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
