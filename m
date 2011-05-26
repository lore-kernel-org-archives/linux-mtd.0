Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QPVaK-0006gG-AZ
	for linux-mtd@lists.infradead.org; Thu, 26 May 2011 08:06:25 +0000
Received: by eyh6 with SMTP id 6so236299eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2011 01:06:22 -0700 (PDT)
Subject: Re: [PATCH v2] nand: nand_base: Always initialise oob_poi before
	writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF591@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF591@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 May 2011 11:01:48 +0300
Message-ID: <1306396908.2785.152.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-05-25 at 12:25 +0200, THOMSON, Adam (Adam) wrote:
> In nand_do_write_ops() code it is possible for a caller to provide
> ops.oobbuf populated and ops.mode == MTD_OOB_AUTO, which currently
> means that the chip->oob_poi buffer isn't initialised to all 0xFF.
> The nand_fill_oob() method then carries out the task of copying
> the provided OOB data to oob_poi, but with MTD_OOB_AUTO it skips
> areas marked as unavailable by the layout struct, including the
> bad block marker bytes.
> 
> An example of this causing issues is when the last OOB data read
> was from the start of a bad block where the markers are not 0xFF,
> and the caller wishes to write new OOB data at the beginning of
> another block. In this scenario the caller would provide OOB data,
> but nand_fill_oob() would skip the bad block marker bytes in
> oob_poi before copying the OOB data provided by the caller.
> This means that when the OOB data is written back to NAND,
> the block is inadvertently marked as bad without the caller knowing.
> This has been witnessed when using YAFFS2 where tags are stored
> in the OOB.
> 
> This patch changes the code so that oob_poi is always initialised
> to 0xFF to make sure no left over data is inadvertently written
> back to OOB data.
> 
> Signed-off-by: Adam Thomson <adam.thomson@alcatel-lucent.com>

Hi Adam,

thanks a lot for the patch. We definitely need to fix this issue. Could
we please have the following things done before we merge a fix for this.

1. We need to send this to the -stable tree, so this needs a

Cc: stable@kernel.org

You say this is broken since 2.6.31, are you 100% sure? Can you point
the specific commit which broke this? Or you just guess that this is
2.6.31?

This is important because we'd need to add

Cc: stable@kernel.org [2.6.31+] in that case.

But AFAICS, the breakage happened after commit

commit 7dcdcbef5d2b60d1db68fd2c07351f7afd8ad376
Author: David Woodhouse <dwmw2@infradead.org>
Date:   Sat Oct 21 17:09:53 2006 +0100

    [MTD] NAND: Combined oob buffer so it's contiguous with data

which was released in 2.6.20.



2. I think the right place fir this memset is 'nand_fill_oob()'. But in
this case the first memset from 'nand_do_write_oob()' has to be removed.



3. And finally, I think we should clean-up the following piece of code
   in 'nand_do_write_oob()':

        memset(chip->oob_poi, 0xff, mtd->oobsize);
        nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
        status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
        memset(chip->oob_poi, 0xff, mtd->oobsize);

This should not be part of your fix and should not go to stable. But I
think this should be a condition for your fix to be accepted.
Unfortunately, so few people love mtd and it is full of crap which
should be cleaned-up, and the only thing to do this is to force people
who want just a bug-fix to also do a bit of cleaning up. Sorry, nothing
personal.

Would you please be kind enough and look into this (if what I say makes
technical sense, of course)? I think the second memset should not exist
at all. And instead, all read side code has to memset the buffer for
itself.

Most probably the memset can just be removed, but I'm not 100% sure and
this needs a more careful look.

How does this sound to you?

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
