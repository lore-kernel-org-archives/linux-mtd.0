Date: Thu, 30 Apr 2015 12:36:59 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: Introduce CONFIG_MTD_RESERVE_END
Message-ID: <20150430173659.GA30177@bshelton-desktop>
References: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
 <20150429214648.GF32500@ld-irv-0074>
MIME-Version: 1.0
In-Reply-To: <20150429214648.GF32500@ld-irv-0074>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 04/29, Brian Norris wrote:
> > +	  This can be useful if, for example, the BBT is stored at the end
> > +	  of the flash, and you don't want those blocks counted as part of
> > +	  the last MTD partition.
> 
> And why is that a problem? We don't add Kconfig options just because you
> "don't want" something.

It's not a "problem" per se, but it does cause the calculated/displayed number
of bad PEBs to be greater than it actually is.  In older kernel versions, this
used to cause a warning on mount that it could not reserve enough PEBs, but
this no longer occurs.

Without the patch and config setting:

UBI: attached mtd3 (name "root", size 942 MiB) to ubi1
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
UBI: VID header offset: 512 (aligned 512), data offset: 2048
UBI: good PEBs: 7539, bad PEBs: 4, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 549/79, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 4, total reserved PEBs: 7535, PEBs reserved for bad PEB handling: 156

With the patch and config setting:

UBI: attached mtd3 (name "root", size 942 MiB) to ubi1
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
UBI: VID header offset: 512 (aligned 512), data offset: 2048
UBI: good PEBs: 7539, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 549/79, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 0, total reserved PEBs: 7539, PEBs reserved for bad PEB handling: 160

The reason for doing this as a Kconfig option rather than with an additional
partition is that we use the same .itb boot image (and kernel arguments) for
a series of embedded controllers that have different NAND flash sizes, and we
use the '-' command line parameter to give the root partition all the available
space after the other partitions.

Thanks,
Ben
