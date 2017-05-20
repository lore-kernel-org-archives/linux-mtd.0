Date: Sat, 20 May 2017 21:36:54 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>, Richard Weinberger
 <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Artem
 Bityutskiy <dedekind1@gmail.com>, LEDE Development List
 <lede-dev@lists.infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>, openwrt-devel@lists.openwrt.org
Subject: Re: [OpenWrt-Devel] [RFC] Pre-seeded files/directories for UBIFS
Message-ID: <20170520213654.6b6d18eb@gmail.com>
In-Reply-To: <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
References: <8f4afb8e-7e98-d59f-abb6-64190ed717f5@nod.at>
 <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 20 May 2017 11:39:33 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Hello,
> 
> On 05/20/2017 09:12 AM, Richard Weinberger wrote:
> > Hi!
> > 
> > These days I had an interesting discussion with Christoph about
> > overlayfs and its burden. The main use-case of overlayfs in
> > combination with UBIFS is having a squashfs as lower and UBIFS as
> > upper directory. Such that all changes to the read-only squashfs go
> > into UBIFS. Upon a factory reset all files within the UBIFS will be
> > removed  and the merged directory is clean again. Christoph argued
> > that such a functionality  could be achieved without overlayfs if
> > the filesystem supported something like pre-seeded  files or
> > directories. This would lower memory pressure and complexity.  
> 
> As you may know, OpenWrt/LEDE have been using this scheme for many
> years now (before it was named overlayfs, this was called mini fanout
> overlay ~10 yrs ago) with squashfs + jffs2 before on P-NOR flashes.
> There are still devices like those that benefit from
> squashfs(ro)+jffs2(rw), so while bringing a similar functionality
> using UBIFS exclusively would be interesting, it would still make
> Linux distribution want to support a more generic scheme which is
> using overlayfs as well.
> 

There is also the size consideration. Unless a seeded ubifs can get
close to squashfs in terms of compression there would still be a
use-case for squashfs with an ubifs overlay. My current root as ubifs
instead of squashfs is 76.8% bigger.

> > 
> > Today I had a thought about this and I'm pretty sure we can
> > implement this in UBIFS with not too much effort. The basic idea is
> > marking files or whole directories as seed upon mkfs.ubifs time.
> > If these files will be changed at run-time, the original contents
> > will stay on the medium and at any time these files can be reverted
> > back to their seed state. This includes file contents, attributes
> > and extended attributes. I can think of an UBIFS specific IOCTL to
> > put files into seed state and to revert them again.
> > 
> > Since UBIFS is already a pure copy-on-write filesystem, all we have
> > to do is teaching the index tree about seeds. We could add a flag
> > to the UBIFS key which indicates that the node behind this key is
> > seeded. i.e. file "foo" is seeded and the corresponding inode
> > number is 0x1234, then every key of every UBIFS node that belongs
> > to that file will wear the new flag UBIFS_SEED_KEY.
> > ubifs_ino_node: 0x1234 | UBIFS_INO_KEY | UBIFS_SEED_KEY
> > ubifs_data_node: 0x1234 | <BLOCK_NO> | UBIFS_DATA_KEY |
> > UBIFS_SEED_KEY
> > 
> > The inode itself will have a flag which denotes whether this file
> > is seeded and whether some modifications have happened. This will
> > allow us to lookup directly in the index tree with UBIFS_SEED_KEY
> > set or no. Otherwise we'd have to do two lookups every time.
> > 
> > If a seeded node faces a modification it will stay referenced in
> > the index tree and a copy without UBIFS_SEED_KEY is made. Upon next
> > lookup the new node will be used automatically. Reverting to the
> > original state means purging all nodes that don't have the
> > UBIFS_SEED_KEY flag.
> > 
> > There are corner cases to consider, mostly for lookup of data nodes.
> > Currently a missing data node denotes a hole in a file.
> > With seeded files a missing data node can also mean that we need to
> > fall back to a UBIFS_SEED_KEY lookup.
> > 
> > Storing UBIFS_SEED_KEY itself into the UBIFS key is also not
> > trivial since almost all bits of the 32bit tuple are in use. But
> > I'm sure we find some way to encode it.
> > 
> > Another thing to consider are seeded directory entries. This
> > requires us to implement our own whiteout mechanism. But this could
> > also be re-used for overlayfs whiteouts.
> > 
> > That said, I consider this feature as doable but not trivial.
> > Artem, Adrian, you designed UBIFS, what do you think?
> > Maybe I missed some major show-stopper. :)
> > 
> > Thanks,
> > //richard
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >   
> 
