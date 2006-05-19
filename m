From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148050786.3875.175.camel@pmac.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148000482.13399.42.camel@shinybook.infradead.org>
	<1148039632.3875.131.camel@pmac.infradead.org>
	<1148039931.3199.12.camel@sauron.oktetlabs.ru>
	<1148040679.3875.133.camel@pmac.infradead.org>
	<1148040871.3199.17.camel@sauron.oktetlabs.ru>
	<1148041866.3875.145.camel@pmac.infradead.org>
	<1148049289.3199.38.camel@sauron.oktetlabs.ru>
	<1148050786.3875.175.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 17:41:26 +0100
Message-Id: <1148056886.3875.211.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 15:59 +0100, David Woodhouse wrote:
> Do we have current figures on how much space the summary nodes
> actually take?

On the OLPC board -- 512MiB NAND in 4096 * 128KiB eraseblocks.

I have it about 22% full, with copies of /lib, /bin, /etc, /boot
and /usr/bin from a Fedora system -- along with a few nodes in /dev
because I was testing the new device node support.

795 eraseblocks have a summary.

The average size of the summary is 2458 bytes -- about ~1.8% of the
eraseblock size. The minimum was 616, maximum 24608 bytes.

The average size of the _names_ in the summary is 92 bytes, which is
~0.07% of the eraseblock size. Minimum 0, Maximum 3070.

Total space taken by summaries if all 4096 blocks of the file system
were contained summaries at these average sizes would be 9.6 MiB, of
which 370KiB or so would be names.

So we might not actually gain _much_ by removing the duplicate names --
they really aren't a significant contribution to the size of the summary
nodes. It isn't _hard_ to remove them though, and it may well make a lot
of sense not to read them even in the !SUMMARY case too.

If we can remove the 'offset' field from the summary entries and
compress the numbers either by an encoding such as the one I was talking
about and an inode table, or by just using a general-purpose compression
on the summary node before writing it, then I think we probably ought to
get the overhead down to 1% or so from the current 1.8% -- that's
probably worth doing.

Just using rubin compression on the summary nodes would save 35% (thus
they'd be 1.25% of total size) -- by reducing the average to 1708 bytes
per eraseblock.
 
-- 
dwmw2
