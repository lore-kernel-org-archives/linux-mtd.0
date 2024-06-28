Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BCAC2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvyAgtznGZlCgnTqGY5oVIKyL6ag+cld7XkZaZSrkYQ=; b=gsgwyMExv/INml
	C7MV9YMCGu9kELzNKUzzwk/pyoW/U7Sn0IZNno3bpUh2dSXzlv1Iz2TGB7g8DvN5dwo8ZhEaj38+T
	CPzv2fiCy/Wj17yHwA8z4X4/n5JuzTxRLZZaCY/komclt/ulrY0vjcGmBe1dbVBTmrPY87fETAW8/
	xeIVrElNsqdfU2WGrdNfKzZjlKQ+9+6e6UJuwxkYVY0Ns8hZveMakLflf1xIjQyrwmFXfJsdybosx
	k9qz96eVQ926HZ2RYbVvJhl7vpJXnmUgRRCChGKegM/D8Y8BCgrFS8tTkOOSXRR9AoYjJrOmTkfn6
	JMEhsuMmNIu7XOTkMRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNHKW-0000000Ekt9-4BKU;
	Fri, 28 Jun 2024 19:32:21 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNHKS-0000000Eksc-3Fk6
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 19:32:18 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso103881866b.0
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 12:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719603135; x=1720207935; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PxckOsAOkmt2Z/dhIOH0h8pCT8yqSu788yaL0xNxpAg=;
        b=OuO2ZV56Ff7EP7rVJDV/yTDmS8Kr3Suz5Z4S+KelnWlGq+kfPcUASPuN6nR60jfpUl
         eyVXCRYO3+8PWPrCmc3fhhklASLEGSBq4FJRuE7GJRH7Bt5viAOLMwWM950CVJOBlhSg
         uBQoMQhNRojgdkfMvId2Nb9EL71i5N+schI3aQN7FiAn8/40k0lbQOYy1nWQxcqGcCQx
         oiHRODgf+f9BY3DPTIjF0Vr+XJVSUd25ug3y5E6efYTU+eOwIM0EMmQHue+YTptZOZUc
         WaZj45RVwWCijk9I68MlsN46p0AIcVhxXQp9Bms26l6N9bccM3eG8EGr5bENBFmE2MhE
         pqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719603135; x=1720207935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxckOsAOkmt2Z/dhIOH0h8pCT8yqSu788yaL0xNxpAg=;
        b=iYZjLLpb/5AOAd82vx3+VZ28KXwStb2tuBCKQNcvZqlw9NRGqyQTaC0OYqBepWYsl7
         J6ITR+WIplpEBLmIPWFY6qClMKRSTHmUw99J3O0DULB5SbZ99jegeu9pw553czUHSWvC
         6qWbwT8G9729rU1n72DpHBNJi3KHG373W1Htcb//AXTfnrDHqHxzeeWQiwMQ+zBS2JMl
         o4w3ByaQf9StePLw354tCiE69G/xXwLHWsQ9dwbsn5iF/pX44ie11KUlOiMd115J8UDM
         U2mFaBAcZeB4BZtKRNFX3DDKMPiKgKQfymMcM4iaA01yUkia80RAUhuPB2vcbt17Q0PZ
         jL6g==
X-Forwarded-Encrypted: i=1; AJvYcCUFWgjDp6b5mTWCY5P52XlB5a3RQkt/XNeL2Annm396COk0n1svVBSeDgPBpqgbjLkTMmKOD20zzKeUwmSXtMDi7CU/kAa9uCiMO+EpzQ==
X-Gm-Message-State: AOJu0YxA1aFFoB9KG0oGp6Wdyu0AgxVT92U+fHou5Q9DarXwjHZb3/hv
	hIGWdQREcwUQRo3xKgBbMa9eND6QonTV3Af+k0bTFM1T/WPOKKum7IqtmkRe0s2jXoleqmfj8mn
	ei/nwsqMnS09SI9jAUJzD1yQXig==
X-Google-Smtp-Source: AGHT+IEcIJk3aOEVCfHZaTOBEzliwOv1OW0IgkYWVgv3YyCrG+TRBh+fl5e85vwIPrct8FMab5SprzZALrLoAgdlAkc=
X-Received: by 2002:a17:907:c816:b0:a6e:f594:a292 with SMTP id
 a640c23a62f3a-a7242e119dbmr1458130966b.63.1719603134625; Fri, 28 Jun 2024
 12:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240628140328.279792-1-erezgeva@nwtime.org> <20240628140328.279792-4-erezgeva@nwtime.org>
 <20240628-refuse-actress-b76985aa020c@spud> <D2BS0YMA48BG.1PEPFC3KMFV8N@kernel.org>
 <CANeKEMMrXK=mw=n=9DuTnprkTs3ct446oaC2QTJyst8Nd+D6rw@mail.gmail.com>
 <D2BT0DT9UQ66.2L497FSY7GMAL@kernel.org> <CANeKEMO9hBhBs91nZkZRht9J29iRC2Tgf6ucWq=nbO7XAqzzng@mail.gmail.com>
 <D2BU69BDUOL0.63A7T034CORP@kernel.org>
In-Reply-To: <D2BU69BDUOL0.63A7T034CORP@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Fri, 28 Jun 2024 21:31:37 +0200
Message-ID: <CANeKEMPLqdc0iKPcD5d16r91tsbKZwZ0getq2gxOhc42sdu7Mg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR chip
To: Michael Walle <mwalle@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_123216_836218_09DD3C7E 
X-CRM114-Status: GOOD (  25.75  )
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

On Fri, 28 Jun 2024 at 19:45, Michael Walle <mwalle@kernel.org> wrote:
>
> > What is the kernel policy regarding obsolete flash chips?
> > Macronix annonce on end of life of mx25l12805d in 2010.
>
> Which doesn't mean there are no boards using it. But EOL in 2010
> might be a strong argument to remove it. But I don't see the need
> for it, yet.

Fair enough. That means I was in the right direction.
Just need a better description for the patch :-)
I'll update for version 2.

>
> > > Also please have a look at
> > > https://docs.kernel.org/driver-api/mtd/spi-nor.html
> >
> > The new mx25l12833f supports SFDP, the obsolete mx25l12805d does not.
> > I did manage to read the SFDP, though I do not have a copy of it (I do
> > not have the hardware any more).
>
> So how would you test newer versions of this series?

I develop the OTP callbacks with a mx25l12805d for a company using it.
I am no longer in contact with them.

The testing can be done with any Macronix SPI-NOR with OTP.
I did not check, but I guess most of their chips have an OTP using the
same opcodes/methods.

At least mx25l12805d and mx25l12833f use the same.
I did not add mx25l12833f as I did not use it and as it uses
asymmetric OTP (the MTD supports symmetric OTP).

>
> > To my best knowledge SFDP table do not contain information on OTP,
>
> That's true, but we need it to detect flashes during runtime in the
> future. Imagine sometime later, there's a third flash with this
> exact ID, then we need to have the SFDP to figure out if there are
> any differences between yours and the new one.

Sure, as I said the mx25l12833f does provide SFDP.
In patch 4, I removed the size property to force the driver to read SFDP.
I was not sure about the flags though.
I did not see any difference compared to using the setting of
mx25l12805d without SFDP.
Yet my focus of work was the OTP.

Erez

>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
