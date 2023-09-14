Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5A6EDE999
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1AoyvVrN5aucL7DOh0Hp+QWIHeB8MvJyRbXezjjQCc=; b=k6KTf70DcfD9KY
	/IHTNVaqot21ERtptg/7hjX+Fl+zY3TKFsH7WI1AUxUez0POqiWoOL7NhIonV9PWpOkT8bSsK0nn9
	jSKC0I3lnFsEkKqi14K/gaU+K++uRHG2ZA1x2xmMv0uWu3TXrEJJamEFjh9LP+02I6cgayze3KT21
	wPO3T3aURAyO34W0KkgYFwh4mnD4fYE+Elv1SIJm5K/uJ+1bHNgo9XEMG1uapfmJjxkQLUPfN5JkP
	y2Cl6YiqhE+YsNFLz3PKJ//5+GSbhbvnUklSuqa5NbUei1BcYpUcsDLpmtQfiRNuMN/cYhWwwOLIx
	8xVSSvcV7TCUbt7Xtbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiGq-007n9x-1d;
	Thu, 14 Sep 2023 09:04:20 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiGn-007n8T-1E
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 09:04:18 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59b4ec8d9c1so8231557b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 02:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694682255; x=1695287055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a0Jqp0D2IpesFGOA6dYiH9gV5DAqCzpujbuRfGHv2E=;
        b=eaaD5AED6Ciyb6JWlhpYPVHDytsOr4M0U8l8yV6u88jrJdYQJC75GJcCEAZj7YAwGU
         lBWO5bQEtvOyh3loPD+wdNWxiuSUCmgUmlNx/Vz5AZBM4MYBh4fvhEAFRUxdwkp1FDx8
         03Of44Pr6/iPVG3rryxZJEpSc8B6Yshmppw1aix+cK1xHriwbZ1RMzyZUh/jLtuf2LIe
         MQMTi8hEGDh6Zfd1tUfjlOGn23N26kgL59EWGcqFJyV32vXELiKDQP/RGt+GeDkVW/TW
         GiM0eUNSwtXy4zzhikY2WlXwznBAfr+o+rVkzNJwb68nBI7VwIi+kqAKtfeFYtJKVAji
         mBfg==
X-Gm-Message-State: AOJu0YxhNFbyDFUNUz0OYjv0HInkQjpP7/81M/p0ihjhSpIMRJetxlII
	GQ3sPA5ff6ZIuw4Mb6VJ4Ds3kjFjRCE4YQ==
X-Google-Smtp-Source: AGHT+IEC1QeJzSxLbIb3SngUS/f5bsWXP/nWGUQyiFe598V5I0hLOv9e+I/oyzkzt/4FZcfpkEjksg==
X-Received: by 2002:a81:4428:0:b0:59b:fe73:debc with SMTP id r40-20020a814428000000b0059bfe73debcmr74691ywa.0.1694682254747;
        Thu, 14 Sep 2023 02:04:14 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id p188-20020a0dcdc5000000b005777a2c356asm225978ywd.65.2023.09.14.02.04.13
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 02:04:14 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59bdad64411so7956527b3.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 02:04:13 -0700 (PDT)
X-Received: by 2002:a25:820a:0:b0:d11:2a52:3f35 with SMTP id
 q10-20020a25820a000000b00d112a523f35mr5026791ybk.20.1694682253700; Thu, 14
 Sep 2023 02:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org> <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
 <20230914105937.4af00bf2@xps-13>
In-Reply-To: <20230914105937.4af00bf2@xps-13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2023 11:04:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
Message-ID: <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_020417_422308_21714FC0 
X-CRM114-Status: GOOD (  37.96  )
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

SGkgTWlxdWVsLAoKT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6NTnigK9BTSBNaXF1ZWwgUmF5
bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiBnZWVydEBsaW51eC1tNjhr
Lm9yZyB3cm90ZSBvbiBUaHUsIDE0IFNlcCAyMDIzIDEwOjM0OjUwICswMjAwOgo+ID4gT24gVGh1
LCBTZXAgMTQsIDIwMjMgYXQgMTA6MDjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPiA8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4gT24gMzAvMDgvMjAyMyAx
NzoxOCwgQmlqdSBEYXMgd3JvdGU6Cj4gPiA+ID4+PiAgICAgICAgICAgICAgICAgcmVnbWFwX3Vw
ZGF0ZV9iaXRzKHJwYy0+cmVnbWFwLCBSUENJRl9DTU5DUiwgQEAgLTc3NCw2Cj4gPiA+ID4+PiAr
Nzc2LDEyIEBAIHN0YXRpYyBpbnQgcnBjaWZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiA+ID4gPj4+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+Pj4gICAg
ICAgICB9Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gKyAgICAgICBpZiAocnBjLT5pbmZvLT50eXBlID09
IFJQQ0lGX1JaX0cyTCAmJgo+ID4gPiA+Pgo+ID4gPiA+PiBXb3VsZG4ndCB0aGlzIGFwcGx5IHRv
IG5vbi1SWi9HMkwgc3lzdGVtcywgdG9vPwo+ID4gPiA+Cj4gPiA+ID4gSXQgYXBwbGllcywgaWYg
dGhlIGRldmljZSB1c2VzIHRoZSBmbGFzaFsxXSBvciBbMl0gYW5kIGl0IG5lZWRzCj4gPiA+ID4g
NC1iaXQgdHggc3VwcG9ydC4KPiA+ID4gPgo+ID4gPiA+IFsxXSBGaWd1cmUgMjA6IFFVQUQgSU5Q
VVQvT1VUUFVUIEZBU1QgUkVBRCDigJMgRUJoL0VDaAo+ID4gPiA+IGh0dHBzOi8vbWVkaWEtd3d3
Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRh
LXNoZWV0L25vci1mbGFzaC9zZXJpYWwtbm9yL210MjVxL2RpZS1yZXYtYS9tdDI1cV9xbGtzX3Vf
NTEyX2FiYV8wLnBkZj9yZXY9M2U1YjJhNTc0ZjdiNDc5MGI2ZTU4ZGFjZjRjODg5YjIKPiA+ID4g
Pgo+ID4gPiA+IFsyXSBzZWN0aW9uIDguMTQKPiA+ID4gPgo+ID4gPiA+IGh0dHBzOi8vd3d3LnJl
bmVzYXMuY29tL2V1L2VuL2RvY3VtZW50L2RzdC9hdDI1cWwxMjhhLWRhdGFzaGVldD9yPTE2MDg1
ODYKPiA+ID4KPiA+ID4gR2VlcnQsCj4gPiA+Cj4gPiA+IERvZXMgaXQgYW5zd2VyIHlvdXIgY29t
bWVudCBvciBkbyB5b3UgZXhwZWN0IGhlcmUgc29tZSBjaGFuZ2VzPwo+ID4KPiA+IFdlbGwsIG5v
dyBpdCBoYXMgYmVlbiBjb25maXJtZWQgdGhpcyBhcHBsaWVzIHRvIG5vbi1SWi9HMkwgc3lzdGVt
cywgdG9vLAo+ID4gdGhlIGNoZWNrIGZvciBSUENJRl9SWl9HMkwgc2hvdWxkIHByb2JhYmx5IGJl
IHJlbW92ZWQuICBJbiB1cHN0cmVhbSwKPiA+IG9ubHkgYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzJseyxjfS1zbWFyYy1zb20uZHRzaSBoYXZlIGRldmljZXMKPiA+IHRoYXQgYXJlIGNv
bXBhdGlibGUgd2l0aCAibWljcm9uLG10MjVxdTUxMmEiLCBidXQgb2J2aW91c2x5IHRoZXkgY2Fu
Cj4gPiBhcHBlYXIgZWxzZXdoZXJlLCB0b28uCj4gPgo+ID4gTm93LCB0aGUgcHJlc2VuY2Ugb2Yg
dGhhdCBjb21wYXRpYmxlIHZhbHVlIGluIHJ6ZzJseyxjfS1zbWFyYy1zb20uZHRzaQo+ID4gY3Vy
cmVudGx5IGNhdXNlcyBhIGR0YnNfY2hlY2sgd2FybmluZywgYXMgaXQgaXMgbm90IGRvY3VtZW50
ZWQuCj4gPiBIb3dldmVyLCB0aGVyZSBoYXMgYmVlbiBzb21lIHB1c2hiYWNrIGFnYWluc3QgYWRk
aW5nIG1vcmUgY29tcGF0aWJsZQo+ID4gdmFsdWVzLCBjZnIuIG15IHBhdGNoIHRvIGFkZCBtdDI1
cXU1MTJhWzFdLCBhbmQgTWlxdWVsJ3MgY29tbWl0IFsyXS4KPgo+IEp1c3QgRllJLCBJIHNlbnQg
WzJdIGFmdGVyIGFuIHVuc3VjY2Vzc2Z1bCBhdHRlbXB0IHRvIHVwZGF0ZSB0aGF0IGxpc3QKPiB0
b28sIHNlZSBbM10uIFRoZSBpZGVhIGlzOiBpZiB5b3UgZG9uJ3QgaGF2ZSBhbnl0aGluZyB1c2Vm
dWwgdG8gYWRkLAoKT2gsIEkgZGlkbid0IGtub3cgdGhhdC4KCj4ganVzdCB1c2UgdGhlIGdlbmVy
aWMgY29tcGF0aWJsZS4gSWYgeW91IG5lZWQgc3BlY2lmaWMgY2hhbmdlcywgeW91IGNhbgo+IGFk
ZCBhbiBlbnRyeS4KClRoZSBwcm9ibGVtIGlzIHRoYXQgdXN1YWxseSB0aGVzZSB0aGluZ3MgYXJl
IGRpc2NvdmVyZWQgdG9vIGxhdGUsCnNvIHRoZSBvbmx5IHBydWRlbnQgd2F5IGlzIHRvIGJlIHBy
b2FjdGl2ZSwgYW5kIGFsd2F5cyBhZGQgdGhlbS4KSW5pdGlhbGx5IEkgdGhvdWdodCB0aGF0IHRo
ZSBkaWZmZXJlbnQgaGFuZGxpbmcgb24gUlovRzJMIHdhcyBkdWUKdG8gYSBkaWZmZXJlbmNlIGlu
IHRoZSBSUEMtSUYgYmxvY2suICBCdXQgbm93IHdlIGtub3cgaXQncyBkdWUgdG8gdGhlCnR5cGUg
b2YgRkxBU0ggYXR0YWNoZWQuCgo+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
dGQvZDgxNjQ5OWUtYmFhYi02MjAwLTA3ODAtMTdhODIwNWIyNTJlQGxpbmFyby5vcmcvCj4KPiA+
IEJ1dCB0aGUgaXNzdWUgQmlqdSBpcyBzZWVpbmcgcHJvdmVzIHRoZXJlIGlzIGEgbmVlZCB0byBh
ZGQgdGhlc2UuCj4gPgo+ID4gSW4gYWRkaXRpb24sIEkgaGFkIGhvcGVkIHRvIGdhdGhlciBzb21l
IGZlZWRiYWNrIG9yIGd1aWRhbmNlIGZyb20gdGhlCj4gPiBoeXBlcmJ1cyBhbmQvb3Igc3BpIHBl
b3BsZSwgYXMgaXNzdWVzIHcuci50LiBwaW4gc3RhdGVzIHdpbGwgZXZlbnR1YWxseQo+ID4gcG9w
IHVwIG9uIG90aGVyIHN5c3RlbXMsIHRvbywgYW5kIHRodXMgbWF5IG5lZWQgaGFuZGxpbmcgaW4g
dGhlIGNvcmUsCj4gPiBpbnN0ZWFkIG9mIGluIGVhY2ggaW5kaXZpZHVhbCBkZXZpY2UgZHJpdmVy
LiAgQnV0IG9mIGNvdXJzZSB0aGF0IGNhbgo+ID4gYmUgZG9uZSBsYXRlciwgd2hlbiB0aGUgbmVl
ZCBhcmlzZXMuCj4gPgo+ID4gVGhhbmtzIQo+ID4KPiA+IFsxXSAiW1BBVENIXSBkdC1iaW5kaW5n
czogbXRkOiBqZWRlYyxzcGktbm9yOiBEb2N1bWVudCBzdXBwb3J0IGZvcgo+ID4gbW9yZSBNVDI1
UVUgcGFydHMiCj4gPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzM2MzE4NjA3OWI0
MjY5ODkxMDczZjYyMGUzZTIzNTNjZjdkMjU1OWEuMTY2OTk4ODIzOC5naXQuZ2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmUKPiA+IFsyXSA0YjBjYjRlN2FiMmY3NzdjICgiZHQtYmluZGluZ3M6IG10ZDog
c3BpLW5vcjogY2xhcmlmeSB0aGUgbmVlZCBmb3IKPiA+IHNwaS1ub3IgY29tcGF0aWJsZXMiKS4K
Ci0tIApHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
