Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08661C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 11:34:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 434942084C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 11:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHNH5bOE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqcxIi2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 434942084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cPxfGCGrtSIayx3Cwr4u6NMOez9qMZKjuNEJ6ht66/Y=; b=QHNH5bOEtIc9k34FD6t9Fq/+l
	6+sDVu4ocV+hpNlrGOWjAT1uOHFeTiL/d12pkYrSalQzVjth2TWmjJ3gxXmAyj2fICITmfbhTU/az
	6QosuRRtR9+mNNZkmEOdHTmV+6pBlJKbKJDaZmJlZMNEKMK/Exff73YI6iFoj0LgnCL4hnXc93Sti
	omEltD6+hNVoc7U2vtRA52QxumXtWiVbcmDQpACLSlj4MEa2jFwPnYMV5DlPDJKB8KZY20DB/+tC2
	xbQXoqRdDNOdmBMC1qnll+qKX5Z5kG8vgOcYaOMg2pUPbXOFAkn6Ix6RMnFGEnxmr7f/H/eW0TwIp
	11w0E/CsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTNyu-0004K8-TV; Fri, 16 Oct 2020 11:33:08 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTNys-0004Iy-I1
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 11:33:07 +0000
Received: by mail-lj1-x244.google.com with SMTP id c21so1991099ljn.13
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssZWlUZYAqhq+7Kzaz6CRBh62PgmPmdLr7XQG0agxiM=;
 b=jqcxIi2jX3HbSOsXqRKqvvfMzpaEfGE5zkygiLH7mBU9Agz/dG+rGL93vOZg4l386P
 sjrJVoCZ5o66YSo5p6NwxfGUOA3s+TICy8GvYK4z9F5hq4h9UE6bxFg8PNDBTicSAo2O
 DPyPyxQZ34KENiI/3WzHaeTvuK2sU6hlPwigFWBZmA8dPICtwRr/OIvJRPCZBaol2Hbt
 nOs16Ddv3KUROCmwgzy7HHoKVipV6MUhlhd9sAMVzvFU3xluaDttE+ZvRZroSuf9s6FY
 n/jpQRiy1nQFQ8BMFqWjjeX/vLBIGmzEh/gsqzw0UiobzhHdveBGePnkVgYmvVnOg2Im
 la3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssZWlUZYAqhq+7Kzaz6CRBh62PgmPmdLr7XQG0agxiM=;
 b=IOMXc8F01s7jTI7VvlrzMdPJUUOckHuNugQoGeUtBdf4Rk7ylUUAd+GYOv2TKUAbQi
 ecAXNsOffOYoRKAFYE2wjAq/jd5BU3CLNDvgCTHtYa1faFtOsgI4qOMMM9lGsbMqbrUw
 /07c2fGDvOS3cPbFqg+iV62XRfrWOmJB88XtLdNXC/5Fc5hSSKNuCnTUTL0NBh5+JTR+
 cvQJGaMLvxswMD219Vc52QJMZQumB+7AJo7rd7VKooSoL+lrJz9EqlhIHxJ0bh40+TyV
 HOwQNcTVfFRxluEKSxh06XDtuvIVpLC+/a5H95qyjKvgaEui5vUkUeYk9RglVx26ogiy
 TEyw==
X-Gm-Message-State: AOAM533Fbg4CatWOBQDK3K08LRTcTeFhHlwftYIEMtCJ302sB9bg/rs5
 PYXME2v3RG+z1EBq+2iwNF485g4edU0Qv0KBw/c=
X-Google-Smtp-Source: ABdhPJx9rlk0VXZFR/mQhqTlr7djyj3GEpDOzHWqxDk8B4raJHg04B+s8eKdKs8zsA45df+fM7ace6gVzRMnQwlZvd8=
X-Received: by 2002:a2e:9a46:: with SMTP id k6mr1387373ljj.310.1602847985239; 
 Fri, 16 Oct 2020 04:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
In-Reply-To: <20201016074942.29650-1-miquel.raynal@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Oct 2020 08:32:54 -0300
Message-ID: <CAOMZO5BoLnbY=Y54SFYF+J2kbGyioHTZg=h_kw_JNXr_28ZOuA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_073306_606790_1581C640 
X-CRM114-Status: GOOD (  15.22  )
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

On Fri, Oct 16, 2020 at 4:49 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> No ECC initialization should happen during the host controller probe.
>
> Indeed, we need the probe to call nand_scan() in order to:
> - identify the device, its capabilities and constraints (nand_scan_ident())
> - configure the ECC engine accordingly (->attach_chip())
> - scan its content and prepare the core (nand_scan_tail())
>
> Moving these lines to mxcnd_attach_chip() fixes a regression caused by
> a previous commit supposed to clarify these steps.
>
> Fixes: TODO
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>
> Hi Han,
>
> Could you please give this patch a shot? It is supposed to fix
> the LS1043A issue we have seen in robots reports the last weeks.

Thanks for the mxc_nand fix!

The LS1043A uses a different NAND controller and its driver is
drivers/mtd/nand/raw/fsl_ifc_nand.c

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
