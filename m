From: David Woodhouse <dwmw2@infradead.org>
To: Alex Bennee <kernel-hacker@bennee.com>
In-Reply-To: <1094038230.29012.246.camel@cambridge.braddahead.com>
References: <1094038230.29012.246.camel@cambridge.braddahead.com>
Content-Type: text/plain
Message-Id: <1094041258.14552.29878.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 01 Sep 2004 13:20:59 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Handling non-uniform erase blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-09-01 at 12:30 +0100, Alex Bennee wrote:
> We are using Am29LV160D flash chips on our SH based board. The chip has
> a series on small blocks at the top or bottom of the address range for
> use in bootstrap code or configuration storage.

All chips have a 'major' erasesize -- the smaller blocks at one end of
the device can be grouped together into one or more blocks which are the
same size as the blocks on the rest of the device.

For the AM29LV160DB, the blocks are 1*16KiB, 2*8KiB, 1*32KiB and
31*64KiB. The 'major' erasesize is 64KiB, and the smaller blocks at the
beginning add up to that.

Although the MTD code does allow erasing the smaller blocks, it
currently requires that there be a 'major' erasesize for all partitions.
So if you had two partitions, one of 32KiB and the other including the
whole of the device, then it would assign a 'major' erasesize of 16KiB
to the former, and mark the latter read-only.

> When I set up my partitions I get this report:
> 
> Creating 4 MTD partitions on "India1 FLASH":
> 0x00000000-0x00010000 : "Boot Code"
> 0x00010000-0x001e0000 : "Kernel"
> 0x001e0000-0x001fc000 : "FPGA"
> mtd: partition "FPGA" doesn't end on an erase block -- force read-only
> 0x001fc000-0x00200000 : "Config"

AFAICT that's correct -- the FPGA partition doesn't actually map to a
range on the chip which can be erased individually, let alone with a
'major' erasesize which can be exported.

-- 
dwmw2
