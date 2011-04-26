Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEdFK-0007Rp-E2
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 08:03:47 +0000
Received: by ewy3 with SMTP id 3so120543ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 01:03:44 -0700 (PDT)
Subject: Re: Programming ubinized images
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
References: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 11:00:11 +0300
Message-ID: <1303804811.2778.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-25 at 14:37 -0400, Matthew L. Creech wrote:
> Hi,
> 
> I'm curious about the implications of these notes in the UBI documentation:
> 
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
> 
> which seem to be saying that:
> 
> 1. A ubinized image can contain empty (all-0xff) pages at the end

Note, at the end of eraseblocks, not just at the endo of the image. This
means that in the middle of the image you may have an eraseblock with
empty pages at the end of this eraseblock.

> 2. At run-time, it will assume that these pages are completely erased
> (including corresponding OOB areas)

Right. Only UBIFS does this, not UBI, though.

> 3. Standard NAND flashing utilities will view the 0xff pages as normal
> data and program their OOB areas

Yes :-(

> 4. This will cause errors when UBIFS tries to use these areas, because
> it double-programs OOB/ECC (presumably resulting in some sort of
> ANDing of bits)

Well, not on all NANDs, but yes, this is right.

> Does this mean that an off-the-shelf NAND programmer can't be used to
> program UBIFS images onto a flash device?

Yes, if your flash cannot survive programming with all 0xFFs and then
with real data. OneNAND we used in N900 could easily survive this
because ECC for all 0xFFs was 0xFF. But I guess this is more of a
problem nowadays.

>   Or perhaps that I need to
> be post-processing the ubinized images to strip out empty pages from
> the end of the image before giving it to the production line?

No, because this is not only about the end of the image, but end of
eraseblocks.

> We encountered one case in which we were re-flashing a device for
> testing using U-Boot's "nand erase", and got the "ubi_io_read: error
> -74" error from the FAQ.  That's no big deal, since we never do this
> in the field, and clearly "nand erase" isn't something we'd want to do
> even without this problem since it loses erase-counter info.

OK.

> However, I'm wondering if some of the persistent UBIFS problems we've
> been experiencing since last year:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2010-July/031069.html
> 
> could be occurring simply because we're not stripping empty pages from
> the end of the ubinized image before programming.  Does this seem like
> a possibility, or do I need to keep looking elsewhere?  Any tips are
> appreciated, thanks!

Sure, it might easily be! But if this is the case for you you should be
able to catch this by enabling UBI debugging extra checks. How
up-to-date your UBI is, but relatively recently I added an extra check
that will read all the written data back and check that it is correct.
If you have a "bad" 0xFF page, then you write there, UBI will read it
back just after write and compare with the data it wrote. If the data
does not match, it'll complain. So you can stress-test your setup with
UBI extra checks enabled. This is done by the 'ubi_dbg_check_write()'
function.

We could teach the UBIFS tools and the kernel to deal with these things.
It is possible to do with a special flag in the UBIFS superblock which
would say - this FS has been just flashed, do not use space in
half-filled eraseblocks! Then probably we could go through these
half-filled eraseblocks and fix them up, and then remove that flag.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
