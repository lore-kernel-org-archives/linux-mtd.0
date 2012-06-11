Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdxRn-0007Vy-WA
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2012 05:45:53 +0000
Received: by yenr9 with SMTP id r9so2490710yen.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 22:45:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120610145004.702d24d7@pixies.home.jungo.com>
References: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
 <20120610145004.702d24d7@pixies.home.jungo.com>
Date: Sun, 10 Jun 2012 22:45:50 -0700
Message-ID: <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: ignore ecc errors during bbt reads
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Friendly comment: it would be helpful to include me on these types of
threads, since I am responsible for much of the code in discussion
here. (Try 'git blame'). There are some things I apparently got wrong
in the first place and some new issues since the bitflips_threshold
introduction. Also, there's some incomplete information, since (as
noted below) some things are not used in-tree, but they are in use in
my out-of-tree driver for which I submitted the original code. I
believe that the changes are generally useful, though, if understood
and utilized properly.

On Sun, Jun 10, 2012 at 4:50 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Thu, =A07 Jun 2012 11:32:08 -0700 Mike Dunn <mikedunn@newsguy.com> wro=
te:
>> Ignore ecc errors in the scan_read_raw_oob() function. =A0Also removed c=
ode that
>> is now redundant.
>>
>> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
>> ---
>> =A0drivers/mtd/nand/nand_bbt.c | =A0 =A06 +++---
>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
>> index 30d1319..585da44 100644
>> --- a/drivers/mtd/nand/nand_bbt.c
>> +++ b/drivers/mtd/nand/nand_bbt.c
>> @@ -319,7 +319,8 @@ static int scan_read_raw_oob(struct mtd_info *mtd, u=
int8_t *buf, loff_t offs,
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D mtd_read_oob(mtd, offs, &ops);
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (res)
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Ignore ECC errors when checking for BBM */
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (res && !mtd_is_bitflip_or_eccerr(res))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return res;
>
> IMO this is not necessary.
> Note the 'ops.mode' is initialized to MTD_OPS_RAW; =A0meaning, no ECC is
> performed during read ('ecc.read_page_raw' will be invoked).
> Thus, EUCLEAN/EBADMSG should not be reported.
> Am I missing something here?

Shmulik is correct. A check for bitflips on a MTD_OPS_RAW operation is
unnecessary.

>> @@ -406,8 +407,7 @@ static int scan_block_full(struct mtd_info *mtd, str=
uct nand_bbt_descr *bd,
>> =A0 =A0 =A0 int ret, j;
>>
>> =A0 =A0 =A0 ret =3D scan_read_raw_oob(mtd, buf, offs, readlen);
>> - =A0 =A0 /* Ignore ECC errors when checking for BBM */
>> - =A0 =A0 if (ret && !mtd_is_bitflip_or_eccerr(ret))
>> + =A0 =A0 if (ret)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>
> Don't understand why 'mtd_is_bitflip_or_eccerr' is originally tested.
> As noted above, 'scan_read_raw_oob' won't return EUCLEAN/EBADMSG, as it
> uses MTD_OPS_RAW.

FWIW, I originally was *trying* to mirror functionality in
scan_block_full() and scan_block_fast(), but my code was wrong
apparently. See below.

> And what's even stranger is the code in 'scan_block_fast()', quote:
>
> =A0 =A0 =A0 =A0ops.datbuf =3D NULL;
> =A0 =A0 =A0 =A0ops.mode =3D MTD_OPS_PLACE_OOB;
>
> =A0 =A0 =A0 =A0for (j =3D 0; j < len; j++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D mtd_read_oob(mtd, offs, &ops);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Ignore ECC errors when checking for BBM=
 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret && !mtd_is_bitflip_or_eccerr(ret))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
>
> Here, 'MTD_OPS_PLACE_OOB' is explicitly used - so *theoretically*
> 'mtd_read_oob' might return EUCLEAN/EBADMSG, see 'nand_do_read_oob',
> (although NO driver YET reports maxbitflips from its 'chip->ecc.read_oob'
> method).

I think we discussed the "read_oob" case and max_bitflips previously,
where I noted that my out-of-tree driver uses ECC that covers OOB and
page data and sets ecc_stats.corrected and ecc_stats.failed according
to the entire page+OOB when ecc.read_oob is called. So, this call to
mtd_read_oob() may return EUCLEAN/EBADMSG when used my driver. This
isn't a problem and should be left alone I think.

> Why not use 'MTD_OPS_RAW' in 'scan_block_fast()' as well (as done in
> 'scan_block_full')?

Because when ECC is available on OOB, it is good to utilize it, so
that bitflips don't cause good blocks to be marked bad. Less
importantly, when bad block markers are written by Linux (with ECC),
then these markers can be read back more reliably. (I note that there
is a nand_chip.badblockbits option that could theoretically alleviate
the first issue, but I see it is not actually implemented throughout
nand_bbt.c - only in nand_base.c)

IMO, 'scan_block_full' contains the erroneous code for now. When I
changed scan_block_fast(), I half-heartedly changed scan_block_full()
as well, but it does not appear on my code path, so I didn't notice
the discrepancy.

This brings up a side issue: I think many of the "_raw" function names
in nand_bbt.c are misleading. They do not all use MTD_OPS_RAW (and
shouldn't). Effectively, I would prefer that *all* the calls in
nand_bbt.c use the non-RAW version of the MTD/NAND interfaces, and
then ignore the errors if sensible. e.g., when reading a bad block
marker. But nand_bbt.c does a lot more (reading BBTs from flash,
checking for "Bbt0" and "1tbB" table marker, etc.) that *must* use ECC
to provide any robustness.

So, I can send a patch that straightens out naming and brings
scan_block_fast() and scan_block_full() into alignment on using
MTD_OPS_PLACE_OOB. Then I think that we should continue using this
code in both:
                /* Ignore ECC errors when checking for BBM */
                if (ret && !mtd_is_bitflip_or_eccerr(ret))
And we can (as agreed previously?) avoid using/checking max_bitflips
in mtd_read_oob(), although there is the datbuf+oob case that calls
nand_do_read_ops...

Brian
