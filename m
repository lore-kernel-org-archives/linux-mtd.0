Received: from mail.comelit.it ([213.149.219.85] helo=relayer.comelit.it)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TqPRi-0006S9-1s
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2013 14:37:32 +0000
Message-ID: <50E44621.3050402@comelit.it>
Date: Wed, 02 Jan 2013 15:37:21 +0100
From: Luca Ceresoli <luca.ceresoli@comelit.it>
MIME-Version: 1.0
To: Luca Ceresoli <luca.ceresoli@comelit.it>
Subject: Re: [U-Boot] Bricked when trying to attach UBI
References: <50D1A4C2.6020207@comelit.it> <50D1DC30.1060701@gmail.com>
 <50D1E3AD.30208@comelit.it> <50D1E6BF.9090407@gmail.com>
 <50D1FB46.9000209@comelit.it> <50D33678.4080904@comelit.it>
In-Reply-To: <50D33678.4080904@comelit.it>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, kmpark@infradead.org,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 =?ISO-8859-1?Q?Andreas_Bie=DFmann?= <andreas.devel@googlemail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Holger Brunck <holger.brunck@keymile.com>,
 Luca Ceresoli <luca@lucaceresoli.net>, linux-mtd@lists.infradead.org,
 Stefan Roese <sr@denx.de>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Luca Ceresoli wrote:
> Hi,
>
> I'm Cc'ing the linux-mtd list as well as the authors of the Linux
> commits cited below.
>
> For these new readers: I reported a problem with U-Boot 2012.04.01 not
> being able to attach an UBI partition in NAND, while Linux (2.6.37) can
> attach and repair it.
>
> It looks like an U-Boot bug, but I discovered strange things around the
> chip->badblockbits variable (in the NAND code) by comparing the
> relevant code in U-Boot and Linux.
>
> Sorry for Cc'ing so many people, but following this issue I was lead
> from one subsystem to another (and from U-Boot to Linux).
>
> Previous discussion is here:
> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/149624
>
> Luca Ceresoli wrote:
>> Hi Andreas,
>>
>> Andreas Bießmann wrote:
>>> Hi Luca,
>>>
>>> On 19.12.2012 16:56, Luca Ceresoli wrote:
>>>> Hi Andreas,
>>>>
>>>> Andreas Bießmann wrote:
>>>> ...
>>>>>> Creating 1 MTD partitions on "nand0":
>>>>>> 0x000000100000-0x000010000000 : "mtd=3"
>>>>>> UBI: attaching mtd1 to ubi0
>>>>>> UBI: physical eraseblock size:   131072 bytes (128 KiB)
>>>>>> UBI: logical eraseblock size:    129024 bytes
>>>>>> UBI: smallest flash I/O unit:    2048
>>>>>> UBI: sub-page size:              512
>>>>>> UBI: VID header offset:          512 (aligned 512)
>>>>>> UBI: data offset:                2048
>>>>>> UBI error: ubi_wl_init_scan: no enough physical eraseblocks (0,
>>>>>> need 1)
>>>>>>
>>>>>> Now the device is totally blocked, and power cycling does not change
>>>>>> the result.
>>>>>
>>>>> have you tried to increase the malloc arena in u-boot
>>>>> (CONIG_SYS_MALLOC_LEN)?
>>>>> We had errors like this before [1],[2] and [3], maybe others -
>>>>> apparently with another error message, but please give it a try. We
>>>>> know
>>>>> ubi recovery needs some ram and 1MiB may be not enough.
>>>>
>>>> Thanks for your suggestion.
>>>>
>>>> Unfortunately this does not seem to be the cause of my problem: I 
>>>> tried
>>>> increasing my CONFIG_SYS_MALLOC_LEN in include/configs/dig297.h from
>>>> (1024 << 10) to both (1024 << 12) and (1024 << 14), but without any
>>>> difference.
>>>
>>> Well, ok ... Malloc arena is always my first thought if I read about
>>> problems with ubi in u-boot.
>>> Have you looked up the differences in drivers/mtd/ubi/ in your u-boot
>>> and linux tree? Maybe you can see something obviously different in the
>>> ubi_wl_init_scan()?
>>
>> I had some days ago, but I double-checked now as you suggested. Indeed
>> there is an important difference: attach_by_scanning() (build.c) calls
>> ubi_wl_init_scan() and ubi_eba_init_scan() just like Linux does, but in
>> a swapped order!
>>
>> This swap dates back to:
>>
>> commit d63894654df72b010de2abb4b3f07d0d755f65b6
>> Author: Holger Brunck <holger.brunck@keymile.com>
>> Date:   Mon Oct 10 13:08:19 2011 +0200
>>
>>      UBI: init eba tables before wl when attaching a device
>>
>>      This fixes that u-boot gets stuck when a bitflip was detected
>>      during "ubi part <ubi_device>". If a bitflip was detected UBI tries
>>      to copy the PEB to a different place. This needs that the eba table
>>      are initialized, but this was done after the wear levelling worker
>>      detects the bitflip. So changes the initialisation of these two
>>      tasks in u-boot.
>>
>>      This is a u-boot specific patch and not needed in the linux layer,
>>      because due to commit 1b1f9a9d00447d
>>      UBI: Ensure that "background thread" operations are really executed
>>      we schedule these tasks in place and not as in linux after the 
>> inital
>>      task which schedule this new task is finished.
>>
>>      Signed-off-by: Holger Brunck <holger.brunck@keymile.com>
>>      cc: Stefan Roese <sr@denx.de>
>>      Signed-off-by: Stefan Roese <sr@denx.de>
>>
>> I tried reverting that commit and... surprise! U-Boot can now attach UBI
>> and boot properly!
>>
>> But the cited commit actually fixed a bug that bite our board a few
>> months back, so it should not be reverted without thinking twice. Now
>> it apparently introduced another bug. :-(
>>
>> I'm Cc:ing the commit author for comments.
>>
>> Nonetheless, I have evidence of a different behaviour between U-Boot
>> and Linux even before the two swapped functions are called.
>>
>> What attach_by_scanning() does in Linux is (abbreviated):
>>
>> static int attach_by_scanning(struct ubi_device *ubi)
>> {
>>          si = ubi_scan(ubi);
>>      ...fill ubi->some_fields...;
>>          err = ubi_read_volume_table(ubi, si);
>>      /* MARK */
>>          err = ubi_eba_init_scan(ubi, si); /* swapped in U-Boot */
>>          err = ubi_wl_init_scan(ubi, si);  /* swapped in U-Boot */
>>          ubi_scan_destroy_si(si);
>>          return 0;
>> }
>>
>> See the two swapped calls.
>>
>> At MARK, I printed some of the peb counters in *ubi, and I got
>> different results for ubi->avail_pebs between U-Boot and Linux:
>> U-Boot: UBI: POST_TBL: rsvd=2018, avail=21, beb_rsvd_{pebs,level}=0,0
>> Linux:  UBI: POST_TBL: rsvd=2018, avail=22, beb_rsvd_{pebs,level}=0,0
>>
>> The printed values were equal before calling ubi_read_volume_table().
>> I have no idea about where this difference comes from, nor if this
>> difference can cause my troubles.
>> I will better investigate tomorrow looking into ubi_read_volume_table().
>
> After half a day of debugging and an insane amount of printk()s added to
> both U-Boot and Linux, I have some more hints to understand the problem.
>
> The two different results quoted above show that U-Boot counted 21
> available eraseblocks, while Linux counts 22. I am not sure if this can
> cause my problem, but it's the first visible difference between U-Boot
> and Linux.
>
> This originates from ubi_scan() (scan.c): in U-Boot, it sets
> si->bad_peb_count to 1, in Linux to 0. U-Boot's ubi_scan() is very
> similar to Linux's, and the differences do not seem to relevant in my 
> case. So let's dig down...
>
> - ubi_scan() (scan.c) calls process_eb() (scan.c) for each EB
> - process_eb() calls ubi_io_is_bad() (io.c), and if it returns >0 it
>   increments si->bad_peb_count, which is what is happening to my board
>   when executing U-Boot
> - ubi_io_is_bad() calls mtd->block_isbad(), which points to
>   nand_block_isbad() (nand_base.c)
> - nand_block_isbad() is a wrapper to nand_block_checkbad() (nand_base.c)
> - nand_block_checkbad() differs from the Linux code in something
>   related to lazy bad block scanning (commit fb49454b1b6c7c6, Feb 2012),
>   but this does not seem to change the behaviour I observe;
> - nand_block_checkbad() calls either chip->block_bad() or
>   nand_isbad_bbt(); I tracked only into the former, but I suspect the
>   latter produces the same effects with regard to the problem I'm facing
> - chip->block_bad() points to nand_block_bad() (nand_base.c)
>
> nand_block_bad() (nand_base.c) does the following:
> static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
> {
>     ...
>
>         if (likely(chip->badblockbits == 8))
>                 res = bad != 0xFF;
>         else
>                 res = hweight8(bad) < chip->badblockbits;
>
>         if (getchip)
>                 nand_release_device(mtd);
>
>         return res;
> }
>
> I don't understand the algorithm, but the relevant variables have these
> values:
> U-Boot: nand_block_bad: chip->badblockbits=8, bad=0000, hweight8(bad)=0
> Linux:  nand_block_bad: chip->badblockbits=0, bad=0000, hweight8(bad)=0
>                                            ^
>
> Obviously the U-Boot and Linux produce a different return value.
> This propagates up to ubi->bad_peb_count in ubi_scan(), and from there
> it changes the behaviour of the following code, leading to a block in
> U-Boot and a successful attach in Linux.
>
> chip->badblockbits in current Linux master is described as
> "minimum number of set bits in a good block's bad block marker
> position; i.e., BBM == 11110111b is not bad when badblockbits == 7".
>
> Still a bit obscure to me because I don't have a general picture.
> Anyway, here's how its value comes to be different between U-Boot
> (2012.04.01) and Linux (2.6.37).
>
> Linux:
> a) commit e0b58d0a7005, Feb 2010:
>    mtd: nand: add ->badblockbits for minimum number of set bits in bad
>    block byte
>    declared the new variable and introduced in nand_get_flash_type()
>    (nand_base.c) the following line:
>      chip->badblockbits = 8;
> b) commit c7b28e25cb9, Jul 2010:
>    mtd: nand: refactor BB marker detection
>    removed from nand_get_flash_type() (nand_base.c) the same line:
>      chip->badblockbits = 8;
> c) commit 26d9be11485e, Apr 2011:
>    mtd: return badblockbits back
>    restored in nand_get_flash_type() (nand_base.c) the following line:
>      chip->badblockbits = 8;
>   claiming it had been accidentally removed in commit b).
>
> The version of Linux I'm using (2.6.37), contains commits a) and b), so
> it has chip->badblockbits equal to 0. According to the log message of
> commit c), this should be wrong, but the resulting kernel works!
>
> The version of U-Boot (2012.04.01) contains the result of all 3 commits,
> since
>
>   commit 2a8e0fc8b3dc31a3c571e439fbf04b882c8986be
>   Author: Christian Hitz <christian.hitz@aizo.com>
>   Date:   Wed Oct 12 09:32:02 2011 +0200
>
>       nand: Merge changes from Linux nand driver
>
>       [backport from linux commit
>           02f8c6aee8df3cdc935e9bdd4f2d020306035dbe]
>
>       This patch synchronizes the nand driver with the Linux 3.0 state.
>
> This looks like an improvement, but it bricks my board!
>
> I could not resist, and without even trying to understand what I was
> doing, I did in U-Boot's nand_get_flash_type() (nand_base.c):
>
> -       chip->badblockbits = 8;
> +       chip->badblockbits = 0;
>
> and guess what? U-Boot attached UBI, loaded Linux from it and booted
> successfully!
>
> No, I don't think changing lines here and there without any real
> understanding is a way to produce reliable software. But I'm unable
> to understand why the software that should work better actually bricks
> the board and the other one runs fine? And how do I know what the
> correct value for chip->badblockbits should be?
>
> And last but most important: how can I properly fix U-Boot?

I had another look at the commit that swapped the calls to
ubi_eba_init_scan() and ubi_wl_init_scan(), and I noticed that it 
changed the
computationof the available PEB count.

In the original (pre-swap) code, running on a working board:

static int attach_by_scanning(struct ubi_device *ubi)
{
          si = ubi_scan(ubi);
      ...fill ubi->some_fields...;
          err = ubi_read_volume_table(ubi, si);

            /* here rsvd=2018, avail=22, beb_rsvd_{pebs,level}=0,0 */

          err = ubi_wl_init_scan(ubi, si);  /* swapped in U-Boot */

            /* herersvd=2019, avail=21, beb_rsvd_{pebs,level}=0,0 ***** */

          err = ubi_eba_init_scan(ubi, si); /* swapped in U-Boot */
          ubi_scan_destroy_si(si);
          return 0;
}


In the current (post-swap) code, running on the same board:

static int attach_by_scanning(struct ubi_device *ubi)
{
          si = ubi_scan(ubi);
      ...fill ubi->some_fields...;
          err = ubi_read_volume_table(ubi, si);

            /* here rsvd=2018, avail=22, beb_rsvd_{pebs,level}=0,0 */

          err = ubi_eba_init_scan(ubi, si); /* swapped in U-Boot */

            /* here rsvd=2039, avail=1, beb_rsvd_{pebs,level}=20,20***** */

          err = ubi_wl_init_scan(ubi, si);  /* swapped in U-Boot */
          ubi_scan_destroy_si(si);
          return 0;
}

Notice the difference on the line marked with "*****": after the swap, the
number of available PEBs changed from 21to 1.

According to the docs, UBI reserves some PEBs for bad PEB handling. By
default, in my 2048-PEBs NAND, it reserved 20 PEBs, wihch are far enough to
recover from a few bad PEBs. These should be computed as part of the 
"available"
PEBs. But current U-Boot (incorrectly?) thinks thereis only 1 available PEB.
On a bricked board, it thinks there are 0, so it cannotattach UBI.

I have no fix for this, but I tried a simple workaround: instead of 
using all
the available space for my logical volumes, I created them with a smaller
size, leaving 32 unused PEBs. Now, in attach_by_scanning(), I got:

pre-swap:  rsvd=1987, avail=53, beb_rsvd_{pebs,level}=0,0
post-swap: rsvd=2007, avail=33, beb_rsvd_{pebs,level}=20,20

The computed number of available PEB is exactly 32 units bigger than it used
to be. This means, also after the swap, U-Boot thinks there are plenty of
available PEBs.

To try to simulate a board that has bad blocks, I then marked some blocks as
bad using 'nand markbad' in U-Boot. The number of available PEBs decreases
accordingly, but is still >0 and U-Boot can attach UBI and boot.

So, it seems that leaving some unused PEBs is a workaround to this problem!
I'm not 100% sure this is ok and will go on to better understand the 
problem.
Any comments are welcome.

Luca
