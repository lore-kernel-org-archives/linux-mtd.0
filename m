Date: Thu, 28 Nov 2013 08:48:47 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Arnaud Ebalard <arno@natisbad.org>
Subject: Re: [PATCH v5 00/14] Armada 370/XP NAND support
In-Reply-To: <87wqjtbm8r.fsf@natisbad.org>
Message-ID: <alpine.DEB.2.00.1311280845470.3251@lnxricardw.se.axis.com>
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <87d2lp28pd.fsf@natisbad.org> <20131125120335.GD2408@localhost>
 <87r4a4f5gr.fsf@natisbad.org> <20131126124003.GA2344@localhost>
 <87zjopd240.fsf@natisbad.org> <87wqjtbm8r.fsf@natisbad.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Nov 2013, Arnaud Ebalard wrote:

>> Well, I guess the bad block the driver put in the bbt are not that bad
>> in practice, i.e. they were mistakenly marked that way. I also
>> guess^Whope there is a some low level command I could use to simply
>> clear the bbt (the NAND had no bad block prior to the test). Any help
>> would be appreciated on that point.
>
> Replying to myself w/ the solution: just in case it happens to someone
> else, it's as simple as using flash_erase w/ -N option on a kernel
> modified (in drivers/mtd/nand/nand_base.c) to allow write to a bad
> block w/ the following patch:
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index bd39f7b..e70ef60 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2591,6 +2591,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>        instr->state = MTD_ERASING;
>
>        while (len) {
> +#if 0
>                /* Check if we have a bad block, we do not erase bad blocks! */
>                if (nand_block_checkbad(mtd, ((loff_t) page) <<
>                                        chip->page_shift, 0, allowbbt)) {
> @@ -2599,6 +2600,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>                        instr->state = MTD_ERASE_FAILED;
>                        goto erase_exit;
>                }
> +#endif
>
>                /*
>                 * Invalidate the page cache, if we erase the block which
>
>
> After a reboot on that modified kernel, a simple call to flash_erase
> using -N option will erase the badblocks:
>
> # flash_erase -N /dev/mtd4 0 0
> ...

I agree, I usually do something along these lines too (especially the 
kernel bit) when I run into a flash with mistakingly marked bad blocks.

I've always argued against having it switchable in any way in the kernel, 
I've figured it needs to be hard to do (i.e. require access to kernel code 
and target build system) so that average users don't start erasing bad 
blocks at the sign of bad block trouble by just flicking a switch in /sys 
or whatever.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
