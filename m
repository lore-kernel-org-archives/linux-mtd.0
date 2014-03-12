Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNbt7-0006Zs-KC
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 05:39:34 +0000
Received: by mail-pb0-f51.google.com with SMTP id uo5so602903pbc.10
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 22:39:10 -0700 (PDT)
Message-ID: <531FF16F.7060808@gmail.com>
Date: Tue, 11 Mar 2014 22:32:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, Kent Li <kent.li@radisys.com>,
 Elie De Brauwer <eliedebrauwer@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On 03/11/2014 03:12 AM, Gupta, Pekon wrote:
>> From: Brian Norris [mailto:computersforpeace@gmail.com]
>>
>> Upper layers (e.g., UBI/UBIFS) expect that pages that have been erased
>> will return all 1's (0xff). However, modern NAND (MLC, and even some
>> SLC) experience bitflips in unprogrammed pages, and so they may not read
>> back all 1's. This is problematic for drivers whose ECC cannot correct
>> bitflips in an all-0xff page, as they will report an ECC error
>> (-EBADMSG) when they come across such a page. This appears to UBIFS as
>> "corrupt empty space".
>>
> I'm not sure, if any driver can solve this either. As if an erased-page has no
> ECC stored in OOB then how can any driver correct the bit-flips.

There are ways to design an ECC algorithm such that the ECC syndrome
bytes for all-0xff data are all 0xff. With such an ECC algorithm, you
then should be able to correct bitflips in pages that are almost all
0xff. But obviously, not all ECC implementations can do this.

Notably, the 1-bit software ECC implementation in
drivers/mtd/nand/nand_ecc.c can correct bit errors in erased pages.

>> @@ -1483,6 +1483,62 @@ static int nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
...
>> +	/* read without ECC for verification */
>> +	ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
> 
> You can re-use the *buf and *oobpoi  filled in by chip->ecc.read_page(),
> Instead of re-reading the read_page_raw. 
> (1) Re-using buffers will ensure, that you do not re-count any bit-flips
>     which were already corrected by driver.
> (2) it will save overhead of re-reading the page.

OK, that might be doable. But there are two considerations:

1. nand_verify_erased_page() may be called after a subpage read (not
full page), so we will need to distinguish how much data we are
targeting here (i.e., column and length)

2. for some drivers, the read_page() implementation does not read out
OOB data by default (see the 'oob_required' parameter), so we will need
to re-read the page/subpage to get the full data+OOB in some cases. But
I suppose we can still weed out pages with totally garbage data by
checking for 0 bits before re-reading the page

>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Check each ECC step individually */
>> +	for (i = 0; i < chip->ecc.steps; i++) {
>> +		unsigned int flips = databits + oobbits;
>> +
>> +		flips -= bitmap_weight((unsigned long *)oob, oobbits);
>> +		flips -= bitmap_weight((unsigned long *)data, databits);
> 
> It was observed that this scanning of all(0xff) in both OOB and Data buffers
> caused significant performance penalty, especially with MLC and newer
> technology NAND devices (as they exhibit extensive read-disturb errors
> in erased-pages).

Do you have any benchmarks? Remember, optimization must be driven by
data, not by opinion. "Extensive read-disturb" does not automatically
mean that the optimizations you imagine are actually worthwhile in practice.

> Hence as done in [2], a special function "count_zero_bits()" was introduced
> which will return, as soon as 0-bit count exceeded ecc.strength. So that you
> don't end-up counting complete buffer even if count exceeded the limit.

I really doubt that quitting early while counting bits will yield much
tangible benefit, and it's possible that it will make things worse.

Also, remember as you've said yourself, this should be optimized for the
mostly-0xff case. This means that we will likely have to check most or
all of the sector before we discover enough 0 bits, so adding a "quit
early" optimization may not be that useful.

> Also please use staggered approach of first counting bit-flips in OOB and
> then in data buffer, so that you don't over count.

OK, I can probably do something like this if I include the "quit early"
optimization.

>> +	memset(buf, 0xff, mtd->writesize);
>> +	memset(oob, 0xff, mtd->oobsize);
>> +
> 
> Now this leaves back to same question, is it correct to fill the region
> with 0xff to fool UBIFS (and other upper layers)

Yes, it absolutely is correct. The idea is that unprogrammed pages will
naturally have some small (?) number of bitflips, within the
correctability specifications of the flash. Such a page can still be
programmed, and likely be within our correction limits. So in order to
gracefully handle this, we remove the small number of 0 bits in order to
"correct" the page for the upper layers, which expect a clean 0xff page.

Or to put it another way, is it correct for ECC to "fool" upper layers
into thinking that there are no bit errors in a page when its syndrome
bytes can help it to do so? Our memset(0xff) is very much analogous.

> OR
> Let UBIFS (and other upper layers) try extracting whatever they
> could from the corrupt/junk data. Refer discussion in [1]

I'm not sure how [1] is related. Artem is simply explaining that you
can't remove those all-0xff checks in UBIFS. And I agree.

On the other hand, this patch is simply saying we can correct a simple,
benign piece of garbage data that is known to occur under normal
conditions, so that UBIFS won't choke on it. We cannot simply pass
easily-correctable garbage to higher layers.

> Also, it makes more sense to introduce this check just before
> chip->ecc.correct(), as you can avoid running through failures first.

No. We want to run the verify_erased_page code as a last-ditch effort,
after we've determined that the ECC implementation couldn't correct the
data. We don't want to run this on *every* page we come across!

> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052501.html

Brian
