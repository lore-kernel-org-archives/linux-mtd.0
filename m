Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D09E6FE41
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgwK/yGDxIboAtvHn1r4NyLbI6QxZ02oPc3Y4tOKR98=; b=dKafAqDOI7mHxV
	SIQybh0PUtvZcBFp4I9DV+WmR9YFDYNm9cfGMLS5SqFEtNVbGjykFFgXkjOz3tQZZrBi9jj8409v0
	9/VFXbp4n8ucLVPGSP6LupZagPh8cZwPmud9fIzlwUeSaL61+z0Cp9dA71M3wGsmLkhwPaHBAPZcF
	P0Swg/+d11WC7vbeYFZ5MvaE1qCONxHsgET7K8d7BuEAWn00m++c6wOfoxZnwqr0ZcgwdeeLqQOPk
	DqHADeKnzdhmfONnJXOd0Tjaa9jNn3d/ys4+o3cFsWpmIoiNrM190u5E8ojgYZ2zyZOF/Nqy8QOBI
	sBuA4017jL7BhjQDCMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhnI-009I59-15;
	Fri, 22 Sep 2023 15:10:12 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhnD-009I3d-2i
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 15:10:10 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50437c618b4so1533352e87.2
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 08:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695395402; x=1696000202; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eBbLfmPpKzgVoeBpgucGlr3BpZFPgPf0mz1waJgwt2Q=;
        b=mPHUKWWRgv26FdBZy1ImWiPQy6j/7pIuxbkG1G3XAgiSvXx7feYOp3Z4h9Qgn7+PPV
         5is6jxTll79trx8DuQOgdSBzPUvXGJ+4bCdrgbvPQAz9ie1Amo+dqr8+wVC0yhXsommM
         wOZk+nIkOrook1t60wV2hvroQr5Ap/rW/KelQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695395402; x=1696000202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBbLfmPpKzgVoeBpgucGlr3BpZFPgPf0mz1waJgwt2Q=;
        b=Sn7YAsdLS05Kg7juTlZh7Cybj1KhcgdavZQhkgAqa9mjrjU7YQwYg4zIn7tPOTq/mJ
         Qv2eh/vqrkwDg491fac10dY608XuimVPrcuOTLd+P7MSgJfrXo5VZF+LGtJW276wQ2MI
         DzKcJ8XYxuk/56U2iuRFb1JLRr2Ansv45xV2HrQTxR3NGvKSmlg91P0Hk8ZriKZBUmZ4
         Yl4nfTVGn9UM93yzanwZBrja7OugcjXs0u2lnS60Y0WUsHE2H65y1kggaF919cldmwgL
         hVxHEB7uUKPmXZPeFM6g0YajjWJVTUVPQAWoT+iI/npBD6Bj+e35FGn5KI2omqW27GvY
         OXRg==
X-Gm-Message-State: AOJu0YxpkTOaRnfqWS7EYR8UeyQdH+K0nmtv9UlxTJic4XocxbrDvp2a
	63Hyjb4Ajsw3ybC84KeRXDlVR74PfOvCLERmh4z1YA==
X-Google-Smtp-Source: AGHT+IG0+FTwy7leUuJNc07mqM4ZpBxga4kMOkpvPH1KKuybgHujWbeNV789s9axdxdQeWXDb18UprYq/1LXcelxM4U=
X-Received: by 2002:a05:6512:449:b0:4f8:77db:1d9e with SMTP id
 y9-20020a056512044900b004f877db1d9emr7510046lfk.12.1695395401203; Fri, 22 Sep
 2023 08:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <e045afaa-bc38-4fed-966e-a034e106c86c@gmail.com>
In-Reply-To: <e045afaa-bc38-4fed-966e-a034e106c86c@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 22 Sep 2023 09:09:50 -0600
Message-ID: <CAPnjgZ2sN1bRKOFpDXXc0QfYsiHMxEFR8K+p=swLWs8ZCQBusw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, 
	Tom Rini <trini@konsulko.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dhruva Gole <d-gole@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_081007_904012_11B02704 
X-CRM114-Status: GOOD (  17.99  )
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

Hi Alper,

On Fri, 22 Sept 2023 at 07:57, Alper Nebi Yasak
<alpernebiyasak@gmail.com> wrote:
>
> On 2023-09-21 21:45 +03:00, Simon Glass wrote:
> > Binman[1] is a tool for creating firmware images. It allows you to
> > combine various binaries and place them in an output file.
> >
> > Binman uses a DT schema to describe an image, in enough detail that
> > it can be automatically built from component parts, disassembled,
> > replaced, listed, etc.
> >
> > Images are typically stored in flash, which is why this binding is
> > targeted at mtd. Previous discussion is at [2] [3].
> >
> > [1] https://u-boot.readthedocs.io/en/stable/develop/package/binman.html
> > [2] https://lore.kernel.org/u-boot/20230821180220.2724080-3-sjg@chromium.org/
> > [3] https://www.spinics.net/lists/devicetree/msg626149.html
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >  .../bindings/mtd/partitions/binman.yaml       | 50 +++++++++++++++
> >  .../bindings/mtd/partitions/binman/entry.yaml | 61 +++++++++++++++++++
> >  .../bindings/mtd/partitions/partitions.yaml   |  1 +
> >  MAINTAINERS                                   |  5 ++
> >  4 files changed, 117 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
>
> This doesn't match the schema in [2], but seems more like v1 of that. Is
> that intentional?

Yes. Based on discussions with Rob, the idea of setting a general
format seems to be too ambitious, at least for now.

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
