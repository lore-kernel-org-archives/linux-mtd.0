Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk689-0006wo-W7
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 06:24:02 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ted Juan <ted.juan@gmail.com>
Subject: RE: Problems in TI omap2-nand driver
 OMAP_ECC_BCH8_CODE_HW_DETECTION_SW mode
Date: Tue, 13 May 2014 06:23:35 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACC72F@DBDE04.ent.ti.com>
References: <CAE94FHEKTFKUDk1_+LMtJjUhcyowBV_=dyOyP-3emmw8-enVfg@mail.gmail.com>
 <CAE94FHEiu1BFAXyVSAeM+-RAXb2kEtK-AQ1GgnHsVpUJKD8n3w@mail.gmail.com>
In-Reply-To: <CAE94FHEiu1BFAXyVSAeM+-RAXb2kEtK-AQ1GgnHsVpUJKD8n3w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ted,

From: Ted Juan
>
>Hi All,
>
>Sorry, there is no problem. I got it.
>
>The latest bch.c decode_bch() has XOR read_ecc and calc_ecc in it.
>

And IIRC, this also takes care of filtering out "empty-pages" (OOB=3Dall(0x=
ff)).
because while calculating ECC_BCH8_CODE_HW_DETECTION_SW
resultant GPMC ECC syndrome is XORed with a static bch8_polynomial[]
in omap_calculate_ecc_bch().

So, decode_bch() should handle both the checks implicitly:
- checking for bit-flip errors by matching read_ecc[] and calc_ecc[]
- filtering out "empty-pages" by comparing read_ecc[] with 0xff.

Otherwise you would have started seeing lot of un-correctable errors
while mounting UBIFS.


with regards, pekon

>
>
>2014-05-12 16:08 GMT+08:00 Ted Juan <ted.juan@gmail.com>:
>> Hi All,
>>
>> TI am3517/3505 can use the  OMAP_ECC_BCH8_CODE_HW_DETECTION_SW mode in
>> the latest linux-mtd git tree.
>>
>> I post the latest driver and older driver as below.
>>
>> Wouldn't the latest driver get bad performance since it always do the
>> decode_bch() ?
>>
>> Thanks,
>> regards,
>>
>> Ted
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3Dthe latest omap2.c driver=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>
>> int nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
>>                           unsigned char *read_ecc, unsigned char *calc_e=
cc)
>> {
>>         const struct nand_chip *chip =3D mtd->priv;
>>         struct nand_bch_control *nbc =3D chip->ecc.priv;
>>         unsigned int *errloc =3D nbc->errloc;
>>         int i, count;
>>
>>         count =3D decode_bch(nbc->bch, NULL, chip->ecc.size, read_ecc, c=
alc_ecc,
>>                            NULL, errloc);
>>         if (count > 0) {
>>
>>        ......................
>> }
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3Dolder omap2.c driver=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>
>> static int omap_correct_data_bch(int correct_bits, struct mtd_info *mtd,
>>                                  uint8_t *dat, uint8_t *read_ecc,
>>                                  uint8_t *calc_ecc)
>> {
>>
>>   ..................
>>
>>   for (i =3D 0; i < blockCnt; i++) {
>>     /* check if any ecc error */
>>     eccflag =3D 0;
>>     for (j =3D 0; (j < eccsize) && (eccflag =3D=3D 0); j++)
>>       if (calc_ecc[j] !=3D 0)
>>        eccflag =3D 1;
>>
>>     if (eccflag =3D=3D 1) {
>>       eccflag =3D 0;
>>       for (j =3D 0; (j < eccsize) && (eccflag =3D=3D 0); j++)
>>        if (read_ecc[j] !=3D 0xFF)
>>          eccflag =3D 1;
>>     }
>>
>>     if (eccflag =3D=3D 1) {
>>       /*printk(KERN_INFO "...bch correct(%d 512 byte)\n", i+1);*/
>>       count =3D decode_bch(mode, calc_ecc, err_loc);
>>
>>   ...............
>>
>>
>> }
>
