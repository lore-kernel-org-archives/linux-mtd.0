Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlEdi-0001Am-0S
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 09:41:18 +0000
Received: by mail-qg0-f47.google.com with SMTP id j107so3706992qga.20
 for <linux-mtd@lists.infradead.org>; Fri, 16 May 2014 02:40:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACD789@DBDE04.ent.ti.com>
References: <CAE94FHEKTFKUDk1_+LMtJjUhcyowBV_=dyOyP-3emmw8-enVfg@mail.gmail.com>
 <CAE94FHEiu1BFAXyVSAeM+-RAXb2kEtK-AQ1GgnHsVpUJKD8n3w@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EACC72F@DBDE04.ent.ti.com>
 <CAE94FHFR+YcEwXDkVzRg1cHxMJ9qofyBuGbEffK7u7NWUEJNQg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EACD789@DBDE04.ent.ti.com>
Date: Fri, 16 May 2014 17:40:55 +0800
Message-ID: <CAE94FHEpK3Aep8w_3rKJzQALpzFbOi5xCb0JYoXvb65Dao4ZCQ@mail.gmail.com>
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

After reviewing the long story discussion, I have got it.

Thanks much.

regards,

Ted

2014-05-16 15:14 GMT+08:00 Gupta, Pekon <pekon@ti.com>:
> Hi Ted,
>
>>From: Ted Juan [mailto:ted.juan@gmail.com]
>>
>>Dear Pekon,
>>
>>Thanks great help.
>>
>>>>So, decode_bch() should handle both the checks implicitly:
>>>>- checking for bit-flip errors by matching read_ecc[] and calc_ecc[]
>>>>- filtering out "empty-pages" by comparing read_ecc[] with 0xff.
>>
>>In lib/bch.c, I don't quiet understand how to " filtering out empty-pages".
>>It just check bit-flip error as below code.
>>
>>                        for (i = 0, sum = 0; i < (int)ecc_words; i++) {
>>                                bch->ecc_buf[i] ^= bch->ecc_buf2[i];
>>                                sum |= bch->ecc_buf[i];
>>                        }
>>
>>
> No, its not in lib/bch.c. Please refer..
> *Scenario-1*: Blank pages without bit-flips
> @@ drivers/mtd/nand/omap2.c: omap_calculate_ecc_bch()
>         case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
>                         /* Add constant polynomial to remainder, so that
>                          * ECC of blank pages results in 0x0 on reading back */
>                         for (i = 0; i < eccbytes; i++)
>                                 ecc_calc[i] ^= bch8_polynomial[i];
>                         break;
>
> Thus, blank pages are automatically filtered unless they don't have bit-flips.
>
> *Case-2*: Blank pages with bit-flips within correctable range
> This case is still not handled for BCH8_CODE_HW_DETECTION_SW scheme.
> There was discussion on implementing it in generic framework, but due
> to other complexities, it was not possible. [1] [2]
> However, locally you may use patches in above threads and report your judgment.
>
>
>>Another problem for am3505/am3517 product, we  use the new generation
>>nand flash that cause more bit-flip.
>>In the older omap nand flash driver, it seems it is no ability to
>>correct OOB bit-flip.
>>Does the latest driver support to correct OOB and Data bit-flip at the
>>same time?
>>
> Correction for BCH8_CODE_HW_DETECTION_SW is handled purely
> by software library (lib/bch.c). So if OOB correction is not implemented
> in that, then it's not done.
> However, why do you need to correct OOB bit-flips, you can just detect
> them and ignore, because upper layer do not use OOB to store any user-data
> (except for file-system metadata that too only JFFS2 and YFFS2 use it).
> Refer [3] for discussion.
>
>
>  [1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052507.html
> (This one may not work as-it-is with OMAP driver but it gives the concept
>  so I posted [2] which works with at-least omap2 driver)
> [2] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052625.html
>
> [3] http://permalink.gmane.org/gmane.linux.drivers.mtd/52363
> (on correcting OOB bit-flips)
>
>
> with regards, pekon
>
>
