Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjm36-00046s-3w
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 08:57:28 +0000
Received: by mail-qg0-f43.google.com with SMTP id 63so7394201qgz.30
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 01:57:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE94FHEKTFKUDk1_+LMtJjUhcyowBV_=dyOyP-3emmw8-enVfg@mail.gmail.com>
References: <CAE94FHEKTFKUDk1_+LMtJjUhcyowBV_=dyOyP-3emmw8-enVfg@mail.gmail.com>
Date: Mon, 12 May 2014 16:57:06 +0800
Message-ID: <CAE94FHEiu1BFAXyVSAeM+-RAXb2kEtK-AQ1GgnHsVpUJKD8n3w@mail.gmail.com>
Subject: Re: Problems in TI omap2-nand driver
 OMAP_ECC_BCH8_CODE_HW_DETECTION_SW mode
From: Ted Juan <ted.juan@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Sorry, there is no problem. I got it.

The latest bch.c decode_bch() has XOR read_ecc and calc_ecc in it.



2014-05-12 16:08 GMT+08:00 Ted Juan <ted.juan@gmail.com>:
> Hi All,
>
> TI am3517/3505 can use the  OMAP_ECC_BCH8_CODE_HW_DETECTION_SW mode in
> the latest linux-mtd git tree.
>
> I post the latest driver and older driver as below.
>
> Wouldn't the latest driver get bad performance since it always do the
> decode_bch() ?
>
> Thanks,
> regards,
>
> Ted
>
>
> ==========the latest omap2.c driver==========
>
> int nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
>                           unsigned char *read_ecc, unsigned char *calc_ecc)
> {
>         const struct nand_chip *chip = mtd->priv;
>         struct nand_bch_control *nbc = chip->ecc.priv;
>         unsigned int *errloc = nbc->errloc;
>         int i, count;
>
>         count = decode_bch(nbc->bch, NULL, chip->ecc.size, read_ecc, calc_ecc,
>                            NULL, errloc);
>         if (count > 0) {
>
>        ......................
> }
>
>
> ==========older omap2.c driver==========
>
> static int omap_correct_data_bch(int correct_bits, struct mtd_info *mtd,
>                                  uint8_t *dat, uint8_t *read_ecc,
>                                  uint8_t *calc_ecc)
> {
>
>   ..................
>
>   for (i = 0; i < blockCnt; i++) {
>     /* check if any ecc error */
>     eccflag = 0;
>     for (j = 0; (j < eccsize) && (eccflag == 0); j++)
>       if (calc_ecc[j] != 0)
>        eccflag = 1;
>
>     if (eccflag == 1) {
>       eccflag = 0;
>       for (j = 0; (j < eccsize) && (eccflag == 0); j++)
>        if (read_ecc[j] != 0xFF)
>          eccflag = 1;
>     }
>
>     if (eccflag == 1) {
>       /*printk(KERN_INFO "...bch correct(%d 512 byte)\n", i+1);*/
>       count = decode_bch(mode, calc_ecc, err_loc);
>
>   ...............
>
>
> }
