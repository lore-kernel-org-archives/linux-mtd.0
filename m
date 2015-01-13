Received: from mail-yh0-x22d.google.com ([2607:f8b0:4002:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB7V6-0002Bs-8c
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 19:51:41 +0000
Received: by mail-yh0-f45.google.com with SMTP id f10so2498236yha.4
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 11:51:18 -0800 (PST)
Date: Tue, 13 Jan 2015 11:51:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75% of
 correction strength
Message-ID: <20150113195114.GU9759@ld-irv-0074>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <54B51CCA.1090707@nod.at> <20150113184805.GS9759@ld-irv-0074>
 <54B5693C.6020700@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54B5693C.6020700@nod.at>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Steve deRosier <derosier@gmail.com>, Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, Jan 13, 2015 at 07:51:40PM +0100, Richard Weinberger wrote:
> Am 13.01.2015 um 19:48 schrieb Brian Norris:
> > On Tue, Jan 13, 2015 at 02:25:30PM +0100, Richard Weinberger wrote:
> >> Am 12.01.2015 um 21:51 schrieb Brian Norris:
> >>> The MTD API reports -EUCLEAN only if the maximum number of bitflips
> >>> found in any ECC block exceeds a certain threshold. This is done to
> >>> avoid excessive -EUCLEAN reports to MTD users, which may induce
> >>> additional scrubbing of data, even when the ECC algorithm in use is
> >>> perfectly capable of handling the bitflips.
> >>>
> >>> This threshold can be controlled by user-space (via sysfs), to allow
> >>> users to determine what they are willing to tolerate in their
> >>> application. But it still helps to have sane defaults.
> >>>
> >>> In recent discussion [1], it was pointed out that our default threshold
> >>> is equal to the correction strength. That means that we won't actually
> >>> report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
> >>> are almost too many to handle. It was determined that 3/4 of the
> >>> correction strength is probably a better default.
> >>>
> >>> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html
> >>
> >> I like this change but I have one question.
> >>
> >> UBI will treat a block as bad if it shows bitflips (EUCLEAN) right
> >> after erasure.
> > 
> > Can you elaborate? When "after erasure"? The closest I see is that UBI
> > will mark a block bad if it sees an -EIO failure from sync_erase() in
> > erase_worker(). If you have extra debug checks on, then
> > ubi_self_check_all_ff() could potentially give you bitflip problems
> > after the erase, but that's an odd corner case anyway, which many
> > drivers have been handling in hacked together ad-hoc ways anyway (search
> > for "bitflips in erase pages").
> > 
> > So I can't pinpoint what you're talking about, exactly.
> 
> See torture_peb()
> out:
>         mutex_unlock(&ubi->buf_mutex);
>         if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err)) {
>                 /*
>                  * If a bit-flip or data integrity error was detected, the test
>                  * has not passed because it happened on a freshly erased
>                  * physical eraseblock which means something is wrong with it.
>                  */
>                 ubi_err(ubi, "read problems on freshly erased PEB %d, must be bad",
>                         pnum);
>                 err = -EIO;
>         }

Thanks for refreshing my memory.

This is actually the same function that people have been tripping over
already, especially this:

		/* Make sure the PEB contains only 0xFF bytes */
		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
		if (err)
			goto out;

		err = ubi_check_pattern(ubi->peb_buf, 0xFF, ubi->peb_size);
		if (err == 0) {
			ubi_err(ubi, "erased PEB %d, but a non-0xFF byte found",
				pnum);
			err = -EIO;
			goto out;
		}

The problems here are mostly with drivers that don't (or do a bad job
of) correcting bitflips in blank pages. But there's never been an issue
of more than a few bitflips, I don't think.

So I guess we're focusing on this chunk?

		/* Write a pattern and check it */
		memset(ubi->peb_buf, patterns[i], ubi->peb_size);
		err = ubi_io_write(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
		if (err)
			goto out;

		memset(ubi->peb_buf, ~patterns[i], ubi->peb_size);
		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
		if (err)
			goto out;

I wouldn't expect that even MLC NAND would see 75% of its spec'd
bitflips immediately after erase/program/read-verify. But I'll admit I
haven't heavily tested this.

Also interesting to consider: should we make use of the knowledge of the
manufacturer-specified minimum correction info, when available? See
nand_chip::ecc_strength_ds and nand_chip::ecc_step_ds. These are pulled
from the parmeter page (ONFI or JEDEC) or the full-ID table. Note that
some systems might overprovision their ECC strength, but it may still be
worth reporting based on the datasheet specifications. Not sure of all
the implications of doing that automatically, though.

> >> For SLC NAND this works very well.
> >> Does this also hold for MLC NAND? If one or two bit flips are okay
> >> even for a freshly erased MLC NAND this change could cause UBI to
> >> mark good blocks as bad depending on the ECC strength.
> > 
> > I would typically assume that MLC NAND users must be using significantly
> > stronger ECC (e.g., 12-bit / 512-byte, at least), so "one or two
> > bitflips" would still fall well under 75% of 12 bits.
> 
> Same here. I just want to make sure that UBI does not assume a perfect NAND world. :)

At some point the responsibility is on the user. Except for the open
problems on bitflips in erased pages [1], torture_peb() still seems to look
OK. But if there are further issues related to this threshold, we might
need to adjust UBI for a less-perfect world. e.g., notice the difference
between MTD_NANDFLASH and MTD_MLCNANDFLASH.

Recall this threshold parameter is already user-settable, and paranoid
users are likely to already set it to 75% or less anyway. So UBI should
not try to inflict too much unnecessary damage.

Brian

[1] Mostly a MTD/NAND layer problem, although it's arguably a UBI issue
    that it cares about something flash manufacturers never guaranteed;
    that an erased block contains all 0xff.
