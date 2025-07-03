Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D64C77B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jul 2025 04:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeP8nMqZChBRzbEBMupXk3PeZslTwUWUBjrQqViAYos=; b=i3C5hvnfG63OPzHlt5cor/6vxc
	ZLPrwDUXyGIgBbhuD3pDqO38t7YQULpIIxRYDb/IKaK17CdYb+NHZvpoywLh1ViJ9rDq9biv0COxv
	6egPU+KQ0Smmg+LJCf1jQKeKpqSZKHd8sqc7mfqQNtE2S5mIU2hUzgjP8cNq0BqJNjHeu4UVenvjS
	ReB7yXZ2IjdqlrI4CTmd70/I9QoGHEl0h4AhgX/htkX3RIZsDeSFCYTiUuGm+e+sIsKf3BrsCsQav
	N5WG1Cn8Vb+Lc5tsQvJVR2KcBIbKcH/4OTlRsSsRLMjZWvEsO0/h9rvWk+31lRXjifsUFsTfKI20w
	WEs8lkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXBX3-0000000AD3U-2dCt;
	Thu, 03 Jul 2025 04:26:45 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXBX0-0000000AD1g-1xmg
	for linux-mtd@lists.infradead.org;
	Thu, 03 Jul 2025 04:26:43 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4e7fc3309f2so1853267137.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2025 21:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751516800; x=1752121600; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oR3intOFRtj2+ehQSXYvoSCbAzpxZlr+CLLNOsSX9D0=;
        b=LkDWCzDvMVFwRtDCL1RsFrLhPkHTYeKdIOD2KwfUsoqdQTrQgZ5bY5bktgs9k+uMxp
         B+elcqKixxXV1Tcv5kbqsAMyEkH+bui8IHgv+OYvyrWH2NL3YcS5EPoc08heay8raZO2
         M2/+lCHyPZPlhyVGVaXPULD4PireS/Jvh5NiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751516800; x=1752121600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oR3intOFRtj2+ehQSXYvoSCbAzpxZlr+CLLNOsSX9D0=;
        b=R+PNFaXACQwuNAph8ID94T+j0kMOZw6Y2xE8DbGANcGhkw34xDrrTYSDI9SQD2QrSk
         QIw0gQ2V59UMO9m8Tz22NWnRCZvxHRdagCrvtNMJNSNqH6rwPzlv2W1puZeumUZgjktS
         IZWQkqnR7RvnDOIWWYTO7i1pfoBTTonxqbzpZnsMIe4MqpdkkF+rsTVqvd5qhCWkqVSt
         EayfS83+lwKtHWQULr9R6PpNNY8B1oldmeNzmVNAamwuZiqnZNGz2BK8bknFEiKUNP4o
         HKKg3EYCHyKHyvgniMgDN/W8a+VMRpEpHxSz6uXBCZXN7zAWVUQ0O9bbQgIUX8OPqVXT
         s3ew==
X-Forwarded-Encrypted: i=1; AJvYcCUXu1J1GpOJ0Kze7RHBBUiI8QZSMkD9FPEleKm7P7GiABhN4WjG+6igcUzo5LvNekkojz/p5J9rHHo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9xbkiHvP9bf6/qCdNfZsoD7j+tZpMDGt77UTb8qmq0FazDBv9
	akABN6w7TdqOKU2q5ulubk+9DB7ojwped/kRQgb4wnHu1Xdq39du7Z2sj3oQ5P/gMa1uTWxLIMe
	Cfwsb0t9ujHIbQrGhBymfYPKgsXjSP/ydwwV2gd82
X-Gm-Gg: ASbGncu7dkH6GB0knlSKVTLOnyWhkSjk76TaUzMavSZ/q7+dRDUdNHYLQi0kukbigRD
	Aw6J/NGPpEYmBo94d+DR+WSphNfsujw82coLbQJSNazHl9aGP7jd5ZOgyoFQ+/q7If0P2crnTme
	7+1QUBOOUlehfZGM96patiDCJN+onHorWmbrL/hYsDEG+Dm6KHC/kpmyLifov/WKdno6qaC/Ibs
	3yO
X-Google-Smtp-Source: AGHT+IEODLTrpBAi83tBbqZYa/XkE3UKK6OEb3EAOtqCOln6MR7xsRe1eyJ+Ek2BIoORyf5tq5M0jHYijgz9KyoyDa4=
X-Received: by 2002:a05:6102:2b82:b0:4e5:9d76:e8c8 with SMTP id
 ada2fe7eead31-4f161349037mr4042320137.18.1751516800381; Wed, 02 Jul 2025
 21:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250703024719.2256470-1-dregan@broadcom.com>
In-Reply-To: <20250703024719.2256470-1-dregan@broadcom.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 2 Jul 2025 21:26:28 -0700
X-Gm-Features: Ac12FXxqv8Q9mT44xCVBUiCdehr8yT8a-r75G0draqBsT52zP4n0OgyPCIUlz8c
Message-ID: <CAHi4H7Ea38sfiUyOfo81avP4brxp+3b+SO3csGWdLU9+qohqGg@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: nand: brcmnand: fix mtd corrected bits stat
To: david regan <dregan@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com, 
	florian.fainelli@broadcom.com, kamal.dasu@broadcom.com, 
	dan.beygelman@broadcom.com, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	vigneshr@ti.com, richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	jaimeliao.tw@gmail.com, kilobyte@angband.pl, jonas.gorski@gmail.com, 
	dgcbueu@gmail.com, dregan@mail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_212642_559732_93FB68AA 
X-CRM114-Status: GOOD (  28.06  )
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
Content-Type: multipart/mixed; boundary="===============5230802191208862026=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5230802191208862026==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ba9f900638fec8c8"

--000000000000ba9f900638fec8c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:47=E2=80=AFPM david regan <dregan@broadcom.com> wr=
ote:
>
> From: David Regan <dregan@broadcom.com>
>
> Currently we attempt to get the amount of flipped bits from a hardware
> location which is reset on every subpage. Instead obtain total flipped
> bits stat from hardware accumulator. In addition identify the correct
> maximum subpage corrected bits.
>
> Signed-off-by: David Regan <dregan@broadcom.com>
> ---
>  v3: Use brcmnand_corr_total to obtain maximum subpage flipped
>      bits for further backwards compatibility.
>
>  v2: Add >=3D v4 NAND controller support as requested by Jonas.
>      mtd->ecc_stats.corrected accumulates instead of set to total.
>      Remove DMA specific flipped bits count.
>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 53 +++++++++++++++++-------
>  1 file changed, 38 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/=
raw/brcmnand/brcmnand.c
> index 62bdda3be92f..b13f5f8f0eec 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -359,6 +359,7 @@ enum brcmnand_reg {
>         BRCMNAND_CORR_THRESHOLD_EXT,
>         BRCMNAND_UNCORR_COUNT,
>         BRCMNAND_CORR_COUNT,
> +       BRCMNAND_READ_ERROR_COUNT,
>         BRCMNAND_CORR_EXT_ADDR,
>         BRCMNAND_CORR_ADDR,
>         BRCMNAND_UNCORR_EXT_ADDR,
> @@ -389,6 +390,7 @@ static const u16 brcmnand_regs_v21[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
>         [BRCMNAND_UNCORR_COUNT]         =3D     0,
>         [BRCMNAND_CORR_COUNT]           =3D     0,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D     0,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D  0x60,
>         [BRCMNAND_CORR_ADDR]            =3D  0x64,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D  0x68,
> @@ -419,6 +421,7 @@ static const u16 brcmnand_regs_v33[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
>         [BRCMNAND_UNCORR_COUNT]         =3D     0,
>         [BRCMNAND_CORR_COUNT]           =3D     0,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D  0x80,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D  0x70,
>         [BRCMNAND_CORR_ADDR]            =3D  0x74,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D  0x78,
> @@ -449,6 +452,7 @@ static const u16 brcmnand_regs_v50[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
>         [BRCMNAND_UNCORR_COUNT]         =3D     0,
>         [BRCMNAND_CORR_COUNT]           =3D     0,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D  0x80,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D  0x70,
>         [BRCMNAND_CORR_ADDR]            =3D  0x74,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D  0x78,
> @@ -479,6 +483,7 @@ static const u16 brcmnand_regs_v60[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D  0xc4,
>         [BRCMNAND_UNCORR_COUNT]         =3D  0xfc,
>         [BRCMNAND_CORR_COUNT]           =3D 0x100,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D 0x104,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D 0x10c,
>         [BRCMNAND_CORR_ADDR]            =3D 0x110,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D 0x114,
> @@ -509,6 +514,7 @@ static const u16 brcmnand_regs_v71[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D  0xe0,
>         [BRCMNAND_UNCORR_COUNT]         =3D  0xfc,
>         [BRCMNAND_CORR_COUNT]           =3D 0x100,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D 0x104,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D 0x10c,
>         [BRCMNAND_CORR_ADDR]            =3D 0x110,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D 0x114,
> @@ -539,6 +545,7 @@ static const u16 brcmnand_regs_v72[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D  0xe0,
>         [BRCMNAND_UNCORR_COUNT]         =3D  0xfc,
>         [BRCMNAND_CORR_COUNT]           =3D 0x100,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D 0x104,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D 0x10c,
>         [BRCMNAND_CORR_ADDR]            =3D 0x110,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D 0x114,
> @@ -959,11 +966,11 @@ static inline u16 brcmnand_cs_offset(struct brcmnan=
d_controller *ctrl, int cs,
>         return offs_cs0 + cs * ctrl->reg_spacing + cs_offs;
>  }
>
> -static inline u32 brcmnand_count_corrected(struct brcmnand_controller *c=
trl)
> +static inline u32 brcmnand_corr_total(struct brcmnand_controller *ctrl)
>  {
> -       if (ctrl->nand_version < 0x0600)
> -               return 1;
> -       return brcmnand_read_reg(ctrl, BRCMNAND_CORR_COUNT);
> +       if (ctrl->nand_version < 0x400)
> +               return 0;
> +       return brcmnand_read_reg(ctrl, BRCMNAND_READ_ERROR_COUNT);
>  }
>
>  static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
> @@ -2066,15 +2073,20 @@ static int brcmnand_dma_trans(struct brcmnand_hos=
t *host, u64 addr, u32 *buf,
>   */
>  static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *=
chip,
>                                 u64 addr, unsigned int trans, u32 *buf,
> -                               u8 *oob, u64 *err_addr)
> +                               u8 *oob, u64 *err_addr, unsigned int *cor=
r)
>  {
>         struct brcmnand_host *host =3D nand_get_controller_data(chip);
>         struct brcmnand_controller *ctrl =3D host->ctrl;
>         int i, ret =3D 0;
> +       unsigned int prev_corr;
> +
> +       if (corr)
> +               *corr =3D 0;
>
>         brcmnand_clear_ecc_addr(ctrl);
>
>         for (i =3D 0; i < trans; i++, addr +=3D FC_BYTES) {
> +               prev_corr =3D brcmnand_corr_total(ctrl);
>                 brcmnand_set_cmd_addr(mtd, addr);
>                 /* SPARE_AREA_READ does not use ECC, so just use PAGE_REA=
D */
>                 brcmnand_send_cmd(host, CMD_PAGE_READ);
> @@ -2099,13 +2111,16 @@ static int brcmnand_read_by_pio(struct mtd_info *=
mtd, struct nand_chip *chip,
>
>                         if (*err_addr)
>                                 ret =3D -EBADMSG;
> -               }
> +                       else {
> +                               *err_addr =3D brcmnand_get_correcc_addr(c=
trl);
>
> -               if (!ret) {
> -                       *err_addr =3D brcmnand_get_correcc_addr(ctrl);
> +                               if (*err_addr) {
> +                                       ret =3D -EUCLEAN;
>
> -                       if (*err_addr)
> -                               ret =3D -EUCLEAN;
> +                                       if (corr && (brcmnand_corr_total(=
ctrl) - prev_corr) > *corr)
> +                                               *corr =3D brcmnand_corr_t=
otal(ctrl) - prev_corr;
> +                               }
> +                       }
>                 }
>         }
>
> @@ -2173,6 +2188,8 @@ static int brcmnand_read(struct mtd_info *mtd, stru=
ct nand_chip *chip,
>         int err;
>         bool retry =3D true;
>         bool edu_err =3D false;
> +       unsigned int corrected =3D 0; /* max corrected bits per subpage *=
/
> +       unsigned int prev_tot =3D brcmnand_corr_total(ctrl);
>
>         dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr,=
 buf);
>
> @@ -2200,9 +2217,11 @@ static int brcmnand_read(struct mtd_info *mtd, str=
uct nand_chip *chip,
>                         memset(oob, 0x99, mtd->oobsize);
>
>                 err =3D brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
> -                                              oob, &err_addr);
> +                                          oob, &err_addr, &corrected);
>         }
>
> +       mtd->ecc_stats.corrected +=3D brcmnand_corr_total(ctrl) - prev_to=
t;
> +
>         if (mtd_is_eccerr(err)) {
>                 /*
>                  * On controller version and 7.0, 7.1 , DMA read after a
> @@ -2240,16 +2259,20 @@ static int brcmnand_read(struct mtd_info *mtd, st=
ruct nand_chip *chip,
>         }
>
>         if (mtd_is_bitflip(err)) {
> -               unsigned int corrected =3D brcmnand_count_corrected(ctrl)=
;
> -
>                 /* in case of EDU correctable error we read again using P=
IO */
>                 if (edu_err)
>                         err =3D brcmnand_read_by_pio(mtd, chip, addr, tra=
ns, buf,
> -                                                  oob, &err_addr);
> +                                                  oob, &err_addr, &corre=
cted);
>
>                 dev_dbg(ctrl->dev, "corrected error at 0x%llx\n",
>                         (unsigned long long)err_addr);
> -               mtd->ecc_stats.corrected +=3D corrected;
> +               /*
> +                * if flipped bits accumulator is not supported but we de=
tected
> +                * a correction, increase stat by 1 to match previous beh=
avior.
> +                */
> +               if (brcmnand_corr_total(ctrl) =3D=3D prev_tot)
> +                       mtd->ecc_stats.corrected++;
> +
>                 /* Always exceed the software-imposed threshold */
>                 return max(mtd->bitflip_threshold, corrected);
>         }
> --
> 2.43.5
>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000ba9f900638fec8c8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIMZIhr6cnAuhwoXGWO4zGbKNgqZJ
QNKVavk/ahtEfJoQMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDcwMzA0MjY0MFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAJJ1cu1A+37ES7JvJ122dNHkdmHd4g4pCuRXv/Fo18W1lcgRoFcxeZRFvo64aXuh
aJ0heQXV8IEcxXEA/FQEeEwrkfpUkunayMIYvlWgJEh5by2bDYiFNpcOySq2Rqd9LfYsdZB52ThH
zGLy1Dggg+uGtPnMBOuig0pEYytFEf338oY/IDlmO8qs/9X3nGn6CBlxUCLh4052W04IrdW0r13e
2IffVfq4kRqcKzBQ+8AO9gIKfzxLBU5+HNWxX1xRDo3PN5tR0YfhCP2KREbFIF7tBt3zpHXRvy8K
q9/RrlTHdKtSAkSK9NZY3gy81M5R4MhHnqkz+LSuNBh0n6FIh0g=
--000000000000ba9f900638fec8c8--


--===============5230802191208862026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5230802191208862026==--

