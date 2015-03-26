Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb8dI-0006zh-7z
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 14:19:41 +0000
Date: Thu, 26 Mar 2015 15:19:16 +0100
From: David Sterba <dsterba@suse.cz>
To: hujianyang <hujianyang@huawei.com>
Subject: Re: UBIFS: Is it possible to get the compressed size of a file?
Message-ID: <20150326141916.GO20767@suse.cz>
Reply-To: dsterba@suse.cz
References: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
 <,> <54912109.50505@huawei.com>
 <trinity-03861656-4f4e-47fd-bcc5-aa493202c0bd-1418900934280@3capp-1and1-bs05>
 <1422869610.8637.352.camel@sauron.fi.intel.com>
 <7B8DF06B-EBC8-4C85-AEEA-C2C6A52B8789@dilger.ca>
 <54F16EC2.3070703@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54F16EC2.3070703@huawei.com>
Cc: Andreas Dilger <adilger@dilger.ca>,
 Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 "markus.heininger@online.de" <markus.heininger@online.de>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 28, 2015 at 03:31:14PM +0800, hujianyang wrote:
> > http://lwn.net/Articles/607552/
> > http://thread.gmane.org/gmane.comp.file-systems.btrfs/37312
> > 
> > I'm not sure what happened to that patch series - I was looking forward
> > to it landing, and it was in very good shape I think.

> Since the *fe_phys_length* of fiemap_extent is not import to mainline,
> current fiemap can only report logical data length of an extent. Regret
> to say, it's no use for getting the compressed size of a file in UBIFS.

Yeah, not the best example how a patchset should be pushed. I'll try to
get back soon to it given the almost-ready state and another potential
user of the interface.

> So could we use a simply method? just a private ioctl which scan the tnc tree
> and report the compressed size of a UBIFS file? I found an old patch for Btrfs,
> but it is not import to mainline.
> 
> https://patchwork.kernel.org/patch/117782/

This was at the beginning of the fiemap extensions. I've picked that
patch, updated and sent

http://www.mail-archive.com/linux-btrfs%40vger.kernel.org/msg14371.html

but it was not merged. We've discussed that and came to conclusion that
a special ioctl was not the right approach when we could extend the
existing interfaces. The ioctl was iterating over all extents and just
summing some numbers, effectively repeating the core code of fiemap.

Though you're (relatively) free to introduce private ioctls for your
filesystem, I'd rather not recommend that. Once an ioctl is introduced,
you have to support it forever, the deprecation periods span several
years.

> Further, for both fiemap or this private ioctl method, current tnc tree lookup
> mechanism seems always copying the whole ubifs node, but only the header of a
> node is used in this case. Do we have a way to only read part of a node from
> tnc tree?

I don't understand the details, but this seems that even the private
ioctl would help too much even if you'd be more free to do some
performance optimizations that would not fit fiemap.
