Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8a5T-0006uo-1C
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 16:33:07 +0000
Date: Fri, 16 Mar 2012 17:31:11 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 2/3] MTD: bitflip_threshold added to mtd_info and sysfs
Message-ID: <20120316163111.GE10228@parrot.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <1331832353-15569-3-git-send-email-mikedunn@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1331832353-15569-3-git-send-email-mikedunn@newsguy.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 15, 2012 at 05:25:52PM +0000, Mike Dunn wrote:
> +
> +What:		/sys/class/mtd/mtdX/bitflip_threshold
> +Date:		March 2012
> +KernelVersion:	3.3.1
> +Contact:	linux-mtd@lists.infradead.org
> +Description:
> +		This allows the user to examine and adjust the criteria by which
> +		mtd returns -EUCLEAN from mtd_read() and mtd_read_oob().  If the
> +		maximum number of bit errors that were corrected on any single
> +		writesize region (as reported by the driver) equals or exceeds
> +		this value, -EUCLEAN is returned.  Otherwise, absent an error, 0
> +		is returned.  Higher layers (e.g., UBI) use this return code as
> +		an indication that an erase block may be degrading and should be
> +		scrutinized as a candidate for being marked as bad.
> +
> +		The initial value may be specified by the flash device driver.
> +		If not, then the default value is ecc_strength.  Users who wish
> +		to be more paranoid about data integrity can lower the value.
> +		If the value exceeds ecc_strength, -EUCLEAN is never returned by
> +		the read functions.

Hmmm. I don't think it's a good idea to say "Users who wish to be more paranoid
about data integrity can lower the value"; because this is not exactly true.

Lowering the value is very dangerous, and can have devastating effects: on NAND
devices where sticky bitflips appear (we have plenty of those devices), a low
threshold (say 1) triggers block torture by UBI, then bad block retirement,
quickly reducing the number of valid blocks; the other "sane" blocks
with intermittent bitflips keep being scrubbed, thrashing the whole device.
Even worse: if enough bad blocks appear, UBI runs out of replacement blocks
and stops working.

IMHO the value of 'bitflip_threshold' should be carefully chosen:

- low enough to ensure ecc correction has a safety margin and manufacturer
  requirements are met
- high enough to avoid the effects described above

In some cases, controlling bitflip_threshold can be interesting for other
reasons; for instance, on a specific board, I have used a NAND device
requiring 4-bit ecc, but I implemented 8-bit protection through hardware BCH for
extra safety (and future 8-bit NAND upgrades).
In that particular setup, I would set bitflip_threshold to 3 or 4 instead of the
value derived from the ecc strength (8).

So in practice, setting bitflip_threshold is tricky and requires a good
knowledge of the NAND (or Doc/whatever) device your are using, and of how mtd/UBI
will use the threshold.
I suggest we warn about the dangers and discourage people from messing with this
knob unless they know what they are doing.

BR,
-- 
Ivan
