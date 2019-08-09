Return-Path: <SRS0=Etow=WF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC16EC433FF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2019 14:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2551208C3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2019 14:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rAmf7cZl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CY0rWQRd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2551208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+8b5fPui/xI0ci2Y/Dy8gfofIfj6qtVkOYzSGuXJlc=; b=rAmf7cZler43c5
	E+qelBJJsdOKrGO8eUabt2rnvtw8zKqdcnHMXufwetpiHmpznwGBh8IlDuPO12sEMjKDsNfQN1oFi
	kNil5besxiJdh29xStvR+rzTzC/hf6Pxb6i7QoxzzDyVE9Gnnw4EBHGMCChMyu/Ag3tvsss6E5nre
	QcUc5i4yNUoOH2dDotrPhkMEGOtfcuLAbulHU6NUiEAdv997bcMeJU1w3xLpNRsbuqM1Te2d6P0PH
	rPRfj/nbpQp2PsfPqgY6kpGrvlzvyM06xhOrLZbPFrXAmWQE03cKfVSpPAchZ4L3a3zBEzmKPe+mP
	1PJiZM2UJJyC5mHuZkiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw5oH-0005Z1-VM; Fri, 09 Aug 2019 14:24:01 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw5oE-0005XM-N1
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2019 14:24:00 +0000
Received: by mail-vs1-xe44.google.com with SMTP id m8so65612570vsj.0
 for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2019 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7R0g53oVtt0hxxPewtlUubukC0ZyQYO8NJIzmT0oCc=;
 b=CY0rWQRdZgm3Ad62s5QrVWqWafZ2c4deK+wY2x9OydvIryPzFGXumM3IxKlB1H0pUY
 uKqxFClA0jt3i9qT3hyv3Vqd7MJ8YS+AxXll30XRDO7b4emBw3tyAnSGATWwko9X+htn
 C32Z8FBOcLKTgKp5ypcuGXxV43Uhm9TjyQrbB++wr4dtXfWVnUk47P2Du1/IGOjj/UH9
 KVXRdeS473BuCucIRIFrGiWV4O04/U19xCUkb9zsd4nlevhIXNcwEHEMhZtwxculYkU1
 a1rIqeiQ456hygBSV3CBkLVci5EqUiJ46r/SQ0idsmLEKV6Q0+BP9Y2ME9uYnFP/KPkT
 UKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7R0g53oVtt0hxxPewtlUubukC0ZyQYO8NJIzmT0oCc=;
 b=p8LdG2t4VplXGKbXvkF4K9ugK3KJpuvo/Bd3wBqoLZSvLoSyAcvZzMFW1Uis5Mvnha
 vveebl076u8oQEeFd9VDw4RYRY+YpR12BID61WT6L++VlkK0pi/y4ZR/jzi7U3B1U9t8
 NWplFlf4U5OkcsivrSk9RgpnlZC2dlGBj2ro7SsHZObx8xZxhltyeC3tKKTzeNZsf8Xt
 ZBLlrhdQXtN5JEQTkTTpVAb815wM946J1srNK3PPD2VptA9vbIzrDiDA10UfZmqWRRlo
 YjqoCLnCgF2WfzYUsWzMvaINaj2m6NYPqjZTfulcFEbWqUQFGmIymeEHxC7zpNYk/mbx
 4Xxw==
X-Gm-Message-State: APjAAAUAJankN67o6chFqi0WxtaEPs+G1aGNzpIGqKeFKwF0EziVvcIu
 E08MsDg1QMXKQYPS2OMxrL4y8oWqU+HJmM8oGoP64Q==
X-Google-Smtp-Source: APXvYqzZs94CLTPNtEOYUE3fPG/Fo1fnQN3kFLmROvw+v8aNS7cQMk9CTW2FiPWDlpzolz9aC8Su/VC/9T/aUP4Giyk=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr3880063vst.178.1565360636286; 
 Fri, 09 Aug 2019 07:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
 <1562092745-11541-5-git-send-email-sagar.kadam@sifive.com>
 <f3a1617e-0478-63ea-ab76-feaab7ac1e9b@ti.com>
In-Reply-To: <f3a1617e-0478-63ea-ab76-feaab7ac1e9b@ti.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Fri, 9 Aug 2019 19:53:45 +0530
Message-ID: <CAARK3HkRgchmPZRpHfHj69OMUn=K7Zp-az5YYtBOW_jdASgYyw@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mtd: spi-nor: add locking support for is25wp256
 device
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_072358_816815_DB59CA91 
X-CRM114-Status: GOOD (  21.38  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, tudor.ambarus@microchip.com,
 richard@nod.at, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Vignesh,

On Fri, Aug 9, 2019 at 4:57 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi Sagar,
>
> On 03/07/19 12:09 AM, Sagar Shrikant Kadam wrote:
> [...]> +static int issi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> > +{
> > +     int status_old, status_new, blk_prot;
> > +     u8 mask;
> > +     u8 shift;
> > +     u8 pow, ret, func_reg;
> > +     bool use_top;
> > +     loff_t lock_len;
> > +
> > +     if (nor->flags & SNOR_F_HAS_BP3)
> > +             mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
> > +     else
> > +             mask = SR_BP2 | SR_BP1 | SR_BP0;
> > +
> > +     shift = ffs(mask) - 1;
> > +
> > +     status_old = read_sr(nor);
> > +
> > +     /* if status reg is Write protected don't update bit protection */
> > +     if (status_old & SR_SRWD) {
> > +             dev_err(nor->dev,
> > +                     "SR is write protected, can't update BP bits...\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret = spi_nor_select_zone(nor, ofs, len, status_old, &use_top, 1);
> > +     if (!ret)
> > +             /* Older protected blocks include the new requested block's */
> > +             return 0;
> > +     else if (ret < 0)
> > +             return ret;
> > +
> > +     func_reg = spi_nor_read_fr(nor);
>
Thank you for reviewing the patch.
> Sorry, I don't understand where func_reg is used? Since TBS OTP, how
> does issi_lock() code comprehend that TBS bit value in OTP register and
> use_top returned by spi_nor_select_zone() are matching before we go
> ahead and program status register.
>
In my earlier version of this patch, you had suggested an approach to skip
updating the TBS OTP bits as ones written that cannot be changed.
Actually, func_reg was used to update the OTP section, sorry I missed
removing the func_reg reference here as per your suggestion.
I will update a new version of this patch which will not modify the OTP
region and will return with an error when locking the requested region by
the user is not possible.

> We should reject locking request if top-bottom calculation does not
> match OTP bit. Where is that done?
>
> Regards
> Vignesh
>

Thanks & BR,
Sagar
> > +     /* lock_len: length of region that should end up locked */
> > +     if (use_top)
> > +             lock_len = nor->mtd.size - ofs;
> > +     else
> > +             lock_len = ofs + len;
> > +
> > +     pow = order_base_2(lock_len);
> > +     blk_prot = mask & (((pow + 1) & 0xf) << shift);
> > +     if (lock_len <= 0) {
> > +             dev_err(nor->dev, "invalid Length to protect");
> > +             return -EINVAL;
> > +     }
> > +
> > +     status_new = status_old | blk_prot;
> > +     if (status_old == status_new)
> > +             return 0;
> > +
> > +     return write_sr_and_check(nor, status_new, mask);
> > +}
> > +
> > +/**
> >   * issi_unlock() - clear BP[0123] write-protection.
> >   * @nor: pointer to a 'struct spi_nor'.
> >   * @ofs: offset from which to unlock memory.
> > @@ -4171,6 +4338,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >       if (JEDEC_MFR(info) == SNOR_MFR_ISSI &&
> >           info->flags & SPI_NOR_HAS_LOCK &&
> >           info->flags & SPI_NOR_HAS_BP3) {
> > +             nor->flash_lock = issi_lock;
> >               nor->flash_unlock = issi_unlock;
> >       }
> >
> > @@ -4194,6 +4362,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >               nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> >       if (info->flags & USE_CLSR)
> >               nor->flags |= SNOR_F_USE_CLSR;
> > +     if (info->flags & SPI_NOR_HAS_BP3)
> > +             nor->flags |= SNOR_F_HAS_BP3;
> >
> >       if (info->flags & SPI_NOR_NO_ERASE)
> >               mtd->flags |= MTD_NO_ERASE;
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index f6fa70f..26dbf48 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -40,6 +40,8 @@
> >  #define SPINOR_OP_RDSR               0x05    /* Read status register */
> >  #define SPINOR_OP_WRSR               0x01    /* Write status register 1 byte */
> >  #define SPINOR_OP_RDSR2              0x3f    /* Read status register 2 */
> > +#define SPINOR_OP_RDFR               0x48    /* Read Function register */
> > +#define SPINOR_OP_WRFR               0x42    /* Write Function register 1 byte */
> >  #define SPINOR_OP_WRSR2              0x3e    /* Write status register 2 */
> >  #define SPINOR_OP_READ               0x03    /* Read data bytes (low frequency) */
> >  #define SPINOR_OP_READ_FAST  0x0b    /* Read data bytes (high frequency) */
> > @@ -139,6 +141,9 @@
> >  /* Enhanced Volatile Configuration Register bits */
> >  #define EVCR_QUAD_EN_MICRON  BIT(7)  /* Micron Quad I/O */
> >
> > +/*Function register bit */
> > +#define FR_TB                        BIT(1)  /*ISSI: Top/Bottom protect */
> > +
> >  /* Flag Status Register bits */
> >  #define FSR_READY            BIT(7)  /* Device status, 0 = Busy, 1 = Ready */
> >  #define FSR_E_ERR            BIT(5)  /* Erase operation status */
> >
>
> --
> Regards
> Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
