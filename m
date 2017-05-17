Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dB4H3-0002Hp-RK
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 19:06:19 +0000
Received: by mail-pf0-x244.google.com with SMTP id f27so2811835pfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 17 May 2017 12:05:57 -0700 (PDT)
Date: Wed, 17 May 2017 12:05:54 -0700
From: Eric Biggers <ebiggers3@gmail.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: fstests@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: Add UBIFS support to xfstests
Message-ID: <20170517190554.GC91213@gmail.com>
References: <20170517095531.11818-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170517095531.11818-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Wed, May 17, 2017 at 11:55:28AM +0200, David Oberhollenzer wrote:
> 
> Modifying the xfstests-bld patch to use nandsim (which simulates a NAND
> flash MTD device) instead of block2mtd has been considered, however the
> default size of 128MiB is slightly too small for generic/129.
> 
> Nandsim does not have an option to directly specify the size of the
> backing buffer but instead requires a set of NAND ID bytes that imply
> (among other things) the size of the chip (example, see 1). The ID bytes
> would have to be added to the kernel arguments for the UBIFS case. It
> might be desirable to document this somehow, for the next person who
> has to adjust the size, once a new test exhausts it. Also, it would be
> ultimately limted by available RAM and what can be encoded using the
> NAND ID bytes.
> 
> So right now, it looks like block2mtd is the simplest option for getting
> xfstests-bld to work with UBIFS.
>

It probably would be a good idea to document this decision somewhere more
permanent, maybe in a comment in
kvm-xfstests/test-appliance/files/root/fs/ubifs/config, which is where the
block2mtd devices get set up.

Or, it could be useful to add a documentation file for UBIFS in the xfstests-bld
documentation directory, which would also document any "gotchas" specific to how
UBIFS support is implemented in the test appliances, e.g the two issues I listed
in my patch description.  Also the fact that you need to configure your kernel
with UBIFS and block2mtd support.  Ideally we'd just fix these issues, though,
so there would be nothing special to document.  (We could at least solve the
kernel configuration issue by renaming the example configs in the
kernel-configs/ directory from "ext4-" to "xfstests-", then enabling support for
ubifs, f2fs, btrfs, etc.  in them.)

Eric
