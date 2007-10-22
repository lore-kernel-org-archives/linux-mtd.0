Subject: Re: FTLs for NANDSim
From: David Woodhouse <dwmw2@infradead.org>
To: Sun Devil <sundevil007@gmail.com>
In-Reply-To: <7ee965bc0710200922n2159c5dav4357d1cdce5521e8@mail.gmail.com>
References: <7ee965bc0710200922n2159c5dav4357d1cdce5521e8@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Oct 2007 10:33:08 +0100
Message-Id: <1193045588.2672.15.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-10-20 at 09:22 -0700, Sun Devil wrote:
> 1. Can we write an user level FTL and interface with NANDSim, so that,
> for the application, simulated flash appears to be a physical device,
> and I can format the same volume in what ever way possible?

Yes, I suppose you could. You could access the 'flash' through
the /dev/mtd0 character device, then provide a block device to the
kernel by using something like nbd. It's probably better to do it in the
kernel though.

> 2. Do you have any implementations of FTL at Kernel level?

Yes. We have the simplistic 'mtdblock' which doesn't really do any
translation at all, we have 'FTL' which works only on NOR flash, and we
have 'NFTL' and 'INFTL' for use on DiskOnChip devices. There is a helper
layer which is designed to make it relatively easy for you to provide
your own translation layer, without having to get too deeply involved in
how Linux block device drivers work.

> 3. Are there any NAND Flash simulators that you know of apart from NANDSim?

Well, there's a OneNAND sim too. And it's not that hard to use real NAND
flash either -- see Jörn's new 'Alauda' driver for certain USB devices.

-- 
dwmw2
