Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTYE0-0007OH-T7
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 09:35:05 +0000
Date: Wed, 22 Jul 2009 10:34:55 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: UBI FS mounting time
Message-ID: <20090722093455.GD13613@shareable.org>
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
	<4A66B547.6020207@nokia.com>
	<71cd59b00907220012pe8200e6od143f2561501bd0f@mail.gmail.com>
	<4A66C209.7060305@nokia.com>
	<71cd59b00907220057s6dbbdcb0vc23526836939aa97@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71cd59b00907220057s6dbbdcb0vc23526836939aa97@mail.gmail.com>
Cc: Brijesh Singh <brij.singh@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Bosi Daniele <Daniele.Bosi@mta.it>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Corentin Chary wrote:
> Do you think it would be better to fix the position of the anchor
> (first 2 good peb, ideally 0 and 1), or try to get a "good" position
> using ec and pnum ?
> 
> With a fixed position at the beginning, the scan process would be easier,
> because there is no need to reset if we find the anchor after normal blocks.
> But is does not sound very "wear leveling".

You can get wear levelling of anchor blocks by using indirect anchor
blocks, where a fixed 2 blocks points to a small set of "potential"
blocks to scan at mount time - a sort of tiny journal, small enough to
scan quickly.  The bulk of data needing for mounting is stored in
those journal blocks, and the true anchor blocks in pebs 0+1 point to
the range to be scanned.

Each mount/umount cycle, one of the scanned blocks will be updated,
except every so often the true anchor blocks in pebs 0+1 will be
updated to use a new range.

That's a two-level tree.  If you make a sufficiently deep multi-level
tree using the same idea - initial small set of indirect blocks (peb
0+1 in this example) pointing to small sets of of indirect blocks
... pointing to small sets of map blocks, then you can wear level the
whole flash evenly for any number of mount/umount cycles, and still
find the mount data quickly for any flash size.

(In fact you can run a whole filesystem like that, but that's another
topic).

For additional robustness against possible clustering of bad blocks,
make the initial small set be a sparse set of pebs over the flash
address space, instead of pebs 0+1.  I'd go for maximum address line
diversity.

-- Jamie
