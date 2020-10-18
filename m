Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E362C43457
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 19:43:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7B9206ED
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 19:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9TgPmh+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ab3TBxBu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7B9206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WAb+7S9mqDQ8rcYA6ds8Nl+9YeqoCh67bquBksXbJvQ=; b=a9TgPmh+jxeC/1MFlyks2GSOZ
	zbDFf/smz/fZrrSOYEPvf+yxLubb59wsOFH2+046+ZDnp/BySqHbsatiErUhT65/o8byqKnekqc7E
	zrVrTWFelhCUfBQrD/EG+ajSl6UstnRI861dvWSfCllt8E5Js5Kb1BObM3AaajrzbS0spMLoxB8dB
	rp/rqrvbJEmJlEwgE/SdzkCacNbEfzDgNm3v42H0mjWYfCnSfWzO7mE6GDS0M3xNC2wCx1ReIIiCc
	TfzGu0iIbf8h03LLRSxqGtOu5R9qgSVTL90s4J1mwIcQ3ZfLPC3jLLdpTvZoC92qY8Q1+URsWe7gn
	4+Ht44wdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUEZz-0006iw-0l; Sun, 18 Oct 2020 19:42:55 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUEZr-0006gi-LL
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 19:42:49 +0000
Received: by mail-lf1-x141.google.com with SMTP id v6so10855750lfa.13
 for <linux-mtd@lists.infradead.org>; Sun, 18 Oct 2020 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txknNcAYxBRbxzOFGumoDqq9nKgNEhlMrUcD/fUG2z0=;
 b=Ab3TBxBusokv7IVkmP1EZeLk1FAINsJmwxv0oJt3UZGtN+TMXK4YvbjYePk2xNw+bV
 Sx9BePfE0gZftY2cudaFvOzIF3jHYcJbHookuLmR2m1EXLHFASgAMr6ABnNIBZqyE4Xv
 3OTe5oHuelfA8CeS0Id5quU4Iayu1k0Qlc3E2bO6L/zVPhb+NCXbL8Q575lfw5xYyjCD
 a/E30X3tv92NNzp1o8AbMge0Rn6CKPprX+M6pnKmaJmb0ztwQ6vOo/5E/EGZJXiDvUTy
 vtfdTi0cGepwPkx9tC5nOik2DdS7HX4FWqeoLxLAg6+/OHGQa5g9iKn5cS0j+XM4V/8A
 a+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txknNcAYxBRbxzOFGumoDqq9nKgNEhlMrUcD/fUG2z0=;
 b=WlEZ0pIXIM+znw4Hz49kBDsDThWrAqYa+sPXK/svjeO95i/ImeQ55lEiHnq954TKSh
 m2gDRpQDeZUc3Te/phVtE77NhQj6RkcNLx70tcABXBiby+p1IF/bVnXjpAUkYb1dw9nH
 PXyVJUMshW9bvrl2+h7xKsOSR95mXUHonJAkIB+juEuTYXx7GP34Hk6LkDjHrbv4Kp5z
 eIpTIxIVnFvlUTNWflM9p0Kjte7Sq49d5ithW3SsSkGvqJd0P34TVv/KEQrI7Gu6fn6Y
 8KTTu5LrHPD6uhSS6z3Zt7gRA9Hl/ZbHWGgxAXyNxB/xu4PQxacgobcmxgBJ8nGiY0lh
 ojHQ==
X-Gm-Message-State: AOAM5324gonTDxiajVFMoOhV7lyf7g+I0FMeArCPECXCVzvVSUVmQm2X
 sGAmNrGnWwu2wmxbscQt1tTKxxqTv/yJWglYA2ONBrGM+PxVkA==
X-Google-Smtp-Source: ABdhPJxTS/EHG2npPpVmPDE6wvHnh8NBR8JbLInwfFGHlXBsB8FQzYRs/AyTUYRw21L+N4gWvtslSrBOzwddSdDPAFo=
X-Received: by 2002:ac2:5a03:: with SMTP id q3mr1023953lfn.527.1603050158346; 
 Sun, 18 Oct 2020 12:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201016213613.1450-1-festevam@gmail.com>
In-Reply-To: <20201016213613.1450-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 18 Oct 2020 16:42:26 -0300
Message-ID: <CAOMZO5AueQjrVyK10rccMO+HcOGcVRUTYC8xtJh0hT-OCS7Rrg@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_154248_480521_AA8C0B40 
X-CRM114-Status: GOOD (  14.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Fri, Oct 16, 2020 at 6:36 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> No ECC initialization should happen during the host controller probe.
>
> In fact, we need the probe function to call nand_scan() in order to:
>
> - identify the device, its capabilities and constraints (nand_scan_ident())
> - configure the ECC engine accordingly (->attach_chip())
> - scan its content and prepare the core (nand_scan_tail())
>
> Moving these lines to mxcnd_attach_chip() fixes a regression caused by
> a previous commit supposed to clarify these steps.
>
> When moving the ECC initialization from probe() to attach(), get rid
> of the pdata usage to determine the engine type and let the core decide
> instead.
>
> Tested on a imx27-pdk board.
>
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Would you like me to resend it with the tag below?

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input
parsing bits")

This commit is in Linus' tree now.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
