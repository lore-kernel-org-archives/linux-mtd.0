Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4TDD-000496-1T
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 05:10:37 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>,
	Snehaprabha Narnakaje <nsnehaprabha@ti.com>
Subject: Re: [PATCH 2/5] mtd: nand: Calculate better default ecc layout
Date: Wed, 13 May 2009 22:10:27 -0700
References: <>
	<1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905132210.27790.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 13 May 2009, Troy Kisky wrote:
> This saves lines of code by having nand_base
> calculate oob_free entries.
> 
> Boards that don't specify a layout

Not specifying a layout ... that's fair, won't affect
compatibility with anything now deployed.  A nice new
feature, impacting nothing in-tree.

Another case would be anything using ECC_HW_SYNDROME,
where the layout is fully specified by ecc.prepad,
ecc.postpad, ecc.bytes, and the badblock marker
location ... and if any other layout is specified,
it will be ignored.  You could print warnings, and
make the ecclayout reported through the ioctls be
the actual layout derived from prepad/postpad/etc;
that counts as a pure bugfix.


> and don't 
> use all ecc bytes in the current default layout
> could have their ecc position changed.

That seems dangerous.  It will break all existing
boards.  You *really* don't want that on your head,
since it won't just break them but will probably
end up trashing all the data stored on their NAND
chips ...


> Looking through the code, I can only see that
> Davinci is effected this way. It has its ecc
> bytes moved to the end of the oob data, which
> is why I want this patch. Before, it was wasting
> a lot of oob bytes.

Erm, it took the default of 6 bytes ECC every 512
bytes of data ... which is more than the hardware
needs, just 3 bytes ECC for that much data.  That's
hardly a "lot" (3 extra ecc bytes per 512 data),
especially now that new software like UBI isn't
even using the oobdata areas.

Or the new 4-bit ECC code, *currently* supporting
only small page chips ... needs 10 bytes ECC for
each 512 bytes data.  There is no wasted space for
those cases.

You should be coordinating changes to davinci_nand
with Sneha, by the way.


> Some boards will print warning messages. i.e.
> mxc_nand which specifies ecc.bytes = 3, but
> eccbytes = 5 (not a multiple of 3).

I think it's fair to print a warning if an ECC layout
is provided and it's got nonfatal issues like that.

Or even print errors (and fail!) if something really
wrong turns up ... like mxc_nand getting a large-page
chip, so it needs eccbytes = 12 but gets an explicit
and undersized layout as you describe above.  (You
can see there's a pagesize_2k field that's never set.
There are clear bugs in large page support for the
mxc_nand driver, even if you ignore 4k pages.)


> I may have missed other boards being affected
> so it needs through testing.
> 
> Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
