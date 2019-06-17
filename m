Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D74C31E5B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 15:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6913B208CB
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 15:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mS0zinWZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ed4ihMNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6913B208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMEYAaP2IKCJ4KD2PRa2mpgkWk7ykKVwSuTTq9Yj/pQ=; b=mS0zinWZbQTCoZ
	3ocQrlw2gxuTGOhFn/uMDku858om+QwdT6WJo8g5/330V+q5JfcnOKfIViIZgTiiG7Axld/Y4Pahe
	gSeqvVUh4WaGcjH4Bq/zFXTTn3Jw2qEe0TCP/zGZxcvfXfS5pCN4limV9HtMvG+GAkLxgU17GhkzC
	l6Rj/5JvEKCXJ6WmF0e6UYvVMMK0mAm2iyMaqYbl6iehm9N60DvHtprz4oxZYUrODOne3ee85ALSD
	pQJFNT5FY9Ch+43IMfDS8uO2HvE/z4t34M9c5lmqQ1msTEujav9EfbPpfxbMDO4xTeMDdJVT7bF7B
	YXZS6hmQRerX1rESC38w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hctPF-0006QP-SM; Mon, 17 Jun 2019 15:18:50 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hctPC-0006OC-5d
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 15:18:47 +0000
Received: by mail-vk1-xa42.google.com with SMTP id 130so2132548vkn.9
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2019 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avGzyCxZclKT79pADY4DKIxqTozcBYUh0WnJ9dBhi1E=;
 b=ed4ihMNWHG89e7Xaq5+FGLxCCA+5JtfbgMQTrutcVtIUFc/8Xc5p7ERp90dJ5a/5lF
 I3MGOvl69DQXjZF3l5qryq0cR5T9YK/n7VaKJIq8hQYccky5s/xwoqen9GCkilKTSuxr
 AOWz1z+0Y+6fxqgfwix4gWIl+ilS5v/XR8eTCycB790d93Cc9++z4t8IOSbvO5teSBI5
 lEEHEiIwabUNKwbt+MXom5V9VOXoBLX2Rxtf3aW4eo8I5FnOBSAc3SW5aWluQArodm2k
 qtImm0+eKkSivZ+3lgV2Y7j+JamcqthViHOiZj8EcoF25bQFpsL5ypPvdyqcBHiLMus1
 Ut0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avGzyCxZclKT79pADY4DKIxqTozcBYUh0WnJ9dBhi1E=;
 b=H2+VS6bhM3O0ryO0us7UH93LQ+vnabyQZbm2SGd9UL+aqweSVmbtEohy3TdwBgCIcn
 PM1h8od1hng4k9FKiTrrLOhqHCyHFqafBuicdkCrV2cfGf11MWmtsaledxI7NLlbVDNw
 QBxS3RBSdqXhiqWonaVNuFaV+R8MmZ3A99uVI9RLi2GPyP8oT1hR1q7YDeKnhXyRm1JU
 E4IlYHUMZjzpwtS5+j5UIHqw2uE3uWJ8pCf9Mt7OL9InS9t1y+vOw56c1YkPXZsWU99J
 jD/+kTIAlroNTSy1a5VziEfJzRNAdGXZKmDUnofUN1Cxwdu29FvVhpgt2doKH4nco0FU
 UgkQ==
X-Gm-Message-State: APjAAAUyScDvhkv34G8LLz6ooRE9O/vo6Np4UOY/bTgI8vVQCuKiof/L
 1HoKMKP3hmaMezp0uk5jj4t0GcXB2BQZDf8Tw77Fnw==
X-Google-Smtp-Source: APXvYqybEt7W3M5qE6N0FBs9dBKJrhuavtDPLL4WFwFs7pHHWurEb3V/bgCHCADGQFV/vQ+BSWlb509dkOgV0n8YRMo=
X-Received: by 2002:a1f:2909:: with SMTP id p9mr27668514vkp.23.1560784724394; 
 Mon, 17 Jun 2019 08:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
 <1560336476-31763-2-git-send-email-sagar.kadam@sifive.com>
 <325855d0-00f9-df8a-ea57-c140d39dd6ef@ti.com>
In-Reply-To: <325855d0-00f9-df8a-ea57-c140d39dd6ef@ti.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Mon, 17 Jun 2019 20:48:33 +0530
Message-ID: <CAARK3H=O=h1VDgOMxs_0ThcisrH=2tzpW5pQqt0O9oYs=MFFVw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: spi-nor: add support for is25wp256
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_081846_245501_1C2ABB54 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: aou@eecs.berkeley.edu, tudor.ambarus@microchip.com,
 Wesley Terpstra <wesley@sifive.com>, richard@nod.at,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Vignesh,

Thanks for your review comments.

On Sun, Jun 16, 2019 at 6:14 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi,
>
> On 12-Jun-19 4:17 PM, Sagar Shrikant Kadam wrote:
> [...]
>
> > @@ -4129,7 +4137,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >       if (ret)
> >               return ret;
> >
> > -     if (nor->addr_width) {
> > +     if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
> >               /* already configured from SFDP */
>
> Hmm, why would you want to ignore addr_width that's read from SFDP table?

The SFDP table for ISSI device considered here, has addr_width set to
3 byte, and the flash considered
here is 32MB. With 3 byte address width we won't be able to access
flash memories higher address range.
Hence I have ignored the addr width from SFDP.  I have verified that
with 3 byte address width, the
flascp util fails while verifying the written data.  Please let me
know your views on this?

BR,
Sagar Kadam

> Regards
> Vignesh
>
>
> >       } else if (info->addr_width) {
> >               nor->addr_width = info->addr_width;
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index b3d360b..ff13297 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -19,6 +19,7 @@
> >  #define SNOR_MFR_ATMEL               CFI_MFR_ATMEL
> >  #define SNOR_MFR_GIGADEVICE  0xc8
> >  #define SNOR_MFR_INTEL               CFI_MFR_INTEL
> > +#define SNOR_MFR_ISSI                0x9d            /* ISSI */
> >  #define SNOR_MFR_ST          CFI_MFR_ST      /* ST Micro */
> >  #define SNOR_MFR_MICRON              CFI_MFR_MICRON  /* Micron */
> >  #define SNOR_MFR_MACRONIX    CFI_MFR_MACRONIX
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
