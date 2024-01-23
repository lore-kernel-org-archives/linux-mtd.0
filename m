Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14796C47DDB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bDos5SbfAgMNN10xpffJ0vRU4dEfHi9oy3D1o4WDD4=; b=JvPwz56jtLAoa1
	STvm7F3qQUw9MWVy/nAwunPmtBO0rFvUp8gVPYUQiYic5SHp8fcWAvt9ogn4CxNEMG7FG2KPzTCOo
	0Dc8zWSgsjfZZ3qu4mYGK8hukNPKKH3I0ro8NusdCfdMnoJD4NPd4o4IbYS/x4BbhoWLKhQHiJLJ2
	HJHrgTpIYdLCrQFnMSMMGH351z7wTVrmxtzgtZXfMM5aJDzWTau4mA67fycv7LdmYnV1UOyrPdTMd
	reBCnKH689O/GCl5Ygd+VIDvLz+XDBapqEq1vhMNB8ykzcaV+UawMcOIGM3g7zw33W6Awm0MRzTDj
	gkhrCHJ1072VRIW9wrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSE7F-00FxZw-1T;
	Tue, 23 Jan 2024 10:34:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSE7B-00FxXI-2k;
	Tue, 23 Jan 2024 10:34:47 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5cf1f4f6c3dso1982208a12.2;
        Tue, 23 Jan 2024 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706006084; x=1706610884; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf2YaREmVYXxOJZhUokIKRBOvqtSAWNcOsE6VEYJ3QI=;
        b=fVmmTrA/E5NiUuPqvbdy2qfyn0AOJ37XWiriyfT991Yd+3jBZkNpWbDeiseCmzQLbJ
         pOK/rv8jjffBhs3BbkEcbBmtP+eBz+T6WJrJZEmwNNVg/jQgrAUe464uv08Fn2zmsTuU
         XoIAzHIX60yhCzgEKWJ3q9Sage0wjuL4D3F8fuoEpWbNewM+EJaJWrqjIXN6ej1LwR9c
         0Wl+ziJvve+UEb4DEyqjTUYVL5hIAVBNi76pVUwQxXhz9z7RLjxCUe3MFmy1WbMhY02T
         9mVoGRRlQ+vJXF2VjABYUK4YCaNHX6GHw/5CgPS3cDKekqiElS5C3FVQ1/5ZhClhf2sU
         T7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706006084; x=1706610884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf2YaREmVYXxOJZhUokIKRBOvqtSAWNcOsE6VEYJ3QI=;
        b=nMIPht+6fbTGsr4a8STuAHi1UqyH3B37yaqHSUVxsdcJxF5EFAylGt9Ve/U2QzR+YA
         Fu0Px70/UM6cPZGo77CicaSRGaSHbmoEW8nLIN0sW4Y1juNdtkXFfwoqWmKeJFBny7l0
         uXGiLoHWjUUUXSpp0ILFtSWcq5FY7hjXDTmYcWH1qLL37YOQbuv/s4FZ/PDgdRdNsNRg
         G2QlvWOrUO42kEQ+UpUpWjhEPEzCC0ODESHAtP8cf9vfgCeiTxP8V0+j1Fzx0oTAyfyk
         ECwKY4rXpeyXiiSiNJMxQ6Y5WG0xA4M1PKuMarO/69a1+XnXlqedjFZTKHgPQInNadKh
         HvRw==
X-Gm-Message-State: AOJu0YxNx/ucKHOiLvBs4ifBTszRuMxK8ZWWSzu+EwwfHJnvpXZxSSV0
	LSh5M9bnrO1h75dLw+AI9lNSoi3GkdLJbMRvszZ0tNkLBc1fv5qIuVNwiPtE6dsx2rTS+28iwzC
	NjY9t1Yp22ae/2Iyir8bQfvLHNFA=
X-Google-Smtp-Source: AGHT+IGtLI4G6LyMbWMUQB8P4MTNxrKBQrJ79HxJ8bP4yLpCab9rJ66u1Flg526m0fJyc9ODaJKxJjZvD7pQkLmg+ws=
X-Received: by 2002:a17:90b:228f:b0:28e:82bb:746f with SMTP id
 kx15-20020a17090b228f00b0028e82bb746fmr2297885pjb.97.1706006084311; Tue, 23
 Jan 2024 02:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20240118195356.133391-1-dregan@broadcom.com> <20240118195356.133391-2-dregan@broadcom.com>
 <CAOiHx=k2Wn+UaVFbB-n2XKmFuBss4LKmLSW45YME07z=7zg0ww@mail.gmail.com> <c1fc163b-1f4f-42a5-91c3-b31ad33a9741@broadcom.com>
In-Reply-To: <c1fc163b-1f4f-42a5-91c3-b31ad33a9741@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 23 Jan 2024 11:34:32 +0100
Message-ID: <CAOiHx=n62Ap8bGbTu0xcKMHcqgpaLZ-GNjsW2DQ5XPrnsxmAJw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
To: William Zhang <william.zhang@broadcom.com>
Cc: dregan@broadcom.com, dregan@mail.com, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	computersforpeace@gmail.com, kdasu.kdev@gmail.com, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com, 
	tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, 
	anand.gore@broadcom.com, kursad.oney@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, 
	bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com, 
	baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, 
	dan.carpenter@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_023445_913640_9218CC9E 
X-CRM114-Status: GOOD (  36.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 22 Jan 2024 at 18:34, William Zhang <william.zhang@broadcom.com> wrote:
>
> Hi,
>
> On 1/22/24 03:48, Jonas Gorski wrote:
> > Hi,
> >
> > On Thu, 18 Jan 2024 at 20:56, <dregan@broadcom.com> wrote:
> >>
> >> From: William Zhang <william.zhang@broadcom.com>
> >>
> >> Update the descriptions to reflect different families of broadband SoC and
> >> use the general name bcmbca for ARM based SoC.
> >>
> >> Add brcm,nand-use-wp property to have an option for disabling this
> >> feature on broadband board design that does not use write protection.
> >>
> >> Add brcm,nand-ecc-use-strap to get ecc setting from board boot strap for
> >> broadband board designs because they do not specify ecc setting in dts
> >> but rather using the strap setting.
> >>
> >> Remove the requirement of interrupts property to reflect the driver
> >> code. Also add myself to the list of maintainers.
> >>
> >> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> >> Reviewed-by: David Regan <dregan@broadcom.com>
> >> ---
> >> Changes in v2:
> >> - Revert the new compatible string nand-bcmbca
> >> - Drop the BCM63168 compatible fix to avoid any potential ABI
> >> incompatibility issue
> >> - Simplify the explanation for brcm,nand-use-wp
> >> - Keep the interrupt name requirement when interrupt number is specified
> >> ---
> >>   .../bindings/mtd/brcm,brcmnand.yaml           | 36 +++++++++++++++----
> >>   1 file changed, 30 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> >> index f57e96374e67..56176ec1a992 100644
> >> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> >> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> >> @@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
> >>   maintainers:
> >>     - Brian Norris <computersforpeace@gmail.com>
> >>     - Kamal Dasu <kdasu.kdev@gmail.com>
> >> +  - William Zhang <william.zhang@broadcom.com>
> >>
> >>   description: |
> >>     The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
> >> @@ -18,9 +19,10 @@ description: |
> >>     supports basic PROGRAM and READ functions, among other features.
> >>
> >>     This controller was originally designed for STB SoCs (BCM7xxx) but is now
> >> -  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
> >> -  iProc/Cygnus. Its history includes several similar (but not fully register
> >> -  compatible) versions.
> >> +  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS based
> >> +  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cygnus.
> >> +  Its history includes several similar (but not fully register compatible)
> >> +  versions.
> >>
> >>     -- Additional SoC-specific NAND controller properties --
> >>
> >> @@ -53,7 +55,7 @@ properties:
> >>                 - brcm,brcmnand-v7.2
> >>                 - brcm,brcmnand-v7.3
> >>             - const: brcm,brcmnand
> >> -      - description: BCM63138 SoC-specific NAND controller
> >> +      - description: BCMBCA SoC-specific NAND controller
> >>           items:
> >>             - const: brcm,nand-bcm63138
> >>             - enum:
> >> @@ -65,7 +67,7 @@ properties:
> >>             - const: brcm,nand-iproc
> >>             - const: brcm,brcmnand-v6.1
> >>             - const: brcm,brcmnand
> >> -      - description: BCM63168 SoC-specific NAND controller
> >> +      - description: BCM63xx SoC-specific NAND controller
> >
> > Only the BCM63268 family has a v4.0 NAND controller with support for
> > ONFI and raw access; BCM6368 has a v2.1, and BCM6328 and BCM6362 have
> > a v2.2.
> >
> > So claiming this is a generic binding is wrong; you would need to add
> > the appropriate variants first. Or add another one for the BCM6368
> > NAND v2.x controllers, which is missing. You can find them used in
> > arch/mips/boot/dts/brcm/bcm63{28,62,68}.dtsi.
> >
> I am not changing binding here but jsut update the description to
> identify these MIPS based chip as bcm63xx family. This convention is
> used in other IP blocks too.  And yes this binding is not correct and I
> noticed the same v2.x usage in the dtsi files you pointed out. So I
> actually updated this binding in my v1 here
> https://lore.kernel.org/lkml/20230606231252.94838-6-william.zhang@broadcom.com/
> but there was some concern as it could possibly break the ABI in that
> thread's discussion.

That change did change the ABI that would have (AFAICT) broken it for BCM63168.

My point is: This binding in its current state is valid *only* for the
BCM63168 NAND controller, and not for any other BCM63xx NAND
controllers.

So changing the description to BCM63xx is wrong, unless you extend it
to also match the BCM6328/6362/6368 NAND controller bindings as used.

I can send a patch adding the missing binding parts, I actually have a
WIP one lying around as I started trying to address dts issues in the
MIPS bcm63xx dts(i) files a while ago.

Best Regards,
Jonas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
