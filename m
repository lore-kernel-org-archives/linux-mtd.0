Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlBFn-0004LU-2s
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 06:04:23 +0000
Received: by mail-qg0-f49.google.com with SMTP id a108so3430149qge.22
 for <linux-mtd@lists.infradead.org>; Thu, 15 May 2014 23:04:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACC72F@DBDE04.ent.ti.com>
References: <CAE94FHEKTFKUDk1_+LMtJjUhcyowBV_=dyOyP-3emmw8-enVfg@mail.gmail.com>
 <CAE94FHEiu1BFAXyVSAeM+-RAXb2kEtK-AQ1GgnHsVpUJKD8n3w@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EACC72F@DBDE04.ent.ti.com>
Date: Fri, 16 May 2014 14:04:01 +0800
Message-ID: <CAE94FHFR+YcEwXDkVzRg1cHxMJ9qofyBuGbEffK7u7NWUEJNQg@mail.gmail.com>
Subject: Re: Problems in TI omap2-nand driver
 OMAP_ECC_BCH8_CODE_HW_DETECTION_SW mode
From: Ted Juan <ted.juan@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Pekon,

Thanks great help.

>>So, decode_bch() should handle both the checks implicitly:
>>- checking for bit-flip errors by matching read_ecc[] and calc_ecc[]
>>- filtering out "empty-pages" by comparing read_ecc[] with 0xff.

In lib/bch.c, I don't quiet understand how to " filtering out empty-pages".
It just check bit-flip error as below code.

                        for (i = 0, sum = 0; i < (int)ecc_words; i++) {
                                bch->ecc_buf[i] ^= bch->ecc_buf2[i];
                                sum |= bch->ecc_buf[i];
                        }


Another problem for am3505/am3517 product, we  use the new generation
nand flash that cause more bit-flip.
In the older omap nand flash driver, it seems it is no ability to
correct OOB bit-flip.
Does the latest driver support to correct OOB and Data bit-flip at the
same time?



2014-05-13 14:23 GMT+08:00 Gupta, Pekon <pekon@ti.com>:
> Hi Ted,
>
> From: Ted Juan
>>
>>Hi All,
>>
>>Sorry, there is no problem. I got it.
>>
>>The latest bch.c decode_bch() has XOR read_ecc and calc_ecc in it.
>>
>
> And IIRC, this also takes care of filtering out "empty-pages" (OOB=all(0xff)).
> because while calculating ECC_BCH8_CODE_HW_DETECTION_SW
> resultant GPMC ECC syndrome is XORed with a static bch8_polynomial[]
> in omap_calculate_ecc_bch().
>
> So, decode_bch() should handle both the checks implicitly:
> - checking for bit-flip errors by matching read_ecc[] and calc_ecc[]
> - filtering out "empty-pages" by comparing read_ecc[] with 0xff.
>
> Otherwise you would have started seeing lot of un-correctable errors
> while mounting UBIFS.
>
>
> with regards, pekon
>
>>
>>
>>2014-05-12 16:08 GMT+08:00 Ted Juan <ted.juan@gmail.com>:
>>> Hi All,
>>>
>>> TI am3517/3505 can use the  OMAP_ECC_BCH8_CODE_HW_DETECTION_SW mode in
>>> the latest linux-mtd git tree.
>>>
>>> I post the latest driver and older driver as below.
>>>
>>> Wouldn't the latest driver get bad performance since it always do the
>>> decode_bch() ?
>>>
>>> Thanks,
>>> regards,
>>>
>>> Ted
>>>
>>>
>>> ==========the latest omap2.c driver==========
>>>
>>> int nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
>>>                           unsigned char *read_ecc, unsigned char *calc_ecc)
>>> {
>>>         const struct nand_chip *chip = mtd->priv;
>>>         struct nand_bch_control *nbc = chip->ecc.priv;
>>>         unsigned int *errloc = nbc->errloc;
>>>         int i, count;
>>>
>>>         count = decode_bch(nbc->bch, NULL, chip->ecc.size, read_ecc, calc_ecc,
>>>                            NULL, errloc);
>>>         if (count > 0) {
>>>
>>>        ......................
>>> }
>>>
>>>
>>> ==========older omap2.c driver==========
>>>
>>> static int omap_correct_data_bch(int correct_bits, struct mtd_info *mtd,
>>>                                  uint8_t *dat, uint8_t *read_ecc,
>>>                                  uint8_t *calc_ecc)
>>> {
>>>
>>>   ..................
>>>
>>>   for (i = 0; i < blockCnt; i++) {
>>>     /* check if any ecc error */
>>>     eccflag = 0;
>>>     for (j = 0; (j < eccsize) && (eccflag == 0); j++)
>>>       if (calc_ecc[j] != 0)
>>>        eccflag = 1;
>>>
>>>     if (eccflag == 1) {
>>>       eccflag = 0;
>>>       for (j = 0; (j < eccsize) && (eccflag == 0); j++)
>>>        if (read_ecc[j] != 0xFF)
>>>          eccflag = 1;
>>>     }
>>>
>>>     if (eccflag == 1) {
>>>       /*printk(KERN_INFO "...bch correct(%d 512 byte)\n", i+1);*/
>>>       count = decode_bch(mode, calc_ecc, err_loc);
>>>
>>>   ...............
>>>
>>>
>>> }
>>
>
