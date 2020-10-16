Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A73C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:38:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A3C204EA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tl7u350/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7wglLcx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A3C204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxO62mq8wN5SH3BaEua99iPc7LqST1F4NIBvCRQWauI=; b=Tl7u350/csQYl7FPC/B+wObbO
	QH4va44iaxJ5OojayOk3eLMa0hhhzVMSmFZGWX8IeCKDUmboIVQiDD5za/AEFDb1og53lqQ9Yx12/
	bf9/rHHkuA2gSNNfMloLUY2UOZkvnd+GRAAp6i7yhml+ZaF2q7K7Ehz4A7t8kXnNFXXO4ytavap3R
	e+MK5Qd9tm1VmwSvGddmGDSxlwEtyFY7amUU1tA7Z6PmlTq5QMmg13jf0DelnHM2vKp9lS/njB3/6
	mCqiQG9bEDxdqfLAfcZvuTJGtAIogcYfnXfiVJlUHPHWjR2Y6Ljd7CTf3f0v1pZK79vYYjuQrPvTg
	utrMckIrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTfi-00016z-Hj; Fri, 16 Oct 2020 17:37:42 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTfT-0000zT-Ix
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 17:37:28 +0000
Received: by mail-lf1-x144.google.com with SMTP id b1so3917726lfp.11
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ktORRaEGj6t+QkjmdfpKcWpqDeS5j4En28tkSoEFI0=;
 b=e7wglLcxZXOBGxfbh3Zg1u1PQDgSw4+um+YiM/1eGEecT6u1ZsaGjhA1to7qTsO3Jp
 w/r9/jGYD8XvlJlJomIMLeStuqYwP79J41DNI4AQf0RUwwU7a1iF5okb19YDfdI41fht
 9xeJGa3OTmbFB7eHlisuxM/C9dytI4wXX4f/fDvgOZJY/RB3ME6R3J7bMKI08OSZpfgo
 nA6OzzKP7gEh9NaIUmhb+sQHE2aArbkDajWn6JaxIBXXeucP9TG4Q+SmaAZmxmoTYgmD
 fRG1n6u4U1ViVWwoaLX/dk6TiVSUwqguRMJuZtNpWJ2PsaOvDHEvN/7CRY+cm3z6SgLU
 xZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ktORRaEGj6t+QkjmdfpKcWpqDeS5j4En28tkSoEFI0=;
 b=EORABXU/VXvCCCdexFbG+WPu53cJmp17sM7C2/0DUZ+iKoFTDfnfnD+lzwTKcjNwJd
 I1HwTPMx0m1MwsH6Kt5FXYNVMOA2awKqMHluGpDJeLF0xEfMFmrSeo7s+BR1tjIlmR6y
 Lg8R/SFFhnOQJoQWhdIoooJ9q4uA+IEw+Wa/HQL9Kclg86fmti0s1bWw3R8nBkMvb4co
 GgHOZjmpZuap4I+sRTlFNQ/gtHC9fX3qPEk7LOzIjA8bSDwII7DcqR0WhOQjJu+WVxH8
 Vy5LUYVUplhxTN/NHYqrNsJ9Ml1TiD5K831T0HqQ9QFwn2TvRulF1zYgY+o7Lu28vXPl
 7y6w==
X-Gm-Message-State: AOAM5339Nuhm1fOMiXW2O7yEsttvqNiLIoVKHySrFxwkxfPLIRrK4/1k
 e0y/WW2vgXlQqnLj/2+UJYX7lZHSsUB/J76Osv0=
X-Google-Smtp-Source: ABdhPJz8V0hzY1IghZHF2S8xfr3BxKKvEH38/+9XzhYyXzslijfuNw8WQyJnfvTstz2PjYph5OFBmIBECW4yGrvh61o=
X-Received: by 2002:a19:820c:: with SMTP id e12mr1666821lfd.215.1602869845873; 
 Fri, 16 Oct 2020 10:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <20201016135351.GL13710@pengutronix.de> <20201016190149.55a3d62f@xps13>
In-Reply-To: <20201016190149.55a3d62f@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Oct 2020 14:37:14 -0300
Message-ID: <CAOMZO5Dd9u-xRsp__kv_1jyo1b__1E32YjAKyD7=hw83x3h3=A@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_133727_679735_FAE47D70 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, Oct 16, 2020 at 2:01 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Software ECC is used, is it expected?
>
> Can you trace rawnand_dt_init() to see what happen in the engine_type
> choice?

I managed to resurrect an old imx27-pdk board here and reproduced the
same behavior as Sascha reported.

engine_type looks good. ecc.size is still 0.

I am using this debug patch:

--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5036,6 +5036,12 @@ static int rawnand_dt_init(struct nand_chip *chip)
        chip->ecc.strength = nand->ecc.user_conf.strength;
        chip->ecc.size = nand->ecc.user_conf.step_size;

+
+       pr_info("********** chip->ecc.engine_type is %d\n",
chip->ecc.engine_type);
+       pr_info("********** chip->ecc.strength is %d\n", chip->ecc.strength);
+       pr_info("********** chip->ecc.size is %d\n", chip->ecc.size);
+       pr_info("********** chip->ecc.algo is %d\n", chip->ecc.algo);
+
        return 0;
 }

and I get:

nand: ********** chip->ecc.engine_type is 3
nand: ********** chip->ecc.strength is 0
nand: ********** chip->ecc.size is 0
nand: ********** chip->ecc.algo is 0
nand: device found, Manufacturer ID: 0xec, Chip ID: 0xaa
nand: Samsung NAND 256MiB 1,8V 8-bit
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/mxc_nand.c:1391
mxc_nand_command+0x22c/0x280
Unimplemented command (cmd=0)
Modules linked in:

If I checkout commit  d7157ff49a ("mtd: rawnand: Use the ECC framework
user input parsing bits") in today's linux-next and revert it, then
the driver probes fine and prints:

nand: ******** ecc.engine_type = 3
nand: ******** chip->ecc.strength = 0
nand: ******** chip->ecc.size = 512

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
