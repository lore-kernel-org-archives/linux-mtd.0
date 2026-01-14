Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A12ED39008
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID6V3yz7fUiHVZ77HmQNaHV3aOsBsUgWoEHlk0ibm44=; b=HGAl2qf/uGCL3XY9Q1O2Lhism9
	zlRTxAGoMDmLx7b0Bm9ofkkFeV6kdenufMAo9XaYyJWiV3bczPQpjhRaoGJOP3zJIcgR2UC7ZMwyO
	vyymZvOWuiS84lAlFDoVfGb1gjYHNE+7Mvc0NjcM/36yQ44Gz/l3Hd2w8PsMdnXq403nl24hzQR9f
	PaWBCjZogM1en73tctXvDxmNUDcd241PYdPlMbFSKJqBny100U2TR/91l7yMitbTRURl3ASax94wi
	Ze6VyA19n613+NtiCYjwjJ/Um59a+RKkso9hT/W+qx4tiNklJfsy4Ml5rC7zqypn5reTJzRMS4MDj
	lZLiB89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6ae-0000000AUiT-0XB2;
	Wed, 14 Jan 2026 19:31:36 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6ab-0000000AUhh-1har
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 19:31:34 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2a0f3f74587so1438565ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 11:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768419092; x=1769023892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbklOo+pGEmqpbeIs+s5brAyz5U/swUhBdgkvn95qkU=;
        b=NkvO0bHpuVY+Y/1svsUiAvuTk+dQah2jFbgLGPk7Ezofja3tosSeyMeUuFC2JWtQrp
         OW2z2TAkQgTFlcj5xWZpVd5n0ewErXG6KdR/5JYZ+OizyVAY/nfk4vuku/xHVGdT83d9
         oYF+8Ig4VEu2xsy2k/4lcQrlv0CmFGC0BawSyxH4r8nGJ8PNaLsQJcaAk8sbWGxp+eSh
         W0kNW3jzloK1AlreeVgvOL40lgNyg8puO/N/Z182jdvxa4lB9t57XQrKtUu6H0WiWneb
         T74DSdFjldkQyTO8YPeAvObZr3nOhUH5Et830/9c70MLPy+CDg0bdZQyo42dogQUjCVD
         i3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzvaAOTTXsluMlN6VNzEsJuJhLnBtYGI9DLrjTPkZCpQUtwc1xEf0lc9WMgWgHyJhJgPu04PwhEdI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz60viEyoFc6hW5yF9KbLoOlO4beJp30H6tA96b2gJIOZjbTtee
	yLVxlADWtkbZXwgeMFB0B6cqm9TjapwXIb0HNeFIp6NWJXVl1ZlYZVV7gye2fPFq01Bfw1Kdar3
	JBIjrqmNFuX/c0SFC88V2jxbj6rzwsm0BoSb+e6wIdVhDatO84mfBJ1bK0LcfGIxEisABLsFHpG
	Pbc33Jtvg8yLVUVTqFTZpBaECzHlt9wNBmgBSQSW4KOsSetcTkhCA8K/78+X0+aMg+9NxqRQmWY
	tbfiGT1pIg5VM1WaX8Azw==
X-Gm-Gg: AY/fxX5qCQkqXXoaNdB1k4/Wukv/5+vzfM2VcN/BWwTlc5mNDVb5UdpMN8yHKgdSY6W
	hGE3+BRdmqJajfOAAEgfgUrCfg9F4DrISRImOdczOm3awaEoAESGbJMbWFmXlf5lzkL8K4YIyuw
	7wpolivNzepBTo0K1+sntobgP+5UnlkwVXvYD2XWELYUCXlbNlObz8vC3DecoqWxcGC0xKJkfH/
	qqwE1H1Nt3lhZWjVkWn291cLQm2z6T3xpS18bLFqCIgmkwaZgaW42wQfncixK2RHmL2UbHCTS4t
	bcyHeztiKI/p9UO+Fguo8zp+aHj9kSnpfgD7zVblLv/rK7aBdO8una90CQHADYesrlwdzYkmX0f
	8Hw6pCCdYGykXg5mjCqbgZHvN/KDPCjeQAOCtf5A4A3JRmZfBIckS7EO98bFKIlF2sNo/YKQtES
	6k/aT32Gci9iPfy9ewes+D+A4ckNoSTI3ENP7FlZBb+PY=
X-Received: by 2002:a17:903:2ac5:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a599da85ebmr33522855ad.1.1768419091661;
        Wed, 14 Jan 2026 11:31:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a3e3ccf45fsm28818595ad.56.2026.01.14.11.31.31
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jan 2026 11:31:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-78f92e123f5so1463387b3.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768419090; x=1769023890; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VbklOo+pGEmqpbeIs+s5brAyz5U/swUhBdgkvn95qkU=;
        b=a/wcA03kbbOez6hU0iRwh8AgFLs84TDTfs9VZnUF7xosNNIljj721ZwOTlDWvzPfb4
         8sMoo7mMOXbiib9wqn3cgkbngiPtxTejtjp74Ta0XB4CSClQ9jmEsAzKcm8Iiu1RawUX
         /bihpZgcAYhPw2PQ3+zFMPq5n16MmGiupnMlQ=
X-Forwarded-Encrypted: i=1; AJvYcCV2uWZfWrEK+oSBm01v+wnIib8fteDV4v+MtPjQeyba0+wcks5ItgbOqHnJMFzBCEpx+IaayqHAUi0=@lists.infradead.org
X-Received: by 2002:a05:690e:1503:b0:63f:b446:7019 with SMTP id 956f58d0204a3-64901b1a4demr2848128d50.64.1768419090163;
        Wed, 14 Jan 2026 11:31:30 -0800 (PST)
X-Received: by 2002:a05:690e:1503:b0:63f:b446:7019 with SMTP id
 956f58d0204a3-64901b1a4demr2848106d50.64.1768419089600; Wed, 14 Jan 2026
 11:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-1-124a53ce6279@kernel.org> <CAHi4H7GvSsX=BO2AWy4BB=FfQ8bWx_C3PBh9UQHYOo+G247P_g@mail.gmail.com>
 <20260112154805.GA271138-robh@kernel.org>
In-Reply-To: <20260112154805.GA271138-robh@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 14 Jan 2026 11:31:16 -0800
X-Gm-Features: AZwV_Qjbm5J2wcTaNLGOlsCrlNMjOpv3tOlSAapv7lbKCL7hMflyF1Pf6b6muXY
Message-ID: <CAHi4H7HbJ6fZYzzXfnxo7jfncnuQ62C=2i0a8jxys8UeHhQ6Tw@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: mtd: brcm,brcmnand: Drop
 "brcm,brcmnand" compatible for iProc
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_113133_492394_1C05479F 
X-CRM114-Status: GOOD (  27.77  )
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
Content-Type: multipart/mixed; boundary="===============8573045977614457743=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8573045977614457743==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b7733006485e2795"

--000000000000b7733006485e2795
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 7:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Jan 09, 2026 at 10:05:04AM -0800, William Zhang wrote:
> > Hi Rob,
> >
> > On Thu, Jan 8, 2026 at 9:53=E2=80=AFAM Rob Herring (Arm) <robh@kernel.o=
rg> wrote:
> > >
> > > Some users of "brcm,nand-iproc" include "brcm,brcmnand" and some don'=
t.
> > > The "brcm,brcmnand" compatible is not useful for iProc systems as
> > > there's a separate driver for iProc. So drop it as a fallback.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml=
 b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> > > index 064e840aeaa1..3105f8e6cbd6 100644
> > > --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> > > @@ -66,7 +66,6 @@ properties:
> > >          items:
> > >            - const: brcm,nand-iproc
> > >            - const: brcm,brcmnand-v6.1
> > > -          - const: brcm,brcmnand
> > >        - description: BCM63168 SoC-specific NAND controller
> > >          items:
> > >            - const: brcm,nand-bcm63168
> > >
> > > --
> > > 2.51.0
> > >
> >
> > Another fix would be adding brcm,brcmnand to the users of
> > brcm,nand-iproc to keep consistency with all other brcmnand chips and
> > utilize the fallback mechanism in the driver, although I agree it does
> > not happen in real life case.
> > I don't have any strong opinion either way but a follow-up change is
> > needed to remove the fallback from the brcm,nand-iproc dts files if we
> > go this route.
>
> The question to ask on a fallback is "is it usable on its own?". IOW,
> would a driver than only understands brcm,brcmnand function in this
> case. Given iproc needs its own driver and specific handling, the answer
> is no here.
>
> Plus, this matches what dts files actually have at least for the arm64
> ones.
>
> Rob

Fair enough.  With that,
Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000b7733006485e2795
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
OI/KxqdLKKl/0CRoKpI26pgVpffBih+18maEUKs7uB0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMTE0MTkzMTMwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAKRg82nRRGGtkAXumnPzigPFCKvd0ze0fNje5
cK/2o/Qbtggr3FWkEPin0UYZmbspS7JnGMXJwEroy1KU3c08uDSxKx6hgpTBpiREjDcpgC6UCSV3
0SM4xlKpam3eoRTxQ9tPP4VrpbpT6O0YPbC+7WdZoYWyaWSczkZ70KyD1VGlALB+SYJnv36+8mnW
113aJP4g8NW3YZ17T+kk5hF7Mv/V+hUj5KzbXPsGB0Ti+bQafRxCiIv7b6ch2V42po7tCW78h2v9
hNTEW8Mik/NmOkxMKG+sR6TJhvFVl1m1Q4D/c/3ZTAGr/85QmmNH/B1wzLa1bjLwkBWolYSZ5Eeb
iw==
--000000000000b7733006485e2795--


--===============8573045977614457743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8573045977614457743==--

