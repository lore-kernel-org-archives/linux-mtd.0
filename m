Date: Sat, 11 Jun 2011 11:22:24 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/3] ts72xx: use MTDPART_OFS_RETAIN for mtd partitioning
Message-ID: <20110611092224.GB16318@ibawizard.net>
References: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
	<1307369056-29319-3-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307369056-29319-3-git-send-email-dbaryshkov@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com,
	Mika Westerberg <mika.westerberg@iki.fi>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <ryan@bluewatersys.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> [2011-06-06 18:04:15]:

Hi,

> Instead of specifying a callback for dynamic partitioning, use
> MTDPART_OFS_RETAIN for reserving a place near the end of flash for
> RedBoot.

[...]

> -		.offset		= MTDPART_OFS_APPEND,
> -		.size		= 0,			/* filled in later */
> +		.offset		= MTDPART_OFS_RETAIN,
> +		.size		= TS72XX_REDBOOT_PART_SIZE,
> +				/* leave so much for last partition */

thank you for the mtd cleanup work. While testing this patch, I've noticed,
that the TS72XX_REDBOOT_PART_SIZE is by 16K bigger, then it should be:

Redboot:

	RedBoot> fis list
	Name              FLASH addr  Mem addr    Length      Entry point
	(reserved)        0x60000000  0x60000000  0x01D04000  0x00000000
	RedBoot           0x61D04000  0x61D04000  0x00040000  0x00000000
	vmlinux           0x61D44000  0x00218000  0x000C0000  0x00218000
	FIS directory     0x61FFC000  0x61FFC000  0x00003000  0x00000000
	RedBoot config    0x61FFF000  0x61FFF000  0x00001000  0x00000000

Linux:

	0x000000000000-0x000000004000 : "TS-BOOTROM"
	0x000000004000-0x000001d00000 : "Linux"
	0x000001d00000-0x000002000000 : "RedBoot"

So if I simply read now first 4 bytes from /dev/mtdblock2, there's no 'CRUS'
or 'SURC' boot HeaderID/signature and it means, that there's no valid Redboot
for ep93xx. The correct value is:

	#define TS72XX_REDBOOT_PART_SIZE	(SZ_2M + SZ_1M - SZ_16K)

And in the current state one could easily overwrite fis/fconfig while
upgrading the Redboot from the Linux userspace and brick the board, because
there's fis/fconfig stuff included in that Redboot partition.

I think, that it would be better to either make that Redboot partition
read-only by default, make it smaller so it wouldn't contain fconfig/fis parts
in it or add fis/fconfig partitions also. I don't know what's preffered way of
handling this, but since we're touching that part of the code, we should fix
it right.

Adding Mika to the Cc loop, since he has ts-7260.

-- ynezz
