Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AE4C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:33:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D902921D40
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ovpXd9IL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOP5RrbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D902921D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d1GL8RGGdJfySEGfa2u+zAb2ooG/MdSrBNpU1N8b5yg=; b=ovpXd9IL0d2MByi3o5PUlcWlr
	C0kM0g54w97eF9Z/+EKf5Qi9kse+FWa2qibjNEij/p4hiC1Uuz57GJzEPwKhIiXP7UFMauBVx/Mgx
	X6PEcWTzfB9WcjF2pjw4k22p7QsZJJEcQu78TC5rvjEZdRmxTwtOT4ffNr9PsfaZppCOERXTW+voY
	ee+JZc2HlDu9tXDN3XlGnt45rufj4RGMxnuqf60bS+k7h4NDgF2rhHeqRonNz6mEUzoaLPSEFL3oS
	JfiWPXrAs/zACS3VcMcF1PHdfbTYVJQ+dvwOY/ox9wlWfHi4rPJoM+NDKpS0du9GB+ZR14HLPHVQ6
	CWjyG4Vjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTXLE-0000gz-TV; Fri, 16 Oct 2020 21:32:48 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTXLC-0000gM-Ie
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 21:32:47 +0000
Received: by mail-lj1-x244.google.com with SMTP id m16so4107792ljo.6
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eyWcWs4sgPKKDt5y/gkmPTWp0ELrZ1qLmoNXYUZ4YPU=;
 b=jOP5RrbAPWsKtbmS8Y5JuinJ2YUKp2hJ8CRsdr2ZH1HSD2th3WzLMffGFLUAlp0Wb8
 Cp2DqxHUagNO/0vB7BnU+ucbDhVxuuI7VKOUSVEiAbef4jDv1SsCLLerUSTTOE2JeIWW
 ShpIMbe8PHxFAzQmVsp9YMIK44ebfyftK5DyhVvpst2WKVqz8608J/k8IljAnAU2qhsm
 UFN2vIhY1VCsL4C5JZEghcAr4ztnbZAISY5B12/PIPnDHw7r9bu7Ec6odvqWkRsOMCzF
 B0krfASvv7rpm1sYKo6Lv3UpmUfQMMj5FCLCz0xFarCX0r0yPk9saAm4u7rHg1FFR1rs
 h3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyWcWs4sgPKKDt5y/gkmPTWp0ELrZ1qLmoNXYUZ4YPU=;
 b=TGWp+gAs7sMTGnIBgMg3aY1K57fFPVEd/sROmPVM3KxfomsBziWM1qGVlR6OFWT0HD
 zG3FrBbeLti2KHY5QN6+ZADKGsfxpJ/TiE5A34tM6yp+e4XOvtSKsorRQnIddBYrOCSu
 /D+M8Db3t3smm4Mtxc0kF/4HLr4fJOGwrJmNZAcIsoro/6yX7HPQyd0sX8zaLMTKAa4v
 HnWCys+CwZkmo5MPhTqzyReKhdvj9eV9Ag3KtIwGcoFcytOje0NoGC3m4BC5t0GoF+wp
 eQHyU4BFitOpoJT+Ux5v1tPwq7J12isvBwbPxr52nJXS7TjmsHXmZDIlkkSNcpFls6/p
 1uZA==
X-Gm-Message-State: AOAM530J0q5qy+XBDl9KdaNY8nkh41WwFn9P3kyLQGMEYcxN0m/tE2m0
 Llt5gday9NJ5TKTddoUNPsheUsNfzUR9630L9Hs=
X-Google-Smtp-Source: ABdhPJznetkpPwFOPnkO6hYugmPt/qbsYirfS35QP2OsXcxLzQ5edOv1OG2qUwYiDgofqgybxlaeAWFh31XlBbdGgsY=
X-Received: by 2002:a2e:99ca:: with SMTP id l10mr2219430ljj.218.1602883965178; 
 Fri, 16 Oct 2020 14:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <20201016135351.GL13710@pengutronix.de> <20201016190149.55a3d62f@xps13>
 <CAOMZO5B4kC5ooE2Pmp4XaHq2xD51JSH35nF7_Ge8-xzp4piqKg@mail.gmail.com>
 <20201016230556.6693e69f@xps13>
In-Reply-To: <20201016230556.6693e69f@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Oct 2020 18:32:33 -0300
Message-ID: <CAOMZO5A8Y1=o6e3+BvBUVYpBUjhvdVG4eQm4fTan3+cZVTvG1A@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_173246_661953_DF14D496 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Fri, Oct 16, 2020 at 6:06 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Nice catch! But I don't get why host->pdata.hw_ecc would not be
> accessible from the attach hook. host->pdata is populated in the probe
> function, way before nand_scan(), where ->attach() is called. So for me
> host->pdata.hw_ecc should be accessible from ->attach().

Yes, now I understand it. pdata is only populated for non-dt platforms.

On 5.10-rc1 the non-dt imx users are gone, so we can get rid of pdata
on a separate patch.

> > Instead of using pdata, we can retrieve the "nand-ecc-mode" string
> > from the device tree.
>
> Please don't do that! The DT parsing should be centralized in the core.
>
> However, if you don't need this pdata entry you can get rid of it
> entirely. In theory, if the user set the nand-ecc-mode property, then
> chip->ecc.engine_type should already be set to the appropriate value
> when entering ->attach(). Can you please check its value? It should
> have been updated by rawnand_dt_init().

You are right. I have sent a v2, which lets the core determine the engine type.

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
