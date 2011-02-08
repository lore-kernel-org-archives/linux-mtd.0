Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pmv8P-0006M1-K7
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 21:30:07 +0000
Date: Tue, 8 Feb 2011 22:31:01 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
Message-ID: <20110208223101.3566bc4d@wker>
In-Reply-To: <20110208153343.5bf352fc@wker>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<20110208153343.5bf352fc@wker>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Detlev Zundel <dzu@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
	Holger Brunck <holger.brunck@keymile.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Feb 2011 15:33:43 +0100
Anatolij Gustschin <agust@denx.de> wrote:

> On Sun,  6 Feb 2011 15:17:45 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> ...
> > here is a better patch for recovery fix. Comparing to the previous
> > patch-set now we make sure we keep write-buffer offset aligned to
> > @c->max_write_size (64 in case of CFI NOR) as much as possible.
> > 
> > Also, I've merged the "Add comments" patch with the patch which adds
> > the code.
> > 
> > You can find these patches also in the UBIFS git tree, 'cfi-nor-fix-v2'
> > branch:
> > git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v2
> > 
> > Please, test. These patches may break NAND setups as well, so anyone
> > who is interested in having stable UBIFS in the next release, please,
> > also test.
> 
> Here is a short summary of another issues we have seen while running
> further tests with this v2 patch series. Additionally there seem to be
> tree kinds of other corruptions UBIFS can't recover from.
> 
> 1.
> ...
> UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:161616 (100400 bytes left)
> UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning data node
> UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:165760 (96256 bytes left)
> UBIFS DBG (pid 1390): scan_padding_bytes: not a node
> UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:165760 (96256 bytes left)
> UBIFS DBG (pid 1390): scan_padding_bytes: not a node
> UBIFS error (pid 1390): ubifs_recover_leb: garbage
> UBIFS error (pid 1390): ubifs_scanned_corruption: corruption at LEB 113:165760
> UBIFS error (pid 1390): ubifs_scanned_corruption: first 8192 bytes from LEB 113:165760
> 00000000: ffff1006 fffff228 ffff0300 ffff0000 ffff0000 ffff0000 ffff0000 ffff0020  .......(.......................
> 00000020: 47830000 02010000 00100000 00020000 33b34142 43713233 61e24331 32334142  G...............3.ABCq23a.C123AB
> 00000040: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
> 00000060: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
> 00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
> .. all ffffffff follow
> 
> Looking at corrupted data I think that this is an interrupted buffered
> write. One flash chip in a bank seem to write faster than the other.
> The other chip (which is saving 16-bit data at offsets 0, 4, 8 ...)
> didn't finish the write operation at the point in time when the power
> cut occurred. Thus, the UBIFS common header node magic is corrupted
> and also the data in the data node.

Now I can confirm that this is an interrupted buffered write
operation. UBIFS submitted some buffers for writing, the CFI
flash driver tries to write efficiently and since we have _two_
flash chips interleaved, the CFI driver writes 128 bytes to the
data bus. That means, there were 32 buffer load operations
(4 bytes of data at each load) to the 32-bit data bus. So, 64 bytes
are stored in the internal write buffer on each flash chip and then
the 'write buffer confirm' command is issued. The internal programming
algorithm in this flash chip programs downwards, the chip starts
programming from higher addresses. But then the reset occurred,
so writing this 128 Byte area is not finished.

A simple test with the CFI driver writing a pattern beginning at the
sector start address confirms this:

 loading the write buffers
 writing write buffer confirm command
 waiting 50 us
 triggering a reset

This results in the partially programmed 128 byte area in the flash
sector, one chip programs a little bit faster then the other:

=> md f3B80000
f3b80000: ffffffff ffffffff ffffffff ffffffff    ................
f3b80010: ffffffff ffffffff ffffffff ffffffff    ................
f3b80020: ffffffff ffffffff ffffffff ffffffff    ................
f3b80030: ffffffff ffffffff ffffffff ffffffff    ................
f3b80040: ffff4372 ffff7373 ffff7333 ffff4143    ..Cr..ss..s3..AC
f3b80050: ffff3233 ffff4331 ffff4143 ffff3373    ..23..C1..AC..3s
f3b80060: 41424331 32334142 43313233 41424331    ABC123ABC123ABC1
f3b80070: 32334142 43313233 41424331 32334142    23ABC123ABC123AB
f3b80080: ffffffff ffffffff ffffffff ffffffff

...
> I'll continue to test with ubi->min_io_size == mtd->writebufsize patch
> which has been reverted due to incompatibility with old UBIFS images.
> It was more stable and I'll try to solve the remaining issues we have
> seen with it when running long power cut tests on some boards.
> These were:
> 
> 1.
> ...
> UBIFS DBG (pid 1400): no_more_nodes: unexpected data at 135:99840
> UBIFS error (pid 1400): ubifs_recover_leb: bad node
> UBIFS error (pid 1400): ubifs_scanned_corruption: corruption at LEB 135:95680
> UBIFS error (pid 1400): ubifs_scanned_corruption: first 8192 bytes from LEB 135:95680
> 00000000: 31181006 d8dbf804 70ec2700 00000000 30100000 01000000 7a000000 00000020  1.......p.'.....0.......z......
> 00000020: 00000000 00000000 00100000 00000000 41424331 30324142 43313233 41020331  ................ABC102ABC123A..1
> 00000040: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
> 00000060: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
> ...

This corruption is also most probably a result of an interrupted
buffered write.

What could be done to handle this kind of corruptions in UBIFS
recovery?
