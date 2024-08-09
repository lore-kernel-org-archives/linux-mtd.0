Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2469C52D71
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2024 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxmTmkeGWkzGFwFycWRkgyHHXPZ54Galhj7S79b0ZjQ=; b=mazx+Z8Ii2jlws
	TWoTty2kuxllTfyMPmccdds1JP/wllHoI1dB/b8SjZWIW9+AynaZ9xsZzDGYUjjtMAn6kYa7IKlKz
	JOd6QLAiblcsa1qZyFj3PbvaSf8d5CA6x6+xXUdrmdmF2bKAddPafRkwNx26TpePbCSVhIEp17jPh
	EF74dP4GwM93/vdjtr4OTl74lj0b/IY7CSJ2yufymsDRxdzRC4bIVzK3fhxZ1FWDPI0rMaMPEY73G
	1pOqB77zBHpFpRwu1Hy3/Vu8xxtVC81NgxNgYOgOuv6cuJNjnd5gAvNSpUrwEAcTZAATVCKjZ2fjo
	lJWkjIgXclgK8Y/hoZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJQR-0000000ATAl-0j3A;
	Fri, 09 Aug 2024 06:48:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJQO-0000000AT9b-0v7F
	for linux-mtd@lists.infradead.org;
	Fri, 09 Aug 2024 06:48:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52f01afa11cso2085350e87.0
        for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2024 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723186110; x=1723790910; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awMllGHlNTMUHiAzNhHBD3WsHP+5NhEuahbeF4CxRz0=;
        b=cdV5v3kkMWNaAsn6QYUaYSLnYh4uBnKSM5DA2MAjdmzsvulOQPFF32ZEElrcX7kYaW
         I8qYzxHtRta05SmqYfJEKpfgYisZL6TE/4PyaZrS13UtC1PjuM7SjOv3LNZZtwCrWnUV
         WqiLTmauplj6Iin4kuXFjZtTfYtNj7xNTE45v16KB+SmarqiFtyDrNYczGY/v1HgrrIE
         UStBtc7Npga8FNQXRKYTC7kwKMUrQQZo68Q5ae0g4AlCfT6BhStBF8aY0ZlTAQvH5ZrM
         +qaU2fvZavlhIdZ4TqxTPYpKkqRTa1iUwfOt5Flrksvzu86L1T9UorHnN0wGw0uxiu0u
         bXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723186110; x=1723790910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awMllGHlNTMUHiAzNhHBD3WsHP+5NhEuahbeF4CxRz0=;
        b=fk+TEXgM25+ejoPG6qtrTO26Invh3J5GVmlhB2Gi5TEBwI/oXNcIYT3TNkCb3Dfo+Z
         XtRrh/vjDmE05m0mil8HqSQeOstPrWOnQ4GMGvYkEsEnlNu18EZux8xeZwSu6KDsnkjw
         a4eihcVaCY6hzb3vJH5hZZ+4+CdUmlcV4GpZQPY1/L9q28htQxPG7GPwPQRAuw9lOLaK
         5dJV/3SOu6dFRuGp9DETdr3RdT/oMHCNNmaSIe/xfjeVguUhHaY/it1Gn0sDqOtN2XS2
         YM9awU6nlsrfmFCGjzHHAQw8hU9hzQIfHfiAMCfUew81znfucsPk6FacmSt+8a3HSS96
         9+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUUAe0juLKT5fBOUedvg2wtv4gZGXF3s8JnPFfMtXKx7ztvuFT7VSxjRATSaemzV/lb6ckLKJ/I1E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxSDIV5N+G6zao0uiema1WTC+Ta+fowPNfzsKZA6hHOeOHAHlM
	xdwFe2E5Mef3W5orwiIjtO80RebINu8AFYW2pz/SEpAHCEIwnZ6aYRokyghxF8kKncx3YP+L9pz
	pQonnQzv4SIS4qY5P0vwoMx7bUtc=
X-Google-Smtp-Source: AGHT+IGQ8eJlZAkFtH4sp8+WWj+e/9OZ+apcotabpI+LPBGrb62fWRUl6dC49ZcDGOav+iLDtIT4xNIGPjMag4piiGY=
X-Received: by 2002:a05:6512:6c4:b0:530:b76c:65df with SMTP id
 2adb3069b0e04-530ee99ce52mr332804e87.35.1723186109447; Thu, 08 Aug 2024
 23:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com> <20240808-backyard-unglue-3cf429ad8da5@spud>
In-Reply-To: <20240808-backyard-unglue-3cf429ad8da5@spud>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 9 Aug 2024 14:47:53 +0800
Message-ID: <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Conor Dooley <conor@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_234832_286694_1EB5D7A4 
X-CRM114-Status: GOOD (  27.50  )
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

T24gVGh1LCBBdWcgOCwgMjAyNCBhdCAxMTozN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAwOCwgMjAyNCBhdCAwNzoyMjoxOVBNICsw
ODAwLCBLZWd1YW5nIFpoYW5nIHZpYSBCNCBSZWxheSB3cm90ZToKPiA+IEZyb206IEtlZ3Vhbmcg
WmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPgo+ID4KPiA+IEFkZCBkZXZpY2V0cmVlIGJp
bmRpbmcgZG9jdW1lbnQgZm9yIExvb25nc29uLTEgTkFORCBDb250cm9sbGVyLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiBDaGFuZ2VzIGluIHY4Ogo+ID4gLSBBZGQgYSBkZXNjcmlwdGlvbiBwYXJ0Lgo+ID4g
LSBBZGp1c3QgdGhlIGNvbXBhdGlibGUgYmVjYXVzZSB0aGUgbWF0Y2ggZGF0YSBmb3IgbHMxYy1u
ZmMgZGlmZmVycyBmcm9tIGxzMWItbmZjLgo+ID4gLSBNYXJrICduYW5kLXVzZS1zb2Z0LWVjYy1l
bmdpbmUnIGFuZCAnbmFuZC1lY2MtYWxnbycgYXMgbWFuZGF0b3J5Lgo+ID4gLSBEZWxldGUgdGhl
IHN1cGVyZmx1b3VzIGJsYW5rIGxpbmVzLgo+ID4KPiA+IENoYW5nZXMgaW4gdjc6Cj4gPiAtIHJl
bmFtZSB0aGUgZmlsZSB0byBsb29uZ3NvbixsczFiLW5mYy55YW1sCj4gPgo+ID4gQ2hhbmdlcyBp
biB2NjoKPiA+IC0gQSBuZXdseSBhZGRlZCBwYXRjaAo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2xvb25nc29uLGxzMWItbmZjLnlhbWwgfCA3NSArKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9sb29uZ3Nv
bixsczFiLW5mYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9s
b29uZ3NvbixsczFiLW5mYy55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi43Y2UzMzUzMjRhMjkKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbG9vbmdzb24sbHMxYi1uZmMueWFt
bAo+Cj4gV2hlbiBJIGZpcnN0IHJlYWQgIm5mYyIgaGVyZSBJIHRob3VnaHQgaXQgd2FzIGEgY29w
eS1wYXN0ZSBtaXN0YWtlLCBhcwo+ICJuZmMiIGlzIGEgdGVjaG5vbG9neSBvZiBpdCdzIG93bi4g
SSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHJlbmFtZQo+IHRvICJsb29uZ3NvbixsczFi
LW5hbmQtY29udHJvbGxlciIgZXRjIHRvIHJlbW92ZSB0aGF0IHNvcnQgb2YgY29uZnVzaW9uLgo+
IFRoZXNlIGRldmljZXMgbWlnaHQgbm90IGltcGxlbWVudCBORkMsIGJ1dCB3aGF0J3MgdG8gc2F5
IHRoYXQgYSBmdXR1cmUKPiBkZXZpY2Ugd2lsbCBub3Q/Cj4KU29ycnkgZm9yIHRoZSBjb25mdXNp
b24uClRoZSBzdHJpbmcgImxvb25nc29uLGxzMWItbmFuZC1jb250cm9sbGVyIiBtaWdodCBiZSB0
b28gbG9uZy4KTWF5IEkgcmVuYW1lIGl0IHRvICJsb29uZ3NvbixsczFiLW5hbmQiPwoKPiBDaGVl
cnMsCj4gQ29ub3IuCj4KPiA+IEBAIC0wLDAgKzEsNzUgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIK
PiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9sb29u
Z3NvbixsczFiLW5mYy55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBMb29uZ3Nvbi0xIE5BTkQg
Q29udHJvbGxlcgo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBLZWd1YW5nIFpoYW5n
IDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+Cj4g
VGhpcyB8IGlzIG5vdCBuZWVkZWQuCj4KV2lsbCByZW1vdmUgfC4KVGhhbmtzIQoKPiA+ICsgIFRo
ZSBMb29uZ3Nvbi0xIE5BTkQgY29udHJvbGxlciBhYnN0cmFjdHMgYWxsIHN1cHBvcnRlZCBvcGVy
YXRpb25zLAo+ID4gKyAgbWVhbmluZyBpdCBkb2VzIG5vdCBzdXBwb3J0IGxvdy1sZXZlbCBhY2Nl
c3MgdG8gcmF3IE5BTkQgZmxhc2ggY2hpcHMuCj4gPiArICBNb3Jlb3ZlciwgdGhlIGNvbnRyb2xs
ZXIgaXMgcGFpcmVkIHdpdGggdGhlIERNQSBlbmdpbmUgdG8gcGVyZm9ybQo+ID4gKyAgUkVBRCBh
bmQgUFJPR1JBTSBmdW5jdGlvbnMuCj4gPiArCj4gPiArYWxsT2Y6Cj4gPiArICAtICRyZWY6IG5h
bmQtY29udHJvbGxlci55YW1sCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGli
bGU6Cj4gPiArICAgIG9uZU9mOgo+ID4gKyAgICAgIC0gZW51bToKPiA+ICsgICAgICAgICAgLSBs
b29uZ3NvbixsczFiLW5mYwo+ID4gKyAgICAgICAgICAtIGxvb25nc29uLGxzMWMtbmZjCj4gPiAr
ICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBlbnVtOgo+ID4gKyAgICAgICAgICAgICAg
LSBsb29uZ3NvbixsczFhLW5mYwo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBsb29uZ3NvbixsczFi
LW5mYwo+ID4gKwo+ID4gKyAgcmVnOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAg
ZG1hczoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIGRtYS1uYW1lczoKPiA+ICsg
ICAgY29uc3Q6IHJ4dHgKPiA+ICsKPiA+ICtwYXR0ZXJuUHJvcGVydGllczoKPiA+ICsgICJebmFu
ZEBbMC0zXSQiOgo+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+ICsgICAgJHJlZjogcmF3LW5hbmQt
Y2hpcC55YW1sCj4gPiArCj4gPiArICAgIHJlcXVpcmVkOgo+ID4gKyAgICAgIC0gbmFuZC11c2Ut
c29mdC1lY2MtZW5naW5lCj4gPiArICAgICAgLSBuYW5kLWVjYy1hbGdvCj4gPiArCj4gPiArICAg
IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsg
IC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gZG1hcwo+ID4gKyAgLSBkbWEtbmFt
ZXMKPiA+ICsKPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhh
bXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgbmFuZC1jb250cm9sbGVyQDFmZTc4MDAwIHsKPiA+
ICsgICAgICAgIGNvbXBhdGlibGUgPSAibG9vbmdzb24sbHMxYi1uZmMiOwo+ID4gKyAgICAgICAg
cmVnID0gPDB4MWZlNzgwMDAgMHg0MD47Cj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ID4gKyAgICAgICAgZG1hcyA9IDwm
ZG1hIDA+Owo+ID4gKyAgICAgICAgZG1hLW5hbWVzID0gInJ4dHgiOwo+ID4gKwo+ID4gKyAgICAg
ICAgbmFuZEAwIHsKPiA+ICsgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiArICAgICAgICAgICAg
bmFuZC11c2Utc29mdC1lY2MtZW5naW5lOwo+ID4gKyAgICAgICAgICAgIG5hbmQtZWNjLWFsZ28g
PSAiaGFtbWluZyI7Cj4gPiArICAgICAgICB9Owo+ID4gKyAgICB9Owo+ID4KPiA+IC0tCj4gPiAy
LjQzLjAKPiA+Cj4gPgoKCgotLQpCZXN0IHJlZ2FyZHMsCgpLZWd1YW5nIFpoYW5nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
