Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YA0n9-0000cV-Ph
 for linux-mtd@lists.infradead.org; Sat, 10 Jan 2015 18:29:44 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so24598996pab.0
 for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2015 10:29:22 -0800 (PST)
Date: Sat, 10 Jan 2015 10:29:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] mtd: spi-nor: don't return found by JEDEC ID a non-JEDEC
 flash
Message-ID: <20150110182910.GA3268@brian-ubuntu>
References: <1418511647-24736-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20150109222310.GY9759@ld-irv-0074> <54B13D13.6020406@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54B13D13.6020406@mentor.com>
Cc: Huang Shijie <shijie.huang@intel.com>, dwmw2@infradead.org,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 10, 2015 at 04:54:11PM +0200, Vladimir Zapolskiy wrote:
> On 10.01.2015 00:28, Brian Norris wrote:
> > On Sun, Dec 14, 2014 at 01:00:47AM +0200, Vladimir Zapolskiy wrote:
> >> In attempt to spi_nor_scan() for an expected JEDEC compliant device by
> >> reading RDID register don't return the first found non-JEDEC device
> >> entry from spi_nor_ids[] table, if RDID is zero.
> >>
> >> First of all zeroes in RDID may be evidence for not correctly working
> >> SPI, secondly empty RDID can not be used to select a particular JEDEC
> >> non-compliant device correctly.
> >>
> >> The best possible solution is
> >> * not to rely on spi_nor_read_id(), if expected device is non-JEDEC,
> >> * not to substitute an expected JEDEC device with some arbitrary
> >>   chosen non-JEDEC device, if RDID is zero.
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> > 
> > This patch doesn't apply to the latest tree. I think this commit
> > probably already fixes your issue:
> > 
> >   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=09ffafb6977dc930770af2910edc3b469651131d
> > 
> >   commit 09ffafb6977dc930770af2910edc3b469651131d
> >   Author: Huang Shijie <shijie.huang@intel.com>
> >   Date:   Thu Nov 6 07:34:01 2014 +0100
> > 
> >       mtd: spi-nor: add id/id_len for flash_info{}
> 
> thank you for review.
> 
> 09ffafb69 fixes my problem (and more), however regarding to my problem
> it does it in non-optimal way. If read JDID is zero, then there is no
> need to iterate over spi_nor_ids array to return ERR_PTR(-ENODEV).

I'm not too worried about spinning a few extra cycles here. What makes
this particular special case different than a system where we don't
support the flash? We'll still likely have to scan through the whole
array just to end up witih -ENODEV.

> Assuming that zero JEDEC ID is a relatively rare situation, do you think
> it makes sense to add a preceding check for such case before entering
> the loop like it is done in my patch?

As long as the current driver actually fails gracefully on a zero ID, I
think we're OK without special case conditions.

> If no, I'm fine, if yes, I'll rebase the change.

Thanks,
Brian
