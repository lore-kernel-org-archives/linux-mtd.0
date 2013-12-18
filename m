Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtBtt-0005vt-Ql
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 07:50:38 +0000
Received: by mail-pa0-f44.google.com with SMTP id fa1so5636710pad.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 23:50:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131218052108.GA1696@gmail.com>
References: <1387287942-20694-1-git-send-email-eliedebrauwer@gmail.com>
 <20131218052108.GA1696@gmail.com>
Date: Wed, 18 Dec 2013 08:50:15 +0100
Message-ID: <CAGWqfig=CbXxtESGkPpmZKD+w+cTBJQXtNmQ45erUrtmvOy4Gg@mail.gmail.com>
Subject: Re: [PATCH v5] mtd: gpmi: Deal with bitflips in erased regions regions
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 18, 2013 at 6:21 AM, Huang Shijie <shijie8@gmail.com> wrote:
> On Tue, Dec 17, 2013 at 02:45:42PM +0100, Elie De Brauwer wrote:
>>
>> +     /* Set the tolerance for bitflips when reading erased blocks. */
>> +     erase_threshold = gf_len / 2;
>> +     if (erase_threshold > ecc_strength)
>> +             erase_threshold = ecc_strength;
>> +
> I was about to give you my ACK, but i find you used a wrong ecc strength
> here.  The "ecc_strength" is just half of the real ECC strength used by
> the BCH. Please read this line in the function:
> 268     ecc_strength  = bch_geo->ecc_strength >> 1;
>
> Could you please send a new version patch ?
>
>
>> +     writel(erase_threshold & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
>> +             r->bch_regs + HW_BCH_MODE);
>> +
>>       /* Set *all* chip selects to use layout 0. */
>>       writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>>
>> @@ -1094,6 +1103,15 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
>>       return reg & mask;
>>  }
>>
>> +/*
>> + * Count the number of 0 bits in a supposed to be
>> + * erased region and correct them. Return the number
>> + * of bitflips or zero when the region was correct.
>> + */
>> +static unsigned int erased_sector_bitflips(unsigned char *data,
>> +                                     unsigned int chunk,
>> +                                     struct bch_geometry *geo)
>> +{
>> +     unsigned int flip_bits = 0;
>> +     int i;
>> +     int base = geo->ecc_chunk_size * chunk;
>> +
>> +     /* Count bitflips */
>> +     for (i = 0; i < geo->ecc_chunk_size; i++)
>> +             flip_bits += hweight8(~data[base + i]);
>> +
>> +     /* Correct bitflips by 0xFF'ing this chunk. */
>> +     if (flip_bits)
>> +             memset(&data[base], 0xFF, geo->ecc_chunk_size);
>> +
>> +     return flip_bits;
>> +}
>
> Since a new version patch is inevitable, i want to give more comment
> about this function.
>
>
> Does the following code run faster then above?
> static unsigned int erased_sector_bitflips(unsigned char *data,
>                                         unsigned int chunk,
>                                         struct bch_geometry *geo)
> {
>         unsigned int flip_bits = 0;
>         int i;
>         int base = geo->ecc_chunk_size * chunk;
>         int tmp;
>
>         for (i = 0; i < geo->ecc_chunk_size; i++) {
>                 tmp = hweight8(~data[base + i]);
>
>                 if (tmp) {
>                         data[base + i] = 0xff;
>                         flip_bits += tmp;
>                 }
>         }
>
>         return flip_bits;
> }
>
> I am not sure this code is faster then your code, i do not have time to
> do a test to compare the two functions.
>
> If you think your function is better, just ignore my code, it is okay to
> me.
>
> I really very appreciate at your work!
>


Personally I would think the version you suggest would be more optimal and if
I wouldn't have stolen my version from the omap2 driver it would probably looked
more like the one you suggested. So I wrote up a little benchmark application
(available at: https://github.com/amo-ej1/Code-snippets/blob/master/C_C%2B%2B/bitflips_bench/bitflips_bench.c
)

But the output actually surprises me a bit. on my laptop your
suggestion is about 30% faster.

edb@lapelidb:~/today$ gcc bitflips_bench.c  && ./a.out
omap  : 37103 usec
speedy: 28141 usec
edb@lapelidb:~/today$ gcc -O2 ./bitflips_bench.c
edb@lapelidb:~/today$ ./a.out
omap  : 9530 usec
speedy: 6563 usec

However when testing it on my i.mx283 target  (used gcc 4.8.1) there
hardly isn't any difference
(first one without optimization, the second one with -O2).

root@(none):~# /tmp/a.out
omap  : 616839 usec
speedy: 634944 usec
root@(none):~# /tmp/a.out
omap  : 188134 usec
speedy: 188049 usec

(On 4k chunks, when testing it on 512 byte chunks the omap one
performs even better).

So I'm more tempted to stay at the original version. I will provide a
new version of the patch however with the ecc_strenght modified.

gr
E.
-- 
Elie De Brauwer
