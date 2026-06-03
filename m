Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A68CD6E4A
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 05:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dng8AKp1DqczeBkIw+SdsrQxY9fD9+UzLr0XetIGq8w=; b=VX8V7kMLjJpmCZ
	v4qMI52P/wzhcpt5Z1y6UBKP1TpMlB/lA9BVHmpUDfD+TmtokcfJVNrwZe1F8PVj57AQib+jcUUZd
	o3M7mV5KfnL76ok3d842cH0XvgcTMDJiXntdKBikV+AS7jEOnRHnDfYuqaqRtMxicYLpPbdpQcZXj
	lZG0Z8mrpn5GU4Csex8krP3tTVw4o9FRzOpmp0jdYxWT/0UM+hqvXduSxWbqLMuqtxkPMKdpbGzdM
	0vc5JNAgu9VFl3OOPr1nLIVbhyoYSwUlyZFo9Gv5cc/iizZPr8B/YBruT+ZGFDlDf0Od+44LQUN5k
	hH80r/ctG7zGFauWf61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeTF-0000000EJFb-2hGB;
	Wed, 03 Jun 2026 05:48:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeTC-0000000EJFF-2xt2
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 05:48:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so123450425e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jun 2026 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780465728; x=1781070528; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzDenIalDMAuiWeAwmJnmzeE6FqdHQUL/2zLEDLjuGk=;
        b=GTEQX6zEdragslP2VnpAbtUkQICkHWU+HZbOWaU1FjwdKge+WbgCpdHsI3IPkBVDFf
         m7g4HvEmvxsMfW3DvYLyBOxSQ7XHFqiDVTYYeQXNnfgL7NFO6fFayvkYjNhiNGKBwdQ+
         xgSpAt+KlN4oEPUOfwh/84TurB+jI2QUttKj23AXCiLxmE4OZ3uzTFhOzK3XdwBocu1x
         qb6XDcPYhDSDAFRZeucq1WUYIDHLfGyXlp0tqWm8F1g4DDhjN4+Bgc0uvzoxKELb5cRz
         rBN8dHlcZd2KNaxq7G8+woWTuiOLNkEMKsmNz11fj4GfeqMY1HU4jr2MbO0CKKNYR5Je
         6g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465728; x=1781070528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzDenIalDMAuiWeAwmJnmzeE6FqdHQUL/2zLEDLjuGk=;
        b=s6ASDvqjPVUMK2b/UHoWSSd3R/bIraJvHySRdyjq1kl7kOEAGEG+uro93MwQkY0KXn
         r+CTJCFIrqzEWWEcKtBdTuhuVRdZibLEuu9x1JYFAHaEBWX/MftKRsCpffo1w2ZW+hOW
         HM9Y9psVRzn7udJ1HRLYkFgYnYuGEjsJ0YEHYCETETCYbkM19FgpJba5fS+O5PAHYi40
         qd+gbC+a7hSWCKRWphuHIQeW2PyHaBW3S4O5ummRjkVitjOtKiG2vgAVbI5PicLxgFKR
         fXX6hkUrtqxCKxjeHzNg9cSEK2MjuCW+djMiJ4IFMUp7vNT2l+ynj9E3B3R+ACGxrRPT
         iyKQ==
X-Forwarded-Encrypted: i=1; AFNElJ++wVvjdylGddECW92XEW0Og+ppqGuNqjd8QzD9mJ9kDLbwIAU8Yriv4eNXFVIUOcU2SxZ8BHdRYYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJFcdGGbrywGscPK3nWTbIVo2dtMyjTSKJ0wsbo7vdEVn0OMLM
	MUCyAq/ZfiAxmjNmMEH5kOsGUu2BBNTYLdYV8j2FW40RfoDthDrry82a
X-Gm-Gg: Acq92OHtZX1GYfEFOXOA65aJc1LZulvOTDeWGGiC1k41XnMm+xaQ5uQfuIQWLVoCJSu
	jqT9ztoAp4QB+9ebqqDdNd9TjsZcZT2JXkLMvRvdf+IWBcfC8kD4QCoIBxCdt+02kvXokVqL/FF
	y9kA6RADYP9qsKSIjSU3knfmvAbrHTx9Aqu1Wj0QSUVx9DSiZxinu+VyzQ6hmERa3BqOqMw//Qw
	6fQJdyI9YHJrAxZXlWcZ4fv2x52Kj6CEjcNqIk8NRcmupQkhds10TSCbF5TYBMPbIVo6X1g3MM0
	mzYzf2MkZkLHksYYcugSdFMWvVmQgy58CF5DXErWhYKmU3Pyb25573zM7VNwuHdmabopO48tgZ5
	klgtnszaZjmYn5ZlpF9Rl6n9+ZgWQI3bQqr+91ACNPm1Rs4SuGukQd3U1BzPjn3CfsDHll5SGnB
	sXDC+rqoX351XGx2UfFz+uuLcR88LeFY8P+ZnuIADCaRpzuZeh/Vg=
X-Received: by 2002:a05:600c:698c:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490b5d41d43mr30103945e9.14.1780465728174;
        Tue, 02 Jun 2026 22:48:48 -0700 (PDT)
Received: from localhost ([2a02:a03f:b7dc:2b00:a97a:8551:7733:cb60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm4752182f8f.33.2026.06.02.22.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 22:48:47 -0700 (PDT)
Date: Wed, 3 Jun 2026 07:48:47 +0200
From: Olivier Sobrie <olivier@sobrie.be>
To: "Miquel Raynal (DAVE)" <miquel.raynal@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrea Scian <andrea.scian@dave.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: pl353: Update timings at the right
 moment
Message-ID: <ah_AP9Sx9R1i5Q2x@padoso>
References: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
 <20260529-dave-upstream-nand-fixes-v1-1-8c72aa23aee2@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529-dave-upstream-nand-fixes-v1-1-8c72aa23aee2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_224850_781936_CC6AD9A0 
X-CRM114-Status: GOOD (  27.23  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miquel,

On Fri, May 29, 2026 at 06:29:56PM +0200, Miquel Raynal (DAVE) wrote:
> If several CE are wired, we would write the registers for every chip one
> after the other, and reselect the correct timings for the first chip the
> use wants to use after probe. This is not exactly efficient and could
> slightly be improved since we already have a helper that applies the
> configuration if there is a chip change. Instead of programming the
> registers in ->setup_interface(), let's just drop the pointer to the
> chip and let the nand_select_target() helper do its magic.
> =

> Cc: Olivier Sobrie <olivier@sobrie.be>
> Signed-off-by: Miquel Raynal (DAVE) <miquel.raynal@bootlin.com>
> ---
> Olivier,
> =

> This is an enhancement to your previous patch which already
> works. Can you please tell me if that change is okay for you?

Yes it looks good.
I tested the patch on one of my boards, it works as expected.

Acked-by: Olivier Sobrie <olivier@sobrie.be>
Tested-by: Olivier Sobrie <olivier@sobrie.be>

Thanks,

Olivier

> =

> Thanks,
> Miqu=E8l
> ---
>  drivers/mtd/nand/raw/pl35x-nand-controller.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/n=
and/raw/pl35x-nand-controller.c
> index f2c65eb7a8d9..986019b42153 100644
> --- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
> +++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
> @@ -862,8 +862,11 @@ static int pl35x_nfc_setup_interface(struct nand_chi=
p *chip, int cs,
>  			  PL35X_SMC_NAND_TAR_CYCLES(tmgs.t_ar) |
>  			  PL35X_SMC_NAND_TRR_CYCLES(tmgs.t_rr);
>  =

> -	writel(plnand->timings, nfc->conf_regs + PL35X_SMC_CYCLES);
> -	pl35x_smc_update_regs(nfc);
> +	/*
> +	 * Reset nfc->selected_chip so the next command will cause the timing
> +	 * registers to be updated in ->*_select_target().
> +	 */
> +	nfc->selected_chip =3D NULL;
>  =

>  	return 0;
>  }
> =

> -- =

> 2.53.0
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
