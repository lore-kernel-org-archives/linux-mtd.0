Received: from mail-yk0-x22b.google.com ([2607:f8b0:4002:c07::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB6Vz-0000go-5t
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 18:48:32 +0000
Received: by mail-yk0-f171.google.com with SMTP id 142so2183158ykq.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 10:48:09 -0800 (PST)
Date: Tue, 13 Jan 2015 10:48:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75% of
 correction strength
Message-ID: <20150113184805.GS9759@ld-irv-0074>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <54B51CCA.1090707@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54B51CCA.1090707@nod.at>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
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

On Tue, Jan 13, 2015 at 02:25:30PM +0100, Richard Weinberger wrote:
> Am 12.01.2015 um 21:51 schrieb Brian Norris:
> > The MTD API reports -EUCLEAN only if the maximum number of bitflips
> > found in any ECC block exceeds a certain threshold. This is done to
> > avoid excessive -EUCLEAN reports to MTD users, which may induce
> > additional scrubbing of data, even when the ECC algorithm in use is
> > perfectly capable of handling the bitflips.
> > 
> > This threshold can be controlled by user-space (via sysfs), to allow
> > users to determine what they are willing to tolerate in their
> > application. But it still helps to have sane defaults.
> > 
> > In recent discussion [1], it was pointed out that our default threshold
> > is equal to the correction strength. That means that we won't actually
> > report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
> > are almost too many to handle. It was determined that 3/4 of the
> > correction strength is probably a better default.
> > 
> > [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html
> 
> I like this change but I have one question.
> 
> UBI will treat a block as bad if it shows bitflips (EUCLEAN) right
> after erasure.

Can you elaborate? When "after erasure"? The closest I see is that UBI
will mark a block bad if it sees an -EIO failure from sync_erase() in
erase_worker(). If you have extra debug checks on, then
ubi_self_check_all_ff() could potentially give you bitflip problems
after the erase, but that's an odd corner case anyway, which many
drivers have been handling in hacked together ad-hoc ways anyway (search
for "bitflips in erase pages").

So I can't pinpoint what you're talking about, exactly.

> For SLC NAND this works very well.
> Does this also hold for MLC NAND? If one or two bit flips are okay
> even for a freshly erased MLC NAND this change could cause UBI to
> mark good blocks as bad depending on the ECC strength.

I would typically assume that MLC NAND users must be using significantly
stronger ECC (e.g., 12-bit / 512-byte, at least), so "one or two
bitflips" would still fall well under 75% of 12 bits.

Brian
