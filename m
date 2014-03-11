Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHLT-0002aj-JD
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 07:43:28 +0000
Message-ID: <1394523766.6302.216.camel@sauron.fi.intel.com>
Subject: Re: [RFC PATCH] UBIFS: remove check for all(0xff) for empty pages
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Date: Tue, 11 Mar 2014 09:42:46 +0200
In-Reply-To: <1394518992-26969-1-git-send-email-pekon@ti.com>
References: <1394518992-26969-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kent Li <Kent.Li@radisys.com>, Brian Norris <computersforpeace@gmail.com>,
 HOUR Frderic <frederic.hour@safran-engineering.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-03-11 at 11:53 +0530, Pekon Gupta wrote:
> UBIFS throws following error if an blank page does not contain perfect all(0xff)
> data, during LEB scan, even though if number of bit-flips is within ecc.strength
> 	"UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 417:53168"
> 
> But newer technology devices (like MLC NAND) are prone to read-disturb bit-flips
> and so having perfect all(0xff) data on empty-pages is practically not feasible
> on these newer technology devices (like MLC NAND).
> Also, such device spec suggest using stronger ECC schemes (like BCH16), and have
> large OOB size to guarantee longer field life.
> 
> So this check of perfect all(0xff) data can be safely removed from UBIFS, as
> UBI and MTD layers already these before passing the data to UBIFS:
>  if (number-of-bitflips < mtd->bitflip_threshold)
>         Driver's ECC scheme is strong enough to handle existing bit-flips in
>         future, so both MTD and UBI ignore such bit-flips.
>  if (number-of-bitflips >= mtd->bitflip_threshold)
>         MTD flags -EUCLEAN.
>         UBI schedules the block for scrubbing.
>  if (number-of-bitflips > nand_chip->ecc.strength)
>         MTD flags -EBADMSG.
>         UBI tries to extract data relevant data from block based on sanity of
>         its headers, and then schedule it for re-erase.
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  fs/ubifs/scan.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
> index 58aa05d..b6ab396 100644
> --- a/fs/ubifs/scan.c
> +++ b/fs/ubifs/scan.c
> @@ -332,17 +332,6 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
>  
>  	ubifs_end_scan(c, sleb, lnum, offs);
>  
> -	for (; len > 4; offs += 4, buf = buf + 4, len -= 4)
> -		if (*(uint32_t *)buf != 0xffffffff)
> -			break;
> -	for (; len; offs++, buf++, len--)
> -		if (*(uint8_t *)buf != 0xff) {
> -			if (!quiet)
> -				ubifs_err("corrupt empty space at LEB %d:%d",
> -					  lnum, offs);
> -			goto corrupted;
> -		}

Let me try to explain why this code is present in UBIFS. When we
designed and implemented UBIFS we assumed that empty space cannot have
bit-flips. And NANDs that we had never exposed this kind of issues.

The other assumption that we were kept in mind is that we cannot trust
the media. The flash may contain any garbage, the contents may be
inconsistent, there may be any random corruptions anywhere.

This is why we have all these CRC32 checksums everywhere, and all this
"validate this and that, check the sanity" functions.

We explicitly did not want to try handling random corruptions. Simply
because this is dangerous. E.g., you have one node corrupted, and it
contains important data, and UBIFS just kills it - you have no chance to
recover your important data any more.

We thought that random corruptions handling belongs to user-space.
User-space tools can ask questions, have many options, preserve data in
a separate file, etc.

However, there is one type of corruptions we _did_ want to gracefully
handle - corruptions caused by power cuts.

So in the kernel space we tried to be very very careful in
distinguishing between power cut corruptions and random corruptions.

Now, power cut corruptions have the following properties:

1. Can only happen in journal LEBs.
2. Happen only in one single write unit (max_write_size), because UBIFS
always writes one write unit (or less) at a time.
3. The next write unit (the one coming after the corrupted write unit)
should be empty, never written to. Just because we write unit after unit
sequentially.

And UBIFS simply checks if these conditions hold. If they are, UBIFS
assumes this is a power cut corruption, and simply wipes all the
corrupted nodes out. The corrupted nodes will all sit in the corrupted
write unit, and/or in nodes that _end_ in the corrupted write unit.

And what UBIFS recovery procedure does - it simply moves all the good
nodes from the original PEB to a different PEB, re-maps the LEB to the
new PEB, and erases the older PEB. And it clears up all the corrupted
garbage this way, so we end up with a partially-filled LEB. And we even
keep adding more data there afterwards.

Now what you do, you just remove the check for condition #3. Not good, I
think...

Removing these check means that if there is corruption in the middle of
a journal LEB, and this corruption is _not_ caused by a power cut, UBIFS
will kill all the nodes in the corrupted write unit and all the good
nodes after the corrupted write unit (I did not verify if this is true,
relying on my memory here).

Instead, what is needed is a way to distinguish between "empty" space
and "written-to space".

For some HW the driver could tell by looking at the OOB.

Or we could simply verify against 0xFFs but allow for a number of 0
bits, which depends on the HW ECC strength.

Or may be try the former, and if it is not supported by the driver,
fall-back to the latter.

But I do not think that just removing the checks is a good idea. They
really help to keep us sane. And they helped already to expose the
shortcomings of the design.

HTH.

-- 
Best Regards,
Artem Bityutskiy
