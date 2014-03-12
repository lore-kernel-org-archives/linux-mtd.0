Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNcJ0-000773-KD
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 06:06:19 +0000
Received: by mail-pa0-f44.google.com with SMTP id bj1so623647pad.17
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 23:05:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <531FF16F.7060808@gmail.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
Date: Wed, 12 Mar 2014 06:59:02 +0100
Message-ID: <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kent Li <kent.li@radisys.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 12, 2014 at 6:32 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Pekon,
>
> On 03/11/2014 03:12 AM, Gupta, Pekon wrote:
>>> From: Brian Norris [mailto:computersforpeace@gmail.com]
>>>
>>> Upper layers (e.g., UBI/UBIFS) expect that pages that have been erased
>>> will return all 1's (0xff). However, modern NAND (MLC, and even some
>>> SLC) experience bitflips in unprogrammed pages, and so they may not read
>>> back all 1's. This is problematic for drivers whose ECC cannot correct
>>> bitflips in an all-0xff page, as they will report an ECC error
>>> (-EBADMSG) when they come across such a page. This appears to UBIFS as
>>> "corrupt empty space".
>>>
>> I'm not sure, if any driver can solve this either. As if an erased-page has no
>> ECC stored in OOB then how can any driver correct the bit-flips.
>
> There are ways to design an ECC algorithm such that the ECC syndrome
> bytes for all-0xff data are all 0xff. With such an ECC algorithm, you
> then should be able to correct bitflips in pages that are almost all
> 0xff. But obviously, not all ECC implementations can do this.
>
> Notably, the 1-bit software ECC implementation in
> drivers/mtd/nand/nand_ecc.c can correct bit errors in erased pages.
>
>>> @@ -1483,6 +1483,62 @@ static int nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
> ...
>>> +    /* read without ECC for verification */
>>> +    ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
>>
>> You can re-use the *buf and *oobpoi  filled in by chip->ecc.read_page(),
>> Instead of re-reading the read_page_raw.
>> (1) Re-using buffers will ensure, that you do not re-count any bit-flips
>>     which were already corrected by driver.
>> (2) it will save overhead of re-reading the page.
>
> OK, that might be doable. But there are two considerations:
>
> 1. nand_verify_erased_page() may be called after a subpage read (not
> full page), so we will need to distinguish how much data we are
> targeting here (i.e., column and length)
>
> 2. for some drivers, the read_page() implementation does not read out
> OOB data by default (see the 'oob_required' parameter), so we will need
> to re-read the page/subpage to get the full data+OOB in some cases. But
> I suppose we can still weed out pages with totally garbage data by
> checking for 0 bits before re-reading the page
>
>>> +    if (ret)
>>> +            return ret;
>>> +
>>> +    /* Check each ECC step individually */
>>> +    for (i = 0; i < chip->ecc.steps; i++) {
>>> +            unsigned int flips = databits + oobbits;
>>> +
>>> +            flips -= bitmap_weight((unsigned long *)oob, oobbits);
>>> +            flips -= bitmap_weight((unsigned long *)data, databits);
>>
>> It was observed that this scanning of all(0xff) in both OOB and Data buffers
>> caused significant performance penalty, especially with MLC and newer
>> technology NAND devices (as they exhibit extensive read-disturb errors
>> in erased-pages).
>
> Do you have any benchmarks? Remember, optimization must be driven by
> data, not by opinion. "Extensive read-disturb" does not automatically
> mean that the optimizations you imagine are actually worthwhile in practice.
>
>> Hence as done in [2], a special function "count_zero_bits()" was introduced
>> which will return, as soon as 0-bit count exceeded ecc.strength. So that you
>> don't end-up counting complete buffer even if count exceeded the limit.
>
> I really doubt that quitting early while counting bits will yield much
> tangible benefit, and it's possible that it will make things worse.
>
> Also, remember as you've said yourself, this should be optimized for the
> mostly-0xff case. This means that we will likely have to check most or
> all of the sector before we discover enough 0 bits, so adding a "quit
> early" optimization may not be that useful.
>

Hello Brian,

In [1] you an find some benchmarks which I did in the early days of the GPMI fix
where I tried several approaches ranging from the naive version based on some
of Pekon's work, going to making using of the BCH status register ending with
reading the syndromes and caching them, for me this last version is what I have
in our own Linux tree, because after this Huang took over and came
with the patch
which started these discussions which I'm waiting to upstream.

What my tests haves learned me is that there's probably very little to
gain in the
actual optimization of the erased-page correction, but the magic lies in quickly
and efficiently determining if a read-page is actually an all-0xff
case with a bitflip
causing the BCH block to detect it as an error. (In the case of GPMI
is, our n-bit
ECC failed to withstand a single bitflip). Also by default on the GPMI
implementation the syndromes are not by default/read accessible (see also [1]
where I modified the driver to write the syndromes in a read operation to cache
the syndromes of a correctly read erased page since I wanted to use the
syndrome to quickly verify a correctly erased page from an erased page with
bitflips).


[1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051414.html

my 2 cents
E.

-- 
Elie De Brauwer
