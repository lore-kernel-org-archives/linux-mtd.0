From: David Woodhouse <dwmw2@infradead.org>
To: Frantisek Rysanek <Frantisek.Rysanek@post.cz>
In-Reply-To: <41D2C8E3.26470.C13D47B@localhost>
References: <41D2C8E3.26470.C13D47B@localhost>
Content-Type: text/plain
Date: Wed, 05 Jan 2005 17:36:12 +0000
Message-Id: <1104946572.13016.323.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: several bugfixes/workarounds in mtd snapshot of 20041226 &&
	2.4.28
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-29 at 15:10 +0100, Frantisek Rysanek wrote:
> 1) if you flush the partition table and issue a BLKRRPART 
> (i.e., you re-partition the diskonchip), the reported device 
> size shrinks to one half of the original. If you do this again 
> before a reboot, the size shrinks again (now one quarter).
> Seems like the driver would re-init device size to a size denominated in 1k blocks,
> rather than sectors (512B).

Committed. Thanks.

> 2) in my DiskOnChip-only setup, CONFIG_MTD_MAP_BANK_WIDTH_1 
> is missing in the .config. I've added that straight to $LINUX/include/linux/map.h

I think that's a Config.in bug -- it shouldn't happen on 2.6.

> 3) two #includes seem to be missing in $MTD/nand/diskonchip.c

rslib.h was already there; I've added moduleparam.h which was not.

> 4) the Reed-Solomon library hooks are messed up in $LINUX/lib/Config.in

Committed; thanks.

-- 
dwmw2
