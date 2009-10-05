Subject: Should flash hardware look like UBI?
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Mon, 05 Oct 2009 15:05:04 +0100
Message-Id: <1254751504.13096.725.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just posted http://www.advogato.org/person/dwmw2/diary/211.html which
laments the common view that future flash storage will just look like a
disk (SSD/eMMC/etc.). I don't think we want that, for the reasons given
there.

But I've also been thinking about exactly what we _do_ want. We
certainly want something a little more capable than the raw interface to
NAND flash that ONFI provides.

For a start, we want ECC to be built-in. We don't want to have to do
correction in software, and we want a 'copy page' command that's
actually useful -- we want it to apply ECC corrections rather than
copying any flipped bits faithfully. Although we probably do want the
_option_ to read the raw data still, without attempting to correct it.

We _also_ want the capability to do GC and block replacement for
ourselves, taking the opportunity to optimise the file system layout as
we do so. So we want to be _told_ about how many errors were fixed when
we read a block, and we also probably want to be told if we have to
recycle an eraseblock for other reasons (write disturb, etc.)

However, it's acceptable for the device to automatically move data for
us, if the OS lacks that capability or doesn't want to bother.

We don't _necessarily_ mind if the device hides bad blocks for us, and
if it maintains a logical<->physical mapping of eraseblocks. That kind
of thing has been done by hard drives for years, and it's simple enough
that they _ought_ to be able to get it right. Although the reliability
testing on Toshiba LBA-NAND shows that it's obviously possible to screw
it up too :)

It occurs to me that the interface that UBI presents to the higher
layers is actually a fairly close fit to what we want from hardware.

And where it _isn't_, there's something to be said for changing UBI to
match what we want. With notifications for 'block recycle needed', for
reading blocks without actually returning the data, just to check if the
ECC shows any bitflips, etc.)

Discuss.

-- 
dwmw2
